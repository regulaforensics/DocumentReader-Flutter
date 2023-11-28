//
//  RunnerTests.swift
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import XCTest
import DocumentReader
import flutter_document_reader_api_beta

class RunnerTests: XCTestCase {
    // config
    
    func test_ImageInputData() {
        compare(name: "ImageInputData", fromJson: RGLWJSONConstructor.imageInput, generate: RGLWJSONConstructor.generate)
    }
    
    func test_InitConfig() {
        compare(name: "InitConfig", fromJson: RGLWJSONConstructor.config, generate: RGLWJSONConstructor.generate,
                omit: ["blackList",
                       "customDb"])
    }
    
    func test_OnlineProcessingConfig() {
        compare(name: "OnlineProcessingConfig", fromJson: RGLWJSONConstructor.onlineProcessingConfig, generate: RGLWJSONConstructor.generate,
                omit: ["processParams.sessionLogFolder",
                       "processParams.uvTorchEnabled"])
    }
    
    func test_RecognizeConfig() {
        compare(name: "RecognizeConfig", fromJson: RGLWJSONConstructor.recognizeConfig, generate: RGLWJSONConstructor.generate,
                omit: ["onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled"])
    }
    
    func test_ScannerConfig() {
        compare(name: "ScannerConfig", fromJson: RGLWJSONConstructor.scannerConfig, generate: RGLWJSONConstructor.generate,
                omit: ["cameraId",
                       "onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled"])
    }
    
    // params.process_params
    
    func test_FaceApiSearchParams() {
        compare(name: "FaceApiSearchParams", fromJson: RGLWJSONConstructor.faceAPISearchParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_FaceApiParams() {
        compare(name: "FaceApiParams", fromJson: RGLWJSONConstructor.faceAPIParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_GlaresCheckParams() {
        compare(name: "GlaresCheckParams", fromJson: RGLWJSONConstructor.glaresCheckParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_ImageQA() {
        compare(name: "ImageQA", fromJson: RGLWJSONConstructor.imageQA, generate: RGLWJSONConstructor.generate)
    }
    
    func test_RFIDParams() {
        compare(name: "RFIDParams", fromJson: RGLWJSONConstructor.rfidParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_ProcessParam() {
        compare(name: "ProcessParam", fromJson: RGLWJSONConstructor.processParams, generate: RGLWJSONConstructor.generate,
                omit: ["sessionLogFolder",
                       "uvTorchEnabled"])
    }
    
    // params.rfid_scenario
    
    func test_ReprocParams() {
        compare(name: "ReprocParams", fromJson: RGLWJSONConstructor.reprocParams, generate: RGLWJSONConstructor.generate)
    }
    
    func test_EDLDataGroups() {
        compare(name: "EDLDataGroups", fromJson: RGLWJSONConstructor.eDLDataGroups, generate: RGLWJSONConstructor.generateEDLDataGroups)
    }
    
    func test_EPassportDataGroups() {
        compare(name: "EPassportDataGroups", fromJson: RGLWJSONConstructor.ePassportDataGroups, generate: RGLWJSONConstructor.generateEPassportDataGroups)
    }
    
    func test_EIDDataGroups() {
        compare(name: "EIDDataGroups", fromJson: RGLWJSONConstructor.eIDDataGroups, generate: RGLWJSONConstructor.generateEIDDataGroups)
    }
    
    func test_RFIDScenario() {
        compare(name: "RFIDScenario", fromJson: RGLWJSONConstructor.rfidScenario, generate: RGLWJSONConstructor.generate)
    }
    
    // params
    
    func test_Customization() {
        compare(name: "Customization", fromJson: RGLWJSONConstructor.customization, generate: RGLWJSONConstructor.generate,
                omit: ["helpAnimationImageMatrix",
                       "multipageAnimationFrontImageMatrix",
                       "multipageAnimationBackImageMatrix",
                       "hologramAnimationImageMatrix",
                       "borderBackgroundImageMatrix",
                       "statusTextFont",
                       "resultStatusTextFont"])
    }
    
    func test_Functionality() {
        compare(name: "Functionality", fromJson: RGLWJSONConstructor.functionality, generate: RGLWJSONConstructor.generate,
                omit: ["useAuthenticator",
                       "pictureOnBoundsReady",
                       "isCameraTorchCheckDisabled",
                       "rfidTimeout",
                       "exposure",
                       "excludedCamera2Models",
                       "cameraSize"])
    }
    
    // info
    
    func test_DocReaderDocumentsDatabase() {
        compare(name: "DocReaderDocumentsDatabase", fromJson: RGLWJSONConstructor.docReaderDocumentsDatabase, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderScenario() {
        compare(name: "DocumentReaderScenario", fromJson: RGLWJSONConstructor.scenario, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderException() {
        compare(name: "DocumentReaderException", fromJson: RGLWJSONConstructor.error, generate: RGLWJSONConstructor.generateError)
    }
    
    // results.authenticity
    
    func test_DocumentReaderAuthenticityElement() {
        compare(name: "DocumentReaderAuthenticityElement", fromJson: RGLWJSONConstructor.authenticityElement, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderAuthenticityCheck() {
        compare(name: "DocumentReaderAuthenticityCheck", fromJson: RGLWJSONConstructor.authenticityCheck, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderAuthenticityResult() {
        compare(name: "DocumentReaderAuthenticityResult", fromJson: RGLWJSONConstructor.documentReaderAuthenticityResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results.barcode
    
    func test_PDF417Info() {
        compare(name: "PDF417Info", fromJson: RGLWJSONConstructor.pdf417Info, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderBarcodeField() {
        compare(name: "DocumentReaderBarcodeField", fromJson: RGLWJSONConstructor.documentReaderBarcodeField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderBarcodeResult() {
        compare(name: "DocumentReaderBarcodeResult", fromJson: RGLWJSONConstructor.documentReaderBarcodeResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results.image_quality
    
    func test_ImageQuality() {
        compare(name: "ImageQuality", fromJson: RGLWJSONConstructor.imageQuality, generate: RGLWJSONConstructor.generate)
    }
    
    func test_ImageQualityGroup() {
        compare(name: "ImageQualityGroup", fromJson: RGLWJSONConstructor.imageQualityGroup, generate: RGLWJSONConstructor.generate)
    }
    
    // results.rfid
    
    func test_AccessControlProcedureType() {
        compare(name: "AccessControlProcedureType", fromJson: RGLWJSONConstructor.accessControlProcedureType, generate: RGLWJSONConstructor.generate)
    }
    
    func test_FileData() {
        compare(name: "FileData", fromJson: RGLWJSONConstructor.fileData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_CertificateData() {
        compare(name: "CertificateData", fromJson: RGLWJSONConstructor.certificateData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_SecurityObjectCertificates() {
        compare(name: "SecurityObjectCertificates", fromJson: RGLWJSONConstructor.securityObjectCertificates, generate: RGLWJSONConstructor.generate)
    }
    
    func test_File() {
        compare(name: "File", fromJson: RGLWJSONConstructor.file, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Application() {
        compare(name: "Application", fromJson: RGLWJSONConstructor.application, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Value() {
        compare(name: "Value", fromJson: RGLWJSONConstructor.rfidValue, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Attribute() {
        compare(name: "Attribute", fromJson: RGLWJSONConstructor.attribute, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Authority() {
        compare(name: "Authority", fromJson: RGLWJSONConstructor.authority, generate: RGLWJSONConstructor.generate)
    }
    
    func test_CardProperties() {
        compare(name: "CardProperties", fromJson: RGLWJSONConstructor.cardProperties, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Extension() {
        compare(name: "Extension", fromJson: RGLWJSONConstructor.extension, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Validity() {
        compare(name: "Validity", fromJson: RGLWJSONConstructor.validity, generate: RGLWJSONConstructor.generate)
    }
    
    func test_CertificateChain() {
        compare(name: "CertificateChain", fromJson: RGLWJSONConstructor.certificateChain, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DataField() {
        compare(name: "DataField", fromJson: RGLWJSONConstructor.dataField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_SignerInfo() {
        compare(name: "SignerInfo", fromJson: RGLWJSONConstructor.signerInfo, generate: RGLWJSONConstructor.generate)
    }
    
    func test_SecurityObject() {
        compare(name: "SecurityObject", fromJson: RGLWJSONConstructor.securityObject, generate: RGLWJSONConstructor.generate)
    }
    
    func test_RFIDSessionData() {
        compare(name: "RFIDSessionData", fromJson: RGLWJSONConstructor.rfidSessionData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_BytesData() {
        compare(name: "BytesData", fromJson: RGLWJSONConstructor.bytesData, generate: RGLWJSONConstructor.generate)
    }
    
    func test_VDSNCData() {
        compare(name: "VDSNCData", fromJson: RGLWJSONConstructor.vdsncData, generate: RGLWJSONConstructor.generate)
    }
    
    // results.status
    
    func test_DetailsOptical() {
        compare(name: "DetailsOptical", fromJson: RGLWJSONConstructor.opticalStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DetailsRFID() {
        compare(name: "DetailsRFID", fromJson: RGLWJSONConstructor.rfidSessionDataStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderResultsStatus() {
        compare(name: "DocumentReaderResultsStatus", fromJson: RGLWJSONConstructor.documentReaderResultsStatus, generate: RGLWJSONConstructor.generate)
    }
    
    // results.visual_results
    
    func test_Rect() {
        let rect = readJSONFile(forName: "Rect")!
        XCTAssertEqual(rect as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.rect(fromJson: rect))! as NSDictionary?)
    }
    
    func test_DocumentReaderComparison() {
        compare(name: "DocumentReaderComparison", fromJson: RGLWJSONConstructor.documentReaderComparison, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderGraphicField() {
        compare(name: "DocumentReaderGraphicField", fromJson: RGLWJSONConstructor.documentReaderGraphicField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderGraphicResult() {
        compare(name: "DocumentReaderGraphicResult", fromJson: RGLWJSONConstructor.documentReaderGraphicResult, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderRFIDOrigin() {
        compare(name: "DocumentReaderRFIDOrigin", fromJson: RGLWJSONConstructor.documentReaderRfidOrigin, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderSymbol() {
        compare(name: "DocumentReaderSymbol", fromJson: RGLWJSONConstructor.documentReaderSymbol, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderValidity() {
        compare(name: "DocumentReaderValidity", fromJson: RGLWJSONConstructor.documentReaderValidity, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderValue() {
        compare(name: "DocumentReaderValue", fromJson: RGLWJSONConstructor.documentReaderValue, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderTextField() {
        compare(name: "DocumentReaderTextField", fromJson: RGLWJSONConstructor.documentReaderTextField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderTextSource() {
        compare(name: "DocumentReaderTextSource", fromJson: RGLWJSONConstructor.documentReaderTextSource, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderTextResult() {
        compare(name: "DocumentReaderTextResult", fromJson: RGLWJSONConstructor.documentReaderTextResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results
    
    func test_DocumentReaderDocumentType() {
        compare(name: "DocumentReaderDocumentType", fromJson: RGLWJSONConstructor.documentReaderDocumentType, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Coordinate() {
        let coordinate = readJSONFile(forName: "Coordinate")!
        XCTAssertEqual(coordinate as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.point(fromJson: coordinate))! as NSDictionary?)
    }
    
    func test_ElementPosition() {
        compare(name: "ElementPosition", fromJson: RGLWJSONConstructor.position, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocumentReaderResults() {
        compare(name: "DocumentReaderResults", fromJson: RGLWJSONConstructor.documentReaderResults, generate: RGLWJSONConstructor.generate);
    }
    
    // rfid
    
    func test_PAAttribute() {
        compare(name: "PAAttribute", fromJson: RGLWJSONConstructor.paAttribute, generate: RGLWJSONConstructor.generate)
    }
    
    func test_PAResourcesIssuer() {
//        compare(name: "PAResourcesIssuer", fromJson: RGLWJSONConstructor.paResourcesIssuer, generate: RGLWJSONConstructor.generate)
    }
    
    func test_PKDCertificate() {
        compare(name: "PKDCertificate", fromJson: RGLWJSONConstructor.pkdCertificate, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TAChallenge() {
        compare(name: "TAChallenge", fromJson: RGLWJSONConstructor.taChallenge, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TccParams() {
        compare(name: "TccParams", fromJson: RGLWJSONConstructor.tccParams, generate: RGLWJSONConstructor.generate)
    }
    
    func compare<T>(name: String,
                    fromJson: ([AnyHashable : Any]?) -> T?,
                    generate: (T?) -> [AnyHashable: Any]?,
                    omit: [String] = []
    ) {
        var expected = readJSONFile(forName: name)!
        for s in omit {
            expected = omitDeep(dict: expected, path: s.components(separatedBy: "."), index: 0)
        }
        var actual = generate(fromJson(expected))!
        for s in omit {
            actual = omitDeep(dict: actual as! [String: Any], path: s.components(separatedBy: "."), index: 0)
        }
        XCTAssertEqual(expected as NSDictionary?, actual as NSDictionary?)
    }
    
    func omitDeep(dict: [String: Any], path: [String], index: Int) -> [String: Any] {
        var mutableDict = dict
        if (index < path.count - 1) {
            mutableDict[path[index]] = omitDeep(dict: dict[path[index]] as! [String : Any], path: path, index: index + 1)
        } else {
            mutableDict.removeValue(forKey: path[index])
        }
        return mutableDict
    }
    
    func readJSONFile(forName name: String) -> [String: Any]? {
        do {
            let path = Bundle(for: RunnerTests.self).path(forResource: "json/" + name, ofType: "json")!
            let data = try String(contentsOfFile: path).data(using: .utf8)!
            return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
        } catch {
            print(error)
        }
        return nil
    }
}
