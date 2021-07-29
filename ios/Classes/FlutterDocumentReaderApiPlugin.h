#import <Flutter/Flutter.h>
#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"
#import "RegulaConfig.h"

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin, RGLRecordScanningProcessDelegate, RGLDocReaderRFIDDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property (class) NSNumber* _Nullable databasePercentageDownloaded;

@end

@interface CompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface VideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface DatabaseProgressStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RFIDNotificationCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface PACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface TACertificateCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface TASignatureCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RFIDDelegateNoPA : NSObject<RGLDocReaderRFIDDelegate>
@end
