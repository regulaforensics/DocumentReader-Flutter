#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"
#import "RGLWConfig.h"

typedef void (^RGLWCallback)(id _Nullable response);
typedef void (^RGLWEventSender)(NSString* _Nonnull event, id _Nullable data);
typedef void (^RGLWRFIDSignatureCallback)(NSData * _Nonnull signature);
extern UIViewController*_Nonnull(^ _Nonnull RGLWRootViewController)(void);

@interface RGLWMain: NSObject<RGLRecordScanningProcessDelegate,
                              RGLDocReaderRFIDDelegate,
                              RGLCustomizationActionDelegate,
                              RGLDocReaderDatabaseFetchDelegate,
                              RGLBluetoothDelegate>

+(void)methodCall:(NSString* _Nonnull)method
                 :(NSArray* _Nonnull)args
                 :(RGLWCallback _Nonnull)callback
                 :(RGLWEventSender _Nonnull)eventSender;

@property NSNumber* _Nonnull doRequestPACertificates;
@property NSNumber* _Nonnull doRequestTACertificates;
@property NSNumber* _Nonnull doRequestTASignature;

@end

static NSString* _Nonnull completionEvent = @"completion";
static NSString* _Nonnull databaseProgressEvent = @"database_progress";
static NSString* _Nonnull rfidOnProgressEvent = @"rfidOnProgressCompletion";
static NSString* _Nonnull rfidOnChipDetectedEvent = @"rfidOnChipDetectedEvent";
static NSString* _Nonnull rfidOnRetryReadChipEvent = @"rfidOnRetryReadChipEvent";
static NSString* _Nonnull paCertificateCompletionEvent = @"pa_certificate_completion";
static NSString* _Nonnull taCertificateCompletionEvent = @"ta_certificate_completion";
static NSString* _Nonnull taSignatureCompletionEvent = @"ta_signature_completion";
static NSString* _Nonnull videoEncoderCompletionEvent = @"video_encoder_completion";
static NSString* _Nonnull onCustomButtonTappedEvent = @"onCustomButtonTappedEvent";
