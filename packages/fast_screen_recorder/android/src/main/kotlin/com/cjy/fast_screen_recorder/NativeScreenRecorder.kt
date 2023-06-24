package com.cjy.fast_screen_recorder

import android.app.Activity
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.PixelCopy

object NativeScreenRecorder {
    private var bitmap: Bitmap? = null

    fun start(path: String, outputWidth: Int, outputHeight: Int) {
        check(bitmap == null)
        bitmap = Bitmap.createBitmap(outputWidth, outputHeight, Bitmap.Config.ARGB_8888)
    }

    fun stop() {
        bitmap!!.recycle()
        bitmap = null
    }

    fun capture(
        activity: Activity,
        callback: (Result<Unit>) -> Unit,
    ) {
        val window = activity.window
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PixelCopy.request(
                window,
                bitmap!!,
                { copyResult ->
                    if (copyResult == PixelCopy.SUCCESS) {
                        TODO()
                    } else {
                        callback(Result.failure(IllegalStateException("PixelCopy failed (copyResult=$copyResult)")))
                    }
                },
                Handler(Looper.getMainLooper())
            )
        } else {
            callback(Result.failure(IllegalStateException("only support >= Android O currently")))
        }
    }
}