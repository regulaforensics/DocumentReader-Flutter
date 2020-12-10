#import <Foundation/Foundation.h>
#import "RegulaConfig.h"

@implementation RegulaConfig
+(void)setConfig:(NSDictionary*)options :(RGLDocReader*)reader {
    if([options valueForKey:@"customization"] != nil)
        [self setCustomization: [options valueForKey:@"customization"]: reader.customization];
    if([options valueForKey:@"functionality"] != nil)
        [self setFunctionality: [options valueForKey:@"functionality"]: reader.functionality];
    if([options valueForKey:@"processParams"] != nil)
        [self setProcessParams: [options valueForKey:@"processParams"]: reader.processParams];
}

+(NSMutableDictionary *)getConfig:(RGLDocReader*)reader{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    result[@"customization"] = [self getCustomization: reader.customization];
    result[@"functionality"] = [self getFunctionality: reader.functionality];
    result[@"processParams"] = [self getProcessParams: reader.processParams];

    return result;
}

+(AVCaptureSessionPreset)AVCaptureSessionPresetWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return AVCaptureSessionPresetLow;
        case 1:
            return AVCaptureSessionPresetMedium;
        case 2:
            return AVCaptureSessionPresetHigh;
        case 3:
            return AVCaptureSessionPresetPhoto;
        case 4:
            return AVCaptureSessionPresetInputPriority;
        case 6:
            return AVCaptureSessionPreset1280x720;
        case 7:
            return AVCaptureSessionPreset1920x1080;
        case 8:
            return AVCaptureSessionPreset3840x2160;
        case 9:
            return AVCaptureSessionPresetiFrame960x540;
        case 10:
            return AVCaptureSessionPresetiFrame1280x720;
        case 12:
            return AVCaptureSessionPreset640x480;
        case 13:
            return AVCaptureSessionPreset352x288;
        default:
            return AVCaptureSessionPresetLow;
    }
}

+(NSInteger)NSIntegerWithAVCaptureSessionPreset:(AVCaptureSessionPreset)value {
    if(value == AVCaptureSessionPresetLow)
        return (NSInteger)0;
    else if(value == AVCaptureSessionPresetMedium)
        return (NSInteger)1;
    else if(value == AVCaptureSessionPresetHigh)
        return (NSInteger)2;
    else if(value == AVCaptureSessionPresetPhoto)
        return (NSInteger)3;
    else if(value == AVCaptureSessionPresetInputPriority)
        return (NSInteger)4;
    else if(value == AVCaptureSessionPreset1280x720)
        return (NSInteger)6;
    else if(value == AVCaptureSessionPreset1920x1080)
        return (NSInteger)7;
    else if(value == AVCaptureSessionPreset3840x2160)
        return (NSInteger)8;
    else if(value == AVCaptureSessionPresetiFrame960x540)
        return (NSInteger)9;
    else if(value == AVCaptureSessionPresetiFrame1280x720)
        return (NSInteger)10;
    else if(value == AVCaptureSessionPreset640x480)
        return (NSInteger)12;
    else if(value == AVCaptureSessionPreset352x288)
        return (NSInteger)13;
    else
        return (NSInteger)0;
}

+(UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha {
    unsigned int hexInt = [self intFromHexString:hexStr];
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexInt & 0xFF))/255
                    alpha:alpha];

    return color;
}

+ (NSString *)hexStringFromUIColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);

    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];

    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

+ (unsigned int)intFromHexString:(NSString *)hexStr {
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];

    return hexInt;
}

+(UIImage*)imageFromBase64:(NSString *)base64image {
    NSMutableString *base64 = [NSMutableString stringWithString: base64image];
    if(![[base64image substringToIndex:10] isEqualToString:@"data:image"])
        base64 = [NSMutableString stringWithFormat: @"%@%@", @"data:image/jpeg;base64,", base64image];
    NSURL *url = [NSURL URLWithString:base64];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}

+(CGLineCap)CGLineCapWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return kCGLineCapButt;
        case 1:
            return kCGLineCapRound;
        case 2:
            return kCGLineCapSquare;
        default:
            return kCGLineCapButt;
    }
}

+(NSInteger)NSIntegerWithCGLineCap:(CGLineCap)value {
    switch(value){
        case kCGLineCapButt:
            return (NSInteger)0;
        case kCGLineCapRound:
            return (NSInteger)1;
        case kCGLineCapSquare:
            return (NSInteger)2;
        default:
            return (NSInteger)0;
    }
}

+(UIInterfaceOrientationMask)UIInterfaceOrientationMaskWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return UIInterfaceOrientationMaskPortrait;
        case 1:
            return UIInterfaceOrientationMaskLandscapeLeft;
        case 2:
            return UIInterfaceOrientationMaskLandscapeRight;
        case 3:
            return UIInterfaceOrientationMaskPortraitUpsideDown;
        case 4:
            return UIInterfaceOrientationMaskLandscape;
        case 5:
            return UIInterfaceOrientationMaskAll;
        case 6:
            return UIInterfaceOrientationMaskAllButUpsideDown;
        default:
            return UIInterfaceOrientationMaskPortrait;
    }
}

+(NSInteger)NSIntegerWithUIInterfaceOrientationMask:(UIInterfaceOrientationMask)value {
    switch(value){
        case UIInterfaceOrientationMaskPortrait:
            return (NSInteger)0;
        case UIInterfaceOrientationMaskLandscapeLeft:
            return (NSInteger)1;
        case UIInterfaceOrientationMaskLandscapeRight:
            return (NSInteger)2;
        case UIInterfaceOrientationMaskPortraitUpsideDown:
            return (NSInteger)3;
        case UIInterfaceOrientationMaskLandscape:
            return (NSInteger)4;
        case UIInterfaceOrientationMaskAll:
            return (NSInteger)5;
        case UIInterfaceOrientationMaskAllButUpsideDown:
            return (NSInteger)6;
        default:
            return (NSInteger)0;
    }
}

+(AVCaptureDevicePosition)AVCaptureDevicePositionWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return AVCaptureDevicePositionFront;
        case 1:
            return AVCaptureDevicePositionBack;
        case 2:
            return AVCaptureDevicePositionUnspecified;
        default:
            return AVCaptureDevicePositionFront;
    }
}

+(NSInteger)NSIntegerWithAVCaptureDevicePosition:(AVCaptureDevicePosition)value {
    switch(value){
        case AVCaptureDevicePositionFront:
            return (NSInteger)0;
        case AVCaptureDevicePositionBack:
            return (NSInteger)1;
        case AVCaptureDevicePositionUnspecified:
            return (NSInteger)2;
        default:
            return (NSInteger)0;
    }
}

+(UIViewContentMode)UIViewContentModeWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return UIViewContentModeScaleToFill;
        case 1:
            return UIViewContentModeScaleAspectFit;
        case 2:
            return UIViewContentModeScaleAspectFill;
        case 3:
            return UIViewContentModeRedraw;
        case 4:
            return UIViewContentModeCenter;
        case 5:
            return UIViewContentModeTop;
        case 6:
            return UIViewContentModeBottom;
        case 7:
            return UIViewContentModeLeft;
        case 8:
            return UIViewContentModeRight;
        case 9:
            return UIViewContentModeTopLeft;
        case 10:
            return UIViewContentModeTopRight;
        case 11:
            return UIViewContentModeBottomLeft;
        case 12:
            return UIViewContentModeBottomRight;
        default:
            return UIViewContentModeScaleToFill;
    }
}

+(NSInteger)NSIntegerWithUIViewContentMode:(UIViewContentMode)value {
    switch(value){
        case UIViewContentModeScaleToFill:
            return (NSInteger)0;
        case UIViewContentModeScaleAspectFit:
            return (NSInteger)1;
        case UIViewContentModeScaleAspectFill:
            return (NSInteger)2;
        case UIViewContentModeRedraw:
            return (NSInteger)3;
        case UIViewContentModeCenter:
            return (NSInteger)4;
        case UIViewContentModeTop:
            return (NSInteger)5;
        case UIViewContentModeBottom:
            return (NSInteger)6;
        case UIViewContentModeLeft:
            return (NSInteger)7;
        case UIViewContentModeRight:
            return (NSInteger)8;
        case UIViewContentModeTopLeft:
            return (NSInteger)9;
        case UIViewContentModeTopRight:
            return (NSInteger)10;
        case UIViewContentModeBottomLeft:
            return (NSInteger)11;
        case UIViewContentModeBottomRight:
            return (NSInteger)12;
        default:
            return (NSInteger)0;
    }
}

+(RGLePassportDataGroup*)RGLePassportDataGroupFromJson:(NSDictionary*)dict {
    RGLePassportDataGroup *group = [[RGLePassportDataGroup alloc] init];

    if([dict valueForKey:@"DG1"] != nil)
        group.dG1 = [[dict valueForKey:@"DG1"] boolValue];
    if([dict valueForKey:@"DG2"] != nil)
        group.dG2 = [[dict valueForKey:@"DG2"] boolValue];
    if([dict valueForKey:@"DG3"] != nil)
        group.dG3 = [[dict valueForKey:@"DG3"] boolValue];
    if([dict valueForKey:@"DG4"] != nil)
        group.dG4 = [[dict valueForKey:@"DG4"] boolValue];
    if([dict valueForKey:@"DG5"] != nil)
        group.dG5 = [[dict valueForKey:@"DG5"] boolValue];
    if([dict valueForKey:@"DG6"] != nil)
        group.dG6 = [[dict valueForKey:@"DG6"] boolValue];
    if([dict valueForKey:@"DG7"] != nil)
        group.dG7 = [[dict valueForKey:@"DG7"] boolValue];
    if([dict valueForKey:@"DG8"] != nil)
        group.dG8 = [[dict valueForKey:@"DG8"] boolValue];
    if([dict valueForKey:@"DG9"] != nil)
        group.dG9 = [[dict valueForKey:@"DG9"] boolValue];
    if([dict valueForKey:@"DG10"] != nil)
        group.dG10 = [[dict valueForKey:@"DG10"] boolValue];
    if([dict valueForKey:@"DG11"] != nil)
        group.dG11 = [[dict valueForKey:@"DG11"] boolValue];
    if([dict valueForKey:@"DG12"] != nil)
        group.dG12 = [[dict valueForKey:@"DG12"] boolValue];
    if([dict valueForKey:@"DG13"] != nil)
        group.dG13 = [[dict valueForKey:@"DG13"] boolValue];
    if([dict valueForKey:@"DG14"] != nil)
        group.dG14 = [[dict valueForKey:@"DG14"] boolValue];
    if([dict valueForKey:@"DG15"] != nil)
        group.dG15 = [[dict valueForKey:@"DG15"] boolValue];
    if([dict valueForKey:@"DG16"] != nil)
        group.dG16 = [[dict valueForKey:@"DG16"] boolValue];

    return group;
}

+(RGLeIDDataGroup*)RGLeIDDataGroupFromJson:(NSDictionary*)dict {
    RGLeIDDataGroup *group = [[RGLeIDDataGroup alloc] init];

    if([dict valueForKey:@"DG1"] != nil)
        group.dG1 = [[dict valueForKey:@"DG1"] boolValue];
    if([dict valueForKey:@"DG2"] != nil)
        group.dG2 = [[dict valueForKey:@"DG2"] boolValue];
    if([dict valueForKey:@"DG3"] != nil)
        group.dG3 = [[dict valueForKey:@"DG3"] boolValue];
    if([dict valueForKey:@"DG4"] != nil)
        group.dG4 = [[dict valueForKey:@"DG4"] boolValue];
    if([dict valueForKey:@"DG5"] != nil)
        group.dG5 = [[dict valueForKey:@"DG5"] boolValue];
    if([dict valueForKey:@"DG6"] != nil)
        group.dG6 = [[dict valueForKey:@"DG6"] boolValue];
    if([dict valueForKey:@"DG7"] != nil)
        group.dG7 = [[dict valueForKey:@"DG7"] boolValue];
    if([dict valueForKey:@"DG8"] != nil)
        group.dG8 = [[dict valueForKey:@"DG8"] boolValue];
    if([dict valueForKey:@"DG9"] != nil)
        group.dG9 = [[dict valueForKey:@"DG9"] boolValue];
    if([dict valueForKey:@"DG10"] != nil)
        group.dG10 = [[dict valueForKey:@"DG10"] boolValue];
    if([dict valueForKey:@"DG11"] != nil)
        group.dG11 = [[dict valueForKey:@"DG11"] boolValue];
    if([dict valueForKey:@"DG12"] != nil)
        group.dG12 = [[dict valueForKey:@"DG12"] boolValue];
    if([dict valueForKey:@"DG13"] != nil)
        group.dG13 = [[dict valueForKey:@"DG13"] boolValue];
    if([dict valueForKey:@"DG14"] != nil)
        group.dG14 = [[dict valueForKey:@"DG14"] boolValue];
    if([dict valueForKey:@"DG15"] != nil)
        group.dG15 = [[dict valueForKey:@"DG15"] boolValue];
    if([dict valueForKey:@"DG16"] != nil)
        group.dG16 = [[dict valueForKey:@"DG16"] boolValue];
    if([dict valueForKey:@"DG17"] != nil)
        group.dG17 = [[dict valueForKey:@"DG17"] boolValue];
    if([dict valueForKey:@"DG18"] != nil)
        group.dG18 = [[dict valueForKey:@"DG18"] boolValue];
    if([dict valueForKey:@"DG19"] != nil)
        group.dG19 = [[dict valueForKey:@"DG19"] boolValue];
    if([dict valueForKey:@"DG20"] != nil)
        group.dG20 = [[dict valueForKey:@"DG20"] boolValue];
    if([dict valueForKey:@"DG21"] != nil)
        group.dG21 = [[dict valueForKey:@"DG21"] boolValue];

    return group;
}

+(RGLeDLDataGroup*)RGLeDLDataGroupFromJson:(NSDictionary*)dict {
    RGLeDLDataGroup *group = [[RGLeDLDataGroup alloc] init];

    if([dict valueForKey:@"DG1"] != nil)
        group.dG1 = [[dict valueForKey:@"DG1"] boolValue];
    if([dict valueForKey:@"DG2"] != nil)
        group.dG2 = [[dict valueForKey:@"DG2"] boolValue];
    if([dict valueForKey:@"DG3"] != nil)
        group.dG3 = [[dict valueForKey:@"DG3"] boolValue];
    if([dict valueForKey:@"DG4"] != nil)
        group.dG4 = [[dict valueForKey:@"DG4"] boolValue];
    if([dict valueForKey:@"DG5"] != nil)
        group.dG5 = [[dict valueForKey:@"DG5"] boolValue];
    if([dict valueForKey:@"DG6"] != nil)
        group.dG6 = [[dict valueForKey:@"DG6"] boolValue];
    if([dict valueForKey:@"DG7"] != nil)
        group.dG7 = [[dict valueForKey:@"DG7"] boolValue];
    if([dict valueForKey:@"DG8"] != nil)
        group.dG8 = [[dict valueForKey:@"DG8"] boolValue];
    if([dict valueForKey:@"DG9"] != nil)
        group.dG9 = [[dict valueForKey:@"DG9"] boolValue];
    if([dict valueForKey:@"DG10"] != nil)
        group.dG10 = [[dict valueForKey:@"DG10"] boolValue];
    if([dict valueForKey:@"DG11"] != nil)
        group.dG11 = [[dict valueForKey:@"DG11"] boolValue];
    if([dict valueForKey:@"DG12"] != nil)
        group.dG12 = [[dict valueForKey:@"DG12"] boolValue];
    if([dict valueForKey:@"DG13"] != nil)
        group.dG13 = [[dict valueForKey:@"DG13"] boolValue];
    if([dict valueForKey:@"DG14"] != nil)
        group.dG14 = [[dict valueForKey:@"DG14"] boolValue];

    return group;
}

+(void)setCustomization:(NSDictionary*)options :(RGLCustomization*)customization {
    if([options valueForKey:@"cameraFrameBorderWidth"] != nil)
        customization.cameraFrameBorderWidth = [[options valueForKey:@"cameraFrameBorderWidth"] floatValue];
    if([options valueForKey:@"cameraFrameDefaultColor"] != nil)
        customization.cameraFrameDefaultColor = [self getUIColorObjectFromHexString:[options valueForKey:@"cameraFrameDefaultColor"] alpha:1];
    if([options valueForKey:@"cameraFrameActiveColor"] != nil)
        customization.cameraFrameActiveColor = [self getUIColorObjectFromHexString:[options valueForKey:@"cameraFrameActiveColor"] alpha:1];
    if([options valueForKey:@"cameraFrameShapeType"] != nil)
        customization.cameraFrameShapeType = [[options valueForKey:@"cameraFrameShapeType"] integerValue];
    if([options valueForKey:@"cameraFrameLineLength"] != nil)
        customization.cameraFrameLineLength = [[options valueForKey:@"cameraFrameLineLength"] integerValue];
    if([options valueForKey:@"status"] != nil)
        customization.status = [options valueForKey:@"status"];
    if([options valueForKey:@"showStatusMessages"] != nil)
        customization.showStatusMessages = [[options valueForKey:@"showStatusMessages"] boolValue];
    if([options valueForKey:@"statusTextFont"] != nil)
        customization.statusTextFont = [UIFont fontWithName:[options valueForKey:@"statusTextFont"] size:[options valueForKey:@"statusTextSize"] == nil ? 17 : [[options valueForKey:@"statusTextSize"] floatValue]];
    if([options valueForKey:@"statusTextColor"] != nil)
        customization.statusTextColor = [self getUIColorObjectFromHexString:[options valueForKey:@"statusTextColor"] alpha:1];
    if([options valueForKey:@"statusPositionMultiplier"] != nil)
        customization.statusPositionMultiplier = [[options valueForKey:@"statusPositionMultiplier"] doubleValue];
    if([options valueForKey:@"showResultStatusMessages"] != nil)
        customization.showResultStatusMessages = [[options valueForKey:@"showResultStatusMessages"] boolValue];
    if([options valueForKey:@"resultStatus"] != nil)
        customization.resultStatus = [options valueForKey:@"resultStatus"];
    if([options valueForKey:@"resultStatusTextFont"] != nil)
        customization.resultStatusTextFont = [UIFont fontWithName:[options valueForKey:@"resultStatusTextFont"] size:[options valueForKey:@"resultStatusTextSize"] == nil ? 17 : [[options valueForKey:@"resultStatusTextSize"] floatValue]];
    if([options valueForKey:@"resultStatusTextColor"] != nil)
        customization.resultStatusTextColor = [self getUIColorObjectFromHexString:[options valueForKey:@"resultStatusTextColor"] alpha:1];
    if([options valueForKey:@"resultStatusBackgroundColor"] != nil)
        customization.resultStatusBackgroundColor = [self getUIColorObjectFromHexString:[options valueForKey:@"resultStatusBackgroundColor"] alpha:1];
    if([options valueForKey:@"resultStatusPositionMultiplier"] != nil)
        customization.resultStatusPositionMultiplier = [[options valueForKey:@"resultStatusPositionMultiplier"] doubleValue];
    if([options valueForKey:@"showHelpAnimation"] != nil)
        customization.showHelpAnimation = [[options valueForKey:@"showHelpAnimation"] boolValue];
    if([options valueForKey:@"showNextPageAnimation"] != nil)
        customization.showNextPageAnimation = [[options valueForKey:@"showNextPageAnimation"] boolValue];
    if([options valueForKey:@"helpAnimationImage"] != nil)
        customization.helpAnimationImage = [self imageFromBase64:[options valueForKey:@"helpAnimationImage"]];
    if([options valueForKey:@"multipageAnimationFrontImage"] != nil)
        customization.multipageAnimationFrontImage = [self imageFromBase64:[options valueForKey:@"multipageAnimationFrontImage"]];
    if([options valueForKey:@"multipageAnimationBackImage"] != nil)
        customization.multipageAnimationBackImage = [self imageFromBase64:[options valueForKey:@"multipageAnimationBackImage"]];
    if([options valueForKey:@"tintColor"] != nil)
        customization.tintColor = [self getUIColorObjectFromHexString:[options valueForKey:@"tintColor"] alpha:1];
    if([options valueForKey:@"multipageButtonBackgroundColor"] != nil)
        customization.multipageButtonBackgroundColor = [self getUIColorObjectFromHexString:[options valueForKey:@"multipageButtonBackgroundColor"] alpha:1];
    if([options valueForKey:@"activityIndicatorColor"] != nil)
        customization.activityIndicatorColor = [self getUIColorObjectFromHexString:[options valueForKey:@"activityIndicatorColor"] alpha:1];
    if([options valueForKey:@"showBackgroundMask"] != nil)
        customization.showBackgroundMask = [[options valueForKey:@"showBackgroundMask"] boolValue];
    if([options valueForKey:@"borderBackgroundImage"] != nil)
        customization.borderBackgroundImage = [self imageFromBase64:[options valueForKey:@"borderBackgroundImage"]];
    if([options valueForKey:@"backgroundMaskAlpha"] != nil)
        customization.backgroundMaskAlpha = [[options valueForKey:@"backgroundMaskAlpha"] floatValue];
    if([options valueForKey:@"helpAnimationImageContentMode"] != nil)
        customization.helpAnimationImageContentMode = [self UIViewContentModeWithNSInteger:[[options valueForKey:@"helpAnimationImageContentMode"] integerValue]];
    if([options valueForKey:@"multipageAnimationFrontImageContentMode"] != nil)
        customization.multipageAnimationFrontImageContentMode = [self UIViewContentModeWithNSInteger:[[options valueForKey:@"multipageAnimationFrontImageContentMode"] integerValue]];
    if([options valueForKey:@"multipageAnimationBackImageContentMode"] != nil)
        customization.multipageAnimationBackImageContentMode = [self UIViewContentModeWithNSInteger:[[options valueForKey:@"multipageAnimationBackImageContentMode"] integerValue]];
    if([options valueForKey:@"borderBackgroundImageContentMode"] != nil)
        customization.borderBackgroundImageContentMode = [self UIViewContentModeWithNSInteger:[[options valueForKey:@"borderBackgroundImageContentMode"] integerValue]];
    if([options valueForKey:@"cameraFrameVerticalPositionMultiplier"] != nil)
        customization.cameraFrameVerticalPositionMultiplier = [[options valueForKey:@"cameraFrameVerticalPositionMultiplier"] floatValue];
    if([options valueForKey:@"customStatusPositionMultiplier"] != nil)
        customization.customStatusPositionMultiplier = [[options valueForKey:@"customStatusPositionMultiplier"] floatValue];
    if([options valueForKey:@"customLabelStatus"] != nil)
        customization.customLabelStatus = [[NSAttributedString alloc]initWithString:[options valueForKey:@"customLabelStatus"]];
    if([options valueForKey:@"cameraFrameCornerRadius"] != nil)
        customization.cameraFrameCornerRadius = [[options valueForKey:@"cameraFrameCornerRadius"] floatValue];
    if([options valueForKey:@"torchButtonOnImage"] != nil)
        customization.torchButtonOnImage = [self imageFromBase64:[options valueForKey:@"torchButtonOnImage"]];
    if([options valueForKey:@"torchButtonOffImage"] != nil)
        customization.torchButtonOffImage = [self imageFromBase64:[options valueForKey:@"torchButtonOffImage"]];
    if([options valueForKey:@"closeButtonImage"] != nil)
        customization.closeButtonImage = [self imageFromBase64:[options valueForKey:@"closeButtonImage"]];
    if([options valueForKey:@"captureButtonImage"] != nil)
        customization.captureButtonImage = [self imageFromBase64:[options valueForKey:@"captureButtonImage"]];
    if([options valueForKey:@"changeFrameButtonCollapseImage"] != nil)
        customization.changeFrameButtonCollapseImage = [self imageFromBase64:[options valueForKey:@"changeFrameButtonCollapseImage"]];
    if([options valueForKey:@"changeFrameButtonExpandImage"] != nil)
        customization.changeFrameButtonExpandImage = [self imageFromBase64:[options valueForKey:@"changeFrameButtonExpandImage"]];
    if([options valueForKey:@"cameraSwitchButtonImage"] != nil)
        customization.cameraSwitchButtonImage = [self imageFromBase64:[options valueForKey:@"cameraSwitchButtonImage"]];
    if([options valueForKey:@"cameraFrameLineCap"] != nil)
        customization.cameraFrameLineCap = [self CGLineCapWithNSInteger:[[options valueForKey:@"cameraFrameLineCap"] integerValue]];
    if([options valueForKey:@"cameraFrameOffsetWidth"] != nil)
        customization.cameraFrameOffsetWidth = [[options valueForKey:@"cameraFrameOffsetWidth"] floatValue];
    if([options valueForKey:@"cameraFramePortraitAspectRatio"] != nil)
        customization.cameraFramePortraitAspectRatio = [[options valueForKey:@"cameraFramePortraitAspectRatio"] floatValue];
    if([options valueForKey:@"cameraFrameLandscapeAspectRatio"] != nil)
        customization.cameraFrameLandscapeAspectRatio = [[options valueForKey:@"cameraFrameLandscapeAspectRatio"] floatValue];
    if([options valueForKey:@"toolbarSize"] != nil)
        customization.toolbarSize = [[options valueForKey:@"toolbarSize"] floatValue];
}

+(void)setFunctionality:(NSDictionary*)options :(RGLFunctionality*)functionality {
    if([options valueForKey:@"cameraFrame"] != nil){
        NSString *enumFromAndroid = [options valueForKey:@"cameraFrame"];
        if([enumFromAndroid  isEqual: @"id1"])
            functionality.cameraFrame = 0;
        if([enumFromAndroid  isEqual: @"max"])
            functionality.cameraFrame = 1;
        if([enumFromAndroid  isEqual: @"none"])
            functionality.cameraFrame = 2;
        if([enumFromAndroid  isEqual: @"document"])
            functionality.cameraFrame = 3;
    }
    if([options valueForKey:@"showTorchButton"] != nil)
        functionality.showTorchButton = [[options valueForKey:@"showTorchButton"] boolValue];
    if([options valueForKey:@"showCloseButton"] != nil)
        functionality.showCloseButton = [[options valueForKey:@"showCloseButton"] boolValue];
    if([options valueForKey:@"showCaptureButton"] != nil)
        functionality.showCaptureButton = [[options valueForKey:@"showCaptureButton"] boolValue];
    if([options valueForKey:@"showChangeFrameButton"] != nil)
        functionality.showChangeFrameButton = [[options valueForKey:@"showChangeFrameButton"] boolValue];
    if([options valueForKey:@"showSkipNextPageButton"] != nil)
        functionality.showSkipNextPageButton = [[options valueForKey:@"showSkipNextPageButton"] boolValue];
    if([options valueForKey:@"showCameraSwitchButton"] != nil)
        functionality.showCameraSwitchButton = [[options valueForKey:@"showCameraSwitchButton"] boolValue];
    if([options valueForKey:@"videoCaptureMotionControl"] != nil)
        functionality.videoCaptureMotionControl = [[options valueForKey:@"videoCaptureMotionControl"] boolValue];
    if([options valueForKey:@"skipFocusingFrames"] != nil)
        functionality.skipFocusingFrames = [[options valueForKey:@"skipFocusingFrames"] boolValue];
    if([options valueForKey:@"orientation"] != nil)
        functionality.orientation = [self UIInterfaceOrientationMaskWithNSInteger:[[options valueForKey:@"orientation"] integerValue]];
    if([options valueForKey:@"videoSessionPreset"] != nil)
        functionality.videoSessionPreset = [self AVCaptureSessionPresetWithNSInteger:[[options valueForKey:@"videoSessionPreset"] integerValue]];
    if([options valueForKey:@"singleResult"] != nil)
        functionality.singleResult = [[options valueForKey:@"singleResult"] boolValue];
    if([options valueForKey:@"cameraPosition"] != nil)
        functionality.cameraPosition = [self AVCaptureDevicePositionWithNSInteger:[[options valueForKey:@"cameraPosition"] integerValue]];
    if([options valueForKey:@"onlineMode"] != nil)
        functionality.onlineMode = [[options valueForKey:@"onlineMode"] boolValue];
    if([options valueForKey:@"serviceURL"] != nil)
        functionality.serviceURL = [[options valueForKey:@"serviceURL"] stringValue];
    if([options valueForKey:@"btDeviceName"] != nil)
        functionality.btDeviceName = [[options valueForKey:@"btDeviceName"] stringValue];
    if([options valueForKey:@"useAuthenticator"] != nil)
        functionality.useAuthenticator = [[options valueForKey:@"useAuthenticator"] boolValue];
    if([options valueForKey:@"rfidEnabled"] != nil)
        functionality.rfidEnabled = [[options valueForKey:@"rfidEnabled"] boolValue];
    if([options valueForKey:@"showCaptureButtonDelayFromDetect"] != nil)
        functionality.showCaptureButtonDelayFromDetect = [[options valueForKey:@"showCaptureButtonDelayFromDetect"] doubleValue];
    if([options valueForKey:@"showCaptureButtonDelayFromStart"] != nil)
        functionality.showCaptureButtonDelayFromStart = [[options valueForKey:@"showCaptureButtonDelayFromStart"] doubleValue];
    if([options valueForKey:@"captureMode"] != nil)
        functionality.captureMode = [[options valueForKey:@"captureMode"] intValue];
    if([options valueForKey:@"displayMetadata"] != nil)
        functionality.showMetadataInfo = [[options valueForKey:@"displayMetadata"] boolValue];
    if([options valueForKey:@"isZoomEnabled"] != nil)
        functionality.isZoomEnabled = [[options valueForKey:@"isZoomEnabled"] boolValue];
    if([options valueForKey:@"zoomFactor"] != nil)
        functionality.zoomFactor = [[options valueForKey:@"zoomFactor"] floatValue];
}

+(void)setProcessParams:(NSDictionary*)options :(RGLProcessParams*)processParams {
    if([options valueForKey:@"multipageProcessing"] != nil)
        processParams.multipageProcessing = [[options valueForKey:@"multipageProcessing"] boolValue];
    if([options valueForKey:@"dateFormat"] != nil)
        processParams.dateFormat = [options valueForKey:@"dateFormat"];
    if([options valueForKey:@"logs"] != nil)
        processParams.logs = [[options valueForKey:@"logs"] boolValue];
    if([options valueForKey:@"debugSaveImages"] != nil)
        processParams.debugSaveImages = [[options valueForKey:@"debugSaveImages"] boolValue];
    if([options valueForKey:@"debugSaveCroppedImages"] != nil)
        processParams.debugSaveCroppedImages = [[options valueForKey:@"debugSaveCroppedImages"] boolValue];
    if([options valueForKey:@"debugSaveLogs"] != nil)
        processParams.debugSaveLogs = [[options valueForKey:@"debugSaveLogs"] boolValue];
    if([options valueForKey:@"scenario"] != nil)
        processParams.scenario = [options valueForKey:@"scenario"];
    if([options valueForKey:@"barcodeTypes"] != nil)
        processParams.barcodeTypes = [options valueForKey:@"barcodeTypes"];
    if([options valueForKey:@"documentIDList"] != nil)
        processParams.documentIDList = [options valueForKey:@"documentIDList"];
    if([options valueForKey:@"fieldTypesFilter"] != nil)
        processParams.fieldTypesFilter = [options valueForKey:@"fieldTypesFilter"];
    if([options valueForKey:@"disableFocusingCheck"] != nil)
        processParams.disableFocusingCheck = [[options valueForKey:@"disableFocusingCheck"] boolValue];
    if([options valueForKey:@"captureButtonScenario"] != nil)
        processParams.captureButtonScenario = [options valueForKey:@"captureButtonScenario"];
    if([options valueForKey:@"sessionLogFolder"] != nil)
        [processParams setSessionLogFolder:[[options valueForKey:@"sessionLogFolder"] stringValue]];
    if([options valueForKey:@"measureSystem"] != nil)
        processParams.measureSystem = [[options valueForKey:@"measureSystem"] integerValue];
    if([options valueForKey:@"returnUncroppedImage"] != nil)
        processParams.returnUncroppedImage = [[options valueForKey:@"returnUncroppedImage"] boolValue];
    if([options valueForKey:@"customParams"] != nil)
        processParams.customParams = [options objectForKey:@"customParams"];
    if([options valueForKey:@"debugSaveRFIDSession"] != nil)
        processParams.debugSaveRFIDSession = [[options valueForKey:@"debugSaveRFIDSession"] boolValue];
    if([options valueForKey:@"doublePageSpread"] != nil)
        processParams.doublePageSpread = [[options valueForKey:@"doublePageSpread"] boolValue];
    if([options valueForKey:@"barcodeParserType"] != nil)
        processParams.barcodeParserType = [[options valueForKey:@"barcodeParserType"] integerValue];
    if([options valueForKey:@"timeout"] != nil)
        processParams.timeout = [[options valueForKey:@"timeout"] doubleValue];
    if([options valueForKey:@"timeoutFromFirstDetect"] != nil)
        processParams.timeoutFromFirstDetect = [[options valueForKey:@"timeoutFromFirstDetect"] doubleValue];
    if([options valueForKey:@"timeoutFromFirstDocType"] != nil)
        processParams.timeoutFromFirstDocType = [[options valueForKey:@"timeoutFromFirstDocType"] doubleValue];
    if([options valueForKey:@"manualCrop"] != nil)
        processParams.manualCrop = [[options valueForKey:@"manualCrop"] boolValue];
    if([options valueForKey:@"perspectiveAngle"] != nil)
        processParams.perspectiveAngle = [[options valueForKey:@"perspectiveAngle"] integerValue];
    if([options valueForKey:@"minDPI"] != nil)
        processParams.minDPI = [[options valueForKey:@"minDPI"] integerValue];
    if([options valueForKey:@"integralImage"] != nil)
        processParams.integralImage = [[options valueForKey:@"integralImage"] boolValue];
    if([options valueForKey:@"returnCroppedBarcode"] != nil)
        processParams.returnCroppedBarcode = [[options valueForKey:@"returnCroppedBarcode"] boolValue];
}

+(NSMutableDictionary *)getCustomization:(RGLCustomization*)customization {
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    result[@"showHelpAnimation"] = [NSNumber numberWithBool:customization.showHelpAnimation];
    result[@"helpAnimationImage"] = [UIImageJPEGRepresentation(customization.helpAnimationImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"showStatusMessages"] = [NSNumber numberWithBool:customization.showStatusMessages];
    result[@"status"] = customization.status;
    result[@"resultStatus"] = customization.resultStatus;
    result[@"statusPositionMultiplier"] = [NSNumber numberWithFloat:customization.statusPositionMultiplier];
    result[@"resultStatusPositionMultiplier"] = [NSNumber numberWithFloat:customization.resultStatusPositionMultiplier];
    result[@"cameraFrameShapeType"] = [NSNumber numberWithFloat:customization.cameraFrameShapeType];
    result[@"resultStatusTextFont"] = customization.resultStatusTextFont.fontName;
    result[@"cameraFrameBorderWidth"] = [NSNumber numberWithFloat:customization.cameraFrameBorderWidth];
    result[@"statusTextFont"] = customization.statusTextFont.fontName;
    result[@"multipageAnimationFrontImage"] = [UIImageJPEGRepresentation(customization.multipageAnimationFrontImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"multipageAnimationBackImage"] = [UIImageJPEGRepresentation(customization.multipageAnimationBackImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"cameraFrameLineLength"] = [NSNumber numberWithFloat:customization.cameraFrameLineLength];
    result[@"showNextPageAnimation"] = [NSNumber numberWithBool:customization.showNextPageAnimation];
    result[@"showBackgroundMask"] = [NSNumber numberWithBool:customization.showBackgroundMask];
    result[@"borderBackgroundImage"] = [UIImageJPEGRepresentation(customization.borderBackgroundImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"backgroundMaskAlpha"] = [NSNumber numberWithFloat:customization.backgroundMaskAlpha];
    result[@"helpAnimationImageContentMode"] = [NSNumber numberWithInteger:[self NSIntegerWithUIViewContentMode:customization.helpAnimationImageContentMode]];
    result[@"multipageAnimationFrontImageContentMode"] = [NSNumber numberWithInteger:[self NSIntegerWithUIViewContentMode:customization.multipageAnimationFrontImageContentMode]];
    result[@"multipageAnimationBackImageContentMode"] = [NSNumber numberWithInteger:[self NSIntegerWithUIViewContentMode:customization.multipageAnimationBackImageContentMode]];
    result[@"borderBackgroundImageContentMode"] = [NSNumber numberWithInteger:[self NSIntegerWithUIViewContentMode:customization.borderBackgroundImageContentMode]];
    result[@"cameraFrameVerticalPositionMultiplier"] = [NSNumber numberWithFloat:customization.cameraFrameVerticalPositionMultiplier];
    result[@"customStatusPositionMultiplier"] = [NSNumber numberWithFloat:customization.customStatusPositionMultiplier];
    result[@"cameraFrameCornerRadius"] = [NSNumber numberWithFloat:customization.cameraFrameCornerRadius];
    result[@"torchButtonOnImage"] = [UIImageJPEGRepresentation(customization.torchButtonOnImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"torchButtonOffImage"] = [UIImageJPEGRepresentation(customization.torchButtonOffImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"closeButtonImage"] = [UIImageJPEGRepresentation(customization.closeButtonImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"captureButtonImage"] = [UIImageJPEGRepresentation(customization.captureButtonImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"changeFrameButtonCollapseImage"] = [UIImageJPEGRepresentation(customization.changeFrameButtonCollapseImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"changeFrameButtonExpandImage"] = [UIImageJPEGRepresentation(customization.changeFrameButtonExpandImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"cameraSwitchButtonImage"] = [UIImageJPEGRepresentation(customization.cameraSwitchButtonImage, 1.0) base64EncodedStringWithOptions:0];
    result[@"cameraFrameLineCap"] = [NSNumber numberWithInteger:[self NSIntegerWithCGLineCap:customization.cameraFrameLineCap]];
    result[@"cameraFrameOffsetWidth"] = [NSNumber numberWithFloat:customization.cameraFrameOffsetWidth];
    result[@"cameraFramePortraitAspectRatio"] = [NSNumber numberWithFloat:customization.cameraFramePortraitAspectRatio];
    result[@"cameraFrameLandscapeAspectRatio"] = [NSNumber numberWithFloat:customization.cameraFrameLandscapeAspectRatio];
    result[@"toolbarSize"] = [NSNumber numberWithFloat:customization.toolbarSize];
    if(customization.customLabelStatus != nil)
        result[@"customLabelStatus"] = customization.customLabelStatus.string;
    if(customization.activityIndicatorColor != nil)
        result[@"activityIndicatorColor"] = [self hexStringFromUIColor:customization.activityIndicatorColor];
    if(customization.multipageButtonBackgroundColor != nil)
        result[@"multipageButtonBackgroundColor"] = [self hexStringFromUIColor:customization.multipageButtonBackgroundColor];
    if(customization.statusTextColor != nil)
        result[@"statusTextColor"] = [self hexStringFromUIColor:customization.statusTextColor];
    if(customization.resultStatusBackgroundColor != nil)
        result[@"resultStatusBackgroundColor"] = [self hexStringFromUIColor:customization.resultStatusBackgroundColor];
    if(customization.cameraFrameDefaultColor != nil)
        result[@"cameraFrameDefaultColor"] = [self hexStringFromUIColor:customization.cameraFrameDefaultColor];
    if(customization.cameraFrameActiveColor != nil)
        result[@"cameraFrameActiveColor"] = [self hexStringFromUIColor:customization.cameraFrameActiveColor];
    if(customization.tintColor != nil)
        result[@"tintColor"] = [self hexStringFromUIColor:customization.tintColor];
    if(customization.resultStatusTextColor != nil)
        result[@"resultStatusTextColor"] = [self hexStringFromUIColor:customization.resultStatusTextColor];

    return result;
}

+(NSMutableDictionary *)getFunctionality:(RGLFunctionality*)functionality {
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    result[@"cameraFrame"] = [NSNumber numberWithInteger:functionality.cameraFrame];
    result[@"showTorchButton"] = [NSNumber numberWithBool:functionality.showTorchButton];
    result[@"showCloseButton"] = [NSNumber numberWithBool:functionality.showCloseButton];
    result[@"showCaptureButton"] = [NSNumber numberWithBool:functionality.showCaptureButton];
    result[@"showChangeFrameButton"] = [NSNumber numberWithBool:functionality.showChangeFrameButton];
    result[@"showCameraSwitchButton"] = [NSNumber numberWithBool:functionality.showCameraSwitchButton];
    result[@"showSkipNextPageButton"] = [NSNumber numberWithBool:functionality.showSkipNextPageButton];
    result[@"skipFocusingFrames"] = [NSNumber numberWithBool:functionality.skipFocusingFrames];
    result[@"videoSessionPreset"] = [NSNumber numberWithInteger:[self NSIntegerWithAVCaptureSessionPreset:functionality.videoSessionPreset]];
    result[@"videoCaptureMotionControl"] = [NSNumber numberWithBool:functionality.videoCaptureMotionControl];
    result[@"orientation"] = [NSNumber numberWithInteger:[self NSIntegerWithUIInterfaceOrientationMask:functionality.orientation]];
    result[@"onlineMode"] = [NSNumber numberWithBool:functionality.onlineMode];
    result[@"serviceURL"] = functionality.serviceURL;
    result[@"cameraPosition"] = [NSNumber numberWithInteger:[self NSIntegerWithAVCaptureDevicePosition:functionality.cameraPosition]];
    result[@"btDeviceName"] = functionality.btDeviceName;
    result[@"useAuthenticator"] = [NSNumber numberWithBool:functionality.isUseAuthenticator];
    result[@"rfidEnabled"] = [NSNumber numberWithBool:functionality.rfidEnabled];
    result[@"showCaptureButtonDelayFromDetect"] = [NSNumber numberWithDouble:functionality.showCaptureButtonDelayFromDetect];
    result[@"showCaptureButtonDelayFromStart"] = [NSNumber numberWithDouble:functionality.showCaptureButtonDelayFromStart];
    result[@"captureMode"] = [NSNumber numberWithInteger:functionality.captureMode];
    result[@"displayMetadata"] = [NSNumber numberWithBool:functionality.showMetadataInfo];
    result[@"isZoomEnabled"] = [NSNumber numberWithBool:functionality.isZoomEnabled];
    result[@"zoomFactor"] = [NSNumber numberWithBool:functionality.zoomFactor];

    return result;
}

+(NSMutableDictionary *)getProcessParams:(RGLProcessParams*)processParams {
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    result[@"scenario"] = processParams.scenario;
    result[@"captureButtonScenario"] = processParams.captureButtonScenario;
    result[@"logs"] = [NSNumber numberWithBool:processParams.logs];
    result[@"multipageProcessing"] = [NSNumber numberWithBool:processParams.multipageProcessing];
    result[@"disableFocusingCheck"] = [NSNumber numberWithBool:processParams.disableFocusingCheck];
    result[@"debugSaveImages"] = [NSNumber numberWithBool:processParams.debugSaveImages];
    result[@"debugSaveCroppedImages"] = [NSNumber numberWithBool:processParams.debugSaveCroppedImages];
    result[@"debugSaveLogs"] = [NSNumber numberWithBool:processParams.debugSaveLogs];
    result[@"dateFormat"] = processParams.dateFormat;
    result[@"documentIDList"] = processParams.documentIDList;
    result[@"sessionLogFolder"] = processParams.sessionLogFolder;
    result[@"fieldTypesFilter"] = processParams.fieldTypesFilter;
    result[@"barcodeTypes"] = processParams.barcodeTypes;
    result[@"measureSystem"] = [NSNumber numberWithInteger:processParams.measureSystem];
    result[@"returnUncroppedImage"] = [NSNumber numberWithBool:processParams.returnUncroppedImage];
    result[@"customParams"] = processParams.customParams;
    result[@"debugSaveRFIDSession"] = [NSNumber numberWithBool:processParams.debugSaveRFIDSession];
    result[@"doublePageSpread"] = [NSNumber numberWithBool:processParams.doublePageSpread];
    result[@"barcodeParserType"] = [NSNumber numberWithInteger:processParams.barcodeParserType];
    result[@"processParamsDictionary"] = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:processParams.processParamsDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    result[@"coreParamsDictionary"] = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:processParams.coreParamsDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    result[@"rfidParamsDictionary"] = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:processParams.rfidParamsDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    result[@"timeout"] = [NSNumber numberWithDouble:processParams.timeout];
    result[@"timeoutFromFirstDetect"] = [NSNumber numberWithDouble:processParams.timeoutFromFirstDetect];
    result[@"timeoutFromFirstDocType"] = [NSNumber numberWithDouble:processParams.timeoutFromFirstDocType];
    result[@"manualCrop"] = [NSNumber numberWithBool:processParams.manualCrop];
    result[@"perspectiveAngle"] = [NSNumber numberWithInteger:processParams.perspectiveAngle];
    result[@"minDPI"] = [NSNumber numberWithInteger:processParams.minDPI];
    result[@"integralImage"] = [NSNumber numberWithBool:processParams.integralImage];
    result[@"returnCroppedBarcode"] = [NSNumber numberWithBool:processParams.returnCroppedBarcode];

    return result;
}

+(void)setRfidScenario:(NSDictionary*)options :(RGLRFIDScenario*)rfidScenario {
    if([options valueForKey:@"autoSettings"] != nil)
        rfidScenario.autoSettings = [[options valueForKey:@"autoSettings"] boolValue];
    if([options valueForKey:@"signManagementAction"] != nil)
        rfidScenario.signManagementAction = [[options valueForKey:@"signManagementAction"] integerValue];
    if([options valueForKey:@"readingBuffer"] != nil)
        rfidScenario.readingBuffer = [[options valueForKey:@"readingBuffer"] intValue];
    if([options valueForKey:@"onlineTAToSignDataType"] != nil)
        rfidScenario.onlineTAToSignDataType = [[options valueForKey:@"onlineTAToSignDataType"] intValue];
    if([options valueForKey:@"onlineTA"] != nil)
        rfidScenario.onlineTA = [[options valueForKey:@"onlineTA"] boolValue];
    if([options valueForKey:@"writeEid"] != nil)
        rfidScenario.writeEid = [[options valueForKey:@"writeEid"] boolValue];
    if([options valueForKey:@"profilerType"] != nil)
        rfidScenario.profilerType = [[options valueForKey:@"profilerType"] intValue];
    if([options valueForKey:@"authProcType"] != nil)
        rfidScenario.authProcType = [[options valueForKey:@"authProcType"] integerValue];
    if([options valueForKey:@"baseSMProcedure"] != nil)
        rfidScenario.baseSMProcedure = [[options valueForKey:@"baseSMProcedure"] integerValue];
    if([options valueForKey:@"pacePasswordType"] != nil)
        rfidScenario.pacePasswordType = [[options valueForKey:@"pacePasswordType"] integerValue];
    if([options valueForKey:@"terminalType"] != nil)
        rfidScenario.terminalType = [[options valueForKey:@"terminalType"] integerValue];
    if([options valueForKey:@"universalAccessRights"] != nil)
        rfidScenario.universalAccessRights = [[options valueForKey:@"universalAccessRights"] boolValue];
    if([options valueForKey:@"authorizedRestrictedIdentification"] != nil)
        rfidScenario.authorizedRestrictedIdentification = [[options valueForKey:@"authorizedRestrictedIdentification"] boolValue];
    if([options valueForKey:@"auxVerificationCommunityID"] != nil)
        rfidScenario.auxVerificationCommunityID = [[options valueForKey:@"auxVerificationCommunityID"] boolValue];
    if([options valueForKey:@"auxVerificationDateOfBirth"] != nil)
        rfidScenario.auxVerificationDateOfBirth = [[options valueForKey:@"auxVerificationDateOfBirth"] boolValue];
    if([options valueForKey:@"skipAA"] != nil)
        rfidScenario.skipAA = [[options valueForKey:@"skipAA"] boolValue];
    if([options valueForKey:@"strictProcessing"] != nil)
        rfidScenario.strictProcessing = [[options valueForKey:@"strictProcessing"] boolValue];
    if([options valueForKey:@"pkdDSCertPriority"] != nil)
        rfidScenario.pkdDSCertPriority = [[options valueForKey:@"pkdDSCertPriority"] boolValue];
    if([options valueForKey:@"pkdUseExternalCSCA"] != nil)
        rfidScenario.pkdUseExternalCSCA = [[options valueForKey:@"pkdUseExternalCSCA"] boolValue];
    if([options valueForKey:@"trustedPKD"] != nil)
        rfidScenario.trustedPKD = [[options valueForKey:@"trustedPKD"] boolValue];
    if([options valueForKey:@"passiveAuth"] != nil)
        rfidScenario.passiveAuth = [[options valueForKey:@"passiveAuth"] boolValue];
    if([options valueForKey:@"paceStaticBinding"] != nil)
        rfidScenario.paceStaticBinding = [[options valueForKey:@"paceStaticBinding"] boolValue];
    if([options valueForKey:@"password"] != nil)
        rfidScenario.password = [options valueForKey:@"password"];
    if([options valueForKey:@"useSFI"] != nil)
        rfidScenario.useSFI = [[options valueForKey:@"useSFI"] boolValue];
    if([options valueForKey:@"pkdPA"] != nil)
        rfidScenario.pkdPA = [options valueForKey:@"pkdPA"];
    if([options valueForKey:@"pkdEAC"] != nil)
        rfidScenario.pkdEAC = [options valueForKey:@"pkdEAC"];
    if([options valueForKey:@"readEPassport"] != nil)
        rfidScenario.readEPassport = [[options valueForKey:@"readEPassport"] boolValue];
    if([options valueForKey:@"readEID"] != nil)
        rfidScenario.readEID = [[options valueForKey:@"readEID"] boolValue];
    if([options valueForKey:@"readEDL"] != nil)
        rfidScenario.readEDL = [[options valueForKey:@"readEDL"] boolValue];
    if([options valueForKey:@"ePassportDataGroups"] != nil)
        rfidScenario.ePassportDataGroups = [self RGLePassportDataGroupFromJson:[options valueForKey:@"ePassportDataGroups"]];
    if([options valueForKey:@"eIDDataGroups"] != nil)
        rfidScenario.eIDDataGroups = [self RGLeIDDataGroupFromJson:[options valueForKey:@"eIDDataGroups"]];
    if([options valueForKey:@"eDLDataGroups"] != nil)
        rfidScenario.eDLDataGroups = [self RGLeDLDataGroupFromJson:[options valueForKey:@"eDLDataGroups"]];
    if([options valueForKey:@"mrz"] != nil)
        rfidScenario.mrz = [options valueForKey:@"mrz"];
    if([options valueForKey:@"eSignPINDefault"] != nil)
        rfidScenario.eSignPINDefault = [options valueForKey:@"eSignPINDefault"];
    if([options valueForKey:@"eSignPINNewValue"] != nil)
        rfidScenario.eSignPINNewValue = [options valueForKey:@"eSignPINNewValue"];
    if([options valueForKey:@"authorizedSTSignature"] != nil)
        rfidScenario.authorizedSTSignature = [[options valueForKey:@"authorizedSTSignature"] boolValue];
    if([options valueForKey:@"authorizedSTQSignature"] != nil)
        rfidScenario.authorizedSTQSignature = [[options valueForKey:@"authorizedSTQSignature"] boolValue];
    if([options valueForKey:@"authorizedWriteDG17"] != nil)
        rfidScenario.authorizedWriteDG17 = [[options valueForKey:@"authorizedWriteDG17"] boolValue];
    if([options valueForKey:@"authorizedWriteDG18"] != nil)
        rfidScenario.authorizedWriteDG18 = [[options valueForKey:@"authorizedWriteDG18"] boolValue];
    if([options valueForKey:@"authorizedWriteDG19"] != nil)
        rfidScenario.authorizedWriteDG19 = [[options valueForKey:@"authorizedWriteDG19"] boolValue];
    if([options valueForKey:@"authorizedWriteDG20"] != nil)
        rfidScenario.authorizedWriteDG20 = [[options valueForKey:@"authorizedWriteDG20"] boolValue];
    if([options valueForKey:@"authorizedWriteDG21"] != nil)
        rfidScenario.authorizedWriteDG21 = [[options valueForKey:@"authorizedWriteDG21"] boolValue];
    if([options valueForKey:@"authorizedVerifyAge"] != nil)
        rfidScenario.authorizedVerifyAge = [[options valueForKey:@"authorizedVerifyAge"] boolValue];
    if([options valueForKey:@"authorizedVerifyCommunityID"] != nil)
        rfidScenario.authorizedVerifyCommunityID = [[options valueForKey:@"authorizedVerifyCommunityID"] boolValue];
    if([options valueForKey:@"authorizedPrivilegedTerminal"] != nil)
        rfidScenario.authorizedPrivilegedTerminal = [[options valueForKey:@"authorizedPrivilegedTerminal"] boolValue];
    if([options valueForKey:@"authorizedCANAllowed"] != nil)
        rfidScenario.authorizedCANAllowed = [[options valueForKey:@"authorizedCANAllowed"] boolValue];
    if([options valueForKey:@"authorizedPINManagment"] != nil)
        rfidScenario.authorizedPINManagment = [[options valueForKey:@"authorizedPINManagment"] boolValue];
    if([options valueForKey:@"authorizedInstallCert"] != nil)
        rfidScenario.authorizedInstallCert = [[options valueForKey:@"authorizedInstallCert"] boolValue];
    if([options valueForKey:@"authorizedInstallQCert"] != nil)
        rfidScenario.authorizedInstallQCert = [[options valueForKey:@"authorizedInstallQCert"] boolValue];
}

@end
