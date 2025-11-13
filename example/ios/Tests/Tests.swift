import XCTest
import DocumentReader
import flutter_document_reader_api

class Tests: XCTestCase {
    // config
    
    func test_imageInputData() {
        compare(name: "imageInputData", fromJson: RGLWJSONConstructor.imageInput, generate: RGLWJSONConstructor.generate)
    }
    
    func test_initConfig() {
        compare(name: "initConfig", fromJson: RGLWJSONConstructor.config, generate: RGLWJSONConstructor.generate,
                omit: ["databasePath",
                       "blackList",
                       "customDb",
                       "useBleDevice"])
    }
    
    func test_onlineProcessingConfig() {
        compare(name: "onlineProcessingConfig", fromJson: RGLWJSONConstructor.onlineProcessingConfig, generate: RGLWJSONConstructor.generate,
                omit: ["requestHeaders",
                       "processParams.sessionLogFolder",
                       "processParams.uvTorchEnabled"])
    }
    
    func test_recognizeConfig() {
        compare(name: "recognizeConfig", fromJson: RGLWJSONConstructor.recognizeConfig, generate: RGLWJSONConstructor.generate,
                omit: ["onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled"])
    }
    
    func test_recognizeConfig2() {
        compare(name: "recognizeConfig2", fromJson: RGLWJSONConstructor.recognizeConfig, generate: RGLWJSONConstructor.generate,
                omit: ["onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled",
                       "onlineProcessingConfig.requestHeaders"])
    }
    
    func test_scannerConfig() {
        compare(name: "scannerConfig", fromJson: RGLWJSONConstructor.scannerConfig, generate: RGLWJSONConstructor.generate,
                omit: ["cameraId",
                       "onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled",
                       "onlineProcessingConfig.requestHeaders"])
    }
    
    // params.process_params
    
    func test_faceApiSearchParams() {
        compare(name: "faceApiSearchParams", fromJson: RGLWJSONConstructor.faceAPISearchParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_faceApiParams() {
        compare(name: "faceApiParams", fromJson: RGLWJSONConstructor.faceAPIParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_livenessParams() {
        compare(name: "livenessParams", fromJson: RGLWJSONConstructor.livenessParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_authenticityParams() {
        compare(name: "authenticityParams", fromJson: RGLWJSONConstructor.authenticityParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_glaresCheckParams() {
        compare(name: "glaresCheckParams", fromJson: RGLWJSONConstructor.glaresCheckParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_imageQA() {
        compare(name: "imageQA", fromJson: RGLWJSONConstructor.imageQA, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidParams() {
        compare(name: "rfidParams", fromJson: RGLWJSONConstructor.rfidParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_backendProcessingConfig() {
        compare(name: "backendProcessingConfig", fromJson: RGLWJSONConstructor.backendProcessingConfig, generate: RGLWJSONConstructor.generate)
    }
    
    func test_processParams() {
        compare(name: "processParams", fromJson: RGLWJSONConstructor.processParams, generate: RGLWJSONConstructor.generate,
                omit: ["sessionLogFolder",
                       "uvTorchEnabled"])
    }
    
    // params.rfid_scenario
    
    func test_eDLDataGroups() {
        compare(name: "eDLDataGroups", fromJson: RGLWJSONConstructor.eDLDataGroups, generate: RGLWJSONConstructor.generateEDLDataGroups)
    }
    
    func test_ePassportDataGroups() {
        compare(name: "ePassportDataGroups", fromJson: RGLWJSONConstructor.ePassportDataGroups, generate: RGLWJSONConstructor.generateEPassportDataGroups)
    }
    
    func test_eIDDataGroups() {
        compare(name: "eIDDataGroups", fromJson: RGLWJSONConstructor.eIDDataGroups, generate: RGLWJSONConstructor.generateEIDDataGroups)
    }
    
    func test_dtcDataGroup() {
        compare(name: "dtcDataGroup", fromJson: RGLWJSONConstructor.dtcDataGroup, generate: RGLWJSONConstructor.generateRGLDTCDataGroup)
    }
    
    func test_rfidScenario() {
        compare(name: "rfidScenario", fromJson: RGLWJSONConstructor.rfidScenario, generate: RGLWJSONConstructor.generate)
    }
    
    // params
    
    func test_customization() {
        compare(name: "customization", fromJson: RGLWJSONConstructor.customization, generate: RGLWJSONConstructor.generate,
                omit: ["helpAnimationImageMatrix",
                       "multipageAnimationFrontImageMatrix",
                       "multipageAnimationBackImageMatrix",
                       "livenessAnimationImageMatrix",
                       "borderBackgroundImageMatrix",
                       "statusTextFont.style",
                       "resultStatusTextFont.style",
                       "multipageButtonTextFont.style",
                       "colors.rfidEnableNfcButtonBackground",
                       "colors.rfidEnableNfcButtonText",
                       "colors.rfidEnableNfcDescriptionText",
                       "colors.rfidEnableNfcTitleText",
                       "fonts.rfidProcessingScreenHintLabel.style",
                       "fonts.rfidProcessingScreenProgressLabel.style",
                       "fonts.rfidProcessingScreenResultLabel.style",
                       "fonts.rfidEnableNfcTitleText",
                       "fonts.rfidEnableNfcDescriptionText",
                       "fonts.rfidEnableNfcButtonText",
                       "images.rfidEnableNfcImage",])
    }
    
    func test_functionality() {
        compare(name: "functionality", fromJson: RGLWJSONConstructor.functionality, generate: RGLWJSONConstructor.generate,
                omit: ["useAuthenticator",
                       "pictureOnBoundsReady",
                       "isCameraTorchCheckDisabled",
                       "rfidTimeout",
                       "exposure",
                       "videoRecordingSizeDownscaleFactor",
                       "excludedCamera2Models",
                       "cameraSize",
                       "cameraMode"])
    }
    
    // info
    
    func test_documentsDatabase() {
        compare(name: "documentsDatabase", fromJson: RGLWJSONConstructor.docReaderDocumentsDatabase, generate: RGLWJSONConstructor.generate)
    }
    
    func test_docReaderScenario() {
        compare(name: "docReaderScenario", fromJson: RGLWJSONConstructor.scenario, generate: RGLWJSONConstructor.generate)
    }
    
    func test_docReaderException() {
        compare(name: "docReaderException", fromJson: RGLWJSONConstructor.error, generate: RGLWJSONConstructor.generateError)
    }
    
    // results.authenticity
    
    func test_authenticityElement() {
        compare(name: "authenticityElement", fromJson: RGLWJSONConstructor.authenticityElement, generate: RGLWJSONConstructor.generate)
    }
    
    func test_authenticityCheck() {
        compare(name: "authenticityCheck", fromJson: RGLWJSONConstructor.authenticityCheck, generate: RGLWJSONConstructor.generate)
    }
    
    func test_authenticityResult() {
        compare(name: "authenticityResult", fromJson: RGLWJSONConstructor.documentReaderAuthenticityResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results.barcode
    
    func test_pdf417Info() {
        compare(name: "pdf417Info", fromJson: RGLWJSONConstructor.pdf417Info, generate: RGLWJSONConstructor.generate)
    }
    
    func test_barcodeField() {
        compare(name: "barcodeField", fromJson: RGLWJSONConstructor.documentReaderBarcodeField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_barcodeResult() {
        compare(name: "barcodeResult", fromJson: RGLWJSONConstructor.documentReaderBarcodeResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results.image_quality
    
    func test_imageQuality() {
        compare(name: "imageQuality", fromJson: RGLWJSONConstructor.imageQuality, generate: RGLWJSONConstructor.generate)
    }
    
    func test_imageQualityGroup() {
        compare(name: "imageQualityGroup", fromJson: RGLWJSONConstructor.imageQualityGroup, generate: RGLWJSONConstructor.generate)
    }
    
    // results.rfid
    
    func test_accessControlProcedureType() {
        compare(name: "accessControlProcedureType", fromJson: RGLWJSONConstructor.accessControlProcedureType, generate: RGLWJSONConstructor.generate)
    }
    
    func test_fileData() {
        compare(name: "fileData", fromJson: RGLWJSONConstructor.fileData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_certificateData() {
        compare(name: "certificateData", fromJson: RGLWJSONConstructor.certificateData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_securityObjectCertificates() {
        compare(name: "securityObjectCertificates", fromJson: RGLWJSONConstructor.securityObjectCertificates, generate: RGLWJSONConstructor.generate)
    }
    
    func test_file() {
        compare(name: "file", fromJson: RGLWJSONConstructor.file, generate: RGLWJSONConstructor.generate)
    }
    
    func test_application() {
        compare(name: "application", fromJson: RGLWJSONConstructor.application, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidValue() {
        compare(name: "rfidValue", fromJson: RGLWJSONConstructor.rfidValue, generate: RGLWJSONConstructor.generate)
    }
    
    func test_attribute() {
        compare(name: "attribute", fromJson: RGLWJSONConstructor.attribute, generate: RGLWJSONConstructor.generate)
    }
    
    func test_authority() {
        compare(name: "authority", fromJson: RGLWJSONConstructor.authority, generate: RGLWJSONConstructor.generate)
    }
    
    func test_cardProperties() {
        compare(name: "cardProperties", fromJson: RGLWJSONConstructor.cardProperties, generate: RGLWJSONConstructor.generate)
    }
    
    func test_extension() {
        compare(name: "extension", fromJson: RGLWJSONConstructor.extension, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidValidity() {
        compare(name: "rfidValidity", fromJson: RGLWJSONConstructor.validity, generate: RGLWJSONConstructor.generate)
    }
    
    func test_certificateChain() {
        compare(name: "certificateChain", fromJson: RGLWJSONConstructor.certificateChain, generate: RGLWJSONConstructor.generate)
    }
    
    func test_dataField() {
        compare(name: "dataField", fromJson: RGLWJSONConstructor.dataField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_signerInfo() {
        compare(name: "signerInfo", fromJson: RGLWJSONConstructor.signerInfo, generate: RGLWJSONConstructor.generate)
    }
    
    func test_securityObject() {
        compare(name: "securityObject", fromJson: RGLWJSONConstructor.securityObject, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidSessionData() {
        compare(name: "rfidSessionData", fromJson: RGLWJSONConstructor.rfidSessionData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_bytesData() {
        compare(name: "sytesData", fromJson: RGLWJSONConstructor.bytesData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_vdsncData() {
        compare(name: "vdsncData", fromJson: RGLWJSONConstructor.vdsncData, generate: RGLWJSONConstructor.generate)
    }
    
    // results.status
    
    func test_opticalStatus() {
        compare(name: "opticalStatus", fromJson: RGLWJSONConstructor.opticalStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidStatus() {
        compare(name: "rfidStatus", fromJson: RGLWJSONConstructor.rfidSessionDataStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_resultsStatus() {
        compare(name: "resultsStatus", fromJson: RGLWJSONConstructor.documentReaderResultsStatus, generate: RGLWJSONConstructor.generate)
    }
    
    // results.visual_results
    
    func test_rect() {
        do{
            var rect = try readJSONFile(forName: "rect")
            XCTAssertEqual(rect as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.rect(fromJson: rect))! as NSDictionary?)
            rect = try readJSONFile(forName: "rectNullable")
            XCTAssertEqual(rect as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.rect(fromJson: rect))! as NSDictionary?)
        }catch{}
    }
    
    func test_Comparison() {
        compare(name: "comparison", fromJson: RGLWJSONConstructor.documentReaderComparison, generate: RGLWJSONConstructor.generate)
    }
    
    func test_GraphicField() {
        compare(name: "graphicField", fromJson: RGLWJSONConstructor.documentReaderGraphicField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_GraphicResult() {
        compare(name: "graphicResult", fromJson: RGLWJSONConstructor.documentReaderGraphicResult, generate: RGLWJSONConstructor.generate)
    }
    
    func test_rfidOrigin() {
        compare(name: "rfidOrigin", fromJson: RGLWJSONConstructor.documentReaderRfidOrigin, generate: RGLWJSONConstructor.generate)
    }
    
    func test_symbol() {
        compare(name: "symbol", fromJson: RGLWJSONConstructor.documentReaderSymbol, generate: RGLWJSONConstructor.generate)
    }
    
    func test_validity() {
        compare(name: "validity", fromJson: RGLWJSONConstructor.documentReaderValidity, generate: RGLWJSONConstructor.generate)
    }
    
    func test_value() {
        compare(name: "value", fromJson: RGLWJSONConstructor.documentReaderValue, generate: RGLWJSONConstructor.generate)
    }
    
    func test_textField() {
        compare(name: "textField", fromJson: RGLWJSONConstructor.documentReaderTextField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_textSource() {
        compare(name: "textSource", fromJson: RGLWJSONConstructor.documentReaderTextSource, generate: RGLWJSONConstructor.generate)
    }
    
    func test_textResult() {
        compare(name: "textResult", fromJson: RGLWJSONConstructor.documentReaderTextResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results
    
    func test_documentType() {
        compare(name: "documentType", fromJson: RGLWJSONConstructor.documentReaderDocumentType, generate: RGLWJSONConstructor.generate)
    }
    
    func test_coordinate() {
        do{
            var coordinate = try readJSONFile(forName: "coordinate")
            XCTAssertEqual(coordinate as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.point(fromJson: coordinate))! as NSDictionary?)
            coordinate = try readJSONFile(forName: "coordinateNullable")
            XCTAssertEqual(coordinate as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.point(fromJson: coordinate))! as NSDictionary?)
        } catch {}
    }
    
    func test_position() {
        compare(name: "position", fromJson: RGLWJSONConstructor.position, generate: RGLWJSONConstructor.generate)
    }
    
    func test_transactionInfo() {
        compare(name: "transactionInfo", fromJson: RGLWJSONConstructor.transactionInfo, generate: RGLWJSONConstructor.generate)
    }
    
    func test_results() {
        compare(name: "results", fromJson: RGLWJSONConstructor.documentReaderResults, generate: RGLWJSONConstructor.generate);
    }
    
    // rfid
    
    func test_paAttribute() {
        compare(name: "paAttribute", fromJson: RGLWJSONConstructor.paAttribute, generate: RGLWJSONConstructor.generate)
    }
    
    func test_paResourcesIssuer() {
//        compare(name: "paResourcesIssuer", fromJson: RGLWJSONConstructor.paResourcesIssuer, generate: RGLWJSONConstructor.generate)
    }
    
    func test_pkdCertificate() {
        compare(name: "pkdCertificate", fromJson: RGLWJSONConstructor.pkdCertificate, generate: RGLWJSONConstructor.generate)
    }
    
    func test_taChallenge() {
        compare(name: "taChallenge", fromJson: RGLWJSONConstructor.taChallenge, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TccParams() {
        compare(name: "tccParams", fromJson: RGLWJSONConstructor.tccParams, generate: RGLWJSONConstructor.generate)
    }
}
