package com.cjy.fast_screen_recorder

import android.app.Activity
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.PixelCopy

object NativeScreenRecorder {
    private val bitmap = Bitmap.createBitmap(view.width, view.height, Bitmap.Config.ARGB_8888)

    fun start(path: String) {
        TODO()
    }

    fun capture(activity: Activity) {
        val window = activity.window
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PixelCopy.request(
                window,
                bitmap,
                { copyResult ->
                    if (copyResult == PixelCopy.SUCCESS) {
                        TODO()
                    } else {
                        TODO()
                    }
                },
                Handler(Looper.getMainLooper())
            )
        } else {
            throw IllegalStateException("only support >= Android O currently")
        }
    }

    fun stop() {
        TODO()
    }
}