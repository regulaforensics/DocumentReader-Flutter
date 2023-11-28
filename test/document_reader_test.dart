//
//  document_reader_test.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter_document_reader_api_beta/flutter_document_reader_api_beta.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> writeJson(String name, Map<String, dynamic> contents) async {
  var file = io.File("test/json/" + name + ".json");
  var jsonDir = new io.Directory.fromUri(new Uri(path: "test/json"));
  if (!await jsonDir.exists()) jsonDir.create();
  await file.writeAsString(jsonEncode(contents));
}

void main() {
  group('DocumentReader', () {
    group("config+params", () {
      // params.process_params
      var faceApiSearchParams = {
        "limit": 1,
        "threshold": 2,
        "groupIds": [3, 4, 5]
      };
      var faceApiParams = {
        "url": "test1",
        "mode": "test2",
        "threshold": 1,
        "serviceTimeout": 2,
        "proxy": "test3",
        "proxyPassword": "test4",
        "proxyType": 3,
        "searchParams": faceApiSearchParams
      };
      var glaresCheckParams = {
        "imgMarginPart": 0.5,
        "maxGlaringPart": 1.5,
      };
      var imageQA = {
        "dpiThreshold": 1,
        "angleThreshold": 2,
        "documentPositionIndent": 3,
        "focusCheck": true,
        "glaresCheck": false,
        "colornessCheck": true,
        "moireCheck": false,
        "expectedPass": [1, 2, 3],
        "glaresCheckParams": glaresCheckParams
      };
      var rfidParams = {
        "paIgnoreNotificationCodes": [1, 2, 3]
      };
      var processParams = {
        "multipageProcessing": true,
        "debugSaveImages": false,
        "debugSaveLogs": true,
        "returnUncroppedImage": false,
        "uvTorchEnabled": true,
        "debugSaveCroppedImages": false,
        "disableFocusingCheck": true,
        "debugSaveRFIDSession": false,
        "doublePageSpread": true,
        "manualCrop": false,
        "integralImage": true,
        "returnCroppedBarcode": false,
        "checkHologram": true,
        "checkRequiredTextFields": false,
        "depersonalizeLog": true,
        "generateDoublePageSpreadImage": false,
        "alreadyCropped": true,
        "matchTextFieldMask": false,
        "fastDocDetect": true,
        "updateOCRValidityByGlare": false,
        "noGraphics": true,
        "multiDocOnImage": false,
        "forceReadMrzBeforeLocate": true,
        "parseBarcodes": false,
        "shouldReturnPackageForReprocess": true,
        "disablePerforationOCR": false,
        "respectImageQuality": true,
        "splitNames": false,
        "doDetectCan": true,
        "useFaceApi": false,
        "measureSystem": 1,
        "barcodeParserType": 3,
        "perspectiveAngle": 4,
        "minDPI": 5,
        "imageDpiOutMax": 6,
        "forceDocID": 6,
        "forceDocFormat": 8,
        "shiftExpiryDate": 9,
        "minimalHolderAge": 10,
        "imageOutputMaxHeight": 11,
        "imageOutputMaxWidth": 12,
        "processAuth": 13,
        "convertCase": 3,
        "dateFormat": "test1",
        "scenario": "Mrz",
        "captureButtonScenario": "test2",
        "sessionLogFolder": "test3",
        "timeout": 15,
        "timeoutFromFirstDetect": 16,
        "timeoutFromFirstDocType": 17,
        "documentAreaMin": 18,
        "documentIDList": [1, 2, 3],
        "barcodeTypes": [4, 5, 6],
        "fieldTypesFilter": [7, 8, 9],
        "resultTypeOutput": [10, 9, 8],
        "mrzFormatsFilter": ["1x30", "3x30", "2x30"],
        "documentGroupFilter": [135, 136, 137],
        "imageQA": imageQA,
        "rfidParams": rfidParams,
        "faceApiParams": faceApiParams,
        "customParams": {"test1": true, "test2": 1, "test3": "test"},
      };

      group('config', () {
        var initConfig = {
          "delayedNNLoad": false,
          "licenseUpdate": true,
          "customDb": img1,
          "blackList": {"key1": "val1", "key2": "val2", "key3": "val3"},
          "databasePath": "test",
          "license": img2
        };
        var onlineProcessingConfig = {
          "mode": 1,
          "url": "test",
          "imageFormat": 1,
          "imageCompressionQuality": 1.5,
          "processParams": processParams,
        };
        var imageInputData = {
          "image": img1,
          "light": 128,
          "pageIndex": 2,
        };
        var recognizeConfig = {
          "scenario": "Mrz",
          "onlineProcessingConfig": onlineProcessingConfig,
          "livePortrait": img1,
          "extPortrait": img2,
          "oneShotIdentification": true,
          "image": img3,
          "images": [img1, img2, img3],
          "imageInputData": [imageInputData, imageInputData, imageInputData]
        };
        var scannerConfig = {
          "scenario": "Mrz",
          "onlineProcessingConfig": onlineProcessingConfig,
          "livePortrait": img1,
          "extPortrait": img2,
          "cameraId": 1
        };
        test('InitConfig', () {
          expect(initConfig, InitConfig.fromJson(initConfig)!.toJson());
          writeJson("InitConfig", initConfig);
        });
        test('OnlineProcessingConfig', () {
          expect(
              onlineProcessingConfig,
              OnlineProcessingConfig.fromJson(onlineProcessingConfig)!
                  .toJson());
          writeJson("OnlineProcessingConfig", onlineProcessingConfig);
        });
        test('ImageInputData', () {
          expect(imageInputData,
              ImageInputData.fromJson(imageInputData)!.toJson());
          writeJson("ImageInputData", imageInputData);
        });
        test('RecognizeConfig', () {
          expect(recognizeConfig,
              RecognizeConfig.fromJson(recognizeConfig)!.toJson());
          writeJson("RecognizeConfig", recognizeConfig);
        });
        test('ScannerConfig', () {
          expect(
              scannerConfig, ScannerConfig.fromJson(scannerConfig)!.toJson());
          writeJson("ScannerConfig", scannerConfig);
        });
        // RFIDConfig has no native analog
        // test('RFIDConfig', () { });
      });
      group("params", () {
        group("process_params", () {
          test("FaceApiSearchParams", () {
            expect(faceApiSearchParams,
                FaceApiSearchParams.fromJson(faceApiSearchParams)!.toJson());
            writeJson("FaceApiSearchParams", faceApiSearchParams);
          });
          test("FaceApiParams", () {
            expect(
                faceApiParams, FaceApiParams.fromJson(faceApiParams)!.toJson());
            writeJson("FaceApiParams", faceApiParams);
          });
          test("GlaresCheckParams", () {
            expect(glaresCheckParams,
                GlaresCheckParams.fromJson(glaresCheckParams)!.toJson());
            writeJson("GlaresCheckParams", glaresCheckParams);
          });
          test("ImageQA", () {
            expect(imageQA, ImageQA.fromJson(imageQA)!.toJson());
            writeJson("ImageQA", imageQA);
          });
          test("RFIDParams", () {
            expect(rfidParams, RFIDParams.fromJson(rfidParams)!.toJson());
            writeJson("RFIDParams", rfidParams);
          });
          test("ProcessParam", () {
            expect(processParams,
                ProcessParam().fromJson(processParams)!.toJson());
            writeJson("ProcessParam", processParams);
          });
        });
        group("rfid_scenario", () {
          var reprocParams = {
            "serviceUrl": "test",
            "failIfNoService": true,
            "httpHeaders": {"key1": "val1", "key2": "val2", "key3": "val3"}
          };
          var eDLDataGroups = {
            "DG1": true,
            "DG2": false,
            "DG3": true,
            "DG4": false,
            "DG5": true,
            "DG6": false,
            "DG7": true,
            "DG8": false,
            "DG9": true,
            "DG10": false,
            "DG11": true,
            "DG12": false,
            "DG13": true,
            "DG14": false,
          };
          var ePassportDataGroups = {
            "DG1": true,
            "DG2": false,
            "DG3": true,
            "DG4": false,
            "DG5": true,
            "DG6": false,
            "DG7": true,
            "DG8": false,
            "DG9": true,
            "DG10": false,
            "DG11": true,
            "DG12": false,
            "DG13": true,
            "DG14": false,
            "DG15": true,
            "DG16": false,
          };
          var eIDDataGroups = {
            "DG1": true,
            "DG2": false,
            "DG3": true,
            "DG4": false,
            "DG5": true,
            "DG6": false,
            "DG7": true,
            "DG8": false,
            "DG9": true,
            "DG10": false,
            "DG11": true,
            "DG12": false,
            "DG13": true,
            "DG14": false,
            "DG15": true,
            "DG16": false,
            "DG17": true,
            "DG18": false,
            "DG19": true,
            "DG20": false,
            "DG21": true,
          };
          var rfidScenario = {
            "paceStaticBinding": true,
            "onlineTA": false,
            "writeEid": true,
            "universalAccessRights": false,
            "authorizedRestrictedIdentification": true,
            "auxVerificationCommunityID": false,
            "auxVerificationDateOfBirth": true,
            "skipAA": false,
            "strictProcessing": true,
            "pkdDSCertPriority": false,
            "pkdUseExternalCSCA": true,
            "trustedPKD": false,
            "passiveAuth": true,
            "useSFI": false,
            "readEPassport": true,
            "readEID": false,
            "readEDL": true,
            "authorizedSTSignature": false,
            "authorizedSTQSignature": true,
            "authorizedWriteDG17": false,
            "authorizedWriteDG18": true,
            "authorizedWriteDG19": false,
            "authorizedWriteDG20": true,
            "authorizedWriteDG21": false,
            "authorizedVerifyAge": true,
            "authorizedVerifyCommunityID": false,
            "authorizedPrivilegedTerminal": true,
            "authorizedCANAllowed": false,
            "authorizedPINManagement": true,
            "authorizedInstallCert": false,
            "authorizedInstallQCert": true,
            "applyAmendments": false,
            "autoSettings": true,
            "readingBuffer": 1,
            "onlineTAToSignDataType": 3,
            "defaultReadingBufferSize": 2,
            "signManagementAction": 3,
            "profilerType": 2,
            "authProcType": 3,
            "baseSMProcedure": 4,
            "pacePasswordType": 5,
            "terminalType": 1,
            "password": "test1",
            "pkdPA": "test2",
            "pkdEAC": "test3",
            "mrz": "test4",
            "eSignPINDefault": "test5",
            "eSignPINNewValue": "test6",
            "reprocessParams": reprocParams,
            "eDLDataGroups": eDLDataGroups,
            "ePassportDataGroups": ePassportDataGroups,
            "eIDDataGroups": eIDDataGroups,
          };
          test("ReprocParams", () {
            expect(reprocParams, ReprocParams.fromJson(reprocParams)!.toJson());
            writeJson("ReprocParams", reprocParams);
          });
          test("EDLDataGroups", () {
            expect(eDLDataGroups,
                EDLDataGroups().fromJson(eDLDataGroups)!.toJson());
            writeJson("EDLDataGroups", eDLDataGroups);
          });
          test("EPassportDataGroups", () {
            expect(ePassportDataGroups,
                EPassportDataGroups().fromJson(ePassportDataGroups)!.toJson());
            writeJson("EPassportDataGroups", ePassportDataGroups);
          });
          test("EIDDataGroups", () {
            expect(eIDDataGroups,
                EIDDataGroups().fromJson(eIDDataGroups)!.toJson());
            writeJson("EIDDataGroups", eIDDataGroups);
          });
          test("RFIDScenario", () {
            expect(
                rfidScenario, RFIDScenario().fromJson(rfidScenario)!.toJson());
            writeJson("RFIDScenario", rfidScenario);
          });
        });

        var customization = {
          "showStatusMessages": true,
          "showResultStatusMessages": false,
          "showHelpAnimation": true,
          "showNextPageAnimation": false,
          "showBackgroundMask": true,
          "cameraFrameBorderWidth": 1,
          "cameraFrameLineLength": 2,
          "cameraFrameShapeType": 1,
          "cameraFrameOffsetWidth": 3,
          "status": "test1",
          "resultStatus": "test2",
          "cameraFrameDefaultColor": 0xff000000,
          "cameraFrameActiveColor": 0xff000001,
          "statusTextColor": 0xff000002,
          "resultStatusTextColor": 0xff000003,
          "resultStatusBackgroundColor": 0xff000004,
          "multipageButtonBackgroundColor": 0xff000005,
          "tintColor": 0xff000006,
          "activityIndicatorColor": 0xff000007,
          "statusBackgroundColor": 0xff000008,
          "cameraPreviewBackgroundColor": 0xff000009,
          "statusPositionMultiplier": 0.5,
          "resultStatusPositionMultiplier": 1.5,
          "toolbarSize": 2.5,
          "backgroundMaskAlpha": 3.5,
          "customStatusPositionMultiplier": 4.5,
          "cameraFrameVerticalPositionMultiplier": 5.5,
          "cameraFrameLandscapeAspectRatio": 6.5,
          "cameraFramePortraitAspectRatio": 7.5,
          "cameraFrameCornerRadius": 8.5,
          "hologramAnimationPositionMultiplier": 9.5,
          "multipageAnimationFrontImage": img1,
          "multipageAnimationBackImage": img2,
          "borderBackgroundImage": img3,
          "helpAnimationImage": img1,
          "closeButtonImage": img2,
          "captureButtonImage": img3,
          "cameraSwitchButtonImage": img1,
          "torchButtonOnImage": img2,
          "torchButtonOffImage": img3,
          "changeFrameButtonExpandImage": img1,
          "changeFrameButtonCollapseImage": img2,
          "hologramAnimationImage": img3,
          "customLabelStatus": "test3",
          "cameraFrameLineCap": 2,
          "uiCustomizationLayer": {"test": "test"},
          "statusTextFont": {"name": "test1", "size": 1, "style": 2},
          "resultStatusTextFont": {"name": "test2", "size": 3, "style": 1},
          "helpAnimationImageContentMode": 0,
          "multipageAnimationFrontImageContentMode": 1,
          "multipageAnimationBackImageContentMode": 2,
          "hologramAnimationImageContentMode": 3,
          "borderBackgroundImageContentMode": 4,
          "helpAnimationImageMatrix": [
            1.1,
            1.2,
            1.3,
            1.4,
            1.5,
            1.6,
            1.7,
            1.8,
            1.9
          ],
          "multipageAnimationFrontImageMatrix": [
            2.1,
            2.2,
            2.3,
            2.4,
            2.5,
            2.6,
            2.7,
            2.8,
            2.9
          ],
          "multipageAnimationBackImageMatrix": [
            3.1,
            3.2,
            3.3,
            3.4,
            3.5,
            3.6,
            3.7,
            3.8,
            3.9
          ],
          "hologramAnimationImageMatrix": [
            4.1,
            4.2,
            4.3,
            4.4,
            4.5,
            4.6,
            4.7,
            4.8,
            4.9
          ],
          "borderBackgroundImageMatrix": [
            5.1,
            5.2,
            5.3,
            5.4,
            5.5,
            5.6,
            5.7,
            5.8,
            5.9
          ],
        };
        var functionality = {
          "pictureOnBoundsReady": true,
          "showTorchButton": false,
          "showCloseButton": true,
          "videoCaptureMotionControl": false,
          "showCaptureButton": true,
          "showChangeFrameButton": false,
          "showSkipNextPageButton": true,
          "useAuthenticator": true,
          "skipFocusingFrames": true,
          "showCameraSwitchButton": false,
          "displayMetadata": true,
          "isZoomEnabled": false,
          "isCameraTorchCheckDisabled": true,
          "recordScanningProcess": false,
          "manualMultipageMode": true,
          "singleResult": false,
          "showCaptureButtonDelayFromDetect": 0,
          "showCaptureButtonDelayFromStart": 1,
          "rfidTimeout": 2,
          "forcePagesCount": 3,
          "orientation": 1,
          "captureMode": 2,
          "cameraPosition": 1,
          "cameraFrame": "id1",
          "btDeviceName": "test",
          "zoomFactor": 0.5,
          "exposure": 1.5,
          "excludedCamera2Models": ["test1", "test2", "test3"],
          "cameraSize": {"width": 3, "height": 4},
          "videoSessionPreset": 6,
        };
        test("Customization", () {
          expect(
              customization, Customization().fromJson(customization)!.toJson());
          writeJson("Customization", customization);
        });
        test("Functionality", () {
          expect(
              functionality, Functionality().fromJson(functionality)!.toJson());
          writeJson("Functionality", functionality);
        });
      });
    });
    group("info", () {
      var docReaderDocumentsDatabase = {
        "databaseID": "test1",
        "version": "test2",
        "date": "test3",
        "databaseDescription": "test4",
        "countriesNumber": 1,
        "documentsNumber": 2,
        "size": 3
      };
      var docReaderVersion = {
        "api": "test1",
        "core": "test2",
        "coreMode": "test3",
        "database": docReaderDocumentsDatabase
      };
      var documentReaderScenario = {
        "uvTorch": true,
        "frame": "max",
        "frameOrientation": 2,
        "faceExt": false,
        "barcodeExt": true,
        "multiPageOff": false,
        "seriesProcessMode": true,
        "frameKWHLandscape": 0.5,
        "frameKWHPortrait": 1.5,
        "frameKWHDoublePageSpreadPortrait":
            0, // TODO поставить 2.5 когда пофиксят баг в айос нативе
        "frameKWHDoublePageSpreadLandscape":
            0, // TODO поставить 3.5 когда пофиксят баг в айос нативе
        "name": "test1",
        "caption": "test2",
        "description": "test3",
        "manualCrop": false
      };
      var license = {
        "expiryDate": "test1",
        "countryFilter": ["test2", "test3", "test4"],
        "isRfidAvailable": true
      };
      var documentReaderException = {
        "code": 1,
        "message": "test1",
      };
      var rfidException = {
        "code": 2,
        "message": "test2",
      };
      test("DocReaderDocumentsDatabase", () {
        expect(docReaderDocumentsDatabase,
            DocumentsDatabase.fromJson(docReaderDocumentsDatabase)!.toJson());
        writeJson("DocReaderDocumentsDatabase", docReaderDocumentsDatabase);
      });
      test("DocReaderVersion", () {
        expect(docReaderVersion,
            DocReaderVersion.fromJson(docReaderVersion)!.toJson());
        writeJson("DocReaderVersion", docReaderVersion);
      });
      test("DocumentReaderScenario", () {
        expect(documentReaderScenario,
            DocReaderScenario.fromJson(documentReaderScenario)!.toJson());
        writeJson("DocumentReaderScenario", documentReaderScenario);
      });
      test("License", () {
        expect(license, License.fromJson(license)!.toJson());
        writeJson("License", license);
      });
      test("DocumentReaderException", () {
        expect(documentReaderException,
            DocReaderException.fromJson(documentReaderException)!.toJson());
        writeJson("DocumentReaderException", documentReaderException);
      });
      test("RFIDException", () {
        expect(rfidException, RFIDException.fromJson(rfidException)!.toJson());
        writeJson("RFIDException", rfidException);
      });
    });
    group("results", () {
      // authenticity
      var documentReaderAuthenticityElement = {
        "status": 1,
        "elementType": 2,
        "elementDiagnose": 3,
        "elementTypeName": "Photo element",
        "elementDiagnoseName": "Error of internal data processing"
      };
      var documentReaderAuthenticityCheck = {
        "type": 2,
        "status": 1,
        "typeName": "IR B900 ink",
        "pageIndex": 3,
        "elements": [
          documentReaderAuthenticityElement,
          documentReaderAuthenticityElement,
          documentReaderAuthenticityElement
        ]
      };
      var documentReaderAuthenticityResult = {
        "status": 1,
        "checks": [
          documentReaderAuthenticityCheck,
          documentReaderAuthenticityCheck,
          documentReaderAuthenticityCheck
        ]
      };

      // barcode
      var pdf417Info = {
        "errorLevel": 2,
        "columns": 3,
        "rows": 4,
      };
      var documentReaderBarcodeField = {
        "barcodeType": 5,
        "status": -6001,
        "pageIndex": 2,
        "pdf417Info": pdf417Info,
        "data": img1
      };
      var documentReaderBarcodeResult = {
        "fields": [
          documentReaderBarcodeField,
          documentReaderBarcodeField,
          documentReaderBarcodeField
        ]
      };

      // image_quality
      var rect = {
        "bottom": 0,
        "top": 1,
        "left": 2,
        "right": 3,
      };
      var imageQuality = {
        "featureType": 1,
        "result": 2,
        "type": 3,
        "boundRects": [rect, rect, rect]
      };
      var imageQualityGroup = {
        "count": 1,
        "result": 2,
        "pageIndex": 3,
        "imageQualityList": [imageQuality, imageQuality, imageQuality]
      };

      // rfid
      var accessControlProcedureType = {
        "activeOptionIdx": 1,
        "type": 2,
        "status": 1,
        "notifications": [1, 2, 3]
      };
      var fileData = {
        "data": "test",
        "length": 2,
        "type": 3,
        "status": 4,
      };
      var certificateData = {
        "data": "test",
        "length": 1,
      };
      var securityObjectCertificates = {
        "securityObject": certificateData,
      };
      var file = {
        "fileData": fileData,
        "fileID": "test1",
        "notifications": [1, 2, 3],
        "pAStatus": 1,
        "readingStatus": 2,
        "readingTime": 3,
        "type": 4,
        "typeName": "Biometry - Iris Data (DG4)",
        "docFieldsText": [4, 5, 6],
        "docFieldsGraphics": [7, 8, 9],
        "docFieldsOriginals": [10, 11, 12],
        "certificates": securityObjectCertificates
      };
      var application = {
        "applicationID": "test1",
        "dataHashAlgorithm": "test2",
        "files": [file, file, file],
        "status": 1,
        "type": 2,
        "unicodeVersion": "test3",
        "version": "test4"
      };
      var value = {
        "data": "test1",
        "length": 1,
        "status": 2,
        "type": 3,
        "format": "test2",
      };
      var attribute = {
        "type": "test",
        "value": value,
      };
      var authority = {
        "attributes": [attribute, attribute, attribute],
        "data": "test",
        "friendlyName": value,
      };
      var cardProperties = {
        "aTQA": 1,
        "bitRateR": 2,
        "bitRateS": 3,
        "chipTypeA": 4,
        "mifareMemory": 5,
        "rfidType": 6,
        "sAK": 7,
        "support4": true,
        "supportMifare": false,
        "aTQB": "test1",
        "aTR": "test2",
        "baudrate1": "test3",
        "baudrate2": "test4",
        "uID": "test5"
      };
      var extension = {
        "data": "test1",
        "type": "test2",
      };
      var validity = {
        "notAfter": value,
        "notBefore": value,
      };
      var certificateChain = {
        "type": 1,
        "extensions": [extension, extension, extension],
        "fileName": value,
        "issuer": authority,
        "notifications": [1, 2, 3],
        "origin": 2,
        "paStatus": 3,
        "serialNumber": "test1",
        "signatureAlgorithm": "test2",
        "subject": authority,
        "subjectPKAlgorithm": "test3",
        "validity": validity,
        "version": 4
      };
      var dataField = {
        "data": "test",
        "fieldType": 1,
      };
      var signerInfo = {
        "dataToHash": "test1",
        "digestAlgorithm": "test2",
        "version": 1,
        "paStatus": 2,
        "signatureAlgorithm": "test3",
        "issuer": authority,
        "serialNumber": value,
        "signature": value,
        "subjectKeyIdentifier": value,
        "signedAttributes": [extension, extension, extension],
        "certificateChain": [
          certificateChain,
          certificateChain,
          certificateChain
        ],
        "notifications": [1, 2, 3]
      };
      var securityObject = {
        "fileReference": 1,
        "objectType": "test",
        "version": 2,
        "signerInfos": [signerInfo, signerInfo, signerInfo],
        "notifications": [1, 2, 3]
      };
      var rfidSessionData = {
        "accessControls": [
          accessControlProcedureType,
          accessControlProcedureType,
          accessControlProcedureType
        ],
        "applications": [application, application, application],
        "securityObjects": [securityObject, securityObject, securityObject],
        "dataFields": [dataField, dataField, dataField],
        "dataGroups": [1, 2, 3],
        "cardProperties": cardProperties,
        "totalBytesReceived": 1,
        "totalBytesSent": 2,
        "status": 1,
        "extLeSupport": 1,
        "processTime": 4
      };
      var bytesData = {
        "data": "test",
        "length": 1,
        "status": 2,
        "type": 3,
      };
      var vdsncData = {
        "type": "test1",
        "version": 1,
        "issuingCountry": "test2",
        "message": {"key1": "val1", "key2": "val2", "key3": "val3"},
        "signatureAlgorithm": "test3",
        "signature": bytesData,
        "certificate": bytesData,
        "certificateChain": [
          certificateChain,
          certificateChain,
          certificateChain
        ],
        "notifications": [3000000001, 3000000002, 3000000003],
      };

      // status
      var detailsOptical = {
        "overallStatus": 0,
        "mrz": 1,
        "text": 2,
        "docType": 0,
        "security": 1,
        "imageQA": 2,
        "expiry": 0,
        "vds": 1,
        "pagesCount": 3,
      };
      var detailsRFID = {
        "overallStatus": 0,
        "pa": 1,
        "ca": 2,
        "aa": 0,
        "ta": 1,
        "bac": 2,
        "pace": 0,
      };
      var documentReaderResultsStatus = {
        "overallStatus": 0,
        "optical": 1,
        "rfid": 2,
        "portrait": 0,
        "stopList": 1,
        "detailsOptical": detailsOptical,
        "detailsRFID": detailsRFID,
      };

      // visual_results

      var documentReaderComparison = {
        "sourceTypeLeft": 0,
        "sourceTypeRight": 1,
        "status": 2,
      };
      var documentReaderGraphicField = {
        "sourceType": 0,
        "fieldType": 201,
        "fieldName": "Portrait",
        "light": 128,
        "lightName": "UV",
        "pageIndex": 3,
        "originalPageIndex": 4,
        "value": img1,
        "fieldRect": rect,
      };
      var documentReaderGraphicResult = {
        "fields": [
          documentReaderGraphicField,
          documentReaderGraphicField,
          documentReaderGraphicField
        ],
      };
      var documentReaderRFIDOrigin = {
        "dg": 1,
        "dgTag": 2,
        "entryView": 3,
        "tagEntry": 4,
      };
      var documentReaderSymbol = {
        "rect": rect,
        "code": 1,
        "probability": 2,
      };
      var documentReaderValidity = {
        "sourceType": 1,
        "status": 2,
      };
      var documentReaderValue = {
        "sourceType": 3,
        "value": "test1",
        "originalValue": "test2",
        "pageIndex": 2,
        "boundRect": rect,
        "rfidOrigin": documentReaderRFIDOrigin,
        "originalSymbols": [
          documentReaderSymbol,
          documentReaderSymbol,
          documentReaderSymbol
        ],
        "probability": 1,
      };
      var documentReaderTextField = {
        "fieldType": 1,
        "fieldName": "Issuing state code",
        "lcid": 10011,
        "lcidName": "Abkhazian (Cyrillic)",
        "value": "test3",
        "getValue": documentReaderValue,
        "values": [
          documentReaderValue,
          documentReaderValue,
          documentReaderValue
        ],
        "status": 2,
        "comparisonList": [
          documentReaderComparison,
          documentReaderComparison,
          documentReaderComparison
        ],
        "validityList": [
          documentReaderValidity,
          documentReaderValidity,
          documentReaderValidity
        ],
        "comparisonStatus": 0,
        "validityStatus": 1,
      };
      var documentReaderTextSource1 = {
        "sourceType": documentReaderValidity["sourceType"],
        "source": "sourceType",
        "validityStatus": 1,
      };
      var documentReaderTextSource2 = {
        "sourceType": documentReaderComparison["sourceTypeLeft"],
        "source": "sourceTypeLeft",
        "validityStatus": 1,
      };
      var documentReaderTextSource3 = {
        "sourceType": documentReaderComparison["sourceTypeRight"],
        "source": "sourceTypeRight",
        "validityStatus": 1,
      };
      var documentReaderTextResult = {
        "status": 0,
        "comparisonStatus": 1,
        "validityStatus": 2,
        "availableSourceList": [
          documentReaderTextSource1,
          documentReaderTextSource2,
          documentReaderTextSource3
        ],
        "fields": [
          documentReaderTextField,
          documentReaderTextField,
          documentReaderTextField
        ],
      };
      group("authenticity", () {
        test("DocumentReaderAuthenticityElement", () {
          expect(
              documentReaderAuthenticityElement,
              AuthenticityElement.fromJson(documentReaderAuthenticityElement)!
                  .toJson());
          writeJson("DocumentReaderAuthenticityElement",
              documentReaderAuthenticityElement);
        });
        test("DocumentReaderAuthenticityCheck", () {
          expect(
              documentReaderAuthenticityCheck,
              AuthenticityCheck.fromJson(documentReaderAuthenticityCheck)!
                  .toJson());
          writeJson("DocumentReaderAuthenticityCheck",
              documentReaderAuthenticityCheck);
        });
        test("DocumentReaderAuthenticityResult", () {
          expect(
              documentReaderAuthenticityResult,
              AuthenticityResult.fromJson(documentReaderAuthenticityResult)!
                  .toJson());
          writeJson("DocumentReaderAuthenticityResult",
              documentReaderAuthenticityResult);
        });
      });
      group("barcode", () {
        test("PDF417Info", () {
          expect(pdf417Info, PDF417Info.fromJson(pdf417Info)!.toJson());
          writeJson("PDF417Info", pdf417Info);
        });
        test("DocumentReaderBarcodeField", () {
          expect(documentReaderBarcodeField,
              BarcodeField.fromJson(documentReaderBarcodeField)!.toJson());
          writeJson("DocumentReaderBarcodeField", documentReaderBarcodeField);
        });
        test("DocumentReaderBarcodeResult", () {
          expect(documentReaderBarcodeResult,
              BarcodeResult.fromJson(documentReaderBarcodeResult)!.toJson());
          writeJson("DocumentReaderBarcodeResult", documentReaderBarcodeResult);
        });
      });
      group("image_quality", () {
        test("ImageQuality", () {
          expect(imageQuality, ImageQuality.fromJson(imageQuality)!.toJson());
          writeJson("ImageQuality", imageQuality);
        });
        test("ImageQualityGroup", () {
          expect(imageQualityGroup,
              ImageQualityGroup.fromJson(imageQualityGroup)!.toJson());
          writeJson("ImageQualityGroup", imageQualityGroup);
        });
      });
      group("rfid", () {
        test("AccessControlProcedureType", () {
          expect(
              accessControlProcedureType,
              AccessControlProcedureType.fromJson(accessControlProcedureType)!
                  .toJson());
          writeJson("AccessControlProcedureType", accessControlProcedureType);
        });
        test("FileData", () {
          expect(fileData, FileData.fromJson(fileData)!.toJson());
          writeJson("FileData", fileData);
        });
        test("CertificateData", () {
          expect(certificateData,
              CertificateData.fromJson(certificateData)!.toJson());
          writeJson("CertificateData", certificateData);
        });
        test("SecurityObjectCertificates", () {
          expect(
              securityObjectCertificates,
              SecurityObjectCertificates.fromJson(securityObjectCertificates)!
                  .toJson());
          writeJson("SecurityObjectCertificates", securityObjectCertificates);
        });
        test("File", () {
          expect(file, File.fromJson(file)!.toJson());
          writeJson("File", file);
        });
        test("Application", () {
          expect(application, Application.fromJson(application)!.toJson());
          writeJson("Application", application);
        });
        test("Value", () {
          expect(value, RFIDValue.fromJson(value)!.toJson());
          writeJson("Value", value);
        });
        test("Attribute", () {
          expect(attribute, Attribute.fromJson(attribute)!.toJson());
          writeJson("Attribute", attribute);
        });
        test("Authority", () {
          expect(authority, Authority.fromJson(authority)!.toJson());
          writeJson("Authority", authority);
        });
        test("CardProperties", () {
          expect(cardProperties,
              CardProperties.fromJson(cardProperties)!.toJson());
          writeJson("CardProperties", cardProperties);
        });
        test("Extension", () {
          expect(extension, Extension.fromJson(extension)!.toJson());
          writeJson("Extension", extension);
        });
        test("Validity", () {
          expect(validity, RFIDValidity.fromJson(validity)!.toJson());
          writeJson("Validity", validity);
        });
        test("CertificateChain", () {
          expect(certificateChain,
              CertificateChain.fromJson(certificateChain)!.toJson());
          writeJson("CertificateChain", certificateChain);
        });
        test("DataField", () {
          expect(dataField, DataField.fromJson(dataField)!.toJson());
          writeJson("DataField", dataField);
        });
        test("SignerInfo", () {
          expect(signerInfo, SignerInfo.fromJson(signerInfo)!.toJson());
          writeJson("SignerInfo", signerInfo);
        });
        test("SecurityObject", () {
          expect(securityObject,
              SecurityObject.fromJson(securityObject)!.toJson());
          writeJson("SecurityObject", securityObject);
        });
        test("RFIDSessionData", () {
          expect(rfidSessionData,
              RFIDSessionData.fromJson(rfidSessionData)!.toJson());
          writeJson("RFIDSessionData", rfidSessionData);
        });
        test("BytesData", () {
          expect(bytesData, BytesData.fromJson(bytesData)!.toJson());
          writeJson("BytesData", bytesData);
        });
        test("VDSNCData", () {
          expect(vdsncData, VDSNCData.fromJson(vdsncData)!.toJson());
          writeJson("VDSNCData", vdsncData);
        });
      });
      group("status", () {
        test("DetailsOptical", () {
          expect(
              detailsOptical, OpticalStatus.fromJson(detailsOptical)!.toJson());
          writeJson("DetailsOptical", detailsOptical);
        });
        test("DetailsRFID", () {
          expect(detailsRFID, RFIDStatus.fromJson(detailsRFID)!.toJson());
          writeJson("DetailsRFID", detailsRFID);
        });
        test("DocumentReaderResultsStatus", () {
          expect(documentReaderResultsStatus,
              ResultsStatus.fromJson(documentReaderResultsStatus)!.toJson());
          writeJson("DocumentReaderResultsStatus", documentReaderResultsStatus);
        });
      });
      group("visual_results", () {
        test("DocumentReaderComparison", () {
          expect(documentReaderComparison,
              Comparison.fromJson(documentReaderComparison)!.toJson());
          writeJson("DocumentReaderComparison", documentReaderComparison);
        });
        test("Rect", () {
          expect(rect, Rect.fromJson(rect)!.toJson());
          writeJson("Rect", rect);
        });
        test("DocumentReaderGraphicField", () {
          expect(documentReaderGraphicField,
              GraphicField.fromJson(documentReaderGraphicField)!.toJson());
          writeJson("DocumentReaderGraphicField", documentReaderGraphicField);
        });
        test("DocumentReaderGraphicResult", () {
          expect(documentReaderGraphicResult,
              GraphicResult.fromJson(documentReaderGraphicResult)!.toJson());
          writeJson("DocumentReaderGraphicResult", documentReaderGraphicResult);
        });
        test("DocumentReaderRFIDOrigin", () {
          expect(documentReaderRFIDOrigin,
              RFIDOrigin.fromJson(documentReaderRFIDOrigin)!.toJson());
          writeJson("DocumentReaderRFIDOrigin", documentReaderRFIDOrigin);
        });
        test("DocumentReaderSymbol", () {
          expect(documentReaderSymbol,
              Symbol.fromJson(documentReaderSymbol)!.toJson());
          writeJson("DocumentReaderSymbol", documentReaderSymbol);
        });
        test("DocumentReaderValidity", () {
          expect(documentReaderValidity,
              Validity.fromJson(documentReaderValidity)!.toJson());
          writeJson("DocumentReaderValidity", documentReaderValidity);
        });
        test("DocumentReaderValue", () {
          expect(documentReaderValue,
              Value.fromJson(documentReaderValue)!.toJson());
          writeJson("DocumentReaderValue", documentReaderValue);
        });
        test("DocumentReaderTextField", () {
          expect(documentReaderTextField,
              TextField.fromJson(documentReaderTextField)!.toJson());
          writeJson("DocumentReaderTextField", documentReaderTextField);
        });
        test("DocumentReaderTextSource", () {
          expect(documentReaderTextSource1,
              TextSource.fromJson(documentReaderTextSource1)!.toJson());
          writeJson("DocumentReaderTextSource", documentReaderTextSource1);
        });
        test("DocumentReaderTextResult", () {
          expect(documentReaderTextResult,
              TextResult.fromJson(documentReaderTextResult)!.toJson());
          writeJson("DocumentReaderTextResult", documentReaderTextResult);
        });
      });

      var documentReaderDocumentType = {
        "name": "test1",
        "documentID": 1,
        "ICAOCode": "test2",
        "FDSID": [1, 2, 3],
        "dType": 11,
        "dFormat": 2,
        "dMRZ": true,
        "isDeprecated": false,
        "dDescription": "test3",
        "dYear": "test4",
        "dCountryName": "test5",
        "pageIndex": 3,
      };
      var coordinate = {
        "x": 1,
        "y": 2,
      };
      var elementPosition = {
        "docFormat": 0,
        "resultStatus": 1,
        "width": 2,
        "height": 3,
        "angle": 0.5,
        "dpi": 4,
        "inverse": 5,
        "perspectiveTr": 6,
        "objArea": 7,
        "objIntAngleDev": 8,
        "pageIndex": 9,
        "center": coordinate,
        "leftTop": coordinate,
        "leftBottom": coordinate,
        "rightTop": coordinate,
        "rightBottom": coordinate,
      };
      var documentReaderResults = {
        "chipPage": 0,
        "processingFinishedStatus": 2,
        "elapsedTime": 3,
        "elapsedTimeRFID": 4,
        "morePagesAvailable": 5,
        "graphicResult": documentReaderGraphicResult,
        "textResult": documentReaderTextResult,
        "documentPosition": [elementPosition],
        "barcodePosition": [elementPosition, elementPosition],
        "mrzPosition": [elementPosition, elementPosition, elementPosition],
        "imageQuality": [
          imageQualityGroup,
          imageQualityGroup,
          imageQualityGroup
        ],
        "documentType": [
          documentReaderDocumentType,
          documentReaderDocumentType,
          documentReaderDocumentType
        ],
        "rawResult": "test2",
        "rfidSessionData": rfidSessionData,
        "authenticityResult": documentReaderAuthenticityResult,
        "barcodeResult": documentReaderBarcodeResult,
        "status": documentReaderResultsStatus,
        "vdsncData": vdsncData,
      };
      test("DocumentReaderDocumentType", () {
        expect(documentReaderDocumentType,
            DocumentType.fromJson(documentReaderDocumentType)!.toJson());
        writeJson("DocumentReaderDocumentType", documentReaderDocumentType);
      });
      test("Coordinate", () {
        expect(coordinate, Coordinate.fromJson(coordinate)!.toJson());
        writeJson("Coordinate", coordinate);
      });
      test("ElementPosition", () {
        expect(elementPosition,
            ElementPosition.fromJson(elementPosition)!.toJson());
        writeJson("ElementPosition", elementPosition);
      });
      test("DocumentReaderResults", () {
        expect(documentReaderResults,
            Results.fromJson(documentReaderResults)!.toJson());
        writeJson("DocumentReaderResults", documentReaderResults);
      });
    });
    group("rfid", () {
      var documentReaderNotification = {
        "notificationCode": 65536,
        "dataFileType": 1,
        "progress": 2
      };
      var paAttribute = {
        "type": "test1",
        "value": "test2",
      };
      var paResourcesIssuer = {
        "data": img1,
        "friendlyName": "test",
        "attributes": [paAttribute, paAttribute, paAttribute],
      };
      var pkdCertificate = {
        "binaryData": img1,
        "resourceType": 0,
        "privateKey": img2,
      };
      var taChallenge = {
        "data": img1,
        "auxPCD": "test1",
        "challengePICC": "test2",
        "hashPK": "test3",
        "idPICC": "test4",
      };
      var tccParams = {
        "serviceUrlTA": "test1",
        "serviceUrlPA": "test2",
        "pfxCertUrl": "test3",
        "pfxPassPhrase": "test4",
        "pfxCert": img1
      };
      test("DocumentReaderNotification", () {
        expect(documentReaderNotification,
            RFIDNotification.fromJson(documentReaderNotification)!.toJson());
        writeJson("DocumentReaderNotification", documentReaderNotification);
      });
      test("PAAttribute", () {
        expect(paAttribute, PAAttribute.fromJson(paAttribute)!.toJson());
        writeJson("PAAttribute", paAttribute);
      });
      test("PAResourcesIssuer", () {
        expect(paResourcesIssuer,
            PAResourcesIssuer.fromJson(paResourcesIssuer)!.toJson());
        writeJson("PAResourcesIssuer", paResourcesIssuer);
      });
      test("PKDCertificate", () {
        expect(
            pkdCertificate, PKDCertificate.fromJson(pkdCertificate)!.toJson());
        writeJson("PKDCertificate", pkdCertificate);
      });
      test("TAChallenge", () {
        expect(taChallenge, TAChallenge.fromJson(taChallenge)!.toJson());
        writeJson("TAChallenge", taChallenge);
      });
      test("TccParams", () {
        expect(tccParams, TccParams.fromJson(tccParams)!.toJson());
        writeJson("TccParams", tccParams);
      });
    });
  });
}

var img1 =
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADElEQVQIHWP4//8/AAX+Av6fyi0TAAAAAElFTkSuQmCC";
var img2 =
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII=";
var img3 =
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADUlEQVQIHWP4z8BQDwAEgAF/OENMJgAAAABJRU5ErkJggg==";
