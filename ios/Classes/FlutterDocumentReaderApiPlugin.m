//
//  FlutterDocumentReaderApiPlugin.m
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

#import "FlutterDocumentReaderApiPlugin.h"

NSMutableDictionary<NSString*, FlutterEventSink>* RGLWEventSinks;

@implementation RGLWCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWDatabaseProgressStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWDatabaseProgressEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWDatabaseProgressEvent] = nil;
    return nil;
}

@end

@implementation RGLWRfidOnProgressEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWRfidOnProgressEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWRfidOnProgressEvent] = nil;
    return nil;
}
@end

@implementation RGLWRfidOnChipDetectedEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWRfidOnChipDetectedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWRfidOnChipDetectedEvent] = nil;
    return nil;
}
@end

@implementation RGLWRfidOnRetryReadChipEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWRfidOnRetryReadChipEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWRfidOnRetryReadChipEvent] = nil;
    return nil;
}
@end

@implementation RGLWPACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWPaCertificateCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWPaCertificateCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWTACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWTaCertificateCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWTaCertificateCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWTASignatureCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWTaSignatureCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWTaSignatureCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWBleOnServiceConnectedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWBleOnServiceConnectedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWBleOnServiceConnectedEvent] = nil;
    return nil;
}
@end

@implementation RGLWBleOnServiceDisconnectedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWBleOnServiceDisconnectedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWBleOnServiceDisconnectedEvent] = nil;
    return nil;
}
@end

@implementation RGLWBleOnDeviceReadyStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWBleOnDeviceReadyEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWBleOnDeviceReadyEvent] = nil;
    return nil;
}
@end

@implementation RGLWVideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWVideoEncoderCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWVideoEncoderCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWOnCustomButtonTappedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWEventSinks[RGLWOnCustomButtonTappedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWEventSinks[RGLWOnCustomButtonTappedEvent] = nil;
    return nil;
}
@end


@implementation FlutterDocumentReaderApiPlugin

static FlutterMethodChannel * _channel;
+ (FlutterMethodChannel *)channel { return _channel; }
+ (void)setChannel:(FlutterMethodChannel *)newChannel { _channel = newChannel; }

static RGLWEventSender sendEvent = ^(NSString* event, id _Nullable data) {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(RGLWEventSinks[event] != nil) RGLWEventSinks[event](data);
    });
};

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    RGLWEventSinks = [NSMutableDictionary new];
    [self setupEventChannel:registrar :RGLWCompletionEvent :[RGLWCompletionStreamHandler new]];
    [self setupEventChannel:registrar :RGLWDatabaseProgressEvent :[RGLWDatabaseProgressStreamHandler new]];
    [self setupEventChannel:registrar :RGLWRfidOnProgressEvent :[RGLWRfidOnProgressEventStreamHandler new]];
    [self setupEventChannel:registrar :RGLWRfidOnChipDetectedEvent :[RGLWRfidOnChipDetectedEventStreamHandler new]];
    [self setupEventChannel:registrar :RGLWRfidOnRetryReadChipEvent :[RGLWRfidOnRetryReadChipEventStreamHandler new]];
    [self setupEventChannel:registrar :RGLWPaCertificateCompletionEvent :[RGLWPACertificateCompletionStreamHandler new]];
    [self setupEventChannel:registrar :RGLWTaCertificateCompletionEvent :[RGLWTACertificateCompletionStreamHandler new]];
    [self setupEventChannel:registrar :RGLWTaSignatureCompletionEvent :[RGLWTASignatureCompletionStreamHandler new]];
    [self setupEventChannel:registrar :RGLWBleOnServiceConnectedEvent :[RGLWBleOnServiceConnectedStreamHandler new]];
    [self setupEventChannel:registrar :RGLWBleOnServiceDisconnectedEvent :[RGLWBleOnServiceDisconnectedStreamHandler new]];
    [self setupEventChannel:registrar :RGLWBleOnDeviceReadyEvent :[RGLWBleOnDeviceReadyStreamHandler new]];
    [self setupEventChannel:registrar :RGLWVideoEncoderCompletionEvent :[RGLWVideoEncoderCompletionStreamHandler new]];
    [self setupEventChannel:registrar :RGLWOnCustomButtonTappedEvent :[RGLWOnCustomButtonTappedStreamHandler new]];
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_document_reader_api/method" binaryMessenger:[registrar messenger]];
    [FlutterDocumentReaderApiPlugin setChannel:channel];
    FlutterDocumentReaderApiPlugin* instance = [FlutterDocumentReaderApiPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

+ (void)setupEventChannel:(NSObject<FlutterPluginRegistrar>*)registrar :(NSString*)eventId :(NSObject<FlutterStreamHandler>*)handler {
    [[FlutterEventChannel eventChannelWithName:[NSString stringWithFormat:@"%@%@", @"flutter_document_reader_api/event/", eventId] binaryMessenger:[registrar messenger]] setStreamHandler:handler];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* action = call.method;
    NSMutableArray* args = call.arguments;
    
    RGLWCallback successCallback = ^(id _Nullable data){
        result(data);
    };
    RGLWCallback errorCallback = ^(NSString* error){
        result([FlutterError errorWithCode:@"error" message:error details:nil]);
    };
    
    if([action isEqualToString:@"getDocumentReaderIsReady"])
        [self getDocumentReaderIsReady :successCallback :errorCallback];
    else if([action isEqualToString:@"getDocumentReaderStatus"])
        [self getDocumentReaderStatus :successCallback :errorCallback];
    else if([action isEqualToString:@"isAuthenticatorAvailableForUse"])
        [self isAuthenticatorAvailableForUse :successCallback :errorCallback];
    else if([action isEqualToString:@"isBlePermissionsGranted"])
        [self isBlePermissionsGranted :successCallback :errorCallback];
    else if([action isEqualToString:@"getRfidSessionStatus"])
        [self getRfidSessionStatus :successCallback :errorCallback];
    else if([action isEqualToString:@"setRfidSessionStatus"])
        [self setRfidSessionStatus :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getTag"])
        [self getTag :successCallback :errorCallback];
    else if([action isEqualToString:@"setTag"])
        [self setTag :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getTenant"])
        [self getTenant :successCallback :errorCallback];
    else if([action isEqualToString:@"setTenant"])
        [self setTenant :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getEnv"])
        [self getEnv :successCallback :errorCallback];
    else if([action isEqualToString:@"setEnv"])
        [self setEnv :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getFunctionality"])
        [self getFunctionality :successCallback :errorCallback];
    else if([action isEqualToString:@"setFunctionality"])
        [self setFunctionality :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getProcessParams"])
        [self getProcessParams :successCallback :errorCallback];
    else if([action isEqualToString:@"setProcessParams"])
        [self setProcessParams :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getCustomization"])
        [self getCustomization :successCallback :errorCallback];
    else if([action isEqualToString:@"setCustomization"])
        [self setCustomization :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getRfidScenario"])
        [self getRfidScenario :successCallback :errorCallback];
    else if([action isEqualToString:@"setRfidScenario"])
        [self setRfidScenario :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"resetConfiguration"])
        [self resetConfiguration :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReader"])
        [self initializeReader :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReaderWithBleDeviceConfig"])
        [self initializeReaderWithBleDeviceConfig :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"deinitializeReader"])
        [self deinitializeReader :successCallback :errorCallback];
    else if([action isEqualToString:@"prepareDatabase"])
        [self prepareDatabase :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"removeDatabase"])
        [self removeDatabase :successCallback :errorCallback];
    else if([action isEqualToString:@"runAutoUpdate"])
        [self runAutoUpdate :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"cancelDBUpdate"])
        [self cancelDBUpdate :successCallback :errorCallback];
    else if([action isEqualToString:@"checkDatabaseUpdate"])
        [self checkDatabaseUpdate :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"scan"])
        [self scan :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognize"])
        [self recognize :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"startNewPage"])
        [self startNewPage :successCallback :errorCallback];
    else if([action isEqualToString:@"stopScanner"])
        [self stopScanner :successCallback :errorCallback];
    else if([action isEqualToString:@"startRFIDReader"])
        [self startRFIDReader :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"readRFID"])
        [self readRFID :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"stopRFIDReader"])
        [self stopRFIDReader :successCallback :errorCallback];
    else if([action isEqualToString:@"providePACertificates"])
        [self providePACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTACertificates"])
        [self provideTACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTASignature"])
        [self provideTASignature :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setTCCParams"])
        [self setTCCParams :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"addPKDCertificates"])
        [self addPKDCertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"clearPKDCertificates"])
        [self clearPKDCertificates :successCallback :errorCallback];
    else if([action isEqualToString:@"startNewSession"])
        [self startNewSession :successCallback :errorCallback];
    else if([action isEqualToString:@"startBluetoothService"])
        [self startBluetoothService :successCallback :errorCallback];
    else if([action isEqualToString:@"setLocalizationDictionary"])
        [self setLocalizationDictionary :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getLicense"])
        [self getLicense :successCallback :errorCallback];
    else if([action isEqualToString:@"getAvailableScenarios"])
        [self getAvailableScenarios :successCallback :errorCallback];
    else if([action isEqualToString:@"getIsRFIDAvailableForUse"])
        [self getIsRFIDAvailableForUse :successCallback :errorCallback];
    else if([action isEqualToString:@"getDocReaderVersion"])
        [self getDocReaderVersion :successCallback :errorCallback];
    else if([action isEqualToString:@"getDocReaderDocumentsDatabase"])
        [self getDocReaderDocumentsDatabase :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByType"])
        [self textFieldValueByType :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByTypeLcid"])
        [self textFieldValueByTypeLcid :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByTypeSource"])
        [self textFieldValueByTypeSource :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByTypeLcidSource"])
        [self textFieldValueByTypeLcidSource :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByTypeSourceOriginal"])
        [self textFieldValueByTypeSourceOriginal :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldValueByTypeLcidSourceOriginal"])
        [self textFieldValueByTypeLcidSourceOriginal :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :[args objectAtIndex:4] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldByType"])
        [self textFieldByType :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"textFieldByTypeLcid"])
        [self textFieldByTypeLcid :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldByTypeSource"])
        [self graphicFieldByTypeSource :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldByTypeSourcePageIndex"])
        [self graphicFieldByTypeSourcePageIndex :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldByTypeSourcePageIndexLight"])
        [self graphicFieldByTypeSourcePageIndexLight :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :[args objectAtIndex:4] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldImageByType"])
        [self graphicFieldImageByType :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldImageByTypeSource"])
        [self graphicFieldImageByTypeSource :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldImageByTypeSourcePageIndex"])
        [self graphicFieldImageByTypeSourcePageIndex :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :successCallback :errorCallback];
    else if([action isEqualToString:@"graphicFieldImageByTypeSourcePageIndexLight"])
        [self graphicFieldImageByTypeSourcePageIndexLight :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :[args objectAtIndex:3] :[args objectAtIndex:4] :successCallback :errorCallback];
    else if([action isEqualToString:@"containers"])
        [self containers :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"encryptedContainers"])
        [self encryptedContainers :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"finalizePackage"])
        [self finalizePackage :successCallback :errorCallback];
    else if([action isEqualToString:@"getTranslation"])
        [self getTranslation :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else
        errorCallback([NSString stringWithFormat:@"%@/%@", @"method not implemented: ", action]);
}

NSString* RGLWCompletionEvent = @"completion";
NSString* RGLWDatabaseProgressEvent = @"database_progress";

NSString* RGLWRfidOnProgressEvent = @"rfidOnProgressCompletion";
NSString* RGLWRfidOnChipDetectedEvent = @"rfidOnChipDetectedEvent";
NSString* RGLWRfidOnRetryReadChipEvent = @"rfidOnRetryReadChipEvent";

NSString* RGLWPaCertificateCompletionEvent = @"pa_certificate_completion";
NSString* RGLWTaCertificateCompletionEvent = @"ta_certificate_completion";
NSString* RGLWTaSignatureCompletionEvent = @"ta_signature_completion";

NSString* RGLWBleOnServiceConnectedEvent = @"bleOnServiceConnectedEvent";
NSString* RGLWBleOnServiceDisconnectedEvent = @"bleOnServiceDisconnectedEvent";
NSString* RGLWBleOnDeviceReadyEvent = @"bleOnDeviceReadyEvent";

NSString* RGLWVideoEncoderCompletionEvent = @"video_encoder_completion";
NSString* RGLWOnCustomButtonTappedEvent = @"onCustomButtonTappedEvent";

- (void) getDocumentReaderIsReady:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLDocReader.shared isDocumentReaderIsReady] ? @YES : @NO);
}

- (void) getDocumentReaderStatus:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback(RGLDocReader.shared.documentReaderStatus);
}

- (void) isAuthenticatorAvailableForUse:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback(RGLDocReader.shared.isAuthenticatorAvailableForUse ? @YES : @NO);
}

- (void) isBlePermissionsGranted:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    errorCallback(@"isBlePermissionsGranted() is an android-only method");
}

- (void) getRfidSessionStatus:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback(RGLDocReader.shared.rfidSessionStatus);
}

- (void) setRfidSessionStatus:(NSString*)status :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.rfidSessionStatus = status;
}

- (void) getTag:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLDocReader.shared tag]);
}

- (void) setTag:(NSString*)tag :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setTag:tag];
}

- (void) getTenant:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLDocReader.shared tenant]);
}

- (void) setTenant:(NSString*)tag :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setTenant:tag];
}

- (void) getEnv:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLDocReader.shared env]);
}

- (void) setEnv:(NSString*)tag :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setEnv:tag];
}

- (void) getFunctionality:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLWJSONConstructor dictToString: [RGLWConfig getFunctionality: RGLDocReader.shared.functionality]]);
}

- (void) setFunctionality:(NSDictionary*)functionality :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWConfig setFunctionality:functionality :RGLDocReader.shared.functionality];
    successCallback(@"");
}

- (void) getProcessParams:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLWJSONConstructor dictToString: [RGLWConfig getProcessParams:RGLDocReader.shared.processParams]]);
}

- (void) setProcessParams:(NSDictionary*)processParams :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWConfig setProcessParams:processParams :RGLDocReader.shared.processParams];
    successCallback(@"");
}

- (void) getCustomization:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLWJSONConstructor dictToString: [RGLWConfig getCustomization :RGLDocReader.shared.customization]]);
}

- (void) setCustomization:(NSDictionary*)customization :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWConfig setCustomization:customization :RGLDocReader.shared.customization];
    successCallback(@"");
}

- (void) getRfidScenario:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback([RGLWJSONConstructor dictToString: [RGLWConfig getRfidScenario:RGLDocReader.shared.rfidScenario]]);
}

- (void) setRfidScenario:(NSDictionary*)rfidScenario :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWConfig setRfidScenario:rfidScenario :RGLDocReader.shared.rfidScenario];
}

- (void) resetConfiguration:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.functionality = [RGLFunctionality new];
    RGLDocReader.shared.processParams = [RGLProcessParams new];
    RGLDocReader.shared.customization = [RGLCustomization new];
    RGLDocReader.shared.rfidScenario = [RGLRFIDScenario new];
}

- (void) initializeReader:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared initializeReaderWithConfig:[RGLWJSONConstructor configFromJson:config] completion:[self getInitCompletion :successCallback :errorCallback]];
}

- (void) initializeReaderWithBleDeviceConfig:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    errorCallback(@"initializeReaderWithBleDeviceConfig() is an android-only method");
}

- (void) deinitializeReader:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared deinitializeReader];
    successCallback(@"");
}

- (void) prepareDatabase:(NSString*)databaseID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared prepareDatabase:databaseID progressHandler:nil completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) removeDatabase:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared removeDatabase:^(BOOL success, NSError * _Nullable error) {
        successCallback(success ? @YES : @NO);
    }];
}

-(void) runAutoUpdate:(NSString*)databaseID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared runAutoUpdate:databaseID progressHandler:nil completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) cancelDBUpdate:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared cancelDBUpdate];
    successCallback(@"");
}

- (void) checkDatabaseUpdate:(NSString*)databaseID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared checkDatabaseUpdate:databaseID completion:^(RGLDocReaderDocumentsDatabase* database) {
        successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocReaderDocumentsDatabase:database]]);
    }];
}

- (void) scan:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        #pragma clang diagnostic pop
        UIViewController *currentViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [RGLDocReader.shared showScannerFromPresenter:currentViewController config:[RGLWJSONConstructor scannerConfigFromJson:config] completion:[self getCompletion]];
    });
}

- (void) recognize:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *currentViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [RGLDocReader.shared recognizeImageFromPresenter:currentViewController config:[RGLWJSONConstructor recognizeConfigFromJson:config] completion:[self getCompletion]];
    });
}

- (void) startNewPage:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared startNewPage];
    successCallback(@"");
}

- (void) stopScanner:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared stopScanner:^(){
            successCallback(@"");
        }];
    });
}

- (void) startRFIDReader:(NSNumber*)paCert :(NSNumber*)taCert :(NSNumber*)taSig :(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    self.doRequestPACertificates = paCert;
    self.doRequestTACertificates = taCert;
    self.doRequestTASignature = taSig;
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared startRFIDReaderFromPresenter:UIApplication.sharedApplication.keyWindow.rootViewController completion:[self getCompletion]];
    });
}

- (void) readRFID:(NSNumber*)paCert :(NSNumber*)taCert :(NSNumber*)taSig :(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    self.doRequestPACertificates = paCert;
    self.doRequestTACertificates = taCert;
    self.doRequestTASignature = taSig;
    [RGLDocReader.shared readRFID:^(RGLRFIDNotificationAction notificationAction, RGLRFIDNotify* _Nullable notification) {
        if(notification != nil) sendEvent(RGLWRfidOnProgressEvent, [RGLWJSONConstructor generateDocumentReaderNotification:notification]);
    } completion:^(RGLRFIDCompleteAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error, RGLRFIDErrorCodes errorCode) {
        sendEvent(RGLWCompletionEvent, [RGLWJSONConstructor generateCompletion:[RGLWConfig generateRFIDCompleteAction: action] :results :error]);
    }];
}

- (void) stopRFIDReader:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared stopRFIDReader:^(){successCallback(@"");}];
}

- (void) providePACertificates:(NSArray*)certificates :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(paCertificateCompletion == nil) {
        errorCallback(@"paCertificateCompletion is nil");
        return;
    }
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    paCertificateCompletion(certificatesMutable);
    successCallback(@"");
}

- (void) provideTACertificates:(NSArray*)certificates :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(taCertificateCompletion == nil) {
        errorCallback(@"taCertificateCompletion is nil");
        return;
    }
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    taCertificateCompletion(certificatesMutable);
    successCallback(@"");
}

- (void) provideTASignature:(NSString*)signature :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(taSignatureCompletion == nil) {
        errorCallback(@"taSignatureCompletion is nil");
        return;
    }
    taSignatureCompletion([RGLWJSONConstructor base64Decode:signature]);
    successCallback(@"");
}

- (void) setTCCParams:(NSDictionary*)params :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setTCCParams:[RGLWJSONConstructor tccParamsFromJson:params] completion:^(BOOL success, NSError * _Nullable error) {
        successCallback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
    }];
}

- (void) addPKDCertificates:(NSArray*)certificates :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    [RGLDocReader.shared addPKDCertificates:certificatesMutable];
    successCallback(@"");
}

- (void) clearPKDCertificates:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared clearPKDCertificates];
    successCallback(@"");
}

- (void) startNewSession:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared startNewSession];
    successCallback(@"");
}

- (void) startBluetoothService:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    errorCallback(@"startBluetoothService() is an android-only method");
}

- (void) setLocalizationDictionary:(NSDictionary*)dictionary :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.localizationHandler = ^NSString * _Nullable(NSString * _Nonnull localizationKey) {
        if(dictionary != nil && ![dictionary isEqual:[NSNull null]] && [dictionary valueForKey:localizationKey] != nil)
            return [dictionary valueForKey:localizationKey];
        return nil;
    };
    successCallback(@"");
}

- (void) getLicense:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    successCallback([RGLWJSONConstructor generateLicense:RGLDocReader.shared.license]);
}

- (void) getAvailableScenarios:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    NSMutableArray *availableScenarios = [NSMutableArray new];
    for(RGLScenario *scenario in RGLDocReader.shared.availableScenarios)
        [availableScenarios addObject:[RGLWJSONConstructor generateScenario:scenario]];
    successCallback([RGLWJSONConstructor arrayToString:availableScenarios]);
}

- (void) getIsRFIDAvailableForUse:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    successCallback(RGLDocReader.shared.isRFIDAvailableForUse ? @YES : @NO);
}

- (void) getDocReaderVersion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    successCallback([RGLWJSONConstructor generateDocReaderVersion:RGLDocReader.shared.version]);
}

- (void) getDocReaderDocumentsDatabase:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    if(RGLDocReader.shared.version != nil)
        successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocReaderDocumentsDatabase:RGLDocReader.shared.version.database]]);
    else
        successCallback(nil);
}

- (void) textFieldValueByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue]]);
}

- (void) textFieldValueByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue]]);
}

- (void) textFieldValueByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue]]);
}

- (void) textFieldValueByTypeLcidSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue]]);
}

- (void) textFieldValueByTypeSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(BOOL)original :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue] original:original]);
}

- (void) textFieldValueByTypeLcidSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(BOOL)original :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue] original:original]);
}

- (void) textFieldByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue]];
    if(result == nil)
        successCallback(nil);
    successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderTextField:result]]);
}

- (void) textFieldByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue] lcid:[lcid integerValue]];
    if(result == nil)
        successCallback(nil);
    successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderTextField:result]]);
}

- (void) graphicFieldByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue]];
    if(result == nil)
        successCallback(nil);
    successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

- (void) graphicFieldByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]];
    if(result == nil)
        successCallback(nil);
    successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

- (void) graphicFieldByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]];
    if(result == nil)
        successCallback(nil);
    successCallback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

- (void) graphicFieldImageByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue]]]);
}

- (void) graphicFieldImageByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue]]]);
}

- (void) graphicFieldImageByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]]]);
}

- (void) graphicFieldImageByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]]]);
}

- (void) containers:(NSString*)rawResult :(NSArray<NSNumber*>*)resultType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getContainersByResultTypes:resultType]);
}

- (void) encryptedContainers:(NSString*)rawResult :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    successCallback([results getEncryptedContainers]);
}

- (void) finalizePackage:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared finalizePackageWithCompletion:^(RGLDocReaderAction action, RGLTransactionInfo* info, NSError* error){
        successCallback([RGLWJSONConstructor generateFinalizePackageCompletion:[RGLWConfig generateDocReaderAction: action] :info :error]);
    }];
}

- (void) getTranslation:(NSString*)className :(NSNumber*)value :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if([className isEqualToString:@"RFIDErrorCodes"])
        successCallback(RGLRFIDErrorCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"LDSParsingErrorCodes"])
        successCallback(eLDS_ParsingErrorCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"LDSParsingNotificationCodes"])
        successCallback(eLDS_ParsingNotificationCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"ImageQualityCheckType"])
        successCallback(RGLImageQualityCheckTypeGetStringValue([RGLWConfig imageQualityCheckTypeWithNumber:value]));
    else if([className isEqualToString:@"RFIDDataFileType"])
        successCallback(RGLRFIDDataFileTypeGetStringValue([value intValue]));
    else if([className isEqualToString:@"VisualFieldType"])
        successCallback(RGLFieldTypeGetStringValue([value intValue]));
    else if([className isEqualToString:@"LCID"])
        successCallback([RGLDocumentReaderTextField lcidName:[value intValue]]);
}

-(RGLDocumentReaderCompletion _Nonnull)getCompletion {
    return ^(RGLDocReaderAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error) {
        sendEvent(RGLWCompletionEvent, [RGLWJSONConstructor generateCompletion:[RGLWConfig generateDocReaderAction: action] :results :error]);
    };
}

-(RGLDocumentReaderPrepareCompletion _Nonnull)getPrepareCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    RGLDocReader.shared.databaseFetchDelegate = self;
    return ^(BOOL success, NSError * _Nullable error) {
        successCallback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
    };
}

-(RGLDocumentReaderInitializationCompletion)getInitCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback {
    return ^(BOOL success, NSError * _Nullable error ) {
        if (success) {
            RGLDocReader.shared.rfidDelegate = self;
            RGLDocReader.shared.functionality.recordScanningProcessDelegate = self;
            RGLDocReader.shared.customization.actionDelegate = self;
        }
        successCallback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
    };
}

// RGLDocReaderDatabaseFetchDelegate
- (void)onProgressChanged:(NSNumber *)downloadedBytes totalBytes:(NSNumber *)totalBytes {
    int progress = 0;
    if (downloadedBytes > 0 && totalBytes > 0) {
        double percent = [downloadedBytes doubleValue] / [totalBytes doubleValue];
        progress = (int) (percent * 100);
    }
    NSDictionary* result = @{
        @"downloadedBytes":downloadedBytes,
        @"totalBytes":totalBytes,
        @"progress":@(progress)
    };
    sendEvent(RGLWDatabaseProgressEvent, [RGLWJSONConstructor dictToString: result]);
}

// RGLCustomizationActionDelegate
- (void)onCustomButtonTappedWithTag:(NSInteger)tag {
    sendEvent(RGLWOnCustomButtonTappedEvent, @(tag));
}

// RGLRecordScanningProcessDelegate
- (void)didFinishRecordingToFile:(NSURL *)fileURL {
    sendEvent(RGLWVideoEncoderCompletionEvent, fileURL.absoluteString);
}

- (void)didFailWithError:(NSError *)error {
    // ignore error to match android
}

RGLRFIDCertificatesCallback paCertificateCompletion;
RGLRFIDCertificatesCallback taCertificateCompletion;
RGLWRFIDSignatureCallback taSignatureCompletion;

- (void)onRequestPACertificatesWithSerial:(NSData *)serialNumber issuer:(RGLPAResourcesIssuer *)issuer callback:(RGLRFIDCertificatesCallback)callback {
    if([self.doRequestPACertificates boolValue]) {
        paCertificateCompletion = callback;
        sendEvent(RGLWPaCertificateCompletionEvent, [RGLWJSONConstructor generatePACertificateCompletion:serialNumber :issuer]);
    } else {
        paCertificateCompletion = nil;
        callback(nil);
    }
}

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    if([self.doRequestTACertificates boolValue]) {
        taCertificateCompletion = callback;
        sendEvent(RGLWTaCertificateCompletionEvent, keyCAR);
    } else {
        taCertificateCompletion = nil;
        callback(nil);
    }
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    if([self.doRequestTASignature boolValue]) {
        taSignatureCompletion = callback;
        sendEvent(RGLWTaSignatureCompletionEvent, [RGLWJSONConstructor dictToString: [RGLWJSONConstructor generateTAChallenge:challenge]]);
    } else {
        taSignatureCompletion = nil;
        callback(nil);
    }
}

- (void)didChipConnected {
    sendEvent(RGLWRfidOnChipDetectedEvent, @"");
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"code"] = [NSNumber numberWithInteger:errorCode];
    sendEvent(RGLWRfidOnRetryReadChipEvent, [RGLWJSONConstructor dictToString:result]);
}

@end
