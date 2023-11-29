//
//  FlutterDocumentReaderApiPluginTest.kt
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.json.JSONArray
import org.json.JSONObject
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import org.skyscreamer.jsonassert.JSONAssert
import java.nio.file.Files
import java.nio.file.Paths

@RunWith(RobolectricTestRunner::class)
@Config(shadows = [MyShadowBitmap::class, MyShadowDrawable::class, MyShadowBitmapDrawable::class])
class FlutterDocumentReaderApiPluginTest {
    // config

    @Test
    fun initConfig() = compare("InitConfig", ::docReaderConfigFromJSON, ::generateDocReaderConfig, "databasePath")

    @Test
    fun onlineProcessingConfig() = compare("OnlineProcessingConfig", ::onlineProcessingConfigFromJSON, ::generateOnlineProcessingConfig)

    @Test
    fun imageInputData() = compare("ImageInputData", ::imageInputDataFromJSON, ::generateImageInputData)

    @Test
    fun recognizeConfig() = compare("RecognizeConfig", ::recognizeConfigFromJSON, ::generateRecognizeConfig, "onlineProcessingConfig")

    @Test
    fun scannerConfig() = compare("ScannerConfig", ::scannerConfigFromJSON, ::generateScannerConfig)

    // params.process_params

    @Test
    fun faceApiSearchParams() = compare("FaceApiSearchParams", ::faceApiSearchParamsFromJSON, ::generateFaceApiSearchParams)

    @Test
    fun faceApiParams() = compare("FaceApiParams", ::faceApiParamsFromJSON, ::generateFaceApiParams)

    @Test
    fun glaresCheckParams() = compare("GlaresCheckParams", ::glaresCheckParamsFromJSON, ::generateGlaresCheckParams)

    @Test
    fun imageQA() = compare("ImageQA", ::imageQAFromJSON, ::generateImageQA)

    @Test
    fun rfidParams() = compare("RFIDParams", ::rfidParamsFromJSON, ::generateRFIDParams)

    @Test
    fun processParam() = compare("ProcessParam", ::processParamFromJSON, ::generateProcessParam)

    //params.rfid_scenario

    @Test
    fun reprocParams() = compare("ReprocParams", ::reprocParamsFromJSON, ::generateReprocParams)

    @Test
    fun eDLDataGroups() = compare("EDLDataGroups", ::eDLDataGroupsFromJSON, ::generateEDLDataGroups)

    @Test
    fun ePassportDataGroups() = compare("EPassportDataGroups", ::ePassportDataGroupsFromJSON, ::generateEPassportDataGroups)

    @Test
    fun eIDDataGroups() = compare("EIDDataGroups", ::eIDDataGroupsFromJSON, ::generateEIDDataGroups)

    @Test
    fun rfidScenario() = compare("RFIDScenario", ::rfidScenarioFromJSON, ::generateRfidScenario)

    // params

    @Test
    fun customization() {
        val expected = readFile("Customization")
        val omit = listOf(
            "helpAnimationImageContentMode",
            "multipageAnimationFrontImageContentMode",
            "multipageAnimationBackImageContentMode",
            "hologramAnimationImageContentMode",
            "borderBackgroundImageContentMode",
            "statusTextFont",
            "resultStatusTextFont"
        )
        for (key in omit) expected.remove(key)
        val actual = generateCustomization(customizationFromJSON(expected, ApplicationProvider.getApplicationContext()))
        compareJSONs("Customization", expected, floatToDouble(actual))
    }

    @Test
    fun functionality() = compare(
        "Functionality", ::functionalityFromJSON, ::generateFunctionality,
        "useAuthenticator", "singleResult", "videoSessionPreset"
    )

    // info

    @Test
    fun docReaderDocumentsDatabase() = compare("DocReaderDocumentsDatabase", ::docReaderDocumentsDatabaseFromJSON, ::generateDocReaderDocumentsDatabase)

    @Test
    fun documentReaderScenario() = compare(
        "DocumentReaderScenario", ::documentReaderScenarioFromJSON, ::generateDocumentReaderScenario,
        "barcodeExt", "frame"
    )

    @Test
    fun documentReaderException() = compare("DocumentReaderException", ::regulaExceptionFromJSON, ::generateRegulaException)

    // results.authenticity

    @Test
    fun documentReaderAuthenticityElement() = compare("DocumentReaderAuthenticityElement", ::documentReaderAuthenticityElementFromJSON, ::generateDocumentReaderAuthenticityElement)

    @Test
    fun documentReaderAuthenticityCheck() = compare("DocumentReaderAuthenticityCheck", ::documentReaderAuthenticityCheckFromJSON, ::generateDocumentReaderAuthenticityCheck)

    @Test
    fun documentReaderAuthenticityResult() = compare("DocumentReaderAuthenticityResult", ::documentReaderAuthenticityResultFromJSON, ::generateDocumentReaderAuthenticityResult)

    // results.barcode

    @Test
    fun pdf417Info() = compare("PDF417Info", ::pdf417InfoFromJSON, ::generatePDF417Info)

    @Test
    fun documentReaderBarcodeField() = compare("DocumentReaderBarcodeField", ::documentReaderBarcodeFieldFromJSON, ::generateDocumentReaderBarcodeField)

    @Test
    fun documentReaderBarcodeResult() = compare("DocumentReaderBarcodeResult", ::documentReaderBarcodeResultFromJSON, ::generateDocumentReaderBarcodeResult)

    // results.image_quality

    @Test
    fun imageQuality() = compare("ImageQuality", ::imageQualityFromJSON, ::generateImageQuality, "boundRects")

    @Test
    fun imageQualityGroup() = compare("ImageQualityGroup", ::imageQualityGroupFromJSON, ::generateImageQualityGroup, "imageQualityList.boundRects")

    // results.rfid

    @Test
    fun accessControlProcedureType() = compare("AccessControlProcedureType", ::accessControlProcedureTypeFromJSON, ::generateAccessControlProcedureType)

    @Test
    fun fileData() = compare("FileData", ::fileDataFromJSON, ::generateFileData)

    @Test
    fun certificateData() = compare("CertificateData", ::certificateDataFromJSON, ::generateCertificateData)

    @Test
    fun securityObjectCertificates() = compare("SecurityObjectCertificates", ::securityObjectCertificatesFromJSON, ::generateSecurityObjectCertificates)

    @Test
    fun file() = compare("File", ::fileFromJSON, ::generateFile)

    @Test
    fun application() = compare("Application", ::applicationFromJSON, ::generateApplication)

    @Test
    fun value() = compare("Value", ::valueFromJSON, ::generateValue)

    @Test
    fun attribute() = compare("Attribute", ::attributeFromJSON, ::generateAttribute)

    @Test
    fun authority() = compare("Authority", ::authorityFromJSON, ::generateAuthority)

    @Test
    fun cardProperties() = compare("CardProperties", ::cardPropertiesFromJSON, ::generateCardProperties)

    @Test
    fun extension() = compare("Extension", ::extensionFromJSON, ::generateExtension)

    @Test
    fun validity() = compare("Validity", ::validityFromJSON, ::generateValidity)

    @Test
    fun certificateChain() = compare("CertificateChain", ::certificateChainFromJSON, ::generateCertificateChain)

    @Test
    fun dataField() = compare("DataField", ::dataFieldFromJSON, ::generateDataField)

    @Test
    fun signerInfo() = compare("SignerInfo", ::signerInfoFromJSON, ::generateSignerInfo)

    @Test
    fun securityObject() = compare("SecurityObject", ::securityObjectFromJSON, ::generateSecurityObject)

    @Test
    fun rfidSessionData() = compare("RFIDSessionData", ::rfidSessionDataFromJSON, ::generateRFIDSessionData)

    @Test
    fun bytesData() = compare("BytesData", ::bytesDataFromJSON, ::generateBytesData)

    @Test
    fun vdsncData() = compare(
        "VDSNCData", ::vdsncDataFromJSON, ::generateVDSNCData,
        "certificateChain"
    )

    // results.visual_results

    @Test
    fun documentReaderComparison() = compare("DocumentReaderComparison", ::documentReaderComparisonFromJSON, ::generateDocumentReaderComparison)

    @Test
    fun rect() = compare("Rect", ::rectFromJSON, ::generateRect)

    @Test
    fun documentReaderGraphicField() = compare("DocumentReaderGraphicField", ::documentReaderGraphicFieldFromJSON, ::generateDocumentReaderGraphicField)

    @Test
    fun documentReaderGraphicResult() = compare("DocumentReaderGraphicResult", ::documentReaderGraphicResultFromJSON, ::generateDocumentReaderGraphicResult)

    @Test
    fun documentReaderRFIDOrigin() = compare("DocumentReaderRFIDOrigin", ::documentReaderRFIDOriginFromJSON, ::generateDocumentReaderRFIDOrigin)

    @Test
    fun documentReaderSymbol() = compare("DocumentReaderSymbol", ::documentReaderSymbolFromJSON, ::generateDocumentReaderSymbol)

    @Test
    fun documentReaderValidity() = compare("DocumentReaderValidity", ::documentReaderValidityFromJSON, ::generateDocumentReaderValidity)

    @Test
    fun documentReaderValue() = compare("DocumentReaderValue", ::documentReaderValueFromJSON, ::generateDocumentReaderValue)

    @Test
    fun documentReaderTextField() = compare("DocumentReaderTextField", ::documentReaderTextFieldFromJSON, ::generateDocumentReaderTextField)

    @Test
    fun documentReaderTextSource() = compare("DocumentReaderTextSource", ::documentReaderTextSourceFromJSON, ::generateDocumentReaderTextSource)

    @Test
    fun documentReaderTextResult() = compare("DocumentReaderTextResult", ::documentReaderTextResultFromJSON, ::generateDocumentReaderTextResult)

    // results

    @Test
    fun documentReaderResultsStatus() = compare("DocumentReaderResultsStatus", ::documentReaderResultsStatusFromJSON, ::generateDocumentReaderResultsStatus)

    @Test
    fun documentReaderDocumentType() = compare("DocumentReaderDocumentType", ::documentReaderDocumentTypeFromJSON, ::generateDocumentReaderDocumentType)

    @Test
    fun coordinate() = compare("Coordinate", ::coordinateFromJSON, ::generateCoordinate)

    @Test
    fun elementPosition() = compare("ElementPosition", ::elementPositionFromJSON, ::generateElementPosition)

    @Test
    fun documentReaderResults() = compare(
        "DocumentReaderResults", ::documentReaderResultsFromJSON, ::generateDocumentReaderResults,
        "imageQuality.imageQualityList.boundRects", "vdsncData.certificateChain"
    )

    // rfid

    @Test
    fun paAttribute() = compare("PAAttribute", ::paAttributeFromJSON, ::generatePAAttribute)

    @Test
    fun paResourcesIssuer() = compare("PAResourcesIssuer", ::paResourcesIssuerFromJSON, ::generatePAResourcesIssuer)

    @Test
    fun pkdCertificate() = compare("PKDCertificate", ::pkdCertificateFromJSON, ::generatePKDCertificate)

    @Test
    fun taChallenge() = compare("TAChallenge", ::taChallengeFromJSON, ::generateTAChallenge)

    @Test
    fun tccParams() = compare("TccParams", ::tccParamsFromJSON, ::generateTccParams)
}

private fun readFile(name: String): JSONObject {
    val bytes = Files.readAllBytes(Paths.get("../test/json/$name.json"))
    return JSONObject(String(bytes))
}

private fun compareJSONs(name: String, expected: JSONObject, actual: JSONObject) =
    try {
        JSONAssert.assertEquals(expected, actual, false)
    } catch (e: Throwable) {
        println("\nAndroid test failed: $name")
        println(" Expected JSON:\n$expected")
        println(" Actual JSON:\n$actual")
        throw e
    }

private fun <T> compare(
    name: String,
    fromJson: (JSONObject) -> T,
    toJson: (T) -> JSONObject?,
    vararg omit: String
) {
    var expected = readFile(name)
    for (key in omit) expected = omitDeep(expected, key.split("."), 0)
    val actual = toJson(fromJson(expected))!!
    compareJSONs(name, expected, actual)
}

fun omitDeep(dict: JSONObject, path: List<String>, index: Int): JSONObject {
    if (index < path.size - 1) {
        val node = dict.get(path[index])
        if (node is JSONObject)
            dict.put(path[index], omitDeep(node, path, index + 1))
        else if (node is JSONArray)
            dict.put(path[index], omitDeep(node, path, index + 1))
    } else
        dict.remove(path[index])
    return dict
}

fun omitDeep(dict: JSONArray, path: List<String>, index: Int): JSONArray {
    for (i in 0..<dict.length())
        dict.put(i, omitDeep(dict.getJSONObject(i), path, index))
    return dict
}

private fun <T> compare(
    name: String,
    fromJson: (JSONObject) -> T,
    toJson: (T, Context) -> JSONObject?,
    vararg omit: String
) {
    var expected = readFile(name)
    for (key in omit) expected = omitDeep(expected, key.split("."), 0)
    val actual = toJson(fromJson(expected), ApplicationProvider.getApplicationContext())!!
    compareJSONs(name, expected, actual)
}

private fun floatToDouble(input: JSONObject): JSONObject {
    for (key in input.keys()) {
        val value = input.get(key)
        if (value is JSONObject) input.put(key, floatToDouble(value))
        if (value is JSONArray) input.put(key, floatToDouble(value))
        if (value is Float) input.put(key, value.toString().toDouble())
    }
    return input
}

private fun floatToDouble(input: JSONArray): JSONArray {
    for (i in 0..<input.length()) {
        val value = input.get(i)
        if (value is JSONObject) input.put(i, floatToDouble(value))
        if (value is JSONArray) input.put(i, floatToDouble(value))
        if (value is Float) input.put(i, value.toString().toDouble())
    }
    return input
}