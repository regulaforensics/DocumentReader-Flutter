package com.regula.plugin.documentreader

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@Suppress("unused")
val context: Context
    get() = ApplicationProvider.getApplicationContext()

@RunWith(RobolectricTestRunner::class)
@Config(shadows = [MyShadowBitmap::class, MyShadowDrawable::class, MyShadowBitmapDrawable::class])
class FlutterDocumentReaderApiPluginTest {
    // config

    @Test
    fun initConfig() = compare(
        "initConfig", ::initConfigFromJSON, ::generateInitConfig,
        "databasePath",
        "useBleDevice"
    )

    @Test
    fun onlineProcessingConfig() = compare(
        "onlineProcessingConfig", ::onlineProcessingConfigFromJSON, ::generateOnlineProcessingConfig,
        "requestHeaders"
    )

    @Test
    fun imageInputData() = compare("imageInputData", ::imageInputDataFromJSON, ::generateImageInputData)

    @Test
    fun recognizeConfig() = compare("recognizeConfig", ::recognizeConfigFromJSON, ::generateRecognizeConfig)

    @Test
    fun recognizeConfig2() = compare(
        "recognizeConfig2", ::recognizeConfigFromJSON, ::generateRecognizeConfig,
        "onlineProcessingConfig.requestHeaders"
    )

    @Test
    fun scannerConfig() = compare(
        "scannerConfig", ::scannerConfigFromJSON, ::generateScannerConfig,
        "onlineProcessingConfig.requestHeaders"
    )

    // params.process_params

    @Test
    fun faceApiSearchParams() = compare("faceApiSearchParams", ::faceApiSearchParamsFromJSON, ::generateFaceApiSearchParams)

    @Test
    fun faceApiParams() = compare("faceApiParams", ::faceApiParamsFromJSON, ::generateFaceApiParams)

    @Test
    fun livenessParams() = compare("livenessParams", ::livenessParamsFromJSON, ::generateLivenessParams)

    @Test
    fun authenticityParams() = compare("authenticityParams", ::authenticityParamsFromJSON, ::generateAuthenticityParams)

    @Test
    fun glaresCheckParams() = compare("glaresCheckParams", ::glaresCheckParamsFromJSON, ::generateGlaresCheckParams)

    @Test
    fun imageQA() = compare("imageQA", ::imageQAFromJSON, ::generateImageQA)

    @Test
    fun rfidParams() = compare("rfidParams", ::rfidParamsFromJSON, ::generateRFIDParams)

    @Test
    fun backendProcessingConfig() = compare("backendProcessingConfig", ::backendProcessingConfigFromJSON, ::generateBackendProcessingConfig)

    @Test
    fun processParams() = compare("processParams", ::processParamFromJSON, ::generateProcessParam)

    //params.rfid_scenario

    @Test
    fun eDLDataGroups() = compare("eDLDataGroups", ::eDLDataGroupsFromJSON, ::generateEDLDataGroups)

    @Test
    fun ePassportDataGroups() = compare("ePassportDataGroups", ::ePassportDataGroupsFromJSON, ::generateEPassportDataGroups)

    @Test
    fun eIDDataGroups() = compare("eIDDataGroups", ::eIDDataGroupsFromJSON, ::generateEIDDataGroups)

    @Test
    fun dtcDataGroup() = compare("dtcDataGroup", ::dtcDataGroupFromJSON, ::generateDTCDataGroup)

    @Test
    fun rfidScenario() = compare("rfidScenario", ::rfidScenarioFromJSON, ::generateRfidScenario)

    // params

    @Test
    fun customization() {
        val expected = readFile("customization")
        val omit = listOf(
            "helpAnimationImageContentMode",
            "multipageAnimationFrontImageContentMode",
            "multipageAnimationBackImageContentMode",
            "livenessAnimationImageContentMode",
            "borderBackgroundImageContentMode",
            "statusTextFont",
            "resultStatusTextFont",
            "multipageButtonTextFont",
            "fonts"
        )
        for (key in omit) expected.remove(key)
        val actual = generateCustomization(customizationFromJSON(expected))
        compareJSONs("customization", expected, floatToDouble(actual))
    }

    @Test
    fun functionality() = compare(
        "functionality", ::functionalityFromJSON, ::generateFunctionality,
        "useAuthenticator",
        "singleResult",
        "videoSessionPreset",
        "cameraPositionIOS",
        "homeIndicatorAutoHide"
    )

    // info

    @Test
    fun prepareProgress() = compare("prepareProgress", ::prepareProgressFromJSON, ::generatePrepareProgress)

    @Test
    fun documentsDatabase() = compare("documentsDatabase", ::docReaderDocumentsDatabaseFromJSON, ::generateDocReaderDocumentsDatabase)

    @Test
    fun docReaderScenario() = compare(
        "docReaderScenario", ::documentReaderScenarioFromJSON, ::generateDocumentReaderScenario,
        "barcodeExt",
        "frame"
    )

    @Test
    fun docReaderException() = compare("docReaderException", ::regulaExceptionFromJSON, ::generateRegulaException)

    // results.authenticity

    @Test
    fun authenticityElement() = compare("authenticityElement", ::documentReaderAuthenticityElementFromJSON, ::generateDocumentReaderAuthenticityElement)

    @Test
    fun authenticityCheck() = compare("authenticityCheck", ::documentReaderAuthenticityCheckFromJSON, ::generateDocumentReaderAuthenticityCheck)

    @Test
    fun authenticityResult() = compare("authenticityResult", ::documentReaderAuthenticityResultFromJSON, ::generateDocumentReaderAuthenticityResult)

    // results.barcode

    @Test
    fun pdf417Info() = compare("pdf417Info", ::pdf417InfoFromJSON, ::generatePDF417Info)

    @Test
    fun barcodeField() = compare("barcodeField", ::documentReaderBarcodeFieldFromJSON, ::generateDocumentReaderBarcodeField)

    @Test
    fun barcodeResult() = compare("barcodeResult", ::documentReaderBarcodeResultFromJSON, ::generateDocumentReaderBarcodeResult)

    // results.image_quality

    @Test
    fun imageQuality() = compare("imageQuality", ::imageQualityFromJSON, ::generateImageQuality)

    @Test
    fun imageQualityGroup() = compare("imageQualityGroup", ::imageQualityGroupFromJSON, ::generateImageQualityGroup)

    // results.rfid

    @Test
    fun accessControlProcedureType() = compare("accessControlProcedureType", ::accessControlProcedureTypeFromJSON, ::generateAccessControlProcedureType)

    @Test
    fun fileData() = compare("fileData", ::fileDataFromJSON, ::generateFileData)

    @Test
    fun certificateData() = compare("certificateData", ::certificateDataFromJSON, ::generateCertificateData)

    @Test
    fun securityObjectCertificates() = compare("securityObjectCertificates", ::securityObjectCertificatesFromJSON, ::generateSecurityObjectCertificates)

    @Test
    fun file() = compare("file", ::fileFromJSON, ::generateFile)

    @Test
    fun application() = compare("application", ::applicationFromJSON, ::generateApplication)

    @Test
    fun rfidValue() = compare("rfidValue", ::valueFromJSON, ::generateValue)

    @Test
    fun attribute() = compare("attribute", ::attributeFromJSON, ::generateAttribute)

    @Test
    fun authority() = compare("authority", ::authorityFromJSON, ::generateAuthority)

    @Test
    fun cardProperties() = compare("cardProperties", ::cardPropertiesFromJSON, ::generateCardProperties)

    @Test
    fun extension() = compare("extension", ::extensionFromJSON, ::generateExtension)

    @Test
    fun rfidValidity() = compare("rfidValidity", ::validityFromJSON, ::generateValidity)

    @Test
    fun certificateChain() = compare("certificateChain", ::certificateChainFromJSON, ::generateCertificateChain)

    @Test
    fun dataField() = compare("dataField", ::dataFieldFromJSON, ::generateDataField)

    @Test
    fun signerInfo() = compare("signerInfo", ::signerInfoFromJSON, ::generateSignerInfo)

    @Test
    fun securityObject() = compare("securityObject", ::securityObjectFromJSON, ::generateSecurityObject)

    @Test
    fun rfidSessionData() = compare("rfidSessionData", ::rfidSessionDataFromJSON, ::generateRFIDSessionData)

    @Test
    fun bytesData() = compare("bytesData", ::bytesDataFromJSON, ::generateBytesData)

    @Test
    fun vdsncData() = compare("vdsncData", ::vdsncDataFromJSON, ::generateVDSNCData)

    @Test
    fun docFeature() = compare("docFeature", ::docFeatureFromJSON, ::generateDocFeature)

    @Test
    fun vdsData() = compare("vdsData", ::vdsDataFromJSON, ::generateVDSData)

    // results.visual_results

    @Test
    fun comparison() = compare("comparison", ::documentReaderComparisonFromJSON, ::generateDocumentReaderComparison)

    @Test
    fun rect() = compare("rect", ::rectFromJSON, ::generateRect)

    @Test
    fun graphicField() = compare("graphicField", ::documentReaderGraphicFieldFromJSON, ::generateDocumentReaderGraphicField)

    @Test
    fun graphicResult() = compare("graphicResult", ::documentReaderGraphicResultFromJSON, ::generateDocumentReaderGraphicResult)

    @Test
    fun rfidOrigin() = compare("rfidOrigin", ::documentReaderRFIDOriginFromJSON, ::generateDocumentReaderRFIDOrigin)

    @Test
    fun symbol() = compare("symbol", ::documentReaderSymbolFromJSON, ::generateDocumentReaderSymbol)

    @Test
    fun validity() = compare("validity", ::documentReaderValidityFromJSON, ::generateDocumentReaderValidity)

    @Test
    fun value() = compare("value", ::documentReaderValueFromJSON, ::generateDocumentReaderValue)

    @Test
    fun textField() = compare("textField", ::documentReaderTextFieldFromJSON, ::generateDocumentReaderTextField)

    @Test
    fun textSource() = compare("textSource", ::documentReaderTextSourceFromJSON, ::generateDocumentReaderTextSource)

    @Test
    fun textResult() = compare("textResult", ::documentReaderTextResultFromJSON, ::generateDocumentReaderTextResult)

    // results

    @Test
    fun resultsStatus() = compare("resultsStatus", ::documentReaderResultsStatusFromJSON, ::generateDocumentReaderResultsStatus)

    @Test
    fun detailsOptical() = compare("opticalStatus", ::detailsOpticalFromJSON, ::generateDetailsOptical)

    @Test
    fun rfidStatus() = compare("rfidStatus", ::detailsRFIDFromJSON, ::generateDetailsRFID)

    @Test
    fun ageStatus() = compare("ageStatus", ::detailsAgeFromJSON, ::generateDetailsAge)

    @Test
    fun documentType() = compare("documentType", ::documentReaderDocumentTypeFromJSON, ::generateDocumentReaderDocumentType)

    @Test
    fun coordinate() = compare("coordinate", ::coordinateFromJSON, ::generateCoordinate)

    @Test
    fun position() = compare("position", ::elementPositionFromJSON, ::generateElementPosition)

    @Test
    fun transactionInfo() = compare("transactionInfo", ::transactionInfoFromJSON, ::generateTransactionInfo)

    @Test
    fun results() = compare("results", ::documentReaderResultsFromJSON, ::generateDocumentReaderResults)

    // rfid

    @Test
    fun paAttribute() = compare("paAttribute", ::paAttributeFromJSON, ::generatePAAttribute)

    @Test
    fun paResourcesIssuer() = compare("paResourcesIssuer", ::paResourcesIssuerFromJSON, ::generatePAResourcesIssuer)

    @Test
    fun pkdCertificate() = compare("pkdCertificate", ::pkdCertificateFromJSON, ::generatePKDCertificate)

    @Test
    fun taChallenge() = compare("taChallenge", ::taChallengeFromJSON, ::generateTAChallenge)

    @Test
    fun tccParams() = compare("tccParams", ::tccParamsFromJSON, ::generateTccParams)

    // mdl

    @Test
    fun deviceRetrievalMethod() = compare(
        "deviceRetrievalMethod", ::deviceRetrievalMethodFromJSON, ::generateDeviceRetrievalMethod,
        "serverModeUUID"
    )

    @Test
    fun deviceEngagement() = compare(
        "deviceEngagement", ::deviceEngagementFromJSON, ::generateDeviceEngagement,
        "deviceRetrievalMethods.serverModeUUID"
    )

    @Test
    fun nameSpaceMDL() = compare("nameSpaceMDL", ::nameSpaceMDLFromJSON, ::generateNameSpaceMDL)

    @Test
    fun documentRequestMDL() = compare("documentRequestMDL", ::documentRequestMDLFromJSON, ::generateDocumentRequestMDL)

    @Test
    fun documentRequest18013MDL() = compare("documentRequest18013MDL", ::documentRequest18013MDLFromJSON, ::generateDocumentRequest18013MDL)

    @Test
    fun dataRetrieval() = compare("dataRetrieval", ::dataRetrievalFromJSON, ::generateDataRetrieval)
}