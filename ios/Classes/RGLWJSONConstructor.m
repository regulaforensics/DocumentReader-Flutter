//
//  RGLWJSONConstructor.m
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLWJSONConstructor.h"

@implementation RGLWJSONConstructor

+(NSString*)dictToString:(NSDictionary*)input {
    if(input == nil) return nil;
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+(NSString*)arrayToString:(NSArray*)input {
    if(input == nil) return nil;
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+(NSData*)base64Decode:(NSString*)input {
    if(input == nil) return nil;
    return [[NSData alloc] initWithBase64EncodedString:input options:0];
}

+(NSString*)base64Encode:(NSData*)input {
    if(input == nil) return nil;
    return [input base64EncodedStringWithOptions:0];
}

+(UIImage*)imageWithBase64:(NSString*)input {
    if(input == nil) return nil;
    return [UIImage imageWithData:[self base64Decode:input]];
}

+(NSString*)base64WithImage:(UIImage*)input {
    return [self base64Encode: UIImagePNGRepresentation(input)];
}

+(NSError*)errorFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSInteger code = [[input valueForKey:@"code"] integerValue];
    NSString* message = [input valueForKey:@"message"];
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(message, nil)};
    return [NSError errorWithDomain:RGLDocumentReaderDomain code:code userInfo:userInfo];
}

+(NSDictionary*)generateError:(NSError*)input {
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"code"] = [NSNumber numberWithInteger:input.code];
    result[@"message"] = input.localizedDescription;

    return result;
}

+(NSString*)generateCompletion:(NSNumber*)action :(RGLDocumentReaderResults*)results :(NSError*)error {
    NSMutableDictionary *result = [NSMutableDictionary new];
    int actionInt = [action intValue];

    if(actionInt == 0 || actionInt == 2 || actionInt == 3 || actionInt == 4 || actionInt == 6)
        result[@"results"] = [self generateDocumentReaderResults:results];
    result[@"action"] = action;
    result[@"error"] = [self generateError:error];

    return [RGLWJSONConstructor dictToString: result];
}

+(NSString*)generateSuccessCompletion:(BOOL)success :(NSError*)error {
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"success"] = success? @YES : @NO;
    result[@"error"] = [self generateError:error];
    
    return [RGLWJSONConstructor dictToString: result];
}

+(NSString*)generatePACertificateCompletion:(NSData *)serialNumber :(RGLPAResourcesIssuer *)issuer{
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"serialNumber"] = [self base64Encode:serialNumber];;
    result[@"issuer"] = [self generatePAResourcesIssuer:issuer];
    
    return [RGLWJSONConstructor dictToString: result];
}

+(NSString*)generateFinalizePackageCompletion:(NSNumber*)action :(RGLTransactionInfo*)info :(NSError*)error {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"action"] = action;
    result[@"info"] = [self generateTransactionInfo:info];
    result[@"error"] = [self generateError:error];

    return [RGLWJSONConstructor dictToString: result];
}

+(RGLTransactionInfo*)transactionInfoFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    
    NSString* transactionId = [input valueForKey:@"transactionId"];
    NSString* tag = [input valueForKey:@"tag"];
    
    return [[RGLTransactionInfo alloc] initWithTag:tag transactionId:transactionId];
}

+(NSDictionary*)generateTransactionInfo:(RGLTransactionInfo*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"transactionId"] = input.transactionId;
    result[@"tag"] = input.tag;
    
    return result;
}

+(RGLTCCParams*)tccParamsFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    
    NSString* serviceTAURLString = [input valueForKey:@"serviceUrlTA"];
    NSString* servicePAURLString = [input valueForKey:@"serviceUrlPA"];
    NSString* pfxCertURLString = [input valueForKey:@"pfxCertUrl"];
    NSString* pfxPassPhrase = [input valueForKey:@"pfxPassPhrase"];
    NSData* pfxCertData = [self base64Decode:[input objectForKey:@"pfxCert"]];
    
    return [[RGLTCCParams alloc] initWithServiceTAURLString:serviceTAURLString servicePAURLString:servicePAURLString pfxCertURLString:pfxCertURLString pfxCertData: pfxCertData pfxPassPhrase:pfxPassPhrase];
}

+(NSDictionary*)generateTCCParams:(RGLTCCParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"serviceUrlTA"] = input.serviceTAURLString;
    result[@"serviceUrlPA"] = input.servicePAURLString;
    result[@"pfxCertUrl"] = input.pfxCertURLString;
    result[@"pfxPassPhrase"] = input.pfxPassPhrase;
    result[@"pfxCert"] = [self base64Encode:input.pfxCertData];
    
    return result;
}

+(RGLConfig*)configFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    if([input valueForKey:@"license"] == nil) return nil;
    RGLConfig *config = [[RGLConfig alloc] initWithLicenseData:[self base64Decode: [input valueForKey:@"license"]]];

    if([input valueForKey:@"databasePath"] != nil)
        config.databasePath = [input valueForKey:@"databasePath"];
    if([input valueForKey:@"licenseUpdate"] != nil)
        config.licenseUpdateCheck = [[input valueForKey:@"licenseUpdate"] boolValue];
    if([input valueForKey:@"delayedNNLoad"] != nil)
        config.delayedNNLoadEnabled = [[input valueForKey:@"delayedNNLoad"] boolValue];

    return config;
}

+(NSDictionary*)generateConfig:(RGLConfig*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"license"] = [self base64Encode: input.licenseData];
    result[@"databasePath"] = input.databasePath;
    result[@"licenseUpdate"] = @(input.licenseUpdateCheck);
    result[@"delayedNNLoad"] = @(input.delayedNNLoadEnabled);

    return result;
}

+(RGLScannerConfig*)scannerConfigFromJson:(NSDictionary*)input {
    if([input valueForKey:@"scenario"] == nil && [input valueForKey:@"onlineProcessingConfig"] == nil) return nil;
    RGLScannerConfig *config = [RGLScannerConfig new];

    if([input valueForKey:@"scenario"] != nil)
        config.scenario = [input valueForKey:@"scenario"];
    if([input valueForKey:@"onlineProcessingConfig"] != nil)
        config.onlineProcessingConfig = [self onlineProcessingConfigFromJson:[input valueForKey:@"onlineProcessingConfig"]];
    if([input valueForKey:@"livePortrait"] != nil)
        config.livePortrait = [self imageWithBase64:[input valueForKey:@"livePortrait"]];
    if([input valueForKey:@"extPortrait"] != nil)
        config.extPortrait = [self imageWithBase64:[input valueForKey:@"extPortrait"]];

    return config;
}

+(NSDictionary*)generateScannerConfig:(RGLScannerConfig*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"scenario"] = input.scenario;
    result[@"onlineProcessingConfig"] = [self generateOnlineProcessingConfig: input.onlineProcessingConfig];
    result[@"livePortrait"] = [self base64WithImage: input.livePortrait];
    result[@"extPortrait"] = [self base64WithImage: input.extPortrait];
    
    return result;
}

+(RGLRecognizeConfig*)recognizeConfigFromJson:(NSDictionary*)input {
    if([input valueForKey:@"scenario"] == nil && [input valueForKey:@"onlineProcessingConfig"] == nil) return nil;
    if([input valueForKey:@"image"] == nil && [input valueForKey:@"image"] == nil && [input valueForKey:@"images"] == nil && [input valueForKey:@"imageInputs"] == nil) return nil;
    RGLRecognizeConfig *config = [RGLRecognizeConfig alloc];

    if([input valueForKey:@"image"] != nil)
        config = [config initWithImage:[RGLWJSONConstructor imageWithBase64:[input valueForKey:@"image"]]];
    if([input valueForKey:@"data"] != nil)
        config = [config initWithImageData:[RGLWJSONConstructor base64Decode:[input valueForKey:@"data"]]];
    if([input valueForKey:@"images"] != nil) {
        NSMutableArray<UIImage*>* images = [NSMutableArray new];
        for(NSString* base64 in [input valueForKey:@"images"])
            [images addObject:[RGLWJSONConstructor imageWithBase64:base64]];
        config = [config initWithImages:images];
    }
    if([input valueForKey:@"imageInputData"] != nil) {
        NSMutableArray<RGLImageInput*>* images = [NSMutableArray new];
        for(NSDictionary* image in [input valueForKey:@"imageInputData"])
            [images addObject:[RGLWJSONConstructor imageInputFromJson: image]];
        config = [config initWithImageInputs:images];
    }

    if([input valueForKey:@"scenario"] != nil)
        config.scenario = [input valueForKey:@"scenario"];
    if([input valueForKey:@"onlineProcessingConfig"] != nil)
        config.onlineProcessingConfig = [self onlineProcessingConfigFromJson:[input valueForKey:@"onlineProcessingConfig"]];
    if([input valueForKey:@"livePortrait"] != nil)
        config.livePortrait = [self imageWithBase64:[input valueForKey:@"livePortrait"]];
    if([input valueForKey:@"extPortrait"] != nil)
        config.extPortrait = [self imageWithBase64:[input valueForKey:@"extPortrait"]];
    if([input valueForKey:@"oneShotIdentification"] != nil)
        config.oneShotIdentification = [input valueForKey:@"oneShotIdentification"];

    return config;
}

+(NSDictionary*)generateRecognizeConfig:(RGLRecognizeConfig*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"scenario"] = input.scenario;
    result[@"onlineProcessingConfig"] = [self generateOnlineProcessingConfig: input.onlineProcessingConfig];
    result[@"livePortrait"] = [self base64WithImage: input.livePortrait];
    result[@"extPortrait"] = [self base64WithImage: input.extPortrait];
    result[@"oneShotIdentification"] = @(input.oneShotIdentification);
    result[@"image"] = [self base64WithImage: input.image];
    result[@"data"] = [self base64Encode: input.imageData];
    if(input.images != nil) {
        NSMutableArray *array = [NSMutableArray new];
        for(UIImage* item in input.images)
            [array addObject:[self base64WithImage:item]];
        result[@"images"] = array;
    }
    if(input.imageInputs != nil) {
        NSMutableArray *array = [NSMutableArray new];
        for(RGLImageInput* item in input.imageInputs)
            [array addObject:[self generateImageInput:item]];
        result[@"imageInputData"] = array;
    }
    
    return result;
}

+(RGLBackendProcessingConfig*)backendProcessingConfigFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    RGLBackendProcessingConfig *result = [RGLBackendProcessingConfig new];
    
    if([input valueForKey:@"url"] != nil)
        result.url = [input valueForKey:@"url"];
    if([input valueForKey:@"httpHeaders"] != nil)
        result.httpHeaders = [input valueForKey:@"httpHeaders"];
    if([input valueForKey:@"rfidServerSideChipVerification"] != nil)
        result.rfidServerSideChipVerification = [input valueForKey:@"rfidServerSideChipVerification"];
    
    return result;
}

+(NSDictionary*)generateBackendProcessingConfig:(RGLBackendProcessingConfig*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"url"] = input.url;
    result[@"httpHeaders"] = input.httpHeaders;
    result[@"rfidServerSideChipVerification"] = input.rfidServerSideChipVerification;
    
    return result;
}

+(RGLImageQA*)imageQAFromJson:(NSDictionary*)input {
    RGLImageQA *result = [RGLImageQA new];
    [RGLWConfig setImageQA:result input:input];
    return result;
}

+(NSDictionary*)generateImageQA:(RGLImageQA*)input {
    return [RGLWConfig getImageQA:input];
}

+(RGLAuthenticityParams*)authenticityParamsFromJson:(NSDictionary*)input {
    RGLAuthenticityParams *result = [RGLAuthenticityParams defaultParams];
    [RGLWConfig setAuthenticityParams:result input:input];
    return result;
}

+(NSDictionary*)generateAuthenticityParams:(RGLAuthenticityParams*)input {
    return [RGLWConfig getAuthenticityParams:input];
}

+(RGLLivenessParams*)livenessParamsFromJson:(NSDictionary*)input {
    RGLLivenessParams *result = [RGLLivenessParams defaultParams];
    [RGLWConfig setLivenessParams:result input:input];
    return result;
}

+(NSDictionary*)generateLivenessParams:(RGLLivenessParams*)input {
    return [RGLWConfig getLivenessParams:input];
}

+(RGLeDLDataGroup*)eDLDataGroupsFromJson:(NSDictionary*)input {
    RGLeDLDataGroup *result = [RGLeDLDataGroup new];
    [RGLWConfig setDataGroups :result dict:input];
    return result;
}

+(NSDictionary*)generateEDLDataGroups:(RGLeDLDataGroup*)input {
    return [RGLWConfig getDataGroups:input];
}

+(RGLePassportDataGroup*)ePassportDataGroupsFromJson:(NSDictionary*)input {
    RGLePassportDataGroup *result = [RGLePassportDataGroup new];
    [RGLWConfig setDataGroups :result dict:input];
    return result;
}

+(NSDictionary*)generateEPassportDataGroups:(RGLePassportDataGroup*)input {
    return [RGLWConfig getDataGroups:input];
}

+(RGLeIDDataGroup*)eIDDataGroupsFromJson:(NSDictionary*)input {
    RGLeIDDataGroup *result = [RGLeIDDataGroup new];
    [RGLWConfig setDataGroups :result dict:input];
    return result;
}

+(NSDictionary*)generateEIDDataGroups:(RGLeIDDataGroup*)input {
    return [RGLWConfig getDataGroups:input];
}

+(RGLRFIDScenario*)rfidScenarioFromJson:(NSDictionary*)input {
    RGLRFIDScenario *result = [RGLRFIDScenario new];
    [RGLWConfig setRfidScenario:input :result];
    return result;
}

+(NSDictionary*)generateRFIDScenario:(RGLRFIDScenario*)input {
    return [RGLWConfig getRfidScenario:input];
}

+(RGLCustomization*)customizationFromJson:(NSDictionary*)input {
    RGLCustomization *result = [RGLCustomization new];
    [RGLWConfig setCustomization:input :result];
    return result;
}

+(NSDictionary*)generateCustomization:(RGLCustomization*)input {
    return [RGLWConfig getCustomization:input];
}

+(RGLFunctionality*)functionalityFromJson:(NSDictionary*)input {
    RGLFunctionality *result = [RGLFunctionality new];
    [RGLWConfig setFunctionality:input :result];
    return result;
}

+(NSDictionary*)generateFunctionality:(RGLFunctionality*)input {
    return [RGLWConfig getFunctionality:input];
}

+(RGLOnlineProcessingConfig*)onlineProcessingConfigFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    if([input valueForKey:@"mode"] == nil) return nil;
    
    RGLOnlineProcessingConfig *result = [[RGLOnlineProcessingConfig alloc] initWithMode:[[input valueForKey:@"mode"] integerValue]];
    
    if([input valueForKey:@"imageFormat"] != nil)
        result.imageFormat = [[input valueForKey:@"imageFormat"] integerValue];
    if([input valueForKey:@"url"] != nil)
        result.serviceURL = [input valueForKey:@"url"];
    if([input valueForKey:@"imageCompressionQuality"] != nil)
        result.imageCompressionQuality = [[input valueForKey:@"imageCompressionQuality"] floatValue];
    if([input valueForKey:@"processParams"] != nil) {
        RGLProcessParams *params = [RGLProcessParams new];
        [RGLWConfig setProcessParams:[input valueForKey:@"processParams"] :params];
        result.processParams = params;
    }
    
    return result;
}

+(NSDictionary*)generateOnlineProcessingConfig:(RGLOnlineProcessingConfig*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"mode"] = @(input.mode);
    result[@"url"] = input.serviceURL;
    result[@"processParams"] = [RGLWConfig getProcessParams:input.processParams];
    result[@"imageFormat"] = @(input.imageFormat);
    result[@"imageCompressionQuality"] = @(input.imageCompressionQuality);
    
    return result;
}

+(RGLGlaresCheckParams*)glaresCheckParamsFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    RGLGlaresCheckParams *result = [RGLGlaresCheckParams new];
    
    if([input valueForKey:@"imgMarginPart"] != nil)
        result.imgMarginPart = [input valueForKey:@"imgMarginPart"];
    if([input valueForKey:@"maxGlaringPart"] != nil)
        result.maxGlaringPart = [input valueForKey:@"maxGlaringPart"];
    
    return result;
}

+(NSDictionary*)generateGlaresCheckParams:(RGLGlaresCheckParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"imgMarginPart"] = input.imgMarginPart;
    result[@"maxGlaringPart"] = input.maxGlaringPart;
    
    return result;
}

+(RGLImageInput*)imageInputFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    
    NSInteger pageIndex = 0;
    if([input valueForKey:@"pageIndex"] != nil)
        pageIndex = [[input valueForKey:@"pageIndex"] integerValue];
    NSInteger light = 6;
    if([input valueForKey:@"light"] != nil)
        light = [[input valueForKey:@"light"] integerValue];
    if([input valueForKey:@"image"] != nil)
        return [[RGLImageInput alloc] initWithImage:[self imageWithBase64:[input valueForKey:@"image"]] light:light pageIndex:pageIndex];
    return nil;
}

+(NSDictionary*)generateImageInput:(RGLImageInput*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"light"] = @(input.lightType);
    result[@"image"] = [self base64WithImage:input.image];
    
    return result;
}

+(RGLPKDCertificate*)pkdCertificateFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    
    NSInteger type = [[input valueForKey:@"resourceType"] integerValue];
    NSData* binaryData = [self base64Decode:[input objectForKey:@"binaryData"]];
    NSData* privateKey = [self base64Decode:[input objectForKey:@"privateKey"]];
    
    return [[RGLPKDCertificate alloc] initWithBinaryData:binaryData resourceType:type privateKey:privateKey];
}

+(NSDictionary*)generatePKDCertificate:(RGLPKDCertificate*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"resourceType"] = @(input.resourceType);
    result[@"binaryData"] = [self base64Encode:input.binaryData];
    result[@"privateKey"] = [self base64Encode:input.privateKey];
    
    return result;
}

+(RGLRFIDParams*)rfidParamsFromJson:(NSDictionary*)input {
    RGLRFIDParams* result = [RGLRFIDParams new];

    if([input valueForKey:@"paIgnoreNotificationCodes"] != nil)
        result.paIgnoreNotificationCodes = [input valueForKey:@"paIgnoreNotificationCodes"];

    return result;
}

+(NSDictionary*)generateRFIDParams:(RGLRFIDParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"paIgnoreNotificationCodes"] = input.paIgnoreNotificationCodes;
    
    return result;
}

+(RGLProcessParams*)processParamsFromJson:(NSDictionary*)input {
    RGLProcessParams* result = [RGLProcessParams new];
    [RGLWConfig setProcessParams:input :result];
    return result;
}

+(NSDictionary*)generateProcessParams:(RGLProcessParams*)input {
    return [RGLWConfig getProcessParams:input];
}

+(RGLFaceAPIParams*)faceAPIParamsFromJson:(NSDictionary*)input {
    RGLFaceAPIParams* result = [RGLFaceAPIParams defaultParams];

    if([input valueForKey:@"url"] != nil)
        result.url = [input valueForKey:@"url"];
    if([input valueForKey:@"mode"] != nil)
        result.mode = [input valueForKey:@"mode"];
    if([input valueForKey:@"threshold"] != nil)
        result.threshold = [input valueForKey:@"threshold"];
    if([input valueForKey:@"searchParams"] != nil)
        result.searchParams = [self faceAPISearchParamsFromJson:[input valueForKey:@"searchParams"]];
    if([input valueForKey:@"serviceTimeout"] != nil)
        result.serviceTimeout = [input valueForKey:@"serviceTimeout"];
    if([input valueForKey:@"proxy"] != nil)
        result.proxy = [input valueForKey:@"proxy"];
    if([input valueForKey:@"proxyPassword"] != nil)
        result.proxyPassword = [input valueForKey:@"proxyPassword"];
    if([input valueForKey:@"proxyType"] != nil)
        result.proxyType = [input valueForKey:@"proxyType"];

    return result;
}

+(NSDictionary*)generateFaceAPIParams:(RGLFaceAPIParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"url"] = input.url;
    result[@"mode"] = input.mode;
    result[@"searchParams"] = [self generateFaceAPISearchParams:input.searchParams];
    result[@"threshold"] = input.threshold;
    result[@"serviceTimeout"] = input.serviceTimeout;
    result[@"proxy"] = input.proxy;
    result[@"proxyPassword"] = input.proxyPassword;
    result[@"proxyType"] = input.proxyType;
    
    return result;
}

+(RGLFaceAPISearchParams*)faceAPISearchParamsFromJson:(NSDictionary*)input {
    RGLFaceAPISearchParams* result = [RGLFaceAPISearchParams new];

    if([input valueForKey:@"limit"] != nil)
        result.limit = [input valueForKey:@"limit"];
    if([input valueForKey:@"threshold"] != nil)
        result.threshold = [input valueForKey:@"threshold"];
    if([input valueForKey:@"groupIds"] != nil)
        result.groupIDs = [input valueForKey:@"groupIds"];

    return result;
}

+(NSDictionary*)generateFaceAPISearchParams:(RGLFaceAPISearchParams*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"limit"] = input.limit;
    result[@"threshold"] = input.threshold;
    result[@"groupIds"] = input.groupIDs;
    
    return result;
}

+(RGLScenario*)scenarioFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    
    NSString* identifier = [input valueForKey:@"name"];
    double frameKWHLandscape = [[input valueForKey:@"frameKWHLandscape"] doubleValue];
    double frameKWHPortrait = [[input valueForKey:@"frameKWHPortrait"] doubleValue];
    double frameKWHDoublePageSpreadPortrait = [[input valueForKey:@"frameKWHDoublePageSpreadPortrait"] doubleValue];
    double frameKWHDoublePageSpreadLandscape = [[input valueForKey:@"frameKWHDoublePageSpreadLandscape"] doubleValue];
    NSString* scenarioDescription = [input valueForKey:@"description"];
    BOOL faceExt = [[input valueForKey:@"faceExt"] boolValue];
    BOOL multiPageOff = [[input valueForKey:@"multiPageOff"] boolValue];
    BOOL seriesProcessMode = [[input valueForKey:@"seriesProcessMode"] boolValue];
    NSString* caption = [input valueForKey:@"caption"];
    BOOL uvTorch = [[input valueForKey:@"uvTorch"] boolValue];
    NSInteger frameOrientation = [[input valueForKey:@"frameOrientation"] integerValue];
    BOOL manualCrop = [[input valueForKey:@"manualCrop"] boolValue];
    
    return [[RGLScenario new] initWithIdentifier:identifier frame:0 frameKWHLandscape:frameKWHLandscape frameKWHPortrait:frameKWHPortrait frameKWHDoublePageSpreadPortrait:frameKWHDoublePageSpreadPortrait frameKWHDoublePageSpreadLandscape:frameKWHDoublePageSpreadLandscape scenarioDescription:scenarioDescription barcodeExt:nil faceExt:faceExt multiPageOff:multiPageOff caption:caption uvTorch:uvTorch frameOrientation:frameOrientation seriesProcessMode:seriesProcessMode manualCrop:manualCrop];
}

+(NSDictionary*)generateScenario:(RGLScenario*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"name"] = input.identifier;
    result[@"frameKWHLandscape"] = @(input.frameKWHLandscape);
    result[@"frameKWHPortrait"] = @(input.frameKWHPortrait);
    result[@"frameKWHDoublePageSpreadPortrait"] = @(input.frameKWHDoublePageSpreadPortrait);
    result[@"frameKWHDoublePageSpreadLandscape"] = @(input.frameKWHDoublePageSpreadLandscape);
    result[@"description"] = input.scenarioDescription;
    result[@"faceExt"] = @(input.faceExt);
    result[@"multiPageOff"] = @(input.multiPageOff);
    result[@"seriesProcessMode"] = @(input.seriesProcessMode);
    result[@"caption"] = input.caption;
    result[@"uvTorch"] = @(input.uvTorch);
    result[@"frameOrientation"] = @(input.frameOrientation);
    result[@"manualCrop"] = @(input.manualCrop);
    
    return result;
}

+(CGRect)rectFromJson:(NSDictionary*)input {
    return CGRectMake(
                      [[input valueForKey:@"left"] floatValue],
                      [[input valueForKey:@"top"] floatValue],
                      [[input valueForKey:@"right"] floatValue] - [[input valueForKey:@"left"] floatValue],
                      [[input valueForKey:@"bottom"] floatValue] - [[input valueForKey:@"top"] floatValue]);
}

+(NSDictionary*)generateRect:(CGRect)input {
    NSMutableDictionary* result = [NSMutableDictionary new];
    if(input.origin.x == 0 && input.origin.y == 0) return nil;
    
    result[@"top"] = @(input.origin.y);
    result[@"left"] = @(input.origin.x);
    result[@"bottom"] = @(input.origin.y+input.size.height);
    result[@"right"] = @(input.origin.x+input.size.width);
    
    return result;
}

+(RGLDocumentReaderGraphicField*)documentReaderGraphicFieldFromJson:(NSDictionary*)input {
    return [[RGLDocumentReaderGraphicField alloc]
            initWithSourceType:[[input valueForKey:@"sourceType"] integerValue]
            fieldType:[[input valueForKey:@"fieldType"] integerValue]
            boundRect:[self rectFromJson: [input valueForKey:@"fieldRect"]]
            value:[self imageWithBase64: [input valueForKey:@"value"]]
            light:[[input valueForKey:@"light"] integerValue]
            pageIndex:[[input valueForKey:@"pageIndex"] integerValue]
            originalPageIndex:[[input valueForKey:@"originalPageIndex"] integerValue]];
}

+(NSDictionary*)generateDocumentReaderGraphicField:(RGLDocumentReaderGraphicField*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"sourceType"] = @(input.sourceType);
    result[@"fieldType"] = @(input.fieldType);
    result[@"fieldName"] = input.fieldName;
    result[@"fieldRect"] = [self generateRect:input.boundRect];
    result[@"value"] = [self base64WithImage:input.value];
    result[@"light"] = @(input.lightType);
    result[@"lightName"] = input.lightName;
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"originalPageIndex"] = @(input.originalPageIndex);
    
    return result;
}

+(RGLDocumentReaderGraphicResult*)documentReaderGraphicResultFromJson:(NSDictionary*)input {
    NSMutableArray<RGLDocumentReaderGraphicField*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"fields"]){
        [array addObject:[self documentReaderGraphicFieldFromJson: item]];
    }
    return [[RGLDocumentReaderGraphicResult alloc] initWithFields:array];
}

+(NSDictionary*)generateDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.fields != nil) {
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderGraphicField* item in input.fields)
            [array addObject:[self generateDocumentReaderGraphicField:item]];
        result[@"fields"] = array;
    }
    
    return result;
}

+(NSDictionary*)documentReaderValueDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"containerType"] = [input valueForKey:@"sourceType"];
    json[@"fieldRect"] = [input valueForKey:@"boundRect"];
    
    return json;
}

+(RGLDocumentReaderValue*)documentReaderValueFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderValue initWithJSON:[self documentReaderValueDictionaryFromJson:input] field:[RGLDocumentReaderTextField initWithJSON:[NSDictionary new] sourceList:[NSDictionary new]]];
}

+(NSDictionary*)generateDocumentReaderValue:(RGLDocumentReaderValue*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"sourceType"] = @(input.sourceType);
    result[@"value"] = input.value;
    result[@"originalValue"] = input.originalValue;
    result[@"boundRect"] = [self generateRect:input.boundRect];
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"probability"] = @(input.probability);
    if(input.originalSymbols != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderSymbol* item in input.originalSymbols)
            [array addObject:[self generateDocumentReaderSymbol:item]];
        result[@"originalSymbols"] = array;
    }
    result[@"rfidOrigin"] = [self generateDocumentReaderRfidOrigin:input.rfidOrigin];
    
    return result;
}

+(NSDictionary*)documentReaderTextFieldDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"sourceType"] = [[[input mutableArrayValueForKey:@"validityList"] objectAtIndex:0] valueForKey:@"sourceType"];
    json[@"sourceTypeLeft"] = [[[input mutableArrayValueForKey:@"comparisonList"] objectAtIndex:0] valueForKey:@"sourceTypeLeft"];
    json[@"sourceTypeRight"] = [[[input mutableArrayValueForKey:@"comparisonList"] objectAtIndex:0] valueForKey:@"sourceTypeRight"];
    NSMutableArray<NSDictionary*>* validityList = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"validityList"]){
        [validityList addObject:[self documentReaderValidityDictionaryFromJson:item]];
    }
    json[@"validityList"] = validityList;
    NSMutableArray<NSDictionary*>* comparisonList = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"comparisonList"]){
        [comparisonList addObject:[self documentReaderComparisonDictionaryFromJson:item]];
    }
    json[@"comparisonList"] = comparisonList;
    NSMutableArray<NSDictionary*>* valueList = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"values"]){
        [valueList addObject:[self documentReaderValueDictionaryFromJson:item]];
    }
    json[@"valueList"] = valueList;
    
    return json;
}

+(RGLDocumentReaderTextField*)documentReaderTextFieldFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderTextField initWithJSON:[self documentReaderTextFieldDictionaryFromJson:input] sourceList:[self documentReaderTextFieldDictionaryFromJson:input]];
}

+(NSDictionary*)generateDocumentReaderTextField:(RGLDocumentReaderTextField*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"fieldType"] = @(input.fieldType);
    result[@"fieldName"] = input.fieldName;
    result[@"lcid"] = @(input.lcid);
    result[@"lcidName"] = [RGLDocumentReaderTextField lcidName:input.lcid];
    if(input.values != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderValue* item in input.values)
            [array addObject:[self generateDocumentReaderValue:item]];
        result[@"values"] = array;
    }
    result[@"status"] = @(input.status);
    result[@"comparisonStatus"] = @(input.comparisonStatus);
    result[@"validityStatus"] = @(input.validityStatus);
    result[@"value"] = input.value;
    result[@"getValue"] = [self generateDocumentReaderValue:[input getValue]];
    if(input.comparisonList != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderComparison* item in input.comparisonList)
            [array addObject:[self generateDocumentReaderComparison:item]];
        result[@"comparisonList"] = array;
    }
    if(input.validityList != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderValidity* item in input.validityList)
            [array addObject:[self generateDocumentReaderValidity:item]];
        result[@"validityList"] = array;
    }
    
    return result;
}

+(NSDictionary*)documentReaderTextResultDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    NSMutableArray<NSDictionary*>* availableSourceList = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"availableSourceList"]){
        [availableSourceList addObject:[self documentReaderTextSourceDictionaryFromJson:item]];
    }
    json[@"availableSourceList"] = availableSourceList;
    NSMutableArray<NSDictionary*>* fields = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"fields"]){
        [fields addObject:[self documentReaderTextFieldDictionaryFromJson:item]];
    }
    json[@"fieldList"] = fields;
    
    return json;
}

+(RGLDocumentReaderTextResult*)documentReaderTextResultFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderTextResult initWithJSON:[self documentReaderTextResultDictionaryFromJson: input]];
}

+(NSDictionary*)generateDocumentReaderTextResult:(RGLDocumentReaderTextResult*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.fields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderTextField* item in input.fields)
            [array addObject:[self generateDocumentReaderTextField:item]];
        result[@"fields"] = array;
    }
    result[@"status"] = @(input.status);
    result[@"comparisonStatus"] = @(input.comparisonStatus);
    result[@"validityStatus"] = @(input.validityStatus);
    if(input.availableSourceList != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderTextSource* item in input.availableSourceList)
            [array addObject:[self generateDocumentReaderTextSource:item]];
        result[@"availableSourceList"] = array;
    }
    
    return result;
}

+(CGPoint)pointFromJson:(NSDictionary*)input {
    return CGPointMake([[input valueForKey:@"x"] floatValue], [[input valueForKey:@"y"] floatValue]);
}

+(NSDictionary*)generatePoint:(CGPoint)input {
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"x"] = [NSNumber numberWithFloat:input.x];
    result[@"y"] = [NSNumber numberWithFloat:input.y];
    
    return result;
}

+(RGLPosition*)positionFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"Width"] = [input valueForKey:@"width"];
    json[@"Height"] = [input valueForKey:@"height"];
    json[@"Angle"] = [input valueForKey:@"angle"];
    json[@"Center"] = [input valueForKey:@"center"];
    json[@"LeftTop"] = [input valueForKey:@"leftTop"];
    json[@"LeftBottom"] = [input valueForKey:@"leftBottom"];
    json[@"RightTop"] = [input valueForKey:@"rightTop"];
    json[@"RightBottom"] = [input valueForKey:@"rightBottom"];
    json[@"PerspectiveTr"] = [input valueForKey:@"perspectiveTr"];
    json[@"ObjArea"] = [input valueForKey:@"objArea"];
    json[@"ObjIntAngleDev"] = [input valueForKey:@"objIntAngleDev"];
    json[@"ResultStatus"] = [input valueForKey:@"resultStatus"];
    json[@"docFormat"] = [input valueForKey:@"docFormat"];
    json[@"page_idx"] = [input valueForKey:@"pageIndex"];
    json[@"Dpi"] = [input valueForKey:@"dpi"];
    json[@"Inverse"] = [input valueForKey:@"inverse"];
    
    return [RGLPosition initWithJSON:json];
}

+(NSDictionary*)generatePosition:(RGLPosition*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"width"] = @(input.size.width);
    result[@"height"] = @(input.size.height);
    result[@"angle"] = @(input.angle);
    result[@"center"] = [self generatePoint:input.center];
    result[@"leftTop"] = [self generatePoint:input.leftTop];
    result[@"leftBottom"] = [self generatePoint:input.leftBottom];
    result[@"rightTop"] = [self generatePoint:input.rightTop];
    result[@"rightBottom"] = [self generatePoint:input.rightBottom];
    result[@"perspectiveTr"] = @(input.perspectiveTr);
    result[@"objArea"] = @(input.objArea);
    result[@"objIntAngleDev"] = @(input.objIntAngleDev);
    result[@"resultStatus"] = @(input.resultStatus);
    result[@"docFormat"] = @(input.docFormat);
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"dpi"] = @(input.dpi);
    result[@"inverse"] = @(input.inverse);
    
    return result;
}

+(NSDictionary*)imageQualityDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"featureType"] = [input valueForKey:@"featureType"];
    json[@"type"] = [RGLWConfig imageQualityCheckTypeWithNumber:[input valueForKey:@"type"]];
    json[@"result"] = [input valueForKey:@"result"];
    NSDictionary* dict = @{@"List":[input valueForKey:@"boundRects"]};
    json[@"areas"] = dict;
    
    return json;
}

+(RGLImageQuality*)imageQualityFromJson:(NSDictionary*)input {
    return [RGLImageQuality initWithJSON:[self imageQualityDictionaryFromJson:input]];
}

+(NSDictionary*)generateImageQuality:(RGLImageQuality*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"type"] = [RGLWConfig generateImageQualityCheckType:input.type];
    result[@"result"] = @(input.result);
    result[@"featureType"] = @(input.featureType);
    if(input.boundRects != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSValue* item in input.boundRects)
            [array addObject:[self generateRect:[item CGRectValue]]];
        result[@"boundRects"] = array;
    }
    
    return result;
}

+(RGLImageQualityGroup*)imageQualityGroupFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Count"] = [input valueForKey:@"count"];
    json[@"result"] = [input valueForKey:@"result"];
    json[@"page_idx"] = [input valueForKey:@"pageIndex"];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"imageQualityList"]){
        [array addObject:[self imageQualityDictionaryFromJson:item]];
    }
    json[@"List"] = array;
    
    return [RGLImageQualityGroup initWithJSON:json];
}

+(NSDictionary*)generateImageQualityGroup:(RGLImageQualityGroup*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"count"] = @(input.count);
    result[@"result"] = @(input.result);
    if(input.imageQualityList != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLImageQuality* item in input.imageQualityList)
            [array addObject:[self generateImageQuality:item]];
        result[@"imageQualityList"] = array;
    }
    result[@"pageIndex"] = @(input.pageIndex);
    
    return result;
}

+(RGLDocumentReaderDocumentType*)documentReaderDocumentTypeFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"DocumentName"] = [input valueForKey:@"name"];
    json[@"ID"] = [input valueForKey:@"documentID"];
    json[@"ICAOCode"] = [input valueForKey:@"ICAOCode"];
    json[@"List"] = [input valueForKey:@"FDSID"];
    json[@"dType"] = [input valueForKey:@"dType"];
    json[@"dFormat"] = [input valueForKey:@"dFormat"];
    json[@"dMRZ"] = [input valueForKey:@"dMRZ"];
    json[@"isDeprecated"] = [input valueForKey:@"isDeprecated"];
    json[@"dDescription"] = [input valueForKey:@"dDescription"];
    json[@"dYear"] = [input valueForKey:@"dYear"];
    json[@"dCountryName"] = [input valueForKey:@"dCountryName"];
    json[@"page_idx"] = [input valueForKey:@"pageIndex"];
    json[@"FDSIDList"] = json.copy;
    
    return [RGLDocumentReaderDocumentType initWithJSON:json];
}

+(NSDictionary*)generateDocumentReaderDocumentType:(RGLDocumentReaderDocumentType*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"name"] = input.name;
    result[@"documentID"] = @(input.documentID);
    result[@"ICAOCode"] = input.ICAOCode;
    if(input.FDSID != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.FDSID)
            [array addObject:item];
        result[@"FDSID"] = array;
    }
    result[@"dType"] = @(input.dType);
    result[@"dFormat"] = @(input.dFormat);
    result[@"dMRZ"] = @(input.dMRZ);
    result[@"isDeprecated"] = @(input.isDeprecated);
    result[@"dDescription"] = input.dDescription;
    result[@"dYear"] = input.dYear;
    result[@"dCountryName"] = input.dCountryName;
    result[@"pageIndex"] = @(input.pageIndex);
    
    return result;
}

+(NSString*)generateDocumentReaderNotification:(RGLRFIDNotify*)input{
    if(input == nil) return nil;
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"notificationCode"] = @(input.code & -0x10000);
    result[@"dataFileType"] = @((int)input.attachment);
    result[@"progress"] = @((int)input.value);

    return [RGLWJSONConstructor dictToString: result];
}

+(NSDictionary*)accessControlProcedureTypeDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"ActiveOptionIdx"] = [input valueForKey:@"activeOptionIdx"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"Type"] = [input valueForKey:@"type"];
    
    return json;
}

+(RGLAccessControlProcedureType*)accessControlProcedureTypeFromJson:(NSDictionary*)input {
    return [RGLAccessControlProcedureType initWithJSON:[self accessControlProcedureTypeDictionaryFromJson:input]];
}

+(NSDictionary*)generateAccessControlProcedureType:(RGLAccessControlProcedureType*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"activeOptionIdx"] = @(input.activeOptionIdx);
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);
    
    return result;
}

+(NSDictionary*)fileDataDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"Length"] = [input valueForKey:@"length"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"Type"] = [input valueForKey:@"type"];
    
    return json;
}

+(RGLFileData*)fileDataFromJson:(NSDictionary*)input {
    return [RGLFileData initWithJSON:[self fileDataDictionaryFromJson:input]];
}

+(NSDictionary*)generateFileData:(RGLFileData*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);
    
    return result;
}

+(NSDictionary*)certificateDataDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"Length"] = [input valueForKey:@"length"];
    
    return json;
}

+(RGLCertificateData*)certificateDataFromJson:(NSDictionary*)input {
    return [RGLCertificateData initWithJSON:[self certificateDataDictionaryFromJson:input]];
}

+(NSDictionary*)generateCertificateData:(RGLCertificateData*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    
    return result;
}

+(NSDictionary*)securityObjectCertificatesDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Certificate_Data"] = [self certificateDataDictionaryFromJson: [input valueForKey:@"securityObject"]];
    
    return json;
}

+(RGLSecurityObjectCertificates*)securityObjectCertificatesFromJson:(NSDictionary*)input {
    return [RGLSecurityObjectCertificates initWithJSON:[self securityObjectCertificatesDictionaryFromJson:input]];
}

+(NSDictionary*)generateSecurityObjectCertificates:(RGLSecurityObjectCertificates*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"securityObject"] = [self generateCertificateData:input.securityObject];
    
    return result;
}

+(NSDictionary*)fileDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"FileData"] = [self fileDataDictionaryFromJson: [input valueForKey:@"fileData"]];
    json[@"SecurityObject_Certificates"] = [self securityObjectCertificatesDictionaryFromJson: [input valueForKey:@"certificates"]];
    json[@"FileID"] = [input valueForKey:@"fileID"];
    json[@"PA_Status"] = [input valueForKey:@"pAStatus"];
    json[@"ReadingStatus"] = [input valueForKey:@"readingStatus"];
    json[@"ReadingTime"] = [input valueForKey:@"readingTime"];
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"DocFields_Originals"] = [input valueForKey:@"docFieldsOriginals"];
    json[@"DocFields_Graphics"] = [input valueForKey:@"docFieldsGraphics"];
    json[@"DocFields_Text"] = [input valueForKey:@"docFieldsText"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    
    return json;
}

+(RGLFile*)fileFromJson:(NSDictionary*)input {
    return [RGLFile initWithJSON:[self fileDictionaryFromJson:input]];
}

+(NSDictionary*)generateFile:(RGLFile*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"fileData"] = [self generateFileData:input.fileData];
    result[@"fileID"] = input.fileID;
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"pAStatus"] = @(input.pAStatus);
    result[@"readingStatus"] = @(input.readingStatus);
    result[@"readingTime"] = @(input.readingTime);
    result[@"type"] = @(input.type);
    result[@"typeName"] = input.typeName;
    if(input.docFieldsText != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsText)
            [array addObject:item];
        result[@"docFieldsText"] = array;
    }
    if(input.docFieldsGraphics != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsGraphics)
            [array addObject:item];
        result[@"docFieldsGraphics"] = array;
    }
    if(input.docFieldsOriginals != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsOriginals)
            [array addObject:item];
        result[@"docFieldsOriginals"] = array;
    }
    result[@"certificates"] = [self generateSecurityObjectCertificates:input.certificates];
    
    return result;
}

+(NSDictionary*)applicationDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"ApplicationID"] = [input valueForKey:@"applicationID"];
    json[@"DataHashAlgorithm"] = [input valueForKey:@"dataHashAlgorithm"];
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"UnicodeVersion"] = [input valueForKey:@"unicodeVersion"];
    json[@"Version"] = [input valueForKey:@"version"];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"files"]){
        [array addObject:[self fileDictionaryFromJson:item]];
    }
    json[@"Files"] = array;
    
    return json;
}

+(RGLApplication*)applicationFromJson:(NSDictionary*)input {
    return [RGLApplication initWithJSON:[self applicationDictionaryFromJson:input]];
}

+(NSDictionary*)generateApplication:(RGLApplication*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"applicationID"] = input.applicationID;
    result[@"dataHashAlgorithm"] = input.dataHashAlgorithm;
    if(input.files != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLFile* item in input.files)
            [array addObject:[self generateFile:item]];
        result[@"files"] = array;
    }
    result[@"type"] = @(input.type);
    result[@"status"] = @(input.status);
    result[@"unicodeVersion"] = input.unicodeVersion;
    result[@"version"] = input.version;
    
    return result;
}

+(NSDictionary*)rfidValueDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"Length"] = [input valueForKey:@"length"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"Format"] = [input valueForKey:@"format"];
    
    return json;
}

+(RGLRFIDValue*)rfidValueFromJson:(NSDictionary*)input {
    return [RGLRFIDValue initWithJSON:[self rfidValueDictionaryFromJson:input]];
}

+(NSDictionary*)generateRFIDValue:(RGLRFIDValue*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);
    result[@"format"] = input.format;
    
    return result;
}

+(NSDictionary*)attributeDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"Value"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"value"]];
    
    return json;
}

+(RGLAttribute*)attributeFromJson:(NSDictionary*)input {
    return [RGLAttribute initWithJSON:[self attributeDictionaryFromJson:input]];
}

+(NSDictionary*)generateAttribute:(RGLAttribute*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"type"] = input.type;
    result[@"value"] = [self generateRFIDValue:input.value];
    
    return result;
}

+(NSDictionary*)authorityDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"FriendlyName"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"friendlyName"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"attributes"]){
        [array addObject:[self attributeDictionaryFromJson:item]];
    }
    json[@"Attributes"] = array;
    
    return json;
}

+(RGLAuthority*)authorityFromJson:(NSDictionary*)input {
    return [RGLAuthority initWithJSON:[self authorityDictionaryFromJson:input]];
}

+(NSDictionary*)generateAuthority:(RGLAuthority*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.attributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAttribute* item in input.attributes)
            [array addObject:[self generateAttribute:item]];
        result[@"attributes"] = array;
    }
    result[@"data"] = input.data;
    result[@"friendlyName"] = [self generateRFIDValue:input.friendlyName];
    
    return result;
}

+(NSDictionary*)extensionDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"Type"] = [input valueForKey:@"type"];
    
    return json;
}

+(RGLExtension*)extensionFromJson:(NSDictionary*)input {
    return [RGLExtension initWithJSON:[self extensionDictionaryFromJson:input]];
}

+(NSDictionary*)generateExtension:(RGLExtension*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = input.data;
    result[@"type"] = input.type;
    
    return result;
}

+(NSDictionary*)validityDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"NotAfter"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"notAfter"]];
    json[@"NotBefore"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"notBefore"]];
    
    return json;
}

+(RGLValidity*)validityFromJson:(NSDictionary*)input {
    return [RGLValidity initWithJSON:[self validityDictionaryFromJson:input]];
}

+(NSDictionary*)generateValidity:(RGLValidity*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"notAfter"] = [self generateRFIDValue:input.notAfter];
    result[@"notBefore"] = [self generateRFIDValue:input.notBefore];
    
    return result;
}

+(NSDictionary*)certificateChainDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Version"] = [input valueForKey:@"version"];
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"SubjectPKAlgorithm"] = [input valueForKey:@"subjectPKAlgorithm"];
    json[@"SignatureAlgorithm"] = [input valueForKey:@"signatureAlgorithm"];
    json[@"SerialNumber"] = [input valueForKey:@"serialNumber"];
    json[@"PA_Status"] = [input valueForKey:@"paStatus"];
    json[@"Origin"] = [input valueForKey:@"origin"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    json[@"Validity"] = [self validityDictionaryFromJson: [input valueForKey:@"validity"]];
    json[@"Subject"] = [self authorityDictionaryFromJson: [input valueForKey:@"subject"]];
    json[@"Issuer"] = [self authorityDictionaryFromJson: [input valueForKey:@"issuer"]];
    json[@"FileName"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"fileName"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"extensions"]){
        [array addObject:[self extensionDictionaryFromJson:item]];
    }
    json[@"Extensions"] = array;
    
    return json;
}

+(RGLCertificateChain*)certificateChainFromJson:(NSDictionary*)input {
    return [RGLCertificateChain initWithJSON:[self certificateChainDictionaryFromJson:input]];
}

+(NSDictionary*)generateCertificateChain:(RGLCertificateChain*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.extensions != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLExtension* item in input.extensions)
            [array addObject:[self generateExtension:item]];
        result[@"extensions"] = array;
    }
    result[@"fileName"] = [self generateRFIDValue:input.fileName];
    result[@"issuer"] = [self generateAuthority:input.issuer];
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"origin"] = @(input.origin);
    result[@"paStatus"] = @(input.paStatus);
    result[@"serialNumber"] = input.serialNumber;
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"subject"] = [self generateAuthority:input.subject];
    result[@"subjectPKAlgorithm"] = input.subjectPKAlgorithm;
    result[@"type"] = @(input.type);
    result[@"validity"] = [self generateValidity:input.validity];
    result[@"version"] = @(input.version);
    
    return result;
}

+(NSDictionary*)signerInfoDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"DataToHash"] = [input valueForKey:@"dataToHash"];
    json[@"DigestAlgorithm"] = [input valueForKey:@"digestAlgorithm"];
    json[@"PA_Status"] = [input valueForKey:@"paStatus"];
    json[@"SignatureAlgorithm"] = [input valueForKey:@"signatureAlgorithm"];
    json[@"Version"] = [input valueForKey:@"version"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    json[@"Issuer"] = [self authorityDictionaryFromJson: [input valueForKey:@"issuer"]];
    json[@"SerialNumber"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"serialNumber"]];
    json[@"Signature"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"signature"]];
    json[@"SubjectKeyIdentifier"] = [self rfidValueDictionaryFromJson: [input valueForKey:@"subjectKeyIdentifier"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"certificateChain"]){
        [array addObject:[self certificateChainDictionaryFromJson:item]];
    }
    json[@"CertificateChain"] = array;
    NSMutableArray<NSDictionary*>* array2 = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"signedAttributes"]){
        [array2 addObject:[self extensionDictionaryFromJson:item]];
    }
    json[@"SignedAttributes"] = array2;
    
    return json;
}

+(RGLSignerInfo*)signerInfoFromJson:(NSDictionary*)input {
    return [RGLSignerInfo initWithJSON:[self signerInfoDictionaryFromJson:input]];
}

+(NSDictionary*)generateSignerInfo:(RGLSignerInfo*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"dataToHash"] = input.dataToHash;
    result[@"digestAlgorithm"] = input.digestAlgorithm;
    result[@"paStatus"] = @(input.paStatus);
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"version"] = @(input.version);
    result[@"issuer"] = [self generateAuthority:input.issuer];
    result[@"serialNumber"] = [self generateRFIDValue:input.serialNumber];
    result[@"signature"] = [self generateRFIDValue:input.signature];
    if(input.signedAttributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLExtension* item in input.signedAttributes)
            [array addObject:[self generateExtension:item]];
        result[@"signedAttributes"] = array;
    }
    result[@"subjectKeyIdentifier"] = [self generateRFIDValue:input.subjectKeyIdentifier];
    if(input.certificateChain != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLCertificateChain* item in input.certificateChain)
            [array addObject:[self generateCertificateChain:item]];
        result[@"certificateChain"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    
    return result;
}

+(NSDictionary*)securityObjectDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"FileReference"] = [input valueForKey:@"fileReference"];
    json[@"ObjectType"] = [input valueForKey:@"objectType"];
    json[@"Version"] = [input valueForKey:@"version"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"signerInfos"]){
        [array addObject:[self signerInfoDictionaryFromJson:item]];
    }
    json[@"SignerInfos"] = array;
    
    return json;
}

+(RGLSecurityObject*)securityObjectFromJson:(NSDictionary*)input {
    return [RGLSecurityObject initWithJSON:[self securityObjectDictionaryFromJson:input]];
}

+(NSDictionary*)generateSecurityObject:(RGLSecurityObject*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"fileReference"] = @(input.fileReference);
    result[@"objectType"] = input.objectType;
    result[@"version"] = @(input.version);
    if(input.signerInfos != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLSignerInfo* item in input.signerInfos)
            [array addObject:[self generateSignerInfo:item]];
        result[@"signerInfos"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    
    return result;
}

+(NSDictionary*)cardPropertiesDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"ATQ_A"] = [input valueForKey:@"aTQA"];
    json[@"ATQ_B"] = [input valueForKey:@"aTQB"];
    json[@"ATR"] = [input valueForKey:@"aTR"];
    json[@"Baudrate1"] = [input valueForKey:@"baudrate1"];
    json[@"Baudrate2"] = [input valueForKey:@"baudrate2"];
    json[@"BitRateR"] = [input valueForKey:@"bitRateR"];
    json[@"BitRateS"] = [input valueForKey:@"bitRateS"];
    json[@"ChipType_A"] = [input valueForKey:@"chipTypeA"];
    json[@"MifareMemory"] = [input valueForKey:@"mifareMemory"];
    json[@"RFID_Type"] = [input valueForKey:@"rfidType"];
    json[@"SAK"] = [input valueForKey:@"sAK"];
    json[@"Support_4"] = [input valueForKey:@"support4"];
    json[@"Support_Mifare"] = [input valueForKey:@"supportMifare"];
    json[@"UID"] = [input valueForKey:@"uID"];
    
    return json;
}

+(RGLCardProperties*)cardPropertiesFromJson:(NSDictionary*)input {
    return [RGLCardProperties initWithJSON:[self cardPropertiesDictionaryFromJson:input]];
}

+(NSDictionary*)generateCardProperties:(RGLCardProperties*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"aTQA"] = @(input.aTQA);
    result[@"aTQB"] = input.aTQB;
    result[@"aTR"] = input.aTR;
    result[@"baudrate1"] = input.baudrate1;
    result[@"baudrate2"] = input.baudrate2;
    result[@"bitRateR"] = @(input.bitRateR);
    result[@"bitRateS"] = @(input.bitRateS);
    result[@"chipTypeA"] = @(input.chipTypeA);
    result[@"mifareMemory"] = @(input.mifareMemory);
    result[@"rfidType"] = @(input.rfidType);
    result[@"sAK"] = @(input.sAK);
    result[@"support4"] = @(input.support4);
    result[@"supportMifare"] = @(input.supportMifare);
    result[@"uID"] = input.uID;
    
    return result;
}

+(NSDictionary*)rfidSessionDataDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"ExtLeSupport"] = [input valueForKey:@"extLeSupport"];
    json[@"ProcessTime"] = [input valueForKey:@"processTime"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"TotalBytesReceived"] = [input valueForKey:@"totalBytesReceived"];
    json[@"TotalBytesSent"] = [input valueForKey:@"totalBytesSent"];
    json[@"DataGroups"] = [input valueForKey:@"dataGroups"];
    json[@"CardProperties"] = [self cardPropertiesDictionaryFromJson: [input valueForKey:@"cardProperties"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"accessControls"]){
        [array addObject:[self accessControlProcedureTypeDictionaryFromJson:item]];
    }
    json[@"AccessControls"] = array;
    NSMutableArray<NSDictionary*>* array2 = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"applications"]){
        [array2 addObject:[self applicationDictionaryFromJson:item]];
    }
    json[@"Applications"] = array2;
    NSMutableArray<NSDictionary*>* array3 = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"securityObjects"]){
        [array3 addObject:[self securityObjectDictionaryFromJson:item]];
    }
    json[@"SecurityObjects"] = array3;
    
    return json;
}

+(RGLRFIDSessionData*)rfidSessionDataFromJson:(NSDictionary*)input {
    NSMutableArray<RGLDataField*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"dataFields"]){
        [array addObject:[self dataFieldFromJson:item]];
    }
    return [RGLRFIDSessionData
            initWithJSON:[self rfidSessionDataDictionaryFromJson:input]
            dataFields:array];
}

+(NSDictionary*)generateRFIDSessionData:(RGLRFIDSessionData*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.accessControls != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAccessControlProcedureType* item in input.accessControls)
            [array addObject:[self generateAccessControlProcedureType:item]];
        result[@"accessControls"] = array;
    }
    if(input.applications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLApplication* item in input.applications)
            [array addObject:[self generateApplication:item]];
        result[@"applications"] = array;
    }
    if(input.securityObjects != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLSecurityObject* item in input.securityObjects)
            [array addObject:[self generateSecurityObject:item]];
        result[@"securityObjects"] = array;
    }
    result[@"cardProperties"] = [self generateCardProperties:input.cardProperties];
    result[@"totalBytesReceived"] = @(input.totalBytesReceived);
    result[@"totalBytesSent"] = @(input.totalBytesSent);
    result[@"status"] = @(input.status);
    result[@"extLeSupport"] = @(input.extLeSupport);
    result[@"processTime"] = @(input.processTime);
    if(input.dataGroups != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.dataGroups)
            if(item != nil)
                [array addObject:item];
        result[@"dataGroups"] = array;
    }
    if(input.dataFields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDataField* item in input.dataFields)
            if(item != nil)
                [array addObject:[self generateDataField:item]];
        result[@"dataFields"] = array;
    }
    
    return result;
}

+(NSDictionary*)dataFieldDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"FieldType"] = [input valueForKey:@"fieldType"];
    
    return json;
}

+(RGLDataField*)dataFieldFromJson:(NSDictionary*)input {
    return [RGLDataField initWithJSON:[self dataFieldDictionaryFromJson:input]];
}

+(NSDictionary*)generateDataField:(RGLDataField*)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return nil;

    result[@"data"] = input.data;
    result[@"fieldType"] = @(input.fieldType);

    return result;
}

+(RGLAuthenticityCheck*)authenticityCheckFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSMutableArray<RGLAuthenticityElement*> *array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"elements"])
        [array addObject:[self authenticityElementFromJson:item]];
    return [[RGLAuthenticityCheck alloc]
            initWithAuthenticity:[[input valueForKey:@"type"] integerValue]
            elements:array
            pageIndex:[[input valueForKey:@"pageIndex"] integerValue]];
}

+(NSDictionary*)generateAuthenticityCheck:(RGLAuthenticityCheck*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"type"] = @(input.type);
    result[@"typeName"] = input.typeName;
    result[@"status"] = @(input.status);
    if(input.elements != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAuthenticityElement* item in input.elements)
            [array addObject:[self generateAuthenticityElement:item]];
        result[@"elements"] = array;
    }
    result[@"pageIndex"] = @(input.pageIndex);
    
    return result;
}

+(NSDictionary*)pdf417InfoDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"bcErrorLevel"] = [input valueForKey:@"errorLevel"];
    json[@"bcColumn"] = [input valueForKey:@"columns"];
    json[@"bcRow"] = [input valueForKey:@"rows"];
    
    return json;
}

+(RGLPDF417Info*)pdf417InfoFromJson:(NSDictionary*)input {
    return [RGLPDF417Info initWithJSON:[self pdf417InfoDictionaryFromJson:input]];
}

+(NSDictionary*)generatePDF417Info:(RGLPDF417Info*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"errorLevel"] = @(input.errorLevel);
    result[@"columns"] = @(input.columns);
    result[@"rows"] = @(input.rows);
    
    return result;
}

+(RGLDocumentReaderBarcodeResult*)documentReaderBarcodeResultFromJson:(NSDictionary*)input {
    NSMutableArray<RGLDocumentReaderBarcodeField*> *array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"fields"])
        [array addObject:[self documentReaderBarcodeFieldFromJson:item]];
    return [[RGLDocumentReaderBarcodeResult alloc]
            initWithFields:array];
}

+(NSDictionary*)generateDocumentReaderBarcodeResult:(RGLDocumentReaderBarcodeResult*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.fields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderBarcodeField* item in input.fields)
            [array addObject:[self generateDocumentReaderBarcodeField:item]];
        result[@"fields"] = array;
    }
    
    return result;
}

+(RGLDocumentReaderBarcodeField*)documentReaderBarcodeFieldFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"bcType_DECODE"] = [input valueForKey:@"barcodeType"];
    json[@"bcCodeResult"] = [input valueForKey:@"status"];
    json[@"bcPDF417INFO"] = [self pdf417InfoDictionaryFromJson:[input valueForKey:@"pdf417Info"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    NSMutableDictionary* dict = [NSMutableDictionary new];
    dict[@"mData"] = [input valueForKey:@"data"];
    [array addObject:dict];
    json[@"bcDataModule"] = array;
    json[@"page_idx"] = [input valueForKey:@"pageIndex"];
    
    return [RGLDocumentReaderBarcodeField initWithJSON:json];
}

+(NSDictionary*)generateDocumentReaderBarcodeField:(RGLDocumentReaderBarcodeField*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"barcodeType"] = @(input.barcodeType);
    result[@"status"] = @(input.status);
    result[@"pdf417Info"] = [self generatePDF417Info:input.pdf417Info];
    result[@"data"] = [self base64Encode:input.data];
    result[@"pageIndex"] = @(input.pageIndex);
    
    return result;
}

+(RGLDocumentReaderAuthenticityResult*)documentReaderAuthenticityResultFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSMutableArray<RGLAuthenticityCheck*> *array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"checks"])
        [array addObject:[self authenticityCheckFromJson:item]];
    return [[RGLDocumentReaderAuthenticityResult alloc]
            initWithAuthenticityChecks:array];
}

+(NSDictionary*)generateDocumentReaderAuthenticityResult:(RGLDocumentReaderAuthenticityResult*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"status"] = @(input.status);
    if(input.checks != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAuthenticityCheck* item in input.checks)
            [array addObject:[self generateAuthenticityCheck:item]];
        result[@"checks"] = array;
    }
    
    return result;
}

+(RGLAuthenticityElement*)authenticityElementFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    return [[RGLAuthenticityElement alloc]
            initWithStatus:[[input valueForKey:@"status"] integerValue]
            elementType:[[input valueForKey:@"elementType"] integerValue]
            elementDiagnose:[[input valueForKey:@"elementDiagnose"] integerValue]];
}

+(NSDictionary*)generateAuthenticityElement:(RGLAuthenticityElement*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"status"] = @(input.status);
    result[@"elementType"] = @(input.elementType);
    result[@"elementTypeName"] = input.elementTypeName;
    result[@"elementDiagnose"] = @(input.elementDiagnose);
    result[@"elementDiagnoseName"] = input.elementDiagnoseName;
    
    return result;
}

+(NSDictionary*)paResourcesIssuerDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"Data"] = @{@"#text": [input valueForKey:@"data"]};
    json[@"FriendlyName"] = [input valueForKey:@"friendlyName"];
    NSMutableArray<NSDictionary*> *array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"attributes"])
        [array addObject:[self paAttributeDictionaryFromJson:item]];
    json[@"Attributes"] = @{@"RFID_Attribute_Name": array};
    
    return json;
}

+(RGLPAResourcesIssuer*)paResourcesIssuerFromJson:(NSDictionary*)input {
    return [RGLPAResourcesIssuer initWithJSON:[self paResourcesIssuerDictionaryFromJson: input]];
}

+(NSDictionary*)generatePAResourcesIssuer:(RGLPAResourcesIssuer*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = [self base64Encode:input.data];
    result[@"friendlyName"] = input.friendlyName;
    if(input.attributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPAAttribute* item in input.attributes)
            [array addObject:[self generatePAAttribute:item]];
        result[@"attributes"] = array;
    }
    
    return result;
}

+(NSDictionary*)paAttributeDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"Value"] = [input valueForKey:@"value"];
    json[@"Type"] = [input valueForKey:@"type"];
    
    return json;
}

+(RGLPAAttribute*)paAttributeFromJson:(NSDictionary*)input {
    return [RGLPAAttribute initWithJSON:[self paAttributeDictionaryFromJson: input]];
}

+(NSDictionary*)generatePAAttribute:(RGLPAAttribute*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"value"] = input.value;
    result[@"type"] = input.type;
    
    return result;
}

+(RGLTAChallenge*)taChallengeFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"#text"] = [self base64Decode:[input valueForKey:@"data"]];
    json[@"@auxPCD"] = [input valueForKey:@"auxPCD"];
    json[@"@challengePICC"] = [input valueForKey: @"challengePICC"];
    json[@"@hashPK"] = [input valueForKey:@"hashPK"];
    json[@"@idPICC"] = [input valueForKey:@"idPICC"];
    
    return [RGLTAChallenge initWithJSON:json];
}

+(NSDictionary*)generateTAChallenge:(RGLTAChallenge*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = [self base64Encode:input.data];
    result[@"auxPCD"] = input.auxPCD;
    result[@"challengePICC"] = input.challengePICC;
    result[@"hashPK"] = input.hashPK;
    result[@"idPICC"] = input.idPICC;
    
    return result;
}

+(NSDictionary*)documentReaderResultsStatusDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    
    json[@"detailsRFID"] = [self rfidSessionDataStatusDictionaryFromJson: [input valueForKey:@"detailsRFID"] ];
    
    return json;
}

+(RGLDocumentReaderResultsStatus*)documentReaderResultsStatusFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderResultsStatus performSelector:NSSelectorFromString(@"resultsStatusWithJSON:") withObject:[self documentReaderResultsStatusDictionaryFromJson: input]];
}

+(NSDictionary*)generateDocumentReaderResultsStatus:(RGLDocumentReaderResultsStatus*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"overallStatus"] = @(input.overallStatus);
    result[@"optical"] = @(input.optical);
    result[@"detailsOptical"] = [self generateOpticalStatus:input.detailsOptical];
    result[@"rfid"] = @(input.rfid);
    result[@"detailsRFID"] = [self generateRFIDSessionDataStatus:input.detailsRFID];
    result[@"portrait"] = @(input.portrait);
    result[@"stopList"] = @(input.stopList);
    
    return result;
}

+(RGLOpticalStatus*)opticalStatusFromJson:(NSDictionary*)input {
    return [RGLOpticalStatus performSelector:NSSelectorFromString(@"opticalStatusWithJSON:") withObject:input];
}

+(NSDictionary*)generateOpticalStatus:(RGLOpticalStatus*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"overallStatus"] = @(input.overallStatus);
    result[@"mrz"] = @(input.mrz);
    result[@"text"] = @(input.text);
    result[@"docType"] = @(input.docType);
    result[@"security"] = @(input.security);
    result[@"imageQA"] = @(input.imageQA);
    result[@"expiry"] = @(input.expiry);
    result[@"vds"] = @(input.vds);
    result[@"pagesCount"] = @(input.pagesCount);
    
    return result;
}

+(NSDictionary*)rfidSessionDataStatusDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"overallStatus"] = [input valueForKey:@"overallStatus"];
    json[@"AA"] = [input valueForKey:@"aa"];
    json[@"BAC"] = [input valueForKey:@"bac"];
    json[@"CA"] = [input valueForKey:@"ca"];
    json[@"PA"] = [input valueForKey:@"pa"];
    json[@"PACE"] = [input valueForKey:@"pace"];
    json[@"TA"] = [input valueForKey:@"ta"];
    
    return json;
}

+(RGLRFIDSessionDataStatus*)rfidSessionDataStatusFromJson:(NSDictionary*)input {
    return [RGLRFIDSessionDataStatus performSelector:NSSelectorFromString(@"rfidStatusWithJSON:") withObject:[self rfidSessionDataStatusDictionaryFromJson: input]];
}

+(NSDictionary*)generateRFIDSessionDataStatus:(RGLRFIDSessionDataStatus*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"aa"] = @(input.AA);
    result[@"bac"] = @(input.BAC);
    result[@"ca"] = @(input.CA);
    result[@"pa"] = @(input.PA);
    result[@"pace"] = @(input.PACE);
    result[@"ta"] = @(input.TA);
    result[@"overallStatus"] = @(input.overallStatus);
    
    return result;
}

+(NSDictionary*)vdsncDataDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Type"] = [input valueForKey:@"type"];
    json[@"Version"] = [input valueForKey:@"version"];
    json[@"IssuingCountry"] = [input valueForKey:@"issuingCountry"];
    json[@"Message"] = [input valueForKey:@"message"];
    json[@"SignatureAlg"] = [input valueForKey:@"signatureAlgorithm"];
    json[@"Notifications"] = [input valueForKey:@"notifications"];
    json[@"Signature"] = [self bytesDataDictionaryFromJson: [input valueForKey:@"signature"]];
    json[@"Certificate"] = [self bytesDataDictionaryFromJson: [input valueForKey:@"certificate"]];
    NSMutableArray<NSDictionary*>* array = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"certificateChain"]){
        [array addObject:[self certificateChainDictionaryFromJson:item]];
    }
    json[@"CertificateChain"] = array;
    
    return json;
}

+(RGLVDSNCData*)vdsncDataFromJson:(NSDictionary*)input {
    return [RGLVDSNCData performSelector:NSSelectorFromString(@"dataWithJSON:") withObject:[self vdsncDataDictionaryFromJson: input]];
}

+(NSDictionary*)generateVDSNCData:(RGLVDSNCData*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"type"] = input.type;
    result[@"version"] = @(input.version);
    result[@"issuingCountry"] = input.issuingCountry;
    result[@"message"] = input.message;
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"signature"] = [self generateBytesData:input.signature];
    result[@"certificate"] = [self generateBytesData:input.certificate];
    if(input.certificateChain != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLCertificateChain* item in input.certificateChain)
            [array addObject:[self generateCertificateChain:item]];
        result[@"certificateChain"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            [array addObject:item];
        result[@"notifications"] = array;
    }
    
    return result;
}

+(NSDictionary*)bytesDataDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"Data"] = [input valueForKey:@"data"];
    json[@"Length"] = [input valueForKey:@"length"];
    json[@"Status"] = [input valueForKey:@"status"];
    json[@"Type"] = [input valueForKey:@"type"];
    
    return json;
}

+(RGLBytesData*)bytesDataFromJson:(NSDictionary*)input {
    return [RGLBytesData performSelector:NSSelectorFromString(@"bytesDataWithJSON:") withObject:[self bytesDataDictionaryFromJson: input]];
}

+(NSDictionary*)generateBytesData:(RGLBytesData*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);
    
    return result;
}

+(NSString*)generateLicense:(RGLLicense*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.expiryDate != nil) {
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setFormatterBehavior:NSDateFormatterBehaviorDefault];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        result[@"expiryDate"] = [formatter stringFromDate:input.expiryDate];
    } else result[@"expiryDate"] = nil;
    
    result[@"countryFilter"] = input.countryFilter;
    result[@"isRfidAvailable"] = input.rfidAvailable ? @YES : @NO;
    
    return [RGLWJSONConstructor dictToString: result];
}

+(NSString*)generateDocReaderVersion:(RGLDocReaderVersion*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"api"] = input.api;
    result[@"core"] = input.core;
    result[@"coreMode"] = input.coreMode;
    result[@"database"] = [self generateDocReaderDocumentsDatabase:input.database];
    
    return [RGLWJSONConstructor dictToString: result];
}

+(RGLDocReaderDocumentsDatabase*)docReaderDocumentsDatabaseFromJson:(NSDictionary*)input {
    if(input == nil) return nil;
    NSMutableDictionary* json = [NSMutableDictionary new];
    
    json[@"id"] = [input valueForKey:@"databaseID"];
    json[@"version"] = [input valueForKey:@"version"];
    json[@"export_date"] = [input valueForKey:@"date"];
    json[@"description"] = [input valueForKey:@"databaseDescription"];
    json[@"countriesNumber"] = [input valueForKey:@"countriesNumber"];
    json[@"documentsNumber"] = [input valueForKey:@"documentsNumber"];
    json[@"size"] = [input valueForKey:@"size"];
    
    return [RGLDocReaderDocumentsDatabase initWithJSON:json];
}

+(NSDictionary*)generateDocReaderDocumentsDatabase:(RGLDocReaderDocumentsDatabase*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"databaseID"] = input.databaseID;
    result[@"version"] = input.version;
    result[@"date"] = input.date;
    result[@"databaseDescription"] = input.databaseDescription;
    result[@"countriesNumber"] = @(input.countriesNumber);
    result[@"documentsNumber"] = @(input.documentsNumber);
    result[@"size"] = input.size;
    
    return result;
}

+(NSDictionary*)documentReaderComparisonDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    json[@"sourceLeft"] = @"sourceTypeLeft";
    json[@"sourceRight"] = @"sourceTypeRight";
    return json;
}

+(RGLDocumentReaderComparison*)documentReaderComparisonFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderComparison initWithJSON:[self documentReaderComparisonDictionaryFromJson: input] sourceList:[self documentReaderComparisonDictionaryFromJson: input]];
}

+(NSDictionary*)generateDocumentReaderComparison:(RGLDocumentReaderComparison*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"sourceTypeLeft"] = @(input.sourceTypeLeft);
    result[@"sourceTypeRight"] = @(input.sourceTypeRight);
    result[@"status"] = @(input.status);
    
    return result;
}

+(RGLDocumentReaderRfidOrigin*)documentReaderRfidOriginFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderRfidOrigin initWithJSON:input];
}

+(NSDictionary*)generateDocumentReaderRfidOrigin:(RGLDocumentReaderRfidOrigin*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"dg"] = @(input.dg);
    result[@"dgTag"] = @(input.dgTag);
    result[@"entryView"] = @(input.entryView);
    result[@"tagEntry"] = @(input.tagEntry);
    
    return result;
}

+(NSDictionary*)documentReaderTextSourceDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    json[@"containerType"] = [input valueForKey:@"sourceType"];
    return json;
}

+(RGLDocumentReaderTextSource*)documentReaderTextSourceFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderTextSource initWithJSON:[self documentReaderTextSourceDictionaryFromJson: input]];
}

+(NSDictionary*)generateDocumentReaderTextSource:(RGLDocumentReaderTextSource*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"sourceType"] = @(input.sourceType);
    result[@"source"] = input.source;
    result[@"validityStatus"] = @(input.validityStatus);
    
    return result;
}

+(RGLDocumentReaderSymbol*)documentReaderSymbolFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderSymbol initWithJSON:input];
}

+(NSDictionary*)generateDocumentReaderSymbol:(RGLDocumentReaderSymbol*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"code"] = @(input.code);
    result[@"rect"] = [self generateRect:input.rect];
    result[@"probability"] = @(input.probability);
    
    return result;
}

+(NSDictionary*)documentReaderValidityDictionaryFromJson:(NSDictionary*)input {
    NSMutableDictionary* json = input.mutableCopy;
    json[@"source"] = @"sourceType";
    return json;
}

+(RGLDocumentReaderValidity*)documentReaderValidityFromJson:(NSDictionary*)input {
    return [RGLDocumentReaderValidity initWithJSON:[self documentReaderValidityDictionaryFromJson:input] sourceList:[self documentReaderValidityDictionaryFromJson:input]];
}

+(NSDictionary*)generateDocumentReaderValidity:(RGLDocumentReaderValidity*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    result[@"sourceType"] = @(input.sourceType);
    result[@"status"] = @(input.status);
    
    return result;
}

+(RGLDocumentReaderResults*)documentReaderResultsFromJson:(NSDictionary*)input {
    NSMutableArray<RGLDocumentReaderDocumentType*>* documentType = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"documentType"]){
        [documentType addObject:[self documentReaderDocumentTypeFromJson:item]];
    }
    NSMutableArray<RGLDocumentPosition*>* documentPosition = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"documentPosition"]){
        [documentPosition addObject:(RGLDocumentPosition*)[self positionFromJson:item]];
    }
    NSMutableArray<RGLBarcodePosition*>* barcodePosition = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"barcodePosition"]){
        [barcodePosition addObject:(RGLBarcodePosition*)[self positionFromJson:item]];
    }
    NSMutableArray<RGLMrzPosition*>* mrzPosition = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"mrzPosition"]){
        [mrzPosition addObject:(RGLMrzPosition*)[self positionFromJson:item]];
    }
    NSMutableArray<RGLImageQualityGroup*>* imageQuality = [NSMutableArray new];
    for(NSDictionary* item in [input valueForKey:@"imageQuality"]){
        [imageQuality addObject:[self imageQualityGroupFromJson:item]];
    }
    
    return [[RGLDocumentReaderResults alloc]
            initWithDocumentTypes:documentType
            textResult:[self documentReaderTextResultFromJson: [input valueForKey:@"textResult"]]
            graphicResult:[self documentReaderGraphicResultFromJson: [input valueForKey:@"graphicResult"]]
            rawResult:[input valueForKey:@"rawResult"]
            documentPosition:documentPosition
            barcodePosition:barcodePosition
            mrzPosition:mrzPosition
            imageQualityGroup:imageQuality
            authenticityResults:[self documentReaderAuthenticityResultFromJson: [input valueForKey:@"authenticityResult"]]
            rfidSessionData:[self rfidSessionDataFromJson: [input valueForKey:@"rfidSessionData"]]
            chipPage:[[input valueForKey:@"chipPage"] integerValue]
            barcodeResult:[self documentReaderBarcodeResultFromJson: [input valueForKey:@"barcodeResult"]]
            vdsncData:[self vdsncDataFromJson: [input valueForKey:@"vdsncData"]]
            status:[self documentReaderResultsStatusFromJson: [input valueForKey:@"status"]]
            processingFinished:[[input valueForKey:@"processingFinishedStatus"] integerValue]
            morePagesAvailable:[[input valueForKey:@"morePagesAvailable"] integerValue]
            elapsedTime:[[input valueForKey:@"elapsedTime"] integerValue]
            elapsedTimeRFID:[[input valueForKey:@"elapsedTimeRFID"] integerValue]
            transactionInfo:[self transactionInfoFromJson:[input valueForKey:@"transactionInfo"]]];
}

+(NSDictionary*)generateDocumentReaderResults:(RGLDocumentReaderResults*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if(input.documentType != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderDocumentType* item in input.documentType)
            [array addObject:[self generateDocumentReaderDocumentType:item]];
        result[@"documentType"] = array;
    }
    result[@"textResult"] = [self generateDocumentReaderTextResult:input.textResult];
    result[@"graphicResult"] = [self generateDocumentReaderGraphicResult:input.graphicResult];
    if(input.documentPosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.documentPosition)
            [array addObject:[self generatePosition:item]];
        result[@"documentPosition"] = array;
    }
    if(input.barcodePosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.barcodePosition)
            [array addObject:[self generatePosition:item]];
        result[@"barcodePosition"] = array;
    }
    if(input.mrzPosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.mrzPosition)
            [array addObject:[self generatePosition:item]];
        result[@"mrzPosition"] = array;
    }
    if(input.imageQualityGroup != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLImageQualityGroup* item in input.imageQualityGroup)
            [array addObject:[self generateImageQualityGroup:item]];
        result[@"imageQuality"] = array;
    }
    result[@"authenticityResult"] = [self generateDocumentReaderAuthenticityResult:input.authenticityResults];
    result[@"rfidSessionData"] = [self generateRFIDSessionData:input.rfidSessionData];
    result[@"chipPage"] = @(input.chipPage);
    result[@"barcodeResult"] = [self generateDocumentReaderBarcodeResult:input.barcodeResult];
    result[@"processingFinishedStatus"] = @(input.processingFinishedStatus);
    result[@"morePagesAvailable"] = @(input.morePagesAvailable);
    result[@"elapsedTime"] = @(input.elapsedTime);
    result[@"elapsedTimeRFID"] = @(input.elapsedTimeRFID);
    result[@"rawResult"] = input.rawResult;
    result[@"status"] = [self generateDocumentReaderResultsStatus:input.status];
    result[@"vdsncData"] = [self generateVDSNCData:input.vdsncData];
    result[@"transactionInfo"] = [self generateTransactionInfo:input.transactionInfo];
    
    return result;
}

+(NSDictionary*)generateDictionary:(NSDictionary<NSNumber*, NSNumber*>*)input {
    if(input == nil) return nil;
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    for(NSNumber* key in input)
        result[[key stringValue]] = input[key];
    
    return result;
}

@end
