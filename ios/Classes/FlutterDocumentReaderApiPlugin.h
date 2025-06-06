#import <Flutter/Flutter.h>
#import "RGLWMain.h"

@interface FlutterDocumentReaderApiPlugin : NSObject<FlutterPlugin>
@end

static NSMutableDictionary<NSString*, FlutterEventSink>* _Nonnull eventSinks;

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
@interface RGLWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RGLWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end
