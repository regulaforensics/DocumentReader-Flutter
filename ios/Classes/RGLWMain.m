#import "RGLWMain.h"

@implementation RGLWMain

+(void)methodCall:(NSString*)method :(NSArray*)args :(RGLWCallback)callback :(RGLWEventSender)eventSender {
    if(!this) this = [RGLWMain new];
    sendEvent = eventSender;
    NSDictionary* Switch = @{
        @"getDocumentReaderIsReady": ^{ [self getDocumentReaderIsReady :callback]; },
        @"getDocumentReaderStatus": ^{ [self getDocumentReaderStatus :callback]; },
        @"getRfidSessionStatus": ^{ [self getRfidSessionStatus :callback]; },
        @"setRfidSessionStatus": ^{ [self setRfidSessionStatus :args[0]]; },
        @"getTag": ^{ [self getTag :callback]; },
        @"setTag": ^{ [self setTag :args[0]]; },
        @"getTenant": ^{ [self getTenant :callback]; },
        @"setTenant": ^{ [self setTenant :args[0]]; },
        @"getEnv": ^{ [self getEnv :callback]; },
        @"setEnv": ^{ [self setEnv :args[0]]; },
        @"getLocale": ^{ [self getLocale :callback]; },
        @"setLocale": ^{ [self setLocale :args[0]]; },
        @"getFunctionality": ^{ [self getFunctionality :callback]; },
        @"setFunctionality": ^{ [self setFunctionality :args[0]]; },
        @"getProcessParams": ^{ [self getProcessParams :callback]; },
        @"setProcessParams": ^{ [self setProcessParams :args[0]]; },
        @"getCustomization": ^{ [self getCustomization :callback]; },
        @"setCustomization": ^{ [self setCustomization :args[0]]; },
        @"getRfidScenario": ^{ [self getRfidScenario :callback]; },
        @"setRfidScenario": ^{ [self setRfidScenario :args[0]]; },
        @"resetConfiguration": ^{ [self resetConfiguration]; },
        @"initialize": ^{ [self initialize :args[0] :callback]; },
        @"initializeReader": ^{ [self initialize :args[0] :callback]; }, // deprecated
        @"initializeReaderWithBleDeviceConfig": ^{ [self initializeReaderWithBleDeviceConfig :args[0] :callback]; }, // deprecated
        @"deinitializeReader": ^{ [self deinitializeReader]; },
        @"prepareDatabase": ^{ [self prepareDatabase :args[0] :callback]; },
        @"removeDatabase": ^{ [self removeDatabase :callback]; },
        @"runAutoUpdate": ^{ [self runAutoUpdate :args[0] :callback]; },
        @"cancelDBUpdate": ^{ [self cancelDBUpdate :callback]; },
        @"checkDatabaseUpdate": ^{ [self checkDatabaseUpdate :args[0] :callback]; },
        @"scan": ^{ [self scan :args[0]]; },
        @"startScanner": ^{ [self startScanner :args[0]]; },
        @"recognize": ^{ [self recognize :args[0]]; },
        @"startNewPage": ^{ [self startNewPage]; },
        @"stopScanner": ^{ [self stopScanner]; },
        @"startRFIDReader": ^{ [self startRFIDReader :args[0] :args[1] :args[2]]; },
        @"readRFID": ^{ [self readRFID :args[0] :args[1] :args[2]]; },
        @"stopRFIDReader": ^{ [self stopRFIDReader]; },
        @"providePACertificates": ^{ [self providePACertificates :args[0]]; },
        @"provideTACertificates": ^{ [self provideTACertificates :args[0]]; },
        @"provideTASignature": ^{ [self provideTASignature :args[0]]; },
        @"setTCCParams": ^{ [self setTCCParams :args[0] :callback]; },
        @"addPKDCertificates": ^{ [self addPKDCertificates :args[0]]; },
        @"clearPKDCertificates": ^{ [self clearPKDCertificates]; },
        @"startNewSession": ^{ [self startNewSession]; },
        @"connectBluetoothDevice": ^{ [self connectBluetoothDevice :args[0] :callback]; },
        @"btDeviceRequestFlashing": ^{ /* android only */ },
        @"btDeviceRequestFlashingFullIR": ^{ /* android only */ },
        @"btDeviceRequestTurnOffAll": ^{ /* android only */ },
        @"setLocalizationDictionary": ^{ [self setLocalizationDictionary :args[0]]; },
        @"getLicense": ^{ [self getLicense :callback]; },
        @"getAvailableScenarios": ^{ [self getAvailableScenarios :callback]; },
        @"getIsRFIDAvailableForUse": ^{ [self getIsRFIDAvailableForUse :callback]; },
        @"isAuthenticatorRFIDAvailableForUse": ^{ [self isAuthenticatorRFIDAvailableForUse :callback]; },
        @"isAuthenticatorAvailableForUse": ^{ [self isAuthenticatorAvailableForUse :callback]; },
        @"getDocReaderVersion": ^{ [self getDocReaderVersion :callback]; },
        @"getDocReaderDocumentsDatabase": ^{ [self getDocReaderDocumentsDatabase :callback]; },
        @"finalizePackage": ^{ [self finalizePackage :callback]; },
        @"endBackendTransaction": ^{ [self endBackendTransaction]; },
        @"textFieldValueByType": ^{ [self textFieldValueByType :args[0] :args[1] :callback]; },
        @"textFieldValueByTypeLcid": ^{ [self textFieldValueByTypeLcid :args[0] :args[1] :args[2] :callback]; },
        @"textFieldValueByTypeSource": ^{ [self textFieldValueByTypeSource :args[0] :args[1] :args[2] :callback]; },
        @"textFieldValueByTypeLcidSource": ^{ [self textFieldValueByTypeLcidSource :args[0] :args[1] :args[2] :args[3] :callback]; },
        @"textFieldValueByTypeSourceOriginal": ^{ [self textFieldValueByTypeSourceOriginal :args[0] :args[1] :args[2] :args[3] :callback]; },
        @"textFieldValueByTypeLcidSourceOriginal": ^{ [self textFieldValueByTypeLcidSourceOriginal :args[0] :args[1] :args[2] :args[3] :args[4] :callback]; },
        @"textFieldByType": ^{ [self textFieldByType :args[0] :args[1] :callback]; },
        @"textFieldByTypeLcid": ^{ [self textFieldByTypeLcid :args[0] :args[1] :args[2] :callback]; },
        @"graphicFieldByTypeSource": ^{ [self graphicFieldByTypeSource :args[0] :args[1] :args[2] :callback]; },
        @"graphicFieldByTypeSourcePageIndex": ^{ [self graphicFieldByTypeSourcePageIndex :args[0] :args[1] :args[2] :args[3] :callback]; },
        @"graphicFieldByTypeSourcePageIndexLight": ^{ [self graphicFieldByTypeSourcePageIndexLight :args[0] :args[1] :args[2] :args[3] :args[4] :callback]; },
        @"graphicFieldImageByType": ^{ [self graphicFieldImageByType :args[0] :args[1] :callback]; },
        @"graphicFieldImageByTypeSource": ^{ [self graphicFieldImageByTypeSource :args[0] :args[1] :args[2] :callback]; },
        @"graphicFieldImageByTypeSourcePageIndex": ^{ [self graphicFieldImageByTypeSourcePageIndex :args[0] :args[1] :args[2] :args[3] :callback]; },
        @"graphicFieldImageByTypeSourcePageIndexLight": ^{ [self graphicFieldImageByTypeSourcePageIndexLight :args[0] :args[1] :args[2] :args[3] :args[4] :callback]; },
        @"containers": ^{ [self containers :args[0] :args[1] :callback]; },
        @"encryptedContainers": ^{ [self encryptedContainers :args[0] :callback]; },
        @"getTranslation": ^{ [self getTranslation :args[0] :args[1] :callback]; },
        // remove after finishing old dr support
        @"processParamsSetCheckFilter": ^{ [self processParamsSetCheckFilter :args[0] :args[1]]; },
        @"processParamsRemoveCheckFilter": ^{ [self processParamsRemoveCheckFilter :args[0]]; },
        @"processParamsClearCheckFilter": ^{ [self processParamsClearCheckFilter]; },
        @"authenticityParamsSetCheckFilter": ^{ [self authenticityParamsSetCheckFilter :args[0] :args[1]]; },
        @"authenticityParamsRemoveCheckFilter": ^{ [self authenticityParamsRemoveCheckFilter :args[0]]; },
        @"authenticityParamsClearCheckFilter": ^{ [self authenticityParamsClearCheckFilter]; },
        @"livenessParamsSetCheckFilter": ^{ [self livenessParamsSetCheckFilter :args[0] :args[1]]; },
        @"livenessParamsRemoveCheckFilter": ^{ [self livenessParamsRemoveCheckFilter :args[0]]; },
        @"livenessParamsClearCheckFilter": ^{ [self livenessParamsClearCheckFilter]; },
    };
    ((void(^)(void))Switch[method])();
}

static RGLWMain* this;
static RGLWEventSender sendEvent;
static NSDictionary* headers;

+(void)getDocumentReaderIsReady:(RGLWCallback)callback {
    callback([RGLDocReader.shared isDocumentReaderIsReady] ? @YES : @NO);
}

+(void)getDocumentReaderStatus:(RGLWCallback)callback {
    callback(RGLDocReader.shared.documentReaderStatus);
}

+(void)getRfidSessionStatus:(RGLWCallback)callback {
    callback(RGLDocReader.shared.rfidSessionStatus);
}

+(void)setRfidSessionStatus:(NSString*)status {
    RGLDocReader.shared.rfidSessionStatus = status;
}

+(void)getTag:(RGLWCallback)callback {
    callback([RGLDocReader.shared tag]);
}

+(void)setTag:(NSString*)tag {
    [RGLDocReader.shared setTag:tag];
}

+(void)getTenant:(RGLWCallback)callback {
    callback([RGLDocReader.shared tenant]);
}

+(void)setTenant:(NSString*)tag {
    [RGLDocReader.shared setTenant:tag];
}

+(void)getEnv:(RGLWCallback)callback {
    callback([RGLDocReader.shared env]);
}

+(void)setEnv:(NSString*)tag {
    [RGLDocReader.shared setEnv:tag];
}

+(void)getLocale:(RGLWCallback)callback {
    callback([RGLDocReader.shared languageLocaleCode]);
}

+(void)setLocale:(NSString*)locale {
    [RGLDocReader.shared setLanguageLocaleCode:locale];
}

+(void)getFunctionality:(RGLWCallback)callback {
    callback([RGLWJSONConstructor dictToString: [RGLWConfig getFunctionality: RGLDocReader.shared.functionality]]);
}

+(void)setFunctionality:(NSDictionary*)functionality {
    [RGLWConfig setFunctionality:functionality :RGLDocReader.shared.functionality];
}

+(void)getProcessParams:(RGLWCallback)callback {
    callback([RGLWJSONConstructor dictToString: [RGLWConfig getProcessParams:RGLDocReader.shared.processParams]]);
}

+(void)setProcessParams:(NSDictionary*)processParams {
    [RGLWConfig setProcessParams:processParams :RGLDocReader.shared.processParams];
}

+(void)getCustomization:(RGLWCallback)callback {
    callback([RGLWJSONConstructor dictToString: [RGLWConfig getCustomization :RGLDocReader.shared.customization]]);
}

+(void)setCustomization:(NSDictionary*)customization {
    [RGLWConfig setCustomization:customization :RGLDocReader.shared.customization];
}

+(void)getRfidScenario:(RGLWCallback)callback {
    callback([RGLWJSONConstructor dictToString: [RGLWConfig getRfidScenario:RGLDocReader.shared.rfidScenario]]);
}

+(void)setRfidScenario:(NSDictionary*)rfidScenario {
    [RGLWConfig setRfidScenario:rfidScenario :RGLDocReader.shared.rfidScenario];
}

+(void)resetConfiguration {
    RGLDocReader.shared.functionality = [RGLFunctionality new];
    RGLDocReader.shared.processParams = [RGLProcessParams new];
    RGLDocReader.shared.customization = [RGLCustomization new];
    RGLDocReader.shared.rfidScenario = [RGLRFIDScenario new];
}

+(void)initialize:(NSDictionary*)config :(RGLWCallback)callback {
    if (config[@"useBleDevice"] && [config[@"useBleDevice"] boolValue] == true)
        [RGLDocReader.shared initializeReaderWithConfig:[RGLWJSONConstructor bleDeviceConfigFromJson:config :bluetooth] completion: [self initCompletion :callback]];
    else
        [RGLDocReader.shared initializeReaderWithConfig:[RGLWJSONConstructor configFromJson:config] completion:[self initCompletion :callback]];
}

// deprecated
+(void)initializeReaderWithBleDeviceConfig:(NSDictionary*)config :(RGLWCallback)callback {
    [RGLDocReader.shared initializeReaderWithConfig:[RGLWJSONConstructor bleDeviceConfigFromJson:config :bluetooth] completion: [self initCompletion :callback]];
}

+(void)deinitializeReader {
    [RGLDocReader.shared deinitializeReader];
}

+(void)prepareDatabase:(NSString*)databaseID :(RGLWCallback)callback {
    [RGLDocReader.shared prepareDatabase:databaseID progressHandler:nil completion:[self prepareCompletion :callback]];
}

+(void)removeDatabase:(RGLWCallback)callback {
    [RGLDocReader.shared removeDatabase:^(BOOL success, NSError * _Nullable error) {
        callback(success ? @YES : @NO);
    }];
}

+(void)runAutoUpdate:(NSString*)databaseID :(RGLWCallback)callback {
    [RGLDocReader.shared runAutoUpdate:databaseID progressHandler:nil completion:[self prepareCompletion :callback]];
}

+(void)cancelDBUpdate:(RGLWCallback)callback {
    [RGLDocReader.shared cancelDBUpdate];
    callback(@YES);
}

+(void)checkDatabaseUpdate:(NSString*)databaseID :(RGLWCallback)callback {
    [RGLDocReader.shared checkDatabaseUpdate:databaseID completion:^(RGLDocReaderDocumentsDatabase* database) {
        callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocReaderDocumentsDatabase:database]]);
    }];
}

+(void)scan:(NSDictionary*)config {
    dispatch_async(dispatch_get_main_queue(), ^{
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        #pragma clang diagnostic pop
        [RGLDocReader.shared showScannerFromPresenter:RGLWRootViewController() config:[RGLWJSONConstructor scannerConfigFromJson:config] completion:[self completion]];
    });
}

+(void)startScanner:(NSDictionary*)config {
    dispatch_async(dispatch_get_main_queue(), ^{
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        #pragma clang diagnostic pop
        [RGLDocReader.shared startScannerFromPresenter:RGLWRootViewController() config:[RGLWJSONConstructor scannerConfigFromJson:config] completion:[self completion]];
    });
}

+(void)recognize:(NSDictionary*)config {
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared recognizeImageFromPresenter:RGLWRootViewController() config:[RGLWJSONConstructor recognizeConfigFromJson:config] completion:[self completion]];
    });
}

+(void)startNewPage {
    [RGLDocReader.shared startNewPage];
}

+(void)stopScanner {
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared stopScanner:nil];
    });
}

+(void)startRFIDReader:(NSNumber*)paCert :(NSNumber*)taCert :(NSNumber*)taSig {
    this.doRequestPACertificates = paCert;
    this.doRequestTACertificates = taCert;
    this.doRequestTASignature = taSig;
    dispatch_async(dispatch_get_main_queue(), ^{
        [RGLDocReader.shared startRFIDReaderFromPresenter:RGLWRootViewController() completion:[self completion]];
    });
}

+(void)readRFID:(NSNumber*)paCert :(NSNumber*)taCert :(NSNumber*)taSig {
    this.doRequestPACertificates = paCert;
    this.doRequestTACertificates = taCert;
    this.doRequestTASignature = taSig;
    [RGLDocReader.shared readRFID:^(RGLRFIDNotificationAction notificationAction, RGLRFIDNotify* _Nullable notification) {
        if (notification != nil) sendEvent(rfidOnProgressEvent, [RGLWJSONConstructor generateDocumentReaderNotification:notification]);
    } completion :^(RGLRFIDCompleteAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error, RGLRFIDErrorCodes errorCode) {
        sendEvent(completionEvent, [RGLWJSONConstructor generateCompletion:[RGLWConfig generateRFIDCompleteAction: action] :results :error]);
    }];
}

+(void)stopRFIDReader {
    [RGLDocReader.shared stopRFIDReader:nil];
}

+(void)providePACertificates:(NSArray*)certificates {
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    paCertificateCompletion(certificatesMutable);
}

+(void)provideTACertificates:(NSArray*)certificates {
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    taCertificateCompletion(certificatesMutable);
}

+(void)provideTASignature:(NSString*)signature {
    taSignatureCompletion([RGLWJSONConstructor base64Decode:signature]);
}

+(void)setTCCParams:(NSDictionary*)params :(RGLWCallback)callback {
    [RGLDocReader.shared setTCCParams:[RGLWJSONConstructor tccParamsFromJson:params] completion:^(BOOL success, NSError * _Nullable error) {
        callback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
    }];
}

+(void)addPKDCertificates:(NSArray*)certificates {
    NSMutableArray *certificatesMutable = [NSMutableArray new];
    for(NSDictionary* certificateJSON in certificates)
        [certificatesMutable addObject:[RGLWJSONConstructor pkdCertificateFromJson:certificateJSON]];
    [RGLDocReader.shared addPKDCertificates:certificatesMutable];
}

+(void)clearPKDCertificates {
    [RGLDocReader.shared clearPKDCertificates];
}

+(void)startNewSession {
    [RGLDocReader.shared startNewSession];
}

RGLBluetooth* bluetooth;
RGLWCallback savedCallbackForBluetoothResult;

+(void)connectBluetoothDevice:(NSString*)deviceName :(RGLWCallback)callback {
    // return if already connected
    if (bluetooth && bluetooth.state == RGLBluetoothConnectionStateConnected) return;
    
    // start searching devices
    if (!bluetooth) {
        bluetooth = [RGLBluetooth new];
        bluetooth.delegate = this;
    }
    savedCallbackForBluetoothResult = callback;
    [bluetooth connectWithDeviceName:deviceName];
}

// RGLBluetoothDelegate
- (void)didChangeConnectionState:(RGLBluetooth *)bluetooth state:(RGLBluetoothConnectionState)state {
    if (state == RGLBluetoothConnectionStateNone && savedCallbackForBluetoothResult)
        [RGLWMain bluetoothDeviceConnectionFailed];
    
    // set searching timeout
    if (state == RGLBluetoothConnectionStateSearching)
        [[self class] performSelector:NSSelectorFromString(@"bluetoothDeviceConnectionFailed") withObject:nil afterDelay:7.0];
    
    if (state == RGLBluetoothConnectionStateConnected) {
        savedCallbackForBluetoothResult(@YES);
        savedCallbackForBluetoothResult = nil;
        [NSObject cancelPreviousPerformRequestsWithTarget:[self class] selector:NSSelectorFromString(@"bluetoothDeviceConnectionFailed") object:nil];
    }
}

+(void)bluetoothDeviceConnectionFailed {
    if (savedCallbackForBluetoothResult) {
        savedCallbackForBluetoothResult(@NO);
        savedCallbackForBluetoothResult = nil;
    }
    [bluetooth stopSearchDevices];
    [bluetooth disconnect];
}

+(void)setLocalizationDictionary:(NSDictionary*)dictionary {
    RGLDocReader.shared.localizationHandler = ^NSString * _Nullable(NSString * _Nonnull localizationKey) {
        if(dictionary != nil && ![dictionary isEqual:[NSNull null]] && [dictionary valueForKey:localizationKey] != nil)
            return [dictionary valueForKey:localizationKey];
        return nil;
    };
}

+(void)getLicense :(RGLWCallback)callback {
    callback([RGLWJSONConstructor generateLicense:RGLDocReader.shared.license]);
}

+(void)getAvailableScenarios :(RGLWCallback)callback {
    NSMutableArray *availableScenarios = [NSMutableArray new];
    for(RGLScenario *scenario in RGLDocReader.shared.availableScenarios)
        [availableScenarios addObject:[RGLWJSONConstructor generateScenario:scenario]];
    callback([RGLWJSONConstructor arrayToString:availableScenarios]);
}

+(void)getIsRFIDAvailableForUse :(RGLWCallback)callback {
    callback(RGLDocReader.shared.isRFIDAvailableForUse ? @YES : @NO);
}

+(void)getDocReaderVersion :(RGLWCallback)callback {
    callback([RGLWJSONConstructor generateDocReaderVersion:RGLDocReader.shared.version]);
}

+(void)isAuthenticatorRFIDAvailableForUse :(RGLWCallback)callback {
    callback(RGLDocReader.shared.isAuthenticatorRFIDAvailableForUse ? @YES : @NO);
}

+(void)isAuthenticatorAvailableForUse :(RGLWCallback)callback {
    callback(RGLDocReader.shared.isAuthenticatorAvailableForUse ? @YES : @NO);
}

+(void)getDocReaderDocumentsDatabase :(RGLWCallback)callback {
    if(RGLDocReader.shared.version != nil)
        callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocReaderDocumentsDatabase:RGLDocReader.shared.version.database]]);
    else callback(nil);
}

+(void)finalizePackage:(RGLWCallback)callback {
    [RGLDocReader.shared finalizePackageWithCompletion:^(RGLDocReaderAction action, RGLTransactionInfo* info, NSError* error) {
        callback([RGLWJSONConstructor generateFinalizePackageCompletion:[RGLWConfig generateDocReaderAction: action] :info :error]);
    }];
}

+(void)endBackendTransaction {
    [RGLDocReader.shared endBackendTransaction];
}

+(void)textFieldValueByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue]]);
}

+(void)textFieldValueByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue]]);
}

+(void)textFieldValueByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue]]);
}

+(void)textFieldValueByTypeLcidSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue]]);
}

+(void)textFieldValueByTypeSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(BOOL)original :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue] source:[source integerValue] original:original]);
}

+(void)textFieldValueByTypeLcidSourceOriginal:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(NSNumber*)source :(BOOL)original :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getTextFieldValueByType:[fieldType integerValue] lcid:[lcid integerValue] source:[source integerValue] original:original]);
}

+(void)textFieldByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue]];
    if (result == nil) callback(nil);
    callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderTextField:result]]);
}

+(void)textFieldByTypeLcid:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)lcid :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderTextField* result = [results getTextFieldByType:[fieldType integerValue] lcid:[lcid integerValue]];
    if (result == nil) callback(nil);
    callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderTextField:result]]);
}

+(void)graphicFieldByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue]];
    if (result == nil) callback(nil);
    callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

+(void)graphicFieldByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]];
    if (result == nil) callback(nil);
    callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

+(void)graphicFieldByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    RGLDocumentReaderGraphicField* result = [results getGraphicFieldByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]];
    if (result == nil) callback(nil);
    callback([RGLWJSONConstructor dictToString:[RGLWJSONConstructor generateDocumentReaderGraphicField:result]]);
}

+(void)graphicFieldImageByType:(NSString*)rawResult :(NSNumber*)fieldType :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue]]]);
}

+(void)graphicFieldImageByTypeSource:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue]]]);
}

+(void)graphicFieldImageByTypeSourcePageIndex:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue]]]);
}

+(void)graphicFieldImageByTypeSourcePageIndexLight:(NSString*)rawResult :(NSNumber*)fieldType :(NSNumber*)source :(NSNumber*)pageIndex :(NSNumber*)light :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([RGLWJSONConstructor base64WithImage:[results getGraphicFieldImageByType:[fieldType integerValue] source:[source integerValue] pageIndex:[pageIndex integerValue] light:[light integerValue]]]);
}

+(void)containers:(NSString*)rawResult :(NSArray<NSNumber*>*)resultType :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getContainersByResultTypes:resultType]);
}

+(void)encryptedContainers:(NSString*)rawResult :(RGLWCallback)callback {
    RGLDocumentReaderResults* results = [RGLDocumentReaderResults initWithRawString:rawResult];
    callback([results getEncryptedContainers]);
}

+(void)getTranslation:(NSString*)className :(NSNumber*)value :(RGLWCallback)callback {
    if([className isEqualToString:@"RFIDErrorCodes"])
        callback(RGLRFIDErrorCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"LDSParsingErrorCodes"])
        callback(eLDS_ParsingErrorCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"LDSParsingNotificationCodes"])
        callback(eLDS_ParsingNotificationCodesGetStringValue([value intValue]));
    else if([className isEqualToString:@"ImageQualityCheckType"])
        callback(RGLImageQualityCheckTypeGetStringValue([RGLWConfig imageQualityCheckTypeWithNumber:value]));
    else if([className isEqualToString:@"RFIDDataFileType"])
        callback(RGLRFIDDataFileTypeGetStringValue([value intValue]));
    else if([className isEqualToString:@"VisualFieldType"])
        callback(RGLFieldTypeGetStringValue([value intValue]));
    else if([className isEqualToString:@"LCID"])
        callback([RGLDocumentReaderTextField lcidName:[value intValue]]);
}

+ (void)processParamsSetCheckFilter:(NSString*)checkType :(NSDictionary*)filter {
    [RGLDocReader.shared.processParams addFilter:[RGLWJSONConstructor filterObjectFromJson:filter] forCheckType:checkType];
}

+ (void)processParamsRemoveCheckFilter:(NSString*)checkType {
    [RGLDocReader.shared.processParams removeFilterForCheckType:checkType];
}

+ (void)processParamsClearCheckFilter {
    [RGLDocReader.shared.processParams clearCheckFilter];
}

+ (void)authenticityParamsSetCheckFilter:(NSString*)checkType :(NSDictionary*)filter {
    [RGLDocReader.shared.processParams.authenticityParams addFilter:[RGLWJSONConstructor filterObjectFromJson:filter] forCheckType:checkType];
}

+ (void)authenticityParamsRemoveCheckFilter:(NSString*)checkType {
    [RGLDocReader.shared.processParams.authenticityParams removeFilterForCheckType:checkType];
}

+ (void)authenticityParamsClearCheckFilter {
    [RGLDocReader.shared.processParams.authenticityParams clearCheckFilter];
}

+ (void)livenessParamsSetCheckFilter:(NSString*)checkType :(NSDictionary*)filter {
    [RGLDocReader.shared.processParams.authenticityParams.livenessParams addFilter:[RGLWJSONConstructor filterObjectFromJson:filter] forCheckType:checkType];
}

+ (void)livenessParamsRemoveCheckFilter:(NSString*)checkType {
    [RGLDocReader.shared.processParams.authenticityParams.livenessParams removeFilterForCheckType:checkType];
}

+ (void)livenessParamsClearCheckFilter {
    [RGLDocReader.shared.processParams.authenticityParams.livenessParams clearCheckFilter];
}

+(RGLDocumentReaderCompletion _Nonnull)completion {
    return ^(RGLDocReaderAction action, RGLDocumentReaderResults * _Nullable results, NSError * _Nullable error) {
        sendEvent(completionEvent, [RGLWJSONConstructor generateCompletion:[RGLWConfig generateDocReaderAction: action] :results :error]);
    };
}

+(RGLDocumentReaderPrepareCompletion _Nonnull)prepareCompletion:(RGLWCallback)callback {
    RGLDocReader.shared.databaseFetchDelegate = this;
    return ^(BOOL success, NSError * _Nullable error) {
        callback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
    };
}

+(RGLDocumentReaderInitializationCompletion)initCompletion:(RGLWCallback)callback {
    return ^(BOOL success, NSError * _Nullable error ) {
        if (success) {
            RGLDocReader.shared.rfidDelegate = this;
            RGLDocReader.shared.functionality.recordScanningProcessDelegate = this;
            RGLDocReader.shared.customization.actionDelegate = this;
        }
        callback([RGLWJSONConstructor generateSuccessCompletion:success :error]);
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
    sendEvent(databaseProgressEvent, [RGLWJSONConstructor dictToString: result]);
}

// RGLCustomizationActionDelegate
- (void)onCustomButtonTappedWithTag:(NSInteger)tag {
    sendEvent(drOnCustomButtonTappedEvent, @(tag));
}

// RGLRecordScanningProcessDelegate
- (void)didFinishRecordingToFile:(NSURL *)fileURL {
    sendEvent(drVideoEncoderCompletionEvent, fileURL.absoluteString);
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
        sendEvent(paCertificateCompletionEvent, [RGLWJSONConstructor generatePACertificateCompletion:serialNumber :issuer]);
    } else {
        paCertificateCompletion = nil;
        callback(nil);
    }
}

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR callback:(RGLRFIDCertificatesCallback)callback {
    if([self.doRequestTACertificates boolValue]) {
        taCertificateCompletion = callback;
        sendEvent(taCertificateCompletionEvent, keyCAR);
    } else {
        taCertificateCompletion = nil;
        callback(nil);
    }
}

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge callback:(void(^)(NSData *signature))callback {
    if([self.doRequestTASignature boolValue]) {
        taSignatureCompletion = callback;
        sendEvent(taSignatureCompletionEvent, [RGLWJSONConstructor dictToString: [RGLWJSONConstructor generateTAChallenge:challenge]]);
    } else {
        taSignatureCompletion = nil;
        callback(nil);
    }
}

- (void)didChipConnected {
    sendEvent(rfidOnChipDetectedEvent, @"");
}

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode {
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"code"] = [NSNumber numberWithInteger:errorCode];
    sendEvent(rfidOnRetryReadChipEvent, [RGLWJSONConstructor dictToString:result]);
}

@end
