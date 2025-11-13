#ifndef RGLWJSONConstructor_h
#define RGLWJSONConstructor_h

#import <DocumentReader/DocumentReader.h>
#import "RGLWConfig.h"

@import CoreGraphics;
@import UIKit;

@interface RGLWJSONConstructor : NSObject

+(NSString* _Nullable)toSendable:(id _Nullable)input;
+(NSString* _Nullable)dictToString:(NSDictionary* _Nullable)input;
+(NSString* _Nullable)arrayToString:(NSArray* _Nullable)input;
+(NSString* _Nullable)base64WithImage:(UIImage* _Nullable)input;
+(UIImage* _Nullable)imageWithBase64:(NSString* _Nullable)input;
+(NSData* _Nullable)base64Decode:(NSString* _Nullable)input;

+(NSString* _Nonnull)generateSuccessCompletion:(BOOL)success :(NSError* _Nullable)error;
+(NSString* _Nullable)generateCompletion:(NSNumber*_Nonnull)action :(RGLDocumentReaderResults*_Nullable)results :(NSError*_Nullable)error;
+(NSString* _Nonnull)generatePACertificateCompletion:(NSData *_Nullable)serialNumber :(RGLPAResourcesIssuer *_Nullable)issuer;
+(NSString* _Nullable)generateFinalizePackageCompletion:(NSNumber*_Nonnull)action :(RGLTransactionInfo*_Nullable)info :(NSError*_Nullable)error;

+(RGLConfig* _Nullable)configFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateConfig:(RGLConfig* _Nullable)input;
+(RGLBleConfig* _Nullable)bleDeviceConfigFromJson:(NSDictionary* _Nullable)input :(RGLBluetooth* _Nonnull)bluetooth;
+(RGLOnlineProcessingConfig* _Nullable)onlineProcessingConfigFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateOnlineProcessingConfig:(RGLOnlineProcessingConfig* _Nullable)input;
+(RGLImageInput* _Nullable)imageInputFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateImageInput:(RGLImageInput* _Nullable)input;
+(RGLRecognizeConfig* _Nullable)recognizeConfigFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRecognizeConfig:(RGLRecognizeConfig* _Nullable)input;
+(RGLScannerConfig* _Nullable)scannerConfigFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateScannerConfig:(RGLScannerConfig* _Nullable)input;
+(RGLFaceAPISearchParams* _Nullable)faceAPISearchParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateFaceAPISearchParams:(RGLFaceAPISearchParams* _Nullable)input;
+(RGLFaceAPIParams* _Nullable)faceAPIParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateFaceAPIParams:(RGLFaceAPIParams* _Nullable)input;
+(RGLAuthenticityParams* _Nullable)authenticityParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAuthenticityParams:(RGLAuthenticityParams* _Nullable)input;
+(RGLLivenessParams* _Nullable)livenessParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateLivenessParams:(RGLLivenessParams* _Nullable)input;
+(RGLGlaresCheckParams* _Nullable)glaresCheckParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateGlaresCheckParams:(RGLGlaresCheckParams* _Nullable)input;
+(RGLImageQA* _Nullable)imageQAFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateImageQA:(RGLImageQA* _Nullable)input;
+(RGLRFIDParams* _Nullable)rfidParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRFIDParams:(RGLRFIDParams* _Nullable)input;
+(RGLProcessParams* _Nullable)processParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateProcessParams:(RGLProcessParams* _Nullable)input;
+(RGLBackendProcessingConfig* _Nullable)backendProcessingConfigFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateBackendProcessingConfig:(RGLBackendProcessingConfig* _Nullable)input;
+(RGLeDLDataGroup* _Nullable)eDLDataGroupsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateEDLDataGroups:(RGLeDLDataGroup* _Nullable)input;
+(RGLePassportDataGroup* _Nullable)ePassportDataGroupsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateEPassportDataGroups:(RGLePassportDataGroup* _Nullable)input;
+(RGLeIDDataGroup* _Nullable)eIDDataGroupsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateEIDDataGroups:(RGLeIDDataGroup* _Nullable)input;
+(RGLeIDDataGroup* _Nullable)dtcDataGroupFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRGLDTCDataGroup:(RGLeIDDataGroup* _Nullable)input;
+(RGLRFIDScenario* _Nullable)rfidScenarioFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRFIDScenario:(RGLRFIDScenario* _Nullable)input;
+(RGLCustomization* _Nullable)customizationFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateCustomization:(RGLCustomization* _Nullable)input;
+(RGLFunctionality* _Nullable)functionalityFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateFunctionality:(RGLFunctionality* _Nullable)input;
+(RGLDocReaderDocumentsDatabase* _Nullable)docReaderDocumentsDatabaseFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocReaderDocumentsDatabase:(RGLDocReaderDocumentsDatabase* _Nullable)input;
+(NSDictionary* _Nullable)generateDocReaderVersion:(RGLDocReaderVersion* _Nullable)input;
+(RGLScenario* _Nullable)scenarioFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nonnull)generateScenario:(RGLScenario* _Nullable)input;
+(NSString* _Nullable)generateLicense:(RGLLicense* _Nullable)input;
+(NSError* _Nullable)errorFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateError:(NSError* _Nullable)input;
+(RGLAuthenticityElement* _Nullable)authenticityElementFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAuthenticityElement:(RGLAuthenticityElement* _Nullable)input;
+(RGLAuthenticityCheck* _Nullable)authenticityCheckFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAuthenticityCheck:(RGLAuthenticityCheck* _Nullable)input;
+(RGLDocumentReaderAuthenticityResult* _Nullable)documentReaderAuthenticityResultFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderAuthenticityResult:(RGLDocumentReaderAuthenticityResult* _Nullable)input;
+(RGLPDF417Info* _Nullable)pdf417InfoFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePDF417Info:(RGLPDF417Info* _Nullable)input;
+(RGLDocumentReaderBarcodeField* _Nullable)documentReaderBarcodeFieldFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderBarcodeField:(RGLDocumentReaderBarcodeField* _Nullable)input;
+(RGLDocumentReaderBarcodeResult* _Nullable)documentReaderBarcodeResultFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderBarcodeResult:(RGLDocumentReaderBarcodeResult* _Nullable)input;
+(RGLImageQuality* _Nullable)imageQualityFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateImageQuality:(RGLImageQuality* _Nullable)input;
+(RGLImageQualityGroup* _Nullable)imageQualityGroupFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateImageQualityGroup:(RGLImageQualityGroup* _Nullable)input;
+(RGLAccessControlProcedureType* _Nullable)accessControlProcedureTypeFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAccessControlProcedureType:(RGLAccessControlProcedureType* _Nullable)input;
+(RGLFileData* _Nullable)fileDataFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateFileData:(RGLFileData* _Nullable)input;
+(RGLCertificateData* _Nullable)certificateDataFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateCertificateData:(RGLCertificateData* _Nullable)input;
+(RGLSecurityObjectCertificates* _Nullable)securityObjectCertificatesFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateSecurityObjectCertificates:(RGLSecurityObjectCertificates* _Nullable)input;
+(RGLFile* _Nullable)fileFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateFile:(RGLFile* _Nullable)input;
+(RGLApplication* _Nullable)applicationFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateApplication:(RGLApplication* _Nullable)input;
+(RGLRFIDValue* _Nullable)rfidValueFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRFIDValue:(RGLRFIDValue* _Nullable)input;
+(RGLAttribute* _Nullable)attributeFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAttribute:(RGLAttribute* _Nullable)input;
+(RGLAuthority* _Nullable)authorityFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateAuthority:(RGLAuthority* _Nullable)input;
+(RGLCardProperties* _Nullable)cardPropertiesFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateCardProperties:(RGLCardProperties* _Nullable)input;
+(RGLExtension* _Nullable)extensionFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateExtension:(RGLExtension* _Nullable)input;
+(RGLValidity* _Nullable)validityFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateValidity:(RGLValidity* _Nullable)input;
+(RGLCertificateChain* _Nullable)certificateChainFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateCertificateChain:(RGLCertificateChain* _Nullable)input;
+(RGLDataField* _Nullable)dataFieldFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDataField:(RGLDataField* _Nullable)input;
+(RGLSignerInfo* _Nullable)signerInfoFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateSignerInfo:(RGLSignerInfo* _Nullable)input;
+(RGLSecurityObject* _Nullable)securityObjectFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateSecurityObject:(RGLSecurityObject* _Nullable)input;
+(RGLRFIDSessionData* _Nullable)rfidSessionDataFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRFIDSessionData:(RGLRFIDSessionData* _Nullable)input;
+(RGLBytesData* _Nullable)bytesDataFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateBytesData:(RGLBytesData* _Nullable)input;
+(RGLVDSNCData* _Nullable)vdsncDataFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateVDSNCData:(RGLVDSNCData* _Nullable)input;
+(RGLOpticalStatus* _Nullable)opticalStatusFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateOpticalStatus:(RGLOpticalStatus* _Nullable)input;
+(RGLRFIDSessionDataStatus* _Nullable)rfidSessionDataStatusFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRFIDSessionDataStatus:(RGLRFIDSessionDataStatus* _Nullable)input;
+(RGLDocumentReaderResultsStatus* _Nullable)documentReaderResultsStatusFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderResultsStatus:(RGLDocumentReaderResultsStatus* _Nullable)input;
+(RGLDocumentReaderComparison* _Nullable)documentReaderComparisonFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderComparison:(RGLDocumentReaderComparison* _Nullable)input;
+(CGRect)rectFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateRect:(CGRect)input;
+(RGLDocumentReaderGraphicField* _Nullable)documentReaderGraphicFieldFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderGraphicField:(RGLDocumentReaderGraphicField* _Nullable)input;
+(RGLDocumentReaderGraphicResult* _Nullable)documentReaderGraphicResultFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult* _Nullable)input;
+(RGLDocumentReaderRfidOrigin* _Nullable)documentReaderRfidOriginFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderRfidOrigin:(RGLDocumentReaderRfidOrigin* _Nullable)input;
+(RGLDocumentReaderSymbol* _Nullable)documentReaderSymbolFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderSymbol:(RGLDocumentReaderSymbol* _Nullable)input;
+(RGLDocumentReaderValidity* _Nullable)documentReaderValidityFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderValidity:(RGLDocumentReaderValidity* _Nullable)input;
+(RGLDocumentReaderValue* _Nullable)documentReaderValueFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderValue:(RGLDocumentReaderValue* _Nullable)input;
+(RGLDocumentReaderTextField* _Nullable)documentReaderTextFieldFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderTextField:(RGLDocumentReaderTextField* _Nullable)input;
+(RGLDocumentReaderTextSource* _Nullable)documentReaderTextSourceFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderTextSource:(RGLDocumentReaderTextSource* _Nullable)input;
+(RGLDocumentReaderTextResult* _Nullable)documentReaderTextResultFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderTextResult:(RGLDocumentReaderTextResult* _Nullable)input;
+(RGLDocumentReaderDocumentType* _Nullable)documentReaderDocumentTypeFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderDocumentType:(RGLDocumentReaderDocumentType* _Nullable)input;
+(CGPoint)pointFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePoint:(CGPoint)input;
+(RGLPosition* _Nullable)positionFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePosition:(RGLPosition* _Nullable)input;
+(RGLDocumentReaderResults* _Nullable)documentReaderResultsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateDocumentReaderResults:(RGLDocumentReaderResults* _Nullable)input;
+(NSString* _Nonnull)generateDocumentReaderNotification:(RGLRFIDNotify* _Nullable)input;
+(RGLPAAttribute* _Nullable)paAttributeFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePAAttribute:(RGLPAAttribute* _Nullable)input;
+(RGLPAResourcesIssuer* _Nullable)paResourcesIssuerFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePAResourcesIssuer:(RGLPAResourcesIssuer* _Nullable)input;
+(RGLPKDCertificate* _Nullable)pkdCertificateFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generatePKDCertificate:(RGLPKDCertificate* _Nullable)input;
+(NSDictionary* _Nullable)generateTAChallenge:(RGLTAChallenge* _Nullable)input;
+(RGLTAChallenge* _Nullable)taChallengeFromJson:(NSDictionary* _Nullable)input;
+(RGLTCCParams* _Nullable)tccParamsFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateTCCParams:(RGLTCCParams* _Nullable)input;
+(RGLTransactionInfo* _Nullable)transactionInfoFromJson:(NSDictionary* _Nullable)input;
+(NSDictionary* _Nullable)generateTransactionInfo:(RGLTransactionInfo* _Nullable)input;

@end

@interface RGLWRequestInterceptorProxy : NSObject <RGLURLRequestInterceptingDelegate>
- (instancetype _Nonnull)initWithHeaders:(NSDictionary*_Nonnull)headers;
@end

#endif
