#ifndef RegulaConfig_h
#define RegulaConfig_h
#import <DocumentReader/DocumentReader.h>
@import CoreGraphics;
@import UIKit;
@import AVFoundation;

@interface RegulaConfig : NSObject

+(void)setConfig:(NSDictionary*) options : (RGLDocReader*) reader;
+(NSMutableDictionary *)getConfig:(RGLDocReader*) reader;
+(void)setRfidScenario:(NSDictionary*) options : (RGLRFIDScenario*) rfidScenario;
+(void)setCustomization:(NSDictionary*) options : (RGLCustomization*) customization;
+(void)setFunctionality:(NSDictionary*) options : (RGLFunctionality*) functionality;
+(void)setProcessParams:(NSDictionary*) options : (RGLProcessParams*) processParams;
+(UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
+(unsigned int)intFromHexString:(NSString *)hexStr;
+(UIImage*)imageFromBase64:(NSString *)base64image;
+(RGLePassportDataGroup*)RGLePassportDataGroupFromJson:(NSDictionary *) dict;
+(RGLeIDDataGroup*)RGLeIDDataGroupFromJson:(NSDictionary*) dict;
+(RGLeDLDataGroup*)RGLeDLDataGroupFromJson:(NSDictionary*) dict;
@end
#endif
