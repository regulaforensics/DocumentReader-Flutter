#ifndef JSONConstructor_h
#define JSONConstructor_h

#import <DocumentReader/DocumentReader.h>
@import CoreGraphics;
@import UIKit;

@interface JSONConstructor : NSObject
+ (NSString* _Nullable)resultsToJsonString:(RGLDocumentReaderResults* _Nullable) results;
+ (NSMutableDictionary* _Nullable)generateImageQualityGroup:(RGLImageQualityGroup* _Nullable) imageQualityGroup;
+(NSMutableArray* _Nullable)generateImageQualityList:(NSArray<RGLImageQuality *> * _Nonnull) imageQualityList;
+(NSMutableDictionary* _Nullable)generateImageQuality:(RGLImageQuality* _Nullable) imageQuality;
+(NSMutableDictionary* _Nullable)generateDocumentReaderJsonResult:(RGLDocumentReaderJsonResult* _Nullable) documentReaderJsonResult;
+(NSMutableArray* _Nullable)generateNSArrayDocumentReaderJsonResultGroup:(NSArray<RGLDocumentReaderJsonResultGroup *> * _Nonnull) list;
+(NSMutableDictionary* _Nullable)generateDocumentReaderJsonResultGroup:(RGLDocumentReaderJsonResultGroup* _Nullable) documentReaderJsonResultGroup;
+(NSMutableDictionary* _Nullable)generateDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult* _Nullable) documentReaderGraphicResult;
+(NSMutableArray* _Nullable)generateNSArrayDocumentReaderGraphicResultGroup:(NSArray<RGLDocumentReaderGraphicField*>* _Nonnull) list;
+(NSMutableDictionary* _Nullable)generateDocumentReaderGraphicField:(RGLDocumentReaderGraphicField* _Nullable) documentReaderGraphicField;
+(NSMutableDictionary* _Nullable)generateCGRect:(CGRect) cgRect;
+(NSMutableDictionary* _Nullable)generateDocumentReaderTextResult:(RGLDocumentReaderTextResult* _Nullable) documentReaderTextResult;
+(NSMutableArray* _Nullable)generateNSArrayDocumentReaderTextField:(NSArray<RGLDocumentReaderTextField*>* _Nonnull) list;
+(NSMutableDictionary* _Nullable)generateDocumentReaderTextField:(RGLDocumentReaderTextField* _Nullable) documentReaderTextField;
+(NSMutableArray* _Nullable)generateNSArrayDocumentReaderValue:(NSArray<RGLDocumentReaderValue*>* _Nonnull) list;
+(NSMutableDictionary* _Nullable)generateDocumentReaderValue:(RGLDocumentReaderValue* _Nullable) documentReaderValue;
+(NSMutableDictionary* _Nullable)generateDocumentReaderDocumentType:(RGLDocumentReaderDocumentType* _Nullable) documentReaderDocumentType;
+(NSMutableArray* _Nonnull )generateNSArrayNSNumber:(NSArray<NSNumber*>* _Nonnull) list;
+(NSString* _Nullable)generateScenario:(RGLScenario* _Nullable) scenario;
+(RGLPKDCertificate* _Nullable)RGLPKDCertificateFromJson:(NSDictionary* _Nullable) dict;
+(NSInteger)generateDocReaderAction:(RGLDocReaderAction)action;
+(NSInteger)generateRFIDCompleteAction:(RGLRFIDCompleteAction)action;
+(NSInteger)generateRFIDNotificationAction:(RGLRFIDNotificationAction)action;
+(NSString*_Nullable)generateCompletion:(NSInteger)action :(RGLDocumentReaderResults*_Nullable)results :(NSError*_Nullable)error :(RGLRFIDNotify*_Nullable)notify;

@end
#endif
