package com.cjy.fast_screen_recorder

import android.media.MediaCodec
import android.media.MediaFormat
import android.media.MediaMuxer
import java.nio.ByteBuffer
import java.util.concurrent.TimeUnit

/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/Mp4FrameMuxer.kt
 */
class SimpleMp4FrameMuxer(path: String, private val fps: Float) : SimpleFrameMuxer {
    private val log by logger("SimpleMp4FrameMuxer")

    private val frameUsec: Long = (TimeUnit.SECONDS.toMicros(1L) / fps).toLong()

    private val muxer: MediaMuxer = MediaMuxer(path, MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4)

    private var started = false
    private var videoTrackIndex = 0
    private var videoFrames = 0
    private var finalVideoTime: Long = 0

    override fun isStarted(): Boolean = started

    override fun start(videoFormat: MediaFormat) {
        videoTrackIndex = muxer.addTrack(videoFormat)
        log.log("start() videoFormat=$videoFormat videoTrackIndex=$videoTrackIndex")
        muxer.start()
        started = true
    }

    override fun muxVideoFrame(encodedData: ByteBuffer, bufferInfo: MediaCodec.BufferInfo) {
        // This code will break if the encoder supports B frames.
        // Ideally we would use set the value in the encoder,
        // don't know how to do that without using OpenGL
        finalVideoTime = frameUsec * videoFrames++
        bufferInfo.presentationTimeUs = finalVideoTime

        muxer.writeSampleData(videoTrackIndex, encodedData, bufferInfo)
    }

    override fun release() {
        muxer.stop()
        muxer.release()
    }

    override fun getVideoTime(): Long {
        return finalVideoTime
    }
}