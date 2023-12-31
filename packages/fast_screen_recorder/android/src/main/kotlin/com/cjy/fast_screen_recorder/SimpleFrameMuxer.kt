package com.cjy.fast_screen_recorder

import android.media.MediaCodec
import android.media.MediaExtractor
import android.media.MediaFormat
import java.nio.ByteBuffer

/**
 * modified from https://github.com/israel-fl/bitmap2video/blob/develop/library/src/main/java/com/homesoft/encoder/FrameMuxer.kt
 */
interface SimpleFrameMuxer {
    fun isStarted(): Boolean

    fun start(videoFormat: MediaFormat)

    fun muxVideoFrame(encodedData: ByteBuffer, bufferInfo: MediaCodec.BufferInfo)

    fun release()

    fun getVideoTime(): Long
}