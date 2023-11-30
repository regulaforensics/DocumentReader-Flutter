//
//  FlutterDocumentReaderApiPlugin.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.annotation.SuppressLint
import android.app.Activity
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NfcAdapter
import android.nfc.tech.IsoDep
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.View
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.LifecycleOwner
import com.regula.common.LocalizationCallbacks
import com.regula.documentreader.api.DocumentReader
import com.regula.documentreader.api.completions.IDocumentReaderCompletion
import com.regula.documentreader.api.completions.IDocumentReaderInitCompletion
import com.regula.documentreader.api.completions.IDocumentReaderPrepareCompletion
import com.regula.documentreader.api.completions.rfid.IRfidPKDCertificateCompletion
import com.regula.documentreader.api.completions.rfid.IRfidReaderCompletion
import com.regula.documentreader.api.completions.rfid.IRfidReaderRequest
import com.regula.documentreader.api.completions.rfid.IRfidTASignatureCompletion
import com.regula.documentreader.api.enums.DocReaderAction
import com.regula.documentreader.api.enums.LCID
import com.regula.documentreader.api.enums.eImageQualityCheckType
import com.regula.documentreader.api.enums.eLDS_ParsingErrorCodes
import com.regula.documentreader.api.enums.eLDS_ParsingNotificationCodes
import com.regula.documentreader.api.enums.eRFID_DataFile_Type
import com.regula.documentreader.api.enums.eRFID_ErrorCodes
import com.regula.documentreader.api.enums.eVisualFieldType
import com.regula.documentreader.api.errors.DocReaderRfidException
import com.regula.documentreader.api.errors.DocumentReaderException
import com.regula.documentreader.api.internal.core.CoreScenarioUtil
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge
import com.regula.documentreader.api.results.DocReaderDocumentsDatabase
import com.regula.documentreader.api.results.DocumentReaderNotification
import com.regula.documentreader.api.results.DocumentReaderResults
import com.regula.documentreader.api.results.DocumentReaderResults.fromRawResults
import com.regula.documentreader.api.results.DocumentReaderScenario
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import org.json.JSONArray
import org.json.JSONObject
import java.io.File

class FlutterDocumentReaderApiPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    override fun onDetachedFromActivityForConfigChanges() {}
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}
    override fun onDetachedFromActivity() {}
    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}
    override fun onAttachedToEngine(binding: FlutterPluginBinding) = attachedToEngine(binding, this)
    override fun onAttachedToActivity(binding: ActivityPluginBinding) = attachedToActivity(binding)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) = methodCall(call, result)
}

lateinit var args: ArrayList<Any?>

@SuppressLint("StaticFieldLeak")
lateinit var activity: Activity
val context: Context
    get() = activity

var backgroundRFIDEnabled: Boolean = false
var databaseDownloadProgress: Int = 0

var paCertificateCompletion: IRfidPKDCertificateCompletion? = null
var taCertificateCompletion: IRfidPKDCertificateCompletion? = null
var taSignatureCompletion: IRfidTASignatureCompletion? = null

var eventDatabaseProgress: EventSink? = null
var eventCompletion: EventSink? = null
var rfidOnProgressEvent: EventSink? = null
var rfidOnChipDetectedEvent: EventSink? = null
var rfidOnRetryReadChipEvent: EventSink? = null
var eventPACertificateCompletion: EventSink? = null
var eventTACertificateCompletion: EventSink? = null
var eventTASignatureCompletion: EventSink? = null
var bleOnServiceConnectedEvent: EventSink? = null
var bleOnServiceDisconnectedEvent: EventSink? = null
var bleOnDeviceReadyEvent: EventSink? = null
var eventVideoEncoderCompletion: EventSink? = null
var onCustomButtonTappedEvent: EventSink? = null

fun attachedToEngine(binding: FlutterPluginBinding, plugin: FlutterDocumentReaderApiPlugin) {
    setupEventChannel(binding, "completion") { events: EventSink? -> eventCompletion = events }
    setupEventChannel(binding, "database_progress") { events: EventSink? -> eventDatabaseProgress = events }
    setupEventChannel(binding, "video_encoder_completion") { events: EventSink? -> eventVideoEncoderCompletion = events }
    setupEventChannel(binding, "rfidOnProgressCompletion") { events: EventSink? -> rfidOnProgressEvent = events }
    setupEventChannel(binding, "rfidOnChipDetectedEvent") { events: EventSink? -> rfidOnChipDetectedEvent = events }
    setupEventChannel(binding, "rfidOnRetryReadChipEvent") { events: EventSink? -> rfidOnRetryReadChipEvent = events }
    setupEventChannel(binding, "pa_certificate_completion") { events: EventSink? -> eventPACertificateCompletion = events }
    setupEventChannel(binding, "ta_certificate_completion") { events: EventSink? -> eventTACertificateCompletion = events }
    setupEventChannel(binding, "ta_signature_completion") { events: EventSink? -> eventTASignatureCompletion = events }
    setupEventChannel(binding, "bleOnServiceConnectedEvent") { events: EventSink? -> bleOnServiceConnectedEvent = events }
    setupEventChannel(binding, "bleOnServiceDisconnectedEvent") { events: EventSink? -> bleOnServiceDisconnectedEvent = events }
    setupEventChannel(binding, "bleOnDeviceReadyEvent") { events: EventSink? -> bleOnDeviceReadyEvent = events }
    setupEventChannel(binding, "onCustomButtonTappedEvent") { events: EventSink? -> onCustomButtonTappedEvent = events }
    MethodChannel(binding.binaryMessenger, "flutter_document_reader_api/method").setMethodCallHandler(plugin)
}

fun attachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
    binding.addOnNewIntentListener { intent: Intent ->
        // recommended method requires api 33
        @Suppress("DEPRECATION")
        if ((intent.action == NfcAdapter.ACTION_TECH_DISCOVERED) && backgroundRFIDEnabled)
            DocumentReader.Instance().readRFID(IsoDep.get(intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)), rfidReaderCompletion, rfidReaderRequest)
        false
    }
    (binding.lifecycle as HiddenLifecycleReference).lifecycle.addObserver(LifecycleEventObserver { _: LifecycleOwner?, event: Lifecycle.Event ->
        if (event == Lifecycle.Event.ON_RESUME && backgroundRFIDEnabled)
            startForegroundDispatch(activity)
    })
}

fun setupEventChannel(binding: FlutterPluginBinding, id: String, onListen: (EventSink?) -> Unit) {
    EventChannel(binding.binaryMessenger, "flutter_document_reader_api/event/$id").setStreamHandler(object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventSink) = onListen(events)
        override fun onCancel(arguments: Any?) {}
    })
}

fun sendEvent(event: EventSink?, data: Any? = "") {
    event?.let { Handler(Looper.getMainLooper()).post { it.success(data.toSendable()) } }
}

fun <T> args(index: Int): T? = args(args, index)

interface Callback {
    fun success(data: Any? = "")
    fun error(message: String)
}

fun methodCall(call: MethodCall, result: MethodChannel.Result) {
    val action: String = call.method
    @Suppress("UNCHECKED_CAST")
    args = call.arguments as ArrayList<Any?>
    val callback: Callback = object : Callback {
        override fun success(data: Any?) = result.success(data.toSendable())
        override fun error(message: String) = result.error("", message, null)
    }
    when (action) {
        "getDocumentReaderIsReady" -> getDocumentReaderIsReady(callback)
        "getDocumentReaderStatus" -> getDocumentReaderStatus(callback)
        "isAuthenticatorAvailableForUse" -> isAuthenticatorAvailableForUse(callback)
        "isBlePermissionsGranted" -> isBlePermissionsGranted(callback)
        "getRfidSessionStatus" -> getRfidSessionStatus(callback)
        "setRfidSessionStatus" -> setRfidSessionStatus(callback)
        "getTag" -> getTag(callback)
        "setTag" -> setTag(args(0))
        "getFunctionality" -> getFunctionality(callback)
        "setFunctionality" -> setFunctionality(args(0)!!)
        "getProcessParams" -> getProcessParams(callback)
        "setProcessParams" -> setProcessParams(args(0)!!)
        "getCustomization" -> getCustomization(callback)
        "setCustomization" -> setCustomization(args(0)!!)
        "getRfidScenario" -> getRfidScenario(callback)
        "setRfidScenario" -> setRfidScenario(args(0)!!)
        "initializeReader" -> initializeReader(callback, args(0)!!)
        "initializeReaderWithBleDeviceConfig" -> initializeReaderWithBleDeviceConfig(callback, args(0)!!)
        "deinitializeReader" -> deinitializeReader(callback)
        "prepareDatabase" -> prepareDatabase(callback, args(0)!!)
        "removeDatabase" -> removeDatabase(callback)
        "runAutoUpdate" -> runAutoUpdate(callback, args(0)!!)
        "cancelDBUpdate" -> cancelDBUpdate(callback)
        "checkDatabaseUpdate" -> checkDatabaseUpdate(callback, args(0)!!)
        "scan" -> scan(args(0)!!)
        "recognize" -> recognize(args(0)!!)
        "startNewPage" -> startNewPage(callback)
        "stopScanner" -> stopScanner(callback)
        "startRFIDReader" -> startRFIDReader(args(0)!!)
        "stopRFIDReader" -> stopRFIDReader(callback)
        "readRFID" -> readRFID(args(0)!!)
        "providePACertificates" -> providePACertificates(callback, args(0))
        "provideTACertificates" -> provideTACertificates(callback, args(0))
        "provideTASignature" -> provideTASignature(callback, args(0))
        "setTCCParams" -> setTCCParams(callback, args(0)!!)
        "addPKDCertificates" -> addPKDCertificates(callback, args(0)!!)
        "clearPKDCertificates" -> clearPKDCertificates(callback)
        "startNewSession" -> startNewSession(callback)
        "startBluetoothService" -> startBluetoothService()
        "setLocalizationDictionary" -> setLocalizationDictionary(args(0)!!)
        "getLicense" -> getLicense(callback)
        "getAvailableScenarios" -> getAvailableScenarios(callback)
        "getIsRFIDAvailableForUse" -> getIsRFIDAvailableForUse(callback)
        "getDocReaderVersion" -> getDocReaderVersion(callback)
        "getDocReaderDocumentsDatabase" -> getDocReaderDocumentsDatabase(callback)
        "textFieldValueByType" -> textFieldValueByType(callback, args(0)!!, args(1)!!)
        "textFieldValueByTypeLcid" -> textFieldValueByTypeLcid(callback, args(0)!!, args(1)!!, args(2)!!)
        "textFieldValueByTypeSource" -> textFieldValueByTypeSource(callback, args(0)!!, args(1)!!, args(2)!!)
        "textFieldValueByTypeLcidSource" -> textFieldValueByTypeLcidSource(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!)
        "textFieldValueByTypeSourceOriginal" -> textFieldValueByTypeSourceOriginal(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!)
        "textFieldValueByTypeLcidSourceOriginal" -> textFieldValueByTypeLcidSourceOriginal(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!, args(4)!!)
        "textFieldByType" -> textFieldByType(callback, args(0)!!, args(1)!!)
        "textFieldByTypeLcid" -> textFieldByTypeLcid(callback, args(0)!!, args(1)!!, args(2)!!)
        "graphicFieldByTypeSource" -> graphicFieldByTypeSource(callback, args(0)!!, args(1)!!, args(2)!!)
        "graphicFieldByTypeSourcePageIndex" -> graphicFieldByTypeSourcePageIndex(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!)
        "graphicFieldByTypeSourcePageIndexLight" -> graphicFieldByTypeSourcePageIndexLight(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!, args(4)!!)
        "graphicFieldImageByType" -> graphicFieldImageByType(callback, args(0)!!, args(1)!!)
        "graphicFieldImageByTypeSource" -> graphicFieldImageByTypeSource(callback, args(0)!!, args(1)!!, args(2)!!)
        "graphicFieldImageByTypeSourcePageIndex" -> graphicFieldImageByTypeSourcePageIndex(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!)
        "graphicFieldImageByTypeSourcePageIndexLight" -> graphicFieldImageByTypeSourcePageIndexLight(callback, args(0)!!, args(1)!!, args(2)!!, args(3)!!, args(4)!!)
        "containers" -> containers(callback, args(0)!!, args(1)!!)
        "encryptedContainers" -> encryptedContainers(callback, args(0)!!)
        "getTranslation" -> getTranslation(callback, args(0)!!, args(1)!!)
    }
}

fun startForegroundDispatch(activity: Activity) {
    val filters: Array<IntentFilter?> = arrayOfNulls(1)
    filters[0] = IntentFilter()
    filters[0]!!.addAction(NfcAdapter.ACTION_TECH_DISCOVERED)
    filters[0]!!.addCategory(Intent.CATEGORY_DEFAULT)
    val techList: Array<Array<String>> = arrayOf(arrayOf("android.nfc.tech.IsoDep"))
    val intent = Intent(context, context.javaClass)
    val flag: Int = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) PendingIntent.FLAG_MUTABLE else 0
    val pendingIntent = PendingIntent.getActivity(context, 0, intent, flag)
    NfcAdapter.getDefaultAdapter(context).enableForegroundDispatch(activity, pendingIntent, filters, techList)
}

fun stopBackgroundRFID() {
    if (!backgroundRFIDEnabled) return
    NfcAdapter.getDefaultAdapter(activity).disableForegroundDispatch(activity)
    backgroundRFIDEnabled = false
}

private fun getDocumentReaderIsReady(callback: Callback) = callback.success(DocumentReader.Instance().isReady)

private fun getDocumentReaderStatus(callback: Callback) = callback.success(DocumentReader.Instance().status)

private fun isAuthenticatorAvailableForUse(callback: Callback) = callback.success(DocumentReader.Instance().isAuthenticatorAvailableForUse)

private fun isBlePermissionsGranted(callback: Callback) = callback.success(isBlePermissionsGranted((activity)))

private fun getRfidSessionStatus(callback: Callback) = callback.error("getRfidSessionStatus() is an ios-only method")

private fun setRfidSessionStatus(callback: Callback) = callback.error("setRfidSessionStatus() is an ios-only method")

private fun getTag(callback: Callback) = callback.success(DocumentReader.Instance().tag)

private fun setTag(tag: String?) = tag.let { DocumentReader.Instance().tag = it }

private fun getFunctionality(callback: Callback) = callback.success(getFunctionality(DocumentReader.Instance().functionality()))

private fun setFunctionality(functionality: JSONObject) = setFunctionality(DocumentReader.Instance().functionality(), functionality)

private fun getProcessParams(callback: Callback) = callback.success(getProcessParams(DocumentReader.Instance().processParams()))

private fun setProcessParams(processParams: JSONObject) = setProcessParams(DocumentReader.Instance().processParams(), processParams)

private fun getCustomization(callback: Callback) = callback.success(getCustomization(DocumentReader.Instance().customization()))

private fun setCustomization(customization: JSONObject) = setCustomization(DocumentReader.Instance().customization(), customization, context)

private fun getRfidScenario(callback: Callback) = callback.success(getRfidScenario(DocumentReader.Instance().rfidScenario()))

private fun setRfidScenario(rfidScenario: JSONObject) = setRfidScenario(DocumentReader.Instance().rfidScenario(), rfidScenario)

private fun initializeReader(callback: Callback, config: JSONObject) = DocumentReader.Instance().initializeReader(context, docReaderConfigFromJSON(config), getInitCompletion(callback))

private fun initializeReaderWithBleDeviceConfig(callback: Callback, config: JSONObject) = DocumentReader.Instance().initializeReader(context, bleDeviceConfigFromJSON(config), getInitCompletion(callback))

private fun deinitializeReader(callback: Callback) {
    DocumentReader.Instance().deinitializeReader()
    callback.success()
}

private fun prepareDatabase(callback: Callback, databaseID: String) = DocumentReader.Instance().prepareDatabase(context, databaseID, getPrepareCompletion(callback))

private fun removeDatabase(callback: Callback) = callback.success(DocumentReader.Instance().removeDatabase(context))

private fun runAutoUpdate(callback: Callback, databaseID: String) = DocumentReader.Instance().runAutoUpdate(context, databaseID, getPrepareCompletion(callback))

private fun cancelDBUpdate(callback: Callback) = callback.success(DocumentReader.Instance().cancelDBUpdate(context))

private fun checkDatabaseUpdate(callback: Callback, databaseID: String) = DocumentReader.Instance().checkDatabaseUpdate(context, databaseID) { database: DocReaderDocumentsDatabase? ->
    callback.success(generateDocReaderDocumentsDatabase(database))
}

private fun scan(config: JSONObject) {
    stopBackgroundRFID()
    DocumentReader.Instance().showScanner(context, scannerConfigFromJSON(config), completion)
}

private fun recognize(config: JSONObject) {
    stopBackgroundRFID()
    DocumentReader.Instance().recognize(context, recognizeConfigFromJSON(config), completion)
}

private fun startNewPage(callback: Callback) {
    DocumentReader.Instance().startNewPage()
    callback.success()
}

private fun stopScanner(callback: Callback) {
    DocumentReader.Instance().stopScanner(context)
    callback.success()
}

private fun startRFIDReader(type: Int) {
    stopBackgroundRFID()
    rfidReaderRequestType = type
    DocumentReader.Instance().startRFIDReader(context, rfidReaderCompletion, rfidReaderRequest)
}

private fun readRFID(type: Int) {
    backgroundRFIDEnabled = true
    rfidReaderRequestType = type
    startForegroundDispatch(activity)
}

private fun stopRFIDReader(callback: Callback) {
    DocumentReader.Instance().stopRFIDReader(context)
    stopBackgroundRFID()
    callback.success()
}

private fun providePACertificates(callback: Callback, certificates: JSONArray?) {
    paCertificateCompletion!!.onCertificatesReceived(arrayFromJSON(certificates, ::pkdCertificateFromJSON, arrayOfNulls(certificates?.length() ?: 0)))
    callback.success()
}

private fun provideTACertificates(callback: Callback, certificates: JSONArray?) {
    taCertificateCompletion!!.onCertificatesReceived(arrayFromJSON(certificates, ::pkdCertificateFromJSON, arrayOfNulls(certificates?.length() ?: 0)))
    callback.success()
}

private fun provideTASignature(callback: Callback, signature: String?) {
    taSignatureCompletion!!.onSignatureReceived(Convert.byteArrayFromBase64(signature))
    callback.success()
}

private fun setTCCParams(callback: Callback, params: JSONObject) {
    DocumentReader.Instance().setTccParams(tccParamsFromJSON(params)) { success: Boolean, error: DocumentReaderException? ->
        callback.success(generateSuccessCompletion(success, error))
    }
}

private fun addPKDCertificates(callback: Callback, certificates: JSONArray) {
    DocumentReader.Instance().addPKDCertificates(listFromJSON(certificates, ::pkdCertificateFromJSON)!!)
    callback.success()
}

private fun clearPKDCertificates(callback: Callback) {
    DocumentReader.Instance().clearPKDCertificates()
    callback.success()
}

private fun startNewSession(callback: Callback) {
    DocumentReader.Instance().startNewSession()
    callback.success()
}

private fun startBluetoothService() = startBluetoothService(
    activity,
    { isBleManagerConnected: Boolean -> sendEvent(bleOnServiceConnectedEvent, isBleManagerConnected) },
    { sendEvent(bleOnServiceDisconnectedEvent) },
    { sendEvent(bleOnDeviceReadyEvent) }
)

@Suppress("NULLABILITY_MISMATCH_BASED_ON_JAVA_ANNOTATIONS")
private fun setLocalizationDictionary(dictionary: JSONObject) {
    localizationCallbacks = LocalizationCallbacks { key: String -> dictionary.optString(key, null) }
    DocumentReader.Instance().setLocalizationCallback(localizationCallbacks!!)
}

private fun getLicense(callback: Callback) = callback.success(generateLicense(DocumentReader.Instance().license()))

private fun getAvailableScenarios(callback: Callback) {
    val scenarios: MutableList<DocumentReaderScenario> = ArrayList()
    for (scenario: DocumentReaderScenario in DocumentReader.Instance().availableScenarios)
        scenarios.add(CoreScenarioUtil.getScenario(scenario.name))
    callback.success(generateList(scenarios, ::generateDocumentReaderScenario))
}

private fun getIsRFIDAvailableForUse(callback: Callback) = callback.success(DocumentReader.Instance().isRFIDAvailableForUse)

private fun getDocReaderVersion(callback: Callback) = callback.success(generateDocReaderVersion(DocumentReader.Instance().version))

private fun getDocReaderDocumentsDatabase(callback: Callback) = callback.success(DocumentReader.Instance().version?.let { generateDocReaderDocumentsDatabase(it.database) })

private fun textFieldValueByType(callback: Callback, raw: String, fieldType: Int) = callback.success(fromRawResults(raw).getTextFieldValueByType(fieldType))

private fun textFieldValueByTypeLcid(callback: Callback, raw: String, fieldType: Int, lcid: Int) = callback.success(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid))

private fun textFieldValueByTypeSource(callback: Callback, raw: String, fieldType: Int, source: Int) = callback.success(fromRawResults(raw).getTextFieldValueByTypeAndSource(fieldType, source))

private fun textFieldValueByTypeLcidSource(callback: Callback, raw: String, fieldType: Int, lcid: Int, source: Int) = callback.success(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid, source))

private fun textFieldValueByTypeSourceOriginal(callback: Callback, raw: String, fieldType: Int, source: Int, original: Boolean) = callback.success(fromRawResults(raw).getTextFieldValueByTypeAndSource(fieldType, source, original))

private fun textFieldValueByTypeLcidSourceOriginal(callback: Callback, raw: String, fieldType: Int, lcid: Int, source: Int, original: Boolean) = callback.success(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid, source, original))

private fun textFieldByType(callback: Callback, raw: String, fieldType: Int) = callback.success(generateDocumentReaderTextField(fromRawResults(raw).getTextFieldByType(fieldType), context))

private fun textFieldByTypeLcid(callback: Callback, raw: String, fieldType: Int, lcid: Int) = callback.success(generateDocumentReaderTextField(fromRawResults(raw).getTextFieldByType(fieldType, lcid), context))

private fun graphicFieldByTypeSource(callback: Callback, raw: String, fieldType: Int, source: Int) = callback.success(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source), context))

private fun graphicFieldByTypeSourcePageIndex(callback: Callback, raw: String, fieldType: Int, source: Int, pageIndex: Int) = callback.success(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source, pageIndex), context))

private fun graphicFieldByTypeSourcePageIndexLight(callback: Callback, raw: String, fieldType: Int, source: Int, pageIndex: Int, light: Int) = callback.success(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source, pageIndex, light), context))

private fun graphicFieldImageByType(callback: Callback, raw: String, fieldType: Int) = callback.success(Convert.bitmapToBase64(fromRawResults(raw).getGraphicFieldImageByType(fieldType)))

private fun graphicFieldImageByTypeSource(callback: Callback, raw: String, fieldType: Int, source: Int) = callback.success(Convert.bitmapToBase64(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source)))

private fun graphicFieldImageByTypeSourcePageIndex(callback: Callback, raw: String, fieldType: Int, source: Int, pageIndex: Int) = callback.success(Convert.bitmapToBase64(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source, pageIndex)))

private fun graphicFieldImageByTypeSourcePageIndexLight(callback: Callback, raw: String, fieldType: Int, source: Int, pageIndex: Int, light: Int) = callback.success(Convert.bitmapToBase64(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source, pageIndex, light)))

private fun containers(callback: Callback, raw: String, resultType: JSONArray) = callback.success(fromRawResults(raw).getContainers(intArrayFromJSON(resultType)!!))

private fun encryptedContainers(callback: Callback, raw: String) = callback.success(fromRawResults(raw).encryptedContainers)

private fun getTranslation(callback: Callback, className: String, value: Int) = when (className) {
    "RFIDErrorCodes" -> callback.success(eRFID_ErrorCodes.getTranslation(context, value))
    "LDSParsingErrorCodes" -> callback.success(eLDS_ParsingErrorCodes.getTranslation(context, value))
    "LDSParsingNotificationCodes" -> callback.success(eLDS_ParsingNotificationCodes.getTranslation(context, value))
    "ImageQualityCheckType" -> callback.success(eImageQualityCheckType.getTranslation(context, value))
    "RFIDDataFileType" -> callback.success(eRFID_DataFile_Type.getTranslation(context, value))
    "VisualFieldType" -> callback.success(eVisualFieldType.getTranslation(context, value))
    "LCID" -> callback.success(LCID.getTranslation(context, value))
    else -> null
}

private val onCompleted = { action: Int, results: DocumentReaderResults?, error: DocumentReaderException? ->
    sendEvent(eventCompletion, generateCompletion(action, results, error, context))
    if ((action == DocReaderAction.ERROR) || (action == DocReaderAction.CANCEL) || ((action == DocReaderAction.COMPLETE) && (results?.rfidResult == 1)))
        stopBackgroundRFID()
}

private val completion = IDocumentReaderCompletion { a: Int, r: DocumentReaderResults?, e: DocumentReaderException? -> onCompleted(a, r, e) }

private val rfidReaderCompletion = object : IRfidReaderCompletion() {
    override fun onCompleted(a: Int, r: DocumentReaderResults?, e: DocumentReaderException?): Unit = onCompleted(a, r, e)
    override fun onChipDetected(): Unit = sendEvent(rfidOnChipDetectedEvent)
    override fun onRetryReadChip(error: DocReaderRfidException) = sendEvent(rfidOnRetryReadChipEvent, generateRegulaException(error))
    override fun onProgress(notification: DocumentReaderNotification) = sendEvent(rfidOnProgressEvent, generateDocumentReaderNotification(notification))
}

private fun getPrepareCompletion(callback: Callback) = object : IDocumentReaderPrepareCompletion {
    override fun onPrepareProgressChanged(progress: Int) {
        if (progress != databaseDownloadProgress) {
            sendEvent(eventDatabaseProgress, progress)
            databaseDownloadProgress = progress
        }
    }

    override fun onPrepareCompleted(s: Boolean, e: DocumentReaderException?) = callback.success(generateSuccessCompletion(s, e))
}

private fun getInitCompletion(callback: Callback) = IDocumentReaderInitCompletion { success: Boolean, error: DocumentReaderException? ->
    if (success) {
        DocumentReader.Instance().setVideoEncoderCompletion { _: String?, file: File -> sendEvent(eventVideoEncoderCompletion, file.path) }
        DocumentReader.Instance().setOnClickListener { view: View -> sendEvent(onCustomButtonTappedEvent, view.tag) }
        setupScaleType()
    }
    callback.success(generateSuccessCompletion(success, error))
}

var rfidReaderRequestType: Int = RfidReaderRequest.NULL

val rfidReaderRequest: IRfidReaderRequest? = if (rfidReaderRequestType == RfidReaderRequest.NULL) null else {
    object : IRfidReaderRequest {
        override fun onRequestPACertificates(serialNumber: ByteArray?, issuer: PAResourcesIssuer?, completion: IRfidPKDCertificateCompletion) {
            if (rfidReaderRequestType == RfidReaderRequest.FULL) {
                paCertificateCompletion = completion
                sendEvent(eventPACertificateCompletion, generatePACertificateCompletion(serialNumber, issuer))
            }
            if (rfidReaderRequestType == RfidReaderRequest.NO_PA) {
                paCertificateCompletion = null
                completion.onCertificatesReceived(null)
            }
        }

        override fun onRequestTACertificates(keyCAR: String?, completion: IRfidPKDCertificateCompletion) {
            taCertificateCompletion = completion
            sendEvent(eventTACertificateCompletion, keyCAR)
        }

        override fun onRequestTASignature(challenge: TAChallenge?, completion: IRfidTASignatureCompletion) {
            taSignatureCompletion = completion
            sendEvent(eventTASignatureCompletion, generateTAChallenge(challenge))
        }
    }
}

// On native side we set RfidReaderRequest and allow user to ignore it
// But if we set it and ignore, rfid will stop
// So depending on how much of this callback the user wants to ignore, we
// set null, full callback or callback with ignored onRequestPACertificates
object RfidReaderRequest {
    const val NULL: Int = 0
    const val NO_PA: Int = 1
    const val FULL: Int = 2
}

// Weak references
var localizationCallbacks: LocalizationCallbacks? = null