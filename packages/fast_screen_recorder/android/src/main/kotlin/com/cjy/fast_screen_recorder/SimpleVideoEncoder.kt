package com.cjy.fast_screen_recorder

import android.graphics.Bitmap
import android.media.MediaCodec
import android.media.MediaCodecInfo
import android.media.MediaCodecList
import android.media.MediaCodecList.REGULAR_CODECS
import android.media.MediaFormat
import android.os.Handler
import android.os.Looper
import android.view.Surface
import java.io.File


/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/FrameBuilder.kt
 */
class SimpleVideoEncoder(
    private val muxerConfig: MuxerConfig,
) {
    private val log by logger("SimpleVideoEncoder")

    private val mediaFormat: MediaFormat = run {
        log.log("mediaFormat creation begin")

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

        log.log("mediaFormat creation end format=$format")

        format
    }

    private val mediaCodec: MediaCodec = run {
        log.log("mediaCodec creation begin")

        val codecs = MediaCodecList(REGULAR_CODECS)
        val ans = MediaCodec.createByCodecName(codecs.findEncoderForFormat(mediaFormat))

        log.log("mediaCodec creation end ans=$ans")

        ans
    }

    private val frameMuxer = muxerConfig.frameMuxer

    private var surface: Surface? = null

    fun start() {
        log.log("start() begin")

        mediaCodec.setCallback(createMediaCodecCallback(), Handler(Looper.getMainLooper()))

        mediaCodec.configure(mediaFormat, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
        surface = mediaCodec.createInputSurface()
        mediaCodec.start()

//        drainCodec(false)

        log.log("start() end")
    }

    private fun createMediaCodecCallback(): MediaCodec.Callback {
        return object : MediaCodec.Callback() {
            override fun onInputBufferAvailable(codec: MediaCodec, index: Int) {
                catchExceptionToLog {
                    log.log("onInputBufferAvailable index=$index")
                    // nothing?
                }
            }

            override fun onOutputBufferAvailable(
                codec: MediaCodec,
                index: Int,
                info: MediaCodec.BufferInfo
            ) {
                // need to catch, since this is from callback, so there are no
                // things like pigeon auto-catch
                catchExceptionToLog {
                    if (FastScreenRecorderPlugin.verbose) log.log("onOutputBufferAvailable() start index=$index time=${System.nanoTime()}")

                    val encodedData = codec.getOutputBuffer(index)!!

                    var effectiveSize = info.size

                    if (info.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG != 0) {
                        // The codec config data was pulled out and fed to the muxer when we got
                        // the INFO_OUTPUT_FORMAT_CHANGED status.  Ignore it.
                        if (FastScreenRecorderPlugin.verbose) log.log("drainCodec ignoring BUFFER_FLAG_CODEC_CONFIG")
                        effectiveSize = 0
                    }

                    if (effectiveSize != 0) {
                        if (!frameMuxer.isStarted()) {
                            throw RuntimeException("muxer hasn't started")
                        }
                        frameMuxer.muxVideoFrame(encodedData, info)
                        if (FastScreenRecorderPlugin.verbose) log.log("sent " + info.size + " bytes to muxer")
                    }

                    mediaCodec.releaseOutputBuffer(index, false)

                    if (info.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) {
                        log.log("drainCodec end of stream reached")
                        actualRelease()
                    }

                    if (FastScreenRecorderPlugin.verbose) log.log("onOutputBufferAvailable() end")
                }
            }

            override fun onError(codec: MediaCodec, e: MediaCodec.CodecException) {
                catchExceptionToLog {
                    log.log("onError (MediaCodec.Callback)", e)
                }
            }

            override fun onOutputFormatChanged(codec: MediaCodec, format: MediaFormat) {
                catchExceptionToLog {
                    log.log("onOutputFormatChanged format=$format")

                    // should happen before receiving buffers, and should only happen once
                    if (frameMuxer.isStarted()) {
                        throw RuntimeException("format changed twice")
                    }
                    val newFormat: MediaFormat = mediaCodec.outputFormat
                    log.log("encoder output format changed: $newFormat")

                    // now that we have the Magic Goodies, start the muxer
                    frameMuxer.start(newFormat)
                }
            }
        }
    }

    fun encode(image: Bitmap) {
        val startTime = System.nanoTime()
        if (FastScreenRecorderPlugin.verbose) log.log("encode() begin time=$startTime")

        // NOTE do not use `lockCanvas` like what is done in bitmap2video
        // This is because https://developer.android.com/reference/android/media/MediaCodec#createInputSurface()
        // says that, "Surface.lockCanvas(android.graphics.Rect) may fail or produce unexpected results."
        val canvas = surface?.lockHardwareCanvas()
        canvas?.drawBitmap(image, 0f, 0f, null)
        surface?.unlockCanvasAndPost(canvas)

//        Log.i(
//            TAG,
//            "encode() call drainCodec time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - startTime) / 1000000.0}"
//        )
//        drainCodec(false)

        if (FastScreenRecorderPlugin.verbose) log.log("encode() end time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - startTime) / 1000000.0}")
    }

    /**
     * can only *start* releasing, since it is asynchronous
     */
    fun startRelease() {
        log.log("startRelease() begin")

//        drainCodec(true)
        mediaCodec.signalEndOfInputStream()

        log.log("startRelease() end")
    }

    private fun actualRelease() {
        log.log("actualRelease() begin")

        mediaCodec.stop()
        mediaCodec.release()
        surface?.release()

        frameMuxer.release()

        log.log("actualRelease() end")
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
