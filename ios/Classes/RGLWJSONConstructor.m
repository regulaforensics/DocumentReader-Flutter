#import <Foundation/Foundation.h>
#import "RGLWJSONConstructor.h"

@implementation RGLWJSONConstructor

+(NSString*)dictToString:(NSMutableDictionary*)input {
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+(NSMutableDictionary* _Nonnull)generateNSDictionary:(NSDictionary<NSNumber*, NSNumber*>* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    for(NSNumber* key in input)
        result[[key stringValue]] = input[key];

    return result;
}

+(RGLPKDCertificate*)RGLPKDCertificateFromJson:(NSDictionary*)input {
    NSInteger type = [[input valueForKey:@"resourceType"] integerValue];
    NSData* binaryData = [[NSData alloc] initWithBase64EncodedString:[input objectForKey:@"binaryData"] options:0];
    NSData* privateKey = [input objectForKey:@"privateKey"] != nil ? [[NSData alloc] initWithBase64EncodedString:[input objectForKey:@"privateKey"] options:0] : nil;

    return [[RGLPKDCertificate alloc] initWithBinaryData:binaryData resourceType:type privateKey:privateKey];
}

+(NSMutableDictionary*)generateCGPoint:(CGPoint)input {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"x"] = [NSNumber numberWithFloat:input.x];
    result[@"y"] = [NSNumber numberWithFloat:input.y];

    return result;
}

+(NSMutableDictionary*)generateCGRect:(CGRect)input {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"top"] = @(input.origin.y);
    result[@"left"] = @(input.origin.x);
    result[@"bottom"] = @(input.origin.y+input.size.height);
    result[@"right"] = @(input.origin.x+input.size.width);

    return result;
}

+(NSMutableArray*)generateNSArrayCGRect:(NSArray<NSValue*>* _Nonnull)input {
    NSMutableArray *result = [NSMutableArray new];
    for(NSValue* rect in input)
        if(rect != nil)
            [result addObject:[self generateCGRect:[rect CGRectValue]]];
    return result;
}

+(NSMutableDictionary*)generateVideoEncoderCompletion:(NSURL*)input :(NSError*)error {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"filePath"] = input.absoluteString;
    result[@"error"] = [self generateNSError:error];

    return result;
}

+(NSMutableDictionary*)generateRfidNotificationCompletion:(NSInteger)notification {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"notification"] = [NSNumber numberWithInteger:notification];

    return result;
}

+(NSMutableDictionary*)generateRfidNotificationCompletionWithError:(NSInteger)notification :(NSInteger)value {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"notification"] = [NSNumber numberWithInteger:notification];
    result[@"value"] = [NSNumber numberWithInteger:value];

    return result;
}

+(NSInteger)generateDocReaderAction:(RGLDocReaderAction)input {
    NSInteger result = 0;
    switch (input) {
        case RGLDocReaderActionComplete:
            result = 1;
            break;
        case RGLDocReaderActionProcess:
            result = 0;
            break;
        case RGLDocReaderActionMorePagesAvailable:
            result = 8;
            break;
        case RGLDocReaderActionCancel:
            result = 2;
            break;
        case RGLDocReaderActionError:
            result = 3;
            break;
        default:
            break;
    }

    return result;
}

+(NSInteger)generateRFIDCompleteAction:(RGLRFIDCompleteAction)input {
    NSInteger result = 0;
    switch (input) {
        case RGLRFIDCompleteActionComplete:
            result = 10;
            break;
        case RGLRFIDCompleteActionError:
            result = 3;
            break;
        case RGLRFIDCompleteActionCancel:
            result = 2;
            break;
        case RGLRFIDCompleteActionSessionRestarted:
            result = 1;
            break;
        default:
            break;
    }

    return result;
}

+(NSInteger)generateRFIDNotificationAction:(RGLRFIDNotificationAction)input {
    return 5;
}

+(NSMutableDictionary*)generateCompletion:(NSInteger)action :(RGLDocumentReaderResults*)results :(NSError*)error :(RGLRFIDNotify*)notify {
    NSMutableDictionary *result = [NSMutableDictionary new];

    switch (action) {
        case 0:
            break;
        case 1:
            result[@"results"] = [self generateRGLDocumentReaderResults:results];
            break;
        case 2:
            result[@"results"] = [self generateRGLDocumentReaderResults:results];
            break;
        case 3:
            result[@"results"] = [self generateRGLDocumentReaderResults:results];
            break;
        case 5:
            result[@"results"] = [self generateResultsWithNotification:[self generateRGLRFIDNotify:notify]];
            break;
        case 6:
            result[@"results"] = [self generateResultsWithNotification:[self generateRGLRFIDNotify:notify]];
            break;
        case 8:
            result[@"results"] = [self generateRGLDocumentReaderResults:results];
            break;
        case 10:
            result[@"results"] = [self generateResultsWithRFID :results :1];
            action = 1;
            break;
        default:
            break;
    }

    result[@"action"] = [NSNumber numberWithInteger:action];
    if(error != nil)
        result[@"error"] = [self generateNSError:error];

    return result;
}

+(NSMutableDictionary*)generateResultsWithNotification:(NSMutableDictionary*)input {
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"documentReaderNotification"] = input;

    return result;
}

+(NSMutableDictionary*)generateResultsWithRFID:(RGLDocumentReaderResults*)results :(NSInteger)input {
    NSMutableDictionary *result = [self generateRGLDocumentReaderResults:results];

    result[@"rfidResult"] = [NSNumber numberWithInteger:input];

    return result;
}

+(NSString*)generateNSData:(NSData *)input {
    return [NSKeyedUnarchiver unarchiveObjectWithData:input];
}

+(NSMutableDictionary* _Nonnull)generatePACertificateCompletion:(NSData *)serialNumber :(RGLPAResourcesIssuer *)issuer{
    NSMutableDictionary *result = [NSMutableDictionary new];

    result[@"serialNumber"] = [self generateNSData:serialNumber];
    result[@"issuer"] = [self generateRGLPAResourcesIssuer:issuer];

    return result;
}

    // To JSON

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderResults:(RGLDocumentReaderResults* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.documentType != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderDocumentType* item in input.documentType)
            if(item != nil)
                [array addObject:[self generateRGLDocumentReaderDocumentType:item]];
        result[@"documentType"] = array;
    }
    result[@"textResult"] = [self generateRGLDocumentReaderTextResult:input.textResult];
    result[@"graphicResult"] = [self generateRGLDocumentReaderGraphicResult:input.graphicResult];
    if(input.documentPosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.documentPosition)
            if(item != nil)
                [array addObject:[self generateRGLPosition:item]];
        result[@"documentPosition"] = array;
    }
    if(input.barcodePosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.barcodePosition)
            if(item != nil)
                [array addObject:[self generateRGLPosition:item]];
        result[@"barcodePosition"] = array;
    }
    if(input.mrzPosition != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPosition* item in input.mrzPosition)
            if(item != nil)
                [array addObject:[self generateRGLPosition:item]];
        result[@"mrzPosition"] = array;
    }
    if(input.imageQualityGroup != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLImageQualityGroup* item in input.imageQualityGroup)
            if(item != nil)
                [array addObject:[self generateRGLImageQualityGroup:item]];
        result[@"imageQuality"] = array;
    }
    result[@"overallResult"] = @(input.overallResult);
    result[@"authenticityResult"] = [self generateRGLDocumentReaderAuthenticityResult:input.authenticityResults];
    result[@"rfidSessionData"] = [self generateRGLRFIDSessionData:input.rfidSessionData];
    result[@"chipPage"] = @(input.chipPage);
    result[@"resolutionType"] = @(input.resolutionType);
    result[@"barcodeResult"] = [self generateRGLDocumentReaderBarcodeResult:input.barcodeResult];
    result[@"processingFinishedStatus"] = @(input.processingFinishedStatus);
    result[@"morePagesAvailable"] = @(input.morePagesAvailable);
    result[@"elapsedTime"] = @(input.elapsedTime);
    result[@"elapsedTimeRFID"] = @(input.elapsedTimeRFID);
    result[@"rawResult"] = input.rawResult;
    result[@"status"] = [self generateRGLDocumentReaderResultsStatus:input.status];
    result[@"vdsncData"] = [self generateRGLVDSNCData:input.vdsncData];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLPosition:(RGLPosition* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"width"] = @(input.size.width);
    result[@"height"] = @(input.size.height);
    result[@"center"] = [self generateCGPoint:input.center];
    result[@"leftTop"] = [self generateCGPoint:input.leftTop];
    result[@"leftBottom"] = [self generateCGPoint:input.leftBottom];
    result[@"rightTop"] = [self generateCGPoint:input.rightTop];
    result[@"rightBottom"] = [self generateCGPoint:input.rightBottom];
    result[@"angle"] = @(input.angle);
    result[@"perspectiveTr"] = @(input.perspectiveTr);
    result[@"objArea"] = @(input.objArea);
    result[@"objIntAngleDev"] = @(input.objIntAngleDev);
    result[@"resultStatus"] = @(input.resultStatus);
    result[@"docFormat"] = @(input.docFormat);
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"dpi"] = @(input.dpi);
    result[@"inverse"] = @(input.inverse);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderBarcodeResult:(RGLDocumentReaderBarcodeResult* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.fields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderBarcodeField* item in input.fields)
            if(item != nil)
                [array addObject:[self generateRGLDocumentReaderBarcodeField:item]];
        result[@"fields"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderBarcodeField:(RGLDocumentReaderBarcodeField* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"barcodeType"] = @(input.barcodeType);
    result[@"status"] = @(input.status);
    result[@"pdf417Info"] = [self generateRGLPDF417Info:input.pdf417Info];
    result[@"data"] = [NSKeyedUnarchiver unarchiveObjectWithData:input.data];
    result[@"pageIndex"] = @(input.pageIndex);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLPDF417Info:(RGLPDF417Info* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"errorLevel"] = @(input.errorLevel);
    result[@"columns"] = @(input.columns);
    result[@"rows"] = @(input.rows);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderAuthenticityResult:(RGLDocumentReaderAuthenticityResult* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"status"] = @(input.status);
    if(input.checks != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAuthenticityCheck* item in input.checks)
            if(item != nil)
                [array addObject:[self generateRGLAuthenticityCheck:item]];
        result[@"checks"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLAuthenticityCheck:(RGLAuthenticityCheck* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"type"] = @(input.type);
    result[@"typeName"] = input.typeName;
    result[@"status"] = @(input.status);
    if(input.elements != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAuthenticityElement* item in input.elements)
            if(item != nil)
                [array addObject:[self generateRGLAuthenticityElement:item]];
        result[@"elements"] = array;
    }
    result[@"pageIndex"] = @(input.pageIndex);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLAuthenticityElement:(RGLAuthenticityElement* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"status"] = @(input.status);
    result[@"elementType"] = @(input.elementType);
    result[@"elementTypeName"] = input.elementTypeName;
    result[@"elementDiagnose"] = @(input.elementDiagnose);
    result[@"elementDiagnoseName"] = input.elementDiagnoseName;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLImageQualityGroup:(RGLImageQualityGroup* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"count"] = @(input.count);
    result[@"result"] = @(input.result);
    if(input.imageQualityList != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLImageQuality* item in input.imageQualityList)
            if(item != nil)
                [array addObject:[self generateRGLImageQuality:item]];
        result[@"imageQualityList"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLImageQuality:(RGLImageQuality* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"type"] = @(input.type);
    result[@"result"] = @(input.result);
    result[@"featureType"] = @(input.featureType);
    result[@"boundRects"] = [self generateNSArrayCGRect:input.boundRects];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.fields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderGraphicField* item in input.fields)
            if(item != nil)
                [array addObject:[self generateRGLDocumentReaderGraphicField:item]];
        result[@"fields"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderGraphicField:(RGLDocumentReaderGraphicField* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"sourceType"] = @(input.sourceType);
    result[@"fieldType"] = @(input.fieldType);
    result[@"fieldName"] = input.fieldName;
    result[@"fieldRect"] = [self generateCGRect:input.boundRect];
    result[@"value"] = [UIImageJPEGRepresentation(input.value, 1.0) base64EncodedStringWithOptions:0];
    result[@"lightType"] = @(input.lightType);
    result[@"lightName"] = input.lightName;
    result[@"pageIndex"] = @(input.pageIndex);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderTextResult:(RGLDocumentReaderTextResult* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.fields != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderTextField* item in input.fields)
            if(item != nil)
                [array addObject:[self generateRGLDocumentReaderTextField:item]];
        result[@"fields"] = array;
    }
    result[@"status"] = @(input.status);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderTextField:(RGLDocumentReaderTextField* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"fieldType"] = @(input.fieldType);
    result[@"fieldName"] = input.fieldName;
    result[@"lcid"] = @(input.lcid);
    result[@"lcidName"] = [RGLDocumentReaderTextField lcidName:input.lcid];
    if(input.values != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLDocumentReaderValue* item in input.values)
            if(item != nil)
                [array addObject:[self generateRGLDocumentReaderValue:item]];
        result[@"values"] = array;
    }
    result[@"status"] = @(input.status);
    result[@"value"] = [self generateRGLDocumentReaderValue:[input getValue]];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderValue:(RGLDocumentReaderValue* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"sourceType"] = @(input.sourceType);
    result[@"value"] = input.value;
    result[@"originalValue"] = input.originalValue;
    result[@"boundRect"] = [self generateCGRect:input.boundRect];
    result[@"validity"] = @(input.validity);
    result[@"comparison"] = [self generateNSDictionary:input.comparison];
    result[@"pageIndex"] = @(input.pageIndex);
    result[@"probability"] = @(input.probability);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderDocumentType:(RGLDocumentReaderDocumentType* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"name"] = input.name;
    result[@"documentID"] = @(input.documentID);
    result[@"ICAOCode"] = input.ICAOCode;
    if(input.FDSID != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.FDSID)
            if(item != nil)
                [array addObject:item];
        result[@"FDSID"] = array;
    }
    result[@"dType"] = @(input.dType);
    result[@"dFormat"] = @(input.dFormat);
    result[@"dMRZ"] = @(input.dMRZ);
    result[@"dDescription"] = input.dDescription;
    result[@"dYear"] = input.dYear;
    result[@"dCountryName"] = input.dCountryName;
    result[@"pageIndex"] = @(input.pageIndex);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLScenario:(RGLScenario* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"name"] = input.identifier;
    result[@"frame"] = @(input.frame);
    result[@"frameKWHLandscape"] = @(input.frameKWHLandscape);
    result[@"frameKWHPortrait"] = @(input.frameKWHPortrait);
    result[@"frameKWHDoublePageSpreadPortrait"] = @(input.frameKWHDoublePageSpreadPortrait);
    result[@"frameKWHDoublePageSpreadLandscape"] = @(input.frameKWHDoublePageSpreadLandscape);
    result[@"description"] = input.scenarioDescription;
    result[@"barcodeExt"] = @(input.barcodeExt);
    result[@"faceExt"] = @(input.faceExt);
    result[@"multiPageOff"] = @(input.multiPageOff);
    result[@"seriesProcessMode"] = @(input.seriesProcessMode);
    result[@"caption"] = input.caption;
    result[@"uvTorch"] = @(input.uvTorch);
    result[@"frameOrientation"] = @(input.frameOrientation);
    result[@"manualCrop"] = @(input.manualCrop);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLRFIDSessionData:(RGLRFIDSessionData* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.accessControls != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAccessControlProcedureType* item in input.accessControls)
            if(item != nil)
                [array addObject:[self generateRGLAccessControlProcedureType:item]];
        result[@"accessControls"] = array;
    }
    if(input.applications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLApplication* item in input.applications)
            if(item != nil)
                [array addObject:[self generateRGLApplication:item]];
        result[@"applications"] = array;
    }
    if(input.securityObjects != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLSecurityObject* item in input.securityObjects)
            if(item != nil)
                [array addObject:[self generateRGLSecurityObject:item]];
        result[@"securityObjects"] = array;
    }
    result[@"cardProperties"] = [self generateRGLCardProperties:input.cardProperties];
    result[@"totalBytesReceived"] = @(input.totalBytesReceived);
    result[@"totalBytesSent"] = @(input.totalBytesSent);
    result[@"status"] = @(input.status);
    result[@"extLeSupport"] = @(input.extLeSupport);
    result[@"processTime"] = @(input.processTime);
    result[@"sessionDataStatus"] = [self generateRGLRFIDSessionDataStatus:input.sessionDataStatus];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLCardProperties:(RGLCardProperties* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"aTQA"] = @(input.aTQA);
    result[@"aTQB"] = input.aTQB;
    result[@"aTR"] = input.aTR;
    result[@"baudrate1"] = input.baudrate1;
    result[@"baudrate2"] = input.baudrate2;
    result[@"bitRateR"] = @(input.bitRateR);
    result[@"bitRateS"] = @(input.bitRateS);
    result[@"chipTypeA"] = @(input.chipTypeA);
    result[@"mifareMemory"] = @(input.mifareMemory);
    result[@"rfidType"] = @(input.rfidType);
    result[@"sAK"] = @(input.sAK);
    result[@"support4"] = @(input.support4);
    result[@"supportMifare"] = @(input.supportMifare);
    result[@"uID"] = input.uID;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLRFIDSessionDataStatus:(RGLRFIDSessionDataStatus* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"AA"] = @(input.AA);
    result[@"BAC"] = @(input.BAC);
    result[@"CA"] = @(input.CA);
    result[@"PA"] = @(input.PA);
    result[@"PACE"] = @(input.PACE);
    result[@"TA"] = @(input.TA);
    result[@"overallStatus"] = @(input.overallStatus);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLAccessControlProcedureType:(RGLAccessControlProcedureType* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"activeOptionIdx"] = @(input.activeOptionIdx);
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLApplication:(RGLApplication* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"applicationID"] = input.applicationID;
    result[@"dataHashAlgorithm"] = input.dataHashAlgorithm;
    if(input.files != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLFile* item in input.files)
            if(item != nil)
                [array addObject:[self generateRGLFile:item]];
        result[@"files"] = array;
    }
    result[@"type"] = @(input.type);
    result[@"status"] = @(input.status);
    result[@"unicodeVersion"] = input.unicodeVersion;
    result[@"version"] = input.version;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLFile:(RGLFile* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"fileData"] = [self generateRGLFileData:input.fileData];
    result[@"fileID"] = input.fileID;
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"pAStatus"] = @(input.pAStatus);
    result[@"readingStatus"] = @(input.readingStatus);
    result[@"readingTime"] = @(input.readingTime);
    result[@"type"] = @(input.type);
    result[@"typeName"] = input.typeName;
    if(input.docFieldsText != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsText)
            if(item != nil)
                [array addObject:item];
        result[@"docFieldsText"] = array;
    }
    if(input.docFieldsGraphics != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsGraphics)
            if(item != nil)
                [array addObject:item];
        result[@"docFieldsGraphics"] = array;
    }
    if(input.docFieldsOriginals != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.docFieldsOriginals)
            if(item != nil)
                [array addObject:item];
        result[@"docFieldsOriginals"] = array;
    }
    result[@"certificates"] = [self generateRGLSecurityObjectCertificates:input.certificates];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLFileData:(RGLFileData* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLSecurityObjectCertificates:(RGLSecurityObjectCertificates* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"securityObject"] = [self generateRGLCertificateData:input.securityObject];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLCertificateData:(RGLCertificateData* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = input.data;
    result[@"length"] = @(input.length);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLSecurityObject:(RGLSecurityObject* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"fileReference"] = @(input.fileReference);
    result[@"objectType"] = input.objectType;
    result[@"version"] = @(input.version);
    if(input.signerInfos != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLSignerInfo* item in input.signerInfos)
            if(item != nil)
                [array addObject:[self generateRGLSignerInfo:item]];
        result[@"signerInfos"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLSignerInfo:(RGLSignerInfo* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"dataToHash"] = input.dataToHash;
    result[@"digestAlgorithm"] = input.digestAlgorithm;
    result[@"paStatus"] = @(input.paStatus);
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"version"] = @(input.version);
    result[@"issuer"] = [self generateRGLAuthority:input.issuer];
    result[@"serialNumber"] = [self generateRGLRFIDValue:input.serialNumber];
    result[@"signature"] = [self generateRGLRFIDValue:input.signature];
    if(input.signedAttributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLExtension* item in input.signedAttributes)
            if(item != nil)
                [array addObject:[self generateRGLExtension:item]];
        result[@"signedAttributes"] = array;
    }
    result[@"subjectKeyIdentifier"] = [self generateRGLRFIDValue:input.subjectKeyIdentifier];
    if(input.certificateChain != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLCertificateChain* item in input.certificateChain)
            if(item != nil)
                [array addObject:[self generateRGLCertificateChain:item]];
        result[@"certificateChain"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLAuthority:(RGLAuthority* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.attributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLAttribute* item in input.attributes)
            if(item != nil)
                [array addObject:[self generateRGLAttribute:item]];
        result[@"attributes"] = array;
    }
    result[@"data"] = input.data;
    result[@"friendlyName"] = [self generateRGLRFIDValue:input.friendlyName];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLRFIDValue:(RGLRFIDValue* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);
    result[@"format"] = input.format;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLAttribute:(RGLAttribute* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"type"] = input.type;
    result[@"value"] = [self generateRGLRFIDValue:input.value];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLExtension:(RGLExtension* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = input.data;
    result[@"type"] = input.type;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLCertificateChain:(RGLCertificateChain* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    if(input.extensions != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLExtension* item in input.extensions)
            if(item != nil)
                [array addObject:[self generateRGLExtension:item]];
        result[@"extensions"] = array;
    }
    result[@"fileName"] = [self generateRGLRFIDValue:input.fileName];
    result[@"issuer"] = [self generateRGLAuthority:input.issuer];
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }
    result[@"origin"] = @(input.origin);
    result[@"paStatus"] = @(input.paStatus);
    result[@"serialNumber"] = input.serialNumber;
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"subject"] = [self generateRGLAuthority:input.subject];
    result[@"subjectPKAlgorithm"] = input.subjectPKAlgorithm;
    result[@"type"] = @(input.type);
    result[@"validity"] = [self generateRGLValidity:input.validity];
    result[@"version"] = @(input.version);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLValidity:(RGLValidity* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"notAfter"] = [self generateRGLRFIDValue:input.notAfter];
    result[@"notBefore"] = [self generateRGLRFIDValue:input.notBefore];

    return result;
}

+(NSMutableDictionary* _Nonnull)generateNSError:(NSError* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"code"] = @(input.code);
    result[@"localizedDescription"] = input.localizedDescription;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLPAResourcesIssuer:(RGLPAResourcesIssuer* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = [NSKeyedUnarchiver unarchiveObjectWithData:input.data];
    result[@"friendlyName"] = input.friendlyName;
    if(input.attributes != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLPAAttribute* item in input.attributes)
            if(item != nil)
                [array addObject:[self generateRGLPAAttribute:item]];
        result[@"attributes"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLPAAttribute:(RGLPAAttribute* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"value"] = input.value;
    result[@"type"] = input.type;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLTAChallenge:(RGLTAChallenge* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = [NSKeyedUnarchiver unarchiveObjectWithData:input.data];
    result[@"auxPCD"] = input.auxPCD;
    result[@"challengePICC"] = input.challengePICC;
    result[@"hashPK"] = input.hashPK;
    result[@"idPICC"] = input.idPICC;

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLDocumentReaderResultsStatus:(RGLDocumentReaderResultsStatus* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"overallStatus"] = @(input.overallStatus);
    result[@"optical"] = @(input.optical);
    result[@"detailsOptical"] = [self generateRGLOpticalStatus:input.detailsOptical];
    result[@"rfid"] = @(input.rfid);
    result[@"detailsRFID"] = [self generateRGLRFIDSessionDataStatus:input.detailsRFID];
    result[@"portrait"] = @(input.portrait);
    result[@"stopList"] = @(input.stopList);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLOpticalStatus:(RGLOpticalStatus* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"overallStatus"] = @(input.overallStatus);
    result[@"mrz"] = @(input.mrz);
    result[@"text"] = @(input.text);
    result[@"docType"] = @(input.docType);
    result[@"security"] = @(input.security);
    result[@"imageQA"] = @(input.imageQA);
    result[@"expiry"] = @(input.expiry);
    result[@"vds"] = @(input.vds);
    result[@"pagesCount"] = @(input.pagesCount);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLVDSNCData:(RGLVDSNCData* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"type"] = input.type;
    result[@"version"] = @(input.version);
    result[@"issuingCountry"] = input.issuingCountry;
    result[@"message"] = [self generateNSDictionary:input.message];
    result[@"signatureAlgorithm"] = input.signatureAlgorithm;
    result[@"signature"] = [self generateRGLBytesData:input.signature];
    result[@"certificate"] = [self generateRGLBytesData:input.certificate];
    if(input.certificateChain != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(RGLCertificateChain* item in input.certificateChain)
            if(item != nil)
                [array addObject:[self generateRGLCertificateChain:item]];
        result[@"certificateChain"] = array;
    }
    if(input.notifications != nil){
        NSMutableArray *array = [NSMutableArray new];
        for(NSNumber* item in input.notifications)
            if(item != nil)
                [array addObject:item];
        result[@"notifications"] = array;
    }

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLBytesData:(RGLBytesData* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"data"] = input.data;
    result[@"length"] = @(input.length);
    result[@"status"] = @(input.status);
    result[@"type"] = @(input.type);

    return result;
}

+(NSMutableDictionary* _Nonnull)generateRGLRFIDNotify:(RGLRFIDNotify* _Nullable)input {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if(input == nil) return result;

    result[@"code"] = @(input.code);
    result[@"value"] = @(input.value);
    result[@"number"] = @(input.number);

    return result;
}

@end