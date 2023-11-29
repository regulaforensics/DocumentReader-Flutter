//
//  JSONConstructor.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Rect
import android.graphics.Typeface
import android.util.Pair
import com.regula.common.exception.RegulaException
import com.regula.documentreader.api.License
import com.regula.documentreader.api.config.RecognizeConfig
import com.regula.documentreader.api.config.ScannerConfig
import com.regula.documentreader.api.enums.BarcodeType
import com.regula.documentreader.api.enums.DocReaderAction
import com.regula.documentreader.api.enums.PDF417Info
import com.regula.documentreader.api.enums.eGraphicFieldType
import com.regula.documentreader.api.enums.eRFID_DataFile_Type
import com.regula.documentreader.api.enums.eRPRM_Lights
import com.regula.documentreader.api.params.BleDeviceConfig
import com.regula.documentreader.api.params.DocReaderConfig
import com.regula.documentreader.api.params.FaceApiParams
import com.regula.documentreader.api.params.Functionality
import com.regula.documentreader.api.params.ImageInputData
import com.regula.documentreader.api.params.ImageQA
import com.regula.documentreader.api.params.ImageQA.GlaresCheckParams
import com.regula.documentreader.api.params.OnlineProcessingConfig
import com.regula.documentreader.api.params.ParamsCustomization
import com.regula.documentreader.api.params.ProcessParam
import com.regula.documentreader.api.params.RfidScenario
import com.regula.documentreader.api.params.rfid.PKDCertificate
import com.regula.documentreader.api.params.rfid.RFIDParams
import com.regula.documentreader.api.params.rfid.ReprocParams
import com.regula.documentreader.api.params.rfid.TccParams
import com.regula.documentreader.api.params.rfid.authorization.PAAttribute
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge
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
import java.util.Objects

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

fun generatePACertificateCompletion(serialNumber: ByteArray?, issuer: PAResourcesIssuer?) = object : JSONObject() { init {
    put("serialNumber", Convert.generateByteArray(serialNumber))
    put("issuer", generatePAResourcesIssuer(issuer))
}
}

fun regulaExceptionFromJSON(input: JSONObject?): RegulaException? {
    if (input == null) return null

    val code = input.optInt("code")
    val message = input.optString("message")

    return RegulaException(code, message)
}

fun generateRegulaException(input: RegulaException?): JSONObject? = input?.let {
    object : JSONObject() { init {
        put("code", input.errorCode)
        put("message", input.message)
    }
    }
}

fun tccParamsFromJSON(input: JSONObject?): TccParams? {
    if (input == null) return null
    val result = TccParams()

    if (input.has("serviceUrlTA")) result.serviceUrlTA = input.getString("serviceUrlTA")
    if (input.has("serviceUrlPA")) result.serviceUrlPA = input.getString("serviceUrlPA")
    if (input.has("pfxCertUrl")) result.pfxCertUrl = input.getString("pfxCertUrl")
    if (input.has("pfxPassPhrase")) result.pfxPassPhrase = input.getString("pfxPassPhrase")
    if (input.has("pfxCert")) result.pfxCert = Convert.byteArrayFromBase64(input.getString("pfxCert"))

    return result
}

fun generateTccParams(input: TccParams?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("serviceUrlTA", input.serviceUrlTA)
    result.put("serviceUrlPA", input.serviceUrlPA)
    result.put("pfxCertUrl", input.pfxCertUrl)
    result.put("pfxPassPhrase", input.pfxPassPhrase)
    result.put("pfxCert", Convert.generateByteArray(input.pfxCert))

    return result
}

fun docReaderConfigFromJSON(input: JSONObject?): DocReaderConfig? {
    if (input == null || !input.has("license")) return null
    val license = Convert.byteArrayFromBase64(input.getString("license"))
    var result = DocReaderConfig(license)

    if (input.has("customDb")) result = DocReaderConfig(license, Convert.byteArrayFromBase64(input.getString("customDb")))
    if (input.has("licenseUpdate")) result.setLicenseUpdate(input.getBoolean("licenseUpdate"))
    if (input.has("delayedNNLoad")) result.isDelayedNNLoad = input.getBoolean("delayedNNLoad")
    if (input.has("blackList")) result.blackList = input.getJSONObject("blackList")

    return result
}

fun generateDocReaderConfig(input: DocReaderConfig?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("license", Convert.generateByteArray(input.license))
    result.put("customDb", Convert.generateByteArray(input.customDb))
    result.put("licenseUpdate", input.isLicenseUpdate)
    result.put("delayedNNLoad", input.isDelayedNNLoad)
    result.put("blackList", input.blackList)

    return result
}

fun scannerConfigFromJSON(input: JSONObject?): ScannerConfig? {
    if (input == null) return null
    if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null
    val builder = if (input.has("scenario")) ScannerConfig.Builder(input.getString("scenario"))
    else ScannerConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig"))!!)

    if (input.has("onlineProcessingConfig")) builder.setOnlineProcessingConfig(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")))
    if (input.has("livePortrait")) builder.setLivePortrait(Convert.bitmapFromBase64(input.getString("livePortrait")))
    if (input.has("extPortrait")) builder.setExtPortrait(Convert.bitmapFromBase64(input.getString("extPortrait")))
    if (input.has("cameraId")) builder.setCameraId(input.getInt("cameraId"))

    return builder.build()
}

fun generateScannerConfig(input: ScannerConfig?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("scenario", input.scenario)
    result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.onlineProcessingConfig))
    result.put("livePortrait", Convert.bitmapToBase64(input.livePortrait))
    result.put("extPortrait", Convert.bitmapToBase64(input.extPortrait))
    result.put("cameraId", input.cameraId)

    return result
}

fun recognizeConfigFromJSON(input: JSONObject?): RecognizeConfig? {
    if (input == null) return null
    if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null
    if (!input.has("image") && !input.has("images") && !input.has("imageInputData")) return null
    val builder = if (input.has("scenario")) RecognizeConfig.Builder(input.getString("scenario"))
    else RecognizeConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig"))!!)

    if (input.has("livePortrait")) builder.setLivePortrait(Convert.bitmapFromBase64(input.getString("livePortrait")))
    if (input.has("extPortrait")) builder.setExtPortrait(Convert.bitmapFromBase64(input.getString("extPortrait")))
    if (input.has("image")) builder.setBitmap(Convert.bitmapFromBase64(input.getString("image")))
    if (input.has("oneShotIdentification")) builder.setOneShotIdentification(input.getBoolean("oneShotIdentification"))
    if (input.has("images")) {
        val base64Images = input.getJSONArray("images")
        val images = arrayOfNulls<Bitmap>(base64Images.length())
        for (i in images.indices) images[i] = Convert.bitmapFromBase64(base64Images.getString(i))
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

fun generateRecognizeConfig(input: RecognizeConfig?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("scenario", input.scenario)
    result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.onlineProcessingConfig))
    result.put("livePortrait", Convert.bitmapToBase64(input.livePortrait))
    result.put("extPortrait", Convert.bitmapToBase64(input.extPortrait))
    result.put("image", Convert.bitmapToBase64(input.bitmap))
    result.put("oneShotIdentification", input.oneShotIdentification)
    if (input.bitmaps == null)
        result.put("images", null)
    else {
        val array = JSONArray()
        for (bitmap in input.bitmaps!!) array.put(Convert.bitmapToBase64(bitmap))
        result.put("images", array)
    }
    result.put("imageInputData", Utils.generateArray(input.imageInputData, ::generateImageInputData))

    return result
}

fun reprocParamsFromJSON(input: JSONObject?): ReprocParams? {
    if (input == null || !input.has("serviceUrl")) return null
    val result = ReprocParams(input.getString("serviceUrl"))

    if (input.has("failIfNoService")) result.failIfNoService = input.getBoolean("failIfNoService")
    if (input.has("httpHeaders")) result.httpHeaders = Utils.stringMapFromJson(input.getJSONObject("httpHeaders"))

    return result
}

fun generateReprocParams(input: ReprocParams?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("serviceUrl", input.serviceUrl)
    result.put("failIfNoService", input.failIfNoService)
    result.put("httpHeaders", Utils.generateStringMap(input.httpHeaders))

    return result
}

fun onlineProcessingConfigFromJSON(input: JSONObject?): OnlineProcessingConfig? {
    if (input == null || !input.has("mode")) return null
    val builder = OnlineProcessingConfig.Builder(input.getInt("mode"))

    if (input.has("imageFormat")) builder.setImageFormat(input.getInt("imageFormat"))
    if (input.has("url")) builder.setUrl(input.getString("url"))
    if (input.has("imageCompressionQuality")) builder.setImageCompressionQuality(input.getDouble("imageCompressionQuality").toFloat())
    if (input.has("processParams")) builder.setProcessParams(processParamFromJSON(input.getJSONObject("processParams")))

    return builder.build()
}

fun generateOnlineProcessingConfig(input: OnlineProcessingConfig?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("mode", input.mode)
    result.put("url", input.url)
    result.put("processParams", getProcessParams(input.processParam))
    result.put("imageFormat", input.imageFormat)
    result.put("imageCompressionQuality", input.imageCompressionQuality)

    return result
}

fun faceApiParamsFromJSON(input: JSONObject?): FaceApiParams? {
    val result = FaceApiParams()
    if (input == null) return null

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

fun generateFaceApiParams(input: FaceApiParams?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun faceApiSearchParamsFromJSON(input: JSONObject?): FaceApiParams.Search? {
    val result = FaceApiParams.Search()
    if (input == null) return null

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

fun generateFaceApiSearchParams(input: FaceApiParams.Search?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("limit", input.limit)
    result.put("threshold", input.threshold)
    result.put("groupIds", Utils.generateIntArray(input.groupIds))

    return result
}

fun imageQAFromJSON(input: JSONObject?): ImageQA? {
    if (input == null) return null
    val result = ImageQA()

    if (input.has("dpiThreshold")) result.dpiThreshold = input.getInt("dpiThreshold")
    if (input.has("angleThreshold")) result.angleThreshold = input.getInt("angleThreshold")
    if (input.has("focusCheck")) result.focusCheck = input.getBoolean("focusCheck")
    if (input.has("glaresCheck")) result.glaresCheck = input.getBoolean("glaresCheck")
    if (input.has("colornessCheck")) result.colornessCheck = input.getBoolean("colornessCheck")
    if (input.has("moireCheck")) result.moireCheck = input.getBoolean("moireCheck")
    if (input.has("expectedPass")) result.expectedPass = Utils.intArrayFromJSON(input.getJSONArray("expectedPass"))
    if (input.has("documentPositionIndent")) result.documentPositionIndent = input.getInt("documentPositionIndent")
    if (input.has("glaresCheckParams")) result.glaresCheckParams = glaresCheckParamsFromJSON(input.getJSONObject("glaresCheckParams"))

    return result
}

fun generateImageQA(input: ImageQA?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("dpiThreshold", input.dpiThreshold)
    result.put("angleThreshold", input.angleThreshold)
    result.put("focusCheck", input.focusCheck)
    result.put("glaresCheck", input.glaresCheck)
    result.put("colornessCheck", input.colornessCheck)
    result.put("moireCheck", input.moireCheck)
    result.put("documentPositionIndent", input.documentPositionIndent)
    result.put("expectedPass", Utils.generateIntArray(input.expectedPass))
    result.put("glaresCheckParams", generateGlaresCheckParams(input.glaresCheckParams))

    return result
}

fun rfidParamsFromJSON(input: JSONObject?): RFIDParams? {
    val result = RFIDParams()
    if (input == null) return null

    if (input.has("paIgnoreNotificationCodes")) result.paIgnoreNotificationCodes = Utils.intArrayFromJSON(input.getJSONArray("paIgnoreNotificationCodes"))

    return result
}

fun generateRFIDParams(input: RFIDParams?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("paIgnoreNotificationCodes", Utils.generateIntArray(input.paIgnoreNotificationCodes))

    return result
}

fun processParamFromJSON(input: JSONObject?): ProcessParam {
    val result = ProcessParam()
    setProcessParams(result, input!!)
    return result
}

fun generateProcessParam(input: ProcessParam?): JSONObject {
    return getProcessParams(input!!)
}

fun eDLDataGroupsFromJSON(input: JSONObject?): EDLDataGroups {
    val result = EDLDataGroups()
    setDataGroups(result, input!!)
    return result
}

fun generateEDLDataGroups(input: EDLDataGroups?): JSONObject {
    return getDataGroups(input!!)
}

fun ePassportDataGroupsFromJSON(input: JSONObject?): EPassportDataGroups {
    val result = EPassportDataGroups()
    setDataGroups(result, input!!)
    return result
}

fun generateEPassportDataGroups(input: EPassportDataGroups?): JSONObject {
    return getDataGroups(input!!)
}

fun eIDDataGroupsFromJSON(input: JSONObject?): EIDDataGroups {
    val result = EIDDataGroups()
    setDataGroups(result, input!!)
    return result
}

fun generateEIDDataGroups(input: EIDDataGroups?): JSONObject {
    return getDataGroups(input!!)
}

fun rfidScenarioFromJSON(input: JSONObject?): RfidScenario {
    val result = RfidScenario()
    setRfidScenario(result, input!!)
    return result
}

fun generateRfidScenario(input: RfidScenario?): JSONObject {
    return getRfidScenario(input!!)
}

fun customizationFromJSON(input: JSONObject?, context: Context?): ParamsCustomization {
    val result = ParamsCustomization()
    setCustomization(result, input!!, context)
    return result
}

fun generateCustomization(input: ParamsCustomization?): JSONObject {
    return getCustomization(input!!)
}

fun functionalityFromJSON(input: JSONObject?): Functionality {
    val result = Functionality()
    setFunctionality(result, input!!)
    return result
}

fun generateFunctionality(input: Functionality?): JSONObject {
    return getFunctionality(input!!)
}

fun glaresCheckParamsFromJSON(input: JSONObject?): GlaresCheckParams? {
    if (input == null) return null
    val result = GlaresCheckParams()

    if (input.has("imgMarginPart")) result.imgMarginPart = input.getDouble("imgMarginPart")
    if (input.has("maxGlaringPart")) result.maxGlaringPart = input.getDouble("maxGlaringPart")

    return result
}

fun generateGlaresCheckParams(input: GlaresCheckParams?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("imgMarginPart", input.imgMarginPart)
    result.put("maxGlaringPart", input.maxGlaringPart)

    return result
}

fun typeFaceFromJSON(input: JSONObject?): Pair<Typeface, Int?>? {
    if (input == null) return null

    val name = input.getString("name")
    val style = input.optInt("style", Typeface.NORMAL)
    var size: Int? = null
    if (input.has("size")) size = input.getInt("size")

    return Pair(Typeface.create(name, style), size)
}

fun bleDeviceConfigFromJSON(input: JSONObject): BleDeviceConfig {
    val bleWrapper = bleManager
    var result = BleDeviceConfig(bleWrapper)

    if (input.has("customDb")) result = BleDeviceConfig(bleWrapper!!, Convert.byteArrayFromBase64(input.getString("customDb")))
    if (input.has("licenseUpdate")) result.setLicenseUpdate(input.getBoolean("licenseUpdate"))
    if (input.has("delayedNNLoad")) result.isDelayedNNLoad = input.getBoolean("delayedNNLoad")
    if (input.has("blackList")) result.blackList = input.getJSONObject("blackList")

    return result
}

fun imageInputDataFromJSON(input: JSONObject?): ImageInputData? {
    if (input == null || !input.has("image")) return null

    var light = 6
    var pageIndex = 0
    val image = Convert.bitmapFromBase64(input.getString("image"))
    if (input.has("light")) light = input.getInt("light")
    if (input.has("pageIndex")) pageIndex = input.getInt("pageIndex")

    return ImageInputData(image, light, pageIndex)
}

fun generateImageInputData(input: ImageInputData?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("image", Convert.bitmapToBase64(input.bitmap))
    result.put("light", input.light)
    result.put("pageIndex", input.pageIndex)

    return result
}

fun pkdCertificateFromJSON(input: JSONObject?): PKDCertificate? {
    if (input == null) return null
    var resourceType = 0
    var binaryData: ByteArray? = ByteArray(0)

    if (input.has("resourceType")) resourceType = input.getInt("resourceType")
    if (input.has("binaryData")) binaryData = Convert.byteArrayFromBase64(input.getString("binaryData"))
    if (input.has("privateKey")) {
        val privateKey = Convert.byteArrayFromBase64(input.getString("privateKey"))
        return PKDCertificate(binaryData, resourceType, privateKey)
    }
    return PKDCertificate(binaryData, resourceType)
}

fun generatePKDCertificate(input: PKDCertificate?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("resourceType", input.resourceType)
    result.put("binaryData", Convert.generateByteArray(input.binaryData))
    result.put("privateKey", Convert.generateByteArray(input.privateKey))

    return result
}

fun documentReaderScenarioFromJSON(input: JSONObject?): DocumentReaderScenario? {
    if (input == null) return null

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

    return DocumentReaderScenario(name, caption, description, if (multiPageOff) 1 else 0, frameKWHLandscape, frameKWHPortrait, frameKWHDoublePageSpreadPortrait, frameKWHDoublePageSpreadLandscape, frameOrientation, uvTorch, faceExt, seriesProcessMode, manualCrop)
}

fun generateDocumentReaderScenario(input: DocumentReaderScenario?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun rectFromJSON(input: JSONObject?): Rect? {
    if (input == null) return null
    val result = Rect()

    result.bottom = input.optInt("bottom")
    result.top = input.optInt("top")
    result.left = input.optInt("left")
    result.right = input.optInt("right")

    return result
}

fun generateRect(input: Rect?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("bottom", input.bottom)
    result.put("top", input.top)
    result.put("left", input.left)
    result.put("right", input.right)

    return result
}

fun docReaderFieldRectFromJSON(input: JSONObject?): DocReaderFieldRect? {
    if (input == null) return null
    val result = DocReaderFieldRect()

    result.bottom = input.optInt("bottom")
    result.top = input.optInt("top")
    result.left = input.optInt("left")
    result.right = input.optInt("right")

    return result
}

fun generateDocReaderFieldRect(input: DocReaderFieldRect?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("bottom", input.bottom)
    result.put("top", input.top)
    result.put("left", input.left)
    result.put("right", input.right)

    return result
}

fun documentReaderGraphicFieldFromJSON(input: JSONObject?): DocumentReaderGraphicField? {
    if (input == null) return null
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

fun generateDocumentReaderGraphicField(input: DocumentReaderGraphicField?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun documentReaderGraphicResultFromJSON(input: JSONObject?): DocumentReaderGraphicResult? {
    if (input == null) return null
    val result = DocumentReaderGraphicResult()

    result.fields = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("fields"), ::documentReaderGraphicFieldFromJSON))

    return result
}

fun generateDocumentReaderGraphicResult(input: DocumentReaderGraphicResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("fields", Utils.generateList(input.fields, ::generateDocumentReaderGraphicField, context))

    return result
}

fun documentReaderValueFromJSON(input: JSONObject?): DocumentReaderValue? {
    if (input == null) return null
    val result = DocumentReaderValue()

    result.pageIndex = input.optInt("pageIndex")
    result.sourceType = input.optInt("sourceType")
    result.probability = input.optInt("probability")
    result.value = input.optString("value")
    result.originalValue = input.optString("originalValue")
    result.boundRect = rectFromJSON(input.optJSONObject("boundRect"))
    result.originalSymbols = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("originalSymbols"), ::documentReaderSymbolFromJSON))
    result.rfidOrigin = documentReaderRFIDOriginFromJSON(input.optJSONObject("rfidOrigin"))

    return result
}

fun generateDocumentReaderValue(input: DocumentReaderValue?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("pageIndex", input.pageIndex)
    result.put("sourceType", input.sourceType)
    result.put("probability", input.probability)
    result.put("value", input.value)
    result.put("originalValue", input.originalValue)
    result.put("boundRect", generateRect(input.boundRect))
    result.put("originalSymbols", Utils.generateList(input.originalSymbols, ::generateDocumentReaderSymbol))
    result.put("rfidOrigin", generateDocumentReaderRFIDOrigin(input.rfidOrigin))

    return result
}

fun documentReaderTextFieldFromJSON(input: JSONObject?): DocumentReaderTextField? {
    if (input == null) return null
    val result = DocumentReaderTextField()

    input.remove("getValue")
    result.fieldType = input.optInt("fieldType")
    result.lcid = input.optInt("lcid")
    result.status = input.optInt("status")
    result.value = input.optString("value")
    result.values = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("values"), ::documentReaderValueFromJSON))
    result.comparisonList = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("comparisonList"), ::documentReaderComparisonFromJSON))
    result.validityList = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("validityList"), ::documentReaderValidityFromJSON))
    result.comparisonStatus = input.optInt("comparisonStatus")
    result.validityStatus = input.optInt("validityStatus")

    return result
}

fun generateDocumentReaderTextField(input: DocumentReaderTextField?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("fieldType", input.fieldType)
    result.put("lcid", input.lcid)
    result.put("status", input.status)
    result.put("lcidName", input.getLcidName(context!!))
    result.put("fieldName", input.getFieldName(context))
    result.put("value", input.value)
    result.put("getValue", generateDocumentReaderValue(input.value()))
    result.put("values", Utils.generateList(input.values, ::generateDocumentReaderValue))
    result.put("comparisonList", Utils.generateList(input.comparisonList, ::generateDocumentReaderComparison))
    result.put("validityList", Utils.generateList(input.validityList, ::generateDocumentReaderValidity))
    result.put("comparisonStatus", input.comparisonStatus)
    result.put("validityStatus", input.validityStatus)

    return result
}

fun documentReaderTextResultFromJSON(input: JSONObject?): DocumentReaderTextResult? {
    if (input == null) return null
    val result = DocumentReaderTextResult()

    result.status = input.optInt("status")
    result.comparisonStatus = input.optInt("comparisonStatus")
    result.validityStatus = input.optInt("validityStatus")
    result.availableSourceList = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("availableSourceList"), ::documentReaderTextSourceFromJSON))
    result.fields = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("fields"), ::documentReaderTextFieldFromJSON))

    return result
}

fun generateDocumentReaderTextResult(input: DocumentReaderTextResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("status", input.status)
    result.put("comparisonStatus", input.comparisonStatus)
    result.put("validityStatus", input.validityStatus)
    result.put("availableSourceList", Utils.generateList(input.availableSourceList, ::generateDocumentReaderTextSource))
    result.put("fields", Utils.generateList(input.fields, ::generateDocumentReaderTextField, context))

    return result
}

fun coordinateFromJSON(input: JSONObject?): Coordinate? {
    if (input == null) return null
    val result = Coordinate()

    result.x = input.optInt("x")
    result.y = input.optInt("y")

    return result
}

fun generateCoordinate(input: Coordinate?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("x", input.x)
    result.put("y", input.y)

    return result
}

fun elementPositionFromJSON(input: JSONObject?): ElementPosition? {
    if (input == null) return null
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

fun generateElementPosition(input: ElementPosition?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun imageQualityFromJSON(input: JSONObject?): ImageQuality? {
    if (input == null) return null
    val result = ImageQuality()

    result.featureType = input.optInt("featureType")
    result.result = input.optInt("result")
    result.type = input.optInt("type")

    return result
}

fun generateImageQuality(input: ImageQuality?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("featureType", input.featureType)
    result.put("result", input.result)
    result.put("type", input.type)

    return result
}

fun imageQualityGroupFromJSON(input: JSONObject?): ImageQualityGroup? {
    if (input == null) return null
    val result = ImageQualityGroup()

    result.count = input.optInt("count")
    result.result = input.optInt("result")
    result.pageIndex = input.optInt("pageIndex")
    result.imageQualityList = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("imageQualityList"), ::imageQualityFromJSON))

    return result
}

fun generateImageQualityGroup(input: ImageQualityGroup?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("count", input.count)
    result.put("result", input.result)
    result.put("imageQualityList", Utils.generateList(input.imageQualityList, ::generateImageQuality))
    result.put("pageIndex", input.pageIndex)

    return result
}

fun documentReaderDocumentTypeFromJSON(input: JSONObject?): DocumentReaderDocumentType? {
    if (input == null) return null
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
    result.FDSID = Utils.intArrayFromJSON(input.optJSONArray("FDSID"))

    return result
}

fun generateDocumentReaderDocumentType(input: DocumentReaderDocumentType?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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
    result.put("FDSID", Utils.generateIntArray(input.FDSID))

    return result
}

fun generateDocumentReaderNotification(input: DocumentReaderNotification?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("notificationCode", input.notificationCode)
    result.put("dataFileType", input.dataFileType)
    result.put("progress", input.progress)

    return result
}

fun accessControlProcedureTypeFromJSON(input: JSONObject?): AccessControlProcedureType? {
    if (input == null) return null
    val result = AccessControlProcedureType()

    result.activeOptionIdx = input.optInt("activeOptionIdx")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.notifications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("notifications")))

    return result
}

fun generateAccessControlProcedureType(input: AccessControlProcedureType?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("activeOptionIdx", input.activeOptionIdx)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("notifications", Utils.generateList(input.notifications))

    return result
}

fun fileDataFromJSON(input: JSONObject?): FileData? {
    if (input == null) return null
    val result = FileData()

    result.length = input.optInt("length")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.data = input.optString("data")

    return result
}

fun generateFileData(input: FileData?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("length", input.length)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("data", input.data)

    return result
}

fun certificateDataFromJSON(input: JSONObject?): CertificateData? {
    if (input == null) return null
    val result = CertificateData()

    result.length = input.optInt("length")
    result.data = input.optString("data")

    return result
}

fun generateCertificateData(input: CertificateData?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("length", input.length)
    result.put("data", input.data)

    return result
}

fun securityObjectCertificatesFromJSON(input: JSONObject?): SecurityObjectCertificates? {
    if (input == null) return null
    val result = SecurityObjectCertificates()

    result.securityObject = certificateDataFromJSON(input.optJSONObject("securityObject"))

    return result
}

fun generateSecurityObjectCertificates(input: SecurityObjectCertificates?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("securityObject", generateCertificateData(input.securityObject))

    return result
}

fun fileFromJSON(input: JSONObject?): File? {
    if (input == null) return null
    val result = File()

    result.readingTime = input.optInt("readingTime")
    result.type = input.optInt("type")
    result.pAStatus = input.optLong("pAStatus")
    result.readingStatus = input.optInt("readingStatus").toLong()
    result.fileID = input.optString("fileID")
    result.fileData = fileDataFromJSON(input.optJSONObject("fileData"))
    result.certificates = securityObjectCertificatesFromJSON(input.optJSONObject("certificates"))
    result.docFieldsText = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("docFieldsText")))
    result.docFieldsGraphics = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("docFieldsGraphics")))
    result.docFieldsOriginals = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("docFieldsOriginals")))
    result.notifications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("notifications")))

    return result
}

fun generateFile(input: File?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("readingTime", input.readingTime)
    result.put("type", input.type)
    result.put("typeName", eRFID_DataFile_Type.getTranslation(context, input.type))
    result.put("pAStatus", input.pAStatus)
    result.put("readingStatus", input.readingStatus)
    result.put("fileID", input.fileID)
    result.put("fileData", generateFileData(input.fileData))
    result.put("certificates", generateSecurityObjectCertificates(input.certificates))
    result.put("docFieldsText", Utils.generateList(input.docFieldsText))
    result.put("docFieldsGraphics", Utils.generateList(input.docFieldsGraphics))
    result.put("docFieldsOriginals", Utils.generateList(input.docFieldsOriginals))
    result.put("notifications", Utils.generateList(input.notifications))

    return result
}

fun applicationFromJSON(input: JSONObject?): Application? {
    if (input == null) return null
    val result = Application()

    result.type = input.optInt("type")
    result.status = input.optInt("status")
    result.applicationID = input.optString("applicationID")
    result.dataHashAlgorithm = input.optString("dataHashAlgorithm")
    result.unicodeVersion = input.optString("unicodeVersion")
    result.version = input.optString("version")
    result.files = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("files"), ::fileFromJSON))

    return result
}

fun generateApplication(input: Application?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("type", input.type)
    result.put("status", input.status)
    result.put("applicationID", input.applicationID)
    result.put("dataHashAlgorithm", input.dataHashAlgorithm)
    result.put("unicodeVersion", input.unicodeVersion)
    result.put("version", input.version)
    result.put("files", Utils.generateList(input.files, ::generateFile, context))

    return result
}

fun valueFromJSON(input: JSONObject?): Value? {
    if (input == null) return null
    val result = Value()

    result.length = input.optInt("length")
    result.type = input.optInt("type")
    result.status = input.optInt("status").toLong()
    result.data = input.optString("data")
    result.format = input.optString("format")

    return result
}

fun generateValue(input: Value?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("length", input.length)
    result.put("type", input.type)
    result.put("status", input.status)
    result.put("data", input.data)
    result.put("format", input.format)

    return result
}

fun attributeFromJSON(input: JSONObject?): Attribute? {
    if (input == null) return null
    val result = Attribute()

    result.type = input.optString("type")
    result.value = valueFromJSON(input.optJSONObject("value"))

    return result
}

fun generateAttribute(input: Attribute?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("type", input.type)
    result.put("value", generateValue(input.value))

    return result
}

fun authorityFromJSON(input: JSONObject?): Authority? {
    if (input == null) return null
    val result = Authority()

    result.data = input.optString("data")
    result.friendlyName = valueFromJSON(input.optJSONObject("friendlyName"))
    result.attributes = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("attributes"), ::attributeFromJSON))

    return result
}

fun generateAuthority(input: Authority?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", input.data)
    result.put("friendlyName", generateValue(input.friendlyName))
    result.put("attributes", Utils.generateList(input.attributes, ::generateAttribute))

    return result
}

fun extensionFromJSON(input: JSONObject?): Extension? {
    if (input == null) return null
    val result = Extension()

    result.data = input.optString("data")
    result.type = input.optString("type")

    return result
}

fun generateExtension(input: Extension?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", input.data)
    result.put("type", input.type)

    return result
}

fun validityFromJSON(input: JSONObject?): Validity? {
    if (input == null) return null
    val result = Validity()

    result.notAfter = valueFromJSON(input.optJSONObject("notAfter"))
    result.notBefore = valueFromJSON(input.optJSONObject("notBefore"))

    return result
}

fun generateValidity(input: Validity?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("notAfter", generateValue(input.notAfter))
    result.put("notBefore", generateValue(input.notBefore))

    return result
}

fun certificateChainFromJSON(input: JSONObject?): CertificateChain? {
    if (input == null) return null
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
    result.notifications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("notifications")))
    result.extensions = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("extensions"), ::extensionFromJSON))

    return result
}

fun generateCertificateChain(input: CertificateChain?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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
    result.put("notifications", Utils.generateList(input.notifications))
    result.put("extensions", Utils.generateList(input.extensions, ::generateExtension))

    return result
}

fun signerInfoFromJSON(input: JSONObject?): SignerInfo? {
    if (input == null) return null
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
    result.notifications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("notifications")))
    result.signedAttributes = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("signedAttributes"), ::extensionFromJSON))
    result.certificateChain = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("certificateChain"), ::certificateChainFromJSON))

    return result
}

fun generateSignerInfo(input: SignerInfo?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("version", input.version)
    result.put("paStatus", input.paStatus)
    result.put("dataToHash", input.dataToHash)
    result.put("digestAlgorithm", input.digestAlgorithm)
    result.put("signatureAlgorithm", input.signatureAlgorithm)
    result.put("serialNumber", generateValue(input.serialNumber))
    result.put("signature", generateValue(input.signature))
    result.put("subjectKeyIdentifier", generateValue(input.subjectKeyIdentifier))
    result.put("issuer", generateAuthority(input.issuer))
    result.put("notifications", Utils.generateList(input.notifications))
    result.put("signedAttributes", Utils.generateList(input.signedAttributes, ::generateExtension))
    result.put("certificateChain", Utils.generateList(input.certificateChain, ::generateCertificateChain))

    return result
}

fun securityObjectFromJSON(input: JSONObject?): SecurityObject? {
    if (input == null) return null
    val result = SecurityObject()

    result.fileReference = input.optInt("fileReference")
    result.version = input.optInt("version")
    result.objectType = input.optString("objectType")
    result.notifications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("notifications")))
    result.signerInfos = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("signerInfos"), ::signerInfoFromJSON))

    return result
}

fun generateSecurityObject(input: SecurityObject?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("fileReference", input.fileReference)
    result.put("version", input.version)
    result.put("objectType", input.objectType)
    result.put("notifications", Utils.generateList(input.notifications))
    result.put("signerInfos", Utils.generateList(input.signerInfos, ::generateSignerInfo))

    return result
}

fun cardPropertiesFromJSON(input: JSONObject?): CardProperties? {
    if (input == null) return null
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

fun generateCardProperties(input: CardProperties?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun rfidSessionDataFromJSON(input: JSONObject?): RFIDSessionData? {
    if (input == null) return null
    val result = RFIDSessionData()

    result.totalBytesReceived = input.optInt("totalBytesReceived")
    result.totalBytesSent = input.optInt("totalBytesSent")
    result.status = input.optInt("status").toLong()
    result.extLeSupport = input.optLong("extLeSupport")
    result.processTime = input.optLong("processTime")
    result.cardProperties = cardPropertiesFromJSON(input.optJSONObject("cardProperties"))
    result.accessControls = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("accessControls"), ::accessControlProcedureTypeFromJSON))
    result.applications = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("applications"), ::applicationFromJSON))
    result.securityObjects = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("securityObjects"), ::securityObjectFromJSON))
    result.dataFields = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("dataFields"), ::dataFieldFromJSON))
    result.dataGroups = Utils.intArrayFromJSON(input.optJSONArray("dataGroups"))

    return result
}

fun generateRFIDSessionData(input: RFIDSessionData?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("totalBytesReceived", input.totalBytesReceived)
    result.put("totalBytesSent", input.totalBytesSent)
    result.put("status", input.status)
    result.put("extLeSupport", input.extLeSupport)
    result.put("processTime", input.processTime)
    result.put("cardProperties", generateCardProperties(input.cardProperties))
    result.put("accessControls", Utils.generateList(input.accessControls, ::generateAccessControlProcedureType))
    result.put("applications", Utils.generateList(input.applications, ::generateApplication, context))
    result.put("securityObjects", Utils.generateList(input.securityObjects, ::generateSecurityObject))
    result.put("dataGroups", Utils.generateIntArray(input.dataGroups))
    result.put("dataFields", Utils.generateList(input.dataFields, ::generateDataField))

    return result
}

fun dataFieldFromJSON(input: JSONObject?): DataField? {
    if (input == null) return null
    val result = DataField()

    result.data = input.optString("data")
    result.fieldType = input.optInt("fieldType")

    return result
}

fun generateDataField(input: DataField?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", input.data)
    result.put("fieldType", input.fieldType)

    return result
}

fun documentReaderAuthenticityCheckFromJSON(input: JSONObject?): DocumentReaderAuthenticityCheck? {
    if (input == null) return null
    val result = DocumentReaderAuthenticityCheck()

    result.type = input.optInt("type")
    result.pageIndex = input.optInt("pageIndex")
    result.elements = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("elements"), ::documentReaderAuthenticityElementFromJSON))

    return result
}

fun generateDocumentReaderAuthenticityCheck(input: DocumentReaderAuthenticityCheck?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("type", input.type)
    result.put("status", input.getStatus())
    result.put("typeName", input.getTypeName(context))
    result.put("pageIndex", input.pageIndex)
    result.put("elements", Utils.generateList(input.elements, ::generateDocumentReaderAuthenticityElement, context))

    return result
}

fun pdf417InfoFromJSON(input: JSONObject?): PDF417Info? {
    if (input == null) return null
    val result = PDF417Info()

    result.errorLevel = input.optInt("errorLevel")
    result.columns = input.optInt("columns")
    result.rows = input.optInt("rows")

    return result
}

fun generatePDF417Info(input: PDF417Info?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("errorLevel", input.errorLevel)
    result.put("columns", input.columns)
    result.put("rows", input.rows)

    return result
}

fun documentReaderBarcodeResultFromJSON(input: JSONObject?): DocumentReaderBarcodeResult? {
    if (input == null) return null
    val result = DocumentReaderBarcodeResult()

    result.fields = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("fields"), ::documentReaderBarcodeFieldFromJSON))

    return result
}

fun generateDocumentReaderBarcodeResult(input: DocumentReaderBarcodeResult?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("fields", Utils.generateList(input.fields, ::generateDocumentReaderBarcodeField))

    return result
}

fun documentReaderBarcodeFieldFromJSON(input: JSONObject?): DocumentReaderBarcodeField? {
    if (input == null) return null
    val result = DocumentReaderBarcodeField()

    result.barcodeType = input.optInt("barcodeType")
    result.status = input.optInt("status")
    result.pageIndex = input.optInt("pageIndex")
    result.pdf417Info = pdf417InfoFromJSON(input.optJSONObject("pdf417Info"))
    result.data = Convert.byteArrayFromBase64(input.optString("data"))

    return result
}

fun generateDocumentReaderBarcodeField(input: DocumentReaderBarcodeField?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("barcodeType", input.barcodeType)
    result.put("status", input.status)
    result.put("pageIndex", input.pageIndex)
    result.put("pdf417Info", generatePDF417Info(input.pdf417Info))
    result.put("data", Convert.generateByteArray(input.data))

    return result
}

fun documentReaderAuthenticityResultFromJSON(input: JSONObject?): DocumentReaderAuthenticityResult? {
    if (input == null) return null
    val result = DocumentReaderAuthenticityResult()

    result.checks = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("checks"), ::documentReaderAuthenticityCheckFromJSON))

    return result
}

fun generateDocumentReaderAuthenticityResult(input: DocumentReaderAuthenticityResult?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("status", input.status)
    result.put("checks", Utils.generateList(input.checks, ::generateDocumentReaderAuthenticityCheck, context))

    return result
}

fun documentReaderAuthenticityElementFromJSON(input: JSONObject?): DocumentReaderAuthenticityElement? {
    if (input == null) return null
    val result = DocumentReaderAuthenticityElement()

    result.status = input.optInt("status")
    result.elementType = input.optInt("elementType")
    result.elementDiagnose = input.optInt("elementDiagnose")

    return result
}

fun generateDocumentReaderAuthenticityElement(input: DocumentReaderAuthenticityElement?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("status", input.status)
    result.put("elementType", input.elementType)
    result.put("elementDiagnose", input.elementDiagnose)
    result.put("elementTypeName", input.getElementTypeName(context))
    result.put("elementDiagnoseName", input.getElementDiagnoseName(context))

    return result
}

fun paResourcesIssuerFromJSON(input: JSONObject?): PAResourcesIssuer? {
    if (input == null) return null
    val result = PAResourcesIssuer()

    result.data = Convert.byteArrayFromBase64(input.optString("data"))
    result.friendlyName = input.optString("friendlyName")
    result.attributes = Utils.arrayFromJSON(input.optJSONArray("attributes"), ::paAttributeFromJSON, arrayOfNulls(0))

    return result
}

fun generatePAResourcesIssuer(input: PAResourcesIssuer?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", Convert.generateByteArray(input.data))
    result.put("friendlyName", input.friendlyName)
    result.put("attributes", Utils.generateArray(input.attributes, ::generatePAAttribute))

    return result
}

fun paAttributeFromJSON(input: JSONObject?): PAAttribute? {
    if (input == null) return null
    val result = PAAttribute()

    result.type = input.optString("type")
    result.value = input.optString("value")

    return result
}

fun generatePAAttribute(input: PAAttribute?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("type", input.type)
    result.put("value", input.value)

    return result
}

fun taChallengeFromJSON(input: JSONObject?): TAChallenge? {
    if (input == null) return null
    val result = TAChallenge()

    result.data = Convert.byteArrayFromBase64(input.optString("data"))
    result.auxPCD = input.optString("auxPCD")
    result.challengePICC = input.optString("challengePICC")
    result.hashPK = input.optString("hashPK")
    result.idPICC = input.optString("idPICC")

    return result
}

fun generateTAChallenge(input: TAChallenge?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", Convert.generateByteArray(input.data))
    result.put("auxPCD", input.auxPCD)
    result.put("challengePICC", input.challengePICC)
    result.put("hashPK", input.hashPK)
    result.put("idPICC", input.idPICC)

    return result
}

fun documentReaderResultsStatusFromJSON(input: JSONObject?): DocumentReaderResultsStatus? {
    if (input == null) return null

    input.remove("detailsRFID")

    return DocumentReaderResultsStatus.fromJson(input)
}

fun generateDocumentReaderResultsStatus(input: DocumentReaderResultsStatus?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("overallStatus", input.overallStatus)
    result.put("optical", input.optical)
    result.put("detailsOptical", generateDetailsOptical(input.detailsOptical))
    result.put("rfid", input.rfid)
    result.put("detailsRFID", generateDetailsRFID(input.detailsRFID))
    result.put("portrait", input.portrait)
    result.put("stopList", input.stopList)

    return result
}

fun generateDetailsOptical(input: DetailsOptical?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun generateDetailsRFID(input: DetailsRFID?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

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

fun generateVDSNCData(input: VDSNCData?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("type", input.type)
    result.put("version", input.version)
    result.put("issuingCountry", input.issuingCountry)
    result.put("message", input.message)
    result.put("signatureAlgorithm", input.signatureAlg)
    result.put("signature", generateBytesData(input.signature))
    result.put("certificate", generateBytesData(input.certificate))
    result.put("certificateChain", Utils.generateList(input.certificateChain, ::generateCertificateChain))
    result.put("notifications", Utils.generateLongArray(input.notifications))

    return result
}

fun bytesDataDictionaryFromJSON(input: JSONObject?): JSONObject? {
    if (input == null) return null
    val temp = JSONObject(input.toString())

    temp.put("Data", input.optString("data"))
    temp.put("Length", input.optInt("length"))
    temp.put("Status", input.optLong("status"))
    temp.put("Type", input.optInt("type"))

    return temp
}

fun bytesDataFromJSON(input: JSONObject?) = BytesData.fromJson(bytesDataDictionaryFromJSON(input))

fun generateBytesData(input: BytesData?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("data", input.data)
    result.put("length", input.length)
    result.put("status", input.status)
    result.put("type", input.type)

    return result
}

fun generateLicense(input: License?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("expiryDate", Utils.toStringOrNull(input.expiryDate))
    result.put("countryFilter", Utils.generateList(input.countryFilter))
    result.put("isRfidAvailable", input.isRfidAvailable)

    return result
}

fun generateDocReaderVersion(input: DocReaderVersion?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("api", input.api)
    result.put("core", input.core)
    result.put("coreMode", input.coreMode)
    result.put("database", generateDocReaderDocumentsDatabase(input.database))

    return result
}

fun docReaderDocumentsDatabaseFromJSON(input: JSONObject?): DocReaderDocumentsDatabase? {
    if (input == null) return null
    val temp = JSONObject(input.toString())

    temp.put("id", input.optString("databaseID"))
    temp.put("export_date", input.optString("date"))
    temp.put("description", input.optString("databaseDescription"))

    return DocReaderDocumentsDatabase.fromJson(temp)
}

fun generateDocReaderDocumentsDatabase(input: DocReaderDocumentsDatabase?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("databaseID", input.databaseID)
    result.put("version", input.version)
    result.put("date", input.date)
    result.put("databaseDescription", input.databaseDescription)
    result.put("countriesNumber", input.countriesNumber)
    result.put("documentsNumber", input.documentsNumber)
    result.put("size", input.size)

    return result
}

fun documentReaderComparisonFromJSON(input: JSONObject?): DocumentReaderComparison? {
    if (input == null) return null
    val result = DocumentReaderComparison()

    result.sourceTypeLeft = input.optInt("sourceTypeLeft")
    result.sourceTypeRight = input.optInt("sourceTypeRight")
    result.status = input.optInt("status")

    return result
}

fun generateDocumentReaderComparison(input: DocumentReaderComparison?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("sourceTypeLeft", input.sourceTypeLeft)
    result.put("sourceTypeRight", input.sourceTypeRight)
    result.put("status", input.status)

    return result
}

fun documentReaderRFIDOriginFromJSON(input: JSONObject?): DocumentReaderRfidOrigin? {
    if (input == null) return null
    val result = DocumentReaderRfidOrigin()

    result.dg = input.optInt("dg")
    result.dgTag = input.optInt("dgTag")
    result.entryView = input.optInt("entryView")
    result.tagEntry = input.optInt("tagEntry")

    return result
}

fun generateDocumentReaderRFIDOrigin(input: DocumentReaderRfidOrigin?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("dg", input.dg)
    result.put("dgTag", input.dgTag)
    result.put("entryView", input.entryView)
    result.put("tagEntry", input.tagEntry)

    return result
}

fun documentReaderTextSourceFromJSON(input: JSONObject?): DocumentReaderTextSource? {
    if (input == null) return null
    val result = DocumentReaderTextSource()

    result.sourceType = input.optInt("sourceType")
    result.source = input.optString("source")
    result.validityStatus = input.optInt("validityStatus")

    return result
}

fun generateDocumentReaderTextSource(input: DocumentReaderTextSource?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("sourceType", input.sourceType)
    result.put("source", input.source)
    result.put("validityStatus", input.validityStatus)

    return result
}

fun documentReaderSymbolFromJSON(input: JSONObject?): DocumentReaderSymbol? {
    if (input == null) return null
    val result = DocumentReaderSymbol()

    result.code = input.optInt("code")
    result.probability = input.optInt("probability")
    result.rect = rectFromJSON(input.optJSONObject("rect"))

    return result
}

fun generateDocumentReaderSymbol(input: DocumentReaderSymbol?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("code", input.code)
    result.put("rect", generateRect(input.rect))
    result.put("probability", input.probability)

    return result
}

fun documentReaderValidityFromJSON(input: JSONObject?): DocumentReaderValidity? {
    if (input == null) return null
    val result = DocumentReaderValidity()

    result.sourceType = input.optInt("sourceType")
    result.status = input.optInt("status")

    return result
}

fun generateDocumentReaderValidity(input: DocumentReaderValidity?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("sourceType", input.sourceType)
    result.put("status", input.status)

    return result
}

fun barcodeTypeArrayFromJson(input: JSONArray?): Array<String?>? {
    if (input == null) return null

    val result = arrayOfNulls<String>(input.length())
    for (i in 0 until input.length()) result[i] = BarcodeType.valueOf(input.getInt(i))

    return result
}

fun generateBarcodeTypeArray(input: Array<String?>?): JSONArray? {
    if (input == null) return null
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

fun documentReaderResultsFromJSON(input: JSONObject?): DocumentReaderResults? {
    if (input == null) return null
    val result = DocumentReaderResults()

    result.chipPage = input.optInt("chipPage")
    result.processingFinishedStatus = input.optInt("processingFinishedStatus")
    result.elapsedTime = input.optInt("elapsedTime")
    result.elapsedTimeRFID = input.optInt("elapsedTimeRFID")
    result.morePagesAvailable = input.optInt("morePagesAvailable")
    result.graphicResult = documentReaderGraphicResultFromJSON(input.optJSONObject("graphicResult"))
    result.textResult = documentReaderTextResultFromJSON(input.optJSONObject("textResult"))
    result.documentPosition = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("documentPosition"), ::elementPositionFromJSON))
    result.barcodePosition = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("barcodePosition"), ::elementPositionFromJSON))
    result.mrzPosition = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("mrzPosition"), ::elementPositionFromJSON))
    result.imageQuality = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("imageQuality"), ::imageQualityGroupFromJSON))
    result.rawResult = input.optString("rawResult")
    result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"))
    result.authenticityResult = documentReaderAuthenticityResultFromJSON(input.optJSONObject("authenticityResult"))
    result.barcodeResult = documentReaderBarcodeResultFromJSON(input.optJSONObject("barcodeResult"))
    result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"))
    result.documentType = Objects.requireNonNull(Utils.listFromJSON(input.optJSONArray("documentType"), ::documentReaderDocumentTypeFromJSON))
    result.status = documentReaderResultsStatusFromJSON(input.optJSONObject("status"))!!
    result.vdsncData = vdsncDataFromJSON(input.optJSONObject("vdsncData")!!)

    return result
}

fun generateDocumentReaderResults(input: DocumentReaderResults?, context: Context?): JSONObject? {
    val result = JSONObject()
    if (input == null) return null

    result.put("chipPage", input.chipPage)
    result.put("processingFinishedStatus", input.processingFinishedStatus)
    result.put("elapsedTime", input.elapsedTime)
    result.put("elapsedTimeRFID", input.elapsedTimeRFID)
    result.put("morePagesAvailable", input.morePagesAvailable)
    result.put("graphicResult", generateDocumentReaderGraphicResult(input.graphicResult, context))
    result.put("textResult", generateDocumentReaderTextResult(input.textResult, context))
    result.put("documentPosition", Utils.generateList(input.documentPosition, ::generateElementPosition))
    result.put("barcodePosition", Utils.generateList(input.barcodePosition, ::generateElementPosition))
    result.put("mrzPosition", Utils.generateList(input.mrzPosition, ::generateElementPosition))
    result.put("imageQuality", Utils.generateList(input.imageQuality, ::generateImageQualityGroup))
    result.put("rawResult", input.rawResult)
    result.put("rfidSessionData", generateRFIDSessionData(input.rfidSessionData, context))
    result.put("authenticityResult", generateDocumentReaderAuthenticityResult(input.authenticityResult, context))
    result.put("barcodeResult", generateDocumentReaderBarcodeResult(input.barcodeResult))
    result.put("documentType", Utils.generateList(input.documentType, ::generateDocumentReaderDocumentType))
    result.put("status", generateDocumentReaderResultsStatus(input.status))
    result.put("vdsncData", generateVDSNCData(input.vdsncData))

    return result
}