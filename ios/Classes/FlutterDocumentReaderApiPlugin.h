//
//  FlutterDocumentReaderApiPlugin.h
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Flutter/Flutter.h>
#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"
#import "RGLWConfig.h"

typedef void (^RGLWCallback)(id _Nullable response);
typedef void (^RGLWEventSender)(NSString* _Nonnull event, id _Nullable data);
typedef void (^RGLWRFIDSignatureCallback)(NSData * _Nonnull signature);

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin,
                                                        RGLRecordScanningProcessDelegate,
                                                        RGLDocReaderRFIDDelegate,
                                                        RGLCustomizationActionDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property (class) NSNumber* _Nullable databasePercentageDownloaded;
@property NSNumber* _Nonnull doRequestPACertificates;
@property NSNumber* _Nonnull doRequestTACertificates;
@property NSNumber* _Nonnull doRequestTASignature;

@end


NSString* _Nonnull RGLWCompletionEvent;
NSString* _Nonnull RGLWDatabaseProgressEvent;
NSString* _Nonnull RGLWRfidOnProgressEvent;
NSString* _Nonnull RGLWRfidOnChipDetectedEvent;
NSString* _Nonnull RGLWRfidOnRetryReadChipEvent;
NSString* _Nonnull RGLWPaCertificateCompletionEvent;
NSString* _Nonnull RGLWTaCertificateCompletionEvent;
NSString* _Nonnull RGLWTaSignatureCompletionEvent;
NSString* _Nonnull RGLWBleOnServiceConnectedEvent;
NSString* _Nonnull RGLWBleOnServiceDisconnectedEvent;
NSString* _Nonnull RGLWBleOnDeviceReadyEvent;
NSString* _Nonnull RGLWVideoEncoderCompletionEvent;
NSString* _Nonnull RGLWOnCustomButtonTappedEvent;

@interface RGLWCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWDatabaseProgressStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWRfidOnProgressEventStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWRfidOnChipDetectedEventStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWRfidOnRetryReadChipEventStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWPACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWTACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWTASignatureCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWBleOnServiceConnectedStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWBleOnServiceDisconnectedStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWBleOnDeviceReadyStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end

