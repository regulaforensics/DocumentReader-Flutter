#ifndef RGLWConfig_h
#define RGLWConfig_h

#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"

@import CoreGraphics;
@import UIKit;
@import AVFoundation;

@interface RGLWConfig : NSObject

+(void)setFunctionality:(NSDictionary*)options :(RGLFunctionality*)functionality;
+(void)setProcessParams:(NSDictionary*)options :(RGLProcessParams*)processParams;
+(void)setCustomization:(NSDictionary*)options :(RGLCustomization*)customization;
+(void)setRfidScenario:(NSDictionary*)options :(RGLRFIDScenario*)rfidScenario;
+(void)setDataGroups:(RGLDataGroup*)dataGroup dict:(NSDictionary*)dict;
+(void)setDTCDataGroup:(RGLDTCDataGroup*)dataGroup dict:(NSDictionary*)dict;
+(void)setImageQA:(RGLImageQA*)result input:(NSDictionary*)input;
+(void)setAuthenticityParams:(RGLAuthenticityParams*)result input:(NSDictionary*)input;
+(void)setLivenessParams:(RGLLivenessParams*)result input:(NSDictionary*)input;

+(NSDictionary*)getFunctionality:(RGLFunctionality*)functionality;
+(NSDictionary*)getProcessParams:(RGLProcessParams*)processParams;
+(NSDictionary*)getCustomization:(RGLCustomization*)customization;
+(NSDictionary*)getRfidScenario:(RGLRFIDScenario*)rfidScenario;
+(NSDictionary*)getDataGroups:(RGLDataGroup*)dataGroup;
+(NSDictionary*)getDTCDataGroup:(RGLDTCDataGroup*)dataGroup;
+(NSDictionary*)getImageQA:(RGLImageQA*)input;
+(NSDictionary*)getAuthenticityParams:(RGLAuthenticityParams*)input;
+(NSDictionary*)getLivenessParams:(RGLLivenessParams*)input;

+(RGLImageQualityCheckType)imageQualityCheckTypeWithNumber:(NSNumber*)value;
+(NSNumber*)generateDocReaderAction:(RGLDocReaderAction)action;
+(NSNumber*)generateRFIDCompleteAction:(RGLRFIDCompleteAction)action;
+(NSNumber*)generateImageQualityCheckType:(RGLImageQualityCheckType)value;

+(RGLDocReaderFrame)docReaderFrameWithString:(NSString*)value;
+(NSString*)generateDocReaderFrame:(RGLDocReaderFrame)value;

@end
#endif
