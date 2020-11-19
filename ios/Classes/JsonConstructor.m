#import <Foundation/Foundation.h>
#import "JSONConstructor.h"

@implementation JSONConstructor

+ (NSString*)resultsToJsonString:(RGLDocumentReaderResults*)results {
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:[self generateResults:results] options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+ (NSMutableDictionary*)generateResults:(RGLDocumentReaderResults*)results {
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];

    myDictionary[@"resolutionType"] = [NSNumber numberWithInteger:results.resolutionType];
    myDictionary[@"overallResult"] = [NSNumber numberWithInteger:results.overallResult];
    myDictionary[@"chipPage"] = [NSNumber numberWithInteger:results.chipPage];
    myDictionary[@"morePagesAvailable"] = [NSNumber numberWithInteger:results.morePagesAvailable];
    myDictionary[@"elapsedTime"] = [NSNumber numberWithInteger:results.elapsedTime];
    myDictionary[@"elapsedTimeRFID"] = [NSNumber numberWithInteger:results.elapsedTimeRFID];
    myDictionary[@"processingFinishedStatus"] = [NSNumber numberWithInteger:results.processingFinishedStatus];
    if(results.authenticityResults != nil)
        myDictionary[@"authenticityResult"] = [self generateRGLDocumentReaderAuthenticityResult:results.authenticityResults];
    if(results.imageQualityGroup != nil)
        myDictionary[@"imageQuality"] = [self generateImageQualityGroup:results.imageQualityGroup];
    if(results.barcodePosition != nil)
        myDictionary[@"barcodePosition"] = [self generateRGLPosition:results.barcodePosition];
    if(results.documentPosition != nil)
        myDictionary[@"documentPosition"] = [self generateRGLPosition:results.documentPosition];
    if(results.mrzPosition != nil)
        myDictionary[@"mrzPosition"] = [self generateRGLPosition:results.mrzPosition];
    if(results.rawResult != nil)
        myDictionary[@"rawResult"] = results.rawResult;
    if(results.graphicResult != nil)
        myDictionary[@"graphicResult"] = [self generateDocumentReaderGraphicResult:results.graphicResult];
    if(results.textResult != nil)
        myDictionary[@"textResult"] = [self generateDocumentReaderTextResult:results.textResult];
    if(results.documentType != nil)
        myDictionary[@"documentType"] = [self generateNSArrayDocumentReaderDocumentType:results.documentType];
    if(results.barcodeResult != nil)
        myDictionary[@"barcodeResult"] = [self generateRGLDocumentReaderBarcodeResult:results.barcodeResult];
    if(results.rfidSessionData != nil)
        myDictionary[@"rfidSessionData"] = [self generateRGLRFIDSessionData:results.rfidSessionData];

    return myDictionary;
}

+ (NSMutableDictionary*)generateRGLPosition:(RGLPosition*)position {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"angle"] = [NSNumber numberWithDouble: position.angle];
    output[@"perspectiveTr"] = [NSNumber numberWithDouble: position.perspectiveTr];
    output[@"objArea"] = [NSNumber numberWithDouble: position.objArea];
    output[@"objIntAngleDev"] = [NSNumber numberWithDouble: position.objIntAngleDev];
    output[@"pageIndex"] = [NSNumber numberWithInteger:position.pageIndex];
    output[@"dpi"] = [NSNumber numberWithInteger:position.dpi];
    output[@"inverse"] = [NSNumber numberWithInteger:position.inverse];
    output[@"resultStatus"] = [NSNumber numberWithInteger:position.resultStatus];
    output[@"docFormat"] = [NSNumber numberWithInteger:position.docFormat];
    output[@"height"] = [NSNumber numberWithFloat:position.size.height];
    output[@"width"] = [NSNumber numberWithFloat:position.size.width];
    output[@"center"] = [self generateCGPoint:position.center];
    output[@"leftTop"] = [self generateCGPoint:position.leftTop];
    output[@"leftBottom"] = [self generateCGPoint:position.leftBottom];
    output[@"rightTop"] = [self generateCGPoint:position.rightTop];
    output[@"rightBottom"] = [self generateCGPoint:position.rightBottom];

    return output;
}

+(NSMutableDictionary*)generateCGPoint:(CGPoint)point {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"x"] = [NSNumber numberWithFloat:point.x];
    output[@"y"] = [NSNumber numberWithFloat:point.y];

    return output;
}

+ (NSMutableDictionary*)generateRGLDocumentReaderBarcodeResult:(RGLDocumentReaderBarcodeResult*)documentReaderBarcodeResult {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    if(documentReaderBarcodeResult.fields != nil)
        output[@"fields"] = [self generateNSArrayRGLDocumentReaderBarcodeField:documentReaderBarcodeResult.fields];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLDocumentReaderBarcodeField:(NSArray<RGLDocumentReaderBarcodeField *> * _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLDocumentReaderBarcodeField* documentReaderBarcodeField in list)
        if(documentReaderBarcodeField != nil)
            [output addObject:[self generateRGLDocumentReaderBarcodeField:documentReaderBarcodeField]];
    return output;
}

+ (NSMutableDictionary*)generateRGLDocumentReaderBarcodeField:(RGLDocumentReaderBarcodeField*)documentReaderBarcodeField {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"barcodeType"] = [NSNumber numberWithInteger:documentReaderBarcodeField.barcodeType];
    output[@"status"] = [NSNumber numberWithInteger:documentReaderBarcodeField.status];
    output[@"data"] = [NSKeyedUnarchiver unarchiveObjectWithData:documentReaderBarcodeField.data];
    output[@"pageIndex"] = [NSNumber numberWithInteger:documentReaderBarcodeField.pageIndex];
    if(documentReaderBarcodeField.pdf417Info != nil)
        output[@"pdf417Info"] = [self generateRGLPDF417Info:documentReaderBarcodeField.pdf417Info];

    return output;
}

+ (NSMutableDictionary*)generateRGLPDF417Info:(RGLPDF417Info*)pdf417Info {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"errorLevel"] = [NSNumber numberWithInteger:pdf417Info.errorLevel];
    output[@"columns"] = [NSNumber numberWithInteger:pdf417Info.columns];
    output[@"rows"] = [NSNumber numberWithInteger:pdf417Info.rows];

    return output;
}

+ (NSMutableDictionary*)generateRGLDocumentReaderAuthenticityResult:(RGLDocumentReaderAuthenticityResult*)documentReaderAuthenticityResult {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"status"] = [NSNumber numberWithInteger:documentReaderAuthenticityResult.status];
    if(documentReaderAuthenticityResult.checks != nil)
        output[@"checks"] = [self generateNSArrayRGLAuthenticityCheck:documentReaderAuthenticityResult.checks];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLAuthenticityCheck:(NSArray<RGLAuthenticityCheck*>* _Nonnull)authenticityCheckList {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLAuthenticityCheck* authenticityCheck in authenticityCheckList)
        if(authenticityCheck != nil)
            [output addObject:[self generateRGLAuthenticityCheck:authenticityCheck]];
    return output;
}

+ (NSMutableDictionary*)generateRGLAuthenticityCheck:(RGLAuthenticityCheck*)authenticityCheck {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"type"] = [NSNumber numberWithInteger:authenticityCheck.type];
    output[@"typeName"] = authenticityCheck.typeName;
    output[@"status"] = [NSNumber numberWithInteger:authenticityCheck.status];
    output[@"pageIndex"] = [NSNumber numberWithInteger:authenticityCheck.pageIndex];
    if(authenticityCheck.elements != nil)
        output[@"elements"] = [self generateNSArrayRGLAuthenticityElement:authenticityCheck.elements];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLAuthenticityElement:(NSArray<RGLAuthenticityElement*>* _Nonnull)authenticityElementList {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLAuthenticityElement* authenticityElement in authenticityElementList)
        if(authenticityElement != nil)
            [output addObject:[self generateRGLAuthenticityElement:authenticityElement]];
    return output;
}

+ (NSMutableDictionary*)generateRGLAuthenticityElement:(RGLAuthenticityElement*)authenticityElement {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"status"] = [NSNumber numberWithInteger:authenticityElement.status];
    output[@"elementType"] = [NSNumber numberWithInteger:authenticityElement.elementType];
    output[@"elementTypeName"] = authenticityElement.elementTypeName;
    output[@"elementDiagnose"] = [NSNumber numberWithInteger:authenticityElement.elementDiagnose];
    output[@"elementDiagnoseName"] = authenticityElement.elementDiagnoseName;

    return output;
}

+ (NSMutableDictionary*)generateImageQualityGroup:(RGLImageQualityGroup*)imageQualityGroup {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"count"] = [NSNumber numberWithInteger:imageQualityGroup.count];
    output[@"result"] = [NSNumber numberWithInteger:imageQualityGroup.result];
    if(imageQualityGroup.imageQualityList != nil)
        output[@"imageQualityList"] = [self generateImageQualityList:imageQualityGroup.imageQualityList];

    return output;
}

+(NSMutableArray*)generateImageQualityList:(NSArray<RGLImageQuality*>* _Nonnull)imageQualityList {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLImageQuality* imageQuality in imageQualityList)
        if(imageQuality != nil)
            [output addObject:[self generateImageQuality:imageQuality]];
    return output;
}

+(NSMutableDictionary*)generateImageQuality:(RGLImageQuality*)imageQuality {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"type"] = [NSNumber numberWithInteger:imageQuality.type];
    output[@"result"] = [NSNumber numberWithInteger:imageQuality.result];
    output[@"featureType"] = [NSNumber numberWithInteger:imageQuality.featureType];

    return output;
}

+(NSMutableDictionary*)generateDocumentReaderGraphicResult:(RGLDocumentReaderGraphicResult*)documentReaderGraphicResult {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    if(documentReaderGraphicResult.fields != nil)
        output[@"fields"] = [self generateNSArrayDocumentReaderGraphicResultGroup:documentReaderGraphicResult.fields];

    return output;
}

+(NSMutableArray*)generateNSArrayDocumentReaderGraphicResultGroup:(NSArray<RGLDocumentReaderGraphicField*>* _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLDocumentReaderGraphicField* documentReaderGraphicField in list)
        if(documentReaderGraphicField != nil)
            [output addObject:[self generateDocumentReaderGraphicField:documentReaderGraphicField]];
    return output;
}

+(NSMutableDictionary*)generateDocumentReaderGraphicField:(RGLDocumentReaderGraphicField*)documentReaderGraphicField {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"sourceType"] = [NSNumber numberWithInteger:documentReaderGraphicField.sourceType];
    output[@"fieldType"] = [NSNumber numberWithInteger:documentReaderGraphicField.fieldType];
    output[@"fieldName"] = documentReaderGraphicField.fieldName;
    output[@"lightType"] = [NSNumber numberWithInteger:documentReaderGraphicField.lightType];
    output[@"lightName"] = documentReaderGraphicField.lightName;
    NSData *imageData = UIImageJPEGRepresentation(documentReaderGraphicField.value, 1.0);
    NSString * base64String = [imageData base64EncodedStringWithOptions:0];
    output[@"value"] = base64String;
    output[@"pageIndex"] = [NSNumber numberWithInteger:documentReaderGraphicField.pageIndex];
    output[@"fieldRect"] = [self generateCGRect:documentReaderGraphicField.boundRect];

    return output;
}

+(NSMutableDictionary*)generateCGRect:(CGRect)cgRect {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"top"] = @(cgRect.origin.y);
    output[@"left"] = @(cgRect.origin.x);
    output[@"bottom"] = @(cgRect.origin.y+cgRect.size.height);
    output[@"right"] = @(cgRect.origin.x+cgRect.size.width);

    return output;
}

+(NSMutableDictionary*)generateDocumentReaderTextResult:(RGLDocumentReaderTextResult*)documentReaderTextResult {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"status"] = [NSNumber numberWithInteger:documentReaderTextResult.status];
    if(documentReaderTextResult.fields != nil)
        output[@"fields"] = [self generateNSArrayDocumentReaderTextField:documentReaderTextResult.fields];

    return output;
}

+(NSMutableArray*)generateNSArrayDocumentReaderTextField:(NSArray<RGLDocumentReaderTextField*>* _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLDocumentReaderTextField* documentReaderTextField in list)
        if(documentReaderTextField != nil)
            [output addObject:[self generateDocumentReaderTextField:documentReaderTextField]];
    return output;
}

+(NSMutableDictionary*)generateDocumentReaderTextField:(RGLDocumentReaderTextField*)documentReaderTextField {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"fieldType"] = [NSNumber numberWithInteger:documentReaderTextField.fieldType];
    output[@"fieldName"] = documentReaderTextField.fieldName;
    output[@"lcid"] = [NSNumber numberWithInteger:documentReaderTextField.lcid];
    output[@"lcidName"] = [RGLDocumentReaderTextField lcidName:documentReaderTextField.lcid];
    output[@"status"] = [NSNumber numberWithInteger:documentReaderTextField.status];
    if([documentReaderTextField getValue] != nil)
        output[@"value"] = [self generateDocumentReaderValue:[documentReaderTextField getValue]];
    if(documentReaderTextField.values != nil)
        output[@"values"] = [self generateNSArrayDocumentReaderValue:documentReaderTextField.values];

    return output;
}

+(NSMutableArray*)generateNSArrayDocumentReaderValue:(NSArray<RGLDocumentReaderValue*>* _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLDocumentReaderValue* documentReaderValue in list)
        if(documentReaderValue != nil)
            [output addObject:[self generateDocumentReaderValue:documentReaderValue]];
    return output;
}

+(NSMutableDictionary*)generateDocumentReaderValue:(RGLDocumentReaderValue*)documentReaderValue {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"sourceType"] = [NSNumber numberWithInteger:documentReaderValue.sourceType];
    output[@"value"] = documentReaderValue.value;
    output[@"originalValue"] = documentReaderValue.originalValue;
    output[@"boundRect"] = [self generateCGRect:documentReaderValue.boundRect];
    output[@"validity"] = [NSNumber numberWithInteger:documentReaderValue.validity];
    output[@"pageIndex"] = [NSNumber numberWithInteger:documentReaderValue.pageIndex];
    output[@"probability"] = [NSNumber numberWithInteger:documentReaderValue.probability];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for(NSNumber* key in documentReaderValue.comparison)
        dict[[key stringValue]] = documentReaderValue.comparison[key];
    output[@"comparison"] = dict;

    return output;
}

+(NSMutableArray*)generateNSArrayDocumentReaderDocumentType:(NSArray<RGLDocumentReaderDocumentType*>* _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(RGLDocumentReaderDocumentType* documentReaderDocumentType in list)
        if(documentReaderDocumentType != nil)
            [output addObject:[self generateDocumentReaderDocumentType:documentReaderDocumentType]];
    return output;
}

+(NSMutableDictionary*)generateDocumentReaderDocumentType:(RGLDocumentReaderDocumentType*)documentReaderDocumentType {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"name"] = documentReaderDocumentType.name;
    output[@"documentID"] = [NSNumber numberWithInteger:documentReaderDocumentType.documentID];
    output[@"ICAOCode"] = documentReaderDocumentType.ICAOCode;
    output[@"dType"] = [NSNumber numberWithInteger:documentReaderDocumentType.dType];
    output[@"dFormat"] = [NSNumber numberWithInteger:documentReaderDocumentType.dFormat];
    output[@"dMRZ"] = [NSNumber numberWithBool:documentReaderDocumentType.dMRZ];
    output[@"dDescription"] = documentReaderDocumentType.dDescription;
    output[@"dYear"] = documentReaderDocumentType.dYear;
    output[@"dCountryName"] = documentReaderDocumentType.dCountryName;
    output[@"pageIndex"] = [NSNumber numberWithInteger:documentReaderDocumentType.pageIndex];
    if(documentReaderDocumentType.FDSID != nil)
        output[@"FDSID"] = [self generateNSArrayNSNumber:documentReaderDocumentType.FDSID];

    return output;
}

+(NSMutableArray*)generateNSArrayNSNumber:(NSArray<NSNumber*>* _Nonnull)list {
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for(NSNumber* number in list)
        [output addObject:number];
    return output;
}

+(NSString*)generateScenario:(RGLScenario*)scenario {
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];

    output[@"name"] = scenario.identifier;
    output[@"frame"] = [NSNumber numberWithInteger:scenario.frame];
    output[@"frameKWHLandscape"] = [NSNumber numberWithDouble: scenario.frameKWHLandscape];
    output[@"frameKWHPortrait"] = [NSNumber numberWithDouble: scenario.frameKWHPortrait];
    output[@"frameKWHDoublePageSpreadPortrait"] = [NSNumber numberWithDouble: scenario.frameKWHDoublePageSpreadPortrait];
    output[@"frameKWHDoublePageSpreadLandscape"] = [NSNumber numberWithDouble: scenario.frameKWHDoublePageSpreadLandscape];
    output[@"description"] = scenario.scenarioDescription;
    output[@"barcodeExt"] = [NSNumber numberWithBool:scenario.barcodeExt];
    output[@"faceExt"] = [NSNumber numberWithBool:scenario.faceExt];
    output[@"multiPageOff"] = [NSNumber numberWithBool:scenario.multiPageOff];
    output[@"seriesProcessMode"] = [NSNumber numberWithBool:scenario.seriesProcessMode];
    output[@"caption"] = scenario.caption;
    output[@"uvTorch"] = [NSNumber numberWithBool:scenario.uvTorch];
    output[@"frameOrientation"] = [NSNumber numberWithInteger:scenario.frameOrientation];

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:output options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+(NSMutableDictionary*)generateRGLRFIDSessionData:(RGLRFIDSessionData*)rfidSessionData {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"totalBytesReceived"] = [NSNumber numberWithInteger:rfidSessionData.totalBytesReceived];
    output[@"totalBytesSent"] = [NSNumber numberWithInteger:rfidSessionData.totalBytesSent];
    output[@"processTime"] = [NSNumber numberWithDouble:rfidSessionData.processTime];
    output[@"status"] = [NSNumber numberWithInteger:rfidSessionData.status];
    output[@"extLeSupport"] = [NSNumber numberWithInteger:rfidSessionData.extLeSupport];
    if(rfidSessionData.cardProperties != nil)
        output[@"cardProperties"] = [self generateRGLCardProperties:rfidSessionData.cardProperties];
    if(rfidSessionData.sessionDataStatus != nil)
        output[@"sessionDataStatus"] = [self generateRGLRFIDSessionDataStatus:rfidSessionData.sessionDataStatus];
    if(rfidSessionData.accessControls != nil)
        output[@"accessControls"] = [self generateNSArrayRGLAccessControlProcedureType:rfidSessionData.accessControls];
    if(rfidSessionData.applications != nil)
        output[@"applications"] = [self generateNSArrayRGLApplication:rfidSessionData.applications];
    if(rfidSessionData.securityObjects != nil)
        output[@"securityObjects"] = [self generateNSArrayRGLSecurityObject:rfidSessionData.securityObjects];

    return output;
}

+(NSMutableDictionary*)generateRGLCardProperties:(RGLCardProperties*)cardProperties {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"aTQA"] = [NSNumber numberWithInteger:cardProperties.aTQA];
    output[@"bitRateR"] = [NSNumber numberWithInteger:cardProperties.bitRateR];
    output[@"bitRateS"] = [NSNumber numberWithInteger:cardProperties.bitRateS];
    output[@"chipTypeA"] = [NSNumber numberWithInteger:cardProperties.chipTypeA];
    output[@"mifareMemory"] = [NSNumber numberWithInteger:cardProperties.mifareMemory];
    output[@"rfidType"] = [NSNumber numberWithInteger:cardProperties.rfidType];
    output[@"sAK"] = [NSNumber numberWithInteger:cardProperties.sAK];
    output[@"aTQB"] = cardProperties.aTQB;
    output[@"aTR"] = cardProperties.aTR;
    output[@"baudrate1"] = cardProperties.baudrate1;
    output[@"baudrate2"] = cardProperties.baudrate2;
    output[@"uID"] = cardProperties.uID;
    output[@"support4"] = [NSNumber numberWithBool:cardProperties.support4];
    output[@"supportMifare"] = [NSNumber numberWithBool:cardProperties.supportMifare];

    return output;
}

+(NSMutableDictionary*)generateRGLRFIDSessionDataStatus:(RGLRFIDSessionDataStatus*)sessionDataStatus {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"AA"] = [NSNumber numberWithInteger:sessionDataStatus.AA];
    output[@"BAC"] = [NSNumber numberWithInteger:sessionDataStatus.BAC];
    output[@"CA"] = [NSNumber numberWithInteger:sessionDataStatus.CA];
    output[@"PA"] = [NSNumber numberWithInteger:sessionDataStatus.PA];
    output[@"PACE"] = [NSNumber numberWithInteger:sessionDataStatus.PACE];
    output[@"TA"] = [NSNumber numberWithInteger:sessionDataStatus.TA];
    output[@"overallStatus"] = [NSNumber numberWithInteger:sessionDataStatus.overallStatus];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLAccessControlProcedureType:(NSArray<RGLAccessControlProcedureType*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLAccessControlProcedureType* item in list)
        if(item != nil)
            [output addObject:[self generateRGLAccessControlProcedureType:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLAccessControlProcedureType:(RGLAccessControlProcedureType*)accessControlProcedureType {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"activeOptionIdx"] = [NSNumber numberWithInteger:accessControlProcedureType.activeOptionIdx];
    output[@"status"] = [NSNumber numberWithInteger:accessControlProcedureType.status];
    output[@"type"] = [NSNumber numberWithInteger:accessControlProcedureType.type];
    if(accessControlProcedureType.notifications != nil)
        output[@"notifications"] = [self generateNSArrayNSNumber:accessControlProcedureType.notifications];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLApplication:(NSArray<RGLApplication*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLApplication* item in list)
        if(item != nil)
            [output addObject:[self generateRGLApplication:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLApplication:(RGLApplication*)application {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"applicationID"] = application.applicationID;
    output[@"dataHashAlgorithm"] = application.dataHashAlgorithm;
    output[@"unicodeVersion"] = application.unicodeVersion;
    output[@"version"] = application.version;
    output[@"type"] = [NSNumber numberWithInteger:application.type];
    output[@"status"] = [NSNumber numberWithInteger:application.status];
    if(application.files != nil)
        output[@"files"] = [self generateNSArrayRGLFile:application.files];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLFile:(NSArray<RGLFile*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLFile* item in list)
        if(item != nil)
            [output addObject:[self generateRGLFile:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLFile:(RGLFile*)file {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"fileID"] = file.fileID;
    output[@"typeName"] = file.typeName;
    output[@"pAStatus"] = [NSNumber numberWithInteger:file.pAStatus];
    output[@"readingStatus"] = [NSNumber numberWithInteger:file.readingStatus];
    output[@"readingTime"] = [NSNumber numberWithInteger:file.readingTime];
    output[@"type"] = [NSNumber numberWithInteger:file.type];
    if(file.notifications != nil)
        output[@"notifications"] = [self generateNSArrayNSNumber:file.notifications];
    if(file.docFieldsText != nil)
        output[@"docFieldsText"] = [self generateNSArrayNSNumber:file.docFieldsText];
    if(file.docFieldsGraphics != nil)
        output[@"docFieldsGraphics"] = [self generateNSArrayNSNumber:file.docFieldsGraphics];
    if(file.docFieldsOriginals != nil)
        output[@"docFieldsOriginals"] = [self generateNSArrayNSNumber:file.docFieldsOriginals];
    if(file.fileData != nil)
        output[@"fileData"] = [self generateRGLFileData:file.fileData];
    if(file.certificates != nil)
        output[@"certificates"] = [self generateRGLSecurityObjectCertificates:file.certificates];

    return output;
}

+(NSMutableDictionary*)generateRGLFileData:(RGLFileData*)fileData {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"data"] = fileData.data;
    output[@"length"] = [NSNumber numberWithInteger:fileData.length];
    output[@"type"] = [NSNumber numberWithInteger:fileData.type];
    output[@"status"] = [NSNumber numberWithDouble:fileData.status];

    return output;
}

+(NSMutableDictionary*)generateRGLSecurityObjectCertificates:(RGLSecurityObjectCertificates*)certificates {
    NSMutableDictionary *output = [NSMutableDictionary new];

    if(certificates.securityObject != nil)
        output[@"securityObject"] = [self generateRGLCertificateData:certificates.securityObject];

    return output;
}

+(NSMutableDictionary*)generateRGLCertificateData:(RGLCertificateData*)certificateData {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"data"] = certificateData.data;
    output[@"length"] = [NSNumber numberWithInteger:certificateData.length];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLSecurityObject:(NSArray<RGLSecurityObject*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLSecurityObject* item in list)
        if(item != nil)
            [output addObject:[self generateRGLSecurityObject:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLSecurityObject:(RGLSecurityObject*)securityObject {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"objectType"] = securityObject.objectType;
    output[@"fileReference"] = [NSNumber numberWithInteger:securityObject.fileReference];
    if(securityObject.signerInfos != nil)
        output[@"signerInfos"] = [self generateNSArrayRGLSignerInfo:securityObject.signerInfos];
    if(securityObject.notifications != nil)
        output[@"notifications"] = [self generateNSArrayNSNumber:securityObject.notifications];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLSignerInfo:(NSArray<RGLSignerInfo*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLSignerInfo* item in list)
        if(item != nil)
            [output addObject:[self generateRGLSignerInfo:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLSignerInfo:(RGLSignerInfo*)signerInfo {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"dataToHash"] = signerInfo.dataToHash;
    output[@"digestAlgorithm"] = signerInfo.digestAlgorithm;
    output[@"signatureAlgorithm"] = signerInfo.signatureAlgorithm;
    output[@"version"] = [NSNumber numberWithInteger:signerInfo.version];
    output[@"paStatus"] = [NSNumber numberWithDouble:signerInfo.paStatus];
    if(signerInfo.notifications != nil)
        output[@"notifications"] = [self generateNSArrayNSNumber:signerInfo.notifications];
    if(signerInfo.issuer != nil)
        output[@"issuer"] = [self generateRGLAuthority:signerInfo.issuer];
    if(signerInfo.serialNumber != nil)
        output[@"serialNumber"] = [self generateRGLRFIDValue:signerInfo.serialNumber];
    if(signerInfo.signature != nil)
        output[@"signature"] = [self generateRGLRFIDValue:signerInfo.signature];
    if(signerInfo.subjectKeyIdentifier != nil)
        output[@"subjectKeyIdentifier"] = [self generateRGLRFIDValue:signerInfo.subjectKeyIdentifier];
    if(signerInfo.signedAttributes != nil)
        output[@"signedAttributes"] = [self generateNSArrayRGLExtension:signerInfo.signedAttributes];
    if(signerInfo.certificateChain != nil)
        output[@"certificateChain"] = [self generateNSArrayRGLCertificateChain:signerInfo.certificateChain];

    return output;
}

+(NSMutableDictionary*)generateRGLAuthority:(RGLAuthority*)authority {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"data"] = authority.data;
    if(authority.friendlyName != nil)
        output[@"friendlyName"] = [self generateRGLRFIDValue:authority.friendlyName];
    if(authority.attributes != nil)
        output[@"attributes"] = [self generateNSArrayRGLAttribute:authority.attributes];

    return output;
}

+(NSMutableDictionary*)generateRGLRFIDValue:(RGLRFIDValue*)value {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"data"] = value.data;
    output[@"format"] = value.format;
    output[@"length"] = [NSNumber numberWithInteger:value.length];
    output[@"type"] = [NSNumber numberWithInteger:value.type];
    output[@"status"] = [NSNumber numberWithDouble:value.status];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLAttribute:(NSArray<RGLAttribute*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLAttribute* item in list)
        if(item != nil)
            [output addObject:[self generateRGLAttribute:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLAttribute:(RGLAttribute*)attribute {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"type"] = attribute.type;
    if(attribute.value != nil)
        output[@"value"] = [self generateRGLRFIDValue:attribute.value];

    return output;
}

+(NSMutableArray*)generateNSArrayRGLExtension:(NSArray<RGLExtension*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLExtension* item in list)
        if(item != nil)
            [output addObject:[self generateRGLExtension:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLExtension:(RGLExtension*)extension {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"data"] = extension.data;
    output[@"type"] = extension.type;

    return output;
}

+(NSMutableArray*)generateNSArrayRGLCertificateChain:(NSArray<RGLCertificateChain*>*)list {
    NSMutableArray *output = [NSMutableArray new];
    for(RGLCertificateChain* item in list)
        if(item != nil)
            [output addObject:[self generateRGLCertificateChain:item]];
    return output;
}

+(NSMutableDictionary*)generateRGLCertificateChain:(RGLCertificateChain*)certificateChain {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"serialNumber"] = certificateChain.serialNumber;
    output[@"signatureAlgorithm"] = certificateChain.signatureAlgorithm;
    output[@"subjectPKAlgorithm"] = certificateChain.subjectPKAlgorithm;
    output[@"origin"] = [NSNumber numberWithInteger:certificateChain.origin];
    output[@"version"] = [NSNumber numberWithInteger:certificateChain.version];
    output[@"type"] = [NSNumber numberWithInteger:certificateChain.type];
    output[@"paStatus"] = [NSNumber numberWithDouble:certificateChain.paStatus];
    if(certificateChain.notifications != nil)
        output[@"notifications"] = [self generateNSArrayNSNumber:certificateChain.notifications];
    if(certificateChain.fileName != nil)
        output[@"fileName"] = [self generateRGLRFIDValue:certificateChain.fileName];
    if(certificateChain.issuer != nil)
        output[@"issuer"] = [self generateRGLAuthority:certificateChain.issuer];
    if(certificateChain.subject != nil)
        output[@"subject"] = [self generateRGLAuthority:certificateChain.subject];
    if(certificateChain.extensions != nil)
        output[@"extensions"] = [self generateNSArrayRGLExtension:certificateChain.extensions];
    if(certificateChain.validity != nil)
        output[@"validity"] = [self generateRGLValidity:certificateChain.validity];

    return output;
}

+(NSMutableDictionary*)generateRGLValidity:(RGLValidity*)validity {
    NSMutableDictionary *output = [NSMutableDictionary new];

    if(validity.notAfter != nil)
        output[@"fileName"] = [self generateRGLRFIDValue:validity.notAfter];
    if(validity.notBefore != nil)
        output[@"fileName"] = [self generateRGLRFIDValue:validity.notBefore];

    return output;
}

+(RGLPKDCertificate*)RGLPKDCertificateFromJson:(NSDictionary*)dict {
    NSInteger type = [[dict valueForKey:@"resourceType"] integerValue];
    NSData* binaryData = [[NSData alloc] initWithBase64EncodedString:[dict objectForKey:@"binaryData"] options:0];
    NSData* privateKey = [dict objectForKey:@"privateKey"] != nil ? [[NSData alloc] initWithBase64EncodedString:[dict objectForKey:@"privateKey"] options:0] : nil;

    return [[RGLPKDCertificate alloc] initWithBinaryData:binaryData resourceType:type privateKey:privateKey];
}

+(NSInteger)generateDocReaderAction:(RGLDocReaderAction)action {
    NSInteger output = 0;
    switch (action) {
        case RGLDocReaderActionComplete:
            output = 1;
            break;
        case RGLDocReaderActionProcess:
            output = 0;
            break;
        case RGLDocReaderActionMorePagesAvailable:
            output = 8;
            break;
        case RGLDocReaderActionCancel:
            output = 2;
            break;
        case RGLDocReaderActionError:
            output = 3;
            break;
        default:
            break;
    }

    return output;
}

+(NSInteger)generateRFIDCompleteAction:(RGLRFIDCompleteAction)action {
    NSInteger output = 0;
    switch (action) {
        case RGLRFIDCompleteActionComplete:
            output = 10;
            break;
        case RGLRFIDCompleteActionError:
            output = 3;
            break;
        case RGLRFIDCompleteActionCancel:
            output = 2;
            break;
        case RGLRFIDCompleteActionSessionRestarted:
            output = 1;
            break;
        default:
            break;
    }

    return output;
}

+(NSInteger)generateRFIDNotificationAction:(RGLRFIDNotificationAction)action {
    return 5;
}

+(NSString*)generateCompletion:(NSInteger)action :(RGLDocumentReaderResults*)results :(NSError*)error :(RGLRFIDNotify*)notify {
    NSMutableDictionary *output = [NSMutableDictionary new];

    switch (action) {
        case 0:
            output[@"results"] = [self generateResultsWithNotification:[self generateRFIDNotify:notify]];
            break;
        case 1:
            output[@"results"] = [self generateResults:results];
            break;
        case 2:
            output[@"results"] = [self generateResults:results];
            break;
        case 3:
            output[@"results"] = [self generateResults:results];
            break;
        case 5:
            output[@"results"] = [self generateResultsWithNotification:[self generateRFIDNotify:notify]];
            break;
        case 6:
            output[@"results"] = [self generateResultsWithNotification:[self generateRFIDNotify:notify]];
            break;
        case 8:
            output[@"results"] = [self generateResults:results];
            break;
        case 10:
            output[@"results"] = [self generateResultsWithRFID :results :1];
            action = 1;
            break;
        default:
            break;
    }

    output[@"action"] = [NSNumber numberWithInteger:action];
    output[@"error"] = [self generateNSError:error];

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:output options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

+(NSMutableDictionary*)generateResultsWithNotification:(NSMutableDictionary*)dict {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"documentReaderNotification"] = dict;

    return output;
}

+(NSMutableDictionary*)generateResultsWithRFID:(RGLDocumentReaderResults*)results :(NSInteger)rfidResult {
    NSMutableDictionary *output = [self generateResults:results];

    output[@"rfidResult"] = [NSNumber numberWithInteger:rfidResult];

    return output;
}

+(NSMutableDictionary*)generateNSError:(NSError*)error {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"code"] = [NSNumber numberWithInteger: error.code];
    output[@"domain"] = error.domain;

    return output;
}

+(NSMutableDictionary*)generateRFIDNotify:(RGLRFIDNotify*)notify {
    NSMutableDictionary *output = [NSMutableDictionary new];

    output[@"code"] = [NSNumber numberWithInteger:notify.code];
    output[@"number"] = [NSNumber numberWithInt:notify.number];
    output[@"value"] = [NSNumber numberWithDouble:notify.value];

    return output;
}

@end
