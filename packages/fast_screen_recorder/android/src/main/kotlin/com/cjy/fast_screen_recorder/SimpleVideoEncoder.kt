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
import java.time.Instant

private const val TAG = "SimpleVideoEncoder"
private const val VERBOSE = true
private const val TIMEOUT_USEC = 10000

/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/FrameBuilder.kt
 */
class SimpleVideoEncoder(
    private val muxerConfig: MuxerConfig,
) {
    private val mediaFormat: MediaFormat = run {
        Log.i(TAG, "mediaFormat creation begin")

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

        Log.i(TAG, "mediaFormat creation end format=$format")

        format
    }

    private val mediaCodec: MediaCodec = run {
        Log.i(TAG, "mediaCodec creation begin")

        val codecs = MediaCodecList(REGULAR_CODECS)
        val ans = MediaCodec.createByCodecName(codecs.findEncoderForFormat(mediaFormat))

        Log.i(TAG, "mediaCodec creation end ans=$ans")

        ans
    }

    private val bufferInfo = MediaCodec.BufferInfo()
    private val frameMuxer = muxerConfig.frameMuxer

    private var surface: Surface? = null

    fun start() {
        Log.i(TAG, "start() begin")

        mediaCodec.setCallback(createMediaCodecCallback())

        mediaCodec.configure(mediaFormat, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
        surface = mediaCodec.createInputSurface()
        mediaCodec.start()

//        drainCodec(false)

        Log.i(TAG, "start() end")
    }

    private fun createMediaCodecCallback(): MediaCodec.Callback {
        return object : MediaCodec.Callback() {
            override fun onInputBufferAvailable(codec: MediaCodec, index: Int) {
                Log.i(TAG, "onInputBufferAvailable index=$index")
                // nothing?
            }

            override fun onOutputBufferAvailable(
                codec: MediaCodec,
                index: Int,
                info: MediaCodec.BufferInfo
            ) {
                Log.i(TAG, "onOutputBufferAvailable index=$index")

                // TODO do not use this deprecated API?
                val encodedData = codec.outputBuffers[index]
                    ?: throw RuntimeException("encoderOutputBuffer  $index was null")
                if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG != 0) {
                    // The codec config data was pulled out and fed to the muxer when we got
                    // the INFO_OUTPUT_FORMAT_CHANGED status.  Ignore it.
                    if (VERBOSE) Log.i(TAG, "drainCodec ignoring BUFFER_FLAG_CODEC_CONFIG")
                    bufferInfo.size = 0
                }
                if (bufferInfo.size != 0) {
                    if (!frameMuxer.isStarted()) {
                        throw RuntimeException("muxer hasn't started")
                    }
                    frameMuxer.muxVideoFrame(encodedData, bufferInfo)
                    if (VERBOSE) Log.i(TAG, "sent " + bufferInfo.size + " bytes to muxer")
                }
                mediaCodec.releaseOutputBuffer(index, false)
                if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) {
                    if (!endOfStream) {
                        Log.w(TAG, "drainCodec reached end of stream unexpectedly")
                    } else {
                        if (VERBOSE) Log.i(TAG, "drainCodec end of stream reached")
                    }
                    break // out of while
                }
            }

            override fun onError(codec: MediaCodec, e: MediaCodec.CodecException) {
                Log.e(TAG, "onError (MediaCodec.Callback)", e)
                // TODO handle it
            }

            override fun onOutputFormatChanged(codec: MediaCodec, format: MediaFormat) {
                Log.i(TAG, "onOutputFormatChanged format=$format")

                // should happen before receiving buffers, and should only happen once
                if (frameMuxer.isStarted()) {
                    throw RuntimeException("format changed twice")
                }
                val newFormat: MediaFormat = mediaCodec.outputFormat
                Log.i(TAG, "drainCodec encoder output format changed: $newFormat")

                // now that we have the Magic Goodies, start the muxer
                frameMuxer.start(newFormat)
            }
        }
    }

    fun encode(image: Bitmap) {
        val startTime = System.nanoTime()
        Log.i(TAG, "encode() begin time=$startTime")

        // NOTE do not use `lockCanvas` like what is done in bitmap2video
        // This is because https://developer.android.com/reference/android/media/MediaCodec#createInputSurface()
        // says that, "Surface.lockCanvas(android.graphics.Rect) may fail or produce unexpected results."
        val canvas = surface?.lockHardwareCanvas()
        canvas?.drawBitmap(image, 0f, 0f, null)
        surface?.unlockCanvasAndPost(canvas)

        Log.i(
            TAG,
            "encode() call drainCodec time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - startTime) / 1000000.0}"
        )

//        drainCodec(false)

        Log.i(
            TAG,
            "encode() end time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - startTime) / 1000000.0}"
        )
    }

    /**
     * Releases encoder resources.  May be called after partial / failed initialization.
     */
    fun release() {
        Log.i(TAG, "release() begin")

//        drainCodec(true)
        mediaCodec.signalEndOfInputStream()
        TODO_wait

        mediaCodec.stop()
        mediaCodec.release()
        surface?.release()

        frameMuxer.release()

        Log.i(TAG, "release() end")
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
