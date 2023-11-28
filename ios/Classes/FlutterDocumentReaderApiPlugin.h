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
typedef void (^RGLWEventSender)(FlutterEventSink _Nullable event, id _Nullable data);

typedef NS_ENUM(NSInteger, RGLWRfidReaderRequest) {
    RGLWRfidReaderRequestNull = 0,
    RGLWRfidReaderRequestNoPa = 1,
    RGLWRfidReaderRequestFull = 2,
};

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin,
                                                        RGLRecordScanningProcessDelegate,
                                                        RGLDocReaderRFIDDelegate,
                                                        RGLCustomizationActionDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property (class) NSNumber* _Nullable databasePercentageDownloaded;
@property RGLWRfidReaderRequest rfidDelegateType;

@end


typedef void (^RGLWProgressSender)(NSString* _Nonnull progress);
@interface RGLWDatabaseProgressStreamHandler : NSObject <FlutterStreamHandler>
@end
typedef void (^RGLWCompletion)(NSDictionary* _Nonnull completion);
@interface RGLWCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

typedef void (^RGLWRfidOnProgressCompletion)(NSDictionary* _Nonnull notification);
@interface RGLWRfidOnProgressEventStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWRfidOnChipDetectedEventStreamHandler : NSObject <FlutterStreamHandler>
@end
typedef void (^RGLWRfidOnRetryReadChipCompletion)(NSDictionary* _Nonnull error);
@interface RGLWRfidOnRetryReadChipEventStreamHandler : NSObject <FlutterStreamHandler>
@end

typedef void (^RGLWPACertificateCompletion)(NSData* _Nullable serialNumber, RGLPAResourcesIssuer* _Nullable issuer);
@interface RGLWPACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
typedef void (^RGLWTACertificateCompletion)(NSString* _Nullable keyCAR);
@interface RGLWTACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
typedef void (^RGLWTASignatureCompletion)(RGLTAChallenge* _Nullable challenge);
typedef void (^RGLWRFIDSignatureCallback)(NSData * _Nonnull signature);
@interface RGLWTASignatureCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWBleOnServiceConnectedStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWBleOnServiceDisconnectedStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWBleOnDeviceReadyStreamHandler : NSObject <FlutterStreamHandler>
@end

typedef void (^RGLWVideoEncoderCompletion)(NSURL* _Nonnull fileURL);
@interface RGLWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
typedef void (^RGLWCustomButtonTappedCompletion)(NSInteger tag);
@interface RGLWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end

