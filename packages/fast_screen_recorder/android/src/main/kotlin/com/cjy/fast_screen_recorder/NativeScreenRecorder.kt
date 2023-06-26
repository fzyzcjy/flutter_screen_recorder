package com.cjy.fast_screen_recorder

import android.app.Activity
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Size
import android.view.PixelCopy
import android.view.View
import android.view.ViewGroup
import android.view.Window
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

        if (encoder != null) {
            log.log("start() but already has encoder thus skip")
            return
        }

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

        if (encoder == null) {
            log.log("stop() but already not have encoder thus skip")
            return
        }

//        bitmap!!.recycle()
//        bitmap = null

        encoder!!.startRelease()
        encoder = null

        log.log("stop() end")
    }

    fun capture(
        activity: Activity,
        callback: (Result<CaptureResponse>) -> Unit,
    ) {
        val startTime = System.nanoTime()
        if (FastScreenRecorderPlugin.verbose) log.log("capture() begin time=$startTime")

        val bitmap =
            Bitmap.createBitmap(outputSize!!.width, outputSize!!.height, Bitmap.Config.ARGB_8888)

        val window = activity.window

        val flutterSurfaceView = getFlutterSurfaceView(window)

        if (flutterSurfaceView == null) {
            callback(Result.failure(IllegalStateException("failed to find FlutterSurfaceView")))
            return
        }

        // ref: How `PixelCopy.request` converts SurfaceView into Surface
        val surface = flutterSurfaceView.holder.surface
        // #9703 this will happen (for example) when app in background
        // to avoid race condition like https://github.com/fzyzcjy/yplusplus/issues/9713#issuecomment-1607441134
        // we mark it as "skipped" instead of throwing an error
        if (!surface.isValid) {
            log.log("capture() skipped since !surface.isValid")
            callback(Result.success(CaptureResponse(succeedOrSkipped = false)))
            return
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            PixelCopy.request(
//                window,
                flutterSurfaceView,
                bitmap!!,
                { pixelCopyResult ->
                    // need to catch, since this is from PixelCopy callback, so there are no
                    // things like pigeon auto-catch
                    catchExceptionToLog {
                        handlePixelCopyResult(pixelCopyResult, callback, startTime, bitmap)
                    }
                },
                Handler(Looper.getMainLooper())
            )
        } else {
            callback(Result.failure(IllegalStateException("only support >= Android O currently")))
        }
    }

    private fun getFlutterSurfaceView(window: Window): FlutterSurfaceView? {
        var flutterSurfaceView: FlutterSurfaceView? = null
        traverseView(window.decorView) { v ->
            if (v is FlutterSurfaceView) flutterSurfaceView = v
        }
        return flutterSurfaceView
    }

    private fun handlePixelCopyResult(
        pixelCopyResult: Int,
        callback: (Result<CaptureResponse>) -> Unit,
        debugStartTime: Long,
        bitmap: Bitmap
    ) {
        if (FastScreenRecorderPlugin.verbose) log.log("handlePixelCopyResult() begin pixelCopyResult=$pixelCopyResult time=${System.nanoTime()} delta(ms)=${(System.nanoTime() - debugStartTime) / 1000000.0}")

        if (pixelCopyResult != PixelCopy.SUCCESS) {
            callback(Result.failure(IllegalStateException("PixelCopy failed (pixelCopyResult=$pixelCopyResult)")))
            return
        }

        if (encoder == null) {
            log.log("handlePixelCopyResult() but already not have encoder thus skip")
            callback(Result.success(CaptureResponse(succeedOrSkipped = false)))
            return
        }

        encoder!!.encode(bitmap)
        callback(Result.success(CaptureResponse(succeedOrSkipped = true)))

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