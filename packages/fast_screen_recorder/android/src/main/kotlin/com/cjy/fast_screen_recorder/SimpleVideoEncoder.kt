package com.cjy.fast_screen_recorder

import android.graphics.Bitmap
import android.media.*
import android.media.MediaCodecList.REGULAR_CODECS
import android.util.Log
import android.view.Surface
import androidx.annotation.RawRes
import java.io.File
import java.io.IOException
import java.nio.ByteBuffer

private const val TAG = "FrameBuilder"
private const val VERBOSE = true
private const val TIMEOUT_USEC = 10000

/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/FrameBuilder.kt
 */
class SimpleVideoEncoder(
    private val muxerConfig: MuxerConfig,
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

    private val bufferInfo = MediaCodec.BufferInfo()
    private val frameMuxer = muxerConfig.frameMuxer

    private var surface: Surface? = null

    fun start() {
        Log.d(TAG, "start() begin")

        mediaCodec.configure(mediaFormat, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
        surface = mediaCodec.createInputSurface()
        mediaCodec.start()
        drainCodec(false)

        Log.d(TAG, "start() end")
    }

    fun encode(image: Bitmap) {
        if (VERBOSE) Log.d(TAG, "encode() begin")

        // NOTE do not use `lockCanvas` like what is done in bitmap2video
        // This is because https://developer.android.com/reference/android/media/MediaCodec#createInputSurface()
        // says that, "Surface.lockCanvas(android.graphics.Rect) may fail or produce unexpected results."
        val canvas = surface?.lockHardwareCanvas()
        canvas?.drawBitmap(image, 0f, 0f, null)
        surface?.unlockCanvasAndPost(canvas)
        drainCodec(false)

        if (VERBOSE) Log.d(TAG, "encode() end")
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
        if (VERBOSE) Log.d(TAG, "drainCodec start endOfStream=$endOfStream")

        if (endOfStream) {
            mediaCodec.signalEndOfInputStream()
        }

        // TODO do not use this deprecated API?
        val encoderOutputBuffers: Array<ByteBuffer?> = mediaCodec.getOutputBuffers()
        while (true) {
            val encoderStatus = mediaCodec.dequeueOutputBuffer(bufferInfo, TIMEOUT_USEC.toLong())
            if (VERBOSE) Log.d(TAG, "drainCodec get encoderStatus=$encoderStatus")

            if (encoderStatus == MediaCodec.INFO_TRY_AGAIN_LATER) {
                // no output available yet
                if (!endOfStream) {
                    break // out of while
                } else {
                    if (VERBOSE) Log.d(TAG, "drainCodec no output available, spinning to await EOS")
                }
                // NOTE no need to worry about this, since deprecated after API 21
                // } else if (encoderStatus == MediaCodec.INFO_OUTPUT_BUFFERS_CHANGED) {
                //     // not expected for an encoder
                //     encoderOutputBuffers = mediaCodec.getOutputBuffers()
            } else if (encoderStatus == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                // should happen before receiving buffers, and should only happen once
                if (frameMuxer.isStarted()) {
                    throw RuntimeException("format changed twice")
                }
                val newFormat: MediaFormat = mediaCodec.outputFormat
                Log.d(TAG, "drainCodec encoder output format changed: $newFormat")

                // now that we have the Magic Goodies, start the muxer
                frameMuxer.start(newFormat)
            } else if (encoderStatus < 0) {
                Log.wtf(TAG, "drainCodec unexpected encoderStatus=$encoderStatus")
                // let's ignore it
            } else {
                val encodedData = encoderOutputBuffers[encoderStatus]
                    ?: throw RuntimeException("encoderOutputBuffer  $encoderStatus was null")
                if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG != 0) {
                    // The codec config data was pulled out and fed to the muxer when we got
                    // the INFO_OUTPUT_FORMAT_CHANGED status.  Ignore it.
                    if (VERBOSE) Log.d(TAG, "drainCodec ignoring BUFFER_FLAG_CODEC_CONFIG")
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
                        Log.w(TAG, "drainCodec reached end of stream unexpectedly")
                    } else {
                        if (VERBOSE) Log.d(TAG, "drainCodec end of stream reached")
                    }
                    break // out of while
                }
            }
        }

        if (VERBOSE) Log.d(TAG, "drainCodec end")
    }

    /**
     * Releases encoder resources.  May be called after partial / failed initialization.
     */
    fun releaseVideoCodec() {
        Log.d(TAG, "releaseVideoCodec() begin")

        drainCodec(true)
        mediaCodec.stop()
        mediaCodec.release()
        surface?.release()

        Log.d(TAG, "releaseVideoCodec() end")
    }

    fun releaseMuxer() {
        // Release MediaMuxer
        frameMuxer.release()
    }
}

data class MuxerConfig(
    val file: File,
    val videoWidth: Int,
    val videoHeight: Int,
    val mimeType: String = MediaFormat.MIMETYPE_VIDEO_AVC,
    val frameRate: Float,
    val bitrate: Int,
    val iFrameInterval: Int,
    val frameMuxer: SimpleFrameMuxer = SimpleMp4FrameMuxer(file.absolutePath, frameRate),
)
