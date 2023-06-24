package com.cjy.fast_screen_recorder

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FastScreenRecorderPlugin */
class FastScreenRecorderPlugin : FlutterPlugin, FastScreenRecorderHostApi, ActivityAware {

    // engine related

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        FastScreenRecorderHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        FastScreenRecorderHostApi.setUp(binding.binaryMessenger, null)
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
            outputWidth = request.outputWidth.toInt(),
            outputHeight = request.outputHeight.toInt(),
            frameRate = request.frameRate.toFloat(),
            bitrate = request.bitrate.toInt(),
            iFrameInterval = request.iFrameInterval.toInt(),
        )

    override fun capture(callback: (kotlin.Result<Unit>) -> Unit) =
        NativeScreenRecorder.capture(
            activity = activity!!,
            callback = callback,
        )

    override fun stop() = NativeScreenRecorder.stop()
}
