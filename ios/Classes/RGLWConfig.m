//
//  RGLWConfig.m
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLWConfig.h"

@implementation RGLWConfig

+(void)setFunctionality:(NSDictionary*)options :(RGLFunctionality*)functionality {
    // Boolean
    if([options valueForKey:@"showTorchButton"] != nil)
        functionality.showTorchButton = [[options valueForKey:@"showTorchButton"] boolValue];
    if([options valueForKey:@"showCloseButton"] != nil)
        functionality.showCloseButton = [[options valueForKey:@"showCloseButton"] boolValue];
    if([options valueForKey:@"videoCaptureMotionControl"] != nil)
        functionality.videoCaptureMotionControl = [[options valueForKey:@"videoCaptureMotionControl"] boolValue];
    if([options valueForKey:@"showCaptureButton"] != nil)
        functionality.showCaptureButton = [[options valueForKey:@"showCaptureButton"] boolValue];
    if([options valueForKey:@"showChangeFrameButton"] != nil)
        functionality.showChangeFrameButton = [[options valueForKey:@"showChangeFrameButton"] boolValue];
    if([options valueForKey:@"showSkipNextPageButton"] != nil)
        functionality.showSkipNextPageButton = [[options valueForKey:@"showSkipNextPageButton"] boolValue];
    if([options valueForKey:@"useAuthenticator"] != nil)
        functionality.useAuthenticator = [[options valueForKey:@"useAuthenticator"] boolValue];
    if([options valueForKey:@"skipFocusingFrames"] != nil)
        functionality.skipFocusingFrames = [[options valueForKey:@"skipFocusingFrames"] boolValue];
    if([options valueForKey:@"showCameraSwitchButton"] != nil)
        functionality.showCameraSwitchButton = [[options valueForKey:@"showCameraSwitchButton"] boolValue];
    if([options valueForKey:@"displayMetadata"] != nil)
        functionality.showMetadataInfo = [[options valueForKey:@"displayMetadata"] boolValue];
    if([options valueForKey:@"isZoomEnabled"] != nil)
        functionality.isZoomEnabled = [[options valueForKey:@"isZoomEnabled"] boolValue];
    if([options valueForKey:@"recordScanningProcess"] != nil)
        functionality.recordScanningProcess = [[options valueForKey:@"recordScanningProcess"] boolValue];
    if([options valueForKey:@"manualMultipageMode"] != nil)
        functionality.manualMultipageMode = [[options valueForKey:@"manualMultipageMode"] boolValue];
    if([options valueForKey:@"singleResult"] != nil)
        functionality.singleResult = [[options valueForKey:@"singleResult"] boolValue];
    
    // Int
    if([options valueForKey:@"showCaptureButtonDelayFromDetect"] != nil)
        functionality.showCaptureButtonDelayFromDetect = [[options valueForKey:@"showCaptureButtonDelayFromDetect"] doubleValue];
    if([options valueForKey:@"showCaptureButtonDelayFromStart"] != nil)
        functionality.showCaptureButtonDelayFromStart = [[options valueForKey:@"showCaptureButtonDelayFromStart"] doubleValue];
    if([options valueForKey:@"forcePagesCount"] != nil)
        functionality.forcePagesCount = [options valueForKey:@"forcePagesCount"];
    if([options valueForKey:@"orientation"] != nil)
        functionality.orientation = [self interfaceOrientationMaskWithNumber:[options valueForKey:@"orientation"]];
    if([options valueForKey:@"captureMode"] != nil)
        functionality.captureMode = [[options valueForKey:@"captureMode"] integerValue];
    if(options[@"cameraPositionIOS"])
        functionality.cameraPosition = [options[@"cameraPositionIOS"] integerValue];
    
    // String
    if([options valueForKey:@"cameraFrame"] != nil)
        functionality.cameraFrame = [self docReaderFrameWithString:[options valueForKey:@"cameraFrame"]];
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if([options valueForKey:@"btDeviceName"] != nil)
        functionality.btDeviceName = [options valueForKey:@"btDeviceName"];
#pragma clang diagnostic pop
    
    // Float
    if([options valueForKey:@"zoomFactor"] != nil)
        functionality.zoomFactor = [[options valueForKey:@"zoomFactor"] floatValue];
    
    // Custom
    // in android - cameraSize
    if([options valueForKey:@"videoSessionPreset"] != nil)
        functionality.videoSessionPreset = [self captureSessionPresetWithNumber:[options valueForKey:@"videoSessionPreset"]];
    if([options valueForKey:@"videoOutputSettings"] != nil)
        functionality.videoOutputSettings = [options valueForKey:@"videoOutputSettings"];
}

+(NSDictionary*)getFunctionality:(RGLFunctionality*)functionality {
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    // Boolean
    result[@"showTorchButton"] = [NSNumber numberWithBool:functionality.showTorchButton];
    result[@"showCloseButton"] = [NSNumber numberWithBool:functionality.showCloseButton];
    result[@"videoCaptureMotionControl"] = [NSNumber numberWithBool:functionality.videoCaptureMotionControl];
    result[@"showCaptureButton"] = [NSNumber numberWithBool:functionality.showCaptureButton];
    result[@"showChangeFrameButton"] = [NSNumber numberWithBool:functionality.showChangeFrameButton];
    result[@"showSkipNextPageButton"] = [NSNumber numberWithBool:functionality.showSkipNextPageButton];
    result[@"useAuthenticator"] = [NSNumber numberWithBool:functionality.isUseAuthenticator];
    result[@"skipFocusingFrames"] = [NSNumber numberWithBool:functionality.skipFocusingFrames];
    result[@"showCameraSwitchButton"] = [NSNumber numberWithBool:functionality.showCameraSwitchButton];
    result[@"displayMetadata"] = [NSNumber numberWithBool:functionality.showMetadataInfo];
    result[@"isZoomEnabled"] = [NSNumber numberWithBool:functionality.isZoomEnabled];
    result[@"recordScanningProcess"] = [NSNumber numberWithBool:functionality.recordScanningProcess];
    result[@"manualMultipageMode"] = [NSNumber numberWithBool:functionality.manualMultipageMode];
    result[@"singleResult"] = [NSNumber numberWithBool:functionality.singleResult];
    
    // Int
    result[@"showCaptureButtonDelayFromDetect"] = [NSNumber numberWithDouble:functionality.showCaptureButtonDelayFromDetect];
    result[@"showCaptureButtonDelayFromStart"] = [NSNumber numberWithDouble:functionality.showCaptureButtonDelayFromStart];
    result[@"forcePagesCount"] = functionality.forcePagesCount;
    result[@"orientation"] = [self generateInterfaceOrientationMask:functionality.orientation];
    result[@"captureMode"] = [NSNumber numberWithInteger:functionality.captureMode];
    result[@"cameraPositionIOS"] = @(functionality.cameraPosition);
    
    // String
    result[@"cameraFrame"] = [self generateDocReaderFrame:functionality.cameraFrame];
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    result[@"btDeviceName"] = functionality.btDeviceName;
#pragma clang diagnostic pop
    
    // Float
    result[@"zoomFactor"] = [NSNumber numberWithFloat:functionality.zoomFactor];
    
    // Custom
    // in android - cameraSize
    result[@"videoSessionPreset"] = [self generateCaptureSessionPreset:functionality.videoSessionPreset];
    result[@"videoOutputSettings"] = functionality.videoOutputSettings;
    
    return result;
}

+(void)setProcessParams:(NSDictionary*)options :(RGLProcessParams*)processParams {
    
    // Boolean
    if([options valueForKey:@"multipageProcessing"] != nil)
        processParams.multipageProcessing = [options valueForKey:@"multipageProcessing"];
    if([options valueForKey:@"logs"] != nil)
        processParams.logs = [options valueForKey:@"logs"];
    if([options valueForKey:@"debugSaveImages"] != nil)
        processParams.debugSaveImages = [options valueForKey:@"debugSaveImages"];
    if([options valueForKey:@"debugSaveLogs"] != nil)
        processParams.debugSaveLogs = [options valueForKey:@"debugSaveLogs"];
    if([options valueForKey:@"returnUncroppedImage"] != nil)
        processParams.returnUncroppedImage = [options valueForKey:@"returnUncroppedImage"];
    if([options valueForKey:@"debugSaveCroppedImages"] != nil)
        processParams.debugSaveCroppedImages = [options valueForKey:@"debugSaveCroppedImages"];
    if([options valueForKey:@"disableFocusingCheck"] != nil)
        processParams.disableFocusingCheck = [options valueForKey:@"disableFocusingCheck"];
    if([options valueForKey:@"debugSaveRFIDSession"] != nil)
        processParams.debugSaveRFIDSession = [options valueForKey:@"debugSaveRFIDSession"];
    if([options valueForKey:@"doublePageSpread"] != nil)
        processParams.doublePageSpread = [options valueForKey:@"doublePageSpread"];
    if([options valueForKey:@"manualCrop"] != nil)
        processParams.manualCrop = [options valueForKey:@"manualCrop"];
    if([options valueForKey:@"integralImage"] != nil)
        processParams.integralImage = [options valueForKey:@"integralImage"];
    if([options valueForKey:@"returnCroppedBarcode"] != nil)
        processParams.returnCroppedBarcode = [options valueForKey:@"returnCroppedBarcode"];
    if([options valueForKey:@"checkRequiredTextFields"] != nil)
        processParams.checkRequiredTextFields = [options valueForKey:@"checkRequiredTextFields"];
    if([options valueForKey:@"depersonalizeLog"] != nil)
        processParams.depersonalizeLog = [options valueForKey:@"depersonalizeLog"];
    if([options valueForKey:@"generateDoublePageSpreadImage"] != nil)
        processParams.generateDoublePageSpreadImage = [options valueForKey:@"generateDoublePageSpreadImage"];
    if([options valueForKey:@"alreadyCropped"] != nil)
        processParams.alreadyCropped = [options valueForKey:@"alreadyCropped"];
    if([options valueForKey:@"matchTextFieldMask"] != nil)
        processParams.matchTextFieldMask = [options valueForKey:@"matchTextFieldMask"];
    if([options valueForKey:@"updateOCRValidityByGlare"] != nil)
        processParams.updateOCRValidityByGlare = [options valueForKey:@"updateOCRValidityByGlare"];
    if([options valueForKey:@"noGraphics"] != nil)
        processParams.noGraphics = [options valueForKey:@"noGraphics"];
    if([options valueForKey:@"multiDocOnImage"] != nil)
        processParams.multiDocOnImage = [options valueForKey:@"multiDocOnImage"];
    if([options valueForKey:@"forceReadMrzBeforeLocate"] != nil)
        processParams.forceReadMrzBeforeLocate = [options valueForKey:@"forceReadMrzBeforeLocate"];
    if([options valueForKey:@"parseBarcodes"] != nil)
        processParams.parseBarcodes = [options valueForKey:@"parseBarcodes"];
    if([options valueForKey:@"shouldReturnPackageForReprocess"] != nil)
        processParams.shouldReturnPackageForReprocess = [options valueForKey:@"shouldReturnPackageForReprocess"];
    if([options valueForKey:@"disablePerforationOCR"] != nil)
        processParams.disablePerforationOCR = [options valueForKey:@"disablePerforationOCR"];
    if([options valueForKey:@"respectImageQuality"] != nil)
        processParams.respectImageQuality = [options valueForKey:@"respectImageQuality"];
    if([options valueForKey:@"splitNames"] != nil)
        processParams.splitNames = [options valueForKey:@"splitNames"];
    if([options valueForKey:@"doDetectCan"] != nil)
        processParams.doDetectCan = [options valueForKey:@"doDetectCan"];
    if([options valueForKey:@"useFaceApi"] != nil)
        processParams.useFaceApi = [options valueForKey:@"useFaceApi"];
    if([options valueForKey:@"useAuthenticityCheck"] != nil)
        processParams.useAuthenticityCheck = [options valueForKey:@"useAuthenticityCheck"];
    if([options valueForKey:@"checkHologram"] != nil)
        processParams.checkHologram = [options valueForKey:@"checkHologram"];
    if (options[@"generateNumericCodes"]) processParams.generateNumericCodes = options[@"generateNumericCodes"];

    // Int
    if([options valueForKey:@"measureSystem"] != nil)
        processParams.measureSystem = [[options valueForKey:@"measureSystem"] integerValue];
    if([options valueForKey:@"barcodeParserType"] != nil)
        processParams.barcodeParserType = [options valueForKey:@"barcodeParserType"];
    if([options valueForKey:@"perspectiveAngle"] != nil)
        processParams.perspectiveAngle = [options valueForKey:@"perspectiveAngle"];
    if([options valueForKey:@"minDPI"] != nil)
        processParams.minDPI = [options valueForKey:@"minDPI"];
    if([options valueForKey:@"imageDpiOutMax"] != nil)
        processParams.imageDpiOutMax = [options valueForKey:@"imageDpiOutMax"];
    if([options valueForKey:@"forceDocID"] != nil)
        processParams.forceDocID = [options valueForKey:@"forceDocID"];
    if([options valueForKey:@"forceDocFormat"] != nil)
        processParams.forceDocFormat = [options valueForKey:@"forceDocFormat"];
    if([options valueForKey:@"shiftExpiryDate"] != nil)
        processParams.shiftExpiryDate = [options valueForKey:@"shiftExpiryDate"];
    if([options valueForKey:@"minimalHolderAge"] != nil)
        processParams.minimalHolderAge = [options valueForKey:@"minimalHolderAge"];
    if([options valueForKey:@"imageOutputMaxHeight"] != nil)
        processParams.imageOutputMaxHeight = [options valueForKey:@"imageOutputMaxHeight"];
    if([options valueForKey:@"imageOutputMaxWidth"] != nil)
        processParams.imageOutputMaxWidth = [options valueForKey:@"imageOutputMaxWidth"];
    if([options valueForKey:@"processAuth"] != nil)
        processParams.processAuth = [options valueForKey:@"processAuth"];
    if([options valueForKey:@"convertCase"] != nil)
        processParams.convertCase = [self textProcessingWithNumber:[options valueForKey:@"convertCase"]];
    if(options[@"logLevel"]) processParams.logLevel = options[@"logLevel"];
    if(options[@"mrzDetectMode"]) processParams.mrzDetectMode = options[@"mrzDetectMode"];

    // String
    if([options valueForKey:@"dateFormat"] != nil)
        processParams.dateFormat = [options valueForKey:@"dateFormat"];
    if([options valueForKey:@"scenario"] != nil)
        processParams.scenario = [options valueForKey:@"scenario"];
    if([options valueForKey:@"captureButtonScenario"] != nil)
        processParams.captureButtonScenario = [options valueForKey:@"captureButtonScenario"];

    // Double
    if([options valueForKey:@"timeout"] != nil)
        processParams.timeout = [options valueForKey:@"timeout"];
    if([options valueForKey:@"timeoutFromFirstDetect"] != nil)
        processParams.timeoutFromFirstDetect = [options valueForKey:@"timeoutFromFirstDetect"];
    if([options valueForKey:@"timeoutFromFirstDocType"] != nil)
        processParams.timeoutFromFirstDocType = [options valueForKey:@"timeoutFromFirstDocType"];
    if([options valueForKey:@"documentAreaMin"] != nil)
        processParams.documentAreaMin = [options valueForKey:@"documentAreaMin"];
    if([options valueForKey:@"timeoutLiveness"] != nil)
        processParams.timeoutLiveness = [options valueForKey:@"timeoutLiveness"];

    // JSONArray
    if([options valueForKey:@"documentIDList"] != nil)
        processParams.documentIDList = [options valueForKey:@"documentIDList"];
    if([options valueForKey:@"fieldTypesFilter"] != nil)
        processParams.fieldTypesFilter = [options valueForKey:@"fieldTypesFilter"];
    if([options valueForKey:@"barcodeTypes"] != nil)
        processParams.barcodeTypes = [options valueForKey:@"barcodeTypes"];
    if([options valueForKey:@"resultTypeOutput"] != nil)
        processParams.resultTypeOutput = [options valueForKey:@"resultTypeOutput"];
    if([options valueForKey:@"mrzFormatsFilter"] != nil)
        processParams.mrzFormatsFilter = [options valueForKey:@"mrzFormatsFilter"];
    if([options valueForKey:@"documentGroupFilter"] != nil)
        processParams.documentGroupFilter = [options mutableArrayValueForKey:@"documentGroupFilter"];
    if([options valueForKey:@"lcidIgnoreFilter"] != nil)
        processParams.lcidIgnoreFilter = [options mutableArrayValueForKey:@"lcidIgnoreFilter"];
    if([options valueForKey:@"lcidFilter"] != nil)
        processParams.lcidFilter = [options mutableArrayValueForKey:@"lcidFilter"];

    // JSONObject
    if([options valueForKey:@"imageQA"] != nil)
        [self setImageQA:processParams.imageQA input:[options valueForKey:@"imageQA"]];
    if([options valueForKey:@"rfidParams"] != nil)
        processParams.rfidParams = [RGLWJSONConstructor rfidParamsFromJson:[options valueForKey:@"rfidParams"]];
    if([options valueForKey:@"faceApiParams"] != nil)
        processParams.faceApiParams = [RGLWJSONConstructor faceAPIParamsFromJson:[options valueForKey:@"faceApiParams"]];
    if([options valueForKey:@"backendProcessingConfig"] != nil)
        processParams.backendProcessingConfig = [RGLWJSONConstructor backendProcessingConfigFromJson:[options valueForKey:@"backendProcessingConfig"]];
    if([options valueForKey:@"authenticityParams"] != nil) {
        if(processParams.authenticityParams == nil) processParams.authenticityParams = [RGLAuthenticityParams defaultParams];
        [self setAuthenticityParams:processParams.authenticityParams input:[options valueForKey:@"authenticityParams"]];
    }

    // Custom
    if([options valueForKey:@"customParams"] != nil)
        processParams.customParams = [options valueForKey:@"customParams"];
}

+(NSDictionary*)getProcessParams:(RGLProcessParams*)processParams {
    NSMutableDictionary *result = [NSMutableDictionary new];

    // Boolean
    result[@"multipageProcessing"] = processParams.multipageProcessing;
    result[@"logs"] = processParams.logs;
    result[@"debugSaveImages"] = processParams.debugSaveImages;
    result[@"debugSaveLogs"] = processParams.debugSaveLogs;
    result[@"returnUncroppedImage"] = processParams.returnUncroppedImage;
    result[@"debugSaveCroppedImages"] = processParams.debugSaveCroppedImages;
    result[@"disableFocusingCheck"] = processParams.disableFocusingCheck;
    result[@"debugSaveRFIDSession"] = processParams.debugSaveRFIDSession;
    result[@"doublePageSpread"] = processParams.doublePageSpread;
    result[@"manualCrop"] = processParams.manualCrop;
    result[@"integralImage"] = processParams.integralImage;
    result[@"returnCroppedBarcode"] = processParams.returnCroppedBarcode;
    result[@"checkRequiredTextFields"] = processParams.checkRequiredTextFields;
    result[@"depersonalizeLog"] = processParams.depersonalizeLog;
    result[@"generateDoublePageSpreadImage"] = processParams.generateDoublePageSpreadImage;
    result[@"alreadyCropped"] = processParams.alreadyCropped;
    result[@"matchTextFieldMask"] = processParams.matchTextFieldMask;
    result[@"updateOCRValidityByGlare"] = processParams.updateOCRValidityByGlare;
    result[@"noGraphics"] = processParams.noGraphics;
    result[@"multiDocOnImage"] = processParams.multiDocOnImage;
    result[@"forceReadMrzBeforeLocate"] = processParams.forceReadMrzBeforeLocate;
    result[@"parseBarcodes"] = processParams.parseBarcodes;
    result[@"shouldReturnPackageForReprocess"] = processParams.shouldReturnPackageForReprocess;
    result[@"disablePerforationOCR"] = processParams.disablePerforationOCR;
    result[@"respectImageQuality"] = processParams.respectImageQuality;
    result[@"splitNames"] = processParams.splitNames;
    result[@"doDetectCan"] = processParams.doDetectCan;
    result[@"useFaceApi"] = processParams.useFaceApi;
    result[@"useAuthenticityCheck"] = processParams.useAuthenticityCheck;
    result[@"checkHologram"] = processParams.checkHologram;
    result[@"generateNumericCodes"] = processParams.generateNumericCodes;
    
    // Int
    result[@"measureSystem"] = [NSNumber numberWithInteger:processParams.measureSystem];
    result[@"barcodeParserType"] = processParams.barcodeParserType;
    result[@"perspectiveAngle"] = processParams.perspectiveAngle;
    result[@"minDPI"] = processParams.minDPI;
    result[@"imageDpiOutMax"] = processParams.imageDpiOutMax;
    result[@"forceDocID"] = processParams.forceDocID;
    result[@"forceDocFormat"] = processParams.forceDocFormat;
    result[@"shiftExpiryDate"] = processParams.shiftExpiryDate;
    result[@"minimalHolderAge"] = processParams.minimalHolderAge;
    result[@"imageOutputMaxHeight"] = processParams.imageOutputMaxHeight;
    result[@"imageOutputMaxWidth"] = processParams.imageOutputMaxWidth;
    result[@"processAuth"] = processParams.processAuth;
    result[@"convertCase"] = [self generateWithTextProcessing:processParams.convertCase];
    result[@"logLevel"] = processParams.logLevel;
    result[@"mrzDetectMode"] = processParams.mrzDetectMode;
    
    // String
    result[@"dateFormat"] = processParams.dateFormat;
    result[@"scenario"] = processParams.scenario;
    result[@"captureButtonScenario"] = processParams.captureButtonScenario;
    result[@"sessionLogFolder"] = processParams.sessionLogFolder;
    
    // Double
    result[@"timeout"] = processParams.timeout;
    result[@"timeoutFromFirstDetect"] = processParams.timeoutFromFirstDetect;
    result[@"timeoutFromFirstDocType"] = processParams.timeoutFromFirstDocType;
    result[@"documentAreaMin"] = processParams.documentAreaMin;
    result[@"timeoutLiveness"] = processParams.timeoutLiveness;
    
    // JSONArray
    result[@"documentIDList"] = processParams.documentIDList;
    result[@"barcodeTypes"] = processParams.barcodeTypes;
    result[@"fieldTypesFilter"] = processParams.fieldTypesFilter;
    result[@"documentGroupFilter"] = processParams.documentGroupFilter;
    result[@"lcidIgnoreFilter"] = processParams.lcidIgnoreFilter;
    result[@"lcidFilter"] = processParams.lcidFilter;
    result[@"mrzFormatsFilter"] = processParams.mrzFormatsFilter;
    result[@"resultTypeOutput"] = processParams.resultTypeOutput;
    
    // JSONObject
    result[@"imageQA"] = [self getImageQA:processParams.imageQA];
    result[@"rfidParams"] = [RGLWJSONConstructor generateRFIDParams:processParams.rfidParams];
    result[@"faceApiParams"] = [RGLWJSONConstructor generateFaceAPIParams:processParams.faceApiParams];
    result[@"backendProcessingConfig"] = [RGLWJSONConstructor generateBackendProcessingConfig:processParams.backendProcessingConfig];
    result[@"authenticityParams"] = [self getAuthenticityParams:processParams.authenticityParams];
    
    // Custom
    result[@"customParams"] = processParams.customParams;
    
    return result;
}

+(void)setCustomization:(NSDictionary*)options :(RGLCustomization*)customization {
    // Boolean
    if([options valueForKey:@"showStatusMessages"] != nil)
        customization.showStatusMessages = [[options valueForKey:@"showStatusMessages"] boolValue];
    if([options valueForKey:@"showResultStatusMessages"] != nil)
        customization.showResultStatusMessages = [[options valueForKey:@"showResultStatusMessages"] boolValue];
    if([options valueForKey:@"showHelpAnimation"] != nil)
        customization.showHelpAnimation = [[options valueForKey:@"showHelpAnimation"] boolValue];
    if([options valueForKey:@"showNextPageAnimation"] != nil)
        customization.showNextPageAnimation = [[options valueForKey:@"showNextPageAnimation"] boolValue];
    if([options valueForKey:@"showBackgroundMask"] != nil)
        customization.showBackgroundMask = [[options valueForKey:@"showBackgroundMask"] boolValue];
    
    // Int
    if([options valueForKey:@"cameraFrameBorderWidth"] != nil)
        customization.cameraFrameBorderWidth = [[options valueForKey:@"cameraFrameBorderWidth"] floatValue];
    if([options valueForKey:@"cameraFrameLineLength"] != nil)
        customization.cameraFrameLineLength = [[options valueForKey:@"cameraFrameLineLength"] floatValue];
    if([options valueForKey:@"cameraFrameShapeType"] != nil)
        customization.cameraFrameShapeType = [[options valueForKey:@"cameraFrameShapeType"] integerValue];
    if([options valueForKey:@"cameraFrameOffsetWidth"] != nil)
        customization.cameraFrameOffsetWidth = [[options valueForKey:@"cameraFrameOffsetWidth"] floatValue];
    
    // String
    if([options valueForKey:@"status"] != nil)
        customization.status = [options valueForKey:@"status"];
    if([options valueForKey:@"resultStatus"] != nil)
        customization.resultStatus = [options valueForKey:@"resultStatus"];
    
    // Color
    if([options valueForKey:@"cameraFrameDefaultColor"] != nil)
        customization.cameraFrameDefaultColor = [self colorWithInt:[options valueForKey:@"cameraFrameDefaultColor"]];
    if([options valueForKey:@"cameraFrameActiveColor"] != nil)
        customization.cameraFrameActiveColor = [self colorWithInt:[options valueForKey:@"cameraFrameActiveColor"]];
    if([options valueForKey:@"statusTextColor"] != nil)
        customization.statusTextColor = [self colorWithInt:[options valueForKey:@"statusTextColor"]];
    if([options valueForKey:@"resultStatusTextColor"] != nil)
        customization.resultStatusTextColor = [self colorWithInt:[options valueForKey:@"resultStatusTextColor"]];
    if([options valueForKey:@"resultStatusBackgroundColor"] != nil)
        customization.resultStatusBackgroundColor = [self colorWithInt:[options valueForKey:@"resultStatusBackgroundColor"]];
    if([options valueForKey:@"multipageButtonBackgroundColor"] != nil)
        customization.multipageButtonBackgroundColor = [self colorWithInt:[options valueForKey:@"multipageButtonBackgroundColor"]];
    if([options valueForKey:@"tintColor"] != nil)
        customization.tintColor = [self colorWithInt:[options valueForKey:@"tintColor"]];
    if([options valueForKey:@"activityIndicatorColor"] != nil)
        customization.activityIndicatorColor = [self colorWithInt:[options valueForKey:@"activityIndicatorColor"]];
    if([options valueForKey:@"statusBackgroundColor"] != nil)
        customization.statusBackgroundColor = [self colorWithInt:[options valueForKey:@"statusBackgroundColor"]];
    if([options valueForKey:@"cameraPreviewBackgroundColor"] != nil)
        customization.cameraPreviewBackgroundColor = [self colorWithInt:[options valueForKey:@"cameraPreviewBackgroundColor"]];
    
    // Float
    if([options valueForKey:@"statusPositionMultiplier"] != nil)
        customization.statusPositionMultiplier = [[options valueForKey:@"statusPositionMultiplier"] floatValue];
    if([options valueForKey:@"resultStatusPositionMultiplier"] != nil)
        customization.resultStatusPositionMultiplier = [[options valueForKey:@"resultStatusPositionMultiplier"] floatValue];
    if([options valueForKey:@"toolbarSize"] != nil)
        customization.toolbarSize = [[options valueForKey:@"toolbarSize"] floatValue];
    if([options valueForKey:@"backgroundMaskAlpha"] != nil)
        customization.backgroundMaskAlpha = [[options valueForKey:@"backgroundMaskAlpha"] floatValue];
    if([options valueForKey:@"customStatusPositionMultiplier"] != nil)
        customization.customStatusPositionMultiplier = [[options valueForKey:@"customStatusPositionMultiplier"] floatValue];
    if([options valueForKey:@"cameraFrameVerticalPositionMultiplier"] != nil)
        customization.cameraFrameVerticalPositionMultiplier = [[options valueForKey:@"cameraFrameVerticalPositionMultiplier"] floatValue];
    if([options valueForKey:@"cameraFrameLandscapeAspectRatio"] != nil)
        customization.cameraFrameLandscapeAspectRatio = [[options valueForKey:@"cameraFrameLandscapeAspectRatio"] floatValue];
    if([options valueForKey:@"cameraFramePortraitAspectRatio"] != nil)
        customization.cameraFramePortraitAspectRatio = [[options valueForKey:@"cameraFramePortraitAspectRatio"] floatValue];
    if([options valueForKey:@"cameraFrameCornerRadius"] != nil)
        customization.cameraFrameCornerRadius = [[options valueForKey:@"cameraFrameCornerRadius"] floatValue];
    if([options valueForKey:@"livenessAnimationPositionMultiplier"] != nil)
        customization.livenessAnimationPositionMultiplier = [[options valueForKey:@"livenessAnimationPositionMultiplier"] floatValue];
    
    // Drawable
    if([options valueForKey:@"multipageAnimationFrontImage"] != nil)
        customization.multipageAnimationFrontImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"multipageAnimationFrontImage"]];
    if([options valueForKey:@"multipageAnimationBackImage"] != nil)
        customization.multipageAnimationBackImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"multipageAnimationBackImage"]];
    if([options valueForKey:@"borderBackgroundImage"] != nil)
        customization.borderBackgroundImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"borderBackgroundImage"]];
    if([options valueForKey:@"helpAnimationImage"] != nil)
        customization.helpAnimationImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"helpAnimationImage"]];
    if([options valueForKey:@"closeButtonImage"] != nil)
        customization.closeButtonImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"closeButtonImage"]];
    if([options valueForKey:@"captureButtonImage"] != nil)
        customization.captureButtonImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"captureButtonImage"]];
    if([options valueForKey:@"changeFrameButtonCollapseImage"] != nil)
        customization.changeFrameButtonCollapseImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"changeFrameButtonCollapseImage"]];
    if([options valueForKey:@"changeFrameButtonExpandImage"] != nil)
        customization.changeFrameButtonExpandImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"changeFrameButtonExpandImage"]];
    if([options valueForKey:@"cameraSwitchButtonImage"] != nil)
        customization.cameraSwitchButtonImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"cameraSwitchButtonImage"]];
    if([options valueForKey:@"torchButtonOnImage"] != nil)
        customization.torchButtonOnImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"torchButtonOnImage"]];
    if([options valueForKey:@"torchButtonOffImage"] != nil)
        customization.torchButtonOffImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"torchButtonOffImage"]];
    if([options valueForKey:@"livenessAnimationImage"] != nil)
        customization.livenessAnimationImage = [RGLWJSONConstructor imageWithBase64:[options valueForKey:@"livenessAnimationImage"]];
    
    // Font
    if([options valueForKey:@"statusTextFont"] != nil)
        customization.statusTextFont = [self UIFontFromJSON:[options valueForKey:@"statusTextFont"]];
    if([options valueForKey:@"resultStatusTextFont"] != nil)
        customization.resultStatusTextFont = [self UIFontFromJSON:[options valueForKey:@"resultStatusTextFont"]];
    
    // Custom
    if([options valueForKey:@"customLabelStatus"] != nil)
        customization.customLabelStatus = [[NSAttributedString alloc]initWithString:[options valueForKey:@"customLabelStatus"]];
    if([options valueForKey:@"cameraFrameLineCap"] != nil)
        customization.cameraFrameLineCap = [self lineCapWithNumber:[options valueForKey:@"cameraFrameLineCap"]];
    if([options valueForKey:@"uiCustomizationLayer"] != nil)
        customization.customUILayerJSON = [options valueForKey:@"uiCustomizationLayer"];
    
    // ContentMode
    if([options valueForKey:@"helpAnimationImageContentMode"] != nil)
        customization.helpAnimationImageContentMode = [self viewContentModeWithNumber:[options valueForKey:@"helpAnimationImageContentMode"]];
    if([options valueForKey:@"multipageAnimationFrontImageContentMode"] != nil)
        customization.multipageAnimationFrontImageContentMode = [self viewContentModeWithNumber:[options valueForKey:@"multipageAnimationFrontImageContentMode"]];
    if([options valueForKey:@"multipageAnimationBackImageContentMode"] != nil)
        customization.multipageAnimationBackImageContentMode = [self viewContentModeWithNumber:[options valueForKey:@"multipageAnimationBackImageContentMode"]];
    if([options valueForKey:@"livenessAnimationImageContentMode"] != nil)
        customization.livenessAnimationImageContentMode = [self viewContentModeWithNumber:[options valueForKey:@"livenessAnimationImageContentMode"]];
    if([options valueForKey:@"borderBackgroundImageContentMode"] != nil)
        customization.borderBackgroundImageContentMode = [self viewContentModeWithNumber:[options valueForKey:@"borderBackgroundImageContentMode"]];

    if([options valueForKey:@"colors"] != nil)
        [self setColors:[customization.uiConfiguration valueForKey:@"colors"] input:[options valueForKey:@"colors"]];
    if([options valueForKey:@"fonts"] != nil)
        [self setFonts:[customization.uiConfiguration valueForKey:@"fonts"] input:[options valueForKey:@"fonts"]];
    if([options valueForKey:@"images"] != nil)
        [self setImages:[customization.uiConfiguration valueForKey:@"images"] input:[options valueForKey:@"images"]];
}

+(NSDictionary*)getCustomization:(RGLCustomization*)customization {
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    // Boolean
    result[@"showStatusMessages"] = [NSNumber numberWithBool:customization.showStatusMessages];
    result[@"showResultStatusMessages"] = [NSNumber numberWithBool:customization.showResultStatusMessages];
    result[@"showHelpAnimation"] = [NSNumber numberWithBool:customization.showHelpAnimation];
    result[@"showNextPageAnimation"] = [NSNumber numberWithBool:customization.showNextPageAnimation];
    result[@"showBackgroundMask"] = [NSNumber numberWithBool:customization.showBackgroundMask];
    
    // Int
    result[@"cameraFrameBorderWidth"] = [NSNumber numberWithFloat:customization.cameraFrameBorderWidth];
    result[@"cameraFrameLineLength"] = [NSNumber numberWithFloat:customization.cameraFrameLineLength];
    result[@"cameraFrameShapeType"] = [NSNumber numberWithFloat:customization.cameraFrameShapeType];
    result[@"cameraFrameOffsetWidth"] = [NSNumber numberWithFloat:customization.cameraFrameOffsetWidth];
    
    // String
    result[@"status"] = customization.status;
    result[@"resultStatus"] = customization.resultStatus;
    
    // Color
    result[@"cameraFrameDefaultColor"] = [self intWithColor:customization.cameraFrameDefaultColor];
    result[@"cameraFrameActiveColor"] = [self intWithColor:customization.cameraFrameActiveColor];
    result[@"statusTextColor"] = [self intWithColor:customization.statusTextColor];
    result[@"resultStatusTextColor"] = [self intWithColor:customization.resultStatusTextColor];
    result[@"resultStatusBackgroundColor"] = [self intWithColor:customization.resultStatusBackgroundColor];
    result[@"multipageButtonBackgroundColor"] = [self intWithColor:customization.multipageButtonBackgroundColor];
    result[@"tintColor"] = [self intWithColor:customization.tintColor];
    result[@"activityIndicatorColor"] = [self intWithColor:customization.activityIndicatorColor];
    result[@"statusBackgroundColor"] = [self intWithColor:customization.statusBackgroundColor];
    result[@"cameraPreviewBackgroundColor"] = [self intWithColor:customization.cameraPreviewBackgroundColor];
    
    // Float
    result[@"statusPositionMultiplier"] = [NSNumber numberWithFloat:customization.statusPositionMultiplier];
    result[@"resultStatusPositionMultiplier"] = [NSNumber numberWithFloat:customization.resultStatusPositionMultiplier];
    result[@"backgroundMaskAlpha"] = [NSNumber numberWithFloat:customization.backgroundMaskAlpha];
    result[@"toolbarSize"] = [NSNumber numberWithFloat:customization.toolbarSize];
    result[@"customStatusPositionMultiplier"] = [NSNumber numberWithFloat:customization.customStatusPositionMultiplier];
    result[@"cameraFrameVerticalPositionMultiplier"] = [NSNumber numberWithFloat:customization.cameraFrameVerticalPositionMultiplier];
    result[@"cameraFrameLandscapeAspectRatio"] = [NSNumber numberWithFloat:customization.cameraFrameLandscapeAspectRatio];
    result[@"cameraFramePortraitAspectRatio"] = [NSNumber numberWithFloat:customization.cameraFramePortraitAspectRatio];
    result[@"cameraFrameCornerRadius"] = [NSNumber numberWithFloat:customization.cameraFrameCornerRadius];
    result[@"livenessAnimationPositionMultiplier"] = [NSNumber numberWithFloat:customization.livenessAnimationPositionMultiplier];
    
    // Drawable
    result[@"multipageAnimationFrontImage"] = [RGLWJSONConstructor base64WithImage:customization.multipageAnimationFrontImage];
    result[@"multipageAnimationBackImage"] = [RGLWJSONConstructor base64WithImage:customization.multipageAnimationBackImage];
    result[@"borderBackgroundImage"] = [RGLWJSONConstructor base64WithImage:customization.borderBackgroundImage];
    result[@"helpAnimationImage"] = [RGLWJSONConstructor base64WithImage:customization.helpAnimationImage];
    result[@"closeButtonImage"] = [RGLWJSONConstructor base64WithImage:customization.closeButtonImage];
    result[@"captureButtonImage"] = [RGLWJSONConstructor base64WithImage:customization.captureButtonImage];
    result[@"changeFrameButtonCollapseImage"] = [RGLWJSONConstructor base64WithImage:customization.changeFrameButtonCollapseImage];
    result[@"changeFrameButtonExpandImage"] = [RGLWJSONConstructor base64WithImage:customization.changeFrameButtonExpandImage];
    result[@"cameraSwitchButtonImage"] = [RGLWJSONConstructor base64WithImage:customization.cameraSwitchButtonImage];
    result[@"torchButtonOnImage"] = [RGLWJSONConstructor base64WithImage:customization.torchButtonOnImage];
    result[@"torchButtonOffImage"] = [RGLWJSONConstructor base64WithImage:customization.torchButtonOffImage];
    result[@"livenessAnimationImage"] = [RGLWJSONConstructor base64WithImage:customization.livenessAnimationImage];
    
    // Font
    result[@"statusTextFont"] = [self generateUIFont:customization.statusTextFont];
    result[@"resultStatusTextFont"] = [self generateUIFont:customization.resultStatusTextFont];
    
    // Custom
    if(customization.customLabelStatus != nil) result[@"customLabelStatus"] = customization.customLabelStatus.string;
    result[@"cameraFrameLineCap"] = [self generateLineCap:customization.cameraFrameLineCap];
    result[@"uiCustomizationLayer"] = customization.customUILayerJSON;
    
    // ContentMode
    result[@"helpAnimationImageContentMode"] = [self generateViewContentMode:customization.helpAnimationImageContentMode];
    result[@"multipageAnimationFrontImageContentMode"] = [self generateViewContentMode:customization.multipageAnimationFrontImageContentMode];
    result[@"multipageAnimationBackImageContentMode"] = [self generateViewContentMode:customization.multipageAnimationBackImageContentMode];
    result[@"livenessAnimationImageContentMode"] = [self generateViewContentMode:customization.livenessAnimationImageContentMode];
    result[@"borderBackgroundImageContentMode"] = [self generateViewContentMode:customization.borderBackgroundImageContentMode];
    
    result[@"colors"] = [self getColors: [customization.uiConfiguration valueForKey:@"colors"]];
    result[@"fonts"] = [self getFonts: [customization.uiConfiguration valueForKey:@"fonts"]];
    result[@"images"] = [self getImages: [customization.uiConfiguration valueForKey:@"images"]];
    
    return result;
}

+(void)setRfidScenario:(NSDictionary*)options :(RGLRFIDScenario*)rfidScenario {
    // Boolean
    if([options valueForKey:@"paceStaticBinding"] != nil)
        rfidScenario.paceStaticBinding = [[options valueForKey:@"paceStaticBinding"] boolValue];
    if([options valueForKey:@"onlineTA"] != nil)
        rfidScenario.onlineTA = [[options valueForKey:@"onlineTA"] boolValue];
    if([options valueForKey:@"writeEid"] != nil)
        rfidScenario.writeEid = [[options valueForKey:@"writeEid"] boolValue];
    if([options valueForKey:@"universalAccessRights"] != nil)
        rfidScenario.universalAccessRights = [[options valueForKey:@"universalAccessRights"] boolValue];
    if([options valueForKey:@"authorizedRestrictedIdentification"] != nil)
        rfidScenario.authorizedRestrictedIdentification = [[options valueForKey:@"authorizedRestrictedIdentification"] boolValue];
    if([options valueForKey:@"auxVerificationCommunityID"] != nil)
        rfidScenario.auxVerificationCommunityID = [[options valueForKey:@"auxVerificationCommunityID"] boolValue];
    if([options valueForKey:@"auxVerificationDateOfBirth"] != nil)
        rfidScenario.auxVerificationDateOfBirth = [[options valueForKey:@"auxVerificationDateOfBirth"] boolValue];
    if([options valueForKey:@"skipAA"] != nil)
        rfidScenario.skipAA = [[options valueForKey:@"skipAA"] boolValue];
    if([options valueForKey:@"strictProcessing"] != nil)
        rfidScenario.strictProcessing = [[options valueForKey:@"strictProcessing"] boolValue];
    if([options valueForKey:@"pkdDSCertPriority"] != nil)
        rfidScenario.pkdDSCertPriority = [[options valueForKey:@"pkdDSCertPriority"] boolValue];
    if([options valueForKey:@"pkdUseExternalCSCA"] != nil)
        rfidScenario.pkdUseExternalCSCA = [[options valueForKey:@"pkdUseExternalCSCA"] boolValue];
    if([options valueForKey:@"trustedPKD"] != nil)
        rfidScenario.trustedPKD = [[options valueForKey:@"trustedPKD"] boolValue];
    if([options valueForKey:@"passiveAuth"] != nil)
        rfidScenario.passiveAuth = [[options valueForKey:@"passiveAuth"] boolValue];
    if([options valueForKey:@"useSFI"] != nil)
        rfidScenario.useSFI = [[options valueForKey:@"useSFI"] boolValue];
    if([options valueForKey:@"readEPassport"] != nil)
        rfidScenario.readEPassport = [[options valueForKey:@"readEPassport"] boolValue];
    if([options valueForKey:@"readEID"] != nil)
        rfidScenario.readEID = [[options valueForKey:@"readEID"] boolValue];
    if([options valueForKey:@"readEDL"] != nil)
        rfidScenario.readEDL = [[options valueForKey:@"readEDL"] boolValue];
    if([options valueForKey:@"authorizedSTSignature"] != nil)
        rfidScenario.authorizedSTSignature = [[options valueForKey:@"authorizedSTSignature"] boolValue];
    if([options valueForKey:@"authorizedSTQSignature"] != nil)
        rfidScenario.authorizedSTQSignature = [[options valueForKey:@"authorizedSTQSignature"] boolValue];
    if([options valueForKey:@"authorizedWriteDG17"] != nil)
        rfidScenario.authorizedWriteDG17 = [[options valueForKey:@"authorizedWriteDG17"] boolValue];
    if([options valueForKey:@"authorizedWriteDG18"] != nil)
        rfidScenario.authorizedWriteDG18 = [[options valueForKey:@"authorizedWriteDG18"] boolValue];
    if([options valueForKey:@"authorizedWriteDG19"] != nil)
        rfidScenario.authorizedWriteDG19 = [[options valueForKey:@"authorizedWriteDG19"] boolValue];
    if([options valueForKey:@"authorizedWriteDG20"] != nil)
        rfidScenario.authorizedWriteDG20 = [[options valueForKey:@"authorizedWriteDG20"] boolValue];
    if([options valueForKey:@"authorizedWriteDG21"] != nil)
        rfidScenario.authorizedWriteDG21 = [[options valueForKey:@"authorizedWriteDG21"] boolValue];
    if([options valueForKey:@"authorizedVerifyAge"] != nil)
        rfidScenario.authorizedVerifyAge = [[options valueForKey:@"authorizedVerifyAge"] boolValue];
    if([options valueForKey:@"authorizedVerifyCommunityID"] != nil)
        rfidScenario.authorizedVerifyCommunityID = [[options valueForKey:@"authorizedVerifyCommunityID"] boolValue];
    if([options valueForKey:@"authorizedPrivilegedTerminal"] != nil)
        rfidScenario.authorizedPrivilegedTerminal = [[options valueForKey:@"authorizedPrivilegedTerminal"] boolValue];
    if([options valueForKey:@"authorizedCANAllowed"] != nil)
        rfidScenario.authorizedCANAllowed = [[options valueForKey:@"authorizedCANAllowed"] boolValue];
    if([options valueForKey:@"authorizedPINManagement"] != nil)
        rfidScenario.authorizedPINManagment = [[options valueForKey:@"authorizedPINManagement"] boolValue];
    if([options valueForKey:@"authorizedInstallCert"] != nil)
        rfidScenario.authorizedInstallCert = [[options valueForKey:@"authorizedInstallCert"] boolValue];
    if([options valueForKey:@"authorizedInstallQCert"] != nil)
        rfidScenario.authorizedInstallQCert = [[options valueForKey:@"authorizedInstallQCert"] boolValue];
    if([options valueForKey:@"applyAmendments"] != nil)
        rfidScenario.applyAmendments = [[options valueForKey:@"applyAmendments"] boolValue];
    if([options valueForKey:@"autoSettings"] != nil)
        rfidScenario.autoSettings = [[options valueForKey:@"autoSettings"] boolValue];
    if([options valueForKey:@"proceedReadingAlways"] != nil)
        rfidScenario.proceedReadingAlways = [[options valueForKey:@"proceedReadingAlways"] boolValue];
    
    // Int
    if([options valueForKey:@"signManagementAction"] != nil)
        rfidScenario.signManagementAction = [[options valueForKey:@"signManagementAction"] integerValue];
    if([options valueForKey:@"readingBuffer"] != nil)
        rfidScenario.readingBuffer = [[options valueForKey:@"readingBuffer"] intValue];
    if([options valueForKey:@"onlineTAToSignDataType"] != nil)
        rfidScenario.onlineTAToSignDataType = [[options valueForKey:@"onlineTAToSignDataType"] intValue];
    if([options valueForKey:@"profilerType"] != nil)
        rfidScenario.profilerType = [[options valueForKey:@"profilerType"] intValue];
    if([options valueForKey:@"authProcType"] != nil)
        rfidScenario.authProcType = [[options valueForKey:@"authProcType"] integerValue];
    if([options valueForKey:@"baseSMProcedure"] != nil)
        rfidScenario.baseSMProcedure = [[options valueForKey:@"baseSMProcedure"] integerValue];
    if([options valueForKey:@"pacePasswordType"] != nil)
        rfidScenario.pacePasswordType = [[options valueForKey:@"pacePasswordType"] integerValue];
    if([options valueForKey:@"terminalType"] != nil)
        rfidScenario.terminalType = [[options valueForKey:@"terminalType"] integerValue];
    if([options valueForKey:@"defaultReadingBufferSize"] != nil)
        rfidScenario.defaultReadingBufferSize = [[options valueForKey:@"defaultReadingBufferSize"] intValue];
    
    // String
    if([options valueForKey:@"password"] != nil)
        rfidScenario.password = [options valueForKey:@"password"];
    if([options valueForKey:@"pkdPA"] != nil)
        rfidScenario.pkdPA = [options valueForKey:@"pkdPA"];
    if([options valueForKey:@"pkdEAC"] != nil)
        rfidScenario.pkdEAC = [options valueForKey:@"pkdEAC"];
    if([options valueForKey:@"mrz"] != nil)
        rfidScenario.mrz = [options valueForKey:@"mrz"];
    if([options valueForKey:@"eSignPINDefault"] != nil)
        rfidScenario.eSignPINDefault = [options valueForKey:@"eSignPINDefault"];
    if([options valueForKey:@"eSignPINNewValue"] != nil)
        rfidScenario.eSignPINNewValue = [options valueForKey:@"eSignPINNewValue"];
    
    // DataGroup
    if([options valueForKey:@"ePassportDataGroups"] != nil)
        [self setDataGroups :rfidScenario.ePassportDataGroups dict:[options valueForKey:@"ePassportDataGroups"]];
    if([options valueForKey:@"eIDDataGroups"] != nil)
        [self setDataGroups :rfidScenario.eIDDataGroups dict:[options valueForKey:@"eIDDataGroups"]];
    if([options valueForKey:@"eDLDataGroups"] != nil)
        [self setDataGroups :rfidScenario.eDLDataGroups dict:[options valueForKey:@"eDLDataGroups"]];
}

+(NSDictionary*)getRfidScenario:(RGLRFIDScenario*)rfidScenario {
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    // Boolean
    result[@"paceStaticBinding"] = [NSNumber numberWithBool:rfidScenario.paceStaticBinding];
    result[@"onlineTA"] = [NSNumber numberWithBool:rfidScenario.onlineTA];
    result[@"writeEid"] = [NSNumber numberWithBool:rfidScenario.writeEid];
    result[@"universalAccessRights"] = [NSNumber numberWithBool:rfidScenario.universalAccessRights];
    result[@"authorizedRestrictedIdentification"] = [NSNumber numberWithBool:rfidScenario.authorizedRestrictedIdentification];
    result[@"auxVerificationCommunityID"] = [NSNumber numberWithBool:rfidScenario.auxVerificationCommunityID];
    result[@"auxVerificationDateOfBirth"] = [NSNumber numberWithBool:rfidScenario.auxVerificationDateOfBirth];
    result[@"skipAA"] = [NSNumber numberWithBool:rfidScenario.skipAA];
    result[@"strictProcessing"] = [NSNumber numberWithBool:rfidScenario.strictProcessing];
    result[@"pkdDSCertPriority"] = [NSNumber numberWithBool:rfidScenario.pkdDSCertPriority];
    result[@"pkdUseExternalCSCA"] = [NSNumber numberWithBool:rfidScenario.pkdUseExternalCSCA];
    result[@"trustedPKD"] = [NSNumber numberWithBool:rfidScenario.trustedPKD];
    result[@"passiveAuth"] = [NSNumber numberWithBool:rfidScenario.passiveAuth];
    result[@"useSFI"] = [NSNumber numberWithBool:rfidScenario.useSFI];
    result[@"readEPassport"] = [NSNumber numberWithBool:rfidScenario.readEPassport];
    result[@"readEID"] = [NSNumber numberWithBool:rfidScenario.readEID];
    result[@"readEDL"] = [NSNumber numberWithBool:rfidScenario.readEDL];
    result[@"authorizedSTSignature"] = [NSNumber numberWithBool:rfidScenario.authorizedSTSignature];
    result[@"authorizedSTQSignature"] = [NSNumber numberWithBool:rfidScenario.authorizedSTQSignature];
    result[@"authorizedWriteDG17"] = [NSNumber numberWithBool:rfidScenario.authorizedWriteDG17];
    result[@"authorizedWriteDG18"] = [NSNumber numberWithBool:rfidScenario.authorizedWriteDG18];
    result[@"authorizedWriteDG19"] = [NSNumber numberWithBool:rfidScenario.authorizedWriteDG19];
    result[@"authorizedWriteDG20"] = [NSNumber numberWithBool:rfidScenario.authorizedWriteDG20];
    result[@"authorizedWriteDG21"] = [NSNumber numberWithBool:rfidScenario.authorizedWriteDG21];
    result[@"authorizedVerifyAge"] = [NSNumber numberWithBool:rfidScenario.authorizedVerifyAge];
    result[@"authorizedVerifyCommunityID"] = [NSNumber numberWithBool:rfidScenario.authorizedVerifyCommunityID];
    result[@"authorizedPrivilegedTerminal"] = [NSNumber numberWithBool:rfidScenario.authorizedPrivilegedTerminal];
    result[@"authorizedCANAllowed"] = [NSNumber numberWithBool:rfidScenario.authorizedCANAllowed];
    result[@"authorizedPINManagement"] = [NSNumber numberWithBool:rfidScenario.authorizedPINManagment];
    result[@"authorizedInstallCert"] = [NSNumber numberWithBool:rfidScenario.authorizedInstallCert];
    result[@"authorizedInstallQCert"] = [NSNumber numberWithBool:rfidScenario.authorizedInstallQCert];
    result[@"applyAmendments"] = [NSNumber numberWithBool:rfidScenario.applyAmendments];
    result[@"autoSettings"] = [NSNumber numberWithBool:rfidScenario.autoSettings];
    result[@"proceedReadingAlways"] = [NSNumber numberWithBool:rfidScenario.proceedReadingAlways];
    
    // Int
    result[@"signManagementAction"] = [NSNumber numberWithInteger:rfidScenario.signManagementAction];
    result[@"readingBuffer"] = [NSNumber numberWithInteger:rfidScenario.readingBuffer];
    result[@"onlineTAToSignDataType"] = [NSNumber numberWithInteger:rfidScenario.onlineTAToSignDataType];
    result[@"profilerType"] = [NSNumber numberWithInteger:rfidScenario.profilerType];
    result[@"authProcType"] = [NSNumber numberWithInteger:rfidScenario.authProcType];
    result[@"baseSMProcedure"] = [NSNumber numberWithInteger:rfidScenario.baseSMProcedure];
    result[@"pacePasswordType"] = [NSNumber numberWithInteger:rfidScenario.pacePasswordType];
    result[@"terminalType"] = [NSNumber numberWithInteger:rfidScenario.terminalType];
    result[@"defaultReadingBufferSize"] = [NSNumber numberWithInteger:rfidScenario.defaultReadingBufferSize];
    
    // String
    result[@"password"] = rfidScenario.password;
    result[@"pkdPA"] = rfidScenario.pkdPA;
    result[@"pkdEAC"] = rfidScenario.pkdEAC;
    result[@"mrz"] = rfidScenario.mrz;
    result[@"eSignPINDefault"] = rfidScenario.eSignPINDefault;
    result[@"eSignPINNewValue"] = rfidScenario.eSignPINNewValue;
    
    // DataGroup
    result[@"eDLDataGroups"] = [self getDataGroups:rfidScenario.eDLDataGroups];
    result[@"ePassportDataGroups"] = [self getDataGroups:rfidScenario.ePassportDataGroups];
    result[@"eIDDataGroups"] = [self getDataGroups:rfidScenario.eIDDataGroups];
    
    return result;
}

+(void)setDataGroups:(RGLDataGroup*)dataGroup dict:(NSDictionary*)dict {
    
    // EDLDataGroups/Common: 1-14
    if([dict valueForKey:@"DG1"] != nil)
        dataGroup.dG1 = [[dict valueForKey:@"DG1"] boolValue];
    if([dict valueForKey:@"DG2"] != nil)
        dataGroup.dG2 = [[dict valueForKey:@"DG2"] boolValue];
    if([dict valueForKey:@"DG3"] != nil)
        dataGroup.dG3 = [[dict valueForKey:@"DG3"] boolValue];
    if([dict valueForKey:@"DG4"] != nil)
        dataGroup.dG4 = [[dict valueForKey:@"DG4"] boolValue];
    if([dict valueForKey:@"DG5"] != nil)
        dataGroup.dG5 = [[dict valueForKey:@"DG5"] boolValue];
    if([dict valueForKey:@"DG6"] != nil)
        dataGroup.dG6 = [[dict valueForKey:@"DG6"] boolValue];
    if([dict valueForKey:@"DG7"] != nil)
        dataGroup.dG7 = [[dict valueForKey:@"DG7"] boolValue];
    if([dict valueForKey:@"DG8"] != nil)
        dataGroup.dG8 = [[dict valueForKey:@"DG8"] boolValue];
    if([dict valueForKey:@"DG9"] != nil)
        dataGroup.dG9 = [[dict valueForKey:@"DG9"] boolValue];
    if([dict valueForKey:@"DG10"] != nil)
        dataGroup.dG10 = [[dict valueForKey:@"DG10"] boolValue];
    if([dict valueForKey:@"DG11"] != nil)
        dataGroup.dG11 = [[dict valueForKey:@"DG11"] boolValue];
    if([dict valueForKey:@"DG12"] != nil)
        dataGroup.dG12 = [[dict valueForKey:@"DG12"] boolValue];
    if([dict valueForKey:@"DG13"] != nil)
        dataGroup.dG13 = [[dict valueForKey:@"DG13"] boolValue];
    if([dict valueForKey:@"DG14"] != nil)
        dataGroup.dG14 = [[dict valueForKey:@"DG14"] boolValue];
    
    // EPassportDataGroups: 1-16
    if ([dataGroup class] == [RGLePassportDataGroup class]) {
        if([dict valueForKey:@"DG15"] != nil)
            ((RGLePassportDataGroup*)dataGroup).dG15 = [[dict valueForKey:@"DG15"] boolValue];
        if([dict valueForKey:@"DG16"] != nil)
            ((RGLePassportDataGroup*)dataGroup).dG16 = [[dict valueForKey:@"DG16"] boolValue];
    }
    
    // EIDDataGroups: 1-21
    if ([dataGroup class] == [RGLeIDDataGroup class]) {
        if([dict valueForKey:@"DG15"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG15 = [[dict valueForKey:@"DG15"] boolValue];
        if([dict valueForKey:@"DG16"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG16 = [[dict valueForKey:@"DG16"] boolValue];
        if([dict valueForKey:@"DG17"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG17 = [[dict valueForKey:@"DG17"] boolValue];
        if([dict valueForKey:@"DG18"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG18 = [[dict valueForKey:@"DG18"] boolValue];
        if([dict valueForKey:@"DG19"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG19 = [[dict valueForKey:@"DG19"] boolValue];
        if([dict valueForKey:@"DG20"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG20 = [[dict valueForKey:@"DG20"] boolValue];
        if([dict valueForKey:@"DG21"] != nil)
            ((RGLeIDDataGroup*)dataGroup).dG21 = [[dict valueForKey:@"DG21"] boolValue];
    }
}

+(NSDictionary *)getDataGroups:(RGLDataGroup*)dataGroup {
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    // EDLDataGroups/Common: 1-14
    result[@"DG1"] = [NSNumber numberWithBool:dataGroup.dG1];
    result[@"DG2"] = [NSNumber numberWithBool:dataGroup.dG2];
    result[@"DG3"] = [NSNumber numberWithBool:dataGroup.dG3];
    result[@"DG4"] = [NSNumber numberWithBool:dataGroup.dG4];
    result[@"DG5"] = [NSNumber numberWithBool:dataGroup.dG5];
    result[@"DG6"] = [NSNumber numberWithBool:dataGroup.dG6];
    result[@"DG7"] = [NSNumber numberWithBool:dataGroup.dG7];
    result[@"DG8"] = [NSNumber numberWithBool:dataGroup.dG8];
    result[@"DG9"] = [NSNumber numberWithBool:dataGroup.dG9];
    result[@"DG10"] = [NSNumber numberWithBool:dataGroup.dG10];
    result[@"DG11"] = [NSNumber numberWithBool:dataGroup.dG11];
    result[@"DG12"] = [NSNumber numberWithBool:dataGroup.dG12];
    result[@"DG13"] = [NSNumber numberWithBool:dataGroup.dG13];
    result[@"DG14"] = [NSNumber numberWithBool:dataGroup.dG14];
    
    // EPassportDataGroups: 1-16
    if ([dataGroup class] == [RGLePassportDataGroup class]) {
        result[@"DG15"] = [NSNumber numberWithBool:((RGLePassportDataGroup*)dataGroup).dG15];
        result[@"DG16"] = [NSNumber numberWithBool:((RGLePassportDataGroup*)dataGroup).dG16];
    }
    
    // EIDDataGroups: 1-21
    if ([dataGroup class] == [RGLeIDDataGroup class]) {
        result[@"DG15"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG15];
        result[@"DG16"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG16];
        result[@"DG17"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG17];
        result[@"DG18"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG18];
        result[@"DG19"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG19];
        result[@"DG20"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG20];
        result[@"DG21"] = [NSNumber numberWithBool:((RGLeIDDataGroup*)dataGroup).dG21];
    }
    
    return result;
}

+(void)setImageQA:(RGLImageQA*)result input:(NSDictionary*)input {
    if([input valueForKey:@"dpiThreshold"] != nil)
        result.dpiThreshold = [input valueForKey:@"dpiThreshold"];
    if([input valueForKey:@"angleThreshold"] != nil)
        result.angleThreshold = [input valueForKey:@"angleThreshold"];
    if([input valueForKey:@"focusCheck"] != nil)
        result.focusCheck = [input valueForKey:@"focusCheck"];
    if([input valueForKey:@"glaresCheck"] != nil)
        result.glaresCheck = [input valueForKey:@"glaresCheck"];
    if([input valueForKey:@"colornessCheck"] != nil)
        result.colornessCheck = [input valueForKey:@"colornessCheck"];
    if([input valueForKey:@"screenCapture"] != nil)
        result.screenCapture = [input valueForKey:@"screenCapture"];
    if (input[@"expectedPass"]) {
        NSMutableArray<RGLImageQualityCheckType>* expectedPass = @[].mutableCopy;
        for(NSNumber* item in input[@"expectedPass"]) [expectedPass addObject:[self imageQualityCheckTypeWithNumber:item]];
        result.expectedPass = expectedPass;
    }
    if([input valueForKey:@"documentPositionIndent"] != nil)
        result.documentPositionIndent = [input valueForKey:@"documentPositionIndent"];
    if([input valueForKey:@"glaresCheckParams"] != nil)
        result.glaresCheckParams = [RGLWJSONConstructor glaresCheckParamsFromJson:[input valueForKey:@"glaresCheckParams"]];
    if([input valueForKey:@"brightnessThreshold"] != nil)
        result.brightnessThreshold = [input valueForKey:@"brightnessThreshold"];
}

+(NSDictionary*)getImageQA:(RGLImageQA*)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"dpiThreshold"] = input.dpiThreshold;
    result[@"angleThreshold"] = input.angleThreshold;
    result[@"focusCheck"] = input.focusCheck;
    result[@"glaresCheck"] = input.glaresCheck;
    result[@"colornessCheck"] = input.colornessCheck;
    result[@"screenCapture"] = input.screenCapture;
    if (input.expectedPass) {
        NSMutableArray<NSNumber*>* expectedPass = @[].mutableCopy;
        for(RGLImageQualityCheckType item in input.expectedPass) [expectedPass addObject:[self generateImageQualityCheckType:item]];
        result[@"expectedPass"] = expectedPass;
    }
    result[@"documentPositionIndent"] = input.documentPositionIndent;
    result[@"glaresCheckParams"] = [RGLWJSONConstructor generateGlaresCheckParams:input.glaresCheckParams];
    result[@"brightnessThreshold"] = input.brightnessThreshold;
    
    return result;
}

+(void)setAuthenticityParams:(RGLAuthenticityParams*)result input:(NSDictionary*)input {
    if([input valueForKey:@"useLivenessCheck"] != nil)
        result.useLivenessCheck = [input valueForKey:@"useLivenessCheck"];
    if([input valueForKey:@"livenessParams"] != nil) {
        if(result.livenessParams == nil) result.livenessParams = [RGLLivenessParams defaultParams];
        [self setLivenessParams:result.livenessParams input:[input valueForKey:@"livenessParams"]];
    }
    if([input valueForKey:@"checkUVLuminiscence"] != nil)
        result.checkUVLuminiscence = [input valueForKey:@"checkUVLuminiscence"];
    if([input valueForKey:@"checkIRB900"] != nil)
        result.checkIRB900 = [input valueForKey:@"checkIRB900"];
    if([input valueForKey:@"checkImagePatterns"] != nil)
        result.checkImagePatterns = [input valueForKey:@"checkImagePatterns"];
    if([input valueForKey:@"checkFibers"] != nil)
        result.checkFibers = [input valueForKey:@"checkFibers"];
    if([input valueForKey:@"checkExtMRZ"] != nil)
        result.checkExtMRZ = [input valueForKey:@"checkExtMRZ"];
    if([input valueForKey:@"checkExtOCR"] != nil)
        result.checkExtOCR = [input valueForKey:@"checkExtOCR"];
    if([input valueForKey:@"checkAxial"] != nil)
        result.checkAxial = [input valueForKey:@"checkAxial"];
    if([input valueForKey:@"checkBarcodeFormat"] != nil)
        result.checkBarcodeFormat = [input valueForKey:@"checkBarcodeFormat"];
    if([input valueForKey:@"checkIRVisibility"] != nil)
        result.checkIRVisibility = [input valueForKey:@"checkIRVisibility"];
    if([input valueForKey:@"checkIPI"] != nil)
        result.checkIPI = [input valueForKey:@"checkIPI"];
    if([input valueForKey:@"checkPhotoEmbedding"] != nil)
        result.checkPhotoEmbedding = [input valueForKey:@"checkPhotoEmbedding"];
    if([input valueForKey:@"checkPhotoComparison"] != nil)
        result.checkPhotoComparison = [input valueForKey:@"checkPhotoComparison"];
    if([input valueForKey:@"checkLetterScreen"] != nil)
        result.checkLetterScreen = [input valueForKey:@"checkLetterScreen"];
}

+(NSDictionary*)getAuthenticityParams:(RGLAuthenticityParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"useLivenessCheck"] = input.useLivenessCheck;
    result[@"livenessParams"] = [self getLivenessParams:input.livenessParams];
    result[@"checkUVLuminiscence"] = input.checkUVLuminiscence;
    result[@"checkIRB900"] = input.checkIRB900;
    result[@"checkImagePatterns"] = input.checkImagePatterns;
    result[@"checkFibers"] = input.checkFibers;
    result[@"checkExtMRZ"] = input.checkExtMRZ;
    result[@"checkExtOCR"] = input.checkExtOCR;
    result[@"checkAxial"] = input.checkAxial;
    result[@"checkBarcodeFormat"] = input.checkBarcodeFormat;
    result[@"checkIRVisibility"] = input.checkIRVisibility;
    result[@"checkIPI"] = input.checkIPI;
    result[@"checkPhotoEmbedding"] = input.checkPhotoEmbedding;
    result[@"checkPhotoComparison"] = input.checkPhotoComparison;
    result[@"checkLetterScreen"] = input.checkLetterScreen;
    
    return result;
}

+(void)setLivenessParams:(RGLLivenessParams*)result input:(NSDictionary*)input {
    if([input valueForKey:@"checkOVI"] != nil)
        result.checkOVI = [input valueForKey:@"checkOVI"];
    if([input valueForKey:@"checkMLI"] != nil)
        result.checkMLI = [input valueForKey:@"checkMLI"];
    if([input valueForKey:@"checkHolo"] != nil)
        result.checkHolo = [input valueForKey:@"checkHolo"];
    if([input valueForKey:@"checkED"] != nil)
        result.checkED = [input valueForKey:@"checkED"];
}

+(NSDictionary*)getLivenessParams:(RGLLivenessParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"checkOVI"] = input.checkOVI;
    result[@"checkMLI"] = input.checkMLI;
    result[@"checkHolo"] = input.checkHolo;
    result[@"checkED"] = input.checkED;
    
    return result;
}

+(void)setColors:(NSMutableDictionary*)result input:(NSDictionary*)input {
    if([input valueForKey:@"rfidProcessingScreenBackground"] != nil)
        result[@(RFIDProcessingScreenBackground)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenBackground"]];
    if([input valueForKey:@"rfidProcessingScreenHintLabelText"] != nil)
        result[@(RFIDProcessingScreenHintLabelText)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenHintLabelText"]];
    if([input valueForKey:@"rfidProcessingScreenHintLabelBackground"] != nil)
        result[@(RFIDProcessingScreenHintLabelBackground)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenHintLabelBackground"]];
    if([input valueForKey:@"rfidProcessingScreenProgressLabelText"] != nil)
        result[@(RFIDProcessingScreenProgressLabelText)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenProgressLabelText"]];
    if([input valueForKey:@"rfidProcessingScreenProgressBar"] != nil)
        result[@(RFIDProcessingScreenProgressBar)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenProgressBar"]];
    if([input valueForKey:@"rfidProcessingScreenProgressBarBackground"] != nil)
        result[@(RFIDProcessingScreenProgressBarBackground)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenProgressBarBackground"]];
    if([input valueForKey:@"rfidProcessingScreenResultLabelText"] != nil)
        result[@(RFIDProcessingScreenResultLabelText)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenResultLabelText"]];
    if([input valueForKey:@"rfidProcessingScreenLoadingBar"] != nil)
        result[@(RFIDProcessingScreenLoadingBar)] = [self colorWithInt:[input valueForKey:@"rfidProcessingScreenLoadingBar"]];
}

+(NSDictionary*)getColors:(NSDictionary*)input {
   return @{
       @"rfidProcessingScreenBackground": [self intWithColor:input[@(RFIDProcessingScreenBackground)]],
       @"rfidProcessingScreenHintLabelText": [self intWithColor:input[@(RFIDProcessingScreenHintLabelText)]],
       @"rfidProcessingScreenHintLabelBackground": [self intWithColor:input[@(RFIDProcessingScreenHintLabelBackground)]],
       @"rfidProcessingScreenProgressLabelText": [self intWithColor:input[@(RFIDProcessingScreenProgressLabelText)]],
       @"rfidProcessingScreenProgressBar": [self intWithColor:input[@(RFIDProcessingScreenProgressBar)]],
       @"rfidProcessingScreenProgressBarBackground": [self intWithColor:input[@(RFIDProcessingScreenProgressBarBackground)]],
       @"rfidProcessingScreenResultLabelText": [self intWithColor:input[@(RFIDProcessingScreenResultLabelText)]],
       @"rfidProcessingScreenLoadingBar": [self intWithColor:input[@(RFIDProcessingScreenLoadingBar)]],
    };
}

+(void)setFonts:(NSMutableDictionary*)result input:(NSDictionary*)input {
    if([input valueForKey:@"rfidProcessingScreenHintLabel"] != nil)
        result[@(RFIDProcessingScreenHintLabel)] = [self UIFontFromJSON:[input valueForKey:@"rfidProcessingScreenHintLabel"]];
    if([input valueForKey:@"rfidProcessingScreenProgressLabel"] != nil)
        result[@(RFIDProcessingScreenProgressLabel)] = [self UIFontFromJSON:[input valueForKey:@"rfidProcessingScreenProgressLabel"]];
    if([input valueForKey:@"rfidProcessingScreenResultLabel"] != nil)
        result[@(RFIDProcessingScreenResultLabel)] = [self UIFontFromJSON:[input valueForKey:@"rfidProcessingScreenResultLabel"]];
}

+(NSDictionary*)getFonts:(NSDictionary*)input {
   return @{
       @"rfidProcessingScreenHintLabel": [self generateUIFont:input[@(RFIDProcessingScreenHintLabel)]],
       @"rfidProcessingScreenProgressLabel": [self generateUIFont:input[@(RFIDProcessingScreenProgressLabel)]],
       @"rfidProcessingScreenResultLabel": [self generateUIFont:input[@(RFIDProcessingScreenResultLabel)]],
    };
}

+(void)setImages:(NSMutableDictionary*)result input:(NSDictionary*)input {
    if([input valueForKey:@"rfidProcessingScreenFailureImage"] != nil)
        result[@(RFIDProcessingScreenFailureImage)] = [RGLWJSONConstructor imageWithBase64:[input valueForKey:@"rfidProcessingScreenFailureImage"]];
}

+(NSDictionary*)getImages:(NSDictionary*)input {
   return @{
        @"rfidProcessingScreenFailureImage": [RGLWJSONConstructor base64WithImage:input[@(RFIDProcessingScreenFailureImage)]],
    };
}

+(UIColor*)colorWithInt:(NSNumber*)input {
    // Convert hex int to hex string
    NSInteger hexInt = [input integerValue];
    NSString* numbers = @"0123456789ABCDEF";
    NSString* hexString = @"";
    while(hexInt>0){
        int digit = hexInt % 16;
        hexString = [NSString stringWithFormat:@"%@%@", [numbers substringWithRange:NSMakeRange(digit, 1)], hexString];
        hexInt = hexInt/16;
    }
    // If we use int, then all the starting zeros are lost: 0x0F123456 == 0xF123456
    if(hexString.length == 5 || hexString.length == 7)
        hexString = [NSString stringWithFormat:@"0%@", hexString];
    hexString = [NSString stringWithFormat:@"#%@", hexString];
    
    // Convert hex string to UIColor
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+(CGFloat)colorComponentFrom:(NSString*)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+(NSNumber*)intWithColor:(UIColor*)color {
    if(color == nil) return nil;
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    CGFloat a = components[3];
    
    NSString* hexString = [NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX",
                           lroundf(a * 255),
                           lroundf(r * 255),
                           lroundf(g * 255),
                           lroundf(b * 255)];
    
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    
    return [NSNumber numberWithInteger:hexInt];
}

+(UIFont*)UIFontFromJSON:(NSDictionary*)input {
    return [UIFont fontWithName:[input valueForKey:@"name"] size:[[input valueForKey:@"size"] integerValue]];
}

+(NSDictionary*)generateUIFont:(UIFont*)input {
    return @{
        @"name": input.fontName,
        @"size": @(input.pointSize)
    };
}

+(AVCaptureSessionPreset)captureSessionPresetWithNumber:(NSNumber*)value {
    int input = [value intValue];
    if(input == 0) return AVCaptureSessionPresetLow;
    if(input == 1) return AVCaptureSessionPresetMedium;
    if(input == 2) return AVCaptureSessionPresetHigh;
    if(input == 3) return AVCaptureSessionPresetPhoto;
    if(input == 4) return AVCaptureSessionPresetInputPriority;
    if(input == 6) return AVCaptureSessionPreset1280x720;
    if(input == 7) return AVCaptureSessionPreset1920x1080;
    if(input == 8) return AVCaptureSessionPreset3840x2160;
    if(input == 9) return AVCaptureSessionPresetiFrame960x540;
    if(input == 10) return AVCaptureSessionPresetiFrame1280x720;
    if(input == 12) return AVCaptureSessionPreset640x480;
    if(input == 13) return AVCaptureSessionPreset352x288;
    return AVCaptureSessionPreset1920x1080;
}

+(NSNumber*)generateCaptureSessionPreset:(AVCaptureSessionPreset)value {
    if(value == AVCaptureSessionPresetLow) return @0;
    if(value == AVCaptureSessionPresetMedium) return @1;
    if(value == AVCaptureSessionPresetHigh) return @2;
    if(value == AVCaptureSessionPresetPhoto) return @3;
    if(value == AVCaptureSessionPresetInputPriority) return @4;
    if(value == AVCaptureSessionPreset1280x720) return @6;
    if(value == AVCaptureSessionPreset1920x1080) return @7;
    if(value == AVCaptureSessionPreset3840x2160) return @8;
    if(value == AVCaptureSessionPresetiFrame960x540) return @9;
    if(value == AVCaptureSessionPresetiFrame1280x720) return @10;
    if(value == AVCaptureSessionPreset640x480) return @12;
    if(value == AVCaptureSessionPreset352x288) return @13;
    return @0;
}

+(CGLineCap)lineCapWithNumber:(NSNumber*)value {
    int input = [value intValue];
    if(input == 0) return kCGLineCapButt;
    if(input == 1) return kCGLineCapRound;
    if(input == 2) return kCGLineCapSquare;
    return kCGLineCapButt;
}

+(NSNumber*)generateLineCap:(CGLineCap)value {
    if(value == kCGLineCapButt) return @0;
    if(value == kCGLineCapRound) return @1;
    if(value == kCGLineCapSquare) return @2;
    return @0;;
}

+(UIInterfaceOrientationMask)interfaceOrientationMaskWithNumber:(NSNumber*)value {
    int input = [value intValue];
    if(input == 0) return UIInterfaceOrientationMaskAll;
    if(input == 1) return UIInterfaceOrientationMaskPortrait;
    if(input == 2) return UIInterfaceOrientationMaskLandscape;
    if(input == 3) return UIInterfaceOrientationMaskLandscapeLeft;
    if(input == 4) return UIInterfaceOrientationMaskLandscapeRight;
    return UIInterfaceOrientationMaskPortrait;
}

+(NSNumber*)generateInterfaceOrientationMask:(UIInterfaceOrientationMask)value {
    if(value == UIInterfaceOrientationMaskAll) return @0;
    if(value == UIInterfaceOrientationMaskPortrait) return @1;
    if(value == UIInterfaceOrientationMaskLandscape) return @2;
    if(value == UIInterfaceOrientationMaskLandscapeLeft) return @3;
    if(value == UIInterfaceOrientationMaskLandscapeRight) return @4;
    return @0;
}

+(UIViewContentMode)viewContentModeWithNumber:(NSNumber*)value {
    int input = [value intValue];
    if(input == 0) return UIViewContentModeScaleToFill;
    if(input == 1) return UIViewContentModeScaleAspectFit;
    if(input == 2) return UIViewContentModeScaleAspectFill;
    if(input == 3) return UIViewContentModeRedraw;
    if(input == 4) return UIViewContentModeCenter;
    if(input == 5) return UIViewContentModeTop;
    if(input == 6) return UIViewContentModeBottom;
    if(input == 7) return UIViewContentModeLeft;
    if(input == 8) return UIViewContentModeRight;
    if(input == 9) return UIViewContentModeTopLeft;
    if(input == 10) return UIViewContentModeTopRight;
    if(input == 11) return UIViewContentModeBottomLeft;
    if(input == 12) return UIViewContentModeBottomRight;
    return UIViewContentModeCenter;
}

+(NSNumber*)generateViewContentMode:(UIViewContentMode)value {
    if(value == UIViewContentModeScaleToFill) return @0;
    if(value == UIViewContentModeScaleAspectFit) return @1;
    if(value == UIViewContentModeScaleAspectFill) return @2;
    if(value == UIViewContentModeRedraw) return @3;
    if(value == UIViewContentModeCenter) return @4;
    if(value == UIViewContentModeTop) return @5;
    if(value == UIViewContentModeBottom) return @6;
    if(value == UIViewContentModeLeft) return @7;
    if(value == UIViewContentModeRight) return @8;
    if(value == UIViewContentModeTopLeft) return @9;
    if(value == UIViewContentModeTopRight) return @10;
    if(value == UIViewContentModeBottomLeft) return @11;
    if(value == UIViewContentModeBottomRight) return @12;
    return @4;
}

+(RGLDocReaderFrame)docReaderFrameWithString:(NSString*)value {
    if([value isEqual: @"id1"]) return RGLDocReaderFrameScenarioDefault;
    if([value isEqual: @"max"]) return RGLDocReaderFrameMax;
    if([value isEqual: @"none"]) return RGLDocReaderFrameNone;
    if([value isEqual: @"document"]) return RGLDocReaderFrameDocument;
    return RGLDocReaderFrameNone;
}

+(NSString*)generateDocReaderFrame:(RGLDocReaderFrame)value {
    if(value == RGLDocReaderFrameScenarioDefault) return @"id1";
    if(value == RGLDocReaderFrameMax) return @"max";
    if(value == RGLDocReaderFrameNone) return @"none";
    if(value == RGLDocReaderFrameDocument) return @"document";
    return @"none";
}

+(RGLTextProcessing*)textProcessingWithNumber:(NSNumber*)value {
    int input = [value intValue];
    if(input == 0) return RGLTextProcessing.noChange;
    if(input == 1) return RGLTextProcessing.uppercase;
    if(input == 2) return RGLTextProcessing.lowercase;
    if(input == 3) return RGLTextProcessing.capital;
    return RGLTextProcessing.noChange;
}

+(NSNumber*)generateWithTextProcessing:(RGLTextProcessing*)value {
    return [value valueForKey:@"rawValue"];
}

+(NSNumber*)generateDocReaderAction:(RGLDocReaderAction)value {
    if(value == RGLDocReaderActionComplete) return @0;
    if(value == RGLDocReaderActionProcess) return @1;
    if(value == RGLDocReaderActionMorePagesAvailable) return @2;
    if(value == RGLDocReaderActionCancel) return @3;
    if(value == RGLDocReaderActionError) return @4;
    if(value == RGLDocReaderActionProcessWhiteFlashLight) return @5;
    if(value == RGLDocReaderActionProcessTimeout) return @6;
    if(value == RGLDocReaderActionProcessOnServer) return @7;
    return @4;
}

+(NSNumber*)generateRFIDCompleteAction:(RGLRFIDCompleteAction)value {
    if(value == RGLRFIDCompleteActionComplete) return @0;
    if(value == RGLRFIDCompleteActionError) return @4;
    if(value == RGLRFIDCompleteActionCancel) return @3;
    if(value == RGLRFIDCompleteActionSessionRestarted) return @0;
    return @0;
}

+(NSNumber*)generateImageQualityCheckType:(RGLImageQualityCheckType)value {
    if(value == RGLImageQualityCheckTypeImageGlares) return @0;
    if(value == RGLImageQualityCheckTypeImageFocus) return @1;
    if(value == RGLImageQualityCheckTypeImageResolution) return @2;
    if(value == RGLImageQualityCheckTypeImageColorness) return @3;
    if(value == RGLImageQualityCheckTypeImagePerspective) return @4;
    if(value == RGLImageQualityCheckTypeImageBounds) return @5;
    if(value == RGLImageQualityCheckTypeScreenCapture) return @6;
    if(value == RGLImageQualityCheckTypePortrait) return @7;
    if(value == RGLImageQualityCheckTypeHandwritten) return @8;
    if(value == RGLImageQualityCheckTypeBrightness) return @9;
    return 0;
}

+(RGLImageQualityCheckType)imageQualityCheckTypeWithNumber:(NSNumber*)input {
    if(input == nil) return nil;
    int value = [input intValue];
    if(value == 0) return RGLImageQualityCheckTypeImageGlares;
    if(value == 1) return RGLImageQualityCheckTypeImageFocus;
    if(value == 2) return RGLImageQualityCheckTypeImageResolution;
    if(value == 3) return RGLImageQualityCheckTypeImageColorness;
    if(value == 4) return RGLImageQualityCheckTypeImagePerspective;
    if(value == 5) return RGLImageQualityCheckTypeImageBounds;
    if(value == 6) return RGLImageQualityCheckTypeScreenCapture;
    if(value == 7) return RGLImageQualityCheckTypePortrait;
    if(value == 8) return RGLImageQualityCheckTypeHandwritten;
    if(value == 9) return RGLImageQualityCheckTypeBrightness;
    return RGLImageQualityCheckTypeImageGlares;
}

@end
