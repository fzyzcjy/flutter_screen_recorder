package com.cjy.fast_screen_recorder

import android.app.Activity
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.PixelCopy
import android.view.View
import android.view.ViewGroup
import io.flutter.embedding.android.FlutterSurfaceView
import java.io.File

private const val TAG = "NativeScreenRecorder"

object NativeScreenRecorder {
    private var bitmap: Bitmap? = null
    private var encoder: SimpleVideoEncoder? = null

    fun start(
        path: String,
        outputWidth: Int,
        outputHeight: Int,
        frameRate: Float,
        bitrate: Int,
        iFrameInterval: Int,
    ) {
        Log.d(TAG, "start() begin")

        check(bitmap == null)
        bitmap = Bitmap.createBitmap(outputWidth, outputHeight, Bitmap.Config.ARGB_8888)

        encoder = SimpleVideoEncoder(
            muxerConfig = MuxerConfig(
                file = File(path),
                videoWidth = outputWidth,
                videoHeight = outputHeight,
                frameRate = frameRate,
                bitrate = bitrate,
                iFrameInterval = iFrameInterval,
                // TODO more args
            ),
        )
        encoder!!.start()

        Log.d(TAG, "start() end")
    }

    fun stop() {
        Log.d(TAG, "stop() begin")

        bitmap!!.recycle()
        bitmap = null

        encoder!!.releaseVideoCodec()
        encoder!!.releaseMuxer()
        encoder = null

        Log.d(TAG, "stop() end")
    }

    fun capture(
        activity: Activity,
        callback: (Result<Unit>) -> Unit,
    ) {
        Log.d(TAG, "capture() begin")

        val window = activity.window

        var flutterSurfaceView: FlutterSurfaceView? = null
        traverseView(window.decorView) { v ->
            if (v is FlutterSurfaceView) flutterSurfaceView = v
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PixelCopy.request(
//                window,
                flutterSurfaceView!!,
                bitmap!!,
                { pixelCopyResult -> handlePixelCopyResult(pixelCopyResult, callback) },
                Handler(Looper.getMainLooper())
            )
        } else {
            callback(Result.failure(IllegalStateException("only support >= Android O currently")))
        }
    }

    private fun handlePixelCopyResult(pixelCopyResult: Int, callback: (Result<Unit>) -> Unit) {
        Log.d(TAG, "handlePixelCopyResult() begin pixelCopyResult=$pixelCopyResult")

        if (pixelCopyResult != PixelCopy.SUCCESS) {
            callback(Result.failure(IllegalStateException("PixelCopy failed (pixelCopyResult=$pixelCopyResult)")))
            return
        }

        encoder!!.encode(bitmap!!)
        callback(Result.success(Unit))
    }
}

private fun traverseView(view: View, callback: (View) -> Unit) {
    callback(view)
    if (view is ViewGroup) {
        for (i in 0 until view.childCount) {
            traverseView(view.getChildAt(i), callback)
        }
    }
}