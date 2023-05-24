#import <Flutter/Flutter.h>
#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"
#import "RGLWRegulaConfig.h"

typedef void (^RGLWCallback)(NSString* _Nullable response);

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin,
                                                        RGLRecordScanningProcessDelegate,
                                                        RGLDocReaderRFIDDelegate,
                                                        RGLCustomizationActionDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property (class) NSNumber* _Nullable databasePercentageDownloaded;

@end

typedef void (^RGLWRFIDSignatureCallback)(NSData * _Nonnull signature);

@interface RGLWRFIDDelegateNoPA : NSObject<RGLDocReaderRFIDDelegate>
@end


@interface RGLWCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWDatabaseProgressStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWRFIDNotificationCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWBleOnServiceConnectedStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWBleOnServiceDisconnectedStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWBleOnDeviceReadyStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWPACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWTACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWTASignatureCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RGLWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end
