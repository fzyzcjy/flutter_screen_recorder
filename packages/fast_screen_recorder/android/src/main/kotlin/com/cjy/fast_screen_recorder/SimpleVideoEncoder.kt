package com.cjy.fast_screen_recorder

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Rect
import android.media.*
import android.media.MediaCodecList.REGULAR_CODECS
import android.os.Build
import android.util.Log
import android.view.Surface
import androidx.annotation.RawRes
import java.io.File
import java.io.IOException
import java.nio.ByteBuffer

const val TAG = "FrameBuilder"
const val VERBOSE: Boolean = false
const val SECOND_IN_USEC = 1000000
const val TIMEOUT_USEC = 10000

/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/FrameBuilder.kt
 */
class SimpleVideoEncoder(
    private val context: Context,
    private val muxerConfig: MuxerConfig,
    @RawRes private val audioTrackResource: Int?
) {
    private val mediaFormat: MediaFormat = run {
        val format = MediaFormat.createVideoFormat(
            muxerConfig.mimeType,
            muxerConfig.videoWidth,
            muxerConfig.videoHeight
        )

        // Set some properties.  Failing to specify some of these can cause the MediaCodec
        // configure() call to throw an unhelpful exception.
        format.setInteger(
            MediaFormat.KEY_COLOR_FORMAT,
            MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface
        )
        format.setInteger(MediaFormat.KEY_BIT_RATE, muxerConfig.bitrate)
        format.setFloat(MediaFormat.KEY_FRAME_RATE, muxerConfig.frameRate)
        format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, muxerConfig.iFrameInterval)
        format
    }

    private val mediaCodec: MediaCodec = run {
        val codecs = MediaCodecList(REGULAR_CODECS)
        MediaCodec.createByCodecName(codecs.findEncoderForFormat(mediaFormat))
    }

    private val bufferInfo: MediaCodec.BufferInfo = MediaCodec.BufferInfo()
    private val frameMuxer: SimpleFrameMuxer = muxerConfig.frameMuxer

    private var surface: Surface? = null

    fun start() {
        mediaCodec.configure(mediaFormat, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
        surface = mediaCodec.createInputSurface()
        mediaCodec.start()
        drainCodec(false)
    }

    fun createFrame(image: Bitmap) {
        val canvas = createCanvas()
        drawBitmapAndPostCanvas(image, canvas)
    }

    private fun createCanvas(): Canvas? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            surface?.lockHardwareCanvas()
        } else {
            surface?.lockCanvas(inOutDirty = null)
        }
    }

    /**
     *
     * @param canvas acquired from createCanvas()
     */
    private fun drawBitmapAndPostCanvas(bitmap: Bitmap, canvas: Canvas?) {
        canvas?.drawBitmap(bitmap, 0f, 0f, null)
        postCanvasFrame(canvas)
    }

    /**
     *
     * @param canvas acquired from createCanvas()
     */
    private fun postCanvasFrame(canvas: Canvas?) {
        surface?.unlockCanvasAndPost(canvas)
        drainCodec(false)
    }

    /**
     * Extracts all pending data from the encoder.
     *
     *
     * If endOfStream is not set, this returns when there is no more data to drain.  If it
     * is set, we send EOS to the encoder, and then iterate until we see EOS on the output.
     * Calling this with endOfStream set should be done once, right before stopping the muxer.
     *
     * Borrows heavily from https://bigflake.com/mediacodec/EncodeAndMuxTest.java.txt
     */
    private fun drainCodec(endOfStream: Boolean) {
        if (VERBOSE) Log.d(TAG, "drainCodec($endOfStream)")
        if (endOfStream) {
            if (VERBOSE) Log.d(TAG, "sending EOS to encoder")
            mediaCodec.signalEndOfInputStream()
        }
        var encoderOutputBuffers: Array<ByteBuffer?>? = mediaCodec.getOutputBuffers()
        while (true) {
            val encoderStatus: Int = mediaCodec.dequeueOutputBuffer(
                bufferInfo, TIMEOUT_USEC
                    .toLong()
            )
            if (encoderStatus == MediaCodec.INFO_TRY_AGAIN_LATER) {
                // no output available yet
                if (!endOfStream) {
                    break // out of while
                } else {
                    if (VERBOSE) Log.d(TAG, "no output available, spinning to await EOS")
                }
            } else if (encoderStatus == MediaCodec.INFO_OUTPUT_BUFFERS_CHANGED) {
                // not expected for an encoder
                encoderOutputBuffers = mediaCodec.getOutputBuffers()
            } else if (encoderStatus == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                // should happen before receiving buffers, and should only happen once
                if (frameMuxer.isStarted()) {
                    throw RuntimeException("format changed twice")
                }
                val newFormat: MediaFormat = mediaCodec.outputFormat
                Log.d(TAG, "encoder output format changed: $newFormat")

                // now that we have the Magic Goodies, start the muxer
                frameMuxer.start(newFormat, audioExtractor)
            } else if (encoderStatus < 0) {
                Log.wtf(TAG, "unexpected result from encoder.dequeueOutputBuffer: $encoderStatus")
                // let's ignore it
            } else {
                val encodedData = encoderOutputBuffers?.get(encoderStatus)
                    ?: throw RuntimeException("encoderOutputBuffer  $encoderStatus was null")
                if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG != 0) {
                    // The codec config data was pulled out and fed to the muxer when we got
                    // the INFO_OUTPUT_FORMAT_CHANGED status.  Ignore it.
                    if (VERBOSE) Log.d(TAG, "ignoring BUFFER_FLAG_CODEC_CONFIG")
                    bufferInfo.size = 0
                }
                if (bufferInfo.size != 0) {
                    if (!frameMuxer.isStarted()) {
                        throw RuntimeException("muxer hasn't started")
                    }
                    frameMuxer.muxVideoFrame(encodedData, bufferInfo)
                    if (VERBOSE) Log.d(TAG, "sent " + bufferInfo.size + " bytes to muxer")
                }
                mediaCodec.releaseOutputBuffer(encoderStatus, false)
                if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) {
                    if (!endOfStream) {
                        Log.w(TAG, "reached end of stream unexpectedly")
                    } else {
                        if (VERBOSE) Log.d(TAG, "end of stream reached")
                    }
                    break // out of while
                }
            }
        }
    }

    /**
     * Releases encoder resources.  May be called after partial / failed initialization.
     */
    fun releaseVideoCodec() {
        // Release the video layer
        if (VERBOSE) Log.d(TAG, "releasing encoder objects")
        drainCodec(true)
        mediaCodec.stop()
        mediaCodec.release()
        surface?.release()
    }

    fun releaseMuxer() {
        // Release MediaMuxer
        frameMuxer.release()
    }

}

data class MuxerConfig(
    var file: File,
    var videoWidth: Int = 320,
    var videoHeight: Int = 240,
    var mimeType: String = MediaFormat.MIMETYPE_VIDEO_AVC,
    var frameRate: Float = 10F,
    var bitrate: Int = 1500000,
    var frameMuxer: SimpleFrameMuxer = SimpleMp4FrameMuxer(file.absolutePath, frameRate),
    var iFrameInterval: Int = 10
)