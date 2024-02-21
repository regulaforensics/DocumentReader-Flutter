var useOldXcode = true;

var img1 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADElEQVQIHWP4//8/AAX+Av6fyi0TAAAAAElFTkSuQmCC"
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAxJREFUCB1j+P//PwAF/gL+n8otEwAAAABJRU5ErkJggg==";
var img2 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII="
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAtJREFUCB1jYAACAAAFAAGNu5vzAAAAAElFTkSuQmCC";
var img3 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADUlEQVQIHWP4z8BQDwAEgAF/OENMJgAAAABJRU5ErkJggg=="
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAA1JREFUCB1j+M/AUA8ABIABfzhDTCYAAAAASUVORK5CYII=";

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
var livenessParams = {
  "checkOVI": true,
  "checkMLI": false,
  "checkHolo": true,
  "checkED": false,
};
var authenticityParams = {
  "useLivenessCheck": true,
  "checkUVLuminiscence": false,
  "checkIRB900": true,
  "checkImagePatterns": false,
  "checkFibers": true,
  "checkExtMRZ": false,
  "checkExtOCR": true,
  "checkAxial": false,
  "checkBarcodeFormat": true,
  "checkIRVisibility": false,
  "checkIPI": true,
  "checkPhotoEmbedding": false,
  "checkPhotoComparison": true,
  "checkLetterScreen": false,
  "livenessParams": livenessParams
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
  "screenCapture": false,
  "expectedPass": [1, 2, 3],
  "glaresCheckParams": glaresCheckParams,
  "brightnessThreshold": 0.5
};
var rfidParams = {
  "paIgnoreNotificationCodes": [1, 2, 3]
};
var backendProcessingConfig = {
  "url": "test",
  "rfidServerSideChipVerification": true,
  "httpHeaders": {"key1": "val1", "key2": "val2", "key3": "val3"}
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
  "checkRequiredTextFields": false,
  "depersonalizeLog": true,
  "generateDoublePageSpreadImage": false,
  "alreadyCropped": true,
  "matchTextFieldMask": false,
  "updateOCRValidityByGlare": false,
  "noGraphics": true,
  "multiDocOnImage": false,
  "forceReadMrzBeforeLocate": true,
  "parseBarcodes": false,
  "shouldReturnPackageForReprocess": true,
  "disablePerforationOCR": false,
  "respectImageQuality": true,
  "splitNames": false,
  "useFaceApi": false,
  "useAuthenticityCheck": true,
  "checkHologram": false,
  "measureSystem": 1,
  "barcodeParserType": 3,
  "perspectiveAngle": 4,
  "minDPI": 5,
  "imageDpiOutMax": 6,
  "forceDocID": 6,
  "forceDocFormat": 3,
  "shiftExpiryDate": 9,
  "minimalHolderAge": 10,
  "imageOutputMaxHeight": 11,
  "imageOutputMaxWidth": 12,
  "processAuth": 13,
  "convertCase": 3,
  "dateFormat": "test1",
  "scenario": "Mrz",
  "captureButtonScenario": "Locate",
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
  "lcidIgnoreFilter": [10011, 1078, 1052],
  "lcidFilter": [1118, 5121, 15361],
  "imageQA": imageQA,
  "rfidParams": rfidParams,
  "faceApiParams": faceApiParams,
  "backendProcessingConfig": backendProcessingConfig,
  "authenticityParams": authenticityParams,
  "customParams": {"test1": true, "test2": 1, "test3": "test"},
};
var font1 = {"name": "AppleSDGothicNeo-Thin", "size": 10, "style": 2};
var font2 = {"name": "Copperplate-Light", "size": 20, "style": 1};
var customizationColors = {
  "rfidProcessingScreenBackground": 0xff000000,
  "rfidProcessingScreenHintLabelText": 0xff000001,
  "rfidProcessingScreenHintLabelBackground": 0xff000002,
  "rfidProcessingScreenProgressLabelText": 0xff000003,
  "rfidProcessingScreenProgressBar": 0xff000004,
  "rfidProcessingScreenProgressBarBackground": 0xff000005,
  "rfidProcessingScreenResultLabelText": 0xff000006
};
var customizationFonts = {
  "rfidProcessingScreenHintLabel": font1,
  "rfidProcessingScreenProgressLabel": font2,
  "rfidProcessingScreenResultLabel": font1,
};
var customizationImages = {
  "rfidProcessingScreenFailureImage": img1,
};
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
  "livenessAnimationPositionMultiplier": 9.5,
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
  "livenessAnimationImage": img3,
  "customLabelStatus": "test3",
  "cameraFrameLineCap": 2,
  "uiCustomizationLayer": {"test": "test"},
  "statusTextFont": font1,
  "resultStatusTextFont": font2,
  "helpAnimationImageContentMode": 0,
  "multipageAnimationFrontImageContentMode": 1,
  "multipageAnimationBackImageContentMode": 2,
  "livenessAnimationImageContentMode": 3,
  "borderBackgroundImageContentMode": 4,
  "helpAnimationImageMatrix": [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9],
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
  "livenessAnimationImageMatrix": [4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9],
  "borderBackgroundImageMatrix": [5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9],
  "colors": customizationColors,
  "fonts": customizationFonts,
  "images": customizationImages
};
var cameraSize = {"width": 0, "height": 1};
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
  "cameraSize": cameraSize,
  "videoSessionPreset": 6,
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
  "eDLDataGroups": eDLDataGroups,
  "ePassportDataGroups": ePassportDataGroups,
  "eIDDataGroups": eIDDataGroups,
};

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
  "data": img1,
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

var documentsDatabase = {
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
  "database": documentsDatabase
};
var docReaderScenario = {
  "uvTorch": true,
  "frameOrientation": 2,
  "faceExt": false,
  "multiPageOff": false,
  "seriesProcessMode": true,
  "frameKWHLandscape": 0.5,
  "frameKWHPortrait": 1.5,
  "frameKWHDoublePageSpreadPortrait": 2.5,
  "frameKWHDoublePageSpreadLandscape": 3.5,
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
var docReaderException = {
  "code": 1,
  "message": "test1",
};
var rfidException = {
  "code": 2,
  "message": "test2",
};

var authenticityElement = {
  "status": 1,
  "elementType": 2,
  "elementDiagnose": 3,
  "elementTypeName": "Photo element",
  "elementDiagnoseName": "Error of internal data processing"
};
var authenticityCheck = {
  "type": 2,
  "status": 1,
  "typeName": "IR B900 ink",
  "pageIndex": 3,
  "elements": [authenticityElement, authenticityElement, authenticityElement]
};
var authenticityResult = {
  "status": 1,
  "checks": [authenticityCheck, authenticityCheck, authenticityCheck]
};
var pdf417Info = {
  "errorLevel": 2,
  "columns": 3,
  "rows": 4,
};
var barcodeField = {
  "barcodeType": 5,
  "status": -6001,
  "pageIndex": 2,
  "pdf417Info": pdf417Info,
  "data": img1
};
var barcodeResult = {
  "fields": [barcodeField, barcodeField, barcodeField]
};
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
  "boundRects": [rect, rect, rect],
};
var imageQualityGroup = {
  "count": 1,
  "result": 2,
  "pageIndex": 3,
  "imageQualityList": [imageQuality, imageQuality, imageQuality]
};
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
var rfidValue = {
  "data": "test1",
  "length": 1,
  "status": 2,
  "type": 3,
  "format": "test2",
};
var attribute = {
  "type": "test",
  "value": rfidValue,
};
var authority = {
  "attributes": [attribute, attribute, attribute],
  "data": "test",
  "friendlyName": rfidValue,
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
var rfidValidity = {
  "notAfter": rfidValue,
  "notBefore": rfidValue,
};
var certificateChain = {
  "type": 1,
  "extensions": [extension, extension, extension],
  "fileName": rfidValue,
  "issuer": authority,
  "notifications": [1, 2, 3],
  "origin": 2,
  "paStatus": 3,
  "serialNumber": "test1",
  "signatureAlgorithm": "test2",
  "subject": authority,
  "subjectPKAlgorithm": "test3",
  "validity": rfidValidity,
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
  "serialNumber": rfidValue,
  "signature": rfidValue,
  "subjectKeyIdentifier": rfidValue,
  "signedAttributes": [extension, extension, extension],
  "certificateChain": [certificateChain, certificateChain, certificateChain],
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
  "certificateChain": [certificateChain, certificateChain, certificateChain],
  "notifications": [3000000001, 3000000002, 3000000003],
};
var opticalStatus = {
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
var rfidStatus = {
  "overallStatus": 0,
  "pa": 1,
  "ca": 2,
  "aa": 0,
  "ta": 1,
  "bac": 2,
  "pace": 0,
};
var resultsStatus = {
  "overallStatus": 0,
  "optical": 1,
  "rfid": 2,
  "portrait": 0,
  "stopList": 1,
  "detailsOptical": opticalStatus,
  "detailsRFID": rfidStatus,
};
var comparison = {
  "sourceTypeLeft": 0,
  "sourceTypeRight": 1,
  "status": 2,
};
var graphicField = {
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
var graphicResult = {
  "fields": [graphicField, graphicField, graphicField],
};
var rfidOrigin = {
  "dg": 1,
  "dgTag": 2,
  "entryView": 3,
  "tagEntry": 4,
};
var symbol = {
  "rect": rect,
  "code": 1,
  "probability": 2,
};
var validity = {
  "sourceType": 1,
  "status": 2,
};
var value = {
  "sourceType": 3,
  "value": "test1",
  "originalValue": "test2",
  "pageIndex": 2,
  "boundRect": rect,
  "rfidOrigin": rfidOrigin,
  "originalSymbols": [symbol, symbol, symbol],
  "probability": 1,
};
var textField = {
  "fieldType": 1,
  "fieldName": "Issuing state code",
  "lcid": 10011,
  "lcidName": "Abkhazian (Cyrillic)",
  "value": "test3",
  "getValue": value,
  "values": [value, value, value],
  "status": 2,
  "comparisonList": [comparison, comparison, comparison],
  "validityList": [validity, validity, validity],
  "comparisonStatus": 0,
  "validityStatus": 1,
};
var textSource = {
  "sourceType": validity["sourceType"],
  "source": "sourceType",
  "validityStatus": 1,
};
var documentReaderTextSource2 = {
  "sourceType": comparison["sourceTypeLeft"],
  "source": "sourceTypeLeft",
  "validityStatus": 1,
};
var documentReaderTextSource3 = {
  "sourceType": comparison["sourceTypeRight"],
  "source": "sourceTypeRight",
  "validityStatus": 1,
};
var textResult = {
  "status": 0,
  "comparisonStatus": 1,
  "validityStatus": 2,
  "availableSourceList": [
    textSource,
    documentReaderTextSource2,
    documentReaderTextSource3
  ],
  "fields": [textField, textField, textField],
};
var documentType = {
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
var position = {
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
var transactionInfo = {
  "transactionId": "test1",
  "tag": "test2",
};
var results = {
  "chipPage": 0,
  "processingFinishedStatus": 2,
  "elapsedTime": 3,
  "elapsedTimeRFID": 4,
  "morePagesAvailable": 5,
  "graphicResult": graphicResult,
  "textResult": textResult,
  "documentPosition": [position],
  "barcodePosition": [position, position],
  "mrzPosition": [position, position, position],
  "imageQuality": [imageQualityGroup, imageQualityGroup, imageQualityGroup],
  "documentType": [documentType, documentType, documentType],
  "rawResult": "test2",
  "rfidSessionData": rfidSessionData,
  "authenticityResult": authenticityResult,
  "barcodeResult": barcodeResult,
  "status": resultsStatus,
  "vdsncData": vdsncData,
  "transactionInfo": transactionInfo
};

var rfidNotification = {
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
