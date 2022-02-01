#ifndef RGLWJSONConstructor_h
#define RGLWJSONConstructor_h

#import <DocumentReader/DocumentReader.h>
@import CoreGraphics;
@import UIKit;

@interface RGLWJSONConstructor : NSObject
+(NSString* _Nonnull)dictToString:(NSMutableDictionary* _Nonnull)input;
+(NSMutableDictionary* _Nonnull)generateRfidNotificationCompletion:(NSInteger)notification;
+(NSMutableDictionary* _Nonnull)generateRfidNotificationCompletionWithError:(NSInteger)notification : (NSInteger)value;
+(NSMutableDictionary* _Nonnull)generateNSDictionary:(NSDictionary<NSNumber*, NSNumber*>* _Nullable)input;
+(RGLPKDCertificate* _Nullable)RGLPKDCertificateFromJson:(NSDictionary* _Nullable) dict;
+(NSInteger)generateDocReaderAction:(RGLDocReaderAction)action;
+(NSInteger)generateRFIDCompleteAction:(RGLRFIDCompleteAction)action;
+(NSInteger)generateRFIDNotificationAction:(RGLRFIDNotificationAction)action;
+(NSMutableDictionary* _Nullable)generateCompletion:(NSInteger)action :(RGLDocumentReaderResults*_Nullable)results :(NSError*_Nullable)error :(RGLRFIDNotify*_Nullable)notify;
+(NSMutableDictionary* _Nonnull)generateVideoEncoderCompletion:(NSURL* _Nullable)input :(NSError* _Nullable)error;
+(NSString*_Nonnull)generateNSData:(NSData *_Nullable)input;
+(NSMutableDictionary* _Nonnull)generatePACertificateCompletion:(NSData *_Nullable)serialNumber :(RGLPAResourcesIssuer *_Nullable)issuer;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderResults:(RGLDocumentReaderResults* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLPosition:(RGLPosition* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderBarcodeResult:(RGLDocumentReaderBarcodeResult* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderBarcodeField:(RGLDocumentReaderBarcodeField* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLPDF417Info:(RGLPDF417Info* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderAuthenticityResult:(RGLDocumentReaderAuthenticityResult* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLAuthenticityCheck:(RGLAuthenticityCheck* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLAuthenticityElement:(RGLAuthenticityElement* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLImageQualityGroup:(RGLImageQualityGroup* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLImageQuality:(RGLImageQuality* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderGraphicField:(RGLDocumentReaderGraphicField* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderTextResult:(RGLDocumentReaderTextResult* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderTextField:(RGLDocumentReaderTextField* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderValue:(RGLDocumentReaderValue* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderDocumentType:(RGLDocumentReaderDocumentType* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLScenario:(RGLScenario* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLRFIDSessionData:(RGLRFIDSessionData* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLCardProperties:(RGLCardProperties* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLRFIDSessionDataStatus:(RGLRFIDSessionDataStatus* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLAccessControlProcedureType:(RGLAccessControlProcedureType* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLApplication:(RGLApplication* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLFile:(RGLFile* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLFileData:(RGLFileData* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLSecurityObjectCertificates:(RGLSecurityObjectCertificates* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLCertificateData:(RGLCertificateData* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLSecurityObject:(RGLSecurityObject* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLSignerInfo:(RGLSignerInfo* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLAuthority:(RGLAuthority* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLRFIDValue:(RGLRFIDValue* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLAttribute:(RGLAttribute* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLExtension:(RGLExtension* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLCertificateChain:(RGLCertificateChain* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLValidity:(RGLValidity* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateNSError:(NSError* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLPAResourcesIssuer:(RGLPAResourcesIssuer* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLPAAttribute:(RGLPAAttribute* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLTAChallenge:(RGLTAChallenge* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderResultsStatus:(RGLDocumentReaderResultsStatus* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLOpticalStatus:(RGLOpticalStatus* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLVDSNCData:(RGLVDSNCData* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLBytesData:(RGLBytesData* _Nullable)input;
+(NSMutableDictionary* _Nonnull)generateRGLRFIDNotify:(RGLRFIDNotify* _Nullable)input;

@end
#endif