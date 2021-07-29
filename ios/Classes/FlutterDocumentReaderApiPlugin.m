#import "FlutterDocumentReaderApiPlugin.h"

FlutterEventSink completionEvent;
FlutterEventSink databaseProgressEvent;
FlutterEventSink videoEncoderCompletionEvent;
FlutterEventSink rfidNotificationCompletionEvent;
FlutterEventSink paCertificateCompletionEvent;
FlutterEventSink taCertificateCompletionEvent;
FlutterEventSink taSignatureCompletionEvent;
RGLRFIDCertificatesCallback paCertificateCompletion;
RGLRFIDCertificatesCallback taCertificateCompletion;
RFIDDelegateNoPA* rfidDelegateNoPA;
typedef void (^RGLRFIDSignatureCallback)(NSData *signature);
RGLRFIDSignatureCallback taSignatureCompletion;

@implementation CompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    completionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    completionEvent = nil;
  return nil;
}
@end

@implementation VideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    videoEncoderCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    videoEncoderCompletionEvent = nil;
  return nil;
}
@end

@implementation DatabaseProgressStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    databaseProgressEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    databaseProgressEvent = nil;
  return nil;
}
@end

@implementation RFIDNotificationCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    rfidNotificationCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    rfidNotificationCompletionEvent = nil;
  return nil;
}
@end

@implementation PACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    paCertificateCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    paCertificateCompletionEvent = nil;
  return nil;
}
@end

@implementation TACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    taCertificateCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    taCertificateCompletionEvent = nil;
  return nil;
}
@end

@implementation TASignatureCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    taSignatureCompletionEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    taSignatureCompletionEvent = nil;
  return nil;
}
@end

@implementation RFIDDelegateNoPA

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    taCertificateCompletion = callback;
    if(taCertificateCompletionEvent != nil)
        taCertificateCompletionEvent(keyCAR);
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    taSignatureCompletion = callback;
    if(taSignatureCompletionEvent != nil)
        taSignatureCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLTAChallenge:challenge]]);
}

- (void)didChipConnected {
    if(rfidNotificationCompletionEvent != nil)
        rfidNotificationCompletionEvent(@1); // int RFID_EVENT_CHIP_DETECTED = 1;
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    if(rfidNotificationCompletionEvent != nil)
        rfidNotificationCompletionEvent(@2); // int RFID_EVENT_READING_ERROR = 2;
}

@end

@implementation FlutterDocumentReaderApiPlugin

static FlutterMethodChannel * _channel;
static NSNumber * _databasePercentageDownloaded;

+ (FlutterMethodChannel *)channel { return _channel; }
+ (void)setChannel:(FlutterMethodChannel *)newChannel { _channel = newChannel; }
+ (NSNumber*)databasePercentageDownloaded{ return _databasePercentageDownloaded; }
+ (void)setDatabasePercentageDownloaded:(NSNumber *)number { _databasePercentageDownloaded = number; }

typedef void (^Callback)(NSString* response);

- (void) result:(id _Nullable)message :(Callback)callback {
    callback(message);
}

-(void (^_Nullable)(NSProgress * _Nonnull progress))getProgressHandler:(Callback)successCallback :(Callback)errorCallback{
    return ^(NSProgress * _Nonnull progress) {
        if(FlutterDocumentReaderApiPlugin.databasePercentageDownloaded != [NSNumber numberWithDouble:progress.fractionCompleted * 100]){
            if(databaseProgressEvent != nil)
                databaseProgressEvent([NSString stringWithFormat:@"%.1f", progress.fractionCompleted * 100]);
            [FlutterDocumentReaderApiPlugin setDatabasePercentageDownloaded:[NSNumber numberWithDouble:progress.fractionCompleted * 100]];
        }
    };
}

-(RGLDocumentReaderCompletion _Nonnull)getCompletion {
    return ^(RGLDocReaderAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error) {
        if(completionEvent != nil)
            completionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateDocReaderAction: action] :results :error :nil]]);
    };
}

-(RGLRFIDProcessCompletion _Nonnull)getRFIDCompletion {
    return ^(RGLRFIDCompleteAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error, RGLRFIDErrorCodes errorCode) {
        if(completionEvent != nil)
            completionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateRFIDCompleteAction: action] :results :error :nil]]);
    };
}

-(RGLRFIDNotificationCallback _Nonnull)getRFIDNotificationCallback {
    return ^(RGLRFIDNotificationAction notificationAction, RGLRFIDNotify* _Nullable notification) {
        if(completionEvent != nil)
            completionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateCompletion:[RGLWJSONConstructor generateRFIDNotificationAction:notificationAction] :nil :nil :notification]]);
    };
}

- (void)didFinishRecordingToFile:(NSURL *)fileURL {
    if(videoEncoderCompletionEvent != nil)
        videoEncoderCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateVideoEncoderCompletion:fileURL :nil]]);
}

- (void)didFailWithError:(NSError *)error {
    if(videoEncoderCompletionEvent != nil)
        videoEncoderCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateVideoEncoderCompletion:nil :error]]);
}

- (void)onRequestPACertificatesWithSerial:(NSData *)serialNumber issuer:(RGLPAResourcesIssuer *)issuer callback:(RGLRFIDCertificatesCallback)callback {
    paCertificateCompletion = callback;
    if(paCertificateCompletionEvent != nil)
        paCertificateCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generatePACertificateCompletion:serialNumber :issuer]]);
}

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    taCertificateCompletion = callback;
    if(taCertificateCompletionEvent != nil)
        taCertificateCompletionEvent(keyCAR);
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    taSignatureCompletion = callback;
    if(taSignatureCompletionEvent != nil)
        taSignatureCompletionEvent([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLTAChallenge:challenge]]);
}

- (void)didChipConnected {
    if(rfidNotificationCompletionEvent != nil)
        rfidNotificationCompletionEvent(@1); // int RFID_EVENT_CHIP_DETECTED = 1;
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    if(rfidNotificationCompletionEvent != nil)
        rfidNotificationCompletionEvent(@2); // int RFID_EVENT_READING_ERROR = 2;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/completion" binaryMessenger:[registrar messenger]] setStreamHandler:[CompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/video_encoder_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[VideoEncoderCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/database_progress" binaryMessenger:[registrar messenger]] setStreamHandler:[DatabaseProgressStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/rfid_notification_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RFIDNotificationCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/pa_certificate_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[PACertificateCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/ta_certificate_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[TACertificateCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_document_reader_api/event/ta_signature_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[TASignatureCompletionStreamHandler new]];

    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_document_reader_api/method" binaryMessenger:[registrar messenger]];
    [FlutterDocumentReaderApiPlugin setChannel:channel];
    FlutterDocumentReaderApiPlugin* instance = [FlutterDocumentReaderApiPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* action = call.method;
    NSMutableArray* args = call.arguments;

    Callback successCallback = ^(id _Nullable response){
        result(response);
    };
    Callback errorCallback = ^(NSString* error){
        result([FlutterError errorWithCode:@"error" message:error details:nil]);
    };

    if([action isEqualToString:@"getAPIVersion"])
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
    else if([action isEqualToString:@"setRfidSessionStatus"])
        [self setRfidSessionStatus :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"providePACertificates"])
        [self providePACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTACertificates"])
        [self provideTACertificates :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"provideTASignature"])
        [self provideTASignature :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReaderWithDatabasePath"])
        [self initializeReaderWithDatabasePath :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeReaderWithDatabase"])
        [self initializeReaderWithDatabase :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageFrame"])
        [self recognizeImageFrame :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageWithOpts"])
        [self recognizeImageWithOpts :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeVideoFrame"])
        [self recognizeVideoFrame :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"showScannerWithCameraIDAndOpts"])
        [self showScannerWithCameraIDAndOpts :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageWithImageInputParams"])
        [self recognizeImageWithImageInputParams :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"recognizeImageWithCameraMode"])
        [self recognizeImageWithCameraMode :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else
        [self result:[NSString stringWithFormat:@"%@/%@", @"method not implemented: ", action] :errorCallback];
}

- (void) resetConfiguration:(Callback)successCallback :(Callback)errorCallback{
    [self result:@"resetConfiguration() is an android-only method" :errorCallback];
}

- (void) setEnableCoreLogs:(BOOL)logs :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"setEnableCoreLogs() is an android-only method" :errorCallback];
}

- (void) showScannerWithCameraID:(NSNumber*)cameraID :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"showScannerWithCameraID() is an android-only method" :errorCallback];
}

- (void) recognizeImageFrame:(NSString*)base64 :(NSDictionary*)opts :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"recognizeImageFrame() is an android-only method" :errorCallback];
}

- (void) recognizeImageWithOpts:(NSString*)base64 :(NSDictionary*)opts :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"recognizeImageWithOpts() is an android-only method" :errorCallback];
}

- (void) recognizeVideoFrame:(NSString*)byteString :(NSDictionary*)opts :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"recognizeVideoFrame() is an android-only method" :errorCallback];
}

- (void) showScannerWithCameraIDAndOpts:(NSNumber*)cameraID :(NSDictionary*)opts :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"showScannerWithCameraIDAndOpts() is an android-only method" :errorCallback];
}

- (void) recognizeImageWithImageInputParams:(NSString*)base64 :(NSDictionary*)params :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"recognizeImageWithImageInputParams() is an android-only method" :errorCallback];
}

- (void) getLicenseMessage:(Callback)successCallback :(Callback)errorCallback{
    [self result:@"getLicenseMessage() is an android-only method" :successCallback];
}

- (void) initializeReaderWithDatabase:(NSString*)licenseString :(NSString*)databaseString :(Callback)successCallback :(Callback)errorCallback{
    [self result:@"initializeReaderWithDatabase() is an android-only method" :successCallback];
}

- (void) initializeReader:(NSString*)licenseString :(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared initializeReader:[[NSData alloc] initWithBase64EncodedString:licenseString options:0] completion:[self getInitCompletion :successCallback :errorCallback]];
}

- (void) startRFIDReader:(Callback)successCallback :(Callback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared startRFIDReaderFromPresenter:[[[UIApplication sharedApplication] keyWindow] rootViewController] completion:[self getCompletion]];
    });
}

- (void) initializeReaderWithDatabasePath:(NSString*)licenseString :(NSString*)databasePath :(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared initializeReader:[[NSData alloc] initWithBase64EncodedString:licenseString options:0] databasePath:databasePath completion:[self getInitCompletion :successCallback :errorCallback]];
}

- (void) prepareDatabase:(NSString*)dbID :(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared prepareDatabase:dbID progressHandler:[self getProgressHandler :successCallback :errorCallback] completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) removeDatabase:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared removeDatabase:^(BOOL successful, NSError * _Nullable error) {
        if (successful)
            [self result:@"database removed" :successCallback];
        else
            [self result:[NSString stringWithFormat:@"%@/%@", @"database removal failed: ", error.description] :errorCallback];
    }];
}

- (void) cancelDBUpdate:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared cancelDBUpdate];
    [self result:@"" :successCallback];
}

-(void) runAutoUpdate:(NSString*)dbID :(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared runAutoUpdate:dbID progressHandler:[self getProgressHandler :successCallback :errorCallback] completion:[self getPrepareCompletion :successCallback :errorCallback]];
}

- (void) showScanner:(Callback)successCallback :(Callback)errorCallback{
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            UIViewController *currentViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            [RGLDocReader.shared showScanner:currentViewController completion:[self getCompletion]];
        });
}

- (void) recognizeImage:(NSMutableString*)base64 :(Callback)successCallback :(Callback)errorCallback{
    [self recognizeImageWith :base64 :false :successCallback :errorCallback];
}

- (void) recognizeImages:(NSArray*)input :(Callback)successCallback :(Callback)errorCallback{
        NSMutableArray<UIImage*>* images = [[NSMutableArray alloc] init];
        for(__strong NSMutableString* base64 in input)
            [images addObject:[UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [RGLDocReader.shared recognizeImages:images completion:[self getCompletion]];
        });
}

- (void) recognizeImageWithCameraMode:(NSMutableString*)base64 :(BOOL)cameraMode :(Callback)successCallback :(Callback)errorCallback{
    [self recognizeImageWith :base64 :cameraMode :successCallback :errorCallback];
}

- (void) recognizeImageWith:(NSMutableString*)base64 :(BOOL)cameraMode :(Callback)successCallback :(Callback)errorCallback{
        dispatch_async(dispatch_get_main_queue(), ^{
            [RGLDocReader.shared recognizeImage:[UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters]] cameraMode:cameraMode completion:[self getCompletion]];
        });
}

- (void) setConfig:(NSDictionary*)config :(Callback)successCallback :(Callback)errorCallback{
        [RegulaConfig setConfig:config :RGLDocReader.shared];
        [self result:@"" :successCallback];
}

- (void) getConfig:(Callback)successCallback :(Callback)errorCallback{
    [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:[RegulaConfig getConfig:RGLDocReader.shared] options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) setRfidScenario:(NSDictionary*)rfidScenario :(Callback)successCallback :(Callback)errorCallback{
        [RegulaConfig setRfidScenario:rfidScenario  :RGLDocReader.shared.rfidScenario];
        [self result:@"" :successCallback];
}

- (void) getRfidScenario:(Callback)successCallback :(Callback)errorCallback{
        [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:RGLDocReader.shared.rfidScenario.rfidScenarioDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) readRFID:(Callback)successCallback :(Callback)errorCallback{
        [RGLDocReader.shared readRFID:[self getRFIDNotificationCallback] completion:[self getRFIDCompletion]];
}

- (void) stopRFIDReader:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared stopRFIDReader:^(){[self result:@"" :successCallback];}];
}

- (void) clearPKDCertificates:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared clearPKDCertificates];
    [self result:@"" :successCallback];
}

- (void) addPKDCertificates:(NSArray*)input :(Callback)successCallback :(Callback)errorCallback{
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    [RGLDocReader.shared addPKDCertificates:certificates];
    [self result:@"" :successCallback];
}

- (void) deinitializeReader:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared deinitializeReader];
    [self result:@"" :successCallback];
}

- (void) selectedScenario:(Callback)successCallback :(Callback)errorCallback{
    [self result:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLScenario:RGLDocReader.shared.selectedScenario]] :successCallback];
}

- (void) stopScanner:(Callback)successCallback :(Callback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared stopScanner:^(){
            [self result:@"" :successCallback];
        }];
    });
}

- (void) startNewSession:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared startNewSession];
    [self result:@"" :successCallback];
}

- (void) startNewPage:(Callback)successCallback :(Callback)errorCallback{
    [RGLDocReader.shared startNewPage];
    [self result:@"" :successCallback];
}

- (void) getDocumentReaderIsReady:(Callback)successCallback :(Callback)errorCallback{
    [self result:[RGLDocReader.shared isDocumentReaderIsReady] ? @YES : @NO :successCallback];
}

- (void) getAPIVersion:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.api :successCallback];
}

- (void) getCoreVersion:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.core :successCallback];
}

- (void) getCoreMode:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.coreMode :successCallback];
}

- (void) getDatabaseID:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.database.databaseID :successCallback];
}

- (void) getDatabaseVersion:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.database.version :successCallback];
}

- (void) getDatabaseDate:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.database.date :successCallback];
}

- (void) getDatabaseDescription:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.version.database.databaseDescription :successCallback];
}

- (void) getDatabaseCountriesNumber:(Callback)successCallback :(Callback)errorCallback{
    [self result:[NSNumber numberWithInteger:RGLDocReader.shared.version.database.countriesNumber] :successCallback];
}

- (void) getDatabaseDocumentsNumber:(Callback)successCallback :(Callback)errorCallback{
    [self result:[NSNumber numberWithInteger:RGLDocReader.shared.version.database.documentsNumber] :successCallback];
}

- (void) getLicenseExpiryDate:(Callback)successCallback :(Callback)errorCallback{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehaviorDefault];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [self result:[formatter stringFromDate:RGLDocReader.shared.license.expiryDate] :successCallback];
}

- (void) getLicenseCountryFilter:(Callback)successCallback :(Callback)errorCallback{
    if(RGLDocReader.shared.license.countryFilter == nil)
        [self result:@"nil" :successCallback];
    else
        [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:RGLDocReader.shared.license.countryFilter options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

- (void) licenseIsRfidAvailable:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.license.isRfidAvailable ? @YES : @NO :successCallback];
}

- (void) getDocumentReaderStatus:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.documentReaderStatus :successCallback];
}

- (void) getRfidSessionStatus:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.rfidSessionStatus :successCallback];
}

- (void) setRfidSessionStatus:(NSString*)status :(Callback)successCallback :(Callback)errorCallback{
    RGLDocReader.shared.rfidSessionStatus = status;
    [self result:@"" :successCallback];
}

- (void) getCurrentScenario:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.processParams.scenario :successCallback];
}

- (void) getCameraSessionIsPaused:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.isCameraSessionIsPaused ? @YES : @NO :successCallback];
}

- (void) setCameraSessionIsPaused:(BOOL)paused :(Callback)successCallback :(Callback)errorCallback{
    RGLDocReader.shared.cameraSessionIsPaused = paused;
    [self result:@"" :successCallback];
}

- (void) isRFIDAvailableForUse:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.isRFIDAvailableForUse ? @YES : @NO :successCallback];
}

- (void) isAuthenticatorAvailableForUse:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.isAuthenticatorAvailableForUse ? @YES : @NO :successCallback];
}

- (void) getSessionLogFolder:(Callback)successCallback :(Callback)errorCallback{
    [self result:RGLDocReader.shared.processParams.sessionLogFolder :successCallback];
}

- (void) getScenario:(NSString*)scenarioID :(Callback)successCallback :(Callback)errorCallback{
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

- (void) providePACertificates:(NSArray*)input :(Callback)successCallback :(Callback)errorCallback{
    if(paCertificateCompletion == nil){
        [self result:@"paCertificateCompletion is nil" :errorCallback];
        return;
    }
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    paCertificateCompletion(certificates);
    [self result:@"" :successCallback];
}

- (void) provideTACertificates:(NSArray*)input :(Callback)successCallback :(Callback)errorCallback{
    if(taCertificateCompletion == nil){
        [self result:@"taCertificateCompletion is nil" :errorCallback];
        return;
    }
    NSMutableArray *certificates = [[NSMutableArray alloc] init];
    for(NSDictionary* certificateJSON in input)
        [certificates addObject:[RGLWJSONConstructor RGLPKDCertificateFromJson:certificateJSON]];
    taCertificateCompletion(certificates);
    [self result:@"" :successCallback];
}

- (void) provideTASignature:(NSString*)input :(Callback)successCallback :(Callback)errorCallback{
    if(taSignatureCompletion == nil){
        [self result:@"taSignatureCompletion is nil" :errorCallback];
        return;
    }
    taSignatureCompletion([[NSData alloc] initWithBase64EncodedString:input options:0]);
    [self result:@"" :successCallback];
}

- (void) setRfidDelegate:(NSNumber*)input :(Callback)successCallback :(Callback)errorCallback{
    switch([input integerValue]){
        case 0:
            [RGLDocReader shared].rfidDelegate = nil;
            break;
        case 1:
            if(rfidDelegateNoPA == nil)
                rfidDelegateNoPA = [RFIDDelegateNoPA new];
            [RGLDocReader shared].rfidDelegate = rfidDelegateNoPA;
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

- (void) getAvailableScenarios:(Callback)successCallback :(Callback)errorCallback{
    NSMutableArray *availableScenarios = [[NSMutableArray alloc] init];
    for(RGLScenario *scenario in RGLDocReader.shared.availableScenarios)
        [availableScenarios addObject:[RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateRGLScenario:scenario]]];
    [self result:[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:availableScenarios options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] :successCallback];
}

-(RGLDocumentReaderInitializationCompletion)getInitCompletion:(Callback)successCallback :(Callback)errorCallback{
    return ^(BOOL successful, NSError * _Nullable error ) {
        if (successful){
            [RGLDocReader shared].functionality.recordScanningProcessDelegate = self;
            [self result:@"init complete" :successCallback];
        }else
            [self result:[NSString stringWithFormat:@"%@/%@", @"init failed: ", error.description] :errorCallback];
    };
}

-(RGLDocumentReaderPrepareCompletion _Nonnull)getPrepareCompletion:(Callback)successCallback :(Callback)errorCallback{
    return ^(BOOL successful, NSError * _Nullable error) {
        if (successful)
            [self result:@"database prepared" :successCallback];
        else
            [self result:[NSString stringWithFormat:@"%@/%@", @"database preparation failed: ", error.description] :errorCallback];
    };
}

@end
