package com.cjy.fast_screen_recorder

import android.app.Activity
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.Size
import android.view.PixelCopy
import android.view.View
import android.view.ViewGroup
import io.flutter.embedding.android.FlutterSurfaceView
import java.io.File

object NativeScreenRecorder {
    private val log by logger("NativeScreenRecorder")
    
//    private var bitmap: Bitmap? = null
    private var encoder: SimpleVideoEncoder? = null

    private var outputSize: Size? = null

    fun start(
        path: String,
        outputSize: Size,
        frameRate: Float,
        bitrate: Int,
        iFrameInterval: Int,
    ) {
        log.log("start() begin")

//        check(bitmap == null)
//        bitmap = Bitmap.createBitmap(outputWidth, outputHeight, Bitmap.Config.ARGB_8888)

        encoder = SimpleVideoEncoder(
            muxerConfig = MuxerConfig(
                file = File(path),
                videoWidth = outputSize.width,
                videoHeight = outputSize.height,
                frameRate = frameRate,
                bitrate = bitrate,
                iFrameInterval = iFrameInterval,
                // TODO more args
            ),
        )
        encoder!!.start()

        this.outputSize = outputSize

        log.log("start() end")
    }

    fun stop() {
        log.log("stop() begin")

//        bitmap!!.recycle()
//        bitmap = null

        encoder!!.startRelease()
        encoder = null

        log.log("stop() end")
    }

    fun capture(
        activity: Activity,
        callback: (Result<Unit>) -> Unit,
    ) {
        val startTime = System.nanoTime()
        log.log("capture() begin time=$startTime")

        val bitmap = Bitmap.createBitmap(outputSize!!.width, outputSize!!.height, Bitmap.Config.ARGB_8888)

        val window = activity.window

        var flutterSurfaceView: FlutterSurfaceView? = null
        traverseView(window.decorView) { v ->
            if (v is FlutterSurfaceView) flutterSurfaceView = v
        }

        if (flutterSurfaceView == null) {
            callback(Result.failure(IllegalStateException("failed to find FlutterSurfaceView")))
            return
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            PixelCopy.request(
//                window,
                flutterSurfaceView!!,
                bitmap!!,
                { pixelCopyResult ->
                    // need to catch, since this is from PixelCopy callback, so there are no
                    // things like pigeon auto-catch
                    catchExceptionToLog {
                        handlePixelCopyResult(pixelCopyResult, callback, debugStartTime = startTime, bitmap)
                    }
                },
                Handler(Looper.getMainLooper())
            )
        } else {
            callback(Result.failure(IllegalStateException("only support >= Android O currently")))
        }
    }

    private fun handlePixelCopyResult(pixelCopyResult: Int, callback: (Result<Unit>) -> Unit, debugStartTime: Long, bitmap: Bitmap) {
        log.log("handlePixelCopyResult() begin pixelCopyResult=$pixelCopyResult time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - debugStartTime) / 1000000.0}")

        if (pixelCopyResult != PixelCopy.SUCCESS) {
            callback(Result.failure(IllegalStateException("PixelCopy failed (pixelCopyResult=$pixelCopyResult)")))
            return
        }

        encoder!!.encode(bitmap)
        callback(Result.success(Unit))

        bitmap.recycle()
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