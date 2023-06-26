package com.cjy.fast_screen_recorder

import android.os.Handler
import android.os.Looper
import android.util.Log
import java.text.SimpleDateFormat
import java.util.*

// ========================================================================
// NOTE: COPIED FROM INTERNAL REPOSITORY, PLEASE KEEP IN SYNC
// ========================================================================
object MyFlutterLog {
    fun log(tag: String, partialMessage: String, self: Any? = null, throwable: Throwable? = null) {
        val time = SDF_ISO8601.format(Date())

        val currentThread = Thread.currentThread()
        val message = "$partialMessage " +
                "(thread=${currentThread.id}-${currentThread.name}, " +
                "self=${myShortHash(self)})"

        if (throwable != null) {
            Log.w(tag, message, throwable)
        } else {
            Log.d(tag, message)
        }

        Handler(Looper.getMainLooper()).post {
            FastScreenRecorderPlugin.flutterApi?.log(
                LogArg(
                    tag = tag,
                    message = message,
                    time = time,
                    throwable = throwable?.let { exceptionToString(it) },
                )
            ) {}
        }
    }
}

fun <R : Any> R.logger(tag: String): Lazy<MyFlutterLogger> =
    lazy { MyFlutterLogger(tag = tag, self = this) }

class MyFlutterLogger(
    private val tag: String,
    private val self: Any?,
) {
    fun log(partialMessage: String, throwable: Throwable? = null) {
        MyFlutterLog.log(tag, partialMessage, self = self, throwable = throwable)
    }
}

fun myShortHash(o: Any?): String =
    if (o == null) "null" else (System.identityHashCode(o) % 0xffffffff).toString(16)

private fun exceptionToString(e: Throwable): String {
    return "exception(" +
            "class=${e.javaClass.name}, " +
            "message=${e.message}, " +
            "cause=${e.cause}, " +
            "stackTrace=${Log.getStackTraceString(e)}" +
            ")"
}

// https://stackoverflow.com/questions/13515168/android-time-in-iso-8601
private val SDF_ISO8601 = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ", Locale.UK)

fun catchExceptionToLog(callback: () -> Unit) {
    try {
        callback()
    } catch (e: Throwable) {
        MyFlutterLog.log("E2L", "captureExceptionToLog see exception", e)
    }
}