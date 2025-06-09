#import "FlutterDocumentReaderApiPlugin.h"

@implementation FlutterDocumentReaderApiPlugin

UIViewController*(^RGLWRootViewController)(void) = ^UIViewController*(){
    for (UIWindow *window in UIApplication.sharedApplication.windows)
        if (window.isKeyWindow)
            return window.rootViewController;
    return nil;
};

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    eventSinks = [NSMutableDictionary new];
    void(^setupEventChannel)(NSObject<FlutterPluginRegistrar>* registrar, NSString*eventId, NSObject<FlutterStreamHandler>*handler) = ^(NSObject<FlutterPluginRegistrar>* registrar, NSString*eventId, NSObject<FlutterStreamHandler>*handler) {
        [[FlutterEventChannel eventChannelWithName:[NSString stringWithFormat:@"%@%@", @"flutter_document_reader_api/event/", eventId] binaryMessenger:[registrar messenger]] setStreamHandler:handler];
    };
    setupEventChannel(registrar, completionEvent, [RGLWCompletionStreamHandler new]);
    setupEventChannel(registrar, databaseProgressEvent, [RGLWDatabaseProgressStreamHandler new]);
    setupEventChannel(registrar, rfidOnProgressEvent, [RGLWRfidOnProgressEventStreamHandler new]);
    setupEventChannel(registrar, rfidOnChipDetectedEvent, [RGLWRfidOnChipDetectedEventStreamHandler new]);
    setupEventChannel(registrar, rfidOnRetryReadChipEvent, [RGLWRfidOnRetryReadChipEventStreamHandler new]);
    setupEventChannel(registrar, paCertificateCompletionEvent, [RGLWPACertificateCompletionStreamHandler new]);
    setupEventChannel(registrar, taCertificateCompletionEvent, [RGLWTACertificateCompletionStreamHandler new]);
    setupEventChannel(registrar, taSignatureCompletionEvent, [RGLWTASignatureCompletionStreamHandler new]);
    setupEventChannel(registrar, videoEncoderCompletionEvent, [RGLWVideoEncoderCompletionStreamHandler new]);
    setupEventChannel(registrar, onCustomButtonTappedEvent, [RGLWOnCustomButtonTappedStreamHandler new]);

    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_document_reader_api/method" binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:[FlutterDocumentReaderApiPlugin new] channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    RGLWEventSender sendEvent = ^(NSString* event, id data) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (eventSinks[event] != nil) eventSinks[event]([RGLWJSONConstructor toSendable:data]);
        });
    };
    
    [RGLWMain methodCall:call.method
                        :call.arguments
                        :^(id data) { result([RGLWJSONConstructor toSendable:data]); }
                        :sendEvent];
}

@end


@implementation RGLWCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[completionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[completionEvent] = nil;
    return nil;
}
@end

@implementation RGLWDatabaseProgressStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[databaseProgressEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[databaseProgressEvent] = nil;
    return nil;
}

@end

@implementation RGLWRfidOnProgressEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[rfidOnProgressEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[rfidOnProgressEvent] = nil;
    return nil;
}
@end

@implementation RGLWRfidOnChipDetectedEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[rfidOnChipDetectedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[rfidOnChipDetectedEvent] = nil;
    return nil;
}
@end

@implementation RGLWRfidOnRetryReadChipEventStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[rfidOnRetryReadChipEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[rfidOnRetryReadChipEvent] = nil;
    return nil;
}
@end

@implementation RGLWPACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[paCertificateCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[paCertificateCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWTACertificateCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[taCertificateCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[taCertificateCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWTASignatureCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[taSignatureCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[taSignatureCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWVideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[videoEncoderCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[videoEncoderCompletionEvent] = nil;
    return nil;
}
@end

@implementation RGLWOnCustomButtonTappedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[onCustomButtonTappedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[onCustomButtonTappedEvent] = nil;
    return nil;
}
@end
