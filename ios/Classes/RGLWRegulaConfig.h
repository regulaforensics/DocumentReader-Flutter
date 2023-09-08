#ifndef RGLWRegulaConfig_h
#define RGLWRegulaConfig_h
#import <DocumentReader/DocumentReader.h>
#import "RGLWJSONConstructor.h"
@import CoreGraphics;
@import UIKit;
@import AVFoundation;

@interface RGLWRegulaConfig : NSObject

+(void)setConfig:(NSDictionary*) options : (RGLDocReader*) reader;
+(NSMutableDictionary *)getConfig:(RGLDocReader*) reader;
+(void)setRfidScenario:(NSDictionary*) options : (RGLRFIDScenario*) rfidScenario;
+(void)setCustomization:(NSDictionary*) options : (RGLCustomization*) customization;
+(void)setFunctionality:(NSDictionary*) options : (RGLFunctionality*) functionality;
+(void)setProcessParams:(NSDictionary*) options : (RGLProcessParams*) processParams;
+(UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
+(unsigned int)intFromHexString:(NSString *)hexStr;
+(RGLePassportDataGroup*)RGLePassportDataGroupFromJson:(NSDictionary *) dict;
+(RGLeIDDataGroup*)RGLeIDDataGroupFromJson:(NSDictionary*) dict;
+(RGLeDLDataGroup*)RGLeDLDataGroupFromJson:(NSDictionary*) dict;
+(RGLImageQA*)ImageQAFromJson:(NSDictionary*) dict;
+(NSDictionary*)ImageQAToJson:(RGLImageQA*) input;
+(RGLOnlineProcessingConfig*)RGLOnlineProcessingConfigFromJSON:(NSDictionary*) dict;
@end
#endif
