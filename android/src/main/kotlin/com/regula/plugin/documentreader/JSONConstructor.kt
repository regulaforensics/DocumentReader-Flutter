@file:SuppressLint("MissingPermission")
@file:Suppress("unused", "EnumValuesSoftDeprecate", "UNCHECKED_CAST")

package com.regula.plugin.documentreader

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.Matrix
import android.graphics.Rect
import android.graphics.Typeface
import android.os.Build
import android.util.Pair
import com.regula.common.exception.RegulaException
import com.regula.documentreader.api.License
import com.regula.documentreader.api.completions.model.PrepareProgress
import com.regula.documentreader.api.config.RecognizeConfig
import com.regula.documentreader.api.config.ScannerConfig
import com.regula.documentreader.api.enums.BarcodeType
import com.regula.documentreader.api.enums.DocReaderAction
import com.regula.documentreader.api.enums.PDF417Info
import com.regula.documentreader.api.enums.eGraphicFieldType
import com.regula.documentreader.api.enums.eMDLDeviceRetrieval
import com.regula.documentreader.api.enums.eMDLDocRequestPreset
import com.regula.documentreader.api.enums.eMDLIntentToRetain
import com.regula.documentreader.api.enums.eRFID_DataFile_Type
import com.regula.documentreader.api.enums.eRPRM_Lights
import com.regula.documentreader.api.listener.NetworkInterceptorListener
import com.regula.documentreader.api.params.AuthenticityParams
import com.regula.documentreader.api.params.BackendProcessingConfig
import com.regula.documentreader.api.params.BleDeviceConfig
import com.regula.documentreader.api.params.DocReaderConfig
import com.regula.documentreader.api.params.FaceApiParams
import com.regula.documentreader.api.params.Functionality
import com.regula.documentreader.api.params.ImageInputData
import com.regula.documentreader.api.params.ImageQA
import com.regula.documentreader.api.params.ImageQA.GlaresCheckParams
import com.regula.documentreader.api.params.LivenessParams
import com.regula.documentreader.api.params.OnlineProcessingConfig
import com.regula.documentreader.api.params.ParamsCustomization
import com.regula.documentreader.api.params.ProcessParam
import com.regula.documentreader.api.params.RfidScenario
import com.regula.documentreader.api.params.mdl.DataRetrieval
import com.regula.documentreader.api.params.mdl.DeviceEngagement
import com.regula.documentreader.api.params.mdl.DeviceRetrievalMethod
import com.regula.documentreader.api.params.mdl.DocumentRequest18013MDL
import com.regula.documentreader.api.params.mdl.DocumentRequestMDL
import com.regula.documentreader.api.params.mdl.NameSpaceMDL
import com.regula.documentreader.api.params.rfid.PKDCertificate
import com.regula.documentreader.api.params.rfid.RFIDParams
import com.regula.documentreader.api.params.rfid.TccParams
import com.regula.documentreader.api.params.rfid.authorization.PAAttribute
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge
import com.regula.documentreader.api.params.rfid.dg.DTCDataGroup
import com.regula.documentreader.api.params.rfid.dg.EDLDataGroups
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups
import com.regula.documentreader.api.results.BytesData
import com.regula.documentreader.api.results.Coordinate
import com.regula.documentreader.api.results.DocFeature
import com.regula.documentreader.api.results.DocReaderDocumentsDatabase
import com.regula.documentreader.api.results.DocReaderFieldRect
import com.regula.documentreader.api.results.DocReaderVersion
import com.regula.documentreader.api.results.DocumentReaderBarcodeField
import com.regula.documentreader.api.results.DocumentReaderBarcodeResult
import com.regula.documentreader.api.results.DocumentReaderComparison
import com.regula.documentreader.api.results.DocumentReaderDocumentType
import com.regula.documentreader.api.results.DocumentReaderGraphicField
import com.regula.documentreader.api.results.DocumentReaderGraphicResult
import com.regula.documentreader.api.results.DocumentReaderNotification
import com.regula.documentreader.api.results.DocumentReaderResults
import com.regula.documentreader.api.results.DocumentReaderResultsStatus
import com.regula.documentreader.api.results.DocumentReaderResultsStatus.DetailsOptical
import com.regula.documentreader.api.results.DocumentReaderResultsStatus.DetailsRFID
import com.regula.documentreader.api.results.DocumentReaderResultsStatus.DetailsAge
import com.regula.documentreader.api.results.DocumentReaderRfidOrigin
import com.regula.documentreader.api.results.DocumentReaderScenario
import com.regula.documentreader.api.results.DocumentReaderSymbol
import com.regula.documentreader.api.results.DocumentReaderTextField
import com.regula.documentreader.api.results.DocumentReaderTextResult
import com.regula.documentreader.api.results.DocumentReaderTextSource
import com.regula.documentreader.api.results.DocumentReaderValidity
import com.regula.documentreader.api.results.DocumentReaderValue
import com.regula.documentreader.api.results.ElementPosition
import com.regula.documentreader.api.results.ImageQuality
import com.regula.documentreader.api.results.ImageQualityGroup
import com.regula.documentreader.api.results.TransactionInfo
import com.regula.documentreader.api.results.VDSData
import com.regula.documentreader.api.results.VDSNCData
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityCheck
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityElement
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityResult
import com.regula.documentreader.api.results.rfid.AccessControlProcedureType
import com.regula.documentreader.api.results.rfid.Application
import com.regula.documentreader.api.results.rfid.Attribute
import com.regula.documentreader.api.results.rfid.Authority
import com.regula.documentreader.api.results.rfid.CardProperties
import com.regula.documentreader.api.results.rfid.CertificateChain
import com.regula.documentreader.api.results.rfid.CertificateData
import com.regula.documentreader.api.results.rfid.DataField
import com.regula.documentreader.api.results.rfid.Extension
import com.regula.documentreader.api.results.rfid.File
import com.regula.documentreader.api.results.rfid.FileData
import com.regula.documentreader.api.results.rfid.RFIDSessionData
import com.regula.documentreader.api.results.rfid.SecurityObject
import com.regula.documentreader.api.results.rfid.SecurityObjectCertificates
import com.regula.documentreader.api.results.rfid.SignerInfo
import com.regula.documentreader.api.results.rfid.Validity
import com.regula.documentreader.api.results.rfid.Value
import org.json.JSONArray
import org.json.JSONObject
import com.regula.plugin.documentreader.Convert.toBase64
import com.regula.plugin.documentreader.Convert.toBitmap
import com.regula.plugin.documentreader.Convert.toByteArray

fun generateCompletion(action: Int, results: DocumentReaderResults?, error: RegulaException?) = mapOf(
    "action" to action,
    "results" to if (listOf(DocReaderAction.COMPLETE, DocReaderAction.MORE_PAGES_AVAILABLE, DocReaderAction.CANCEL, DocReaderAction.ERROR, DocReaderAction.TIMEOUT).contains(action)) generateDocumentReaderResults(results) else null,
    "error" to generateRegulaException(error)
).toJson()

fun generateSuccessCompletion(success: Boolean, error: RegulaException?) = mapOf(
    "success" to success,
    "error" to generateRegulaException(error)
).toJson()

fun prepareProgressFromJSON(it: JSONObject) = PrepareProgress(
    it.getInt("downloadedBytes"),
    it.getInt("totalBytes")
)

fun generatePrepareProgress(it: PrepareProgress) = mapOf(
    "downloadedBytes" to it.downloadedBytes,
    "totalBytes" to it.totalBytes,
    "progress" to it.progress
).toJson()

fun generatePACertificateCompletion(serialNumber: ByteArray?, issuer: PAResourcesIssuer?) = mapOf(
    "serialNumber" to serialNumber.toBase64(),
    "issuer" to generatePAResourcesIssuer(issuer)
).toJson()

fun generateFinalizePackageCompletion(action: Int, info: TransactionInfo?, error: RegulaException?) = mapOf(
    "action" to action,
    "info" to generateTransactionInfo(info),
    "error" to generateRegulaException(error)
).toJson()

fun regulaExceptionFromJSON(input: JSONObject?) = input?.let {
    RegulaException(
        it.optInt("code"),
        it.optString("message")
    )
}

fun generateRegulaException(input: RegulaException?) = input?.let {
    mapOf(
        "code" to it.errorCode,
        "message" to it.message
    ).toJson()
}

fun transactionInfoFromJSON(input: JSONObject?) = input?.let {
    val result = TransactionInfo()
    result.transactionId = it.getStringOrNull("transactionId")
    result.tag = it.getStringOrNull("tag")
    result.sessionLogFolder = it.getStringOrNull("sessionLogFolder")
    result
}

fun generateTransactionInfo(input: TransactionInfo?) = input?.let {
    mapOf(
        "transactionId" to it.transactionId,
        "tag" to it.tag,
        "sessionLogFolder" to it.sessionLogFolder
    ).toJson()
}

fun tccParamsFromJSON(input: JSONObject) = input.let {
    val result = TccParams()
    result.serviceUrlTA = it.getStringOrNull("serviceUrlTA")
    result.serviceUrlPA = it.getStringOrNull("serviceUrlPA")
    result.pfxCertUrl = it.getStringOrNull("pfxCertUrl")
    result.pfxPassPhrase = it.getStringOrNull("pfxPassPhrase")
    result.pfxCert = it.getStringOrNull("pfxCert").toByteArray()
    result
}

fun generateTccParams(input: TccParams?) = input?.let {
    mapOf(
        "serviceUrlTA" to it.serviceUrlTA,
        "serviceUrlPA" to it.serviceUrlPA,
        "pfxCertUrl" to it.pfxCertUrl,
        "pfxPassPhrase" to it.pfxPassPhrase,
        "pfxCert" to it.pfxCert.toBase64()
    ).toJson()
}

fun initConfigFromJSON(input: JSONObject) = input.let {
    val license = it.getString("license").toByteArray()!!
    var result = DocReaderConfig(license)
    if (it.has("customDb")) result = DocReaderConfig(license, it.getString("customDb").toByteArray()!!)
    if (it.has("databasePath")) result = DocReaderConfig(license, it.getString("databasePath"))

    if (it.has("licenseUpdate")) result.setLicenseUpdate(it.getBoolean("licenseUpdate"))
    if (it.has("delayedNNLoad")) result.isDelayedNNLoad = it.getBoolean("delayedNNLoad")
    result.licenseUpdateTimeout = it.getDoubleOrNull("licenseUpdateTimeout")
    result.blackList = it.getJSONObjectOrNull("blackList")
    result
}

fun generateInitConfig(input: DocReaderConfig?) = input?.let {
    mapOf(
        "license" to it.license.toBase64(),
        "customDb" to it.customDb.toBase64(),
        "databasePath" to it.customDbPath,
        "licenseUpdate" to it.isLicenseUpdate,
        "delayedNNLoad" to it.isDelayedNNLoad,
        "licenseUpdateTimeout" to it.licenseUpdateTimeout,
        "blackList" to it.blackList
    ).toJson()
}

fun initBleDeviceConfigFromJSON(input: JSONObject) = input.let {
    var result = BleDeviceConfig(bluetooth!!)
    if (it.has("customDb")) result = BleDeviceConfig(bluetooth!!, it.getString("customDb").toByteArray())

    if (it.has("licenseUpdate")) result.setLicenseUpdate(it.getBoolean("licenseUpdate"))
    if (it.has("delayedNNLoad")) result.isDelayedNNLoad = it.getBoolean("delayedNNLoad")
    result.licenseUpdateTimeout = it.getDoubleOrNull("licenseUpdateTimeout")
    result.blackList = it.getJSONObjectOrNull("blackList")
    result
}

fun scannerConfigFromJSON(input: JSONObject) = input.let {
    val builder = if (it.has("scenario")) ScannerConfig.Builder(it.getString("scenario"))
    else ScannerConfig.Builder(onlineProcessingConfigFromJSON(it.getJSONObject("onlineProcessingConfig"))!!)

    if (it.has("onlineProcessingConfig")) builder.setOnlineProcessingConfig(onlineProcessingConfigFromJSON(it.getJSONObject("onlineProcessingConfig")))
    if (it.has("livePortrait")) builder.setLivePortrait(it.getString("livePortrait").toBitmap()!!)
    if (it.has("extPortrait")) builder.setExtPortrait(it.getString("extPortrait").toBitmap()!!)
    if (it.has("cameraId")) builder.setCameraId(it.getInt("cameraId"))
    builder.build()
}

fun generateScannerConfig(input: ScannerConfig?) = input?.let {
    mapOf(
        "scenario" to it.scenario,
        "onlineProcessingConfig" to generateOnlineProcessingConfig(it.onlineProcessingConfig),
        "livePortrait" to it.livePortrait.toBase64(),
        "extPortrait" to it.extPortrait.toBase64(),
        "cameraId" to it.cameraId
    ).toJson()
}

fun recognizeConfigFromJSON(input: JSONObject) = input.let {
    val builder = if (it.has("scenario")) RecognizeConfig.Builder(it.getString("scenario"))
    else RecognizeConfig.Builder(onlineProcessingConfigFromJSON(it.getJSONObject("onlineProcessingConfig"))!!)

    if (it.has("oneShotIdentification")) builder.setOneShotIdentification(it.getBoolean("oneShotIdentification"))
    if (it.has("dtc")) builder.setDTC(it.getString("dtc").toByteArray()!!)
    if (it.has("livePortrait")) builder.setLivePortrait(it.getString("livePortrait").toBitmap()!!)
    if (it.has("extPortrait")) builder.setExtPortrait(it.getString("extPortrait").toBitmap()!!)
    if (it.has("image")) builder.setBitmap(it.getString("image").toBitmap()!!)
    if (it.has("data")) builder.setData(it.getString("data").toByteArray()!!)
    if (it.has("images")) {
        val base64Images = it.getJSONArray("images")
        val images = arrayOfNulls<Bitmap>(base64Images.length())
        for (i in images.indices) images[i] = base64Images.getString(i).toBitmap()
        builder.setBitmaps(images)
    }
    if (it.has("imageInputData")) {
        val base64InputData = it.getJSONArray("imageInputData")
        val inputData = arrayOfNulls<ImageInputData>(base64InputData.length())
        for (i in inputData.indices) inputData[i] = imageInputDataFromJSON(base64InputData.getJSONObject(i))
        builder.setImageInputData(inputData)
    }
    builder.build()
}

fun generateRecognizeConfig(input: RecognizeConfig?) = input?.let {
    mapOf(
        "scenario" to it.scenario,
        "onlineProcessingConfig" to generateOnlineProcessingConfig(it.onlineProcessingConfig),
        "oneShotIdentification" to it.oneShotIdentification,
        "dtc" to it.dtc.toBase64(),
        "livePortrait" to it.livePortrait.toBase64(),
        "extPortrait" to it.extPortrait.toBase64(),
        "image" to it.bitmap.toBase64(),
        "data" to it.data.toBase64(),
        "images" to
                if (it.bitmaps == null) null
                else {
                    val array = JSONArray()
                    for (bitmap in it.bitmaps!!) array.put(bitmap.toBase64())
                    array
                },
        "imageInputData" to it.imageInputData.toJson(::generateImageInputData)
    ).toJson()
}

fun backendProcessingConfigFromJSON(input: JSONObject?) = input?.let {
    val result = BackendProcessingConfig(it.getString("url"))
    if (it.has("httpHeaders")) {
        val httpHeaders: MutableMap<String, String> = HashMap()
        it.getJSONObject("httpHeaders").forEach { key, value -> httpHeaders[key] = value as String }
        result.httpHeaders = httpHeaders
    }
    result.rfidServerSideChipVerification = it.getBooleanOrNull("rfidServerSideChipVerification")
    result.timeoutConnection = it.getDoubleOrNull("timeoutConnection")
    result
}

fun generateBackendProcessingConfig(input: BackendProcessingConfig?) = input?.let {
    mapOf(
        "url" to it.url,
        "rfidServerSideChipVerification" to it.rfidServerSideChipVerification,
        "timeoutConnection" to it.timeoutConnection,
        "httpHeaders" to if (it.httpHeaders == null) null else {
            val httpHeaders = JSONObject()
            for ((key, value) in it.httpHeaders!!) httpHeaders.put(key, value)
            httpHeaders
        }
    ).toJson()
}

val weakReferencesHolder = mutableListOf<Any>()
fun onlineProcessingConfigFromJSON(input: JSONObject?) = input?.let {
    val builder = OnlineProcessingConfig.Builder(it.getInt("mode"))

    if (it.has("imageFormat")) builder.setImageFormat(it.getInt("imageFormat"))
    if (it.has("url")) builder.setUrl(it.getString("url"))
    if (it.has("imageCompressionQuality")) builder.setImageCompressionQuality(it.getDouble("imageCompressionQuality").toFloat())
    if (it.has("processParams")) builder.setProcessParams(processParamFromJSON(it.getJSONObject("processParams")))
    if (it.has("requestHeaders")) {
        val listener = NetworkInterceptorListener { self -> input.getJSONObject("requestHeaders").forEach { k, v -> self.setRequestProperty(k, v as String) } }
        weakReferencesHolder.add(listener)
        builder.setNetworkInterceptorListener(listener)
    }
    builder.build()
}

fun generateOnlineProcessingConfig(input: OnlineProcessingConfig?) = input?.let {
    mapOf(
        "mode" to it.mode,
        "url" to it.url,
        "processParams" to getProcessParams(it.processParam),
        "imageFormat" to it.imageFormat,
        "imageCompressionQuality" to it.imageCompressionQuality
    ).toJson()
}

fun faceApiParamsFromJSON(input: JSONObject?) = input?.let {
    val result = FaceApiParams()

    if (it.has("url")) result.url = it.getString("url")
    if (it.has("mode")) result.mode = it.getString("mode")
    if (it.has("threshold") && !it.isNull("threshold")) result.threshold = it.getInt("threshold")
    if (it.has("serviceTimeout") && !it.isNull("serviceTimeout")) result.serviceTimeout = it.getInt("serviceTimeout")
    result.search = faceApiSearchParamsFromJSON(it.getJSONObjectOrNull("searchParams"))
    result.proxy = it.getStringOrNull("proxy")
    result.proxyUserPwd = it.getStringOrNull("proxyPassword")
    result.proxyType = it.getIntOrNull("proxyType")

    result
}

fun generateFaceApiParams(input: FaceApiParams?) = input?.let {
    mapOf(
        "url" to it.url,
        "mode" to it.mode,
        "searchParams" to generateFaceApiSearchParams(it.search),
        "threshold" to it.threshold,
        "serviceTimeout" to it.serviceTimeout,
        "proxy" to it.proxy,
        "proxyPassword" to it.proxyUserPwd,
        "proxyType" to it.proxyType
    ).toJson()
}

fun faceApiSearchParamsFromJSON(input: JSONObject?) = input?.let {
    val result = FaceApiParams.Search()

    if (it.has("limit") && !it.isNull("limit")) result.limit = it.getInt("limit")
    if (it.has("threshold") && !it.isNull("threshold")) result.threshold = it.getDouble("threshold").toFloat()
    if (it.has("groupIds") && !it.isNull("groupIds")) {
        val jsonArrayGroupIds = it.getJSONArray("groupIds")
        val groupIds = arrayOfNulls<String>(jsonArrayGroupIds.length())
        for (i in 0 until jsonArrayGroupIds.length())
            groupIds[i] = jsonArrayGroupIds.getString(i)
        result.groupIds = groupIds
    }

    result
}

fun generateFaceApiSearchParams(input: FaceApiParams.Search?) = input?.let {
    mapOf(
        "limit" to it.limit,
        "threshold" to it.threshold,
        "groupIds" to it.groupIds.toJson()
    ).toJson()
}

fun rfidParamsFromJSON(input: JSONObject?) = input?.let {
    val result = RFIDParams()
    if (it.has("paIgnoreNotificationCodes")) result.paIgnoreNotificationCodes = it.getJSONArray("paIgnoreNotificationCodes").toIntArray()
    result
}

fun generateRFIDParams(input: RFIDParams?) = input?.let {
    mapOf(
        "paIgnoreNotificationCodes" to it.paIgnoreNotificationCodes.toJson()
    ).toJson()
}

fun processParamFromJSON(input: JSONObject): ProcessParam {
    val result = ProcessParam()
    setProcessParams(result, input)
    return result
}

fun generateProcessParam(input: ProcessParam): JSONObject = getProcessParams(input)

fun imageQAFromJSON(input: JSONObject): ImageQA {
    val result = ImageQA()
    setImageQA(result, input)
    return result
}

fun generateImageQA(input: ImageQA) = getImageQA(input)

fun authenticityParamsFromJSON(input: JSONObject): AuthenticityParams {
    val result = AuthenticityParams.defaultParams()
    setAuthenticityParams(result, input)
    return result
}

fun generateAuthenticityParams(input: AuthenticityParams?) = getAuthenticityParams(input)

fun livenessParamsFromJSON(input: JSONObject): LivenessParams {
    val result = LivenessParams.defaultParams()
    setLivenessParams(result, input)
    return result
}

fun generateLivenessParams(input: LivenessParams?) = getLivenessParams(input)

fun eDLDataGroupsFromJSON(input: JSONObject): EDLDataGroups {
    val result = EDLDataGroups()
    setDataGroups(result, input)
    return result
}

fun generateEDLDataGroups(input: EDLDataGroups): JSONObject = getDataGroups(input)

fun ePassportDataGroupsFromJSON(input: JSONObject): EPassportDataGroups {
    val result = EPassportDataGroups()
    setDataGroups(result, input)
    return result
}

fun generateEPassportDataGroups(input: EPassportDataGroups): JSONObject = getDataGroups(input)

fun eIDDataGroupsFromJSON(input: JSONObject): EIDDataGroups {
    val result = EIDDataGroups()
    setDataGroups(result, input)
    return result
}

fun generateEIDDataGroups(input: EIDDataGroups): JSONObject = getDataGroups(input)

fun dtcDataGroupFromJSON(input: JSONObject): DTCDataGroup {
    val result = DTCDataGroup()
    setDTCDataGroup(result, input)
    return result
}

fun generateDTCDataGroup(input: DTCDataGroup): JSONObject = getDTCDataGroup(input)

fun rfidScenarioFromJSON(input: JSONObject): RfidScenario {
    val result = RfidScenario()
    setRfidScenario(result, input)
    return result
}

fun generateRfidScenario(input: RfidScenario): JSONObject = getRfidScenario(input)

fun customizationFromJSON(input: JSONObject): ParamsCustomization {
    val result = ParamsCustomization()
    setCustomization(result, input)
    return result
}

fun generateCustomization(input: ParamsCustomization): JSONObject = getCustomization(input)

fun functionalityFromJSON(input: JSONObject): Functionality {
    val result = Functionality()
    setFunctionality(result, input)
    return result
}

fun generateFunctionality(input: Functionality): JSONObject = getFunctionality(input)

fun glaresCheckParamsFromJSON(input: JSONObject?) = input?.let {
    val result = GlaresCheckParams()
    if (it.has("imgMarginPart")) result.imgMarginPart = it.getDouble("imgMarginPart")
    if (it.has("maxGlaringPart")) result.maxGlaringPart = it.getDouble("maxGlaringPart")
    result
}

fun generateGlaresCheckParams(input: GlaresCheckParams?) = input?.let {
    mapOf(
        "imgMarginPart" to it.imgMarginPart,
        "maxGlaringPart" to it.maxGlaringPart
    ).toJson()
}

@SuppressLint("DiscouragedApi")
fun typefaceFromJSON(it: JSONObject): Pair<Typeface?, Int?> {
    val font = try {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
            context.resources.getFont(
                context.resources.getIdentifier(
                    it.getString("name"),
                    "font",
                    context.packageName
                )
            )
        else throw Exception("")
    } catch (_: Exception) {
        Typeface.create(
            it.getString("name"),
            it.optInt("style", Typeface.NORMAL)
        )
    }
    return Pair(
        font,
        if (it.has("size")) it.getInt("size") else null
    )
}

fun generateTypeface(input: Typeface?, size: Int? = null) = input?.let {
    mapOf(
        "name" to "undefined",
        "style" to it.style,
        "size" to size
    ).toJson()
}

fun imageInputDataFromJSON(input: JSONObject?) = input?.let {
    ImageInputData(
        it.getString("image").toBitmap()!!,
        it.getIntOrNull("light") ?: 6,
        it.getIntOrNull("pageIndex") ?: 0
    )
}

fun generateImageInputData(input: ImageInputData?) = input?.let {
    mapOf(
        "image" to it.bitmap.toBase64(),
        "light" to it.light,
        "pageIndex" to it.pageIndex
    ).toJson()
}

fun pkdCertificateFromJSON(input: JSONObject?) = input?.let {
    var resourceType = 0
    var binaryData = ByteArray(0)

    if (it.has("resourceType")) resourceType = it.getInt("resourceType")
    if (it.has("binaryData")) binaryData = it.getString("binaryData").toByteArray()!!
    if (it.has("privateKey")) {
        val privateKey = it.getString("privateKey").toByteArray()
        return PKDCertificate(binaryData, resourceType, privateKey)
    }
    PKDCertificate(binaryData, resourceType)
}

fun generatePKDCertificate(input: PKDCertificate?) = input?.let {
    mapOf(
        "resourceType" to it.resourceType,
        "binaryData" to it.binaryData.toBase64(),
        "privateKey" to it.privateKey.toBase64()
    ).toJson()
}

fun documentReaderScenarioFromJSON(input: JSONObject?) = input?.let {
    DocumentReaderScenario(
        it.optString("name"),
        it.optString("caption"),
        it.optString("description"),
        if (it.optBoolean("multiPageOff")) 1 else 0,
        it.optDouble("frameKWHLandscape"),
        it.optDouble("frameKWHPortrait"),
        it.optDouble("frameKWHDoublePageSpreadPortrait"),
        it.optDouble("frameKWHDoublePageSpreadLandscape"),
        it.optInt("frameOrientation"),
        it.optBoolean("uvTorch"),
        it.optBoolean("faceExt"),
        it.optBoolean("seriesProcessMode"),
        it.optBoolean("manualCrop"),
        null
    )
}

fun generateDocumentReaderScenario(input: DocumentReaderScenario?) = input?.let {
    mapOf(
        "name" to it.name,
        "caption" to it.caption,
        "description" to it.description,
        "multiPageOff" to it.multiPageOff,
        "frameKWHLandscape" to it.frameKWHLandscape,
        "frameKWHPortrait" to it.frameKWHPortrait,
        "frameKWHDoublePageSpreadPortrait" to it.frameKWHDoublePageSpreadPortrait,
        "frameKWHDoublePageSpreadLandscape" to it.frameKWHDoublePageSpreadLandscape,
        "frameOrientation" to it.frameOrientation,
        "uvTorch" to it.uvTorch,
        "faceExt" to it.faceExt,
        "seriesProcessMode" to it.seriesProcessMode,
        "manualCrop" to it.manualCrop
    ).toJson()
}

fun rectFromJSON(input: JSONObject?) = input?.let {
    val result = Rect()

    result.bottom = it.optInt("bottom")
    result.top = it.optInt("top")
    result.left = it.optInt("left")
    result.right = it.optInt("right")

    result
}

fun generateRect(input: Rect?) = input?.let {
    mapOf(
        "bottom" to it.bottom,
        "top" to it.top,
        "left" to it.left,
        "right" to it.right
    ).toJson()
}

fun docReaderFieldRectFromJSON(input: JSONObject?) = input?.let {
    val result = DocReaderFieldRect()

    result.bottom = it.optInt("bottom")
    result.top = it.optInt("top")
    result.left = it.optInt("left")
    result.right = it.optInt("right")

    result
}

fun generateDocReaderFieldRect(input: DocReaderFieldRect?) = input?.let {
    mapOf(
        "bottom" to it.bottom,
        "top" to it.top,
        "left" to it.left,
        "right" to it.right
    ).toJson()
}

fun documentReaderGraphicFieldFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderGraphicField()

    it.remove("value")
    result.sourceType = it.optInt("sourceType")
    result.fieldType = it.optInt("fieldType")
    result.light = it.optInt("light")
    result.pageIndex = it.optInt("pageIndex")
    result.originalPageIndex = it.optInt("originalPageIndex")
    result.boundRect = docReaderFieldRectFromJSON(it.optJSONObject("fieldRect"))

    result
}

fun generateDocumentReaderGraphicField(input: DocumentReaderGraphicField?) = input?.let {
    mapOf(
        "sourceType" to it.sourceType,
        "fieldType" to it.fieldType,
        "light" to it.light,
        "pageIndex" to it.pageIndex,
        "originalPageIndex" to it.originalPageIndex,
        "fieldName" to eGraphicFieldType.getTranslation(context, it.fieldType),
        "lightName" to eRPRM_Lights.getTranslation(context, it.light),
        "value" to it.imageBase64(),
        "fieldRect" to generateDocReaderFieldRect(it.boundRect)
    ).toJson()
}

fun documentReaderGraphicResultFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderGraphicResult()
    result.fields = it.optJSONArray("fields").toList(::documentReaderGraphicFieldFromJSON)!!
    result
}

fun generateDocumentReaderGraphicResult(input: DocumentReaderGraphicResult?) = input?.let {
    mapOf(
        "fields" to it.fields.toJson(::generateDocumentReaderGraphicField)
    ).toJson()
}

fun documentReaderValueFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderValue()

    result.pageIndex = it.optInt("pageIndex")
    result.sourceType = it.optInt("sourceType")
    result.probability = it.optInt("probability")
    result.value = it.optString("value")
    result.originalValue = it.optString("originalValue")
    result.boundRect = rectFromJSON(it.optJSONObject("boundRect"))
    result.originalSymbols = it.optJSONArray("originalSymbols").toList(::documentReaderSymbolFromJSON)!!
    result.rfidOrigin = documentReaderRFIDOriginFromJSON(it.optJSONObject("rfidOrigin"))

    result
}

fun generateDocumentReaderValue(input: DocumentReaderValue?) = input?.let {
    mapOf(
        "pageIndex" to it.pageIndex,
        "sourceType" to it.sourceType,
        "probability" to it.probability,
        "value" to it.value,
        "originalValue" to it.originalValue,
        "boundRect" to generateRect(it.boundRect),
        "originalSymbols" to it.originalSymbols.toJson(::generateDocumentReaderSymbol),
        "rfidOrigin" to generateDocumentReaderRFIDOrigin(it.rfidOrigin)
    ).toJson()
}

fun documentReaderTextFieldFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderTextField()

    it.remove("getValue")
    result.fieldType = it.optInt("fieldType")
    result.lcid = it.optInt("lcid")
    result.status = it.optInt("status")
    result.value = it.optString("value")
    result.values = it.optJSONArray("values").toList(::documentReaderValueFromJSON)!!
    result.comparisonList = it.optJSONArray("comparisonList").toList(::documentReaderComparisonFromJSON)!!
    result.validityList = it.optJSONArray("validityList").toList(::documentReaderValidityFromJSON)!!
    result.comparisonStatus = it.optInt("comparisonStatus")
    result.validityStatus = it.optInt("validityStatus")

    result
}

fun generateDocumentReaderTextField(input: DocumentReaderTextField?) = input?.let {
    mapOf(
        "fieldType" to it.fieldType,
        "lcid" to it.lcid,
        "status" to it.status,
        "lcidName" to it.getLcidName(context),
        "fieldName" to it.getFieldName(context),
        "value" to it.value,
        "getValue" to generateDocumentReaderValue(it.value()),
        "values" to it.values.toJson(::generateDocumentReaderValue),
        "comparisonList" to it.comparisonList.toJson(::generateDocumentReaderComparison),
        "validityList" to it.validityList.toJson(::generateDocumentReaderValidity),
        "comparisonStatus" to it.comparisonStatus,
        "validityStatus" to it.validityStatus
    ).toJson()
}

fun documentReaderTextResultFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderTextResult()

    result.status = it.optInt("status")
    result.comparisonStatus = it.optInt("comparisonStatus")
    result.validityStatus = it.optInt("validityStatus")
    result.availableSourceList = it.optJSONArray("availableSourceList").toList(::documentReaderTextSourceFromJSON)!!
    result.fields = it.optJSONArray("fields").toList(::documentReaderTextFieldFromJSON)!!

    result
}

fun generateDocumentReaderTextResult(input: DocumentReaderTextResult?) = input?.let {
    mapOf(
        "status" to it.status,
        "comparisonStatus" to it.comparisonStatus,
        "validityStatus" to it.validityStatus,
        "availableSourceList" to it.availableSourceList.toJson(::generateDocumentReaderTextSource),
        "fields" to it.fields.toJson(::generateDocumentReaderTextField)
    ).toJson()
}

fun coordinateFromJSON(input: JSONObject?) = input?.let {
    val result = Coordinate()
    result.x = it.optInt("x")
    result.y = it.optInt("y")
    result
}

fun generateCoordinate(input: Coordinate?) = input?.let {
    mapOf(
        "x" to it.x,
        "y" to it.y
    ).toJson()
}

fun elementPositionFromJSON(input: JSONObject?) = input?.let {
    val result = ElementPosition()

    result.docFormat = it.optInt("docFormat")
    result.width = it.optInt("width")
    result.height = it.optInt("height")
    result.dpi = it.optInt("dpi")
    result.pageIndex = it.optInt("pageIndex")
    result.inverse = it.optInt("inverse")
    result.perspectiveTr = it.optInt("perspectiveTr")
    result.objArea = it.optInt("objArea")
    result.objIntAngleDev = it.optInt("objIntAngleDev")
    result.resultStatus = it.optInt("resultStatus")
    result.angle = it.optDouble("angle")
    result.center = coordinateFromJSON(it.optJSONObject("center"))
    result.leftTop = coordinateFromJSON(it.optJSONObject("leftTop"))
    result.leftBottom = coordinateFromJSON(it.optJSONObject("leftBottom"))
    result.rightTop = coordinateFromJSON(it.optJSONObject("rightTop"))
    result.rightBottom = coordinateFromJSON(it.optJSONObject("rightBottom"))

    result
}

fun generateElementPosition(input: ElementPosition?) = input?.let {
    mapOf(
        "docFormat" to it.docFormat,
        "width" to it.width,
        "height" to it.height,
        "dpi" to it.dpi,
        "pageIndex" to it.pageIndex,
        "inverse" to it.inverse,
        "perspectiveTr" to it.perspectiveTr,
        "objArea" to it.objArea,
        "objIntAngleDev" to it.objIntAngleDev,
        "resultStatus" to it.resultStatus,
        "angle" to it.angle,
        "center" to generateCoordinate(it.center),
        "leftTop" to generateCoordinate(it.leftTop),
        "leftBottom" to generateCoordinate(it.leftBottom),
        "rightTop" to generateCoordinate(it.rightTop),
        "rightBottom" to generateCoordinate(it.rightBottom)
    ).toJson()
}

fun imageQualityFromJSON(input: JSONObject?) = input?.let {
    val result = ImageQuality()

    result.featureType = it.optInt("featureType")
    result.result = it.optInt("result")
    result.type = it.optInt("type")
    result.boundRects = it.optJSONArray("boundRects").toList(::docReaderFieldRectFromJSON)!!

    result
}

fun generateImageQuality(input: ImageQuality?) = input?.let {
    mapOf(
        "featureType" to it.featureType,
        "result" to it.result,
        "type" to it.type,
        "boundRects" to it.boundRects.toJson(::generateDocReaderFieldRect)
    ).toJson()
}

fun imageQualityGroupFromJSON(input: JSONObject?) = input?.let {
    val result = ImageQualityGroup()

    result.count = it.optInt("count")
    result.result = it.optInt("result")
    result.pageIndex = it.optInt("pageIndex")
    result.imageQualityList = it.optJSONArray("imageQualityList").toList(::imageQualityFromJSON)!!

    result
}

fun generateImageQualityGroup(input: ImageQualityGroup?) = input?.let {
    mapOf(
        "count" to it.count,
        "result" to it.result,
        "imageQualityList" to it.imageQualityList.toJson(::generateImageQuality),
        "pageIndex" to it.pageIndex
    ).toJson()
}

fun cameraSizeFromJSON(input: JSONObject) = input.let {
    val width = it.getInt("width")
    val height = it.getInt("height")
    Pair(width, height)
}

fun generateCameraSize(width: Int?, height: Int?): JSONObject? {
    width ?: return null
    height ?: return null
    return mapOf(
        "width" to width,
        "height" to height
    ).toJson()
}

fun documentReaderDocumentTypeFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderDocumentType()

    result.pageIndex = it.optInt("pageIndex")
    result.documentID = it.optInt("documentID")
    result.dType = it.optInt("dType")
    result.dFormat = it.optInt("dFormat")
    result.dMRZ = it.optBoolean("dMRZ")
    result.isDeprecated = it.optBoolean("isDeprecated")
    result.name = it.optString("name")
    result.ICAOCode = it.optString("ICAOCode")
    result.dDescription = it.optString("dDescription")
    result.dCountryName = it.optString("dCountryName")
    result.dYear = it.optString("dYear")
    result.FDSID = it.optJSONArray("FDSID").toIntArray()

    result
}

fun generateDocumentReaderDocumentType(input: DocumentReaderDocumentType?) = input?.let {
    mapOf(
        "pageIndex" to it.pageIndex,
        "documentID" to it.documentID,
        "dType" to it.dType,
        "dFormat" to it.dFormat,
        "dMRZ" to it.dMRZ,
        "isDeprecated" to it.isDeprecated,
        "name" to it.name,
        "ICAOCode" to it.ICAOCode,
        "dDescription" to it.dDescription,
        "dYear" to it.dYear,
        "dCountryName" to it.dCountryName,
        "FDSID" to it.FDSID.toJson()
    ).toJson()
}

fun generateDocumentReaderNotification(input: DocumentReaderNotification?) = input?.let {
    mapOf(
        "notificationCode" to it.notificationCode,
        "dataFileType" to it.dataFileType,
        "progress" to it.progress
    ).toJson()
}

fun accessControlProcedureTypeFromJSON(input: JSONObject?) = input?.let {
    val result = AccessControlProcedureType()

    result.activeOptionIdx = it.optInt("activeOptionIdx")
    result.type = it.optInt("type")
    result.status = it.optInt("status").toLong()
    result.notifications = it.optJSONArray("notifications")!!.toList()

    result
}

fun generateAccessControlProcedureType(input: AccessControlProcedureType?) = input?.let {
    mapOf(
        "activeOptionIdx" to it.activeOptionIdx,
        "type" to it.type,
        "status" to it.status,
        "notifications" to it.notifications.toJson()
    ).toJson()
}

fun fileDataFromJSON(input: JSONObject?) = input?.let {
    val result = FileData()

    result.length = it.optInt("length")
    result.type = it.optInt("type")
    result.status = it.optInt("status").toLong()
    result.data = it.optString("data")

    result
}

fun generateFileData(input: FileData?) = input?.let {
    mapOf(
        "length" to it.length,
        "type" to it.type,
        "status" to it.status,
        "data" to it.data
    ).toJson()
}

fun certificateDataFromJSON(input: JSONObject?) = input?.let {
    val result = CertificateData()
    result.length = it.optInt("length")
    result.data = it.optString("data")
    result
}

fun generateCertificateData(input: CertificateData?) = input?.let {
    mapOf(
        "length" to it.length,
        "data" to it.data
    ).toJson()
}

fun securityObjectCertificatesFromJSON(input: JSONObject?) = input?.let {
    val result = SecurityObjectCertificates()
    result.securityObject = certificateDataFromJSON(it.optJSONObject("securityObject"))
    result
}

fun generateSecurityObjectCertificates(input: SecurityObjectCertificates?) = input?.let {
    mapOf(
        "securityObject" to generateCertificateData(it.securityObject)
    ).toJson()
}

fun fileFromJSON(input: JSONObject?) = input?.let {
    val result = File()

    result.readingTime = it.optInt("readingTime")
    result.type = it.optInt("type")
    result.pAStatus = it.optLong("pAStatus")
    result.readingStatus = it.optInt("readingStatus").toLong()
    result.fileID = it.optString("fileID")
    result.fileData = fileDataFromJSON(it.optJSONObject("fileData"))
    result.certificates = securityObjectCertificatesFromJSON(it.optJSONObject("certificates"))
    result.docFieldsText = it.optJSONArray("docFieldsText")!!.toList()
    result.docFieldsGraphics = it.optJSONArray("docFieldsGraphics")!!.toList()
    result.docFieldsOriginals = it.optJSONArray("docFieldsOriginals")!!.toList()
    result.notifications = it.optJSONArray("notifications")!!.toList()

    result
}

fun generateFile(input: File?) = input?.let {
    mapOf(
        "readingTime" to it.readingTime,
        "type" to it.type,
        "typeName" to eRFID_DataFile_Type.getTranslation(context, it.type),
        "pAStatus" to it.pAStatus,
        "readingStatus" to it.readingStatus,
        "fileID" to it.fileID,
        "fileData" to generateFileData(it.fileData),
        "certificates" to generateSecurityObjectCertificates(it.certificates),
        "docFieldsText" to it.docFieldsText.toJson(),
        "docFieldsGraphics" to it.docFieldsGraphics.toJson(),
        "docFieldsOriginals" to it.docFieldsOriginals.toJson(),
        "notifications" to it.notifications.toJson()
    ).toJson()
}

fun applicationFromJSON(input: JSONObject?) = input?.let {
    val result = Application()

    result.type = it.optInt("type")
    result.status = it.optInt("status")
    result.applicationID = it.optString("applicationID")
    result.dataHashAlgorithm = it.optString("dataHashAlgorithm")
    result.unicodeVersion = it.optString("unicodeVersion")
    result.version = it.optString("version")
    result.files = it.optJSONArray("files").toList(::fileFromJSON)!!

    result
}

fun generateApplication(input: Application?) = input?.let {
    mapOf(
        "type" to it.type,
        "status" to it.status,
        "applicationID" to it.applicationID,
        "dataHashAlgorithm" to it.dataHashAlgorithm,
        "unicodeVersion" to it.unicodeVersion,
        "version" to it.version,
        "files" to it.files.toJson(::generateFile)
    ).toJson()
}

fun valueFromJSON(input: JSONObject?) = input?.let {
    val result = Value()

    result.length = it.optInt("length")
    result.type = it.optInt("type")
    result.status = it.optInt("status").toLong()
    result.data = it.optString("data")
    result.format = it.optString("format")

    result
}

fun generateValue(input: Value?) = input?.let {
    mapOf(
        "length" to it.length,
        "type" to it.type,
        "status" to it.status,
        "data" to it.data,
        "format" to it.format
    ).toJson()
}

fun attributeFromJSON(input: JSONObject?) = input?.let {
    val result = Attribute()
    result.type = it.optString("type")
    result.value = valueFromJSON(it.optJSONObject("value"))
    result
}

fun generateAttribute(input: Attribute?) = input?.let {
    mapOf(
        "type" to it.type,
        "value" to generateValue(it.value)
    ).toJson()
}

fun authorityFromJSON(input: JSONObject?) = input?.let {
    val result = Authority()
    result.data = it.optString("data")
    result.friendlyName = valueFromJSON(it.optJSONObject("friendlyName"))
    result.attributes = it.optJSONArray("attributes").toList(::attributeFromJSON)!!
    result
}

fun generateAuthority(input: Authority?) = input?.let {
    mapOf(
        "data" to it.data,
        "friendlyName" to generateValue(it.friendlyName),
        "attributes" to it.attributes.toJson(::generateAttribute)
    ).toJson()
}

fun extensionFromJSON(input: JSONObject?) = input?.let {
    val result = Extension()
    result.data = it.optString("data")
    result.type = it.optString("type")
    result
}

fun generateExtension(input: Extension?) = input?.let {
    mapOf(
        "data" to it.data,
        "type" to it.type
    ).toJson()
}

fun validityFromJSON(input: JSONObject?) = input?.let {
    val result = Validity()
    result.notAfter = valueFromJSON(it.optJSONObject("notAfter"))
    result.notBefore = valueFromJSON(it.optJSONObject("notBefore"))
    result
}

fun generateValidity(input: Validity?) = input?.let {
    mapOf(
        "notAfter" to generateValue(it.notAfter),
        "notBefore" to generateValue(it.notBefore)
    ).toJson()
}

fun certificateChainFromJSON(input: JSONObject?) = input?.let {
    val result = CertificateChain()

    result.origin = it.optInt("origin")
    result.type = it.optInt("type")
    result.version = it.optInt("version")
    result.paStatus = it.optInt("paStatus").toLong()
    result.serialNumber = it.optString("serialNumber")
    result.signatureAlgorithm = it.optString("signatureAlgorithm")
    result.subjectPKAlgorithm = it.optString("subjectPKAlgorithm")
    result.fileName = valueFromJSON(it.optJSONObject("fileName"))
    result.validity = validityFromJSON(it.optJSONObject("validity"))
    result.issuer = authorityFromJSON(it.optJSONObject("issuer"))
    result.subject = authorityFromJSON(it.optJSONObject("subject"))
    result.notifications = it.optJSONArray("notifications")!!.toList()
    result.extensions = it.optJSONArray("extensions").toList(::extensionFromJSON)!!

    result
}

fun generateCertificateChain(input: CertificateChain?) = input?.let {
    mapOf(
        "origin" to it.origin,
        "type" to it.type,
        "version" to it.version,
        "paStatus" to it.paStatus,
        "serialNumber" to it.serialNumber,
        "signatureAlgorithm" to it.signatureAlgorithm,
        "subjectPKAlgorithm" to it.subjectPKAlgorithm,
        "fileName" to generateValue(it.fileName),
        "validity" to generateValidity(it.validity),
        "issuer" to generateAuthority(it.issuer),
        "subject" to generateAuthority(it.subject),
        "notifications" to it.notifications.toJson(),
        "extensions" to it.extensions.toJson(::generateExtension)
    ).toJson()
}

fun signerInfoFromJSON(input: JSONObject?) = input?.let {
    val result = SignerInfo()

    result.version = it.optInt("version")
    result.paStatus = it.optInt("paStatus").toLong()
    result.dataToHash = it.optString("dataToHash")
    result.digestAlgorithm = it.optString("digestAlgorithm")
    result.signatureAlgorithm = it.optString("signatureAlgorithm")
    result.serialNumber = valueFromJSON(it.optJSONObject("serialNumber"))
    result.signature = valueFromJSON(it.optJSONObject("signature"))
    result.subjectKeyIdentifier = valueFromJSON(it.optJSONObject("subjectKeyIdentifier"))
    result.issuer = authorityFromJSON(it.optJSONObject("issuer"))
    result.notifications = it.optJSONArray("notifications")!!.toList()
    result.signedAttributes = it.optJSONArray("signedAttributes").toList(::extensionFromJSON)!!
    result.certificateChain = it.optJSONArray("certificateChain").toList(::certificateChainFromJSON)!!

    result
}

fun generateSignerInfo(input: SignerInfo?) = input?.let {
    mapOf(
        "version" to it.version,
        "paStatus" to it.paStatus,
        "dataToHash" to it.dataToHash,
        "digestAlgorithm" to it.digestAlgorithm,
        "signatureAlgorithm" to it.signatureAlgorithm,
        "serialNumber" to generateValue(it.serialNumber),
        "signature" to generateValue(it.signature),
        "subjectKeyIdentifier" to generateValue(it.subjectKeyIdentifier),
        "issuer" to generateAuthority(it.issuer),
        "notifications" to it.notifications.toJson(),
        "signedAttributes" to it.signedAttributes.toJson(::generateExtension),
        "certificateChain" to it.certificateChain.toJson(::generateCertificateChain)
    ).toJson()
}

fun securityObjectFromJSON(input: JSONObject?) = input?.let {
    val result = SecurityObject()

    result.fileReference = it.optInt("fileReference")
    result.version = it.optInt("version")
    result.objectType = it.optString("objectType")
    result.notifications = it.optJSONArray("notifications")!!.toList()
    result.signerInfos = it.optJSONArray("signerInfos").toList(::signerInfoFromJSON)!!

    result
}

fun generateSecurityObject(input: SecurityObject?) = input?.let {
    mapOf(
        "fileReference" to it.fileReference,
        "version" to it.version,
        "objectType" to it.objectType,
        "notifications" to it.notifications.toJson(),
        "signerInfos" to it.signerInfos.toJson(::generateSignerInfo)
    ).toJson()
}

fun cardPropertiesFromJSON(input: JSONObject?) = input?.let {
    val result = CardProperties()

    result.aTQA = it.optInt("aTQA")
    result.bitRateR = it.optInt("bitRateR")
    result.bitRateS = it.optInt("bitRateS")
    result.chipTypeA = it.optInt("chipTypeA")
    result.mifareMemory = it.optInt("mifareMemory")
    result.rfidType = it.optInt("rfidType")
    result.sAK = it.optInt("sAK")
    result.support4 = it.optBoolean("support4")
    result.supportMifare = it.optBoolean("supportMifare")
    result.aTQB = it.optString("aTQB")
    result.aTR = it.optString("aTR")
    result.baudrate1 = it.optString("baudrate1")
    result.baudrate2 = it.optString("baudrate2")
    result.uID = it.optString("uID")

    result
}

fun generateCardProperties(input: CardProperties?) = input?.let {
    mapOf(
        "aTQA" to it.aTQA,
        "bitRateR" to it.bitRateR,
        "bitRateS" to it.bitRateS,
        "chipTypeA" to it.chipTypeA,
        "mifareMemory" to it.mifareMemory,
        "rfidType" to it.rfidType,
        "sAK" to it.sAK,
        "support4" to it.support4,
        "supportMifare" to it.supportMifare,
        "aTQB" to it.aTQB,
        "aTR" to it.aTR,
        "baudrate1" to it.baudrate1,
        "baudrate2" to it.baudrate2,
        "uID" to it.uID
    ).toJson()
}

fun rfidSessionDataFromJSON(input: JSONObject?) = input?.let {
    val result = RFIDSessionData()

    result.totalBytesReceived = it.optInt("totalBytesReceived")
    result.totalBytesSent = it.optInt("totalBytesSent")
    result.status = it.optInt("status").toLong()
    result.extLeSupport = it.optLong("extLeSupport")
    result.processTime = it.optLong("processTime")
    result.cardProperties = cardPropertiesFromJSON(it.optJSONObject("cardProperties"))
    result.accessControls = it.optJSONArray("accessControls").toList(::accessControlProcedureTypeFromJSON)!!
    result.applications = it.optJSONArray("applications").toList(::applicationFromJSON)!!
    result.securityObjects = it.optJSONArray("securityObjects").toList(::securityObjectFromJSON)!!
    result.dataFields = it.optJSONArray("dataFields").toList(::dataFieldFromJSON)!!
    result.dataGroups = it.optJSONArray("dataGroups").toIntArray()

    result
}

fun generateRFIDSessionData(input: RFIDSessionData?) = input?.let {
    mapOf(
        "totalBytesReceived" to it.totalBytesReceived,
        "totalBytesSent" to it.totalBytesSent,
        "status" to it.status,
        "extLeSupport" to it.extLeSupport,
        "processTime" to it.processTime,
        "cardProperties" to generateCardProperties(it.cardProperties),
        "accessControls" to it.accessControls.toJson(::generateAccessControlProcedureType),
        "applications" to it.applications.toJson(::generateApplication),
        "securityObjects" to it.securityObjects.toJson(::generateSecurityObject),
        "dataGroups" to it.dataGroups.toJson(),
        "dataFields" to it.dataFields.toJson(::generateDataField)
    ).toJson()
}

fun dataFieldFromJSON(input: JSONObject?) = input?.let {
    val result = DataField()
    result.data = it.optString("data")
    result.fieldType = it.optInt("fieldType")
    result
}

fun generateDataField(input: DataField?) = input?.let {
    mapOf(
        "data" to it.data,
        "fieldType" to it.fieldType
    ).toJson()
}

fun documentReaderAuthenticityCheckFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderAuthenticityCheck()
    result.type = it.optInt("type")
    result.pageIndex = it.optInt("pageIndex")
    result.elements = it.optJSONArray("elements").toList(::documentReaderAuthenticityElementFromJSON)!!
    result
}

fun generateDocumentReaderAuthenticityCheck(input: DocumentReaderAuthenticityCheck?) = input?.let {
    mapOf(
        "type" to it.type,
        "status" to it.status,
        "typeName" to it.getTypeName(context),
        "pageIndex" to it.pageIndex,
        "elements" to it.elements.toJson(::generateDocumentReaderAuthenticityElement)
    ).toJson()
}

fun pdf417InfoFromJSON(input: JSONObject?) = input?.let {
    val result = PDF417Info()
    result.errorLevel = it.optInt("errorLevel")
    result.columns = it.optInt("columns")
    result.rows = it.optInt("rows")
    result
}

fun generatePDF417Info(input: PDF417Info?) = input?.let {
    mapOf(
        "errorLevel" to it.errorLevel,
        "columns" to it.columns,
        "rows" to it.rows
    ).toJson()
}

fun documentReaderBarcodeResultFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderBarcodeResult()
    result.fields = it.optJSONArray("fields").toList(::documentReaderBarcodeFieldFromJSON)!!
    result
}

fun generateDocumentReaderBarcodeResult(input: DocumentReaderBarcodeResult?) = input?.let {
    mapOf(
        "fields" to it.fields.toJson(::generateDocumentReaderBarcodeField)
    ).toJson()
}

fun documentReaderBarcodeFieldFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderBarcodeField()

    result.barcodeType = it.optInt("barcodeType")
    result.status = it.optInt("status")
    result.pageIndex = it.optInt("pageIndex")
    result.pdf417Info = pdf417InfoFromJSON(it.optJSONObject("pdf417Info"))
    result.data = it.optString("data").toByteArray()

    result
}

fun generateDocumentReaderBarcodeField(input: DocumentReaderBarcodeField?) = input?.let {
    mapOf(
        "barcodeType" to it.barcodeType,
        "status" to it.status,
        "pageIndex" to it.pageIndex,
        "pdf417Info" to generatePDF417Info(it.pdf417Info),
        "data" to it.data.toBase64()
    ).toJson()
}

fun documentReaderAuthenticityResultFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderAuthenticityResult()
    result.checks = it.optJSONArray("checks").toList(::documentReaderAuthenticityCheckFromJSON)!!
    result
}

@Suppress("DEPRECATION")
fun generateDocumentReaderAuthenticityResult(input: DocumentReaderAuthenticityResult?) = input?.let {
    mapOf(
        "status" to it.status,
        "checks" to it.checks.toJson(::generateDocumentReaderAuthenticityCheck)
    ).toJson()
}

fun documentReaderAuthenticityElementFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderAuthenticityElement()
    result.status = it.optInt("status")
    result.elementType = it.optInt("elementType")
    result.elementDiagnose = it.optInt("elementDiagnose")
    result
}

fun generateDocumentReaderAuthenticityElement(input: DocumentReaderAuthenticityElement?) = input?.let {
    mapOf(
        "status" to it.status,
        "elementType" to it.elementType,
        "elementDiagnose" to it.elementDiagnose,
        "elementTypeName" to it.getElementTypeName(context),
        "elementDiagnoseName" to it.getElementDiagnoseName(context)
    ).toJson()
}

fun paResourcesIssuerFromJSON(input: JSONObject?) = input?.let {
    val result = PAResourcesIssuer()
    result.data = it.optString("data").toByteArray()
    result.friendlyName = it.optString("friendlyName")
    result.attributes = it.optJSONArray("attributes").toArray(::paAttributeFromJSON)
    result
}

fun generatePAResourcesIssuer(input: PAResourcesIssuer?) = input?.let {
    mapOf(
        "data" to it.data.toBase64(),
        "friendlyName" to it.friendlyName,
        "attributes" to it.attributes.toJson(::generatePAAttribute)
    ).toJson()
}

fun paAttributeFromJSON(input: JSONObject?) = input?.let {
    val result = PAAttribute()
    result.type = it.optString("type")
    result.value = it.optString("value")
    result
}

fun generatePAAttribute(input: PAAttribute?) = input?.let {
    mapOf(
        "type" to it.type,
        "value" to it.value
    ).toJson()
}

fun taChallengeFromJSON(input: JSONObject?) = input?.let {
    val result = TAChallenge()

    result.data = it.optString("data").toByteArray()
    result.auxPCD = it.optString("auxPCD")
    result.challengePICC = it.optString("challengePICC")
    result.hashPK = it.optString("hashPK")
    result.idPICC = it.optString("idPICC")

    result
}

fun generateTAChallenge(input: TAChallenge?) = input?.let {
    mapOf(
        "data" to it.data.toBase64(),
        "auxPCD" to it.auxPCD,
        "challengePICC" to it.challengePICC,
        "hashPK" to it.hashPK,
        "idPICC" to it.idPICC
    ).toJson()
}

fun documentReaderResultsStatusFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderResultsStatus::class.constructor().instantiate()
    result.setPrivateProperty("overallStatus", it.getInt("overallStatus"))
    result.setPrivateProperty("optical", it.getInt("optical"))
    result.setPrivateProperty("detailsOptical", detailsOpticalFromJSON(it.getJSONObject("detailsOptical")))
    result.setPrivateProperty("rfid", it.getInt("rfid"))
    result.setPrivateProperty("detailsRFID", detailsRFIDFromJSON(it.getJSONObject("detailsRFID")))
    result.setPrivateProperty("portrait", it.getInt("portrait"))
    result.setPrivateProperty("stopList", it.getInt("stopList"))
    result.setPrivateProperty("mDL", it.getInt("mDL"))
    result.setPrivateProperty("age", it.getInt("age"))
    result.setPrivateProperty("captureProcessIntegrity", it.getInt("captureProcessIntegrity"))
    result.setPrivateProperty("detailsAge", detailsAgeFromJSON(it.getJSONObject("detailsAge")))
    result
}

fun generateDocumentReaderResultsStatus(input: DocumentReaderResultsStatus?) = input?.let {
    mapOf(
        "overallStatus" to it.overallStatus,
        "optical" to it.optical,
        "detailsOptical" to generateDetailsOptical(it.detailsOptical),
        "rfid" to it.rfid,
        "detailsRFID" to generateDetailsRFID(it.detailsRFID),
        "portrait" to it.portrait,
        "stopList" to it.stopList,
        "mDL" to it.mdl,
        "age" to it.age,
        "captureProcessIntegrity" to it.captureProcessIntegrity,
        "detailsAge" to generateDetailsAge(it.detailsAge),
    ).toJson()
}

fun detailsOpticalFromJSON(input: JSONObject?) = input?.let {
    val result = DetailsOptical::class.constructor().instantiate()
    result.setPrivateProperty("overallStatus", it.getInt("overallStatus"))
    result.setPrivateProperty("mrz", it.getInt("mrz"))
    result.setPrivateProperty("text", it.getInt("text"))
    result.setPrivateProperty("docType", it.getInt("docType"))
    result.setPrivateProperty("security", it.getInt("security"))
    result.setPrivateProperty("imageQA", it.getInt("imageQA"))
    result.setPrivateProperty("expiry", it.getInt("expiry"))
    result.setPrivateProperty("vds", it.getInt("vds"))
    result.setPrivateProperty("pagesCount", it.getInt("pagesCount"))
    result
}

fun generateDetailsOptical(input: DetailsOptical?) = input?.let {
    mapOf(
        "overallStatus" to it.overallStatus,
        "mrz" to it.mrz,
        "text" to it.text,
        "docType" to it.docType,
        "security" to it.security,
        "imageQA" to it.imageQA,
        "expiry" to it.expiry,
        "vds" to it.vds,
        "pagesCount" to it.pagesCount
    ).toJson()
}

fun detailsRFIDFromJSON(input: JSONObject?) = input?.let {
    val result = DetailsRFID::class.constructor().instantiate()
    result.setPrivateProperty("overallStatus", it.getInt("overallStatus"))
    result.setPrivateProperty("pa", it.getInt("pa"))
    result.setPrivateProperty("ca", it.getInt("ca"))
    result.setPrivateProperty("aa", it.getInt("aa"))
    result.setPrivateProperty("ta", it.getInt("ta"))
    result.setPrivateProperty("bac", it.getInt("bac"))
    result.setPrivateProperty("pace", it.getInt("pace"))
    result
}

fun generateDetailsRFID(input: DetailsRFID?) = input?.let {
    mapOf(
        "pa" to it.pa,
        "ca" to it.ca,
        "aa" to it.aa,
        "ta" to it.ta,
        "bac" to it.bac,
        "pace" to it.pace,
        "overallStatus" to it.overallStatus
    ).toJson()
}

fun detailsAgeFromJSON(input: JSONObject?) = input?.let {
    val result = DetailsAge::class.constructor().instantiate()
    result.setPrivateProperty("threshold", it.getInt("threshold"))
    result.setPrivateProperty("overThreshold", it.getInt("overThreshold"))
    result.setPrivateProperty("over18", it.getInt("over18"))
    result.setPrivateProperty("over21", it.getInt("over21"))
    result.setPrivateProperty("over25", it.getInt("over25"))
    result.setPrivateProperty("over65", it.getInt("over65"))
    result
}

fun generateDetailsAge(input: DetailsAge?) = input?.let {
    mapOf(
        "threshold" to it.threshold,
        "overThreshold" to it.overThreshold,
        "over18" to it.over18,
        "over21" to it.over21,
        "over25" to it.over25,
        "over65" to it.over65
    ).toJson()
}

fun vdsncDataFromJSON(input: JSONObject?) = input?.let {
    val result = VDSNCData::class.constructor().instantiate()
    result.setPrivateProperty("type", it.getStringOrNull("type"))
    result.setPrivateProperty("version", it.getInt("version"))
    result.setPrivateProperty("issuingCountry", it.getStringOrNull("issuingCountry"))
    result.setPrivateProperty("message", it.getJSONObjectOrNull("message"))
    result.setPrivateProperty("signatureAlg", it.getStringOrNull("signatureAlgorithm"))
    result.setPrivateProperty("signature", bytesDataFromJSON(it.getJSONObjectOrNull("signature")))
    result.setPrivateProperty("certificate", bytesDataFromJSON(it.getJSONObjectOrNull("certificate")))
    result.setPrivateProperty("certificateChain", it.getJSONArray("certificateChain").toList(::certificateChainFromJSON))
    result.setPrivateProperty("notifications", it.getJSONArray("notifications").toLongArray())
    result
}

fun generateVDSNCData(input: VDSNCData?) = input?.let {
    mapOf(
        "type" to it.type,
        "version" to it.version,
        "issuingCountry" to it.issuingCountry,
        "message" to it.message,
        "signatureAlgorithm" to it.signatureAlg,
        "signature" to generateBytesData(it.signature),
        "certificate" to generateBytesData(it.certificate),
        "certificateChain" to it.certificateChain.toJson(::generateCertificateChain),
        "notifications" to it.notifications.toJson()
    ).toJson()
}

fun bytesDataFromJSON(input: JSONObject?) = input?.let {
    val result = BytesData::class.constructor().instantiate()
    result.setPrivateProperty("data", it.getString("data"))
    result.setPrivateProperty("length", it.getInt("length"))
    result.setPrivateProperty("status", it.getLong("status"))
    result.setPrivateProperty("type", it.getInt("type"))
    result
}

fun generateBytesData(input: BytesData?) = input?.let {
    mapOf(
        "data" to it.data,
        "length" to it.length,
        "status" to it.status,
        "type" to it.type
    ).toJson()
}

fun generateLicense(input: License?) = input?.let {
    mapOf(
        "expiryDate" to it.expiryDate?.toString(),
        "countryFilter" to it.countryFilter?.toJson(),
        "isRfidAvailable" to it.isRfidAvailable
    ).toJson()
}

fun generateDocReaderVersion(input: DocReaderVersion?) = input?.let {
    mapOf(
        "api" to it.api,
        "core" to it.core,
        "coreMode" to it.coreMode,
        "database" to generateDocReaderDocumentsDatabase(it.database)
    ).toJson()
}

fun docReaderDocumentsDatabaseFromJSON(input: JSONObject?) = input?.let {
    DocReaderDocumentsDatabase::class.constructor(String::class, String::class, String::class, String::class, Int::class, Int::class, java.lang.Long::class).instantiate(
        it.getStringOrNull("databaseID"),
        it.getStringOrNull("version"),
        it.getStringOrNull("date"),
        it.getStringOrNull("databaseDescription"),
        it.getInt("countriesNumber"),
        it.getInt("documentsNumber"),
        it.getLongOrNull("size"),
    )
}

fun generateDocReaderDocumentsDatabase(input: DocReaderDocumentsDatabase?) = input?.let {
    mapOf(
        "databaseID" to it.databaseID,
        "version" to it.version,
        "date" to it.date,
        "databaseDescription" to it.databaseDescription,
        "countriesNumber" to it.countriesNumber,
        "documentsNumber" to it.documentsNumber,
        "size" to it.size
    ).toJson()
}

fun documentReaderComparisonFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderComparison()
    result.sourceTypeLeft = it.optInt("sourceTypeLeft")
    result.sourceTypeRight = it.optInt("sourceTypeRight")
    result.status = it.optInt("status")
    result
}

fun generateDocumentReaderComparison(input: DocumentReaderComparison?) = input?.let {
    mapOf(
        "sourceTypeLeft" to it.sourceTypeLeft,
        "sourceTypeRight" to it.sourceTypeRight,
        "status" to it.status
    ).toJson()
}

fun documentReaderRFIDOriginFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderRfidOrigin()

    result.dg = it.optInt("dg")
    result.dgTag = it.optInt("dgTag")
    result.entryView = it.optInt("entryView")
    result.tagEntry = it.optInt("tagEntry")

    result
}

fun generateDocumentReaderRFIDOrigin(input: DocumentReaderRfidOrigin?) = input?.let {
    mapOf(
        "dg" to it.dg,
        "dgTag" to it.dgTag,
        "entryView" to it.entryView,
        "tagEntry" to it.tagEntry
    ).toJson()
}

fun documentReaderTextSourceFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderTextSource()
    result.sourceType = it.optInt("sourceType")
    result.source = it.optString("source")
    result.validityStatus = it.optInt("validityStatus")
    result
}

fun generateDocumentReaderTextSource(input: DocumentReaderTextSource?) = input?.let {
    mapOf(
        "sourceType" to it.sourceType,
        "source" to it.source,
        "validityStatus" to it.validityStatus
    ).toJson()
}

fun documentReaderSymbolFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderSymbol()
    result.code = it.optInt("code")
    result.probability = it.optInt("probability")
    result.rect = rectFromJSON(it.optJSONObject("rect"))
    result
}

fun generateDocumentReaderSymbol(input: DocumentReaderSymbol?) = input?.let {
    mapOf(
        "code" to it.code,
        "rect" to generateRect(it.rect),
        "probability" to it.probability
    ).toJson()
}

fun documentReaderValidityFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderValidity()
    result.sourceType = it.optInt("sourceType")
    result.status = it.optInt("status")
    result
}

fun generateDocumentReaderValidity(input: DocumentReaderValidity?) = input?.let {
    mapOf(
        "sourceType" to it.sourceType,
        "status" to it.status
    ).toJson()
}

fun barcodeTypeArrayFromJson(input: JSONArray?) = input?.let {
    val result = arrayOfNulls<String>(it.length())
    for (i in 0 until it.length()) result[i] = BarcodeType.valueOf(it.getInt(i))
    result
}

fun generateBarcodeTypeArray(input: Array<String?>?) = input?.let {
    val result = JSONArray()
    for (s in it) result.put(
        when (s) {
            "bct_Code128" -> 1
            "bct_Code39" -> 2
            "bct_EAN8" -> 3
            "bct_ITF" -> 4
            "bct_PDF417" -> 5
            "bct_STF" -> 6
            "bct_MTF" -> 7
            "bct_IATA" -> 8
            "bct_CODABAR" -> 9
            "bct_UPCA" -> 10
            "bct_CODE93" -> 11
            "bct_UPCE" -> 12
            "bct_EAN13" -> 13
            "bct_QRCODE" -> 14
            "bct_AZTEC" -> 15
            "bct_DATAMATRIX" -> 16
            "bct_ALL_1D" -> 17
            "bct_Code11" -> 18
            "bct_JABCODE" -> 19
            else -> 0
        }
    )
    result
}

fun docFeatureFromJSON(input: JSONObject?) = input?.let {
    val result = DocFeature::class.constructor().instantiate()
    result.setPrivateProperty("type", it.getIntOrNull("type"))
    result.setPrivateProperty("data", bytesDataFromJSON(it.getJSONObjectOrNull("data")))
    result
}

fun generateDocFeature(input: DocFeature?) = input?.let {
    mapOf(
        "type" to it.type,
        "data" to generateBytesData(it.data),
    ).toJson()
}

fun vdsDataFromJSON(input: JSONObject?) = input?.let {
    val result = VDSData::class.constructor().instantiate()
    result.setPrivateProperty("version", it.getIntOrNull("version"))
    result.setPrivateProperty("type", it.getIntOrNull("type"))
    result.setPrivateProperty("docType", it.getIntOrNull("docType"))
    result.setPrivateProperty("featureRef", it.getIntOrNull("featureRef"))
    result.setPrivateProperty("issuingCountry", it.getStringOrNull("issuingCountry"))
    result.setPrivateProperty("docIssueDate", it.getStringOrNull("docIssueDate"))
    result.setPrivateProperty("signature", bytesDataFromJSON(it.getJSONObjectOrNull("signature")))
    result.setPrivateProperty("signatureDate", it.getStringOrNull("signatureDate"))
    result.setPrivateProperty("signer", it.getStringOrNull("signer"))
    result.setPrivateProperty("certificate", it.getStringOrNull("certificate"))
    result.setPrivateProperty("certificateChain", it.getJSONArray("certificateChain").toList(::certificateChainFromJSON))
    result.setPrivateProperty("docFeatures", it.getJSONArray("docFeatures").toList(::docFeatureFromJSON))
    result.setPrivateProperty("notifications", it.getJSONArray("notifications").toLongArray())
    result
}

fun generateVDSData(input: VDSData?) = input?.let {
    mapOf(
        "version" to it.version,
        "type" to it.type,
        "docType" to it.docType,
        "featureRef" to it.featureRef,
        "issuingCountry" to it.issuingCountry,
        "docIssueDate" to it.docIssueDate,
        "signature" to generateBytesData(it.signature),
        "signatureDate" to it.signatureDate,
        "signer" to it.signer,
        "certificate" to it.certificate,
        "certificateChain" to it.certificateChain.toJson(::generateCertificateChain),
        "docFeatures" to it.docFeatures.toJson(::generateDocFeature),
        "notifications" to it.notifications.toJson(),
    ).toJson()
}

fun documentReaderResultsFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentReaderResults()

    result.chipPage = it.optInt("chipPage")
    result.processingFinishedStatus = it.optInt("processingFinishedStatus")
    result.elapsedTime = it.optInt("elapsedTime")
    result.elapsedTimeRFID = it.optInt("elapsedTimeRFID")
    result.morePagesAvailable = it.optInt("morePagesAvailable")
    result.graphicResult = documentReaderGraphicResultFromJSON(it.optJSONObject("graphicResult"))
    result.textResult = documentReaderTextResultFromJSON(it.optJSONObject("textResult"))
    result.documentPosition = it.optJSONArray("documentPosition").toList(::elementPositionFromJSON)!!
    result.barcodePosition = it.optJSONArray("barcodePosition").toList(::elementPositionFromJSON)!!
    result.mrzPosition = it.optJSONArray("mrzPosition").toList(::elementPositionFromJSON)!!
    result.imageQuality = it.optJSONArray("imageQuality").toList(::imageQualityGroupFromJSON)!!
    result.rawResult = it.optString("rawResult")
    result.rfidSessionData = rfidSessionDataFromJSON(it.optJSONObject("rfidSessionData"))
    result.authenticityResult = documentReaderAuthenticityResultFromJSON(it.optJSONObject("authenticityResult"))
    result.barcodeResult = documentReaderBarcodeResultFromJSON(it.optJSONObject("barcodeResult"))
    result.rfidSessionData = rfidSessionDataFromJSON(it.optJSONObject("rfidSessionData"))
    result.documentType = it.optJSONArray("documentType").toList(::documentReaderDocumentTypeFromJSON)!!
    result.status = documentReaderResultsStatusFromJSON(it.optJSONObject("status"))!!
    result.vdsncData = vdsncDataFromJSON(it.getJSONObject("vdsncData"))
    result.vdsData = vdsDataFromJSON(it.getJSONObjectOrNull("vdsData"))
    result.dtcData = it.getString("dtcData")
    result.transactionInfo = transactionInfoFromJSON(it.optJSONObject("transactionInfo"))!!
    result
}

fun generateDocumentReaderResults(input: DocumentReaderResults?) = input?.let {
    mapOf(
        "chipPage" to it.chipPage,
        "processingFinishedStatus" to it.processingFinishedStatus,
        "elapsedTime" to it.elapsedTime,
        "elapsedTimeRFID" to it.elapsedTimeRFID,
        "morePagesAvailable" to it.morePagesAvailable,
        "graphicResult" to generateDocumentReaderGraphicResult(it.graphicResult),
        "textResult" to generateDocumentReaderTextResult(it.textResult),
        "documentPosition" to it.documentPosition.toJson(::generateElementPosition),
        "barcodePosition" to it.barcodePosition.toJson(::generateElementPosition),
        "mrzPosition" to it.mrzPosition.toJson(::generateElementPosition),
        "imageQuality" to it.imageQuality.toJson(::generateImageQualityGroup),
        "rawResult" to it.rawResult,
        "rfidSessionData" to generateRFIDSessionData(it.rfidSessionData),
        "authenticityResult" to generateDocumentReaderAuthenticityResult(it.authenticityResult),
        "barcodeResult" to generateDocumentReaderBarcodeResult(it.barcodeResult),
        "documentType" to it.documentType.toJson(::generateDocumentReaderDocumentType),
        "status" to generateDocumentReaderResultsStatus(it.status),
        "vdsncData" to generateVDSNCData(it.vdsncData),
        "vdsData" to generateVDSData(it.vdsData),
        "dtcData" to it.dtcData,
        "transactionInfo" to generateTransactionInfo(it.transactionInfo)
    ).toJson()
}

fun matrixFromJSON(input: JSONArray?) = input?.let {
    val matrix = Matrix()
    val result = FloatArray(it.length())
    for (i in 0 until it.length()) result[i] = it.getDouble(i).toFloat()
    matrix.setValues(result)
    matrix
}

fun generateMatrix(input: Matrix?) = input?.let {
    val floats = FloatArray(9)
    it.getValues(floats)
    val result = JSONArray()
    for (f in floats) result.put(java.lang.Float.valueOf(f))
    result
}

fun deviceRetrievalMethodFromJSON(input: JSONObject?) = input?.let {
    val result = DeviceRetrievalMethod::class.constructor().instantiate()
    result.setPrivateProperty("type", it.getInt("type"))
    result.setPrivateProperty("version", it.getIntOrNull("version"))
    result.setPrivateProperty("cmdMaxLength", it.getIntOrNull("cmdMaxLength"))
    result.setPrivateProperty("respMaxLength", it.getIntOrNull("respMaxLength"))
    result.setPrivateProperty("clientModeSupport", it.getBooleanOrNull("clientModeSupport"))
    result.setPrivateProperty("clientModeUUID", it.getStringOrNull("clientModeUUID"))
    result.setPrivateProperty("serverModeSupport", it.getBooleanOrNull("serverModeSupport"))
    result.setPrivateProperty("serverModeUUID", it.getStringOrNull("serverModeUUID"))
    result
}

fun generateDeviceRetrievalMethod(input: DeviceRetrievalMethod?) = input?.let {
    mapOf(
        "type" to it.type,
        "version" to it.version,
        "cmdMaxLength" to it.cmdMaxLength,
        "respMaxLength" to it.respMaxLength,
        "clientModeSupport" to it.clientModeSupport,
        "clientModeUUID" to it.clientModeUUID,
        "serverModeSupport" to it.serverModeSupport,
        "serverModeUUID" to it.serverModeUUID,
    ).toJson()
}

fun deviceEngagementFromJSON(input: JSONObject?) = input?.let {
    val result = DeviceEngagement::class.constructor().instantiate()

    result.setPrivateProperty("deviceRetrievalMethods", it.getJSONArray("deviceRetrievalMethods").toList(::deviceRetrievalMethodFromJSON))

    result
}

fun generateDeviceEngagement(input: DeviceEngagement?) = input?.let {
    mapOf(
        "deviceRetrievalMethods" to it.deviceRetrievalMethods.toJson(::generateDeviceRetrievalMethod)
    ).toJson()
}

fun nameSpaceMDLFromJSON(input: JSONObject?) = input?.let {
    val result = NameSpaceMDL(it.getString("name"))
    it.getJSONObject("map").forEach { key, value ->
        result.addField(key, eMDLIntentToRetain.values()[value as Int])
    }
    result
}

fun generateNameSpaceMDL(input: NameSpaceMDL?) = input?.let {
    val map = JSONObject()
    (it.getPrivateProperty("map") as Map<String, eMDLIntentToRetain>).forEach { (key, value) ->
        map.put(key, value.ordinal)
    }
    mapOf(
        "name" to it.getPrivateProperty("name"),
        "map" to map,
    ).toJson()
}

fun documentRequestMDLFromJSON(input: JSONObject?): DocumentRequestMDL? = input?.let {
    val docType = it.getString("docType")
    if (docType == "org.iso.18013.5.1.mDL") return@let documentRequest18013MDLFromJSON(it)
    val result = DocumentRequestMDL(docType)

    result.setPrivateProperty("nameSpaceMDLs", it.getJSONArray("namespaces").toList(::nameSpaceMDLFromJSON))

    result
}

fun generateDocumentRequestMDL(input: DocumentRequestMDL?): JSONObject? = input?.let {
    val docType = it.getPrivateProperty("docType") as String
    if (docType == "org.iso.18013.5.1.mDL") return@let generateDocumentRequest18013MDL(it as DocumentRequest18013MDL?)
    mapOf(
        "docType" to docType,
        "namespaces" to (it.getPrivateProperty("nameSpaceMDLs") as List<NameSpaceMDL>).toJson(::generateNameSpaceMDL),
    ).toJson()
}

fun documentRequest18013MDLFromJSON(input: JSONObject?) = input?.let {
    val result = DocumentRequest18013MDL()

    if (it.has("docType")) result.setPrivateProperty("docType", it.getString("docType"))
    if (it.has("namespaces")) result.setPrivateProperty("nameSpaceMDLs", it.getJSONArray("namespaces").toList(::nameSpaceMDLFromJSON))
    result.familyName = it.getIntOrNull("familyName")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.givenName = it.getIntOrNull("givenName")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.birthDate = it.getIntOrNull("birthDate")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.issueDate = it.getIntOrNull("issueDate")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.expiryDate = it.getIntOrNull("expiryDate")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.issuingCountry = it.getIntOrNull("issuingCountry")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.issuingAuthority = it.getIntOrNull("issuingAuthority")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.documentNumber = it.getIntOrNull("documentNumber")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.portrait = it.getIntOrNull("portrait")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.drivingPrivileges = it.getIntOrNull("drivingPrivileges")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.unDistinguishingSign = it.getIntOrNull("unDistinguishingSign")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.administrativeNumber = it.getIntOrNull("administrativeNumber")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.sex = it.getIntOrNull("sex")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.height = it.getIntOrNull("height")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.weight = it.getIntOrNull("weight")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.eyeColour = it.getIntOrNull("eyeColour")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.hairColour = it.getIntOrNull("hairColour")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.birthPlace = it.getIntOrNull("birthPlace")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.residentAddress = it.getIntOrNull("residentAddress")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.portraitCaptureDate = it.getIntOrNull("portraitCaptureDate")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.ageInYears = it.getIntOrNull("ageInYears")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.ageBirthYear = it.getIntOrNull("ageBirthYear")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.ageOver18 = it.getIntOrNull("ageOver18")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.issuingJurisdiction = it.getIntOrNull("issuingJurisdiction")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.nationality = it.getIntOrNull("nationality")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.residentCity = it.getIntOrNull("residentCity")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.residentState = it.getIntOrNull("residentState")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.residentPostalCode = it.getIntOrNull("residentPostalCode")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.residentCountry = it.getIntOrNull("residentCountry")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.biometricTemplateFace = it.getIntOrNull("biometricTemplateFace")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.biometricTemplateIris = it.getIntOrNull("biometricTemplateIris")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.biometricTemplateFinger = it.getIntOrNull("biometricTemplateFinger")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.biometricTemplateSignatureSign = it.getIntOrNull("biometricTemplateSignatureSign")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.familyNameNationalCharacter = it.getIntOrNull("familyNameNationalCharacter")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.givenNameNationalCharacter = it.getIntOrNull("givenNameNationalCharacter")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result.signatureUsualMark = it.getIntOrNull("signatureUsualMark")?.let { enm -> eMDLIntentToRetain.values()[enm] }
    result
}

fun generateDocumentRequest18013MDL(input: DocumentRequest18013MDL?) = input?.let {
    mapOf(
        "docType" to it.getPrivateProperty("docType"),
        "namespaces" to (it.getPrivateProperty("nameSpaceMDLs") as List<NameSpaceMDL>).toJson(::generateNameSpaceMDL),
        "familyName" to it.familyName?.ordinal,
        "givenName" to it.givenName?.ordinal,
        "birthDate" to it.birthDate?.ordinal,
        "issueDate" to it.issueDate?.ordinal,
        "expiryDate" to it.expiryDate?.ordinal,
        "issuingCountry" to it.issuingCountry?.ordinal,
        "issuingAuthority" to it.issuingAuthority?.ordinal,
        "documentNumber" to it.documentNumber?.ordinal,
        "portrait" to it.portrait?.ordinal,
        "drivingPrivileges" to it.drivingPrivileges?.ordinal,
        "unDistinguishingSign" to it.unDistinguishingSign?.ordinal,
        "administrativeNumber" to it.administrativeNumber?.ordinal,
        "sex" to it.sex?.ordinal,
        "height" to it.height?.ordinal,
        "weight" to it.weight?.ordinal,
        "eyeColour" to it.eyeColour?.ordinal,
        "hairColour" to it.hairColour?.ordinal,
        "birthPlace" to it.birthPlace?.ordinal,
        "residentAddress" to it.residentAddress?.ordinal,
        "portraitCaptureDate" to it.portraitCaptureDate?.ordinal,
        "ageInYears" to it.ageInYears?.ordinal,
        "ageBirthYear" to it.ageBirthYear?.ordinal,
        "ageOver18" to it.ageOver18?.ordinal,
        "issuingJurisdiction" to it.issuingJurisdiction?.ordinal,
        "nationality" to it.nationality?.ordinal,
        "residentCity" to it.residentCity?.ordinal,
        "residentState" to it.residentState?.ordinal,
        "residentPostalCode" to it.residentPostalCode?.ordinal,
        "residentCountry" to it.residentCountry?.ordinal,
        "biometricTemplateFace" to it.biometricTemplateFace?.ordinal,
        "biometricTemplateIris" to it.biometricTemplateIris?.ordinal,
        "biometricTemplateFinger" to it.biometricTemplateFinger?.ordinal,
        "biometricTemplateSignatureSign" to it.biometricTemplateSignatureSign?.ordinal,
        "familyNameNationalCharacter" to it.familyNameNationalCharacter?.ordinal,
        "givenNameNationalCharacter" to it.givenNameNationalCharacter?.ordinal,
        "signatureUsualMark" to it.signatureUsualMark?.ordinal,
    ).toJson()
}

fun dataRetrievalFromJSON(input: JSONObject?) = input?.let {
    val result = DataRetrieval(eMDLDeviceRetrieval.values().first { enm -> enm.value == it.getInt("deviceRetrieval") })
    result.setPrivateProperty("docRequestPreset", it.getIntOrNull("docRequestPreset")?.let { enm -> eMDLDocRequestPreset.values()[enm] })
    result.setPrivateProperty("intentToRetain", it.getIntOrNull("intentToRetain")?.let { enm -> eMDLIntentToRetain.values()[enm] })
    it.getJSONArray("requests").toList(::documentRequestMDLFromJSON)?.forEach { r -> result.addDocRequest(r!!) }
    result
}

fun generateDataRetrieval(input: DataRetrieval?) = input?.let {
    mapOf(
        "deviceRetrieval" to it.deviceRetrieval.value,
        "docRequestPreset" to (it.getPrivateProperty("docRequestPreset") as eMDLDocRequestPreset).ordinal,
        "intentToRetain" to (it.getPrivateProperty("intentToRetain") as eMDLIntentToRetain).ordinal,
        "requests" to (it.getPrivateProperty("docRequests") as List<DocumentRequestMDL>).toJson(::generateDocumentRequestMDL),
    ).toJson()
}

fun generateDeviceEngagementCompletion(deviceEngagement: DeviceEngagement?, error: RegulaException?) = mapOf(
    "deviceEngagement" to generateDeviceEngagement(deviceEngagement),
    "error" to generateRegulaException(error)
)
