#import "FlutterDocumentReaderApiPlugin.h"

FlutterEventSink RGLWCompletionEvent;
FlutterEventSink RGLWDatabaseProgressEvent;
FlutterEventSink RGLWVideoEncoderCompletionEvent;
FlutterEventSink RGLWRfidNotificationCompletionEvent;

FlutterEventSink RGLWBleOnServiceConnectedEvent;
FlutterEventSink RGLWBleOnServiceDisconnectedEvent;
FlutterEventSink RGLWBleOnDeviceReadyEvent;

FlutterEventSink RGLWPaCertificateCompletionEvent;
FlutterEventSink RGLWTaCertificateCompletionEvent;
FlutterEventSink RGLWTaSignatureCompletionEvent;

RGLWRFIDSignatureCallback RGLWTaSignatureCompletion;
RGLRFIDCertificatesCallback RGLWPaCertificateCompletion;
RGLRFIDCertificatesCallback RGLWTaCertificateCompletion;

FlutterEventSink RGLWOnCustomButtonTappedEvent;

RGLWRFIDDelegateNoPA* RGLWRfidDelegateNoPA;


@implementation RGLWCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWVideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWVideoEncoderCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWVideoEncoderCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWDatabaseProgressStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWDatabaseProgressEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWDatabaseProgressEvent = nil;
  return nil;
}
@end

@implementation RGLWRFIDNotificationCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWRfidNotificationCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWRfidNotificationCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWPACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWPaCertificateCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWPaCertificateCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWTACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWTaCertificateCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWTaCertificateCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWTASignatureCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWTaSignatureCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWTaSignatureCompletionEvent = nil;
  return nil;
}
@end

@implementation RGLWBleOnServiceConnectedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWBleOnServiceConnectedEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWBleOnServiceConnectedEvent = nil;
  return nil;
}
@end

@implementation RGLWBleOnServiceDisconnectedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWBleOnServiceDisconnectedEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWBleOnServiceDisconnectedEvent = nil;
  return nil;
}
@end

@implementation RGLWBleOnDeviceReadyStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWBleOnDeviceReadyEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWBleOnDeviceReadyEvent = nil;
  return nil;
}
@end

@implementation RGLWOnCustomButtonTappedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RGLWOnCustomButtonTappedEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RGLWOnCustomButtonTappedEvent = nil;
  return nil;
}
@end

@implementation RGLWRFIDDelegateNoPA

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    RGLWTaCertificateCompletion = callback;
    if(RGLWTaCertificateCompletionEvent != nil)
        RGLWTaCertificateCompletionEvent(keyCAR);
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    RGLWTaSignatureCompletion = callback;
    if(RGLWTaSignatureCompletionEvent != nil)
        RGLWTaSignatureCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLTAChallenge:challenge]]);
}

- (void)didChipConnected {
    if(RGLWRfidNotificationCompletionEvent != nil)
        RGLWRfidNotificationCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRfidNotificationCompletion:1]]); // int RFID_EVENT_CHIP_DETECTED = 1;
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    if(RGLWRfidNotificationCompletionEvent != nil)
        RGLWRfidNotificationCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRfidNotificationCompletionWithError:2:errorCode]]); // int RFID_EVENT_READING_ERROR = 2;
}

@end


@implementation FlutterDocumentReaderApiPlugin

static FlutterMethodChannel * _channel;
static NSNumber * _databasePercentageDownloaded;

+ (FlutterMethodChannel *)channel { return _channel; }
+ (void)setChannel:(FlutterMethodChannel *)newChannel { _channel = newChannel; }
+ (NSNumber*)databasePercentageDownloaded{ return _databasePercentageDownloaded; }
+ (void)setDatabasePercentageDownloaded:(NSNumber *)number { _databasePercentageDownloaded = number; }

- (void) result:(id _Nullable)message :(RGLWCallback)callback {
    callback(message);
}

-(void (^_Nullable)(NSProgress * _Nonnull progress))getProgressHandler:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    return ^(NSProgress * _Nonnull progress) {
        if(FlutterDocumentReaderApiPlugin.databasePercentageDownloaded != [NSNumber numberWithDouble:progress.fractionCompleted * 100]){
            if(RGLWDatabaseProgressEvent != nil)
                RGLWDatabaseProgressEvent([NSString stringWithFormat:@"%.1f", progress.fractionCompleted * 100]);
            [FlutterDocumentReaderApiPlugin setDatabasePercentageDownloaded:[NSNumber numberWithDouble:progress.fractionCompleted * 100]];
        }
    };
}

-(RGLDocumentReaderCompletion _Nonnull)getCompletion {
    return ^(RGLDocReaderAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error) {
        if(RGLWCompletionEvent != nil)
            RGLWCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateDocReaderAction: action] :results :error :nil]]);
    };
}

-(RGLRFIDProcessCompletion _Nonnull)getRFIDCompletion {
    return ^(RGLRFIDCompleteAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error, RGLRFIDErrorCodes errorCode) {
        if(RGLWCompletionEvent != nil)
            RGLWCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateRFIDCompleteAction: action] :results :error :nil]]);
    };
}

-(RGLRFIDNotificationCallback _Nonnull)getRFIDNotificationCallback {
    return ^(RGLRFIDNotificationAction notificationAction, RGLRFIDNotify* _Nullable notification) {
        if(RGLWCompletionEvent != nil)
            RGLWCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateRFIDNotificationAction:notificationAction] :nil :nil :notification]]);
    };
}

- (void)didFinishRecordingToFile:(NSURL *)fileURL {
    if(RGLWVideoEncoderCompletionEvent != nil)
        RGLWVideoEncoderCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateVideoEncoderCompletion:fileURL :nil]]);
}

- (void)didFailWithError:(NSError *)error {
    if(RGLWVideoEncoderCompletionEvent != nil)
        RGLWVideoEncoderCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateVideoEncoderCompletion:nil :error]]);
}

- (void)onRequestPACertificatesWithSerial:(NSData *)serialNumber issuer:(RGLPAResourcesIssuer *)issuer callback:(RGLRFIDCertificatesCallback)callback {
    RGLWPaCertificateCompletion = callback;
    if(RGLWPaCertificateCompletionEvent != nil)
        RGLWPaCertificateCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generatePACertificateCompletion:serialNumber :issuer]]);
}

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    RGLWTaCertificateCompletion = callback;
    if(RGLWTaCertificateCompletionEvent != nil)
        RGLWTaCertificateCompletionEvent(keyCAR);
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    RGLWTaSignatureCompletion = callback;
    if(RGLWTaSignatureCompletionEvent != nil)
        RGLWTaSignatureCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLTAChallenge:challenge]]);
}

- (void)didChipConnected {
    if(RGLWRfidNotificationCompletionEvent != nil)
        RGLWRfidNotificationCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRfidNotificationCompletion:1]]); // int RFID_EVENT_CHIP_DETECTED = 1;
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    if(RGLWRfidNotificationCompletionEvent != nil)
        RGLWRfidNotificationCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRfidNotificationCompletionWithError:2:errorCode]]); // int RFID_EVENT_READING_ERROR = 2;
}

- (void)onCustomButtonTappedWithTag:(NSInteger)tag {
    if(RGLWOnCustomButtonTappedEvent != nil)
        RGLWOnCustomButtonTappedEvent([NSString stringWithFormat:@"%ld", tag]);
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/video_encoder_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWVideoEncoderCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/database_progress" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWDatabaseProgressStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/rfid_notification_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWRFIDNotificationCompletionStreamHandler new]];

    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/pa_certificate_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWPACertificateCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/ta_certificate_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWTACertificateCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/ta_signature_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWTASignatureCompletionStreamHandler new]];

    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/bleOnServiceConnectedEvent" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWBleOnServiceConnectedStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/bleOnServiceDisconnectedEvent" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWBleOnServiceDisconnectedStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/bleOnDeviceReadyEvent" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWBleOnDeviceReadyStreamHandler new]];

    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/onCustomButtonTappedEvent" binaryMessenger:[registrar messenger]] setStreamHandler:[RGLWOnCustomButtonTappedStreamHandler new]];

    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_document_reader_api/method" binaryMessenger:[registrar messenger]];
    [FlutterDocumentReaderApiPlugin setChannel:channel];
    FlutterDocumentReaderApiPlugin* instance = [FlutterDocumentReaderApiPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* action = call.method;
    NSMutableArray* args = call.arguments;

    RGLWCallback successCallback = ^(id _Nullable response){
        result(response);
    };
    RGLWCallback errorCallback = ^(NSString* error){
        result([FlutterError errorWithCode:@"error" message:error details:nil]);
    };

    if([action isEqualToString:@"initializeReaderAutomatically"])
        [self initializeReaderAutomatically :successCallback :errorCallback];
    else if([action isEqualToString:@"isBlePermissionsGranted"])
        [self isBlePermissionsGranted :successCallback :errorCallback];
    else if([action isEqualToString:@"startBluetoothService"])
        [self startBluetoothService :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReaderBleDeviceConfig"])
        [self initializeReaderBleDeviceConfig :successCallback :errorCallback];
    else if([action isEqualToString:@"getTag"])
        [self getTag :successCallback :errorCallback];
    else if([action isEqualToString:@"getAPIVersion"])
        [self getAPIVersion :successCallback :errorCallback];
    else if([action isEqualToString:@"getAvailableScenarios"])
        [self getAvailableScenarios :successCallback :errorCallback];
    else if([action isEqualToString:@"isRFIDAvailableForUse"])
        [self isRFIDAvailableForUse :successCallback :errorCallback];
    else if([action isEqualToString:@"getCoreMode"])
        [self getCoreMode :successCallback :errorCallback];
    else if([action isEqualToString:@"getCoreVersion"])
        [self getCoreVersion :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseDate"])
        [self getDatabaseDate :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseID"])
        [self getDatabaseID :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseVersion"])
        [self getDatabaseVersion :successCallback :errorCallback];
    else if([action isEqualToString:@"getDocumentReaderIsReady"])
        [self getDocumentReaderIsReady :successCallback :errorCallback];
    else if([action isEqualToString:@"getDocumentReaderStatus"])
        [self getDocumentReaderStatus :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseCountriesNumber"])
        [self getDatabaseCountriesNumber :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseDocumentsNumber"])
        [self getDatabaseDocumentsNumber :successCallback :errorCallback];
    else if([action isEqualToString:@"selectedScenario"])
        [self selectedScenario :successCallback :errorCallback];
    else if([action isEqualToString:@"getSessionLogFolder"])
        [self getSessionLogFolder :successCallback :errorCallback];
    else if([action isEqualToString:@"getDatabaseDescription"])
        [self getDatabaseDescription :successCallback :errorCallback];
    else if([action isEqualToString:@"showScanner"])
        [self showScanner :successCallback :errorCallback];
    else if([action isEqualToString:@"startNewPage"])
        [self startNewPage :successCallback :errorCallback];
    else if([action isEqualToString:@"startNewSession"])
        [self startNewSession :successCallback :errorCallback];
    else if([action isEqualToString:@"startRFIDReader"])
        [self startRFIDReader :successCallback :errorCallback];
    else if([action isEqualToString:@"stopRFIDReader"])
        [self stopRFIDReader :successCallback :errorCallback];
    else if([action isEqualToString:@"stopRFIDReaderWithErrorMessage"])
        [self stopRFIDReaderWithErrorMessage :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"stopScanner"])
        [self stopScanner :successCallback :errorCallback];
    else if([action isEqualToString:@"deinitializeReader"])
        [self deinitializeReader :successCallback :errorCallback];
    else if([action isEqualToString:@"isAuthenticatorAvailableForUse"])
        [self isAuthenticatorAvailableForUse :successCallback :errorCallback];
    else if([action isEqualToString:@"getConfig"])
        [self getConfig :successCallback :errorCallback];
    else if([action isEqualToString:@"getRfidScenario"])
        [self getRfidScenario :successCallback :errorCallback];
    else if([action isEqualToString:@"getLicenseExpiryDate"])
        [self getLicenseExpiryDate :successCallback :errorCallback];
    else if([action isEqualToString:@"getLicenseCountryFilter"])
        [self getLicenseCountryFilter :successCallback :errorCallback];
    else if([action isEqualToString:@"licenseIsRfidAvailable"])
        [self licenseIsRfidAvailable :successCallback :errorCallback];
    else if([action isEqualToString:@"getCameraSessionIsPaused"])
        [self getCameraSessionIsPaused :successCallback :errorCallback];
    else if([action isEqualToString:@"removeDatabase"])
        [self removeDatabase :successCallback :errorCallback];
    else if([action isEqualToString:@"cancelDBUpdate"])
        [self cancelDBUpdate :successCallback :errorCallback];
    else if([action isEqualToString:@"resetConfiguration"])
        [self resetConfiguration :successCallback :errorCallback];
    else if([action isEqualToString:@"clearPKDCertificates"])
        [self clearPKDCertificates :successCallback :errorCallback];
    else if([action isEqualToString:@"readRFID"])
        [self readRFID :successCallback :errorCallback];
    else if([action isEqualToString:@"getRfidSessionStatus"])
        [self getRfidSessionStatus :successCallback :errorCallback];
    else if([action isEqualToString:@"setRfidDelegate"])
        [self setRfidDelegate :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setEnableCoreLogs"])
        [self setEnableCoreLogs :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"addPKDCertificates"])
        [self addPKDCertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setCameraSessionIsPaused"])
        [self setCameraSessionIsPaused :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setTag"])
        [self setTag :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"checkDatabaseUpdate"])
        [self checkDatabaseUpdate :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getScenario"])
        [self getScenario :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImages"])
        [self recognizeImages :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"showScannerWithCameraID"])
        [self showScannerWithCameraID :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"runAutoUpdate"])
        [self runAutoUpdate :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setConfig"])
        [self setConfig :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setRfidScenario"])
        [self setRfidScenario :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReader"])
        [self initializeReader :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"prepareDatabase"])
        [self prepareDatabase :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImage"])
        [self recognizeImage :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeData"])
        [self recognizeData :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setRfidSessionStatus"])
        [self setRfidSessionStatus :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"providePACertificates"])
        [self providePACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTACertificates"])
        [self provideTACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTASignature"])
        [self provideTASignature :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"parseCoreResults"])
        [self parseCoreResults :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setTCCParams"])
        [self setTCCParams :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageWithOpts"])
        [self recognizeImageWithOpts :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeVideoFrame"])
        [self recognizeVideoFrame :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"showScannerWithCameraIDAndOpts"])
        [self showScannerWithCameraIDAndOpts :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageWithCameraMode"])
        [self recognizeImageWithCameraMode :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImagesWithImageInputs"])
        [self recognizeImagesWithImageInputs :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setOnCustomButtonTappedListener"])
        [self setOnCustomButtonTappedListener :successCallback :errorCallback];
    else if([action isEqualToString:@"setLanguage"])
        [self setLanguage :[args objectAtIndex:0] :successCallback :errorCallback];
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
    else
        [self result:[NSString stringWithFormat:@"%@/%@", @"method not implemented: ", action] :errorCallback];
}

- (void) initializeReaderAutomatically:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"regula.license" ofType:nil];
    NSData *licenseData = [NSData dataWithContentsOfFile:dataPath];
    [RGLDocReader.shared initializeReaderWithConfig:[RGLConfig configWithLicenseData:licenseData] completion:[self getInitCompletion :successCallback :errorCallback]];
}

- (void) isBlePermissionsGranted:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"isBlePermissionsGranted() is an android-only method" :errorCallback];
}

- (void) startBluetoothService:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"startBluetoothService() is an android-only method" :errorCallback];
}

- (void) initializeReaderBleDeviceConfig:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"initializeReaderBleDeviceConfig() is an android-only method" :errorCallback];
}

- (void) resetConfiguration:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.functionality = [RGLFunctionality new];
    RGLDocReader.shared.processParams = [RGLProcessParams new];
    RGLDocReader.shared.customization = [RGLCustomization new];
    successCallback(@"");
}

- (void) setEnableCoreLogs:(BOOL)logs :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"setEnableCoreLogs() is an android-only method" :errorCallback];
}

- (void) showScannerWithCameraID:(NSNumber*)cameraID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"showScannerWithCameraID() is an android-only method" :errorCallback];
}

- (void) stopRFIDReaderWithErrorMessage:(NSMutableString*)message :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared stopRFIDReaderWithErrorMessage:message completion:^() {
        [self result:@"" :successCallback];
    }];
}

- (void) recognizeImageWithOpts:(NSString*)base64 :(NSDictionary*)opts :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"recognizeImageWithOpts() is an android-only method" :errorCallback];
}

- (void) recognizeVideoFrame:(NSString*)byteString :(NSDictionary*)opts :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"recognizeVideoFrame() is an android-only method" :errorCallback];
}

- (void) showScannerWithCameraIDAndOpts:(NSNumber*)cameraID :(NSDictionary*)opts :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"showScannerWithCameraIDAndOpts() is an android-only method" :errorCallback];
}

- (void) getLicenseMessage:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:@"getLicenseMessage() is an android-only method" :successCallback];
}

- (void) setOnCustomButtonTappedListener:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.customization.actionDelegate = self;
    [self result:@"" :successCallback];
}

- (void) setLanguage:(NSString*)language :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.localizationHandler = ^NSString * _Nullable(NSString * _Nonnull localizationKey) {
        NSString *result = NSLocalizedStringFromTable(localizationKey, language, @"");
        if (![result isEqualToString:localizationKey])
            return result;
        return nil;
    };
    [self result:@"" :successCallback];
}

- (void) initializeReader:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared initializeReaderWithConfig:[RGLWJSONConstructor RGLConfigFromJson:config] completion:[self getInitCompletion :successCallback :errorCallback]];
}

- (void) parseCoreResults:(NSString*)json :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderResults:[RGLDocumentReaderResults initWithRawString: json]]] :successCallback];
}

- (void) startRFIDReader:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared startRFIDReaderFromPresenter:[[[UIApplication sharedApplication] keyWindow] rootViewController] completion:[self getCompletion]];
    });
}

- (void) prepareDatabase:(NSString*)dbID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared prepareDatabase:dbID progressHandler:[self getProgressHandler :successCallback :errorCallback] completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) removeDatabase:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared removeDatabase:^(BOOL successful, NSError * _Nullable error) {
        if (successful)
            [self result:@"database removed" :successCallback];
        else
            [self result:[NSString stringWithFormat:@"%@/%@", @"database removal failed: ", error.description] :errorCallback];
    }];
}

- (void) cancelDBUpdate:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared cancelDBUpdate];
    [self result:@"" :successCallback];
}

-(void) runAutoUpdate:(NSString*)dbID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared runAutoUpdate:dbID progressHandler:[self getProgressHandler :successCallback :errorCallback] completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) showScanner:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        #pragma clang diagnostic pop
        UIViewController *currentViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [RGLDocReader.shared showScanner:currentViewController completion:[self getCompletion]];
    });
}

- (void) recognizeImage:(NSMutableString*)base64 :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self recognizeImageWith :base64 :false :successCallback :errorCallback];
}

- (void) recognizeData:(NSString*)data :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared recognizeData :[[NSData alloc] initWithBase64EncodedString:data options:0] completion:[self getCompletion]];
}

- (void) recognizeImages:(NSArray*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSMutableArray<UIImage*>* images = [[NSMutableArray alloc] init];
    for(__strong NSMutableString* base64 in input)
        [images addObject:[UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters]]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared recognizeImages:images completion:[self getCompletion]];
    });

}

- (void) recognizeImagesWithImageInputs:(NSArray*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSMutableArray<RGLImageInput*>* images = [[NSMutableArray alloc] init];
    for(__strong NSDictionary* image in input)
        [images addObject:[RGLWJSONConstructor RGLImageInputFromJson: image]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared recognizeImagesWithImageInputs:images completion:[self getCompletion]];
    });
}

- (void) recognizeImageWithCameraMode:(NSMutableString*)base64 :(BOOL)cameraMode :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self recognizeImageWith :base64 :cameraMode :successCallback :errorCallback];
}

- (void) recognizeImageWith:(NSMutableString*)base64 :(BOOL)cameraMode :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared recognizeImage:[UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters]] cameraMode:cameraMode completion:[self getCompletion]];
    });
}

- (void) setConfig:(NSDictionary*)config :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWRegulaConfig setConfig:config :RGLDocReader.shared];
    [self result:@"" :successCallback];
}

- (void) getConfig:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:[RGLWRegulaConfig getConfig:RGLDocReader.shared] options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) checkDatabaseUpdate:(NSString*)databaseId :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared checkDatabaseUpdate:databaseId completion:[self getCheckDatabaseUpdateCompletion: successCallback: errorCallback]];
}

- (void) getTag:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[RGLDocReader.shared tag] :successCallback];
}

- (void) setTag:(NSString*)tag :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setTag:tag];
    [self result:@"" :successCallback];
}

- (void) setRfidScenario:(NSDictionary*)rfidScenario :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLWRegulaConfig setRfidScenario:rfidScenario  :RGLDocReader.shared.rfidScenario];
    [self result:@"" :successCallback];
}

- (void) getRfidScenario:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:RGLDocReader.shared.rfidScenario.rfidScenarioDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) readRFID:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared readRFID:[self getRFIDNotificationCallback] completion:[self getRFIDCompletion]];
}

- (void) stopRFIDReader:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared stopRFIDReader:^(){[self result:@"" :successCallback];}];
}

- (void) clearPKDCertificates:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared clearPKDCertificates];
    [self result:@"" :successCallback];
}

- (void) addPKDCertificates:(NSArray*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    [RGLDocReader.shared addPKDCertificates:certificates];
    [self result:@"" :successCallback];
}

- (void) deinitializeReader:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared deinitializeReader];
    [self result:@"" :successCallback];
}

- (void) selectedScenario:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLScenario:RGLDocReader.shared.selectedScenario]] :successCallback];
}

- (void) stopScanner:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared stopScanner:^(){
            [self result:@"" :successCallback];
        }];
    });
}

- (void) startNewSession:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared startNewSession];
    [self result:@"" :successCallback];
}

- (void) startNewPage:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared startNewPage];
    [self result:@"" :successCallback];
}

- (void) getDocumentReaderIsReady:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[RGLDocReader.shared isDocumentReaderIsReady] ? @YES : @NO :successCallback];
}

- (void) getAPIVersion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.api :successCallback];
}

- (void) getCoreVersion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.core :successCallback];
}

- (void) getCoreMode:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.coreMode :successCallback];
}

- (void) getDatabaseID:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.database.databaseID :successCallback];
}

- (void) getDatabaseVersion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.database.version :successCallback];
}

- (void) getDatabaseDate:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.database.date :successCallback];
}

- (void) getDatabaseDescription:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.version.database.databaseDescription :successCallback];
}

- (void) getDatabaseCountriesNumber:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[NSNumber numberWithInteger:RGLDocReader.shared.version.database.countriesNumber] :successCallback];
}

- (void) getDatabaseDocumentsNumber:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:[NSNumber numberWithInteger:RGLDocReader.shared.version.database.documentsNumber] :successCallback];
}

- (void) getLicenseExpiryDate:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehaviorDefault];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [self result:[formatter stringFromDate:RGLDocReader.shared.license.expiryDate] :successCallback];
}

- (void) getLicenseCountryFilter:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(RGLDocReader.shared.license.countryFilter == nil)
        [self result:@"nil" :successCallback];
    else
        [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:RGLDocReader.shared.license.countryFilter options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) licenseIsRfidAvailable:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.license.isRfidAvailable ? @YES : @NO :successCallback];
}

- (void) getDocumentReaderStatus:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.documentReaderStatus :successCallback];
}

- (void) setTCCParams:(NSDictionary*)params :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [RGLDocReader.shared setTCCParams:[RGLWJSONConstructor RGLTCCParamsFromJson:params] completion:[self getTCCParamsCompletion:successCallback :errorCallback]];
}

- (void) getRfidSessionStatus:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.rfidSessionStatus :successCallback];
}

- (void) setRfidSessionStatus:(NSString*)status :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.rfidSessionStatus = status;
    [self result:@"" :successCallback];
}

- (void) getCurrentScenario:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.processParams.scenario :successCallback];
}

- (void) getCameraSessionIsPaused:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.isCameraSessionIsPaused ? @YES : @NO :successCallback];
}

- (void) setCameraSessionIsPaused:(BOOL)paused :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocReader.shared.cameraSessionIsPaused = paused;
    [self result:@"" :successCallback];
}

- (void) isRFIDAvailableForUse:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.isRFIDAvailableForUse ? @YES : @NO :successCallback];
}

- (void) isAuthenticatorAvailableForUse:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.isAuthenticatorAvailableForUse ? @YES : @NO :successCallback];
}

- (void) getSessionLogFolder:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    [self result:RGLDocReader.shared.processParams.sessionLogFolder :successCallback];
}

- (void) getScenario:(NSString*)scenarioID :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    BOOL success = false;
    for(RGLScenario *scenario in RGLDocReader.shared.availableScenarios)
        if([scenario.identifier isEqualToString:scenarioID]){
            [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLScenario:scenario]] :successCallback];
            success = true;
            break;
        }
    if(!success)
        [self result:@"Scenario unavailable" :errorCallback];
}

- (void) providePACertificates:(NSArray*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(RGLWPaCertificateCompletion == nil){
        [self result:@"paCertificateCompletion is nil" :errorCallback];
        return;
    }
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    RGLWPaCertificateCompletion(certificates);
    [self result:@"" :successCallback];
}

- (void) provideTACertificates:(NSArray*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(RGLWTaCertificateCompletion == nil){
        [self result:@"taCertificateCompletion is nil" :errorCallback];
        return;
    }
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    RGLWTaCertificateCompletion(certificates);
    [self result:@"" :successCallback];
}

- (void) provideTASignature:(NSString*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    if(RGLWTaSignatureCompletion == nil){
        [self result:@"taSignatureCompletion is nil" :errorCallback];
        return;
    }
    RGLWTaSignatureCompletion([[NSData alloc] initWithBase64EncodedString:input options:0]);
    [self result:@"" :successCallback];
}

- (void) setRfidDelegate:(NSNumber*)input :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    switch([input integerValue]){
        case 0:
            [RGLDocReader shared].rfidDelegate = nil;
            break;
        case 1:
            if(RGLWRfidDelegateNoPA == nil)
                RGLWRfidDelegateNoPA = [RGLWRFIDDelegateNoPA new];
            [RGLDocReader shared].rfidDelegate = RGLWRfidDelegateNoPA;
            break;
        case 2:
            [RGLDocReader shared].rfidDelegate = self;
            break;
        default:
            [self result:@"wrong input" :errorCallback];
            return;
    }

    [self result:@"" :successCallback];
}

- (void) getAvailableScenarios:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    NSMutableArray *availableScenarios = [[NSMutableArray alloc] init];
    for(RGLScenario *scenario in RGLDocReader.shared.availableScenarios)
        [availableScenarios addObject:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLScenario:scenario]]];
    [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:availableScenarios options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) textFieldValueByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue]] :successCallback];
}

- (void) textFieldValueByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue]] :successCallback];
}

- (void) textFieldValueByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue]] :successCallback];
}

- (void) textFieldValueByTypeLcidSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue]] :successCallback];
}

- (void) textFieldValueByTypeSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(BOOL)original :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue] original:original] :successCallback];
}

- (void) textFieldValueByTypeLcidSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(BOOL)original :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue] original:original] :successCallback];
}

- (void) textFieldByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue]];
    if(result == nil)
        [self result:nil :successCallback];
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderTextField:result]] :successCallback];
}

- (void) textFieldByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue] lcid:[lcid integerValue]];
    if(result == nil)
        [self result:nil :successCallback];
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderTextField:result]] :successCallback];
}

- (void) graphicFieldByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue]];
    if(result == nil)
        [self result:nil :successCallback];
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderGraphicField:result]] :successCallback];
}

- (void) graphicFieldByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]];
    if(result == nil)
        [self result:nil :successCallback];
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderGraphicField:result]] :successCallback];
}

- (void) graphicFieldByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]];
    if(result == nil)
        [self result:nil :successCallback];
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocumentReaderGraphicField:result]] :successCallback];
}

- (void) graphicFieldImageByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[UIImageJPEGRepresentation([results getGraphicFieldImageByType:[fieldType integerValue]], 1.0) base64EncodedStringWithOptions:0] :successCallback];
}

- (void) graphicFieldImageByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[UIImageJPEGRepresentation([results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue]], 1.0) base64EncodedStringWithOptions:0] :successCallback];
}

- (void) graphicFieldImageByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[UIImageJPEGRepresentation([results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]], 1.0) base64EncodedStringWithOptions:0] :successCallback];
}

- (void) graphicFieldImageByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[UIImageJPEGRepresentation([results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]], 1.0) base64EncodedStringWithOptions:0] :successCallback];
}

- (void) containers:(NSString*)rawResult :(NSArray<NSNumber*>*)resultType :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getContainersByResultTypes:resultType] :successCallback];
}

- (void) encryptedContainers:(NSString*)rawResult :(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    [self result:[results getEncryptedContainers] :successCallback];
}

-(RGLDocumentReaderInitializationCompletion)getInitCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    return ^(BOOL successful, NSError * _Nullable error ) {
        if (successful){
            [RGLDocReader shared].functionality.recordScanningProcessDelegate = self;
            [self result:@"init complete" :successCallback];
        }else
            [self result:[NSString stringWithFormat:@"%@/%@", @"init failed: ", error.description] :errorCallback];
    };
}

-(RGLDocumentReaderPrepareCompletion _Nonnull)getPrepareCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    return ^(BOOL successful, NSError * _Nullable error) {
        if (successful)
            [self result:@"database prepared" :successCallback];
        else
            [self result:[NSString stringWithFormat:@"%@/%@", @"database preparation failed: ", error.description] :errorCallback];
    };
}

-(void (^_Nullable)(BOOL success, NSError * _Nullable error))getTCCParamsCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    return  ^(BOOL success, NSError * _Nullable error) {
        if (success)
            [self result:@"success" :successCallback];
        else
            [self result:[NSString stringWithFormat:@"%@/%@", @"failed: ", error.description] :errorCallback];
    };
}

-(RGLDocumentReaderCheckUpdateCompletion)getCheckDatabaseUpdateCompletion:(RGLWCallback)successCallback :(RGLWCallback)errorCallback{
    return  ^(RGLDocReaderDocumentsDatabase* database) {
        [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLDocReaderDocumentsDatabase:database]] :successCallback];
    };
}

@end
