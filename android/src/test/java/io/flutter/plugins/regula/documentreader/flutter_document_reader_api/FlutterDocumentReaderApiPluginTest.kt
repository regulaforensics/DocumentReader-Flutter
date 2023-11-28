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
    fun initConfig() = compare(
        "InitConfig",
        JSONConstructor::docReaderConfigFromJSON,
        JSONConstructor::generateDocReaderConfig,
        "databasePath"
    )

    @Test
    fun onlineProcessingConfig() = compare(
        "OnlineProcessingConfig",
        JSONConstructor::onlineProcessingConfigFromJSON,
        JSONConstructor::generateOnlineProcessingConfig
    )

    @Test
    fun imageInputData() = compare(
        "ImageInputData",
        JSONConstructor::imageInputDataFromJSON,
        JSONConstructor::generateImageInputData
    )

    @Test
    fun recognizeConfig() = compare(
        "RecognizeConfig",
        JSONConstructor::recognizeConfigFromJSON,
        JSONConstructor::generateRecognizeConfig,
        "onlineProcessingConfig"
    )

    @Test
    fun scannerConfig() = compare(
        "ScannerConfig",
        JSONConstructor::scannerConfigFromJSON,
        JSONConstructor::generateScannerConfig
    )

    // params.process_params

    @Test
    fun faceApiSearchParams() = compare(
        "FaceApiSearchParams",
        JSONConstructor::faceApiSearchParamsFromJSON,
        JSONConstructor::generateFaceApiSearchParams
    )

    @Test
    fun faceApiParams() = compare(
        "FaceApiParams",
        JSONConstructor::faceApiParamsFromJSON,
        JSONConstructor::generateFaceApiParams
    )

    @Test
    fun glaresCheckParams() = compare(
        "GlaresCheckParams",
        JSONConstructor::glaresCheckParamsFromJSON,
        JSONConstructor::generateGlaresCheckParams
    )

    @Test
    fun imageQA() = compare(
        "ImageQA",
        JSONConstructor::imageQAFromJSON,
        JSONConstructor::generateImageQA
    )

    @Test
    fun rfidParams() = compare(
        "RFIDParams",
        JSONConstructor::rfidParamsFromJSON,
        JSONConstructor::generateRFIDParams
    )

    @Test
    fun processParam() = compare(
        "ProcessParam",
        JSONConstructor::processParamFromJSON,
        JSONConstructor::generateProcessParam
    )

    //params.rfid_scenario

    @Test
    fun reprocParams() = compare(
        "ReprocParams",
        JSONConstructor::reprocParamsFromJSON,
        JSONConstructor::generateReprocParams
    )

    @Test
    fun eDLDataGroups() = compare(
        "EDLDataGroups",
        JSONConstructor::eDLDataGroupsFromJSON,
        JSONConstructor::generateEDLDataGroups
    )

    @Test
    fun ePassportDataGroups() = compare(
        "EPassportDataGroups",
        JSONConstructor::ePassportDataGroupsFromJSON,
        JSONConstructor::generateEPassportDataGroups
    )

    @Test
    fun eIDDataGroups() = compare(
        "EIDDataGroups",
        JSONConstructor::eIDDataGroupsFromJSON,
        JSONConstructor::generateEIDDataGroups
    )

    @Test
    fun rfidScenario() = compare(
        "RFIDScenario",
        JSONConstructor::rfidScenarioFromJSON,
        JSONConstructor::generateRfidScenario
    )

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
        val actual = JSONConstructor.generateCustomization(
            JSONConstructor.customizationFromJSON(
                expected,
                ApplicationProvider.getApplicationContext()
            )
        )
        compareJSONs("Customization", expected, floatToDouble(actual))
    }

    @Test
    fun functionality() = compare(
        "Functionality",
        JSONConstructor::functionalityFromJSON,
        JSONConstructor::generateFunctionality,
        "useAuthenticator", "singleResult", "videoSessionPreset"
    )

    // info

    @Test
    fun docReaderDocumentsDatabase() = compare(
        "DocReaderDocumentsDatabase",
        JSONConstructor::docReaderDocumentsDatabaseFromJSON,
        JSONConstructor::generateDocReaderDocumentsDatabase
    )

    @Test
    fun documentReaderScenario() = compare(
        "DocumentReaderScenario",
        JSONConstructor::documentReaderScenarioFromJSON,
        JSONConstructor::generateDocumentReaderScenario,
        "barcodeExt", "frame"
    )

    @Test
    fun documentReaderException() = compare(
        "DocumentReaderException",
        JSONConstructor::regulaExceptionFromJSON,
        JSONConstructor::generateRegulaException
    )

    // results.authenticity

    @Test
    fun documentReaderAuthenticityElement() = compare(
        "DocumentReaderAuthenticityElement",
        JSONConstructor::documentReaderAuthenticityElementFromJSON,
        JSONConstructor::generateDocumentReaderAuthenticityElement
    )

    @Test
    fun documentReaderAuthenticityCheck() = compare(
        "DocumentReaderAuthenticityCheck",
        JSONConstructor::documentReaderAuthenticityCheckFromJSON,
        JSONConstructor::generateDocumentReaderAuthenticityCheck
    )

    @Test
    fun documentReaderAuthenticityResult() = compare(
        "DocumentReaderAuthenticityResult",
        JSONConstructor::documentReaderAuthenticityResultFromJSON,
        JSONConstructor::generateDocumentReaderAuthenticityResult
    )

    // results.barcode

    @Test
    fun pdf417Info() = compare(
        "PDF417Info",
        JSONConstructor::pdf417InfoFromJSON,
        JSONConstructor::generatePDF417Info
    )

    @Test
    fun documentReaderBarcodeField() = compare(
        "DocumentReaderBarcodeField",
        JSONConstructor::documentReaderBarcodeFieldFromJSON,
        JSONConstructor::generateDocumentReaderBarcodeField
    )

    @Test
    fun documentReaderBarcodeResult() = compare(
        "DocumentReaderBarcodeResult",
        JSONConstructor::documentReaderBarcodeResultFromJSON,
        JSONConstructor::generateDocumentReaderBarcodeResult
    )

    // results.image_quality

    @Test
    fun imageQuality() = compare(
        "ImageQuality",
        JSONConstructor::imageQualityFromJSON,
        JSONConstructor::generateImageQuality,
        "boundRects"
    )

    @Test
    fun imageQualityGroup() = compare(
        "ImageQualityGroup",
        JSONConstructor::imageQualityGroupFromJSON,
        JSONConstructor::generateImageQualityGroup,
        "imageQualityList.boundRects"
    )

    // results.rfid

    @Test
    fun accessControlProcedureType() = compare(
        "AccessControlProcedureType",
        JSONConstructor::accessControlProcedureTypeFromJSON,
        JSONConstructor::generateAccessControlProcedureType
    )

    @Test
    fun fileData() = compare(
        "FileData",
        JSONConstructor::fileDataFromJSON,
        JSONConstructor::generateFileData
    )

    @Test
    fun certificateData() = compare(
        "CertificateData",
        JSONConstructor::certificateDataFromJSON,
        JSONConstructor::generateCertificateData
    )

    @Test
    fun securityObjectCertificates() = compare(
        "SecurityObjectCertificates",
        JSONConstructor::securityObjectCertificatesFromJSON,
        JSONConstructor::generateSecurityObjectCertificates
    )

    @Test
    fun file() = compare(
        "File",
        JSONConstructor::fileFromJSON,
        JSONConstructor::generateFile
    )

    @Test
    fun application() = compare(
        "Application",
        JSONConstructor::applicationFromJSON,
        JSONConstructor::generateApplication
    )

    @Test
    fun value() = compare(
        "Value",
        JSONConstructor::valueFromJSON,
        JSONConstructor::generateValue
    )

    @Test
    fun attribute() = compare(
        "Attribute",
        JSONConstructor::attributeFromJSON,
        JSONConstructor::generateAttribute
    )

    @Test
    fun authority() = compare(
        "Authority",
        JSONConstructor::authorityFromJSON,
        JSONConstructor::generateAuthority
    )

    @Test
    fun cardProperties() = compare(
        "CardProperties",
        JSONConstructor::cardPropertiesFromJSON,
        JSONConstructor::generateCardProperties
    )

    @Test
    fun extension() = compare(
        "Extension",
        JSONConstructor::extensionFromJSON,
        JSONConstructor::generateExtension
    )

    @Test
    fun validity() = compare(
        "Validity",
        JSONConstructor::validityFromJSON,
        JSONConstructor::generateValidity
    )

    @Test
    fun certificateChain() = compare(
        "CertificateChain",
        JSONConstructor::certificateChainFromJSON,
        JSONConstructor::generateCertificateChain
    )

    @Test
    fun dataField() = compare(
        "DataField",
        JSONConstructor::dataFieldFromJSON,
        JSONConstructor::generateDataField
    )

    @Test
    fun signerInfo() = compare(
        "SignerInfo",
        JSONConstructor::signerInfoFromJSON,
        JSONConstructor::generateSignerInfo
    )

    @Test
    fun securityObject() = compare(
        "SecurityObject",
        JSONConstructor::securityObjectFromJSON,
        JSONConstructor::generateSecurityObject
    )

    @Test
    fun rfidSessionData() = compare(
        "RFIDSessionData",
        JSONConstructor::rfidSessionDataFromJSON,
        JSONConstructor::generateRFIDSessionData
    )

    @Test
    fun bytesData() = compare(
        "BytesData",
        JSONConstructor::bytesDataFromJSON,
        JSONConstructor::generateBytesData
    )

    @Test
    fun vdsncData() = compare(
        "VDSNCData",
        JSONConstructor::vdsncDataFromJSON,
        JSONConstructor::generateVDSNCData,
        "certificateChain"
    )

    // results.visual_results

    @Test
    fun documentReaderComparison() = compare(
        "DocumentReaderComparison",
        JSONConstructor::documentReaderComparisonFromJSON,
        JSONConstructor::generateDocumentReaderComparison
    )

    @Test
    fun rect() = compare(
        "Rect",
        JSONConstructor::rectFromJSON,
        JSONConstructor::generateRect
    )

    @Test
    fun documentReaderGraphicField() = compare(
        "DocumentReaderGraphicField",
        JSONConstructor::documentReaderGraphicFieldFromJSON,
        JSONConstructor::generateDocumentReaderGraphicField
    )

    @Test
    fun documentReaderGraphicResult() = compare(
        "DocumentReaderGraphicResult",
        JSONConstructor::documentReaderGraphicResultFromJSON,
        JSONConstructor::generateDocumentReaderGraphicResult
    )

    @Test
    fun documentReaderRFIDOrigin() = compare(
        "DocumentReaderRFIDOrigin",
        JSONConstructor::documentReaderRFIDOriginFromJSON,
        JSONConstructor::generateDocumentReaderRFIDOrigin
    )

    @Test
    fun documentReaderSymbol() = compare(
        "DocumentReaderSymbol",
        JSONConstructor::documentReaderSymbolFromJSON,
        JSONConstructor::generateDocumentReaderSymbol
    )

    @Test
    fun documentReaderValidity() = compare(
        "DocumentReaderValidity",
        JSONConstructor::documentReaderValidityFromJSON,
        JSONConstructor::generateDocumentReaderValidity
    )

    @Test
    fun documentReaderValue() = compare(
        "DocumentReaderValue",
        JSONConstructor::documentReaderValueFromJSON,
        JSONConstructor::generateDocumentReaderValue
    )

    @Test
    fun documentReaderTextField() = compare(
        "DocumentReaderTextField",
        JSONConstructor::documentReaderTextFieldFromJSON,
        JSONConstructor::generateDocumentReaderTextField,
    )

    @Test
    fun documentReaderTextSource() = compare(
        "DocumentReaderTextSource",
        JSONConstructor::documentReaderTextSourceFromJSON,
        JSONConstructor::generateDocumentReaderTextSource
    )

    @Test
    fun documentReaderTextResult() = compare(
        "DocumentReaderTextResult",
        JSONConstructor::documentReaderTextResultFromJSON,
        JSONConstructor::generateDocumentReaderTextResult
    )

    // results

    @Test
    fun documentReaderResultsStatus() = compare(
        "DocumentReaderResultsStatus",
        JSONConstructor::documentReaderResultsStatusFromJSON,
        JSONConstructor::generateDocumentReaderResultsStatus
    )

    @Test
    fun documentReaderDocumentType() = compare(
        "DocumentReaderDocumentType",
        JSONConstructor::documentReaderDocumentTypeFromJSON,
        JSONConstructor::generateDocumentReaderDocumentType
    )

    @Test
    fun coordinate() = compare(
        "Coordinate",
        JSONConstructor::coordinateFromJSON,
        JSONConstructor::generateCoordinate
    )

    @Test
    fun elementPosition() = compare(
        "ElementPosition",
        JSONConstructor::elementPositionFromJSON,
        JSONConstructor::generateElementPosition
    )

    @Test
    fun documentReaderResults() = compare(
        "DocumentReaderResults",
        JSONConstructor::documentReaderResultsFromJSON,
        JSONConstructor::generateDocumentReaderResults,
        "imageQuality.imageQualityList.boundRects", "vdsncData.certificateChain"
    )

    // rfid

    @Test
    fun paAttribute() = compare(
        "PAAttribute",
        JSONConstructor::paAttributeFromJSON,
        JSONConstructor::generatePAAttribute
    )

    @Test
    fun paResourcesIssuer() = compare(
        "PAResourcesIssuer",
        JSONConstructor::paResourcesIssuerFromJSON,
        JSONConstructor::generatePAResourcesIssuer
    )

    @Test
    fun pkdCertificate() = compare(
        "PKDCertificate",
        JSONConstructor::pkdCertificateFromJSON,
        JSONConstructor::generatePKDCertificate
    )

    @Test
    fun taChallenge() = compare(
        "TAChallenge",
        JSONConstructor::taChallengeFromJSON,
        JSONConstructor::generateTAChallenge
    )

    @Test
    fun tccParams() = compare(
        "TccParams",
        JSONConstructor::tccParamsFromJSON,
        JSONConstructor::generateTccParams
    )
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
    toJson: (T) -> JSONObject,
    vararg omit: String
) {
    var expected = readFile(name)
    for (key in omit) expected = omitDeep(expected, key.split("."), 0)
    val actual = toJson(fromJson(expected))
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
    toJson: (T, Context) -> JSONObject,
    vararg omit: String
) {
    var expected = readFile(name)
    for (key in omit) expected = omitDeep(expected, key.split("."), 0)
    val actual = toJson(fromJson(expected), ApplicationProvider.getApplicationContext())
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