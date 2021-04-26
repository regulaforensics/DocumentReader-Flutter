#import <Flutter/Flutter.h>
#import <DocumentReader/DocumentReader.h>
#import "JSONConstructor.h"
#import "RegulaConfig.h"

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin, RGLRecordScanningProcessDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property (class) NSNumber* _Nullable databasePercentageDownloaded;

@end

@interface CompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface VideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface DatabaseProgressStreamHandler : NSObject <FlutterStreamHandler>
@end
