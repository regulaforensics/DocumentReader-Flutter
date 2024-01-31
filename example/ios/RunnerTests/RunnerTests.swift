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
    
    func test_RecognizeConfig2() {
        compare(name: "RecognizeConfig2", fromJson: RGLWJSONConstructor.recognizeConfig, generate: RGLWJSONConstructor.generate,
                omit: ["onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled"])
    }
    
    func test_ScannerConfig() {
        compare(name: "ScannerConfig", fromJson: RGLWJSONConstructor.scannerConfig, generate: RGLWJSONConstructor.generate,
                omit: ["cameraId",
                       "onlineProcessingConfig.processParams.sessionLogFolder",
                       "onlineProcessingConfig.processParams.uvTorchEnabled"])
    }
    
    func test_ScannerConfig2() {
        compare(name: "ScannerConfig2", fromJson: RGLWJSONConstructor.scannerConfig, generate: RGLWJSONConstructor.generate,
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
    
    func test_DocumentsDatabase() {
        compare(name: "DocumentsDatabase", fromJson: RGLWJSONConstructor.docReaderDocumentsDatabase, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocReaderScenario() {
        compare(name: "DocReaderScenario", fromJson: RGLWJSONConstructor.scenario, generate: RGLWJSONConstructor.generate)
    }
    
    func test_DocReaderException() {
        compare(name: "DocReaderException", fromJson: RGLWJSONConstructor.error, generate: RGLWJSONConstructor.generateError)
    }
    
    // results.authenticity
    
    func test_AuthenticityElement() {
        compare(name: "AuthenticityElement", fromJson: RGLWJSONConstructor.authenticityElement, generate: RGLWJSONConstructor.generate)
    }
    
    func test_AuthenticityCheck() {
        compare(name: "AuthenticityCheck", fromJson: RGLWJSONConstructor.authenticityCheck, generate: RGLWJSONConstructor.generate)
    }
    
    func test_AuthenticityResult() {
        compare(name: "AuthenticityResult", fromJson: RGLWJSONConstructor.documentReaderAuthenticityResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results.barcode
    
    func test_PDF417Info() {
        compare(name: "PDF417Info", fromJson: RGLWJSONConstructor.pdf417Info, generate: RGLWJSONConstructor.generate)
    }
    
    func test_BarcodeField() {
        compare(name: "BarcodeField", fromJson: RGLWJSONConstructor.documentReaderBarcodeField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_BarcodeResult() {
        compare(name: "BarcodeResult", fromJson: RGLWJSONConstructor.documentReaderBarcodeResult, generate: RGLWJSONConstructor.generate)
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
    
    func test_RFIDValue() {
        compare(name: "RFIDValue", fromJson: RGLWJSONConstructor.rfidValue, generate: RGLWJSONConstructor.generate)
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
    
    func test_RFIDValidity() {
        compare(name: "RFIDValidity", fromJson: RGLWJSONConstructor.validity, generate: RGLWJSONConstructor.generate)
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
    
    func test_OpticalStatus() {
        compare(name: "OpticalStatus", fromJson: RGLWJSONConstructor.opticalStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_RFIDStatus() {
        compare(name: "RFIDStatus", fromJson: RGLWJSONConstructor.rfidSessionDataStatus, generate: RGLWJSONConstructor.generate)
    }
    
    func test_ResultsStatus() {
        compare(name: "ResultsStatus", fromJson: RGLWJSONConstructor.documentReaderResultsStatus, generate: RGLWJSONConstructor.generate)
    }
    
    // results.visual_results
    
    func test_Rect() {
        do{
            var rect = try readJSONFile(forName: "Rect")!
            XCTAssertEqual(rect as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.rect(fromJson: rect))! as NSDictionary?)
            rect = try readJSONFile(forName: "RectNullable")!
            XCTAssertEqual(rect as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.rect(fromJson: rect))! as NSDictionary?)
        }catch{}
    }
    
    func test_Comparison() {
        compare(name: "Comparison", fromJson: RGLWJSONConstructor.documentReaderComparison, generate: RGLWJSONConstructor.generate)
    }
    
    func test_GraphicField() {
        compare(name: "GraphicField", fromJson: RGLWJSONConstructor.documentReaderGraphicField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_GraphicResult() {
        compare(name: "GraphicResult", fromJson: RGLWJSONConstructor.documentReaderGraphicResult, generate: RGLWJSONConstructor.generate)
    }
    
    func test_RFIDOrigin() {
        compare(name: "RFIDOrigin", fromJson: RGLWJSONConstructor.documentReaderRfidOrigin, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Symbol() {
        compare(name: "Symbol", fromJson: RGLWJSONConstructor.documentReaderSymbol, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Validity() {
        compare(name: "Validity", fromJson: RGLWJSONConstructor.documentReaderValidity, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Value() {
        compare(name: "Value", fromJson: RGLWJSONConstructor.documentReaderValue, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TextField() {
        compare(name: "TextField", fromJson: RGLWJSONConstructor.documentReaderTextField, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TextSource() {
        compare(name: "TextSource", fromJson: RGLWJSONConstructor.documentReaderTextSource, generate: RGLWJSONConstructor.generate)
    }
    
    func test_TextResult() {
        compare(name: "TextResult", fromJson: RGLWJSONConstructor.documentReaderTextResult, generate: RGLWJSONConstructor.generate)
    }
    
    // results
    
    func test_DocumentType() {
        compare(name: "DocumentType", fromJson: RGLWJSONConstructor.documentReaderDocumentType, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Coordinate() {
        do{
            var coordinate = try readJSONFile(forName: "Coordinate")!
            XCTAssertEqual(coordinate as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.point(fromJson: coordinate))! as NSDictionary?)
            coordinate = try readJSONFile(forName: "CoordinateNullable")!
            XCTAssertEqual(coordinate as NSDictionary?, RGLWJSONConstructor.generate(RGLWJSONConstructor.point(fromJson: coordinate))! as NSDictionary?)
        } catch {}
    }
    
    func test_Position() {
        compare(name: "Position", fromJson: RGLWJSONConstructor.position, generate: RGLWJSONConstructor.generate)
    }
    
    func test_Results() {
        compare(name: "Results", fromJson: RGLWJSONConstructor.documentReaderResults, generate: RGLWJSONConstructor.generate);
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
    
    func compareSingle<T>(name: String,
                    fromJson: ([AnyHashable : Any]?) -> T?,
                    generate: (T?) -> [AnyHashable: Any]?,
                    omit: [String] = []
    ) {
        do {
            var expected = try readJSONFile(forName: name)!
            for s in omit {
                expected = omitDeep(dict: expected, path: s.components(separatedBy: "."), index: 0)
            }
            var actual = generate(fromJson(expected))!
            for s in omit {
                actual = omitDeep(dict: actual as! [String: Any], path: s.components(separatedBy: "."), index: 0)
            }
            XCTAssertEqual(expected as NSDictionary?, actual as NSDictionary?)
        } catch { }
    }
    
    func compare<T>(name: String,
                    fromJson: ([AnyHashable : Any]?) -> T?,
                    generate: (T?) -> [AnyHashable: Any]?,
                    omit: [String] = []
    ) {
        compareSingle(name: name, fromJson: fromJson, generate: generate, omit: omit)
        compareSingle(name: name + "Nullable", fromJson: fromJson, generate: generate, omit: omit)
    }
    
    func omitDeep(dict: [String: Any], path: [String], index: Int) -> [String: Any] {
        var mutableDict = dict
        if(dict[path[index]] == nil) {
            // not found
            return mutableDict
        }
        if (index < path.count - 1) {
            mutableDict[path[index]] = omitDeep(dict: dict[path[index]] as! [String : Any], path: path, index: index + 1)
        } else {
            mutableDict.removeValue(forKey: path[index])
        }
        return mutableDict
    }
    
    func readJSONFile(forName name: String) throws -> [String: Any]? {
        do {
            let path = Bundle(for: RunnerTests.self).path(forResource: "json/" + name, ofType: "json")
            if(path == nil){
                throw "file not found"
            }
            let data = try String(contentsOfFile: path!).data(using: .utf8)!
            return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
        } catch {
            throw(error)
        }
    }
}

extension String: Error {}
