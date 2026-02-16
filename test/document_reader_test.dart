//
//  document_reader_test.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'json.dart';
import 'utils.dart';

void main() {
  group('DocumentReader', () {
    compare('initConfig', initConfig, InitConfig.fromJson);
    compare(
      'onlineProcessingConfig',
      onlineProcessingConfig,
      OnlineProcessingConfig.fromJson,
    );
    compare('imageInputData', imageInputData, ImageInputData.fromJson);
    compare('recognizeConfig', recognizeConfig, RecognizeConfig.fromJson);
    compare('recognizeConfig2', recognizeConfig2, RecognizeConfig.fromJson);
    compare('scannerConfig', scannerConfig, ScannerConfig.fromJson);
    compare('finalizeConfig', finalizeConfig, FinalizeConfig.fromJson);

    compare(
      'faceApiSearchParams',
      faceApiSearchParams,
      FaceApiSearchParams.fromJson,
    );
    compare('faceApiParams', faceApiParams, FaceApiParams.fromJson);

    compareParams('livenessParams', livenessParams, LivenessParams.fromJson);
    compareParams(
      'authenticityParams',
      authenticityParams,
      AuthenticityParams.fromJson,
    );
    compare('glaresCheckParams', glaresCheckParams, GlaresCheckParams.fromJson);
    compare('rfidParams', rfidParams, RFIDParams.fromJson);
    compareParams('imageQA', imageQA, ImageQA.fromJson);
    compare(
      'backendProcessingConfig',
      backendProcessingConfig,
      BackendProcessingConfig.fromJson,
    );
    compare('bsi', bsi, Bsi.fromJson);
    compareParams(
      'processParams',
      processParams,
      ProcessParams.fromJson,
      skip: ["logs"],
    );
    compareParams('eDLDataGroups', eDLDataGroups, EDLDataGroups.fromJson);
    compareParams(
      'ePassportDataGroups',
      ePassportDataGroups,
      EPassportDataGroups.fromJson,
    );
    compareParams('eIDDataGroups', eIDDataGroups, EIDDataGroups.fromJson);
    compareParams('dtcDataGroup', dtcDataGroup, DTCDataGroup.fromJson);
    compareParams('rfidScenario', rfidScenario, RFIDScenario.fromJson);
    compareParams(
      'customizationColors',
      customizationColors,
      CustomizationColors.fromJson,
    );
    compareParams(
      'customizationFonts',
      customizationFonts,
      CustomizationFonts.fromJson,
    );
    compareParams(
      'customizationImages',
      customizationImages,
      CustomizationImages.fromJson,
    );
    compareParams('customization', customization, Customization.fromJson);
    compareParams('functionality', functionality, Functionality.fromJson);

    compare('documentsDatabase', documentsDatabase, DocumentsDatabase.fromJson);
    compare('docReaderVersion', docReaderVersion, DocReaderVersion.fromJson);
    compare('docReaderScenario', docReaderScenario, DocReaderScenario.fromJson);
    compare('license', license, License.fromJson);
    compare(
      'docReaderException',
      docReaderException,
      DocReaderException.fromJson,
    );
    compare('rfidException', rfidException, RFIDException.fromJson);
    compare('prepareProgress', prepareProgress, PrepareProgress.fromJson);

    compare(
      'authenticityElement',
      authenticityElement,
      AuthenticityElement.fromJson,
    );
    compare('authenticityCheck', authenticityCheck, AuthenticityCheck.fromJson);
    compare(
      'authenticityResult',
      authenticityResult,
      AuthenticityResult.fromJson,
    );
    compare('pdf417Info', pdf417Info, PDF417Info.fromJson);
    compare('barcodeField', barcodeField, BarcodeField.fromJson);
    compare('barcodeResult', barcodeResult, BarcodeResult.fromJson);
    compare('imageQuality', imageQuality, ImageQuality.fromJson);
    compare('imageQualityGroup', imageQualityGroup, ImageQualityGroup.fromJson);
    compare(
      'accessControlProcedureType',
      accessControlProcedureType,
      AccessControlProcedureType.fromJson,
    );
    compare('fileData', fileData, FileData.fromJson);
    compare('certificateData', certificateData, CertificateData.fromJson);
    compare(
      'securityObjectCertificates',
      securityObjectCertificates,
      SecurityObjectCertificates.fromJson,
    );
    compare('file', file, File.fromJson);
    compare('application', application, Application.fromJson);
    compare('rfidValue', rfidValue, RFIDValue.fromJson);
    compare('attribute', attribute, Attribute.fromJson);
    compare('authority', authority, Authority.fromJson);
    compare('cardProperties', cardProperties, CardProperties.fromJson);
    compare('extension', extension, Extension.fromJson);
    compare('rfidValidity', rfidValidity, RFIDValidity.fromJson);
    compare('certificateChain', certificateChain, CertificateChain.fromJson);
    compare('dataField', dataField, DataField.fromJson);
    compare('signerInfo', signerInfo, SignerInfo.fromJson);
    compare('securityObject', securityObject, SecurityObject.fromJson);
    compare('rfidSessionData', rfidSessionData, RFIDSessionData.fromJson);
    compare('bytesData', bytesData, BytesData.fromJson);
    compare('vdsncData', vdsncData, VDSNCData.fromJson);
    compare('docFeature', docFeature, DocFeature.fromJson);
    compare('vdsData', vdsData, VDSData.fromJson);
    compare('opticalStatus', opticalStatus, OpticalStatus.fromJson);
    compare('ageStatus', ageStatus, AgeStatus.fromJson);
    compare('rfidStatus', rfidStatus, RFIDStatus.fromJson);
    compare('resultsStatus', resultsStatus, ResultsStatus.fromJson);
    compare('comparison', comparison, Comparison.fromJson);
    compare('rect', rect, Rect.fromJson);
    compare('graphicField', graphicField, GraphicField.fromJson);
    compare('graphicResult', graphicResult, GraphicResult.fromJson);
    compare('rfidOrigin', rfidOrigin, RFIDOrigin.fromJson);
    compare('symbol', symbol, Symbol.fromJson);
    compare('validity', validity, Validity.fromJson);
    compare('value', value, Value.fromJson);
    compare('textField', textField, TextField.fromJson);
    compare('textSource', textSource, TextSource.fromJson);
    compare('textResult', textResult, TextResult.fromJson);
    compare('documentType', documentType, DocumentType.fromJson);
    compare('coordinate', coordinate, Coordinate.fromJson);
    compare('position', position, Position.fromJson);
    compare('transactionInfo', transactionInfo, TransactionInfo.fromJson);
    compare('results', results, Results.fromJson);

    compare('rfidNotification', rfidNotification, RFIDNotification.fromJson);
    compare('paAttribute', paAttribute, PAAttribute.fromJson);
    compare('paResourcesIssuer', paResourcesIssuer, PAResourcesIssuer.fromJson);
    compare('pkdCertificate', pkdCertificate, PKDCertificate.fromJson);
    compare('taChallenge', taChallenge, TAChallenge.fromJson);
    compare('tccParams', tccParams, TccParams.fromJson);

    compare('deviceRetrievalMethod', deviceRetrievalMethod,
        DeviceRetrievalMethod.fromJson);
    compare('deviceEngagement', deviceEngagement, DeviceEngagement.fromJson);
    compare('nameSpaceMDL', nameSpaceMDL, NameSpaceMDL.fromJson);
    compare(
        'documentRequestMDL', documentRequestMDL, DocumentRequestMDL.fromJson);
    compare('documentRequest18013MDL', documentRequest18013MDL,
        DocumentRequest18013MDL.fromJson);
    compare('dataRetrieval', dataRetrieval, DataRetrieval.fromJson);
  });
}
