//
//  FlutterDocumentReaderApiPluginTest.kt
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import androidx.test.core.app.ApplicationProvider
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

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
    fun recognizeConfig() = compare("RecognizeConfig", ::recognizeConfigFromJSON, ::generateRecognizeConfig)

    @Test
    fun recognizeConfig2() = compare("RecognizeConfig2", ::recognizeConfigFromJSON, ::generateRecognizeConfig)

    @Test
    fun scannerConfig() = compare("ScannerConfig", ::scannerConfigFromJSON, ::generateScannerConfig)

    @Test
    fun scannerConfig2() = compare("ScannerConfig2", ::scannerConfigFromJSON, ::generateScannerConfig)

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
    fun documentsDatabase() = compare("DocumentsDatabase", ::docReaderDocumentsDatabaseFromJSON, ::generateDocReaderDocumentsDatabase)

    @Test
    fun docReaderScenario() = compare(
        "DocReaderScenario", ::documentReaderScenarioFromJSON, ::generateDocumentReaderScenario,
        "barcodeExt", "frame"
    )

    @Test
    fun docReaderException() = compare("DocReaderException", ::regulaExceptionFromJSON, ::generateRegulaException)

    // results.authenticity

    @Test
    fun authenticityElement() = compare("AuthenticityElement", ::documentReaderAuthenticityElementFromJSON, ::generateDocumentReaderAuthenticityElement)

    @Test
    fun authenticityCheck() = compare("AuthenticityCheck", ::documentReaderAuthenticityCheckFromJSON, ::generateDocumentReaderAuthenticityCheck)

    @Test
    fun authenticityResult() = compare("AuthenticityResult", ::documentReaderAuthenticityResultFromJSON, ::generateDocumentReaderAuthenticityResult)

    // results.barcode

    @Test
    fun pdf417Info() = compare("PDF417Info", ::pdf417InfoFromJSON, ::generatePDF417Info)

    @Test
    fun barcodeField() = compare("BarcodeField", ::documentReaderBarcodeFieldFromJSON, ::generateDocumentReaderBarcodeField)

    @Test
    fun barcodeResult() = compare("BarcodeResult", ::documentReaderBarcodeResultFromJSON, ::generateDocumentReaderBarcodeResult)

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
    fun rfidValue() = compare("RFIDValue", ::valueFromJSON, ::generateValue)

    @Test
    fun attribute() = compare("Attribute", ::attributeFromJSON, ::generateAttribute)

    @Test
    fun authority() = compare("Authority", ::authorityFromJSON, ::generateAuthority)

    @Test
    fun cardProperties() = compare("CardProperties", ::cardPropertiesFromJSON, ::generateCardProperties)

    @Test
    fun extension() = compare("Extension", ::extensionFromJSON, ::generateExtension)

    @Test
    fun rfidValidity() = compare("RFIDValidity", ::validityFromJSON, ::generateValidity)

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
    fun comparison() = compare("Comparison", ::documentReaderComparisonFromJSON, ::generateDocumentReaderComparison)

    @Test
    fun rect() = compare("Rect", ::rectFromJSON, ::generateRect)

    @Test
    fun graphicField() = compare("GraphicField", ::documentReaderGraphicFieldFromJSON, ::generateDocumentReaderGraphicField)

    @Test
    fun graphicResult() = compare("GraphicResult", ::documentReaderGraphicResultFromJSON, ::generateDocumentReaderGraphicResult)

    @Test
    fun rfidOrigin() = compare("RFIDOrigin", ::documentReaderRFIDOriginFromJSON, ::generateDocumentReaderRFIDOrigin)

    @Test
    fun symbol() = compare("Symbol", ::documentReaderSymbolFromJSON, ::generateDocumentReaderSymbol)

    @Test
    fun validity() = compare("Validity", ::documentReaderValidityFromJSON, ::generateDocumentReaderValidity)

    @Test
    fun value() = compare("Value", ::documentReaderValueFromJSON, ::generateDocumentReaderValue)

    @Test
    fun textField() = compare("TextField", ::documentReaderTextFieldFromJSON, ::generateDocumentReaderTextField)

    @Test
    fun textSource() = compare("TextSource", ::documentReaderTextSourceFromJSON, ::generateDocumentReaderTextSource)

    @Test
    fun textResult() = compare("TextResult", ::documentReaderTextResultFromJSON, ::generateDocumentReaderTextResult)

    // results

    @Test
    fun resultsStatus() = compare("ResultsStatus", ::documentReaderResultsStatusFromJSON, ::generateDocumentReaderResultsStatus)

    @Test
    fun documentType() = compare("DocumentType", ::documentReaderDocumentTypeFromJSON, ::generateDocumentReaderDocumentType)

    @Test
    fun coordinate() = compare("Coordinate", ::coordinateFromJSON, ::generateCoordinate)

    @Test
    fun position() = compare("Position", ::elementPositionFromJSON, ::generateElementPosition)

    @Test
    fun results() = compare(
        "Results", ::documentReaderResultsFromJSON, ::generateDocumentReaderResults,
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