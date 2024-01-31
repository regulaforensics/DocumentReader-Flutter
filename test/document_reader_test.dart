//
//  document_reader_test.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import 'package:flutter_document_reader_api_beta/flutter_document_reader_api_beta.dart';
import 'package:flutter_test/flutter_test.dart';

import 'json.dart';
import 'utils.dart';

void main() {
  group('DocumentReader', () {
    compare('InitConfig', initConfig, InitConfig.fromJson);
    compare('OnlineProcessingConfig', onlineProcessingConfig,
        OnlineProcessingConfig.fromJson);
    compare('ImageInputData', imageInputData, ImageInputData.fromJson);
    compare('RecognizeConfig', recognizeConfig, RecognizeConfig.fromJson);
    compare('RecognizeConfig2', recognizeConfig, RecognizeConfig.fromJson);
    compare('ScannerConfig', scannerConfig, ScannerConfig.fromJson);
    compare('ScannerConfig2', scannerConfig, ScannerConfig.fromJson);

    compare('FaceApiSearchParams', faceApiSearchParams,
        FaceApiSearchParams.fromJson);
    compare('FaceApiParams', faceApiParams, FaceApiParams.fromJson);
    compare('GlaresCheckParams', glaresCheckParams, GlaresCheckParams.fromJson);
    compare('RFIDParams', rfidParams, RFIDParams.fromJson);
    compareParams('ImageQA', imageQA, ImageQA.fromJson);
    compareParams('ProcessParam', processParams, ProcessParam.fromJson,
        skip: ["logs"]);
    compare('ReprocParams', reprocParams, ReprocParams.fromJson);
    compareParams('EDLDataGroups', eDLDataGroups, EDLDataGroups.fromJson);
    compareParams('EPassportDataGroups', ePassportDataGroups,
        EPassportDataGroups.fromJson);
    compareParams('EIDDataGroups', eIDDataGroups, EIDDataGroups.fromJson);
    compareParams('RFIDScenario', rfidScenario, RFIDScenario.fromJson);
    compareParams('Customization', customization, Customization.fromJson);
    compareParams('Functionality', functionality, Functionality.fromJson);

    compare('DocumentsDatabase', documentsDatabase, DocumentsDatabase.fromJson);
    compare('DocReaderVersion', docReaderVersion, DocReaderVersion.fromJson);
    compare('DocReaderScenario', docReaderScenario, DocReaderScenario.fromJson);
    compare('License', license, License.fromJson);
    compare(
        'DocReaderException', docReaderException, DocReaderException.fromJson);
    compare('RFIDException', rfidException, RFIDException.fromJson);

    compare('AuthenticityElement', authenticityElement,
        AuthenticityElement.fromJson);
    compare('AuthenticityCheck', authenticityCheck, AuthenticityCheck.fromJson);
    compare(
        'AuthenticityResult', authenticityResult, AuthenticityResult.fromJson);
    compare('PDF417Info', pdf417Info, PDF417Info.fromJson);
    compare('BarcodeField', barcodeField, BarcodeField.fromJson);
    compare('BarcodeResult', barcodeResult, BarcodeResult.fromJson);
    compare('ImageQuality', imageQuality, ImageQuality.fromJson);
    compare('ImageQualityGroup', imageQualityGroup, ImageQualityGroup.fromJson);
    compare('AccessControlProcedureType', accessControlProcedureType,
        AccessControlProcedureType.fromJson);
    compare('FileData', fileData, FileData.fromJson);
    compare('CertificateData', certificateData, CertificateData.fromJson);
    compare('SecurityObjectCertificates', securityObjectCertificates,
        SecurityObjectCertificates.fromJson);
    compare('File', file, File.fromJson);
    compare('Application', application, Application.fromJson);
    compare('RFIDValue', rfidValue, RFIDValue.fromJson);
    compare('Attribute', attribute, Attribute.fromJson);
    compare('Authority', authority, Authority.fromJson);
    compare('CardProperties', cardProperties, CardProperties.fromJson);
    compare('Extension', extension, Extension.fromJson);
    compare('RFIDValidity', rfidValidity, RFIDValidity.fromJson);
    compare('CertificateChain', certificateChain, CertificateChain.fromJson);
    compare('DataField', dataField, DataField.fromJson);
    compare('SignerInfo', signerInfo, SignerInfo.fromJson);
    compare('SecurityObject', securityObject, SecurityObject.fromJson);
    compare('RFIDSessionData', rfidSessionData, RFIDSessionData.fromJson);
    compare('BytesData', bytesData, BytesData.fromJson);
    compare('VDSNCData', vdsncData, VDSNCData.fromJson);
    compare('OpticalStatus', opticalStatus, OpticalStatus.fromJson);
    compare('RFIDStatus', rfidStatus, RFIDStatus.fromJson);
    compare('ResultsStatus', resultsStatus, ResultsStatus.fromJson);
    compare('Comparison', comparison, Comparison.fromJson);
    compare('Rect', rect, Rect.fromJson);
    compare('GraphicField', graphicField, GraphicField.fromJson);
    compare('GraphicResult', graphicResult, GraphicResult.fromJson);
    compare('RFIDOrigin', rfidOrigin, RFIDOrigin.fromJson);
    compare('Symbol', symbol, Symbol.fromJson);
    compare('Validity', validity, Validity.fromJson);
    compare('Value', value, Value.fromJson);
    compare('TextField', textField, TextField.fromJson);
    compare('TextSource', textSource, TextSource.fromJson);
    compare('TextResult', textResult, TextResult.fromJson);
    compare('DocumentType', documentType, DocumentType.fromJson);
    compare('Coordinate', coordinate, Coordinate.fromJson);
    compare('Position', position, Position.fromJson);
    compare('Results', results, Results.fromJson);

    compare('RFIDNotification', rfidNotification, RFIDNotification.fromJson);
    compare('PAAttribute', paAttribute, PAAttribute.fromJson);
    compare('PAResourcesIssuer', paResourcesIssuer, PAResourcesIssuer.fromJson);
    compare('PKDCertificate', pkdCertificate, PKDCertificate.fromJson);
    compare('TAChallenge', taChallenge, TAChallenge.fromJson);
    compare('TccParams', tccParams, TccParams.fromJson);
  });
}
