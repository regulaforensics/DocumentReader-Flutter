@file:SuppressLint("MissingPermission")

package com.regula.plugin.documentreader

import android.annotation.SuppressLint
import android.app.PendingIntent
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NfcAdapter
import android.nfc.tech.IsoDep
import android.os.Build
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import com.regula.common.LocalizationCallbacks
import com.regula.documentreader.api.DocumentReader.Instance
import com.regula.documentreader.api.completions.IDocumentReaderCompletion
import com.regula.documentreader.api.completions.IDocumentReaderInitCompletion
import com.regula.documentreader.api.completions.IDocumentReaderPrepareDbCompletion
import com.regula.documentreader.api.completions.model.PrepareProgress
import com.regula.documentreader.api.completions.rfid.IRfidPKDCertificateCompletion
import com.regula.documentreader.api.completions.rfid.IRfidReaderCompletion
import com.regula.documentreader.api.completions.rfid.IRfidReaderRequest
import com.regula.documentreader.api.completions.rfid.IRfidTASignatureCompletion
import com.regula.documentreader.api.completions.rfid.certificates.IRfidPACertificates
import com.regula.documentreader.api.completions.rfid.certificates.IRfidTACertificates
import com.regula.documentreader.api.completions.rfid.certificates.IRfidTASignature
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
import com.regula.documentreader.api.results.DocumentReaderNotification
import com.regula.documentreader.api.results.DocumentReaderResults
import com.regula.documentreader.api.results.DocumentReaderResults.fromRawResults
import com.regula.documentreader.api.results.DocumentReaderScenario
import org.json.JSONArray
import org.json.JSONObject
import com.regula.plugin.documentreader.Convert.toBase64
import com.regula.plugin.documentreader.Convert.toByteArray

fun methodCall(method: String, callback: (Any?) -> Unit): Any? = when (method) {
    "getDocumentReaderIsReady" -> getDocumentReaderIsReady(callback)
    "getDocumentReaderStatus" -> getDocumentReaderStatus(callback)
    "getRfidSessionStatus" -> getRfidSessionStatus(callback)
    "setRfidSessionStatus" -> setRfidSessionStatus()
    "getTag" -> getTag(callback)
    "setTag" -> setTag(argsNullable(0))
    "getTenant" -> getTenant(callback)
    "setTenant" -> setTenant(argsNullable(0))
    "getEnv" -> getEnv(callback)
    "setEnv" -> setEnv(argsNullable(0))
    "getLocale" -> getLocale(callback)
    "setLocale" -> setLocale(argsNullable(0))
    "getFunctionality" -> getFunctionality(callback)
    "setFunctionality" -> setFunctionality(args(0))
    "getProcessParams" -> getProcessParams(callback)
    "setProcessParams" -> setProcessParams(args(0))
    "getCustomization" -> getCustomization(callback)
    "setCustomization" -> setCustomization(args(0))
    "getRfidScenario" -> getRfidScenario(callback)
    "setRfidScenario" -> setRfidScenario(args(0))
    "resetConfiguration" -> resetConfiguration()
    "initialize" -> initialize(callback, args(0))
    "initializeReader" -> initialize(callback, args(0)) // deprecated
    "initializeReaderWithBleDeviceConfig" -> initializeReaderWithBleDeviceConfig(callback, args(0)) // deprecated
    "deinitialize" -> deinitialize()
    "prepareDatabase" -> prepareDatabase(callback, args(0))
    "removeDatabase" -> removeDatabase(callback)
    "runAutoUpdate" -> runAutoUpdate(callback, args(0))
    "cancelDBUpdate" -> cancelDBUpdate(callback)
    "checkDatabaseUpdate" -> checkDatabaseUpdate(callback, args(0))
    "scan" -> scan(args(0))
    "startScanner" -> startScanner(args(0))
    "recognize" -> recognize(args(0))
    "startNewPage" -> startNewPage()
    "stopScanner" -> stopScanner()
    "startRFIDReader" -> startRFIDReader(args(0), args(1), args(2))
    "readRFID" -> readRFID(args(0), args(1), args(2))
    "stopRFIDReader" -> stopRFIDReader()
    "providePACertificates" -> providePACertificates(argsNullable(0))
    "provideTACertificates" -> provideTACertificates(argsNullable(0))
    "provideTASignature" -> provideTASignature(args(0))
    "setTCCParams" -> setTCCParams(callback, args(0))
    "addPKDCertificates" -> addPKDCertificates(args(0))
    "clearPKDCertificates" -> clearPKDCertificates()
    "startNewSession" -> startNewSession()
    "connectBluetoothDevice" -> connectBluetoothDevice(args(0), callback)
    "btDeviceRequestFlashing" -> btDeviceRequestFlashing()
    "btDeviceRequestFlashingFullIR" -> btDeviceRequestFlashingFullIR()
    "btDeviceRequestTurnOffAll" -> btDeviceRequestTurnOffAll()
    "setLocalizationDictionary" -> setLocalizationDictionary(args(0))
    "getLicense" -> getLicense(callback)
    "getAvailableScenarios" -> getAvailableScenarios(callback)
    "getIsRFIDAvailableForUse" -> getIsRFIDAvailableForUse(callback)
    "isAuthenticatorAvailableForUse" -> isAuthenticatorAvailableForUse(callback)
    "isAuthenticatorRFIDAvailableForUse" -> isAuthenticatorRFIDAvailableForUse(callback)
    "getDocReaderVersion" -> getDocReaderVersion(callback)
    "getDocReaderDocumentsDatabase" -> getDocReaderDocumentsDatabase(callback)
    "textFieldValueByType" -> textFieldValueByType(callback, args(0), args(1))
    "textFieldValueByTypeLcid" -> textFieldValueByTypeLcid(callback, args(0), args(1), args(2))
    "textFieldValueByTypeSource" -> textFieldValueByTypeSource(callback, args(0), args(1), args(2))
    "textFieldValueByTypeLcidSource" -> textFieldValueByTypeLcidSource(callback, args(0), args(1), args(2), args(3))
    "textFieldValueByTypeSourceOriginal" -> textFieldValueByTypeSourceOriginal(callback, args(0), args(1), args(2), args(3))
    "textFieldValueByTypeLcidSourceOriginal" -> textFieldValueByTypeLcidSourceOriginal(callback, args(0), args(1), args(2), args(3), args(4))
    "textFieldByType" -> textFieldByType(callback, args(0), args(1))
    "textFieldByTypeLcid" -> textFieldByTypeLcid(callback, args(0), args(1), args(2))
    "graphicFieldByTypeSource" -> graphicFieldByTypeSource(callback, args(0), args(1), args(2))
    "graphicFieldByTypeSourcePageIndex" -> graphicFieldByTypeSourcePageIndex(callback, args(0), args(1), args(2), args(3))
    "graphicFieldByTypeSourcePageIndexLight" -> graphicFieldByTypeSourcePageIndexLight(callback, args(0), args(1), args(2), args(3), args(4))
    "graphicFieldImageByType" -> graphicFieldImageByType(callback, args(0), args(1))
    "graphicFieldImageByTypeSource" -> graphicFieldImageByTypeSource(callback, args(0), args(1), args(2))
    "graphicFieldImageByTypeSourcePageIndex" -> graphicFieldImageByTypeSourcePageIndex(callback, args(0), args(1), args(2), args(3))
    "graphicFieldImageByTypeSourcePageIndexLight" -> graphicFieldImageByTypeSourcePageIndexLight(callback, args(0), args(1), args(2), args(3), args(4))
    "containers" -> containers(callback, args(0), args(1))
    "encryptedContainers" -> encryptedContainers(callback, args(0))
    "finalizePackage" -> finalizePackage(callback)
    "endBackendTransaction" -> endBackendTransaction()
    "getTranslation" -> getTranslation(callback, args(0), args(1))
    // remove after finishing old dr support
    "processParamsSetCheckFilter" -> processParamsSetCheckFilter(args(0), args(1))
    "processParamsRemoveCheckFilter" -> processParamsRemoveCheckFilter(args(0))
    "processParamsClearCheckFilter" -> processParamsClearCheckFilter()
    "authenticityParamsSetCheckFilter" -> authenticityParamsSetCheckFilter(args(0), args(1))
    "authenticityParamsRemoveCheckFilter" -> authenticityParamsRemoveCheckFilter(args(0))
    "authenticityParamsClearCheckFilter" -> authenticityParamsClearCheckFilter()
    "livenessParamsSetCheckFilter" -> livenessParamsSetCheckFilter(args(0), args(1))
    "livenessParamsRemoveCheckFilter" -> livenessParamsRemoveCheckFilter(args(0))
    "livenessParamsClearCheckFilter" -> livenessParamsClearCheckFilter()
    else -> Unit
}

inline fun <reified T> args(index: Int) = argsNullable<T>(index)!!
typealias Callback = (Any?) -> Unit

const val completionEvent = "completion"
const val databaseProgressEvent = "database_progress"

const val rfidOnProgressEvent = "rfidOnProgressCompletion"
const val rfidOnChipDetectedEvent = "rfidOnChipDetectedEvent"
const val rfidOnRetryReadChipEvent = "rfidOnRetryReadChipEvent"

const val paCertificateCompletionEvent = "pa_certificate_completion"
const val taCertificateCompletionEvent = "ta_certificate_completion"
const val taSignatureCompletionEvent = "ta_signature_completion"

const val videoEncoderCompletionEvent = "video_encoder_completion"
const val onCustomButtonTappedEvent = "onCustomButtonTappedEvent"

fun getDocumentReaderIsReady(callback: Callback) = callback(Instance().isReady)

fun getDocumentReaderStatus(callback: Callback) = callback(Instance().status)

fun getRfidSessionStatus(iosOnly: Callback) = iosOnly(null)

fun setRfidSessionStatus() = Unit

fun getTag(callback: Callback) = callback(Instance().tag)

fun setTag(tag: String?) = tag.let { Instance().tag = it }

fun getTenant(callback: Callback) = callback(Instance().tenant)

fun setTenant(tag: String?) = tag.let { Instance().tenant = it }

fun getEnv(callback: Callback) = callback(Instance().env)

fun setEnv(tag: String?) = tag.let { Instance().env = it }

fun getLocale(callback: Callback) = callback(Instance().locale)

fun setLocale(locale: String?) = locale.let { Instance().locale = it }

fun getFunctionality(callback: Callback) = callback(getFunctionality(Instance().functionality()))

fun setFunctionality(functionality: JSONObject) = setFunctionality(Instance().functionality(), functionality)

fun getProcessParams(callback: Callback) = callback(getProcessParams(Instance().processParams()))

fun setProcessParams(processParams: JSONObject) = setProcessParams(Instance().processParams(), processParams)

fun getCustomization(callback: Callback) = callback(getCustomization(Instance().customization()))

fun setCustomization(customization: JSONObject) = setCustomization(Instance().customization(), customization)

fun getRfidScenario(callback: Callback) = callback(getRfidScenario(Instance().rfidScenario()))

fun setRfidScenario(rfidScenario: JSONObject) = setRfidScenario(Instance().rfidScenario(), rfidScenario)

fun resetConfiguration() = Instance().resetConfiguration()

fun initialize(callback: Callback, config: JSONObject) =
    if (config.getBooleanOrNull("useBleDevice") != true)
        Instance().initializeReader(context, initConfigFromJSON(config), initCompletion(callback))
    else
        Instance().initializeReader(context, initBleDeviceConfigFromJSON(config), initCompletion(callback))

// deprecated
fun initializeReaderWithBleDeviceConfig(callback: Callback, config: JSONObject) = Instance().initializeReader(context, initBleDeviceConfigFromJSON(config), initCompletion(callback))

fun deinitialize() = Instance().deinitializeReader()

fun prepareDatabase(callback: Callback, databaseID: String) = Instance().prepareDatabase(
    context,
    databaseID,
    prepareCompletion(callback)
)

fun removeDatabase(callback: Callback) = callback(Instance().removeDatabase(context))

fun runAutoUpdate(callback: Callback, databaseID: String) = Instance().runAutoUpdate(
    context,
    databaseID,
    prepareCompletion(callback)
)

fun cancelDBUpdate(callback: Callback) = callback(Instance().cancelDBUpdate(context))

fun checkDatabaseUpdate(callback: Callback, databaseID: String) = Instance().checkDatabaseUpdate(
    context,
    databaseID
) { callback(generateDocReaderDocumentsDatabase(it)) }

@Suppress("DEPRECATION")
fun scan(config: JSONObject) {
    stopBackgroundRFID()
    Instance().showScanner(context, scannerConfigFromJSON(config), IDocumentReaderCompletion(completion))
}

fun startScanner(config: JSONObject) {
    stopBackgroundRFID()
    Instance().startScanner(context, scannerConfigFromJSON(config), IDocumentReaderCompletion(completion))
}

fun recognize(config: JSONObject) {
    stopBackgroundRFID()
    Instance().recognize(recognizeConfigFromJSON(config), IDocumentReaderCompletion(completion))
}

fun startNewPage() = Instance().startNewPage()

fun stopScanner() = Instance().stopScanner(context)

fun startRFIDReader(onRequestPACertificates: Boolean, onRequestTACertificates: Boolean, onRequestTASignature: Boolean) {
    stopBackgroundRFID()
    requestType = RfidReaderRequestType(
        onRequestPACertificates,
        onRequestTACertificates,
        onRequestTASignature
    )
    Instance().startRFIDReader(context, rfidReaderCompletion, requestType.getRfidReaderRequest())
}

fun readRFID(onRequestPACertificates: Boolean, onRequestTACertificates: Boolean, onRequestTASignature: Boolean) {
    requestType = RfidReaderRequestType(
        onRequestPACertificates,
        onRequestTACertificates,
        onRequestTASignature
    )
    startForegroundDispatch()
}

fun stopRFIDReader() {
    Instance().stopRFIDReader(context)
    stopBackgroundRFID()
}

fun providePACertificates(certificates: JSONArray?) = paCertificateCompletion.onCertificatesReceived(
    certificates.toArray(::pkdCertificateFromJSON)
)

fun provideTACertificates(certificates: JSONArray?) = taCertificateCompletion.onCertificatesReceived(
    certificates.toArray(::pkdCertificateFromJSON)
)

fun provideTASignature(signature: String?) = taSignatureCompletion.onSignatureReceived(
    signature.toByteArray()
)

fun setTCCParams(callback: Callback, params: JSONObject) {
    Instance().setTccParams(tccParamsFromJSON(params)) { success, error ->
        callback(generateSuccessCompletion(success, error))
    }
}

fun addPKDCertificates(certificates: JSONArray) = Instance().addPKDCertificates(
    certificates.toList(::pkdCertificateFromJSON)!!
)

fun clearPKDCertificates() = Instance().clearPKDCertificates()

fun startNewSession() = Instance().startNewSession()

fun setLocalizationDictionary(dictionary: JSONObject) {
    localizationCallbacks = LocalizationCallbacks { if (dictionary.has(it)) dictionary.getString(it) else null }
    Instance().setLocalizationCallback(localizationCallbacks)
}

fun getLicense(callback: Callback) = callback(generateLicense(Instance().license()))

fun getAvailableScenarios(callback: Callback) {
    val scenarios: MutableList<DocumentReaderScenario> = ArrayList()
    for (scenario: DocumentReaderScenario in Instance().availableScenarios)
        scenarios.add(CoreScenarioUtil.getScenario(scenario.name))
    callback(scenarios.toJsonNullable(::generateDocumentReaderScenario))
}

fun getIsRFIDAvailableForUse(callback: Callback) = callback(Instance().isRFIDAvailableForUse)

fun isAuthenticatorAvailableForUse(callback: Callback) = callback(Instance().isAuthenticatorAvailableForUse)

fun isAuthenticatorRFIDAvailableForUse(callback: Callback) = callback(Instance().isAuthenticatorRFIDAvailableForUse)

fun getDocReaderVersion(callback: Callback) = callback(generateDocReaderVersion(Instance().version))

fun getDocReaderDocumentsDatabase(callback: Callback) = callback(Instance().version?.let {
    generateDocReaderDocumentsDatabase(it.database)
})

fun finalizePackage(callback: Callback) = Instance().finalizePackage { action, info, error ->
    callback(generateFinalizePackageCompletion(action, info, error))
}

fun endBackendTransaction() = Instance().endBackendTransaction()

fun textFieldValueByType(
    callback: Callback,
    raw: String,
    fieldType: Int
) = callback(fromRawResults(raw).getTextFieldValueByType(fieldType))

fun textFieldValueByTypeLcid(
    callback: Callback,
    raw: String,
    fieldType: Int,
    lcid: Int
) = callback(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid))

fun textFieldValueByTypeSource(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int
) = callback(fromRawResults(raw).getTextFieldValueByTypeAndSource(fieldType, source))

fun textFieldValueByTypeLcidSource(
    callback: Callback,
    raw: String,
    fieldType: Int,
    lcid: Int,
    source: Int
) = callback(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid, source))

fun textFieldValueByTypeSourceOriginal(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int,
    original: Boolean
) = callback(fromRawResults(raw).getTextFieldValueByTypeAndSource(fieldType, source, original))

fun textFieldValueByTypeLcidSourceOriginal(
    callback: Callback,
    raw: String,
    fieldType: Int,
    lcid: Int,
    source: Int,
    original: Boolean
) = callback(fromRawResults(raw).getTextFieldValueByType(fieldType, lcid, source, original))

fun textFieldByType(
    callback: Callback,
    raw: String,
    fieldType: Int
) = callback(generateDocumentReaderTextField(fromRawResults(raw).getTextFieldByType(fieldType)))

fun textFieldByTypeLcid(
    callback: Callback,
    raw: String,
    fieldType: Int,
    lcid: Int
) = callback(generateDocumentReaderTextField(fromRawResults(raw).getTextFieldByType(fieldType, lcid)))

fun graphicFieldByTypeSource(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int
) = callback(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source)))

fun graphicFieldByTypeSourcePageIndex(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int,
    pageIndex: Int
) = callback(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source, pageIndex)))

fun graphicFieldByTypeSourcePageIndexLight(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int,
    pageIndex: Int,
    light: Int
) = callback(generateDocumentReaderGraphicField(fromRawResults(raw).getGraphicFieldByType(fieldType, source, pageIndex, light)))

fun graphicFieldImageByType(
    callback: Callback,
    raw: String,
    fieldType: Int
) = callback(fromRawResults(raw).getGraphicFieldImageByType(fieldType).toBase64())

fun graphicFieldImageByTypeSource(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int
) = callback(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source).toBase64())

fun graphicFieldImageByTypeSourcePageIndex(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int,
    pageIndex: Int
) = callback(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source, pageIndex).toBase64())

fun graphicFieldImageByTypeSourcePageIndexLight(
    callback: Callback,
    raw: String,
    fieldType: Int,
    source: Int,
    pageIndex: Int,
    light: Int
) = callback(fromRawResults(raw).getGraphicFieldImageByType(fieldType, source, pageIndex, light).toBase64())

fun containers(
    callback: Callback,
    raw: String,
    resultType: JSONArray
) = callback(fromRawResults(raw).getContainers(resultType.toIntArray()!!))

fun encryptedContainers(
    callback: Callback,
    raw: String
) = callback(fromRawResults(raw).encryptedContainers)

fun getTranslation(callback: Callback, className: String, value: Int) = when (className) {
    "RFIDErrorCodes" -> callback(eRFID_ErrorCodes.getTranslation(context, value))
    "LDSParsingErrorCodes" -> callback(eLDS_ParsingErrorCodes.getTranslation(context, value))
    "LDSParsingNotificationCodes" -> callback(eLDS_ParsingNotificationCodes.getTranslation(context, value))
    "ImageQualityCheckType" -> callback(eImageQualityCheckType.getTranslation(context, value))
    "RFIDDataFileType" -> callback(eRFID_DataFile_Type.getTranslation(context, value))
    "VisualFieldType" -> callback(eVisualFieldType.getTranslation(context, value))
    "LCID" -> callback(LCID.getTranslation(context, value))
    else -> Unit
}

// remove after finishing old dr support
fun processParamsSetCheckFilter(checkType: String, filter: JSONObject) = Instance().processParams().setCheckFilter(checkType, filterObjectFromJSON(filter))
fun processParamsRemoveCheckFilter(checkType: String) = Instance().processParams().removeCheckFilter(checkType)
fun processParamsClearCheckFilter() = Instance().processParams().clearCheckFilter()

fun authenticityParamsSetCheckFilter(checkType: String, filter: JSONObject) = Instance().processParams().authenticityParams?.setCheckFilter(checkType, filterObjectFromJSON(filter))
fun authenticityParamsRemoveCheckFilter(checkType: String) = Instance().processParams().authenticityParams?.removeCheckFilter(checkType)
fun authenticityParamsClearCheckFilter() = Instance().processParams().authenticityParams?.clearCheckFilter()

fun livenessParamsSetCheckFilter(checkType: String, filter: JSONObject) = Instance().processParams().authenticityParams?.livenessParams?.setCheckFilter(checkType, filterObjectFromJSON(filter))
fun livenessParamsRemoveCheckFilter(checkType: String) = Instance().processParams().authenticityParams?.livenessParams?.removeCheckFilter(checkType)
fun livenessParamsClearCheckFilter() = Instance().processParams().authenticityParams?.livenessParams?.clearCheckFilter()

// --------------------------------------------------------------------------------------------------------------------------

val completion = { action: Int, results: DocumentReaderResults?, error: DocumentReaderException? ->
    sendEvent(completionEvent, generateCompletion(action, results, error))
    if ((action == DocReaderAction.ERROR) ||
        (action == DocReaderAction.CANCEL) ||
        ((action == DocReaderAction.COMPLETE) && (results?.rfidResult == 1))
    ) stopBackgroundRFID()
}

val rfidReaderCompletion = object : IRfidReaderCompletion() {
    override fun onCompleted(action: Int, results: DocumentReaderResults?, error: DocumentReaderException?): Unit = completion(action, results, error)
    override fun onChipDetected(): Unit = sendEvent(rfidOnChipDetectedEvent)
    override fun onRetryReadChip(error: DocReaderRfidException) = sendEvent(rfidOnRetryReadChipEvent, generateRegulaException(error))
    override fun onProgress(notification: DocumentReaderNotification) = sendEvent(rfidOnProgressEvent, generateDocumentReaderNotification(notification))
}

fun prepareCompletion(callback: Callback) = object : IDocumentReaderPrepareDbCompletion() {
    override fun onPrepareProgressChanged(progress: PrepareProgress) = sendEvent(databaseProgressEvent, generatePrepareProgress(progress))
    override fun onPrepareCompleted(success: Boolean, error: DocumentReaderException?) = callback(generateSuccessCompletion(success, error))
}

fun initCompletion(callback: Callback) = IDocumentReaderInitCompletion { success, error ->
    if (success) {
        Instance().setVideoEncoderCompletion { _, file -> sendEvent(videoEncoderCompletionEvent, file.path) }
        Instance().setOnClickListener { sendEvent(onCustomButtonTappedEvent, it.tag) }
    }
    callback(generateSuccessCompletion(success, error))
}

lateinit var paCertificateCompletion: IRfidPKDCertificateCompletion
lateinit var taCertificateCompletion: IRfidPKDCertificateCompletion
lateinit var taSignatureCompletion: IRfidTASignatureCompletion

class RfidReaderRequestType(
    val doPACertificates: Boolean,
    val doTACertificates: Boolean,
    val doTASignature: Boolean
) {
    private val onRequestPACertificates = IRfidPACertificates { serialNumber, issuer, completion ->
        paCertificateCompletion = completion
        sendEvent(paCertificateCompletionEvent, generatePACertificateCompletion(serialNumber, issuer))
    }
    private val onRequestTACertificates = IRfidTACertificates { keyCAR, completion ->
        taCertificateCompletion = completion
        sendEvent(taCertificateCompletionEvent, keyCAR)
    }
    private val onRequestTASignature = IRfidTASignature { challenge, completion ->
        taSignatureCompletion = completion
        sendEvent(taSignatureCompletionEvent, generateTAChallenge(challenge))
    }

    fun getRfidReaderRequest(): IRfidReaderRequest? = when {
        !doPACertificates && !doTACertificates && doTASignature -> IRfidReaderRequest(onRequestTASignature)
        !doPACertificates && doTACertificates && !doTASignature -> IRfidReaderRequest(onRequestTACertificates)
        !doPACertificates && doTACertificates && doTASignature -> IRfidReaderRequest(onRequestTACertificates, onRequestTASignature)
        doPACertificates && !doTACertificates && !doTASignature -> IRfidReaderRequest(onRequestPACertificates)
        doPACertificates && !doTACertificates && doTASignature -> IRfidReaderRequest(onRequestPACertificates, onRequestTASignature)
        doPACertificates && doTACertificates && !doTASignature -> IRfidReaderRequest(onRequestPACertificates, onRequestTACertificates)
        doPACertificates && doTACertificates && doTASignature -> IRfidReaderRequest(onRequestPACertificates, onRequestTACertificates, onRequestTASignature)
        else -> null
    }
}

var requestType = RfidReaderRequestType(
    doPACertificates = false,
    doTACertificates = false,
    doTASignature = false
)

@Suppress("DEPRECATION", "MissingPermission")
fun newIntent(intent: Intent): Boolean {
    if (intent.action != NfcAdapter.ACTION_TECH_DISCOVERED) return false
    Instance().readRFID(
        IsoDep.get(intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)),
        rfidReaderCompletion,
        requestType.getRfidReaderRequest()
    )
    return true
}

var backgroundRFIDEnabled = false
lateinit var lifecycleObserver: LifecycleEventObserver

fun startForegroundDispatch() {
    backgroundRFIDEnabled = true
    val filters: Array<IntentFilter?> = arrayOfNulls(1)
    filters[0] = IntentFilter()
    filters[0]!!.addAction(NfcAdapter.ACTION_TECH_DISCOVERED)
    filters[0]!!.addCategory(Intent.CATEGORY_DEFAULT)
    val techList = arrayOf(arrayOf("android.nfc.tech.IsoDep"))
    val intent = Intent(activity, activity.javaClass)
    val flag = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) PendingIntent.FLAG_MUTABLE else 0
    val pendingIntent = PendingIntent.getActivity(activity, 0, intent, flag)

    if (lifecycle.currentState.isAtLeast(Lifecycle.State.RESUMED))
        enableForegroundDispatch(pendingIntent, filters, techList)
    lifecycleObserver = LifecycleEventObserver { _, event ->
        if (backgroundRFIDEnabled) when (event) {
            Lifecycle.Event.ON_RESUME -> enableForegroundDispatch(pendingIntent, filters, techList)
            Lifecycle.Event.ON_PAUSE -> disableForegroundDispatch()
            else -> Unit
        }
    }
    activity.runOnUiThread { lifecycle.addObserver(lifecycleObserver) }
}

fun enableForegroundDispatch(
    pendingIntent: PendingIntent,
    filters: Array<IntentFilter?>,
    techList: Array<Array<String>>
) = NfcAdapter.getDefaultAdapter(context).enableForegroundDispatch(activity, pendingIntent, filters, techList)

fun disableForegroundDispatch() = NfcAdapter.getDefaultAdapter(activity).disableForegroundDispatch(activity)

fun stopBackgroundRFID() {
    if (!backgroundRFIDEnabled) return
    backgroundRFIDEnabled = false
    if (lifecycle.currentState.isAtLeast(Lifecycle.State.RESUMED))
        disableForegroundDispatch()
    activity.runOnUiThread { lifecycle.removeObserver(lifecycleObserver) }
}

// Weak references
lateinit var localizationCallbacks: LocalizationCallbacks
