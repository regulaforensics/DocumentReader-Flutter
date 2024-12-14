//
//  JSONConstructor.kt
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
@file:SuppressLint("MissingPermission")

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Bitmap
import android.graphics.Rect
import android.graphics.Typeface
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
import com.regula.documentreader.api.enums.eRFID_DataFile_Type
import com.regula.documentreader.api.enums.eRPRM_Lights
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
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.bitmapFromBase64
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.bitmapToBase64
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.byteArrayFromBase64
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.generateByteArray
import org.json.JSONArray
import org.json.JSONObject

fun generateCompletion(action: Int, results: DocumentReaderResults?, error: RegulaException?, context: Context?) = object : JSONObject() { init {
    put("action", action)
    if (listOf(
            DocReaderAction.COMPLETE,
            DocReaderAction.MORE_PAGES_AVAILABLE,
            DocReaderAction.CANCEL,
            DocReaderAction.ERROR,
            DocReaderAction.TIMEOUT
        ).contains(action)
    ) put("results", generateDocumentReaderResults(results, context))
    put("error", generateRegulaException(error))
}
}

fun generateSuccessCompletion(success: Boolean, error: RegulaException?) = object : JSONObject() { init {
    put("success", success)
    put("error", generateRegulaException(error))
}
}

fun prepareProgressFromJSON(it: JSONObject) = PrepareProgress(
    it.getInt("downloadedBytes"),
    it.getInt("totalBytes")
)

fun generatePrepareProgress(it: PrepareProgress) = mapOf(
    "downloadedBytes" to it.downloadedBytes,
    "totalBytes" to it.totalBytes,
    "progress" to it.progress
).toJson()

fun generatePACertificateCompletion(serialNumber: ByteArray?, issuer: PAResourcesIssuer?) = object : JSONObject() { init {
    put("serialNumber", generateByteArray(serialNumber))
    put("issuer", generatePAResourcesIssuer(issuer))
}
}

fun generateFinalizePackageCompletion(action: Int, info: TransactionInfo?, error: RegulaException?) = object : JSONObject() { init {
    put("action", action)
    put("info", generateTransactionInfo(info))
    put("error", generateRegulaException(error))
}
}

fun regulaExceptionFromJSON(temp: JSONObject?) = temp?.let {
    val input: JSONObject = temp

    val code = input.optInt("code")
    val message = input.optString("message")

    RegulaException(code, message)
}

fun generateRegulaException(temp: RegulaException?): JSONObject? = temp?.let {
    object : JSONObject() { init {
        val input: RegulaException = it
        put("code", input.errorCode)
        put("message", input.message)
    }
    }
}

fun transactionInfoFromJSON(temp: JSONObject?): TransactionInfo? {
    temp ?: return null
    val input: JSONObject = temp
    val result = TransactionInfo()

    if (input.has("transactionId")) result.transactionId = input.getString("transactionId")
    if (input.has("tag")) result.tag = input.getString("tag")

    return result
}

fun generateTransactionInfo(temp: TransactionInfo?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: TransactionInfo = temp

    result.put("transactionId", input.transactionId)
    result.put("tag", input.tag)

    return result
}

fun tccParamsFromJSON(input: JSONObject): TccParams {
    val result = TccParams()

    if (input.has("serviceUrlTA")) result.serviceUrlTA = input.getString("serviceUrlTA")
    if (input.has("serviceUrlPA")) result.serviceUrlPA = input.getString("serviceUrlPA")
    if (input.has("pfxCertUrl")) result.pfxCertUrl = input.getString("pfxCertUrl")
    if (input.has("pfxPassPhrase")) result.pfxPassPhrase = input.getString("pfxPassPhrase")
    if (input.has("pfxCert")) result.pfxCert = byteArrayFromBase64(input.getString("pfxCert"))

    return result
}

fun generateTccParams(temp: TccParams?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: TccParams = temp

    result.put("serviceUrlTA", input.serviceUrlTA)
    result.put("serviceUrlPA", input.serviceUrlPA)
    result.put("pfxCertUrl", input.pfxCertUrl)
    result.put("pfxPassPhrase", input.pfxPassPhrase)
    result.put("pfxCert", generateByteArray(input.pfxCert))

    return result
}

fun docReaderConfigFromJSON(input: JSONObject): DocReaderConfig {
    val license = byteArrayFromBase64(input.getString("license"))
    var result = DocReaderConfig(license!!)

    if (input.has("customDb")) result = DocReaderConfig(license, byteArrayFromBase64(input.getString("customDb"))!!)
    if (input.has("databasePath")) result = DocReaderConfig(license, input.getString("databasePath"))
    if (input.has("licenseUpdate")) result.setLicenseUpdate(input.getBoolean("licenseUpdate"))
    if (input.has("delayedNNLoad")) result.isDelayedNNLoad = input.getBoolean("delayedNNLoad")
    if (input.has("blackList")) result.blackList = input.getJSONObject("blackList")

    return result
}

fun generateDocReaderConfig(temp: DocReaderConfig?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocReaderConfig = temp

    result.put("license", generateByteArray(input.license))
    result.put("customDb", generateByteArray(input.customDb))
    result.put("databasePath", input.customDbPath)
    result.put("licenseUpdate", input.isLicenseUpdate)
    result.put("delayedNNLoad", input.isDelayedNNLoad)
    result.put("blackList", input.blackList)

    return result
}

fun bleDeviceConfigFromJSON(input: JSONObject): BleDeviceConfig {
    var result = BleDeviceConfig(bluetooth)

    if (input.has("customDb")) result = BleDeviceConfig(bluetooth, byteArrayFromBase64(input.getString("customDb")))
    if (input.has("licenseUpdate")) result.setLicenseUpdate(input.getBoolean("licenseUpdate"))
    if (input.has("delayedNNLoad")) result.isDelayedNNLoad = input.getBoolean("delayedNNLoad")
    if (input.has("blackList")) result.blackList = input.getJSONObject("blackList")

    return result
}

fun scannerConfigFromJSON(input: JSONObject): ScannerConfig {
    val builder = if (input.has("scenario")) ScannerConfig.Builder(input.getString("scenario"))
    else ScannerConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig"))!!)

    if (input.has("onlineProcessingConfig")) builder.setOnlineProcessingConfig(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")))
    if (input.has("livePortrait")) builder.setLivePortrait(bitmapFromBase64(input.getString("livePortrait"))!!)
    if (input.has("extPortrait")) builder.setExtPortrait(bitmapFromBase64(input.getString("extPortrait"))!!)
    if (input.has("cameraId")) builder.setCameraId(input.getInt("cameraId"))

    return builder.build()
}

fun generateScannerConfig(temp: ScannerConfig?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: ScannerConfig = temp

    result.put("scenario", input.scenario)
    result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.onlineProcessingConfig))
    result.put("livePortrait", bitmapToBase64(input.livePortrait))
    result.put("extPortrait", bitmapToBase64(input.extPortrait))
    result.put("cameraId", input.cameraId)

    return result
}

fun recognizeConfigFromJSON(input: JSONObject): RecognizeConfig {
    val builder = if (input.has("scenario")) RecognizeConfig.Builder(input.getString("scenario"))
    else RecognizeConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig"))!!)

    if (input.has("oneShotIdentification")) builder.setOneShotIdentification(input.getBoolean("oneShotIdentification"))
    if (input.has("dtc")) builder.setDTC(byteArrayFromBase64(input.getString("dtc"))!!)
    if (input.has("livePortrait")) builder.setLivePortrait(bitmapFromBase64(input.getString("livePortrait"))!!)
    if (input.has("extPortrait")) builder.setExtPortrait(bitmapFromBase64(input.getString("extPortrait"))!!)
    if (input.has("image")) builder.setBitmap(bitmapFromBase64(input.getString("image"))!!)
    if (input.has("data")) builder.setData(byteArrayFromBase64(input.getString("data"))!!)
    if (input.has("images")) {
        val base64Images = input.getJSONArray("images")
        val images = arrayOfNulls<Bitmap>(base64Images.length())
        for (i in images.indices) images[i] = bitmapFromBase64(base64Images.getString(i))
        builder.setBitmaps(images)
    }
    if (input.has("imageInputData")) {
        val base64InputData = input.getJSONArray("imageInputData")
        val inputData = arrayOfNulls<ImageInputData>(base64InputData.length())
        for (i in inputData.indices) inputData[i] = imageInputDataFromJSON(base64InputData.getJSONObject(i))
        builder.setImageInputData(inputData)
    }

    return builder.build()
}

fun generateRecognizeConfig(temp: RecognizeConfig?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: RecognizeConfig = temp

    result.put("scenario", input.scenario)
    result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.onlineProcessingConfig))
    result.put("oneShotIdentification", input.oneShotIdentification)
    result.put("dtc", generateByteArray(input.dtc))
    result.put("livePortrait", bitmapToBase64(input.livePortrait))
    result.put("extPortrait", bitmapToBase64(input.extPortrait))
    result.put("image", bitmapToBase64(input.bitmap))
    result.put("data", generateByteArray(input.data))
    if (input.bitmaps == null)
        result.put("images", null)
    else {
        val array = JSONArray()
        for (bitmap in input.bitmaps!!) array.put(bitmapToBase64(bitmap))
        result.put("images", array)
    }
    result.put("imageInputData", generateArray(input.imageInputData, ::generateImageInputData))

    return result
}

fun backendProcessingConfigFromJSON(temp: JSONObject?): BackendProcessingConfig? {
    if (temp == null || !temp.has("url")) return null
    val input: JSONObject = temp

    val result = BackendProcessingConfig(input.getString("url"))
    if (input.has("httpHeaders")) result.httpHeaders = stringMapFromJson(input.getJSONObject("httpHeaders"))
    if (input.has("rfidServerSideChipVerification")) result.rfidServerSideChipVerification = input.getBoolean("rfidServerSideChipVerification")
    if (input.has("timeoutConnection")) result.timeoutConnection = input.getDouble("timeoutConnection")

    return result
}

fun generateBackendProcessingConfig(temp: BackendProcessingConfig?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: BackendProcessingConfig = temp

    result.put("url", input.url)
    result.put("httpHeaders", generateStringMap(input.httpHeaders))
    result.put("rfidServerSideChipVerification", input.rfidServerSideChipVerification)
    result.put("timeoutConnection", input.timeoutConnection)

    return result
}

fun onlineProcessingConfigFromJSON(temp: JSONObject?): OnlineProcessingConfig? {
    if (temp == null || !temp.has("mode")) return null
    val input: JSONObject = temp
    val builder = OnlineProcessingConfig.Builder(input.getInt("mode"))

    if (input.has("imageFormat")) builder.setImageFormat(input.getInt("imageFormat"))
    if (input.has("url")) builder.setUrl(input.getString("url"))
    if (input.has("imageCompressionQuality")) builder.setImageCompressionQuality(input.getDouble("imageCompressionQuality").toFloat())
    if (input.has("processParams")) builder.setProcessParams(processParamFromJSON(input.getJSONObject("processParams")))

    return builder.build()
}

fun generateOnlineProcessingConfig(temp: OnlineProcessingConfig?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: OnlineProcessingConfig = temp

    result.put("mode", input.mode)
    result.put("url", input.url)
    result.put("processParams", getProcessParams(input.processParam))
    result.put("imageFormat", input.imageFormat)
    result.put("imageCompressionQuality", input.imageCompressionQuality)

    return result
}

fun faceApiParamsFromJSON(temp: JSONObject?): FaceApiParams? {
    val result = FaceApiParams()
    temp ?: return null
    val input: JSONObject = temp

    if (input.has("url") && !input.isNull("url")) result.url = input.getString("url")
    if (input.has("mode") && !input.isNull("mode")) result.mode = input.getString("mode")
    if (input.has("searchParams") && !input.isNull("searchParams")) result.search = faceApiSearchParamsFromJSON(input.getJSONObject("searchParams"))
    if (input.has("threshold") && !input.isNull("threshold")) result.threshold = input.getInt("threshold")
    if (input.has("serviceTimeout") && !input.isNull("serviceTimeout")) result.serviceTimeout = input.getInt("serviceTimeout")
    if (input.has("proxy") && !input.isNull("proxy")) result.proxy = input.getString("proxy")
    if (input.has("proxyPassword") && !input.isNull("proxyPassword")) result.proxyUserPwd = input.getString("proxyPassword")
    if (input.has("proxyType") && !input.isNull("proxyType")) result.proxyType = input.getInt("proxyType")

    return result
}

fun generateFaceApiParams(temp: FaceApiParams?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: FaceApiParams = temp

    result.put("url", input.url)
    result.put("mode", input.mode)
    result.put("searchParams", generateFaceApiSearchParams(input.search))
    result.put("threshold", input.threshold)
    result.put("serviceTimeout", input.serviceTimeout)
    result.put("proxy", input.proxy)
    result.put("proxyPassword", input.proxyUserPwd)
    result.put("proxyType", input.proxyType)

    return result
}

fun faceApiSearchParamsFromJSON(temp: JSONObject?): FaceApiParams.Search? {
    val result = FaceApiParams.Search()
    temp ?: return null
    val input: JSONObject = temp

    if (input.has("limit") && !input.isNull("limit")) result.limit = input.getInt("limit")
    if (input.has("threshold") && !input.isNull("threshold")) result.threshold = input.getDouble("threshold").toFloat()
    if (input.has("groupIds") && !input.isNull("groupIds")) {
        val jsonArrayGroupIds = input.getJSONArray("groupIds")
        val groupIds = IntArray(jsonArrayGroupIds.length())
        for (i in 0 until jsonArrayGroupIds.length())
            groupIds[i] = jsonArrayGroupIds.getInt(i)
        result.groupIds = groupIds
    }

    return result
}

fun generateFaceApiSearchParams(temp: FaceApiParams.Search?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: FaceApiParams.Search = temp

    result.put("limit", input.limit)
    result.put("threshold", input.threshold)
    result.put("groupIds", input.groupIds.generate())

    return result
}

fun rfidParamsFromJSON(temp: JSONObject?): RFIDParams? {
    val result = RFIDParams()
    temp ?: return null
    val input: JSONObject = temp

    if (input.has("paIgnoreNotificationCodes")) result.paIgnoreNotificationCodes = input.getJSONArray("paIgnoreNotificationCodes").toIntArray()

    return result
}

fun generateRFIDParams(temp: RFIDParams?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: RFIDParams = temp

    result.put("paIgnoreNotificationCodes", input.paIgnoreNotificationCodes.generate())

    return result
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

fun dtcDataGroupsFromJSON(input: JSONObject): DTCDataGroup {
    val result = DTCDataGroup()
    setDataGroups(result, input)
    return result
}

fun generateDTCDataGroups(input: DTCDataGroup): JSONObject = getDataGroups(input)

fun rfidScenarioFromJSON(input: JSONObject): RfidScenario {
    val result = RfidScenario()
    setRfidScenario(result, input)
    return result
}

fun generateRfidScenario(input: RfidScenario): JSONObject = getRfidScenario(input)

fun customizationFromJSON(input: JSONObject, context: Context): ParamsCustomization {
    val result = ParamsCustomization()
    setCustomization(result, input, context)
    return result
}

fun generateCustomization(input: ParamsCustomization): JSONObject = getCustomization(input)

fun functionalityFromJSON(input: JSONObject): Functionality {
    val result = Functionality()
    setFunctionality(result, input)
    return result
}

fun generateFunctionality(input: Functionality): JSONObject = getFunctionality(input)

fun glaresCheckParamsFromJSON(temp: JSONObject?): GlaresCheckParams? {
    temp ?: return null
    val input: JSONObject = temp
    val result = GlaresCheckParams()

    if (input.has("imgMarginPart")) result.imgMarginPart = input.getDouble("imgMarginPart")
    if (input.has("maxGlaringPart")) result.maxGlaringPart = input.getDouble("maxGlaringPart")

    return result
}

fun generateGlaresCheckParams(temp: GlaresCheckParams?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: GlaresCheckParams = temp

    result.put("imgMarginPart", input.imgMarginPart)
    result.put("maxGlaringPart", input.maxGlaringPart)

    return result
}

fun typefaceFromJSON(input: JSONObject): Pair<Typeface, Int?> {
    val name = input.getString("name")
    val style = input.optInt("style", Typeface.NORMAL)
    val size = if (input.has("size")) input.getInt("size") else null
    return Pair(Typeface.create(name, style), size)
}

fun generateTypeface(temp: Typeface?, size: Int? = null): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Typeface = temp

    result.put("name", "undefined")
    result.put("style", input.style)
    result.put("size", size)

    return result
}

fun imageInputDataFromJSON(temp: JSONObject?): ImageInputData? {
    if (temp == null || !temp.has("image")) return null
    val input: JSONObject = temp

    var light = 6
    var pageIndex = 0
    val image = bitmapFromBase64(input.getString("image"))!!
    if (input.has("light")) light = input.getInt("light")
    if (input.has("pageIndex")) pageIndex = input.getInt("pageIndex")

    return ImageInputData(image, light, pageIndex)
}

fun generateImageInputData(temp: ImageInputData?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: ImageInputData = temp

    result.put("image", bitmapToBase64(input.bitmap))
    result.put("light", input.light)
    result.put("pageIndex", input.pageIndex)

    return result
}

fun pkdCertificateFromJSON(temp: JSONObject?): PKDCertificate? {
    temp ?: return null
    val input: JSONObject = temp
    var resourceType = 0
    var binaryData = ByteArray(0)

    if (input.has("resourceType")) resourceType = input.getInt("resourceType")
    if (input.has("binaryData")) binaryData = byteArrayFromBase64(input.getString("binaryData"))!!
    if (input.has("privateKey")) {
        val privateKey = byteArrayFromBase64(input.getString("privateKey"))
        return PKDCertificate(binaryData, resourceType, privateKey)
    }
    return PKDCertificate(binaryData, resourceType)
}

fun generatePKDCertificate(temp: PKDCertificate?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: PKDCertificate = temp

    result.put("resourceType", input.resourceType)
    result.put("binaryData", generateByteArray(input.binaryData))
    result.put("privateKey", generateByteArray(input.privateKey))

    return result
}

fun documentReaderScenarioFromJSON(temp: JSONObject?): DocumentReaderScenario? {
    temp ?: return null
    val input: JSONObject = temp

    val name = input.optString("name")
    val caption = input.optString("caption")
    val description = input.optString("description")
    val multiPageOff = input.optBoolean("multiPageOff")
    val frameKWHLandscape = input.optDouble("frameKWHLandscape")
    val frameKWHPortrait = input.optDouble("frameKWHPortrait")
    val frameKWHDoublePageSpreadPortrait = input.optDouble("frameKWHDoublePageSpreadPortrait")
    val frameKWHDoublePageSpreadLandscape = input.optDouble("frameKWHDoublePageSpreadLandscape")
    val frameOrientation = input.optInt("frameOrientation")
    val uvTorch = input.optBoolean("uvTorch")
    val faceExt = input.optBoolean("faceExt")
    val seriesProcessMode = input.optBoolean("seriesProcessMode")
    val manualCrop = input.optBoolean("manualCrop")

    return DocumentReaderScenario(name, caption, description, if (multiPageOff) 1 else 0, frameKWHLandscape, frameKWHPortrait, frameKWHDoublePageSpreadPortrait, frameKWHDoublePageSpreadLandscape, frameOrientation, uvTorch, faceExt, seriesProcessMode, manualCrop, null)
}

fun generateDocumentReaderScenario(temp: DocumentReaderScenario?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderScenario = temp

    result.put("name", input.name)
    result.put("caption", input.caption)
    result.put("description", input.description)
    result.put("multiPageOff", input.multiPageOff)
    result.put("frameKWHLandscape", input.frameKWHLandscape)
    result.put("frameKWHPortrait", input.frameKWHPortrait)
    result.put("frameKWHDoublePageSpreadPortrait", input.frameKWHDoublePageSpreadPortrait)
    result.put("frameKWHDoublePageSpreadLandscape", input.frameKWHDoublePageSpreadLandscape)
    result.put("frameOrientation", input.frameOrientation)
    result.put("uvTorch", input.uvTorch)
    result.put("faceExt", input.faceExt)
    result.put("seriesProcessMode", input.seriesProcessMode)
    result.put("manualCrop", input.manualCrop)

    return result
}

fun rectFromJSON(temp: JSONObject?): Rect? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Rect()

    result.bottom = input.optInt("bottom")
    result.top = input.optInt("top")
    result.left = input.optInt("left")
    result.right = input.optInt("right")

    return result
}

fun generateRect(temp: Rect?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Rect = temp

    result.put("bottom", input.bottom)
    result.put("top", input.top)
    result.put("left", input.left)
    result.put("right", input.right)

    return result
}

fun docReaderFieldRectFromJSON(temp: JSONObject?): DocReaderFieldRect? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocReaderFieldRect()

    result.bottom = input.optInt("bottom")
    result.top = input.optInt("top")
    result.left = input.optInt("left")
    result.right = input.optInt("right")

    return result
}

fun generateDocReaderFieldRect(temp: DocReaderFieldRect?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocReaderFieldRect = temp

    result.put("bottom", input.bottom)
    result.put("top", input.top)
    result.put("left", input.left)
    result.put("right", input.right)

    return result
}

fun documentReaderGraphicFieldFromJSON(temp: JSONObject?): DocumentReaderGraphicField? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderGraphicField()

    input.remove("value")
    result.sourceType = input.optInt("sourceType")
    result.fieldType = input.optInt("fieldType")
    result.light = input.optInt("light")
    result.pageIndex = input.optInt("pageIndex")
    result.originalPageIndex = input.optInt("originalPageIndex")
    result.boundRect = docReaderFieldRectFromJSON(input.optJSONObject("fieldRect"))

    return result
}

fun generateDocumentReaderGraphicField(temp: DocumentReaderGraphicField?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderGraphicField = temp

    result.put("sourceType", input.sourceType)
    result.put("fieldType", input.fieldType)
    result.put("light", input.light)
    result.put("pageIndex", input.pageIndex)
    result.put("originalPageIndex", input.originalPageIndex)
    result.put("fieldName", eGraphicFieldType.getTranslation(context, input.fieldType))
    result.put("lightName", eRPRM_Lights.getTranslation(context, input.light))
    result.put("value", input.imageBase64())
    result.put("fieldRect", generateDocReaderFieldRect(input.boundRect))

    return result
}

fun documentReaderGraphicResultFromJSON(temp: JSONObject?): DocumentReaderGraphicResult? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderGraphicResult()

    result.fields = listFromJSON(input.optJSONArray("fields"), ::documentReaderGraphicFieldFromJSON)!!

    return result
}

fun generateDocumentReaderGraphicResult(temp: DocumentReaderGraphicResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderGraphicResult = temp

    result.put("fields", generateList(input.fields, ::generateDocumentReaderGraphicField, context))

    return result
}

fun documentReaderValueFromJSON(temp: JSONObject?): DocumentReaderValue? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderValue()

    result.pageIndex = input.optInt("pageIndex")
    result.sourceType = input.optInt("sourceType")
    result.probability = input.optInt("probability")
    result.value = input.optString("value")
    result.originalValue = input.optString("originalValue")
    result.boundRect = rectFromJSON(input.optJSONObject("boundRect"))
    result.originalSymbols = listFromJSON(input.optJSONArray("originalSymbols"), ::documentReaderSymbolFromJSON)!!
    result.rfidOrigin = documentReaderRFIDOriginFromJSON(input.optJSONObject("rfidOrigin"))

    return result
}

fun generateDocumentReaderValue(temp: DocumentReaderValue?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderValue = temp

    result.put("pageIndex", input.pageIndex)
    result.put("sourceType", input.sourceType)
    result.put("probability", input.probability)
    result.put("value", input.value)
    result.put("originalValue", input.originalValue)
    result.put("boundRect", generateRect(input.boundRect))
    result.put("originalSymbols", generateList(input.originalSymbols, ::generateDocumentReaderSymbol))
    result.put("rfidOrigin", generateDocumentReaderRFIDOrigin(input.rfidOrigin))

    return result
}

fun documentReaderTextFieldFromJSON(temp: JSONObject?): DocumentReaderTextField? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderTextField()

    input.remove("getValue")
    result.fieldType = input.optInt("fieldType")
    result.lcid = input.optInt("lcid")
    result.status = input.optInt("status")
    result.value = input.optString("value")
    result.values = listFromJSON(input.optJSONArray("values"), ::documentReaderValueFromJSON)!!
    result.comparisonList = listFromJSON(input.optJSONArray("comparisonList"), ::documentReaderComparisonFromJSON)!!
    result.validityList = listFromJSON(input.optJSONArray("validityList"), ::documentReaderValidityFromJSON)!!
    result.comparisonStatus = input.optInt("comparisonStatus")
    result.validityStatus = input.optInt("validityStatus")

    return result
}

fun generateDocumentReaderTextField(temp: DocumentReaderTextField?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderTextField = temp

    result.put("fieldType", input.fieldType)
    result.put("lcid", input.lcid)
    result.put("status", input.status)
    result.put("lcidName", input.getLcidName(context!!))
    result.put("fieldName", input.getFieldName(context))
    result.put("value", input.value)
    result.put("getValue", generateDocumentReaderValue(input.value()))
    result.put("values", generateList(input.values, ::generateDocumentReaderValue))
    result.put("comparisonList", generateList(input.comparisonList, ::generateDocumentReaderComparison))
    result.put("validityList", generateList(input.validityList, ::generateDocumentReaderValidity))
    result.put("comparisonStatus", input.comparisonStatus)
    result.put("validityStatus", input.validityStatus)

    return result
}

fun documentReaderTextResultFromJSON(temp: JSONObject?): DocumentReaderTextResult? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderTextResult()

    result.status = input.optInt("status")
    result.comparisonStatus = input.optInt("comparisonStatus")
    result.validityStatus = input.optInt("validityStatus")
    result.availableSourceList = listFromJSON(input.optJSONArray("availableSourceList"), ::documentReaderTextSourceFromJSON)!!
    result.fields = listFromJSON(input.optJSONArray("fields"), ::documentReaderTextFieldFromJSON)!!

    return result
}

fun generateDocumentReaderTextResult(temp: DocumentReaderTextResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderTextResult = temp

    result.put("status", input.status)
    result.put("comparisonStatus", input.comparisonStatus)
    result.put("validityStatus", input.validityStatus)
    result.put("availableSourceList", generateList(input.availableSourceList, ::generateDocumentReaderTextSource))
    result.put("fields", generateList(input.fields, ::generateDocumentReaderTextField, context))

    return result
}

fun coordinateFromJSON(temp: JSONObject?): Coordinate? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Coordinate()

    result.x = input.optInt("x")
    result.y = input.optInt("y")

    return result
}

fun generateCoordinate(temp: Coordinate?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Coordinate = temp

    result.put("x", input.x)
    result.put("y", input.y)

    return result
}

fun elementPositionFromJSON(temp: JSONObject?): ElementPosition? {
    temp ?: return null
    val input: JSONObject = temp
    val result = ElementPosition()

    result.docFormat = input.optInt("docFormat")
    result.width = input.optInt("width")
    result.height = input.optInt("height")
    result.dpi = input.optInt("dpi")
    result.pageIndex = input.optInt("pageIndex")
    result.inverse = input.optInt("inverse")
    result.perspectiveTr = input.optInt("perspectiveTr")
    result.objArea = input.optInt("objArea")
    result.objIntAngleDev = input.optInt("objIntAngleDev")
    result.resultStatus = input.optInt("resultStatus")
    result.angle = input.optDouble("angle")
    result.center = coordinateFromJSON(input.optJSONObject("center"))
    result.leftTop = coordinateFromJSON(input.optJSONObject("leftTop"))
    result.leftBottom = coordinateFromJSON(input.optJSONObject("leftBottom"))
    result.rightTop = coordinateFromJSON(input.optJSONObject("rightTop"))
    result.rightBottom = coordinateFromJSON(input.optJSONObject("rightBottom"))

    return result
}

fun generateElementPosition(temp: ElementPosition?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: ElementPosition = temp

    result.put("docFormat", input.docFormat)
    result.put("width", input.width)
    result.put("height", input.height)
    result.put("dpi", input.dpi)
    result.put("pageIndex", input.pageIndex)
    result.put("inverse", input.inverse)
    result.put("perspectiveTr", input.perspectiveTr)
    result.put("objArea", input.objArea)
    result.put("objIntAngleDev", input.objIntAngleDev)
    result.put("resultStatus", input.resultStatus)
    result.put("angle", input.angle)
    result.put("center", generateCoordinate(input.center))
    result.put("leftTop", generateCoordinate(input.leftTop))
    result.put("leftBottom", generateCoordinate(input.leftBottom))
    result.put("rightTop", generateCoordinate(input.rightTop))
    result.put("rightBottom", generateCoordinate(input.rightBottom))

    return result
}

fun imageQualityFromJSON(temp: JSONObject?): ImageQuality? {
    temp ?: return null
    val input: JSONObject = temp
    val result = ImageQuality()

    result.featureType = input.optInt("featureType")
    result.result = input.optInt("result")
    result.type = input.optInt("type")
    result.boundRects = listFromJSON(input.optJSONArray("boundRects"), ::docReaderFieldRectFromJSON)!!

    return result
}

fun generateImageQuality(temp: ImageQuality?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: ImageQuality = temp

    result.put("featureType", input.featureType)
    result.put("result", input.result)
    result.put("type", input.type)
    result.put("boundRects", generateList(input.boundRects, ::generateDocReaderFieldRect))

    return result
}

fun imageQualityGroupFromJSON(temp: JSONObject?): ImageQualityGroup? {
    temp ?: return null
    val input: JSONObject = temp
    val result = ImageQualityGroup()

    result.count = input.optInt("count")
    result.result = input.optInt("result")
    result.pageIndex = input.optInt("pageIndex")
    result.imageQualityList = listFromJSON(input.optJSONArray("imageQualityList"), ::imageQualityFromJSON)!!

    return result
}

fun generateImageQualityGroup(temp: ImageQualityGroup?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: ImageQualityGroup = temp

    result.put("count", input.count)
    result.put("result", input.result)
    result.put("imageQualityList", generateList(input.imageQualityList, ::generateImageQuality))
    result.put("pageIndex", input.pageIndex)

    return result
}

fun cameraSizeFromJSON(input: JSONObject): Pair<Int, Int> {
    val width = input.getInt("width")
    val height = input.getInt("height")
    return Pair(width, height)
}

fun generateCameraSize(width: Int?, height: Int?): JSONObject? {
    width ?: return null
    height ?: return null
    val result = JSONObject()
    result.put("width", width)
    result.put("height", height)
    return result
}

fun documentReaderDocumentTypeFromJSON(temp: JSONObject?): DocumentReaderDocumentType? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderDocumentType()

    result.pageIndex = input.optInt("pageIndex")
    result.documentID = input.optInt("documentID")
    result.dType = input.optInt("dType")
    result.dFormat = input.optInt("dFormat")
    result.dMRZ = input.optBoolean("dMRZ")
    result.isDeprecated = input.optBoolean("isDeprecated")
    result.name = input.optString("name")
    result.ICAOCode = input.optString("ICAOCode")
    result.dDescription = input.optString("dDescription")
    result.dCountryName = input.optString("dCountryName")
    result.dYear = input.optString("dYear")
    result.FDSID = input.optJSONArray("FDSID").toIntArray()

    return result
}

fun generateDocumentReaderDocumentType(temp: DocumentReaderDocumentType?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderDocumentType = temp

    result.put("pageIndex", input.pageIndex)
    result.put("documentID", input.documentID)
    result.put("dType", input.dType)
    result.put("dFormat", input.dFormat)
    result.put("dMRZ", input.dMRZ)
    result.put("isDeprecated", input.isDeprecated)
    result.put("name", input.name)
    result.put("ICAOCode", input.ICAOCode)
    result.put("dDescription", input.dDescription)
    result.put("dYear", input.dYear)
    result.put("dCountryName", input.dCountryName)
    result.put("FDSID", input.FDSID.generate())

    return result
}

fun generateDocumentReaderNotification(temp: DocumentReaderNotification?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderNotification = temp

    result.put("notificationCode", input.notificationCode)
    result.put("dataFileType", input.dataFileType)
    result.put("progress", input.progress)

    return result
}

fun accessControlProcedureTypeFromJSON(temp: JSONObject?): AccessControlProcedureType? {
    temp ?: return null
    val input: JSONObject = temp
    val result = AccessControlProcedureType()

    result.activeOptionIdx = input.optInt("activeOptionIdx")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.notifications = listFromJSON(input.optJSONArray("notifications")!!)

    return result
}

fun generateAccessControlProcedureType(temp: AccessControlProcedureType?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: AccessControlProcedureType = temp

    result.put("activeOptionIdx", input.activeOptionIdx)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("notifications", generateList(input.notifications))

    return result
}

fun fileDataFromJSON(temp: JSONObject?): FileData? {
    temp ?: return null
    val input: JSONObject = temp
    val result = FileData()

    result.length = input.optInt("length")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.data = input.optString("data")

    return result
}

fun generateFileData(temp: FileData?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: FileData = temp

    result.put("length", input.length)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("data", input.data)

    return result
}

fun certificateDataFromJSON(temp: JSONObject?): CertificateData? {
    temp ?: return null
    val input: JSONObject = temp
    val result = CertificateData()

    result.length = input.optInt("length")
    result.data = input.optString("data")

    return result
}

fun generateCertificateData(temp: CertificateData?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: CertificateData = temp

    result.put("length", input.length)
    result.put("data", input.data)

    return result
}

fun securityObjectCertificatesFromJSON(temp: JSONObject?): SecurityObjectCertificates? {
    temp ?: return null
    val input: JSONObject = temp
    val result = SecurityObjectCertificates()

    result.securityObject = certificateDataFromJSON(input.optJSONObject("securityObject"))

    return result
}

fun generateSecurityObjectCertificates(temp: SecurityObjectCertificates?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: SecurityObjectCertificates = temp

    result.put("securityObject", generateCertificateData(input.securityObject))

    return result
}

fun fileFromJSON(temp: JSONObject?): File? {
    temp ?: return null
    val input: JSONObject = temp
    val result = File()

    result.readingTime = input.optInt("readingTime")
    result.type = input.optInt("type")
    result.pAStatus = input.optLong("pAStatus")
    result.readingStatus = input.optInt("readingStatus").toLong()
    result.fileID = input.optString("fileID")
    result.fileData = fileDataFromJSON(input.optJSONObject("fileData"))
    result.certificates = securityObjectCertificatesFromJSON(input.optJSONObject("certificates"))
    result.docFieldsText = listFromJSON(input.optJSONArray("docFieldsText")!!)
    result.docFieldsGraphics = listFromJSON(input.optJSONArray("docFieldsGraphics")!!)
    result.docFieldsOriginals = listFromJSON(input.optJSONArray("docFieldsOriginals")!!)
    result.notifications = listFromJSON(input.optJSONArray("notifications")!!)

    return result
}

fun generateFile(temp: File?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: File = temp

    result.put("readingTime", input.readingTime)
    result.put("type", input.type)
    result.put("typeName", eRFID_DataFile_Type.getTranslation(context, input.type))
    result.put("pAStatus", input.pAStatus)
    result.put("readingStatus", input.readingStatus)
    result.put("fileID", input.fileID)
    result.put("fileData", generateFileData(input.fileData))
    result.put("certificates", generateSecurityObjectCertificates(input.certificates))
    result.put("docFieldsText", generateList(input.docFieldsText))
    result.put("docFieldsGraphics", generateList(input.docFieldsGraphics))
    result.put("docFieldsOriginals", generateList(input.docFieldsOriginals))
    result.put("notifications", generateList(input.notifications))

    return result
}

fun applicationFromJSON(temp: JSONObject?): Application? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Application()

    result.type = input.optInt("type")
    result.status = input.optInt("status")
    result.applicationID = input.optString("applicationID")
    result.dataHashAlgorithm = input.optString("dataHashAlgorithm")
    result.unicodeVersion = input.optString("unicodeVersion")
    result.version = input.optString("version")
    result.files = listFromJSON(input.optJSONArray("files"), ::fileFromJSON)!!

    return result
}

fun generateApplication(temp: Application?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Application = temp

    result.put("type", input.type)
    result.put("status", input.status)
    result.put("applicationID", input.applicationID)
    result.put("dataHashAlgorithm", input.dataHashAlgorithm)
    result.put("unicodeVersion", input.unicodeVersion)
    result.put("version", input.version)
    result.put("files", generateList(input.files, ::generateFile, context))

    return result
}

fun valueFromJSON(temp: JSONObject?): Value? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Value()

    result.length = input.optInt("length")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.data = input.optString("data")
    result.format = input.optString("format")

    return result
}

fun generateValue(temp: Value?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Value = temp

    result.put("length", input.length)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("data", input.data)
    result.put("format", input.format)

    return result
}

fun attributeFromJSON(temp: JSONObject?): Attribute? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Attribute()

    result.type = input.optString("type")
    result.value = valueFromJSON(input.optJSONObject("value"))

    return result
}

fun generateAttribute(temp: Attribute?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Attribute = temp

    result.put("type", input.type)
    result.put("value", generateValue(input.value))

    return result
}

fun authorityFromJSON(temp: JSONObject?): Authority? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Authority()

    result.data = input.optString("data")
    result.friendlyName = valueFromJSON(input.optJSONObject("friendlyName"))
    result.attributes = listFromJSON(input.optJSONArray("attributes"), ::attributeFromJSON)!!

    return result
}

fun generateAuthority(temp: Authority?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Authority = temp

    result.put("data", input.data)
    result.put("friendlyName", generateValue(input.friendlyName))
    result.put("attributes", generateList(input.attributes, ::generateAttribute))

    return result
}

fun extensionFromJSON(temp: JSONObject?): Extension? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Extension()

    result.data = input.optString("data")
    result.type = input.optString("type")

    return result
}

fun generateExtension(temp: Extension?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Extension = temp

    result.put("data", input.data)
    result.put("type", input.type)

    return result
}

fun validityFromJSON(temp: JSONObject?): Validity? {
    temp ?: return null
    val input: JSONObject = temp
    val result = Validity()

    result.notAfter = valueFromJSON(input.optJSONObject("notAfter"))
    result.notBefore = valueFromJSON(input.optJSONObject("notBefore"))

    return result
}

fun generateValidity(temp: Validity?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: Validity = temp

    result.put("notAfter", generateValue(input.notAfter))
    result.put("notBefore", generateValue(input.notBefore))

    return result
}

fun certificateChainFromJSON(temp: JSONObject?): CertificateChain? {
    temp ?: return null
    val input: JSONObject = temp
    val result = CertificateChain()

    result.origin = input.optInt("origin")
    result.type = input.optInt("type")
    result.version = input.optInt("version")
    result.paStatus = input.optInt("paStatus").toLong()
    result.serialNumber = input.optString("serialNumber")
    result.signatureAlgorithm = input.optString("signatureAlgorithm")
    result.subjectPKAlgorithm = input.optString("subjectPKAlgorithm")
    result.fileName = valueFromJSON(input.optJSONObject("fileName"))
    result.validity = validityFromJSON(input.optJSONObject("validity"))
    result.issuer = authorityFromJSON(input.optJSONObject("issuer"))
    result.subject = authorityFromJSON(input.optJSONObject("subject"))
    result.notifications = listFromJSON(input.optJSONArray("notifications")!!)
    result.extensions = listFromJSON(input.optJSONArray("extensions"), ::extensionFromJSON)!!

    return result
}

fun generateCertificateChain(temp: CertificateChain?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: CertificateChain = temp

    result.put("origin", input.origin)
    result.put("type", input.type)
    result.put("version", input.version)
    result.put("paStatus", input.paStatus)
    result.put("serialNumber", input.serialNumber)
    result.put("signatureAlgorithm", input.signatureAlgorithm)
    result.put("subjectPKAlgorithm", input.subjectPKAlgorithm)
    result.put("fileName", generateValue(input.fileName))
    result.put("validity", generateValidity(input.validity))
    result.put("issuer", generateAuthority(input.issuer))
    result.put("subject", generateAuthority(input.subject))
    result.put("notifications", generateList(input.notifications))
    result.put("extensions", generateList(input.extensions, ::generateExtension))

    return result
}

fun signerInfoFromJSON(temp: JSONObject?): SignerInfo? {
    temp ?: return null
    val input: JSONObject = temp
    val result = SignerInfo()

    result.version = input.optInt("version")
    result.paStatus = input.optInt("paStatus").toLong()
    result.dataToHash = input.optString("dataToHash")
    result.digestAlgorithm = input.optString("digestAlgorithm")
    result.signatureAlgorithm = input.optString("signatureAlgorithm")
    result.serialNumber = valueFromJSON(input.optJSONObject("serialNumber"))
    result.signature = valueFromJSON(input.optJSONObject("signature"))
    result.subjectKeyIdentifier = valueFromJSON(input.optJSONObject("subjectKeyIdentifier"))
    result.issuer = authorityFromJSON(input.optJSONObject("issuer"))
    result.notifications = listFromJSON(input.optJSONArray("notifications")!!)
    result.signedAttributes = listFromJSON(input.optJSONArray("signedAttributes"), ::extensionFromJSON)!!
    result.certificateChain = listFromJSON(input.optJSONArray("certificateChain"), ::certificateChainFromJSON)!!

    return result
}

fun generateSignerInfo(temp: SignerInfo?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: SignerInfo = temp

    result.put("version", input.version)
    result.put("paStatus", input.paStatus)
    result.put("dataToHash", input.dataToHash)
    result.put("digestAlgorithm", input.digestAlgorithm)
    result.put("signatureAlgorithm", input.signatureAlgorithm)
    result.put("serialNumber", generateValue(input.serialNumber))
    result.put("signature", generateValue(input.signature))
    result.put("subjectKeyIdentifier", generateValue(input.subjectKeyIdentifier))
    result.put("issuer", generateAuthority(input.issuer))
    result.put("notifications", generateList(input.notifications))
    result.put("signedAttributes", generateList(input.signedAttributes, ::generateExtension))
    result.put("certificateChain", generateList(input.certificateChain, ::generateCertificateChain))

    return result
}

fun securityObjectFromJSON(temp: JSONObject?): SecurityObject? {
    temp ?: return null
    val input: JSONObject = temp
    val result = SecurityObject()

    result.fileReference = input.optInt("fileReference")
    result.version = input.optInt("version")
    result.objectType = input.optString("objectType")
    result.notifications = listFromJSON(input.optJSONArray("notifications")!!)
    result.signerInfos = listFromJSON(input.optJSONArray("signerInfos"), ::signerInfoFromJSON)!!

    return result
}

fun generateSecurityObject(temp: SecurityObject?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: SecurityObject = temp

    result.put("fileReference", input.fileReference)
    result.put("version", input.version)
    result.put("objectType", input.objectType)
    result.put("notifications", generateList(input.notifications))
    result.put("signerInfos", generateList(input.signerInfos, ::generateSignerInfo))

    return result
}

fun cardPropertiesFromJSON(temp: JSONObject?): CardProperties? {
    temp ?: return null
    val input: JSONObject = temp
    val result = CardProperties()

    result.aTQA = input.optInt("aTQA")
    result.bitRateR = input.optInt("bitRateR")
    result.bitRateS = input.optInt("bitRateS")
    result.chipTypeA = input.optInt("chipTypeA")
    result.mifareMemory = input.optInt("mifareMemory")
    result.rfidType = input.optInt("rfidType")
    result.sAK = input.optInt("sAK")
    result.support4 = input.optBoolean("support4")
    result.supportMifare = input.optBoolean("supportMifare")
    result.aTQB = input.optString("aTQB")
    result.aTR = input.optString("aTR")
    result.baudrate1 = input.optString("baudrate1")
    result.baudrate2 = input.optString("baudrate2")
    result.uID = input.optString("uID")

    return result
}

fun generateCardProperties(temp: CardProperties?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: CardProperties = temp

    result.put("aTQA", input.aTQA)
    result.put("bitRateR", input.bitRateR)
    result.put("bitRateS", input.bitRateS)
    result.put("chipTypeA", input.chipTypeA)
    result.put("mifareMemory", input.mifareMemory)
    result.put("rfidType", input.rfidType)
    result.put("sAK", input.sAK)
    result.put("support4", input.support4)
    result.put("supportMifare", input.supportMifare)
    result.put("aTQB", input.aTQB)
    result.put("aTR", input.aTR)
    result.put("baudrate1", input.baudrate1)
    result.put("baudrate2", input.baudrate2)
    result.put("uID", input.uID)

    return result
}

fun rfidSessionDataFromJSON(temp: JSONObject?): RFIDSessionData? {
    temp ?: return null
    val input: JSONObject = temp
    val result = RFIDSessionData()

    result.totalBytesReceived = input.optInt("totalBytesReceived")
    result.totalBytesSent = input.optInt("totalBytesSent")
    result.status = input.optInt("status").toLong()
    result.extLeSupport = input.optLong("extLeSupport")
    result.processTime = input.optLong("processTime")
    result.cardProperties = cardPropertiesFromJSON(input.optJSONObject("cardProperties"))
    result.accessControls = listFromJSON(input.optJSONArray("accessControls"), ::accessControlProcedureTypeFromJSON)!!
    result.applications = listFromJSON(input.optJSONArray("applications"), ::applicationFromJSON)!!
    result.securityObjects = listFromJSON(input.optJSONArray("securityObjects"), ::securityObjectFromJSON)!!
    result.dataFields = listFromJSON(input.optJSONArray("dataFields"), ::dataFieldFromJSON)!!
    result.dataGroups = input.optJSONArray("dataGroups").toIntArray()

    return result
}

fun generateRFIDSessionData(temp: RFIDSessionData?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: RFIDSessionData = temp

    result.put("totalBytesReceived", input.totalBytesReceived)
    result.put("totalBytesSent", input.totalBytesSent)
    result.put("status", input.status)
    result.put("extLeSupport", input.extLeSupport)
    result.put("processTime", input.processTime)
    result.put("cardProperties", generateCardProperties(input.cardProperties))
    result.put("accessControls", generateList(input.accessControls, ::generateAccessControlProcedureType))
    result.put("applications", generateList(input.applications, ::generateApplication, context))
    result.put("securityObjects", generateList(input.securityObjects, ::generateSecurityObject))
    result.put("dataGroups", input.dataGroups.generate())
    result.put("dataFields", generateList(input.dataFields, ::generateDataField))

    return result
}

fun dataFieldFromJSON(temp: JSONObject?): DataField? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DataField()

    result.data = input.optString("data")
    result.fieldType = input.optInt("fieldType")

    return result
}

fun generateDataField(temp: DataField?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DataField = temp

    result.put("data", input.data)
    result.put("fieldType", input.fieldType)

    return result
}

fun documentReaderAuthenticityCheckFromJSON(temp: JSONObject?): DocumentReaderAuthenticityCheck? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderAuthenticityCheck()

    result.type = input.optInt("type")
    result.pageIndex = input.optInt("pageIndex")
    result.elements = listFromJSON(input.optJSONArray("elements"), ::documentReaderAuthenticityElementFromJSON)!!

    return result
}

fun generateDocumentReaderAuthenticityCheck(temp: DocumentReaderAuthenticityCheck?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderAuthenticityCheck = temp

    result.put("type", input.type)
    result.put("status", input.status)
    result.put("typeName", input.getTypeName(context))
    result.put("pageIndex", input.pageIndex)
    result.put("elements", generateList(input.elements, ::generateDocumentReaderAuthenticityElement, context))

    return result
}

fun pdf417InfoFromJSON(temp: JSONObject?): PDF417Info? {
    temp ?: return null
    val input: JSONObject = temp
    val result = PDF417Info()

    result.errorLevel = input.optInt("errorLevel")
    result.columns = input.optInt("columns")
    result.rows = input.optInt("rows")

    return result
}

fun generatePDF417Info(temp: PDF417Info?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: PDF417Info = temp

    result.put("errorLevel", input.errorLevel)
    result.put("columns", input.columns)
    result.put("rows", input.rows)

    return result
}

fun documentReaderBarcodeResultFromJSON(temp: JSONObject?): DocumentReaderBarcodeResult? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderBarcodeResult()

    result.fields = listFromJSON(input.optJSONArray("fields"), ::documentReaderBarcodeFieldFromJSON)!!

    return result
}

fun generateDocumentReaderBarcodeResult(temp: DocumentReaderBarcodeResult?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderBarcodeResult = temp

    result.put("fields", generateList(input.fields, ::generateDocumentReaderBarcodeField))

    return result
}

fun documentReaderBarcodeFieldFromJSON(temp: JSONObject?): DocumentReaderBarcodeField? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderBarcodeField()

    result.barcodeType = input.optInt("barcodeType")
    result.status = input.optInt("status")
    result.pageIndex = input.optInt("pageIndex")
    result.pdf417Info = pdf417InfoFromJSON(input.optJSONObject("pdf417Info"))
    result.data = byteArrayFromBase64(input.optString("data"))

    return result
}

fun generateDocumentReaderBarcodeField(temp: DocumentReaderBarcodeField?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderBarcodeField = temp

    result.put("barcodeType", input.barcodeType)
    result.put("status", input.status)
    result.put("pageIndex", input.pageIndex)
    result.put("pdf417Info", generatePDF417Info(input.pdf417Info))
    result.put("data", generateByteArray(input.data))

    return result
}

fun documentReaderAuthenticityResultFromJSON(temp: JSONObject?): DocumentReaderAuthenticityResult? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderAuthenticityResult()

    result.checks = listFromJSON(input.optJSONArray("checks"), ::documentReaderAuthenticityCheckFromJSON)!!

    return result
}

fun generateDocumentReaderAuthenticityResult(temp: DocumentReaderAuthenticityResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderAuthenticityResult = temp

    result.put("status", input.status)
    result.put("checks", generateList(input.checks, ::generateDocumentReaderAuthenticityCheck, context))

    return result
}

fun documentReaderAuthenticityElementFromJSON(temp: JSONObject?): DocumentReaderAuthenticityElement? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderAuthenticityElement()

    result.status = input.optInt("status")
    result.elementType = input.optInt("elementType")
    result.elementDiagnose = input.optInt("elementDiagnose")

    return result
}

fun generateDocumentReaderAuthenticityElement(temp: DocumentReaderAuthenticityElement?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderAuthenticityElement = temp

    result.put("status", input.status)
    result.put("elementType", input.elementType)
    result.put("elementDiagnose", input.elementDiagnose)
    result.put("elementTypeName", input.getElementTypeName(context))
    result.put("elementDiagnoseName", input.getElementDiagnoseName(context))

    return result
}

fun paResourcesIssuerFromJSON(temp: JSONObject?): PAResourcesIssuer? {
    temp ?: return null
    val input: JSONObject = temp
    val result = PAResourcesIssuer()

    result.data = byteArrayFromBase64(input.optString("data"))
    result.friendlyName = input.optString("friendlyName")
    result.attributes = arrayFromJSON(input.optJSONArray("attributes"), ::paAttributeFromJSON, arrayOfNulls(input.optJSONArray("attributes")?.length() ?: 0))

    return result
}

fun generatePAResourcesIssuer(temp: PAResourcesIssuer?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: PAResourcesIssuer = temp

    result.put("data", generateByteArray(input.data))
    result.put("friendlyName", input.friendlyName)
    result.put("attributes", generateArray(input.attributes, ::generatePAAttribute))

    return result
}

fun paAttributeFromJSON(temp: JSONObject?): PAAttribute? {
    temp ?: return null
    val input: JSONObject = temp
    val result = PAAttribute()

    result.type = input.optString("type")
    result.value = input.optString("value")

    return result
}

fun generatePAAttribute(temp: PAAttribute?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: PAAttribute = temp

    result.put("type", input.type)
    result.put("value", input.value)

    return result
}

fun taChallengeFromJSON(temp: JSONObject?): TAChallenge? {
    temp ?: return null
    val input: JSONObject = temp
    val result = TAChallenge()

    result.data = byteArrayFromBase64(input.optString("data"))
    result.auxPCD = input.optString("auxPCD")
    result.challengePICC = input.optString("challengePICC")
    result.hashPK = input.optString("hashPK")
    result.idPICC = input.optString("idPICC")

    return result
}

fun generateTAChallenge(temp: TAChallenge?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: TAChallenge = temp

    result.put("data", generateByteArray(input.data))
    result.put("auxPCD", input.auxPCD)
    result.put("challengePICC", input.challengePICC)
    result.put("hashPK", input.hashPK)
    result.put("idPICC", input.idPICC)

    return result
}

fun documentReaderResultsStatusFromJSON(temp: JSONObject?): DocumentReaderResultsStatus? {
    temp ?: return null
    val input: JSONObject = temp

    input.remove("detailsRFID")

    return DocumentReaderResultsStatus.fromJson(input)
}

fun generateDocumentReaderResultsStatus(temp: DocumentReaderResultsStatus?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderResultsStatus = temp

    result.put("overallStatus", input.overallStatus)
    result.put("optical", input.optical)
    result.put("detailsOptical", generateDetailsOptical(input.detailsOptical))
    result.put("rfid", input.rfid)
    result.put("detailsRFID", generateDetailsRFID(input.detailsRFID))
    result.put("portrait", input.portrait)
    result.put("stopList", input.stopList)

    return result
}

fun generateDetailsOptical(temp: DetailsOptical?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DetailsOptical = temp

    result.put("overallStatus", input.overallStatus)
    result.put("mrz", input.mrz)
    result.put("text", input.text)
    result.put("docType", input.docType)
    result.put("security", input.security)
    result.put("imageQA", input.imageQA)
    result.put("expiry", input.expiry)
    result.put("vds", input.vds)
    result.put("pagesCount", input.pagesCount)

    return result
}

fun generateDetailsRFID(temp: DetailsRFID?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DetailsRFID = temp

    result.put("pa", input.pa)
    result.put("ca", input.ca)
    result.put("aa", input.aa)
    result.put("ta", input.ta)
    result.put("bac", input.bac)
    result.put("pace", input.pace)
    result.put("overallStatus", input.overallStatus)

    return result
}

fun vdsncDataDictionaryFromJSON(input: JSONObject): JSONObject {
    val temp = JSONObject(input.toString())

    temp.put("Type", input.optString("type"))
    temp.put("Version", input.optInt("version"))
    temp.put("IssuingCountry", input.optString("issuingCountry"))
    temp.put("Message", input.optJSONObject("message"))
    temp.put("SignatureAlg", input.optString("signatureAlgorithm"))
    temp.put("Signature", bytesDataDictionaryFromJSON(input.optJSONObject("signature")))
    temp.put("Certificate", bytesDataDictionaryFromJSON(input.optJSONObject("certificate")))
    temp.put("CertificateChain", input.optJSONArray("certificateChain"))
    temp.put("Notifications", input.optJSONArray("notifications"))

    return temp
}

fun vdsncDataFromJSON(input: JSONObject) = VDSNCData.fromJson(vdsncDataDictionaryFromJSON(input))

fun generateVDSNCData(temp: VDSNCData?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: VDSNCData = temp

    result.put("type", input.type)
    result.put("version", input.version)
    result.put("issuingCountry", input.issuingCountry)
    result.put("message", input.message)
    result.put("signatureAlgorithm", input.signatureAlg)
    result.put("signature", generateBytesData(input.signature))
    result.put("certificate", generateBytesData(input.certificate))
    result.put("certificateChain", generateList(input.certificateChain, ::generateCertificateChain))
    result.put("notifications", generateLongArray(input.notifications))

    return result
}

fun bytesDataDictionaryFromJSON(input: JSONObject?): JSONObject? {
    input ?: return null
    val temp = JSONObject(input.toString())

    temp.put("Data", input.optString("data"))
    temp.put("Length", input.optInt("length"))
    temp.put("Status", input.optLong("status"))
    temp.put("Type", input.optInt("type"))

    return temp
}

fun bytesDataFromJSON(input: JSONObject?) = BytesData.fromJson(bytesDataDictionaryFromJSON(input))

fun generateBytesData(temp: BytesData?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: BytesData = temp

    result.put("data", input.data)
    result.put("length", input.length)
    result.put("status", input.status)
    result.put("type", input.type)

    return result
}

fun generateLicense(temp: License?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: License = temp

    result.put("expiryDate", input.expiryDate?.toString())
    result.put("countryFilter", generateList(input.countryFilter))
    result.put("isRfidAvailable", input.isRfidAvailable)

    return result
}

fun generateDocReaderVersion(temp: DocReaderVersion?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocReaderVersion = temp

    result.put("api", input.api)
    result.put("core", input.core)
    result.put("coreMode", input.coreMode)
    result.put("database", generateDocReaderDocumentsDatabase(input.database))

    return result
}

fun docReaderDocumentsDatabaseFromJSON(input: JSONObject?): DocReaderDocumentsDatabase? {
    input ?: return null
    val temp = JSONObject(input.toString())

    temp.put("id", input.optString("databaseID"))
    temp.put("export_date", input.optString("date"))
    temp.put("description", input.optString("databaseDescription"))

    return DocReaderDocumentsDatabase.fromJson(temp)
}

fun generateDocReaderDocumentsDatabase(temp: DocReaderDocumentsDatabase?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocReaderDocumentsDatabase = temp

    result.put("databaseID", input.databaseID)
    result.put("version", input.version)
    result.put("date", input.date)
    result.put("databaseDescription", input.databaseDescription)
    result.put("countriesNumber", input.countriesNumber)
    result.put("documentsNumber", input.documentsNumber)
    result.put("size", input.size)

    return result
}

fun documentReaderComparisonFromJSON(temp: JSONObject?): DocumentReaderComparison? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderComparison()

    result.sourceTypeLeft = input.optInt("sourceTypeLeft")
    result.sourceTypeRight = input.optInt("sourceTypeRight")
    result.status = input.optInt("status")

    return result
}

fun generateDocumentReaderComparison(temp: DocumentReaderComparison?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderComparison = temp

    result.put("sourceTypeLeft", input.sourceTypeLeft)
    result.put("sourceTypeRight", input.sourceTypeRight)
    result.put("status", input.status)

    return result
}

fun documentReaderRFIDOriginFromJSON(temp: JSONObject?): DocumentReaderRfidOrigin? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderRfidOrigin()

    result.dg = input.optInt("dg")
    result.dgTag = input.optInt("dgTag")
    result.entryView = input.optInt("entryView")
    result.tagEntry = input.optInt("tagEntry")

    return result
}

fun generateDocumentReaderRFIDOrigin(temp: DocumentReaderRfidOrigin?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderRfidOrigin = temp

    result.put("dg", input.dg)
    result.put("dgTag", input.dgTag)
    result.put("entryView", input.entryView)
    result.put("tagEntry", input.tagEntry)

    return result
}

fun documentReaderTextSourceFromJSON(temp: JSONObject?): DocumentReaderTextSource? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderTextSource()

    result.sourceType = input.optInt("sourceType")
    result.source = input.optString("source")
    result.validityStatus = input.optInt("validityStatus")

    return result
}

fun generateDocumentReaderTextSource(temp: DocumentReaderTextSource?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderTextSource = temp

    result.put("sourceType", input.sourceType)
    result.put("source", input.source)
    result.put("validityStatus", input.validityStatus)

    return result
}

fun documentReaderSymbolFromJSON(temp: JSONObject?): DocumentReaderSymbol? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderSymbol()

    result.code = input.optInt("code")
    result.probability = input.optInt("probability")
    result.rect = rectFromJSON(input.optJSONObject("rect"))

    return result
}

fun generateDocumentReaderSymbol(temp: DocumentReaderSymbol?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderSymbol = temp

    result.put("code", input.code)
    result.put("rect", generateRect(input.rect))
    result.put("probability", input.probability)

    return result
}

fun documentReaderValidityFromJSON(temp: JSONObject?): DocumentReaderValidity? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderValidity()

    result.sourceType = input.optInt("sourceType")
    result.status = input.optInt("status")

    return result
}

fun generateDocumentReaderValidity(temp: DocumentReaderValidity?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderValidity = temp

    result.put("sourceType", input.sourceType)
    result.put("status", input.status)

    return result
}

fun barcodeTypeArrayFromJson(temp: JSONArray?): Array<String?>? {
    temp ?: return null
    val input: JSONArray = temp

    val result = arrayOfNulls<String>(input.length())
    for (i in 0 until input.length()) result[i] = BarcodeType.valueOf(input.getInt(i))

    return result
}

fun generateBarcodeTypeArray(temp: Array<String?>?): JSONArray? {
    temp ?: return null
    val input: Array<String?> = temp
    val result = JSONArray()

    for (s in input) result.put(generateBarcodeType(s))

    return result
}

fun generateBarcodeType(input: String?) = when (input) {
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

fun documentReaderResultsFromJSON(temp: JSONObject?): DocumentReaderResults? {
    temp ?: return null
    val input: JSONObject = temp
    val result = DocumentReaderResults()

    result.chipPage = input.optInt("chipPage")
    result.processingFinishedStatus = input.optInt("processingFinishedStatus")
    result.elapsedTime = input.optInt("elapsedTime")
    result.elapsedTimeRFID = input.optInt("elapsedTimeRFID")
    result.morePagesAvailable = input.optInt("morePagesAvailable")
    result.graphicResult = documentReaderGraphicResultFromJSON(input.optJSONObject("graphicResult"))
    result.textResult = documentReaderTextResultFromJSON(input.optJSONObject("textResult"))
    result.documentPosition = listFromJSON(input.optJSONArray("documentPosition"), ::elementPositionFromJSON)!!
    result.barcodePosition = listFromJSON(input.optJSONArray("barcodePosition"), ::elementPositionFromJSON)!!
    result.mrzPosition = listFromJSON(input.optJSONArray("mrzPosition"), ::elementPositionFromJSON)!!
    result.imageQuality = listFromJSON(input.optJSONArray("imageQuality"), ::imageQualityGroupFromJSON)!!
    result.rawResult = input.optString("rawResult")
    result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"))
    result.authenticityResult = documentReaderAuthenticityResultFromJSON(input.optJSONObject("authenticityResult"))
    result.barcodeResult = documentReaderBarcodeResultFromJSON(input.optJSONObject("barcodeResult"))
    result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"))
    result.documentType = listFromJSON(input.optJSONArray("documentType"), ::documentReaderDocumentTypeFromJSON)!!
    result.status = documentReaderResultsStatusFromJSON(input.optJSONObject("status"))!!
    result.vdsncData = vdsncDataFromJSON(input.optJSONObject("vdsncData")!!)
    result.dtcData = input.getString("dtcData")
    result.transactionInfo = transactionInfoFromJSON(input.optJSONObject("transactionInfo"))

    return result
}

fun generateDocumentReaderResults(temp: DocumentReaderResults?, context: Context?): JSONObject? {
    val result = JSONObject()
    temp ?: return null
    val input: DocumentReaderResults = temp

    result.put("chipPage", input.chipPage)
    result.put("processingFinishedStatus", input.processingFinishedStatus)
    result.put("elapsedTime", input.elapsedTime)
    result.put("elapsedTimeRFID", input.elapsedTimeRFID)
    result.put("morePagesAvailable", input.morePagesAvailable)
    result.put("graphicResult", generateDocumentReaderGraphicResult(input.graphicResult, context))
    result.put("textResult", generateDocumentReaderTextResult(input.textResult, context))
    result.put("documentPosition", generateList(input.documentPosition, ::generateElementPosition))
    result.put("barcodePosition", generateList(input.barcodePosition, ::generateElementPosition))
    result.put("mrzPosition", generateList(input.mrzPosition, ::generateElementPosition))
    result.put("imageQuality", generateList(input.imageQuality, ::generateImageQualityGroup))
    result.put("rawResult", input.rawResult)
    result.put("rfidSessionData", generateRFIDSessionData(input.rfidSessionData, context))
    result.put("authenticityResult", generateDocumentReaderAuthenticityResult(input.authenticityResult, context))
    result.put("barcodeResult", generateDocumentReaderBarcodeResult(input.barcodeResult))
    result.put("documentType", generateList(input.documentType, ::generateDocumentReaderDocumentType))
    result.put("status", generateDocumentReaderResultsStatus(input.status))
    result.put("vdsncData", generateVDSNCData(input.vdsncData))
    result.put("dtcData", input.dtcData)
    result.put("transactionInfo", generateTransactionInfo(input.transactionInfo))

    return result
}