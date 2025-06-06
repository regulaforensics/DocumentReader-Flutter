@file:SuppressLint("MissingPermission")

package com.regula.plugin.documentreader

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.lifecycle.Lifecycle
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

const val channelID = "flutter_document_reader_api"
val eventSinks = mutableMapOf<String, EventSink?>()

lateinit var args: List<Any?>
lateinit var binding: FlutterPluginBinding
lateinit var activityBinding: ActivityPluginBinding
val context: Context
    get() = binding.applicationContext
val activity: Activity
    get() = activityBinding.activity
val lifecycle: Lifecycle
    get() = (activityBinding.lifecycle as HiddenLifecycleReference).lifecycle

fun sendEvent(id: String, data: Any? = "") {
    eventSinks[id]?.let { Handler(Looper.getMainLooper()).post { it.success(data.toSendable()) } }
}

inline fun <reified T> argsNullable(index: Int) = when (val v = args[index]) {
    null -> null
    is Map<*, *> -> v.toJson() as T
    is List<*> -> v.toJson() as T
    else -> v as T
}

fun setupEventChannel(id: String) = EventChannel(binding.binaryMessenger, "$channelID/event/$id").setStreamHandler(object : StreamHandler {
    override fun onListen(arguments: Any?, events: EventSink) = events.let { eventSinks[id] = it }
    override fun onCancel(arguments: Any?) = Unit
})

fun requestPermissions(activity: Activity, permissions: Array<String>, requestCode: Int) = ActivityCompat.requestPermissions(activity, permissions, requestCode)
fun startActivityForResult(activity: Activity, intent: Intent, requestCode: Int) = activity.startActivityForResult(intent, requestCode)

class FlutterDocumentReaderApiPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    override fun onDetachedFromActivityForConfigChanges() = Unit
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) = Unit
    override fun onDetachedFromActivity() = Unit
    override fun onDetachedFromEngine(binding: FlutterPluginBinding) = Unit
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        args = call.arguments as List<*>
        try {
            methodCall(call.method) { data -> result.success(data.toSendable()) }
        } catch (error: Exception) {
            Log.e("REGULA", "Caught exception in \"${call.method}\" function:", error)
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
        binding.addOnNewIntentListener(::newIntent)
        binding.addActivityResultListener(::onActivityResult)
        binding.addRequestPermissionsResultListener(::onRequestPermissionsResult)
    }

    override fun onAttachedToEngine(flutterBinding: FlutterPluginBinding) {
        binding = flutterBinding
        for (event in arrayOf(
            completionEvent,
            databaseProgressEvent,
            rfidOnProgressEvent,
            rfidOnChipDetectedEvent,
            rfidOnRetryReadChipEvent,
            paCertificateCompletionEvent,
            taCertificateCompletionEvent,
            taSignatureCompletionEvent,
            videoEncoderCompletionEvent,
            onCustomButtonTappedEvent
        )) setupEventChannel(event)
        MethodChannel(binding.binaryMessenger, "$channelID/method").setMethodCallHandler(this)
    }
}
