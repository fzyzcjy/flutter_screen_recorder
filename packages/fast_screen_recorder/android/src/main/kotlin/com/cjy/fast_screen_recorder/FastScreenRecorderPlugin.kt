package com.cjy.fast_screen_recorder

import android.app.Activity
import android.util.Size
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** FastScreenRecorderPlugin */
class FastScreenRecorderPlugin : FlutterPlugin, FastScreenRecorderHostApi, ActivityAware {

    // engine related

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        FastScreenRecorderHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
        flutterApi = FastScreenRecorderFlutterApi(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        FastScreenRecorderHostApi.setUp(binding.binaryMessenger, null)
        flutterApi = null
    }

    // activity related

    private var activity: Activity? = null

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    // real api

    override fun start(request: StartRequest) =
        NativeScreenRecorder.start(
            path = request.path,
            outputSize = Size(request.outputWidth.toInt(), request.outputHeight.toInt()),
            frameRate = request.frameRate.toFloat(),
            bitrate = request.bitrate.toInt(),
            iFrameInterval = request.iFrameInterval.toInt(),
        )

    override fun capture(callback: (Result<Unit>) -> Unit) {
        // need to catch for this *async* function, since Pigeon does not catch it
        catchExceptionToLog {
            NativeScreenRecorder.capture(
                activity = activity!!,
                callback = callback,
            )
        }
    }

    override fun stop() = NativeScreenRecorder.stop()

    companion object {
        var flutterApi: FastScreenRecorderFlutterApi? = null
            private set

        // TODO add modifier to this flag
        var verbose: Boolean = false
    }
}
