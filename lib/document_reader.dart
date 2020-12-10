import 'dart:async';
import 'package:flutter/services.dart';

// Classes

class Scenario {
  int frame;
  int frameOrientation;
  bool uvTorch;
  bool barcodeExt;
  bool faceExt;
  bool multiPageOff;
  bool seriesProcessMode;
  double frameKWHLandscape;
  double frameKWHPortrait;
  double frameKWHDoublePageSpreadPortrait;
  double frameKWHDoublePageSpreadLandscape;
  String name;
  String caption;
  String description;

  static Scenario fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Scenario();

    result.frame = jsonObject["frame"];
    result.frameOrientation = jsonObject["frameOrientation"];
    result.uvTorch = jsonObject["uvTorch"];
    result.barcodeExt = jsonObject["barcodeExt"];
    result.faceExt = jsonObject["faceExt"];
    result.multiPageOff = jsonObject["multiPageOff"];
    result.seriesProcessMode = jsonObject["seriesProcessMode"];
    result.frameKWHLandscape = jsonObject["frameKWHLandscape"] == null ? null : jsonObject["frameKWHLandscape"].toDouble();
    result.frameKWHPortrait = jsonObject["frameKWHPortrait"] == null ? null : jsonObject["frameKWHPortrait"].toDouble();
    result.frameKWHDoublePageSpreadPortrait = jsonObject["frameKWHDoublePageSpreadPortrait"] == null ? null : jsonObject["frameKWHDoublePageSpreadPortrait"].toDouble();
    result.frameKWHDoublePageSpreadLandscape = jsonObject["frameKWHDoublePageSpreadLandscape"] == null ? null : jsonObject["frameKWHDoublePageSpreadLandscape"].toDouble();
    result.name = jsonObject["name"];
    result.caption = jsonObject["caption"];
    result.description = jsonObject["description"];

    return result;
  }
}

class Rect {
  int bottom;
  int top;
  int left;
  int right;

  static Rect fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Rect();

    result.bottom = jsonObject["bottom"];
    result.top = jsonObject["top"];
    result.left = jsonObject["left"];
    result.right = jsonObject["right"];

    return result;
  }
}

class DocumentReaderGraphicField {
  int sourceType;
  int fieldType;
  int lightType;
  int pageIndex;
  String fieldName;
  String lightName;
  String value;
  Rect fieldRect;

  static DocumentReaderGraphicField fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderGraphicField();

    result.sourceType = jsonObject["sourceType"];
    result.fieldType = jsonObject["fieldType"];
    result.lightType = jsonObject["lightType"];
    result.pageIndex = jsonObject["pageIndex"];
    result.fieldName = jsonObject["fieldName"];
    result.lightName = jsonObject["lightName"];
    result.value = jsonObject["value"];
    result.fieldRect = Rect.fromJson(jsonObject["fieldRect"]);

    return result;
  }
}

class DocumentReaderGraphicResult {
  List<DocumentReaderGraphicField> fields = [];

  static DocumentReaderGraphicResult fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderGraphicResult();

    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderGraphicField.fromJson(item));

    return result;
  }
}

class DocumentReaderValue {
  int pageIndex;
  int sourceType;
  int validity;
  int probability;
  String value;
  String originalValue;
  Rect boundRect;
  Map<int, int> comparison = {};

  static DocumentReaderValue fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderValue();

    result.pageIndex = jsonObject["pageIndex"];
    result.sourceType = jsonObject["sourceType"];
    result.validity = jsonObject["validity"];
    result.probability = jsonObject["probability"];
    result.value = jsonObject["value"];
    result.originalValue = jsonObject["originalValue"];
    result.boundRect = Rect.fromJson(jsonObject["boundRect"]);
    if (jsonObject["comparison"] != null)
      jsonObject["comparison"].forEach((k, v) => result.comparison[int.parse(k)] = v);

    return result;
  }
}

class DocumentReaderTextField {
  int fieldType;
  int lcid;
  int status;
  String lcidName;
  String fieldName;
  DocumentReaderValue value;
  List<DocumentReaderValue> values = [];

  static DocumentReaderTextField fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextField();

    result.fieldType = jsonObject["fieldType"];
    result.lcid = jsonObject["lcid"];
    result.status = jsonObject["status"];
    result.lcidName = jsonObject["lcidName"];
    result.fieldName = jsonObject["fieldName"];
    result.value = DocumentReaderValue.fromJson(jsonObject["value"]);
    if (jsonObject["values"] != null)
      for (var item in jsonObject["values"])
        result.values.add(DocumentReaderValue.fromJson(item));

    return result;
  }
}

class DocumentReaderTextResult {
  int status;
  List<DocumentReaderTextField> fields = [];

  static DocumentReaderTextResult fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextResult();

    result.status = jsonObject["status"];
    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderTextField.fromJson(item));

    return result;
  }
}

class Coordinate {
  int x;
  int y;

  static Coordinate fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Coordinate();

    result.x = jsonObject["x"];
    result.y = jsonObject["y"];

    return result;
  }
}

class ElementPosition {
  int docFormat;
  int width;
  int height;
  int dpi;
  int pageIndex;
  int inverse;
  int perspectiveTr;
  int objArea;
  int objIntAngleDev;
  int resultStatus;
  double angle;
  Coordinate center;
  Coordinate leftTop;
  Coordinate leftBottom;
  Coordinate rightTop;
  Coordinate rightBottom;

  static ElementPosition fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ElementPosition();

    result.docFormat = jsonObject["docFormat"];
    result.width = jsonObject["width"];
    result.height = jsonObject["height"];
    result.dpi = jsonObject["dpi"];
    result.pageIndex = jsonObject["pageIndex"];
    result.inverse = jsonObject["inverse"];
    result.perspectiveTr = jsonObject["perspectiveTr"];
    result.objArea = jsonObject["objArea"];
    result.objIntAngleDev = jsonObject["objIntAngleDev"];
    result.resultStatus = jsonObject["resultStatus"];
    result.angle = jsonObject["angle"] == null ? null : jsonObject["angle"].toDouble();
    result.center = Coordinate.fromJson(jsonObject["center"]);
    result.leftTop = Coordinate.fromJson(jsonObject["leftTop"]);
    result.leftBottom = Coordinate.fromJson(jsonObject["leftBottom"]);
    result.rightTop = Coordinate.fromJson(jsonObject["rightTop"]);
    result.rightBottom = Coordinate.fromJson(jsonObject["rightBottom"]);

    return result;
  }
}

class ImageQuality {
  int featureType;
  int result;
  int type;

  static ImageQuality fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQuality();

    result.featureType = jsonObject["featureType"];
    result.result = jsonObject["result"];
    result.type = jsonObject["type"];

    return result;
  }
}

class ImageQualityGroup {
  int count;
  int result;
  List<ImageQuality> imageQualityList = [];

  static ImageQualityGroup fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQualityGroup();

    result.count = jsonObject["count"];
    result.result = jsonObject["result"];
    if (jsonObject["imageQualityList"] != null)
      for (var item in jsonObject["imageQualityList"])
        result.imageQualityList.add(ImageQuality.fromJson(item));

    return result;
  }
}

class DocumentReaderDocumentType {
  int pageIndex;
  int documentID;
  int dType;
  int dFormat;
  bool dMRZ;
  String name;
  String ICAOCode;
  String dDescription;
  String dYear;
  String dCountryName;
  List<int> FDSID = [];

  static DocumentReaderDocumentType fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderDocumentType();

    result.pageIndex = jsonObject["pageIndex"];
    result.documentID = jsonObject["documentID"];
    result.dType = jsonObject["dType"];
    result.dFormat = jsonObject["dFormat"];
    result.dMRZ = jsonObject["dMRZ"];
    result.name = jsonObject["name"];
    result.ICAOCode = jsonObject["ICAOCode"];
    result.dDescription = jsonObject["dDescription"];
    result.dYear = jsonObject["dYear"];
    result.dCountryName = jsonObject["dCountryName"];
    if (jsonObject["FDSID"] != null)
      for (var item in jsonObject["FDSID"])
        result.FDSID.add(item);

    return result;
  }
}

class DocumentReaderNotification {
  int code;
  int value;
  int number;

  static DocumentReaderNotification fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderNotification();

    result.code = jsonObject["code"];
    result.value = jsonObject["value"];
    result.number = jsonObject["number"];

    return result;
  }
}

class AccessControlProcedureType {
  int activeOptionIdx;
  int type;
  int status;
  List<int> notifications = [];

  static AccessControlProcedureType fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new AccessControlProcedureType();

    result.activeOptionIdx = jsonObject["activeOptionIdx"];
    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);

    return result;
  }
}

class FileData {
  int length;
  int type;
  int status;
  String data;

  static FileData fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FileData();

    result.length = jsonObject["length"];
    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.data = jsonObject["data"];

    return result;
  }
}

class CertificateData {
  int length;
  String data;

  static CertificateData fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CertificateData();

    result.length = jsonObject["length"];
    result.data = jsonObject["data"];

    return result;
  }
}

class SecurityObjectCertificates {
  CertificateData securityObject;

  static SecurityObjectCertificates fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SecurityObjectCertificates();

    result.securityObject = CertificateData.fromJson(jsonObject["securityObject"]);

    return result;
  }
}

class File {
  int readingTime;
  int type;
  int pAStatus;
  int readingStatus;
  String fileID;
  FileData fileData;
  SecurityObjectCertificates certificates;
  List<int> docFieldsText = [];
  List<int> docFieldsGraphics = [];
  List<int> docFieldsOriginals = [];
  List<int> notifications = [];

  static File fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new File();

    result.readingTime = jsonObject["readingTime"];
    result.type = jsonObject["type"];
    result.pAStatus = jsonObject["pAStatus"];
    result.readingStatus = jsonObject["readingStatus"];
    result.fileID = jsonObject["fileID"];
    result.fileData = FileData.fromJson(jsonObject["fileData"]);
    result.certificates = SecurityObjectCertificates.fromJson(jsonObject["certificates"]);
    if (jsonObject["docFieldsText"] != null)
      for (var item in jsonObject["docFieldsText"])
        result.docFieldsText.add(item);
    if (jsonObject["docFieldsGraphics"] != null)
      for (var item in jsonObject["docFieldsGraphics"])
        result.docFieldsGraphics.add(item);
    if (jsonObject["docFieldsOriginals"] != null)
      for (var item in jsonObject["docFieldsOriginals"])
        result.docFieldsOriginals.add(item);
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);

    return result;
  }
}

class Application {
  int type;
  int status;
  String applicationID;
  String dataHashAlgorithm;
  String unicodeVersion;
  String version;
  List<File> files = [];

  static Application fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Application();

    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.applicationID = jsonObject["applicationID"];
    result.dataHashAlgorithm = jsonObject["dataHashAlgorithm"];
    result.unicodeVersion = jsonObject["unicodeVersion"];
    result.version = jsonObject["version"];
    if (jsonObject["files"] != null)
      for (var item in jsonObject["files"])
        result.files.add(File.fromJson(item));

    return result;
  }
}

class Value {
  int length;
  int type;
  int status;
  String data;
  String format;

  static Value fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Value();

    result.length = jsonObject["length"];
    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.data = jsonObject["data"];
    result.format = jsonObject["format"];

    return result;
  }
}

class Attribute {
  String type;
  Value value;

  static Attribute fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Attribute();

    result.type = jsonObject["type"];
    result.value = Value.fromJson(jsonObject["value"]);

    return result;
  }
}

class Authority {
  String data;
  Value friendlyName;
  List<Attribute> attributes = [];

  static Authority fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Authority();

    result.data = jsonObject["data"];
    result.friendlyName = Value.fromJson(jsonObject["friendlyName"]);
    if (jsonObject["attributes"] != null)
      for (var item in jsonObject["attributes"])
        result.attributes.add(Attribute.fromJson(item));

    return result;
  }
}

class Extension {
  String data;
  String type;

  static Extension fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Extension();

    result.data = jsonObject["data"];
    result.type = jsonObject["type"];

    return result;
  }
}

class Validity {
  Value notAfter;
  Value notBefore;

  static Validity fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Validity();

    result.notAfter = Value.fromJson(jsonObject["notAfter"]);
    result.notBefore = Value.fromJson(jsonObject["notBefore"]);

    return result;
  }
}

class CertificateChain {
  int origin;
  int type;
  int version;
  int paStatus;
  String serialNumber;
  String signatureAlgorithm;
  String subjectPKAlgorithm;
  Value fileName;
  Validity validity;
  Authority issuer;
  Authority subject;
  List<int> notifications = [];
  List<Extension> extensions = [];

  static CertificateChain fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CertificateChain();

    result.origin = jsonObject["origin"];
    result.type = jsonObject["type"];
    result.version = jsonObject["version"];
    result.paStatus = jsonObject["paStatus"];
    result.serialNumber = jsonObject["serialNumber"];
    result.signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result.subjectPKAlgorithm = jsonObject["subjectPKAlgorithm"];
    result.fileName = Value.fromJson(jsonObject["fileName"]);
    result.validity = Validity.fromJson(jsonObject["validity"]);
    result.issuer = Authority.fromJson(jsonObject["issuer"]);
    result.subject = Authority.fromJson(jsonObject["subject"]);
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);
    if (jsonObject["extensions"] != null)
      for (var item in jsonObject["extensions"])
        result.extensions.add(Extension.fromJson(item));

    return result;
  }
}

class SignerInfo {
  int version;
  int paStatus;
  String dataToHash;
  String digestAlgorithm;
  String signatureAlgorithm;
  Value serialNumber;
  Value signature;
  Value subjectKeyIdentifier;
  Authority issuer;
  List<int> notifications = [];
  List<Extension> signedAttributes = [];
  List<CertificateChain> certificateChain = [];

  static SignerInfo fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SignerInfo();

    result.version = jsonObject["version"];
    result.paStatus = jsonObject["paStatus"];
    result.dataToHash = jsonObject["dataToHash"];
    result.digestAlgorithm = jsonObject["digestAlgorithm"];
    result.signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result.serialNumber = Value.fromJson(jsonObject["serialNumber"]);
    result.signature = Value.fromJson(jsonObject["signature"]);
    result.subjectKeyIdentifier = Value.fromJson(jsonObject["subjectKeyIdentifier"]);
    result.issuer = Authority.fromJson(jsonObject["issuer"]);
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);
    if (jsonObject["signedAttributes"] != null)
      for (var item in jsonObject["signedAttributes"])
        result.signedAttributes.add(Extension.fromJson(item));
    if (jsonObject["certificateChain"] != null)
      for (var item in jsonObject["certificateChain"])
        result.certificateChain.add(CertificateChain.fromJson(item));

    return result;
  }
}

class SecurityObject {
  int fileReference;
  int version;
  String objectType;
  List<int> notifications = [];
  List<SignerInfo> signerInfos = [];

  static SecurityObject fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SecurityObject();

    result.fileReference = jsonObject["fileReference"];
    result.version = jsonObject["version"];
    result.objectType = jsonObject["objectType"];
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);
    if (jsonObject["signerInfos"] != null)
      for (var item in jsonObject["signerInfos"])
        result.signerInfos.add(SignerInfo.fromJson(item));

    return result;
  }
}

class CardProperties {
  int aTQA;
  int bitRateR;
  int bitRateS;
  int chipTypeA;
  int mifareMemory;
  int rfidType;
  int sAK;
  bool support4;
  bool supportMifare;
  String aTQB;
  String aTR;
  String baudrate1;
  String baudrate2;
  String uID;

  static CardProperties fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CardProperties();

    result.aTQA = jsonObject["aTQA"];
    result.bitRateR = jsonObject["bitRateR"];
    result.bitRateS = jsonObject["bitRateS"];
    result.chipTypeA = jsonObject["chipTypeA"];
    result.mifareMemory = jsonObject["mifareMemory"];
    result.rfidType = jsonObject["rfidType"];
    result.sAK = jsonObject["sAK"];
    result.support4 = jsonObject["support4"];
    result.supportMifare = jsonObject["supportMifare"];
    result.aTQB = jsonObject["aTQB"];
    result.aTR = jsonObject["aTR"];
    result.baudrate1 = jsonObject["baudrate1"];
    result.baudrate2 = jsonObject["baudrate2"];
    result.uID = jsonObject["uID"];

    return result;
  }
}

class RFIDSessionData {
  int totalBytesReceived;
  int totalBytesSent;
  int status;
  int extLeSupport;
  int processTime;
  CardProperties cardProperties;
  RFIDSessionDataStatus sessionDataStatus;
  List<AccessControlProcedureType> accessControls = [];
  List<Application> applications = [];
  List<SecurityObject> securityObjects = [];

  static RFIDSessionData fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RFIDSessionData();

    result.totalBytesReceived = jsonObject["totalBytesReceived"];
    result.totalBytesSent = jsonObject["totalBytesSent"];
    result.status = jsonObject["status"];
    result.extLeSupport = jsonObject["extLeSupport"];
    result.processTime = jsonObject["processTime"];
    result.cardProperties = CardProperties.fromJson(jsonObject["cardProperties"]);
    result.sessionDataStatus = RFIDSessionDataStatus.fromJson(jsonObject["sessionDataStatus"]);
    if (jsonObject["accessControls"] != null)
      for (var item in jsonObject["accessControls"])
        result.accessControls.add(AccessControlProcedureType.fromJson(item));
    if (jsonObject["applications"] != null)
      for (var item in jsonObject["applications"])
        result.applications.add(Application.fromJson(item));
    if (jsonObject["securityObjects"] != null)
      for (var item in jsonObject["securityObjects"])
        result.securityObjects.add(SecurityObject.fromJson(item));

    return result;
  }
}

class DocumentReaderAuthenticityCheck {
  int type;
  int status;
  String typeName;
  int pageIndex;
  List<DocumentReaderAuthenticityElement> elements = [];

  static DocumentReaderAuthenticityCheck fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderAuthenticityCheck();

    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.typeName = jsonObject["typeName"];
    result.pageIndex = jsonObject["pageIndex"];
    if (jsonObject["elements"] != null)
      for (var item in jsonObject["elements"])
        result.elements.add(DocumentReaderAuthenticityElement.fromJson(item));

    return result;
  }
}

class PDF417Info {
  int errorLevel;
  int columns;
  int rows;

  static PDF417Info fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PDF417Info();

    result.errorLevel = jsonObject["errorLevel"];
    result.columns = jsonObject["columns"];
    result.rows = jsonObject["rows"];

    return result;
  }
}

class RFIDSessionDataStatus {
  int AA;
  int BAC;
  int CA;
  int PA;
  int PACE;
  int TA;
  int overallStatus;

  static RFIDSessionDataStatus fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RFIDSessionDataStatus();

    result.AA = jsonObject["AA"];
    result.BAC = jsonObject["BAC"];
    result.CA = jsonObject["CA"];
    result.PA = jsonObject["PA"];
    result.PACE = jsonObject["PACE"];
    result.TA = jsonObject["TA"];
    result.overallStatus = jsonObject["overallStatus"];

    return result;
  }
}

class DocumentReaderBarcodeResult {
  List<DocumentReaderBarcodeField> fields = [];

  static DocumentReaderBarcodeResult fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderBarcodeResult();

    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderBarcodeField.fromJson(item));

    return result;
  }
}

class DocumentReaderBarcodeField {
  int barcodeType;
  int status;
  int pageIndex;
  PDF417Info pdf417Info;
  List<dynamic> data;

  static DocumentReaderBarcodeField fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderBarcodeField();

    result.barcodeType = jsonObject["barcodeType"];
    result.status = jsonObject["status"];
    result.pageIndex = jsonObject["pageIndex"];
    result.pdf417Info = PDF417Info.fromJson(jsonObject["pdf417Info"]);
    result.data = jsonObject["data"];

    return result;
  }
}

class DocumentReaderAuthenticityResult {
  int status;
  List<DocumentReaderAuthenticityCheck> checks = [];

  static DocumentReaderAuthenticityResult fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderAuthenticityResult();

    result.status = jsonObject["status"];
    if (jsonObject["checks"] != null)
      for (var item in jsonObject["checks"])
        result.checks.add(DocumentReaderAuthenticityCheck.fromJson(item));

    return result;
  }
}

class DocumentReaderAuthenticityElement {
  int status;
  int elementType;
  int elementDiagnose;
  String elementTypeName;
  String elementDiagnoseName;

  static DocumentReaderAuthenticityElement fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderAuthenticityElement();

    result.status = jsonObject["status"];
    result.elementType = jsonObject["elementType"];
    result.elementDiagnose = jsonObject["elementDiagnose"];
    result.elementTypeName = jsonObject["elementTypeName"];
    result.elementDiagnoseName = jsonObject["elementDiagnoseName"];

    return result;
  }
}

class DocumentReaderCompletion {
  int action;
  DocumentReaderResults results;
  Throwable error;

  static DocumentReaderCompletion fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderCompletion();

    result.action = jsonObject["action"];
    result.results = DocumentReaderResults.fromJson(jsonObject["results"]);
    result.error = Throwable.fromJson(jsonObject["error"]);

    return result;
  }
}

class Throwable {
  int code;
  String domain;
  String localizedMessage;
  String message;
  String string;
  List<StackTraceElement> stackTrace = [];

  static Throwable fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Throwable();

    result.code = jsonObject["code"];
    result.domain = jsonObject["domain"];
    result.localizedMessage = jsonObject["localizedMessage"];
    result.message = jsonObject["message"];
    result.string = jsonObject["string"];
    if (jsonObject["stackTrace"] != null)
      for (var item in jsonObject["stackTrace"])
        result.stackTrace.add(StackTraceElement.fromJson(item));

    return result;
  }
}

class StackTraceElement {
  int lineNumber;
  bool isNativeMethod;
  String className;
  String fileName;
  String methodName;
  String string;

  static StackTraceElement fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new StackTraceElement();

    result.lineNumber = jsonObject["lineNumber"];
    result.isNativeMethod = jsonObject["isNativeMethod"];
    result.className = jsonObject["className"];
    result.fileName = jsonObject["fileName"];
    result.methodName = jsonObject["methodName"];
    result.string = jsonObject["string"];

    return result;
  }
}

class DocumentReaderResults {
  int chipPage;
  int overallResult;
  int processingFinishedStatus;
  int elapsedTime;
  int elapsedTimeRFID;
  int morePagesAvailable;
  int rfidResult;
  bool highResolution;
  DocumentReaderGraphicResult graphicResult;
  DocumentReaderTextResult textResult;
  ElementPosition documentPosition;
  ElementPosition barcodePosition;
  ElementPosition mrzPosition;
  ImageQualityGroup imageQuality;
  String rawResult;
  DocumentReaderNotification documentReaderNotification;
  RFIDSessionData rfidSessionData;
  DocumentReaderAuthenticityResult authenticityResult;
  DocumentReaderBarcodeResult barcodeResult;
  List<DocumentReaderDocumentType> documentType = [];

  String getTextFieldValueByType(int fieldType, { int lcid = 0, int source = -1, bool original = false }) {
    if (this.textResult == null)return null;
    var field = this.findByTypeAndLcid(fieldType, lcid);
    if (field == null) return null;
    var value = this.findBySource(field, source);
    if (value == null) return null;
    return original ? value.originalValue : value.value;
  }

  int getTextFieldStatusByType(int fieldType, {int lcid = 0}) {
    if (this.textResult == null) return 0;
    var field = this.findByTypeAndLcid(fieldType, lcid);
    return field != null ? field.status : 0;
  }

  String getGraphicFieldImageByType(int fieldType, { int source = -1, int pageIndex = -1, int light = -1 }) {
    if (this.graphicResult == null) return null;
    List<DocumentReaderGraphicField> foundFields = [];

    for (var field in this.graphicResult.fields)
      if (field.fieldType == fieldType)
        foundFields.add(field);
    if (source != -1)
      for (int i = 0; i < foundFields.length; i++)
        if (foundFields[i].sourceType != source)
          foundFields.removeAt(i);
    if (light != -1)
      for (int i = 0; i < foundFields.length; i++)
        if (foundFields[i].lightType != light)
          foundFields.removeAt(i);
    if (pageIndex != -1)
      for (int i = 0; i < foundFields.length; i++)
        if (foundFields[i].pageIndex != pageIndex)
          foundFields.removeAt(i);

    return foundFields.length > 0 ? foundFields[0].value : null;
  }

  int getQualityResult(int imageQualityCheckType, { int securityFeature = -1 }) {
    int resultSum = 2;
    if (this.imageQuality == null) return resultSum;

    for (ImageQuality iq in this.imageQuality.imageQualityList) {
      if (iq.type == imageQualityCheckType) {
        if (securityFeature == -1) {
          if (iq.result == 0) {
            resultSum = 0;
            break;
          }
          if (iq.result == 1) resultSum = iq.result;
        } else if (iq.featureType == securityFeature) {
          resultSum = iq.result;
          break;
        }
      }
    }

    return resultSum;
  }

  DocumentReaderTextField findByTypeAndLcid(int type, int lcid) {
    List<DocumentReaderTextField> foundFields = [];
    for (DocumentReaderTextField field in this.textResult.fields) if (field.fieldType == type) foundFields.add(field);
    if (foundFields.length <= 0) return null;
    DocumentReaderTextField foundField;

    for (DocumentReaderTextField field in foundFields)
      if (lcid == 0) {
        foundField = field;
        if (field.lcid == lcid) break;
      } else if (field.lcid == lcid) return field;

    return foundField;
  }

  DocumentReaderValue findBySource(DocumentReaderTextField field, int sourceType) {
    DocumentReaderValue value;
    if (sourceType == -1) {
      DocumentReaderValue mrzVal = this.findBySource(field, 3);
      if (mrzVal != null) return mrzVal;
      value = findBySource(field, 18);
      if (value != null) return value;
      var visualVal = this.findBySource(field, 17);
      return visualVal != null ? visualVal : null;
    } else
      for (DocumentReaderValue item in field.values) if (item.sourceType == sourceType) return item;

    return null;
  }


  static DocumentReaderResults fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderResults();

    result.chipPage = jsonObject["chipPage"];
    result.overallResult = jsonObject["overallResult"];
    result.processingFinishedStatus = jsonObject["processingFinishedStatus"];
    result.elapsedTime = jsonObject["elapsedTime"];
    result.elapsedTimeRFID = jsonObject["elapsedTimeRFID"];
    result.morePagesAvailable = jsonObject["morePagesAvailable"];
    result.rfidResult = jsonObject["rfidResult"];
    result.highResolution = jsonObject["highResolution"];
    result.graphicResult = DocumentReaderGraphicResult.fromJson(jsonObject["graphicResult"]);
    result.textResult = DocumentReaderTextResult.fromJson(jsonObject["textResult"]);
    result.documentPosition = ElementPosition.fromJson(jsonObject["documentPosition"]);
    result.barcodePosition = ElementPosition.fromJson(jsonObject["barcodePosition"]);
    result.mrzPosition = ElementPosition.fromJson(jsonObject["mrzPosition"]);
    result.imageQuality = ImageQualityGroup.fromJson(jsonObject["imageQuality"]);
    result.rawResult = jsonObject["rawResult"];
    result.documentReaderNotification = DocumentReaderNotification.fromJson(jsonObject["documentReaderNotification"]);
    result.rfidSessionData = RFIDSessionData.fromJson(jsonObject["rfidSessionData"]);
    result.authenticityResult = DocumentReaderAuthenticityResult.fromJson(jsonObject["authenticityResult"]);
    result.barcodeResult = DocumentReaderBarcodeResult.fromJson(jsonObject["barcodeResult"]);
    if (jsonObject["documentType"] != null)
      for (var item in jsonObject["documentType"])
        result.documentType.add(DocumentReaderDocumentType.fromJson(item));

    return result;
  }
}

// Enum

class BarcodeResult {
  static const int NO_ERR = 0;
  static const int NULL_PTR_ERR = -6001;
  static const int BAD_ARG_ERR = -6002;
  static const int SIZE_ERR = -6003;
  static const int RANGE_ERR = -6004;
  static const int INTERNAL_ERR = -6005;
  static const int TRY_EXCEPT_ERR = -6006;
  static const int BAR_CODE_NOT_FOUND = -6008;
  static const int BAR_CODE_DECODE_ERR = -6010;
  static const int NO_USER_DLL_FOUND = -6019;
  static const int NO_IPP_DLL_FOUND = -6020;
  static const int IPP_EXEC_ERR = -6024;
  static const int IPP_TRY_EXCEPT_ERR = -6025;
  static const int BARCODE_ERROR_INPUT_PARAM = -11001;
  static const int BARCODE_ERROR_FINIT = -11006;
  static const int BARCODE_ERROR_NOT_LOAD_IP_DECODED_LL = -11012;
  static const int BARCODE_ERROR_INNER_PROBLEM = -11100;
  static const int BARCODE_ERROR_DECODE_1D_BAD_DECODE = -11200;
  static const int BARCODE_ERROR_FIND_ROW_OR_COLUMN = -11201;
  static const int BARCODE_ERROR_FIND_3X8_2D_X = -11202;
  static const int BARCODE_ERROR_FIND_3X8_2D_Y = -11203;
  static const int BARCODE_ERROR_2D_UGOL_MAX = -11204;
  static const int BARCODE_ERROR_INDEFINITELY_DECODED = -11210;
  static const int BARCODE_ERROR_DLL_NOT_INIT = -11300;
  static const int BARCODE_ERROR_IP_DECODE_DLL_Try_Except = -11400;
  static const int IPDECODE_ERROR_LARGEERRORS = -4503;
  static const int IPDECODE_ERROR_FAULTCOLUMNS = -4504;
  static const int IPDECODE_ERROR_FAULTROWS = -4505;
  static const int IPDECODE_ERROR_INCORRECT_ERROR_LEVEL = -4511;
  static const int IPDECODE_ERROR_LOADING_DEV_TABLE = -4512;
}

class BarcodeType {
  static const int UNKNOWN = 0;
  static const int BCT_CODE128 = 1;
  static const int CODE39 = 2;
  static const int EAN8 = 3;
  static const int ITF = 4;
  static const int PDF417 = 5;
  static const int STF = 6;
  static const int MTF = 7;
  static const int IATA = 8;
  static const int CODABAR = 9;
  static const int UPCA = 10;
  static const int CODE93 = 11;
  static const int UPCE = 12;
  static const int EAN13 = 13;
  static const int QRCODE = 14;
  static const int AZTEC = 15;
  static const int DATAMATRIX = 16;
  static const int ALL_1D = 17;
  static const int CODE11 = 18;
}

class CameraMode {
  static const int AUTO = 0;
  static const int CAMERA1 = 1;
  static const int CAMERA2 = 2;
}

class CameraTypes {
  static const String FRONT = "front";
  static const String BACK = "back";
}

class CaptureMode {
  static const int AUTO = 0;
  static const int CAPTURE_VIDEO = 1;
  static const int CAPTURE_FRAME = 2;
}

class diDocType {
  static const int dtNotDefined = 0;
  static const int dtPassport = 11;
  static const int dtIdentityCard = 12;
  static const int dtDiplomaticPassport = 13;
  static const int dtServicePassport = 14;
  static const int dtSeamansIdentityDocument = 15;
  static const int dtIdentityCardforResidence = 16;
  static const int dtTraveldocument = 17;
  static const int dtOther = 99;
  static const int dtVisaID2 = 29;
  static const int dtVisaID3 = 30;
  static const int dtRegistrationCertificate = 31;
  static const int dtNationalIdentityCard = 20;
  static const int dtSocialIdentityCard = 21;
  static const int dtAliensIdentityCard = 22;
  static const int dtPrivilegedIdentityCard = 23;
  static const int dtResidencePermitIdentityCard = 24;
  static const int dtOriginCard = 25;
  static const int dtEmergencyPassport = 26;
  static const int dtAliensPassport = 27;
  static const int dtAlternativeIdentityCard = 28;
  static const int dtAuthorizationCard = 32;
  static const int dtBeginnerPermit = 33;
  static const int dtBorderCrossingCard = 34;
  static const int dtChauffeurLicense = 35;
  static const int dtChauffeurLicenseUnder18 = 36;
  static const int dtChauffeurLicenseUnder21 = 37;
  static const int dtCommercialDrivingLicense = 38;
  static const int dtCommercialDrivingLicenseIndtuctionalPermit = 39;
  static const int dtCommercialDrivingLicenseUnder18 = 40;
  static const int dtCommercialDrivingLicenseUnder21 = 41;
  static const int dtCommercialIndtuctionPermit = 42;
  static const int dtCommercialNewPermit = 43;
  static const int dtConcealedCarryLicense = 44;
  static const int dtConcealedFirearmPermit = 45;
  static const int dtConditionalDrivingLicense = 46;
  static const int dtDepartmentOfVeteransAffairsIdentityCard = 47;
  static const int dtDiplomaticDrivingLicense = 48;
  static const int dtDrivingLicense = 49;
  static const int dtDrivingLicenseIndtuctionalPermit = 50;
  static const int dtDrivingLicenseIndtuctionalPermitUnder18 = 51;
  static const int dtDrivingLicenseIndtuctionalPermitUnder21 = 52;
  static const int dtDrivingLicenseLearnersPermit = 53;
  static const int dtDrivingLicenseLearnersPermitUnder18 = 54;
  static const int dtDrivingLicenseLearnersPermitUnder21 = 55;
  static const int dtDrivingLicenseNovice = 56;
  static const int dtDrivingLicenseNoviceUnder18 = 57;
  static const int dtDrivingLicenseNoviceUnder21 = 58;
  static const int dtDrivingLicenseRegisteredOffender = 59;
  static const int dtDrivingLicenseRedtictedUnder18 = 60;
  static const int dtDrivingLicenseRedtictedUnder21 = 61;
  static const int dtDrivingLicenseTemporaryVisitor = 62;
  static const int dtDrivingLicenseTemporaryVisitorUnder18 = 63;
  static const int dtDrivingLicenseTemporaryVisitorUnder21 = 64;
  static const int dtDrivingLicenseUnder18 = 65;
  static const int dtDrivingLicenseUnder21 = 66;
  static const int dtEmploymentDrivingPermit = 67;
  static const int dtEnhancedChauffeurLicense = 68;
  static const int dtEnhancedChauffeurLicenseUnder18 = 69;
  static const int dtEnhancedChauffeurLicenseUnder21 = 70;
  static const int dtEnhancedCommercialDrivingLicense = 71;
  static const int dtEnhancedDrivingLicense = 72;
  static const int dtEnhancedDrivingLicenseUnder18 = 73;
  static const int dtEnhancedDrivingLicenseUnder21 = 74;
  static const int dtEnhancedIdentityCard = 75;
  static const int dtEnhancedIdentityCardUnder18 = 76;
  static const int dtEnhancedIdentityCardUnder21 = 77;
  static const int dtEnhancedOperatorsLicense = 78;
  static const int dtFirearmsPermit = 79;
  static const int dtFullProvisionalLicense = 80;
  static const int dtFullProvisionalLicenseUnder18 = 81;
  static const int dtFullProvisionalLicenseUnder21 = 82;
  static const int dtGenevaConventionsIdentityCard = 83;
  static const int dtGraduatedDrivingLicenseUnder18 = 84;
  static const int dtGraduatedDrivingLicenseUnder21 = 85;
  static const int dtGraduatedIndtuctionPermitUnder18 = 86;
  static const int dtGraduatedIndtuctionPermitUnder21 = 87;
  static const int dtGraduatedLicenseUnder18 = 88;
  static const int dtGraduatedLicenseUnder21 = 89;
  static const int dtHandgunCarryPermit = 90;
  static const int dtIdentityAndPrivilegeCard = 91;
  static const int dtIdentityCardMobilityImpaired = 92;
  static const int dtIdentityCardRegisteredOffender = 93;
  static const int dtIdentityCardTemporaryVisitor = 94;
  static const int dtIdentityCardTemporaryVisitorUnder18 = 95;
  static const int dtIdentityCardTemporaryVisitorUnder21 = 96;
  static const int dtIdentityCardUnder18 = 97;
  static const int dtIdentityCardUnder21 = 98;
  static const int dtIgnitionInterlockPermit = 100;
  static const int dtImmigrantVisa = 101;
  static const int dtIndtuctionPermit = 102;
  static const int dtIndtuctionPermitUnder18 = 103;
  static const int dtIndtuctionPermitUnder21 = 104;
  static const int dtInterimDrivingLicense = 105;
  static const int dtInterimIdentityCard = 106;
  static const int dtIntermediateDrivingLicense = 107;
  static const int dtIntermediateDrivingLicenseUnder18 = 108;
  static const int dtIntermediateDrivingLicenseUnder21 = 109;
  static const int dtJuniorDrivingLicense = 110;
  static const int dtLearnerIndtuctionalPermit = 111;
  static const int dtLearnerLicense = 112;
  static const int dtLearnerLicenseUnder18 = 113;
  static const int dtLearnerLicenseUnder21 = 114;
  static const int dtLearnerPermit = 115;
  static const int dtLearnerPermitUnder18 = 116;
  static const int dtLearnerPermitUnder21 = 117;
  static const int dtLimitedLicense = 118;
  static const int dtLimitedPermit = 119;
  static const int dtLimitedTermDrivingLicense = 120;
  static const int dtLimitedTermIdentityCard = 121;
  static const int dtLiquorIdentityCard = 122;
  static const int dtNewPermit = 123;
  static const int dtNewPermitUnder18 = 124;
  static const int dtNewPermitUnder21 = 125;
  static const int dtNonUsCitizenDrivingLicense = 126;
  static const int dtOccupationalDrivingLicense = 127;
  static const int dtOneidaTribeOfIndiansIdentityCard = 128;
  static const int dtOperatorLicense = 129;
  static const int dtOperatorLicenseUnder18 = 130;
  static const int dtOperatorLicenseUnder21 = 131;
  static const int dtPermanentDrivingLicense = 132;
  static const int dtPermitToReEnter = 133;
  static const int dtProbationaryAutoLicense = 134;
  static const int dtProbationaryDrivingLicenseUnder18 = 135;
  static const int dtProbationaryDrivingLicenseUnder21 = 136;
  static const int dtProbationaryVehicleSalespersonLicense = 137;
  static const int dtProvisionalDrivingLicense = 138;
  static const int dtProvisionalDrivingLicenseUnder18 = 139;
  static const int dtProvisionalDrivingLicenseUnder21 = 140;
  static const int dtProvisionalLicense = 141;
  static const int dtProvisionalLicenseUnder18 = 142;
  static const int dtProvisionalLicenseUnder21 = 143;
  static const int dtPublicPassengerChauffeurLicense = 144;
  static const int dtRacingAndGamingComissionCard = 145;
  static const int dtRefugeeTravelDocument = 146;
  static const int dtRenewalPermit = 147;
  static const int dtRedtictedCommercialDrivingLicense = 148;
  static const int dtRedtictedDrivingLicense = 149;
  static const int dtRedtictedPermit = 150;
  static const int dtSeasonalPermit = 151;
  static const int dtSeasonalResidentIdentityCard = 152;
  static const int dtSeniorCitizenIdentityCard = 153;
  static const int dtSexOffender = 154;
  static const int dtSocialSecurityCard = 155;
  static const int dtTemporaryDrivingLicense = 156;
  static const int dtTemporaryDrivingLicenseUnder18 = 157;
  static const int dtTemporaryDrivingLicenseUnder21 = 158;
  static const int dtTemporaryIdentityCard = 159;
  static const int dtTemporaryIndtuctionPermitIdentityCard = 160;
  static const int dtTemporaryIndtuctionPermitIdentityCardUnder18 = 161;
  static const int dtTemporaryIndtuctionPermitIdentityCardUnder21 = 162;
  static const int dtTemporaryVisitorDrivingLicense = 163;
  static const int dtTemporaryVisitorDrivingLicenseUnder18 = 164;
  static const int dtTemporaryVisitorDrivingLicenseUnder21 = 165;
  static const int dtUniformedServicesIdentityCard = 166;
  static const int dtVehicleSalespersonLicense = 167;
  static const int dtWorkerIdentificationCredential = 168;
  static const int dtCommercialDrivingLicenseNovice = 169;
  static const int dtCommercialDrivingLicenseNoviceUnder18 = 170;
  static const int dtCommercialDrivingLicenseNoviceUnder21 = 171;
  static const int dtPassportCard = 172;
  static const int dtPermanentResidentCard = 173;
  static const int dtPersonalIdentificationVerification = 174;
  static const int dtTemporaryOperatorLicense = 175;
  static const int dtDrivingLicenseUnder19 = 176;
  static const int dtIdentityCardUnder19 = 177;
  static const int dtVisa = 178;
  static const int dtTemporaryPassport = 179;
  static const int dtVotingCard = 180;
  static const int dtHealthCard = 181;
  static const int dtCertificateOfCitizenship = 182;
  static const int dtAddressCard = 183;
  static const int dtAirportImmigrationCard = 184;
  static const int dtAlienRegidtationCard = 185;
  static const int dtAPEHCard = 186;
  static const int dtCoupontoDrivingLicense = 187;
  static const int dtCrewMemberCertificate = 188;
  static const int dtDocumentForReturn = 189;
  static const int dtECard = 190;
  static const int dtEmploymentCard = 191;
  static const int dtHKSARImmigrationForm = 192;
  static const int dtImmigrantcard = 193;
  static const int dtLabourCard = 194;
  static const int dtLaissezPasser = 195;
  static const int dtLawyerIdentityCertificate = 196;
  static const int dtLicenseCard = 197;
  static const int dtPassportStateless = 198;
  static const int dtPassportChild = 199;
  static const int dtPassportConsular = 200;
  static const int dtPassportDiplomaticService = 201;
  static const int dtPassportOfficial = 202;
  static const int dtPassportProvisional = 203;
  static const int dtPassportSpecial = 204;
  static const int dtPermissiontotheLocalBorderTraffic = 205;
  static const int dtSEDESOLCard = 207;
  static const int dtSocialCard = 208;
  static const int dtTBCard = 209;
  static const int dtVehiclePassport = 210;
  static const int dtWDocument = 211;
  static const int dtDiplomaticIdentityCard = 212;
  static const int dtConsularIdentityCard = 213;
  static const int dtIncomeTaxCard = 214;
  static const int dtResidencePermit = 215;
  static const int dtDocumentOfIdentity = 216;
  static const int dtBorderCrossingPermit = 217;
  static const int dtPassportLimitedValidity = 218;
  static const int dtSIMCard = 219;
  static const int dtTaxCard = 220;
  static const int dtCompanyCard = 221;
  static const int dtDomesticPassport = 222;
  static const int dtIdentityCertificate = 223;
  static const int dtResidentIdCard = 224;
  static const int dtArmedForcesIdentityCard = 225;
  static const int dtProfessionalCard = 226;
  static const int dtRegistrationStamp = 227;
  static const int dtDriverCard = 228;
  static const int dtDriverTrainingCertificate = 229;
  static const int dtQualificationDrivingLicense = 230;
  static const int dtMembershipCard = 231;
  static const int dtPublicVehicleDriverAuthorityCard = 232;
  static const int dtMarineLicense = 233;
  static const int dtTemporaryLearnerDrivingLicense = 234;
  static const int dtTemporaryCommercialDrivingLicense = 235;
  static const int dtInterimInstructionalPermit = 236;
  static const int dtCertificateOfCompetency = 237;
  static const int dtCertificateOfProficiency = 238;
}

class DocFormat {
  static const int ID1 = 0;
  static const int ID2 = 1;
  static const int ID3 = 2;
  static const int ID3_x2 = 5;
  static const int CUSTOM = 1000;
  static const int FLEXIBLE = 1002;
}

class DocReaderAction {
  static const int COMPLETE = 1;
  static const int PROCESS = 0;
  static const int CANCEL = 2;
  static const int ERROR = 3;
  static const int NOTIFICATION = 5;
  static const int PROCESS_WHITE_UV_IMAGES = 6;
  static const int MORE_PAGES_AVAILABLE = 8;
}

class DocReaderFrame {
  static const String MAX = "max";
  static const String SCENARIO_DEFAULT = "id1";
  static const String NONE = "none";
  static const String DOCUMENT = "document";
}

class DocReaderOrientation {
  static const int ROTATE = 0;
  static const int PORTRAIT = 1;
  static const int LANDSCAPE = 2;
}

class eCheckDiagnose {
  static const int UNKNOWN = 0;
  static const int PASS = 1;
  static const int INVALID_INPUT_DATA = 2;
  static const int INTERNAL_ERROR = 3;
  static const int EXCEPTION_IN_MODULE = 4;
  static const int UNCERTAIN_VERIFICATION = 5;
  static const int NECESSARY_IMAGE_NOT_FOUND = 7;
  static const int PHOTO_SIDES_NOT_FOUND = 8;
  static const int INVALID_CHECKSUM = 10;
  static const int SYNTAX_ERROR = 11;
  static const int LOGIC_ERROR = 12;
  static const int SOURCES_COMPARISON_ERROR = 13;
  static const int FIELDS_COMPARISON_LOGIC_ERROR = 14;
  static const int INVALID_FIELD_FORMAT = 15;
  static const int TRUE_LUMINISCENCE_ERROR = 20;
  static const int FALSE_LUMINISCENCE_ERROR = 21;
  static const int FIXED_PATTERN_ERROR = 22;
  static const int LOW_CONTRAST_IN_IR_LIGHT = 23;
  static const int INCORRECT_BACKGROUND_LIGHT = 24;
  static const int BACKGROUND_COMPARISON_ERROR = 25;
  static const int INCORRECT_TEXT_COLOR = 26;
  static const int PHOTO_FALSE_LUMINISCENCE = 27;
  static const int TOO_MUCH_SHIFT = 28;
  static const int FIBERS_NOT_FOUND = 30;
  static const int TOO_MANY_OBJECTS = 31;
  static const int SPECKS_IN_UV = 33;
  static const int TOO_LOW_RESOLUTION = 34;
  static const int INVISIBLE_ELEMENT_PRESENT = 40;
  static const int VISIBLE_ELEMENT_ABSENT = 41;
  static const int ELEMENT_SHOULD_BE_COLORED = 42;
  static const int ELEMENT_SHOULD_BE_GRAYSCALE = 43;
  static const int UV_DULL_PAPER_MRZ = 50;
  static const int FALSE_LUMINISCENCE_IN_MRZ = 51;
  static const int UV_DULL_PAPER_PHOTO = 52;
  static const int UV_DULL_PAPER_BLANK = 53;
  static const int UV_DULL_PAPER_ERROR = 54;
  static const int FALSE_LUMINISCENCE_IN_BLANK = 55;
  static const int BAD_AREA_IN_AXIAL = 60;
  static const int FALSE_IPI_PARAMETERS = 65;
  static const int FIELD_POS_CORRECTOR_HIGHLIGHT_IR = 80;
  static const int OVI_IR_INVISIBLE = 90;
  static const int OVI_INSUFFICIENT_AREA = 91;
  static const int OVI_COLOR_INVARIABLE = 92;
  static const int OVI_BAD_COLOR_FRONT = 93;
  static const int OVI_BAD_COLOR_SIDE = 94;
  static const int OVI_WIDE_COLOR_SPREAD = 95;
  static const int OVI_BAD_COLOR_PERCENT = 96;
  static const int HOLOGRAM_ELEMENT_ABSENT = 100;
  static const int HOLOGRAM_SIDE_TOP_IMAGES_ABSENT = 101;
  static const int HOLOGRAM_ELEMENT_PRESENT = 102;
  static const int PHOTO_PATTERN_INTERRUPTED = 110;
  static const int PHOTO_PATTERN_SHIFTED = 111;
  static const int PHOTO_PATTERN_DIFFERENT_COLORS = 112;
  static const int PHOTO_PATTERN_IR_VISIBLE = 113;
  static const int PHOTO_PATTERN_NOT_INTERSECT = 114;
  static const int PHOTO_SIZE_IS_WRONG = 115;
  static const int PHOTO_PATTERN_INVALID_COLOR = 116;
  static const int PHOTO_PATTERN_SHIFTED_VERT = 117;
  static const int PHOTO_PATTERN_PATTERN_NOT_FOUND = 118;
  static const int PHOTO_PATTERN_DIFFERENT_LINES_THICKNESS = 119;
  static const int PHOTO_IS_NOT_RECTANGLE = 120;
  static const int PHOTO_CORNERS_IS_WRONG = 121;
  static const int DOCUMENT_IS_CANCELLING = 122;
  static const int TEXT_COLOR_SHOULD_BE_BLUE = 130;
  static const int TEXT_COLOR_SHOULD_BE_GREEN = 131;
  static const int TEXT_COLOR_SHOULD_BE_RED = 132;
  static const int TEXT_SHOULD_BE_BLACK = 133;
  static const int BARCODE_WAS_READ_WITH_ERRORS = 140;
  static const int BARCODE_DATA_FORMAT_ERROR = 141;
  static const int BARCODE_SIZE_PARAMS_ERROR = 142;
  static const int NOT_ALL_BARCODES_READ = 143;
  static const int PORTRAIT_COMPARISON_PORTRAITS_DIFFER = 150;
  static const int PORTRAIT_COMPARISON_NO_SERVICE_REPLY = 151;
  static const int PORTRAIT_COMPARISON_SERVICE_ERROR = 152;
  static const int PPORTRAIT_COMPARISON_NOT_ENOUGH_IMAGES = 153;
  static const int PORTRAIT_COMPARISON_NO_LIVE_PHOTO = 154;
  static const int PORTRAIT_COMPARISON_NO_SERVICE_LICENSE = 155;
  static const int PORTRAIT_COMPARISON_NO_PORTRAIT_DETECTED = 156;
  static const int MOBILE_IMAGES_UNSUITABLE_LIGHT_CONDITIONS = 160;
  static const int MOBILE_IMAGES_WHITE_UV_NO_DIFFERENCE = 161;
  static const int LAST_DIAGNOSE_VALUE = 162;
}

class eCheckResult {
  static const int CH_CHECK_ERROR = 0;
  static const int CH_CHECK_OK = 1;
  static const int CH_CHECK_WAS_NOT_DONE = 2;
}

class eGraphicFieldType {
  static const int GF_PORTRAIT = 201;
  static const int GF_FINGERPR = 202;
  static const int GF_EYE = 203;
  static const int GF_SIGNATURE = 204;
  static const int GF_BAR_CODE = 205;
  static const int GF_PROOF_OF_CITIZENSHIP = 206;
  static const int GF_DOCUMENT_IMAGE = 207;
  static const int GF_COLOR_DYNAMIC = 209;
  static const int GF_GHOST_PORTRAIT = 210;
  static const int GF_STAMP = 211;
  static const int GF_PORTRAIT_OF_CHILD = 212;
  static const int GF_OTHER = 250;
  static const int GF_FINGER_LEFT_THUMB = 300;
  static const int GF_FINGER_LEFT_INDEX = 301;
  static const int GF_FINGER_LEFT_MIDDLE = 302;
  static const int GF_FINGER_LEFT_RING = 303;
  static const int GF_FINGER_LEFT_LITTLE = 304;
  static const int GF_FINGER_RIGHT_THUMB = 305;
  static const int GF_FINGER_RIGHT_INDEX = 306;
  static const int GF_FINGER_RIGHT_MIDDLE = 307;
  static const int GF_FINGER_RIGHT_RING = 308;
  static const int GF_FINGER_RIGHT_LITTLE = 309;

  static String getTranslation(int value) {
    switch (value) {
      case GF_PORTRAIT:
        return "Portrait";
      case GF_FINGERPR:
        return "Fingerprint";
      case GF_EYE:
        return "Iris";
      case GF_SIGNATURE:
        return "Signature";
      case GF_BAR_CODE:
        return "Barcode";
      case GF_PROOF_OF_CITIZENSHIP:
        return "Proof of citizenship";
      case GF_DOCUMENT_IMAGE:
        return "Document image";
      case GF_COLOR_DYNAMIC:
        return "Color dynamics";
      case GF_GHOST_PORTRAIT:
        return "Ghost portrait";
      case GF_STAMP:
        return "Stamp";
      case GF_PORTRAIT_OF_CHILD:
        return "Portrait of child";
      case GF_OTHER:
        return "Other";
      case GF_FINGER_LEFT_THUMB:
        return "Left thumb";
      case GF_FINGER_LEFT_INDEX:
        return "Left index finger";
      case GF_FINGER_LEFT_MIDDLE:
        return "Left middle finger";
      case GF_FINGER_LEFT_RING:
        return "Left ring finger";
      case GF_FINGER_LEFT_LITTLE:
        return "Left little finger";
      case GF_FINGER_RIGHT_THUMB:
        return "Right thumb";
      case GF_FINGER_RIGHT_INDEX:
        return "Right index finger";
      case GF_FINGER_RIGHT_MIDDLE:
        return "Right middle finger";
      case GF_FINGER_RIGHT_RING:
        return "Right ring finger";
      case GF_FINGER_RIGHT_LITTLE:
        return "Right little finger";
      default:
        return value.toString();
    }
  }
}

class eImageQualityCheckType {
  static const int IQC_IMAGE_GLARES = 0;
  static const int IQC_IMAGE_FOCUS = 1;
  static const int IQC_IMAGE_RESOLUTION = 2;
}

class eProcessGLCommands {
  static const int ePC_ProcMgr_SetLicense = 12100;
  static const int ePC_ProcMgr_Process = 12101;
  static const int ePC_ProcMgr_ProcessAsync = 12102;
  static const int ePC_ProcMgr_Init = 12103;
  static const int ePC_ProcMgr_ProcessImage = 12104;
  static const int ePC_ProcMgr_StartNewDocument = 12105;
  static const int ePC_ProcMgr_StartNewPage = 12106;
  static const int ePC_ProcMgr_Unload = 12107;
  static const int ePC_ProcMgr_CheckDatabase = 12109;
  static const int ePC_ProcMgr_ComparePortraits = 12111;
}

class eRequestCommand {
  static const int eReqCmd_RFid_SendData = 100;
  static const int eReqCmd_RFid_Notify = 101;
  static const int eReqCmd_RFid_GetDataForScenario = 102;
  static const int eReqCmd_Torch_GetUVFoto = 200;
  static const int eReqCmd_InternetSend = 300;
  static const int eReqCmd_GetGuid = 400;
}

class eRFID_AccessControl_ProcedureType {
  static const int ACPT_UNDEFINED = 0;
  static const int ACPT_BAC = 1;
  static const int ACPT_PACE = 2;
  static const int ACPT_CA = 3;
  static const int ACPT_TA = 4;
  static const int ACPT_AA = 5;
  static const int ACPT_RI = 6;
  static const int ACPT_CARD_INFO = 10;
}

class eRFID_AuthenticationProcedureType {
  static const int aptUndefined = 0;
  static const int aptStandard = 1;
  static const int aptAdvanced = 2;
  static const int aptGeneral = 3;
}

class eRFID_BaudRate {
  static const int rfbr_106 = 1;
  static const int rfbr_212 = 2;
  static const int rfbr_424 = 4;
  static const int rfbr_848 = 8;
}

class eRFID_CertificateType {
  static const int CT_UNDEFINED = 0;
  static const int CT_CSCA = 1;
  static const int CT_CSCA_LINK = 2;
  static const int CT_DS = 3;
  static const int CT_MLS = 4;
  static const int CT_DEV_LS = 5;
  static const int CT_DEF_LS = 6;
}

class eRFID_DataFile_Type {
  static const int DFT_UNSPECIFIED = 0;
  static const int DFT_PASSPORT_DG1 = 1;
  static const int DFT_PASSPORT_DG2 = 2;
  static const int DFT_PASSPORT_DG3 = 3;
  static const int DFT_PASSPORT_DG4 = 4;
  static const int DFT_PASSPORT_DG5 = 5;
  static const int DFT_PASSPORT_DG6 = 6;
  static const int DFT_PASSPORT_DG7 = 7;
  static const int DFT_PASSPORT_DG8 = 8;
  static const int DFT_PASSPORT_DG9 = 9;
  static const int DFT_PASSPORT_DG10 = 10;
  static const int DFT_PASSPORT_DG11 = 11;
  static const int DFT_PASSPORT_DG12 = 12;
  static const int DFT_PASSPORT_DG13 = 13;
  static const int DFT_PASSPORT_DG14 = 14;
  static const int DFT_PASSPORT_DG15 = 15;
  static const int DFT_PASSPORT_DG16 = 16;
  static const int DFT_PASSPORT_DG17 = 17;
  static const int DFT_PASSPORT_DG18 = 18;
  static const int DFT_PASSPORT_DG19 = 19;
  static const int DFT_PASSPORT_DG20 = 20;
  static const int DFT_PASSPORT_SOD = 21;
  static const int DFT_PASSPORT_CVCA = 22;
  static const int DFT_PASSPORT_COM = 23;
  static const int DFT_ID_DG1 = 101;
  static const int DFT_ID_DG2 = 102;
  static const int DFT_ID_DG3 = 103;
  static const int DFT_ID_DG4 = 104;
  static const int DFT_ID_DG5 = 105;
  static const int DFT_ID_DG6 = 106;
  static const int DFT_ID_DG7 = 107;
  static const int DFT_ID_DG8 = 108;
  static const int DFT_ID_DG9 = 109;
  static const int DFT_ID_DG10 = 110;
  static const int DFT_ID_DG11 = 111;
  static const int DFT_ID_DG12 = 112;
  static const int DFT_ID_DG13 = 113;
  static const int DFT_ID_DG14 = 114;
  static const int DFT_ID_DG15 = 115;
  static const int DFT_ID_DG16 = 116;
  static const int DFT_ID_DG17 = 117;
  static const int DFT_ID_DG18 = 118;
  static const int DFT_ID_DG19 = 119;
  static const int DFT_ID_DG20 = 120;
  static const int DFT_ID_DG21 = 121;
  static const int DFT_DL_COM = 150;
  static const int DFT_DL_DG1 = 151;
  static const int DFT_DL_DG2 = 152;
  static const int DFT_DL_DG3 = 153;
  static const int DFT_DL_DG4 = 154;
  static const int DFT_DL_DG5 = 155;
  static const int DFT_DL_DG6 = 156;
  static const int DFT_DL_DG7 = 157;
  static const int DFT_DL_DG8 = 158;
  static const int DFT_DL_DG9 = 159;
  static const int DFT_DL_DG10 = 160;
  static const int DFT_DL_DG11 = 161;
  static const int DFT_DL_DG12 = 162;
  static const int DFT_DL_DG13 = 163;
  static const int DFT_DL_DG14 = 164;
  static const int DFT_DL_SOD = 165;
  static const int DFT_DL_CE = 166;
  static const int DFT_DL_CVCA = 167;
  static const int DFT_PACE_CARDACCESS = 200;
  static const int DFT_PACE_CARDSECURITY = 201;
  static const int DFT_PACE_CHIPSECURITY = 202;
  static const int DFT_MIFARE_DATA = 300;
  static const int DFT_MIFARE_VALIDITY = 301;
  static const int DFT_AUTHENTICITYV2 = 302;
  static const int DFT_ATR = 400;
  static const int DFT_ESIGN_PK = 500;
  static const int DFT_ESIGN_SIGNEDDATA = 501;
  static const int DFT_CERTIFICATE = 600;
  static const int DFT_MASTERLIST = 601;
  static const int DFT_DEFECTLIST = 602;
  static const int DFT_DEVIATIONLIST = 603;
  static const int DFT_APP_DIRECTORY = 700;
  static const int DFT_SESSION = 701;
  static const int DFT_LOGDATA = 702;
  static const int DFT_CHIP_PROPERTIES = 703;
  static const int DFT_USERDEFINED = 1000;

  static String getTranslation(int value) {
    switch (value) {
      case DFT_MIFARE_DATA:
        return "MIFARE data";
      case DFT_PASSPORT_COM:
        return "EF.COM";
      case DFT_DL_COM:
        return "EF.COM";
      case DFT_PASSPORT_DG1:
        return "Machine Readable Zone (DG1)";
      case DFT_ID_DG1:
        return "Document type" + " (DG1)";
      case DFT_DL_DG1:
        return "Text data elements (DG1)";
      case DFT_PASSPORT_DG2:
        return "Biometry - Facial data (DG2)";
      case DFT_ID_DG2:
        return "Issuing state" + " (DG2)";
      case DFT_DL_DG2:
        return "License holder information (DG2)";
      case DFT_PASSPORT_DG3:
        return "Biometry - Fingerprint(s) (DG3)";
      case DFT_ID_DG3:
        return "Date of expiry" + " (DG3)";
      case DFT_DL_DG3:
        return "Issuing authority details (DG3)";
      case DFT_PASSPORT_DG4:
        return "Biometry - Iris Data (DG4)";
      case DFT_ID_DG4:
        return "Given name" + " (DG4)";
      case DFT_DL_DG4:
        return "Portrait image (DG4)";
      case DFT_PASSPORT_DG5:
        return "Portrait(s) (DG5)";
      case DFT_ID_DG5:
        return "Surname/given name at birth" + " (DG5)";
      case DFT_DL_DG5:
        return "Signature / usual mark image (DG5)";
      case DFT_PASSPORT_DG6:
        return "not defined (DG6)";
      case DFT_ID_DG6:
        return "Pseudonym" + " (DG6)";
      case DFT_DL_DG6:
        return "Biometry - Facial data (DG6)";
      case DFT_PASSPORT_DG7:
        return "Signature / usual mark image (DG7)";
      case DFT_ID_DG7:
        return "Academic title" + " (DG7)";
      case DFT_DL_DG7:
        return "Biometry - Fingerprint(s) (DG7)";
      case DFT_PASSPORT_DG8:
        return "not defined (DG8)";
      case DFT_ID_DG8:
        return "Date of birth" + " (DG8)";
      case DFT_DL_DG8:
        return "Biometry - Iris Data (DG8)";
      case DFT_PASSPORT_DG9:
        return "not defined (DG9)";
      case DFT_ID_DG9:
        return "Place of birth" + " (DG9)";
      case DFT_DL_DG9:
        return "Biometry - Other (DG9)";
      case DFT_PASSPORT_DG10:
        return "not defined (DG10)";
      case DFT_ID_DG10:
        return "Nationality" + " (DG10)";
      case DFT_DL_DG10:
        return "not defined (DG10)";
      case DFT_PASSPORT_DG11:
        return "Additional personal detail(s) (DG11)";
      case DFT_ID_DG11:
        return "Sex" + " (DG11)";
      case DFT_DL_DG11:
        return "Optional domestic data (DG11)";
      case DFT_PASSPORT_DG12:
        return "Additional document details (DG12)";
      case DFT_ID_DG12:
        return "Optional details" + " (DG12)";
      case DFT_DL_DG12:
        return "Non-match alert (DG12)";
      case DFT_PASSPORT_DG13:
        return "Optional detail(s) (DG13)";
      case DFT_ID_DG13:
        return "Undefined" + " (DG13)";
      case DFT_DL_DG13:
        return "Active Authentication info (DG13)";
      case DFT_PASSPORT_DG14:
        return "EAC info (DG14)";
      case DFT_ID_DG14:
        return "Undefined" + " (DG14)";
      case DFT_DL_DG14:
        return "EAC info (DG14)";
      case DFT_PASSPORT_DG15:
        return "Active Authentication info (DG15)";
      case DFT_ID_DG15:
        return "Undefined" + " (DG15)";
      case DFT_PASSPORT_DG16:
        return "Person(s) to notify (DG16)";
      case DFT_ID_DG16:
        return "Undefined" + " (DG16)";
      case DFT_PASSPORT_DG17:
        return "DG17";
      case DFT_ID_DG17:
        return "Place of registration" + " (DG17)";
      case DFT_PASSPORT_DG18:
        return "DG18";
      case DFT_ID_DG18:
        return "Place of registration" + " (DG18)";
      case DFT_PASSPORT_DG19:
        return "DG19";
      case DFT_ID_DG19:
        return "Residence permit 1" + " (DG19)";
      case DFT_PASSPORT_DG20:
        return "DG20";
      case DFT_ID_DG20:
        return "Residence permit 2" + " (DG20)";
      case DFT_ID_DG21:
        return "Optional details" + " (DG21)";
      case DFT_PASSPORT_SOD:
        return "EF.SOD";
      case DFT_DL_SOD:
        return "EF.SOD";
      case DFT_PASSPORT_CVCA:
        return "EF.CVCA";
      case DFT_MIFARE_VALIDITY:
        return "MIFARE validity";
      case DFT_PACE_CARDACCESS:
        return "EF.CardAccess";
      case DFT_PACE_CARDSECURITY:
        return "EF.CardSecurity";
      case DFT_PACE_CHIPSECURITY:
        return "EF.ChipSecurity";
      case DFT_CERTIFICATE:
        return "Certificate";
      case DFT_APP_DIRECTORY:
        return "App directory";
      case DFT_ATR:
        return "DFT_ATR";
      case DFT_AUTHENTICITYV2:
        return "DFT_CHIP_PROPERTIES";
      case DFT_CHIP_PROPERTIES:
        return "DFT_CHIP_PROPERTIES";
      case DFT_DEFECTLIST:
        return "DFT_DEFECTLIST";
      case DFT_DEVIATIONLIST:
        return "DFT_DEVIATIONLIST";
      case DFT_DL_CE:
        return "DFT_DL_CE";
      case DFT_DL_CVCA:
        return "DFT_DL_CVCA";
      case DFT_ESIGN_PK:
        return "DFT_ESIGN_PK";
      case DFT_ESIGN_SIGNEDDATA:
        return "DFT_ESIGN_SIGNEDDATA";
      case DFT_LOGDATA:
        return "DFT_LOGDATA";
      case DFT_MASTERLIST:
        return "DFT_MASTERLIST";
      case DFT_SESSION:
        return "DFT_SESSION";
      case DFT_UNSPECIFIED:
        return "DFT_UNSPECIFIED";
      case DFT_USERDEFINED:
        return "DFT_USERDEFINED";
      default:
        return value.toString();
    }
  }
}

class eRFID_NotificationAndErrorCodes {
  static const int RFID_NOTIFICATION_ERROR = 65536;
  static const int RFID_NOTIFICATION_DOCUMENT_READY = 65537;
  static const int RFID_NOTIFICATION_READ_PROTOCOL4 = 65539;
  static const int RFID_NOTIFICATION_READ_PROTOCOL3 = 65546;
  static const int RFID_NOTIFICATION_PROGRESS = 65547;
  static const int RFID_NOTIFICATION_TA_STEP = 65550;
  static const int RFID_NOTIFICATION_SM_REQUIRED = 65551;
  static const int RFID_NOTIFICATION_ISO_ERROR = 69632;
  static const int RFID_NOTIFICATION_PA_REQUEST = 77824;
  static const int RFID_NOTIFICATION_SM_ESTABLISHED = 81935;
  static const int RFID_NOTIFICATION_PCSC_READER_DISCONNECTED = 131072;
  static const int RFID_NOTIFICATION_PCSC_READER_LIST_CHANGED = 131073;
  static const int RFID_NOTIFICATION_PCSC_BYTES_RECEIVED = 131074;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_READING_TIME = 131075;
  static const int RFID_NOTIFICATION_PCSC_DATA_RECEIVED = 131076;
  static const int RFID_NOTIFICATION_PCSC_BYTES_SENT = 131077;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_READING_SPEED = 131078;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_PROCESS_TIME = 131079;
  static const int RFID_NOTIFICATION_PCSC_READER_LIST_CHANGING = 131080;
  static const int RFID_NOTIFICATION_PCSC_EXT_LENGTH_SUPPORT = 131088;
  static const int RFID_NOTIFICATION_PA_CERTIFICATE_CHAIN = 131089;
  static const int RFID_NOTIFICATION_PA_CERTIFICATE_CHAIN_ITEM = 131090;
  static const int RFID_NOTIFICATION_SCENARIO = 131104;
  static const int RFID_NOTIFICATION_PCSC_READING_DATAGROUP = 196608;
  static const int RFID_NOTIFICATION_PCSC_FILE_NOT_FOUND = 262144;
  static const int RFID_NOTIFICATION_PCSC_END_OF_FILE = 327680;
  static const int RFID_NOTIFICATION_PCSC_FILE_ACCESS_DENIED = 393216;
  static const int RFID_NOTIFICATION_PCSC_APPLICATION_SELECTED = 458752;
  static const int RFID_NOTIFICATION_AC_PROCEDURE_START = 524288;
  static const int RFID_NOTIFICATION_AC_PROCEDURE_FINISH = 589824;
  static const int RFID_NOTIFICATION_PA_SECURITY_OBJECT_CHECK = 655360;
  static const int RFID_NOTIFICATION_PA_FILE_CHECK = 720896;
  static const int RFID_NOTIFICATION_PCSC_UPDATING_DATAGROUP = 786432;
  static const int RFID_NOTIFICATION_AUXILIARY_DATA_VALIDATION = 851968;
  static const int RFID_NOTIFICATION_RI_SECTOR_ID = 917504;
  static const int RFID_NOTIFICATION_BIOMETRICS_EMPTY_PLACEHOLDER = 983040;
  static const int RFID_ERROR_NO_ERROR = 1;
  static const int RFID_ERROR_ALREADY_DONE = 2;
  static const int RFID_LAYER6_FILE_EOF1 = -2147458430;
  static const int RFID_LAYER6_PWD_DEACTIVATED = -2147458429;
  static const int RFID_LAYER6_PWD_BLOCKED = -2147458112;
  static const int RFID_LAYER6_PWD_SUSPENDED = -2147458111;
  static const int RFID_LAYER6_PWD_BLOCKED_2 = -2147456637;
  static const int RFID_LAYER6_PWD_DEACTIVATED_2 = -2147456636;
  static const int RFID_LAYER6_PWD_SUSPENDED_2 = -2147456635;
  static const int RFID_LAYER6_MSE_SET_AT_FAILURE = -2046819578;
  static const int RFID_LAYER6_INCORRECT_PARAMS = -2147456384;
  static const int RFID_LAYER6_FILE_NOT_FOUND = -2147456382;
  static const int RFID_LAYER6_NO_REFERENCE_DATA = -2147456376;
  static const int RFID_LAYER6_FILE_EOF2 = -2147456256;
  static const int RFID_Error_GraphManager = -2147418112;
  static const int RFID_ERROR_NO_CHIP_DETECTED = -2147418111;
  static const int RFID_ERROR_NOT_AVAILABLE = -2147418110;
  static const int RFID_ERROR_INVALID_PARAMETER = -2147418108;
  static const int RFID_ERROR_NOT_INITIALIZED = -2147418107;
  static const int RFID_Error_NotEnoughMemory = -2147418106;
  static const int RFID_ERROR_INVALID_DIRECTORY = -2147418104;
  static const int RFID_ERROR_UNKNOWN_COMMAND = -2147418103;
  static const int RFID_ERROR_FILE_IO_ERROR = -2147418102;
  static const int RFID_ERROR_BUSY = -2147418101;
  static const int RFID_ERROR_OLD_FIRMWARE = -2147418100;
  static const int RFID_ERROR_PCSC_FAILED = -2147352576;
  static const int RFID_ERROR_PCSC_READER_NOT_AVAILABLE = -2147352575;
  static const int RFID_ERROR_PCSC_CANT_CONNECT_CARD = -2147352574;
  static const int RFID_ERROR_PCSC_CARD_IS_NOT_CONNECTED = -2147352573;
  static const int RFID_ERROR_PCSC_OPERATION_CANCELLED = -2147352572;
  static const int RFID_ERROR_PCSC_CARD_IS_BUSY = -2147352571;
  static const int RFID_ERROR_PCSC_FAILED_S_CARD = -2147352570;
  static const int RFID_ERROR_PCSC_EXT_LE_FAILED = -2147352560;
  static const int RFID_LAYER6_PWD_FAILED = -2146409536;
  static const int RFID_ERROR_NOT_PERFORMED = -2097152000;
  static const int RFID_ERROR_SESSION_IS_CLOSED = -2097151999;
  static const int RFID_ERROR_SESSION_TERMINAL_UNSUPPORTED_OPERATION = -2097151998;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_UNKNOWN = -2097151984;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_BAD_CERTIFICATE = -2097151983;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_NOT_SET = -2097151982;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_UNKNOWN = -2097151981;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_UNSUPPORTED = -2097151980;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_NOT_SET = -2097151979;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_UNKNOWN_TYPE = -2097151978;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_UNSUPPORTED_SM_TYPE = -2097151977;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_INCORRECT_SM_TYPE = -2097151976;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_RESTRICTED = -2097151975;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_INCORRECT_DATA = -2097151974;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_NOT_SET = -2097151973;
  static const int RFID_ERROR_SESSION_PWD_MANAGEMENT_NOT_AUTHORIZED = -2097151972;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_UNKNOWN_TYPE = -2097151968;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_SM = -2097151967;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_PACE = -2097151966;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_CA_KEYS = -2097151965;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_TA = -2097151964;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_CA = -2097151963;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_INCORRECT_OPTION_CA = -2097151962;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_CA_FAILED = -2097151961;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_TA_FAILED = -2097151960;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_AA_FAILED = -2097151959;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_RI_FAILED = -2097151958;
  static const int RFID_ERROR_SESSION_PA_SIGNATURE_CHECK_FAILED = -2097151952;
  static const int RFID_ERROR_SESSION_PA_HASH_CHECK_FAILED = -2097151951;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_DATE_OF_EXPIRY = -2097151936;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_DATE_OF_BIRTH = -2097151935;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_COMMUNITY_ID = -2097151934;
  static const int RFID_ERROR_SESSION_E_SIGN_REQUIRES_APP_SELECTION = -2097151920;
  static const int RFID_ERROR_SESSION_E_SIGN_PIN_NOT_SET = -2097151919;
  static const int RFID_ERROR_SESSION_E_SIGN_PIN_NOT_VERIFIED = -2097151918;
  static const int RFID_ERROR_SESSION_INCORRECT_DATA = -2097151904;
  static const int RFID_ERROR_SESSION_FILE_NOT_ENOUGH_DATA = -2097086464;
  static const int RFID_ERROR_SESSION_FILE_INCORRECT_DATA = -2097020928;
  static const int RFID_ERROR_SESSION_FILE_UNEXPECTED_DATA = -2096955392;
  static const int RFID_ERROR_SESSION_FILE_CONTENTS_UNEXPECTED_DATA = -2096889856;
  static const int RFID_ERROR_SESSION_FILE_WRONG_TAG = -2096824320;
  static const int RFID_ERROR_SESSION_FILE_CANT_USE_DATA = -2096758784;
  static const int RFID_ERROR_SESSION_FILE_CANT_READ_DATA = -2096693248;
  static const int RFID_ERROR_SESSION_FILE_ACCESS_DENIED = -2096627712;
  static const int RFID_LAYER6_SECURITY_MANAGER = -2046820352;
  static const int RFID_LAYER6_APP_SELECTION_FAILURE = -2046820351;
  static const int RFID_LAYER6_MUTUAL_AUTH_MAC_FAIL = -2046820096;
  static const int RFID_LAYER6_MUTUAL_AUTH_ENC_FAIL = -2046820095;
  static const int RFID_LAYER6_MUTUAL_AUTH_FAILURE = -2046820094;
  static const int RFID_LAYER6_SM_DO8E_MISSING = -2046819840;
  static const int RFID_LAYER6_SM_DO87_MISSING = -2046819839;
  static const int RFID_LAYER6_SM_DO99_MISSING = -2046819838;
  static const int RFID_LAYER6_SM_MAC_INCORRECT = -2046819837;
  static const int RFID_LAYER6_SM_DO87_INCORRECT = -2046819836;
  static const int RFID_LAYER6_NON_TLV_RESPONSE_DATA = -2046819584;
  static const int RFID_LAYER6_WRONG_RND_ICC_LENGTH = -2046819583;
  static const int RFID_LAYER6_INT_AUTH_FAILURE = -2046819582;
  static const int RFID_LAYER6_MSE_SET_KAT_FAILURE = -2046819581;
  static const int RFID_LAYER6_MSE_SET_DST_FAILURE = -2046819580;
  static const int RFID_LAYER6_PSO_CERTIFICATE_FAILURE = -2046819579;
  static const int RFID_LAYER6_GET_CHALLENGE_FAILURE = -2046819577;
  static const int RFID_LAYER6_EXT_AUTH_FAILURE = -2046819576;
  static const int RFID_LAYER6_GENERAL_AUTH_FAILURE = -2046819575;
  static const int RFID_ERROR_FAILED = -1;

  static String getTranslation(int value) {
    switch (value) {
      case RFID_ERROR_NO_ERROR:
        return "OK";
      case -2147483647:
        return "Error - ASN: Incorrect data";
      case -2147483646:
        return "Error - ASN: Not enough data";
      case -2147483645:
        return "Error - ASN: Contents unexpected data";
      case -2147483640:
        return "Error - ASN Signed data: Incorrect data";
      case -2147483639:
        return "Error - ASN Signed data: Encap contents incorrect data";
      case -2147483638:
        return "Error - ASN Signed data: Version incorrect data";
      case -2147483631:
        return "Error - ASN Signed data: Digest algorithms incorrect data";
      case -2147483629:
        return "Error - ASN LDS object: Incorrect data";
      case -2147483628:
        return "Error - ASN LDS object: Version incorrect data";
      case -2147483627:
        return "Error - ASN LDS object: Digest algorithm incorrect data";
      case -2147483626:
        return "Error - ASN LDS object: DG hashes incorrect data";
      case -2147483630:
        return "Error - ASN LDS object: Version info incorrect data";
      case -2147483625:
        return "Error - ASN Certificate: Incorrect data";
      case -2147483624:
        return "Error - ASN Certificate: Version incorrect data";
      case -2147483623:
        return "Error - ASN Certificate: SN incorrect data";
      case -2147483622:
        return "Error - ASN Certificate: Signature incorrect data";
      case -2147483621:
        return "Error - ASN Certificate: Issuer incorrect data";
      case -2147483620:
        return "Error - ASN Certificate: Validity incorrect data";
      case -2147483619:
        return "Error - ASN Certificate: Subject incorrect data";
      case -2147483618:
        return "Error - ASN Certificate: Subject PK incorrect data";
      case -2147483617:
        return "Error - ASN Certificate: Extensions incorrect data";
      case -2147483616:
        return "Error - ASN Signer info: Incorrect data";
      case -2147483615:
        return "Error - ASN Signer info: Version incorrect data";
      case -2147483614:
        return "Error - ASN Signer info: SID incorrect data";
      case -2147483613:
        return "Error - ASN Signer info: Digest algorithms incorrect data";
      case -2147483612:
        return "Error - ASN Signer info: Signed attributes incorrect data";
      case -2147483611:
        return "Error - ASN Signer info: Sign algorithms incorrect data";
      case -2147483610:
        return "Error - ASN Signer info: Signature incorrect data";
      case -2147483609:
        return "Error - ASN Signer info: Unsigned attributes incorrect data";
      case -2147483600:
        return "Error - ICAO LDS object: Unsupported digest algorithm";
      case -2147483599:
        return "Error - ICAO Signed data: Signer infos empty";
      case -2147483598:
        return "Error - ICAO Signer info: Unsupported digest algorithm";
      case -2147483597:
        return "Error - ICAO Signer info: Unsupported signature algorithm";
      case -2147483596:
        return "Error - ICAO Signer info: Message digest error";
      case -2147483594:
        return "Error - ICAO Signer info: Signed attributes missed";
      case -2147483595:
        return "Error - Auth: Signer info cant find certificate";
      case -2147483568:
        return "Error - Auth: Error";
      case -2147483567:
        return "Error - Auth: Unsupported signature algorithm";
      case -2147483566:
        return "Error - Auth: Unsupported public key algorithm";
      case -2147483565:
        return "Error - Auth: Messed algorithms";
      case -2147483564:
        return "Error - Auth: Public key data invalid";
      case -2147483563:
        return "Error - Auth: Algorithm parameters data invalid";
      case -2147483562:
        return "Error - Auth: Signature data invalid";
      case -2147483561:
        return "Error - Auth: Unsupported digest algorithm";
      case -2147483560:
        return "Error - Auth: Signature data incorrect";
      case -2147483559:
        return "Error - Auth: Algorithm parameters not defined";
      case -2147483558:
        return "Error - Auth: Signature check failed";
      case -2147483536:
        return "Error - DG: Wrong Tag";
      case -2130706400:
        return "Error - PACE: Info Not Available";
      case -2130706399:
        return "Error - PACE: Symmetric Cypher Cannot Initialize";
      case -2130706398:
        return "Error - PACE: Key Agreement Cannot Initialize";
      case -2130706397:
        return "Error - PACE: Ephemeral Keys Cannot Create";
      case -2130706396:
        return "Error - PACE: Mapping Cannot Decode Nonce";
      case -2130706395:
        return "Error - PACE: Shared Secret Cannot Create";
      case -2130706394:
        return "Error - PACE: Domain Params Unsupported Format";
      case -2130706393:
        return "Error - PACE: Ephemeral Keys Incorrect";
      case -2130706392:
        return "Error - PACE: Mapping Ephemeral Keys Incorrect";
      case -2130706391:
        return "Error - PACE: Mapping Cannot Perform";
      case -2130706390:
        return "Error - PACE: Non Matching Auth Tokens";
      case -2130706384:
        return "Error - CA: Cannot Find Public Key";
      case -2130706383:
        return "Error - CA: Cannot Find Info";
      case -2130706382:
        return "Error - CA: Incorrect Version";
      case -2130706381:
        return "Error - CA: Cannot Find Domain Parameters";
      case -2130706380:
        return "Error - CA: Key Agreement Cannot Initialize";
      case -2130706379:
        return "Error - CA: Public Key Unsupported Algorithm";
      case -2130706378:
        return "Error - CA: Ephemeral Keys Cannot Create";
      case -2130706377:
        return "Error - CA: Shared Secret Cannot Create";
      case -2130706376:
        return "Error - CA: Non Matching Auth Tokens";
      case -2130706368:
        return "Error - TA: Incorrect Version";
      case -2130706367:
        return "Error - TA: Cannot Build Certificate Chain";
      case -2130706366:
        return "Error - TA: Cannot Find IS Private Key";
      case -2130706365:
        return "Error - TA: Public Key Unsupported Algorithm";
      case -2130706364:
        return "Error - TA: Signature Building Error";
      case -2130706363:
        return "Error - TA: Invalid Key Algorithm Parameters";
      case -2130706352:
        return "Error - AA: Public Key Unsupported Algorithm";
      case -2130706351:
        return "Error - AA: Public Key Incorrect Data";
      case -2130706350:
        return "Error - AA: Public Key Incorrect Parameters";
      case -2130706349:
        return "Error - AA: Public Key Undefined Parameters";
      case -2130706348:
        return "Error - AA: Signature Incorrect Data";
      case -2130706347:
        return "Error - AA: Unsupported recovery scheme";
      case -2130706346:
        return "Error - AA: Incorrect Trailer";
      case -2130706345:
        return "Error - AA: Unsupported Digest Algorithm";
      case -2130706320:
        return "Error - RI: Sector Key Cannot Find";
      case -2130706319:
        return "Error - RI: Sector Key Incorrect Data";
      case -2130706318:
        return "Error - RI: Sector Key Incomplete Data";
      case -2130706336:
        return "Error - CV Certificate: Missing mandatory data PK";
      case -2130706334:
        return "Error - CV Certificate: Public key unsupported";
      case -2130706333:
        return "Error - CV Certificate: CHAT unsupported terminal type";
      case -2130706332:
        return "Error - CV Certificate: Private key unsupported";
      case -2130706331:
        return "Error - CV Certificate: Private key invalid params";
      case -2130706080:
        return "Error - CV Certificate: Incorrect data";
      case -2130706079:
        return "Error - CV Certificate: CPI incorrect data";
      case -2130706078:
        return "Error - CV Certificate: CAR incorrect data";
      case -2130706077:
        return "Error - CV Certificate: Public key incorrect data";
      case -2130706076:
        return "Error - CV Certificate: CHR incorrect data";
      case -2130706075:
        return "Error - CV Certificate: CHAT incorrect data";
      case -2130706074:
        return "Error - CV Certificate: Valid from incorrect data";
      case -2130706073:
        return "Error - CV Certificate: Valid to incorrect data";
      case -2130706072:
        return "Error - CV Certificate: Extensions incorrect data";
      case -2130706071:
        return "Error - CV Certificate: Private key incorrect data";
      case -2130706070:
        return "Error - CV Certificate: Private key missing";
      case -1879048191:
        return "Notification - ASN certificate: Incorrect version";
      case -1879048190:
        return "Notification - ASN certificate: Non matching signature algorithm";
      case -1879048189:
        return "Notification - ASN certificate: Incorrect time coding";
      case -1879048188:
        return "Notification - ASN certificate: Incorrect use of generalized time";
      case -1879048187:
        return "Notification - ASN certificate: Empty issuer";
      case -1879048186:
        return "Notification - ASN certificate: Empty subject";
      case -1879048184:
        return "Notification - ASN certificate: Unsupported critical extension";
      case -1879048178:
        return "Notification - ASN certificate: Forced default CSCA role";
      case -1879048177:
        return "Notification - ASN certificate: Forced Default DS role";
      case -1879048176:
        return "Notification - ASN certificate: Incorrect issuer subject DS";
      case -1879048169:
        return "Notification - ASN certificate: Duplicating extensions";
      case -1879047680:
        return "Notification - ICAO certificate: Version missed";
      case -1879047679:
        return "Notification - ICAO certificate: Version incorrect";
      case -1879047678:
        return "Notification - ICAO certificate: Issuer country missed";
      case -1879047677:
        return "Notification - ICAO certificate: Issuer common name missed";
      case -1879047676:
        return "Notification - ICAO certificate: Issuer country non compliant";
      case -1879047675:
        return "Notification - ICAO certificate: Subject country missed";
      case -1879047674:
        return "Notification - ICAO certificate: Subject common name missed";
      case -1879047673:
        return "Notification - ICAO certificate: Subject country non compliant";
      case -1879047672:
        return "Notification - ICAO certificate: Using non compliant data";
      case -1879047671:
        return "Notification - ICAO certificate: Unsupported signature algorithm";
      case -1879047670:
        return "Notification - ICAO certificate: Unsupported public key algorithm";
      case -1879047669:
        return "Notification - ICAO certificate: Missed extensions";
      case -1879047668:
        return "Notification - ICAO certificate: Validity";
      case -1879047667:
        return "Notification - ICAO certificate extension: Using non compliant data";
      case -1879047666:
        return "Notification - ICAO certificate extension: Key usage missed";
      case -1879047665:
        return "Notification - ICAO certificate extension: Key usage not critical";
      case -1879047664:
        return "Notification - ICAO certificate extension: Ext key usage incorrect data";
      case -1879047663:
        return "Notification - ICAO certificate extension: Basic constraints missed";
      case -1879047662:
        return "Notification - ICAO certificate extension: Basic constraints incorrect usage 1";
      case -1879047661:
        return "Notification - ICAO certificate extension: Basic constraints incorrect usage 2";
      case -1879047660:
        return "Notification - ICAO certificate extension: Basic constraints not critical";
      case -1879047659:
        return "Notification - ICAO certificate extension: Basic constraints incorrect data";
      case -1879047658:
        return "Notification - ICAO certificate extension: Basic constraints path LenC missed";
      case -1879047657:
        return "Notification - ICAO certificate extension: Basic constraints path LenC incorrect";
      case -1879047656:
        return "Notification - ICAO certificate extension: Ext key usage not critical";
      case -1879047655:
        return "Notification - ICAO certificate extension: Ext key usage incorrect usage";
      case -1879047654:
        return "Notification - ICAO certificate extension: Ext key usage incorrect data";
      case -1879047653:
        return "Notification - ICAO certificate extension Auth key: ID missed";
      case -1879047652:
        return "Notification - ICAO certificate extension Auth key: Incorrect data";
      case -1879047651:
        return "Notification - ICAO certificate extension Auth key: Key ID missed";
      case -1879047650:
        return "Notification - ICAO certificate extension: Subject key ID missed";
      case -1879047649:
        return "Notification - ICAO certificate extension: Subject key ID incorrect data";
      case -1879047648:
        return "Notification - ICAO certificate extension: Private key UP missed";
      case -1879047647:
        return "Notification - ICAO certificate extension: Private key UP incorrect data";
      case -1879047646:
        return "Notification - ICAO certificate extension: Private key UP empty";
      case -1879047645:
        return "Notification - ICAO certificate extension: Subject alt name missed";
      case -1879047644:
        return "Notification - ICAO certificate extension: Subject alt name incorrect data";
      case -1879047643:
        return "Notification - ICAO certificate extension: Subject alt name empty";
      case -1879047642:
        return "Notification - ICAO certificate extension: Subject alt name non compliant";
      case -1879047639:
        return "Notification - ICAO certificate extension: Subject alt name DN empty";
      case -1879047638:
        return "Notification - ICAO certificate extension: Subject alt name DN incorrect";
      case -1879047637:
        return "Notification - ICAO certificate extension: Subject alt name DN non compliant";
      case -1879047636:
        return "Notification - ICAO certificate extension: Issuer alt name missed";
      case -1879047635:
        return "Notification - ICAO certificate extension: Issuer alt name incorrect data";
      case -1879047634:
        return "Notification - ICAO certificate extension: Issuer alt name empty";
      case -1879047633:
        return "Notification - ICAO certificate extension: Issuer alt name non compliant";
      case -1879047630:
        return "Notification - ICAO certificate extension: Issuer alt name DN empty";
      case -1879047629:
        return "Notification - ICAO certificate extension: Issuer alt name DN incorrect";
      case -1879047628:
        return "Notification - ICAO certificate extension: Issuer alt name DN non compliant";
      case -1879047627:
        return "Notification - ICAO certificate extension Doc type list: Missed";
      case -1879047626:
        return "Notification - ICAO certificate extension Doc type list: Incorrect data";
      case -1879047625:
        return "Notification - ICAO certificate extension Doc type list: Version";
      case -1879047624:
        return "Notification - ICAO certificate extension Doc type list: Doc types";
      case -1879047623:
        return "Notification - ICAO certificate extension Doc type list: Doc types empty";
      case -1879047622:
        return "Notification - ICAO certificate extension: Dert policies incorrect data";
      case -1879047621:
        return "Notification - ICAO certificate extension: Cert policies empty";
      case -1879047620:
        return "Notification - ICAO certificate extension: Cert policies policy ID missed";
      case -1879047619:
        return "Notification - ICAO certificate extension: CRL dist point missed";
      case -1879047618:
        return "Notification - ICAO certificate extension: CRL dist point incorrect data";
      case -1879047617:
        return "Notification - ICAO certificate extension: CRL dist point empty";
      case -1879047616:
        return "Notification - ICAO certificate extension: CRL dist point point missed";
      case -1879048160:
        return "Notification - ICAO COM: LDS version incorrect";
      case -1879048159:
        return "Notification - ICAO COM: LDS version missing";
      case -1879048158:
        return "Notification - ICAO COM: Unicode version incorrect";
      case -1879048157:
        return "Notification - ICAO COM: Unicode version missing";
      case -1879048156:
        return "Notification - ICAO COM: DGPM incorrect";
      case -1879048155:
        return "Notification - ICAO COM: DGPM missing";
      case -1879048154:
        return "Notification - ICAO COM: DGPM unexpected";
      case -1879048144:
        return "Notification - ICAO application: LDS version unsupported";
      case -1879048143:
        return "Notification - ICAO application: Unicode version unsupported";
      case -1879048142:
        return "Notification - ICAO application: LDS version inconsistent";
      case -1879048141:
        return "Notification - ICAO application: Unicode version inconsistent";
      case -1879047936:
        return "Notification - ASN signed data: OID incorrect";
      case -1879047776:
        return "Notification - ASN signed data: Version incorrect";
      case -1879047935:
        return "Notification - ICAO signed data: Version incorrect";
      case -1879047934:
        return "Notification - ICAO signed data: Digest algorithms empty";
      case -1879047933:
        return "Notification - ICAO signed data: Digest algorithms unsupported";
      case -1879047927:
        return "Notification - ICAO signed data: Signer infos multiple entries";
      case -1879047760:
        return "Notification - ICAO signed data: Certificates missed";
      case -1879047759:
        return "Notification - ICAO signed data: Certificates empty";
      case -1879047758:
        return "Notification - ICAO signed data: CRLs incorrect usage";
      case -1879047932:
        return "Notification - ICAO LDS object: Incorrect content OID";
      case -1879047931:
        return "Notification - ICAO LDS object: DG number incorrect";
      case -1879047930:
        return "Notification - ICAO LDS object: DG hash missing";
      case -1879047929:
        return "Notification - ICAO LDS object: DG hash extra";
      case -1879047928:
        return "Notification - ICAO LDS object: Version incorrect";
      case -1879047744:
        return "Notification - ICAO master list: Version incorrect";
      case -1879047926:
        return "Notification - ASN signer info: Version incorrect";
      case -1879047925:
        return "Notification - ASN signer info: SID incorrect choice";
      case -1879047924:
        return "Notification - ASN signer info: SID digest algorithm not listed";
      case -1879047923:
        return "Notification - ASN signer info: Message digest attr missing";
      case -1879047922:
        return "Notification - ASN signer info: Message digest attr data";
      case -1879047921:
        return "Notification - ASN signer info: Message digest attr value";
      case -1879047920:
        return "Notification - ASN signer info: Content type attr missing";
      case -1879047919:
        return "Notification - ASN signer info: Content type attr data";
      case -1879047918:
        return "Notification - ASN signer info: Content type attr value";
      case -1879047909:
        return "Notification - ASN signer info: Signing time attr missing";
      case -1879047908:
        return "Notification - ASN signer info: Signing time attr data";
      case -1879047907:
        return "Notification - ASN signer info: Signing time attr value";
      case -1879047915:
        return "Notification - Auth signer info: Certificate validity";
      case -1879047914:
        return "Notification - Auth signer info: Certificate root is not trusted";
      case -1879047913:
        return "Notification - Auth signer info: Certificate cant find CSCA";
      case -1879047912:
        return "Notification - Auth signer info: Certificate revoked";
      case -1879047911:
        return "Notification - Auth signer info: Certificate signature invalid";
      case -1879047910:
        return "Notification: Unsupported image format";
      case 139272:
        return "Notification - MRZ: Document type unknown";
      case 139273:
        return "Notification - MRZ: Issuing state syntax error";
      case 139274:
        return "Notification - MRZ: Name is void";
      case 139277:
        return "Notification - MRZ: Number incorrect checksum";
      case 139278:
        return "Notification - MRZ: Nationality syntax error";
      case 139279:
        return "Notification - MRZ: DOB syntax error";
      case 139280:
        return "Notification - MRZ: DOB error";
      case 139281:
        return "Notification - MRZ: DOB incorrect checksum";
      case 139282:
        return "Notification - MRZ: Sex incorrect";
      case 139283:
        return "Notification - MRZ: DOE syntax error";
      case 139284:
        return "Notification - MRZ: DOE error";
      case 139285:
        return "Notification - MRZ: DOE incorrect checksum";
      case 139286:
        return "Notification - MRZ: Optional data incorrect checksum";
      case 139287:
        return "Notification - MRZ: Incorrect checksum";
      case 139288:
        return "Notification - MRZ: Incorrect";
      case -1878982656:
        return "Notification - Biometrics: Format owner missing";
      case -1878917120:
        return "Notification - Biometrics: Format owner incorrect";
      case -1878851584:
        return "Notification - Biometrics: Format type missing";
      case -1878786048:
        return "Notification - Biometrics: Format type incorrect";
      case -1878720512:
        return "Notification - Biometrics: Type incorrect";
      case -1878654976:
        return "Notification - Biometrics: Subtype missing";
      case -1878589440:
        return "Notification - Biometrics: Subtype incorrect";
      case -1878523904:
        return "Notification - Biometrics: BDB image missing";
      case -1878458368:
        return "Notification - Biometrics: BDB format ID incorrect";
      case -1878392832:
        return "Notification - Biometrics: BDB version incorrect";
      case -1878327296:
        return "Notification - Biometrics: BDB data length incorrect";
      case -1877999616:
        return "Notification - Biometrics: BDB Data Gender";
      case -1877934080:
        return "Notification - Biometrics: BDB Data Eye Color";
      case -1877868544:
        return "Notification - Biometrics: BDB Data Hair Color";
      case -1877803008:
        return "Notification - Biometrics: BDB Data Pose Angle Yaw";
      case -1877737472:
        return "Notification - Biometrics: BDB Data Pose Angle Pitch";
      case -1877671936:
        return "Notification - Biometrics: BDB Data Pose Angle Roll";
      case -1877606400:
        return "Notification - Biometrics: BDB Data Pose Angle U Yaw";
      case -1877540864:
        return "Notification - Biometrics: BDB Data Pose Angle U Pitch";
      case -1877475328:
        return "Notification - Biometrics: BDB Data Pose Angle U Roll";
      case -1877409792:
        return "Notification - Biometrics: BDB Data Face Image Type";
      case -1877344256:
        return "Notification - Biometrics: BDB Data Image Data Type";
      case -1862270976:
        return "Notification - SI: PACE Info Unsupported Std Parameters";
      case -1862270975:
        return "Notification - SI: PACE Info Deprecated Version";
      case -1862270974:
        return "Notification - SI: PACE Domain Params Using Std Ref";
      case -1862270973:
        return "Notification - SI: PACE Domain Params Unsupported Algorithm";
      case -1862270972:
        return "Notification - SI: CA Info Incorrect Version";
      case -1862270971:
        return "Notification - SI: CA PublicKey Unsupported Algorithm";
      case -1862270970:
        return "Notification - SI: CA Domain Params Unsupported Algorithm";
      case -1862270969:
        return "Notification - SI: TA Info Incorrect Version";
      case -1862270968:
        return "Notification - SI: TA Info File ID For Version 2";
      case -1862270967:
        return "Notification - SI: eID Security Unsupported Digest Algorithm";
      case -1862270966:
        return "Notification - SI: RI info incorrect version";
      case -1862270965:
        return "Notification - SI: RI domain params unsupported algorithm";
      case -1862270964:
        return "Notification - SI: AA info incorrect version";
      case -1862270963:
        return "Notification - SI: AA info unsupported algorithm";
      case -1862270962:
        return "Notification - SI: AA info inconsistent algorithm reference";
      case -1862270720:
        return "Notification - SI: PACE Info Not Available";
      case -1862270719:
        return "Notification - SI: PACE Info No Std Parameters";
      case -1862270718:
        return "Notification - SI: PACE Info No Matching Domain Params";
      case -1862270717:
        return "Notification - SI: CA Info Not Available";
      case -1862270716:
        return "Notification - SI: CA Domain Params No Required Option";
      case -1862270715:
        return "Notification - SI: CA Domain Params Not Available";
      case -1862270714:
        return "Notification - SI: CA Anonymous Infos";
      case -1862270713:
        return "Notification - SI: CA Info No Matching Domain Params";
      case -1862270712:
        return "Notification - SI: CA Info No Matching Public Key";
      case -1862270711:
        return "Notification - SI: CA Incorrect Infos Quantity";
      case -1862270710:
        return "Notification - SI: TA Info Not Available";
      case -1862270709:
        return "Notification - SI: Card Info Locator Multiple Entries";
      case -1862270708:
        return "Notification - SI: eID Security Info Multiple Entries";
      case -1862270707:
        return "Notification - SI: Privileged TI Multiple Entries";
      case -1862270706:
        return "Notification - SI: Privileged TI Incorrect Usage";
      case -1862270705:
        return "Notification - SI: RI domain params multiple entries";
      case -1862270704:
        return "Notification - SI: Storage PACE Info Non Consistant";
      case -1862270463:
        return "Notification - CV Certificate: Profile incorrect version";
      case -1862270462:
        return "Notification - CV Certificate: Validity";
      case -1862270461:
        return "Notification - CV Certificate: Non CVCA domain parameters";
      case -1862270460:
        return "Notification - CV Certificate: Private key incorrect version";
      case -1862270208:
        return "Notification - TA: PACE static binding used";
      case -1845493483:
        return "Notification - Auth ML signer info: Certificate validity";
      case -1845493482:
        return "Notification - Auth ML signer info: Certificate root is not trusted";
      case -1845493481:
        return "Notification - Auth ML signer info: Certificate cant find CSCA";
      case -1845493480:
        return "Notification - Auth ML signer info: Certificate revoked";
      case -1845493479:
        return "Notification - Auth ML signer info: Certificate signature invalid";
      case RFID_ERROR_ALREADY_DONE:
        return "RFID: Requested operation is already done";
      case RFID_ERROR_FAILED:
        return "RFID: Failed";
      case RFID_Error_GraphManager:
        return "RFID: Creation or connection to Graph Manager COM server failed";
      case RFID_ERROR_NO_CHIP_DETECTED:
        return "RFID: No chip is detected";
      case RFID_ERROR_NOT_AVAILABLE:
        return "RFID: Unavailable";
      case RFID_ERROR_INVALID_PARAMETER:
        return "RFID: Invalid parameter in ExecuteCommand() call found";
      case RFID_ERROR_NOT_INITIALIZED:
        return "RFID: Device is uninitialized";
      case RFID_Error_NotEnoughMemory:
        return "RFID: Out of memory";
      case RFID_ERROR_INVALID_DIRECTORY:
        return "RFID: Invalid directory";
      case RFID_ERROR_UNKNOWN_COMMAND:
        return "RFID: Unknown command";
      case RFID_ERROR_FILE_IO_ERROR:
        return "RFID File: IO Error";
      case RFID_ERROR_BUSY:
        return "RFID: RFID is Busy";
      case -2147418100:
        return "RFID: Firmware need to be updated with newer version";
      case -2147352576:
        return "PCSC: Failed";
      case -2147352575:
        return "PCSC: Reader is unavailable";
      case -2147352574:
        return "PCSC: Card cannot be connected";
      case -2147352573:
        return "PCSC: Card is not connected";
      case -2147352572:
        return "PCSC: Operation is cancelled";
      case -2147352571:
        return "PCSC: Card Is Busy";
      case -2147352570:
        return "PCSC: Failed Smart Card";
      case -2147352560:
        return "PCSC: ExtLe Failed";
      case -2046820352:
        return "LAYER6: Secure Messaging was not activated";
      case -2046820351:
        return "LAYER6: ISO7816_A_03 \"Application selection failure\"";
      case -2046820096:
        return "LAYER6: ISO7816_B_01 \"Mutual authentication MAC failure\"";
      case -2046820095:
        return "LAYER6: ISO7816_B_02 \"Mutual authentication encryption failure\"";
      case -2046820094:
        return "LAYER6: ISO7816_B_03 \"Mutual authentication failure\"";
      case -2046819840:
        return "LAYER6: SM failure – MAC missing";
      case -2046819839:
        return "LAYER6: SM failure – cryptogram missing";
      case -2046819838:
        return "LAYER6: SM failure – secured status bytes missing";
      case -2046819837:
        return "LAYER6: SM failure – incorrect MAC";
      case -2046819836:
        return "LAYER6: SM failure – incorrect cryptogram";
      case -2046819584:
        return "LAYER6: Not TLV response data";
      case -2046819583:
        return "LAYER6: Wrong data length (APDU_INS_GET_CHALLENGE)";
      case -2046819582:
        return "LAYER6: APDU_INS_INTERNAL_AUTHENTICATE failure";
      case -2046819581:
        return "LAYER6: MSE:Set KAT failure";
      case -2046819580:
        return "LAYER6: MSE:Set DST failure";
      case -2046819579:
        return "LAYER6: PSO CERTIFICATE failure";
      case -2046819578:
        return "LAYER6: MSE:Set AT failure";
      case -2046819577:
        return "LAYER6: GET CHALLENGE failure";
      case -2046819576:
        return "LAYER6: APDU_INS_EXTERNAL_AUTHENTICATE (External Authentication) failure";
      case -2046819575:
        return "LAYER6: General Authenticity Failure";
      case -2147456382:
        return "LAYER6: File selection failure / file not found";
      case -2147458430:
        return "LAYER6: Reading beyond EOF / Unexpected EOF";
      case -2147456256:
        return "LAYER6: Reading beyond EOF / Unexpected EOF";
      case -2147456384:
        return "LAYER6: Incorrect Params";
      case -2147456376:
        return "LAYER6: No Reference Data";
      case -2147458111:
        return "LAYER6: PWD Suspended";
      case -2147458112:
        return "LAYER6: PWD Blocked";
      case -2147458429:
        return "LAYER6: PWD Deactivatted";
      case -2147456637:
        return "LAYER6: PWD Blocked 2";
      case -2147456636:
        return "LAYER6: PWD Deactivated 2";
      case -2147456635:
        return "LAYER6: PWD Suspended 2";
      case -2146409536:
        return "LAYER6: PWD Failed";
      case -2097152000:
        return "RFID: Not Performed";
      case -2097151999:
        return "RFID: Session Is Closed";
      case -2097151998:
        return "RFID: Terminal Unsupported Operation";
      case -2097151984:
        return "RFID: Terminal Type Unknown";
      case -2097151983:
        return "RFID: Terminal Type Bad Certificate";
      case -2097151982:
        return "RFID: Terminal Type Not Set";
      case -2097151981:
        return "RFID: Procedure Type Unknown";
      case -2097151980:
        return "RFID: Procedure Type Unsupported";
      case -2097151979:
        return "RFID: Procedure Type Not Set";
      case -2097151978:
        return "RFID: Access Key Unknown Type";
      case -2097151977:
        return "RFID: Access Key Unsupported SM Type";
      case -2097151976:
        return "RFID: Access Key Incorrect SM Type";
      case -2097151975:
        return "RFID: Access Key Restricted";
      case -2097151974:
        return "RFID: Access Key Incorrect Data";
      case -2097151973:
        return "RFID: Access Key Not Set";
      case -2097151972:
        return "RFID: Pwd Management Not Authorized";
      case -2097151968:
        return "RFID: Access Control UnknownType";
      case -2097151967:
        return "RFID: Requires SM";
      case -2097151966:
        return "RFID: Requires PACE";
      case -2097151965:
        return "RFID: Requires CA Keys";
      case -2097151964:
        return "RFID: Requires TA";
      case -2097151963:
        return "RFID: Requires CA";
      case -2097151962:
        return "RFID: Incorrect Option CA";
      case -2097151961:
        return "RFID: CA Failed";
      case -2097151960:
        return "RFID: TA Failed";
      case -2097151959:
        return "RFID: AA Failed";
      case -2097151958:
        return "RFID: RI Failed";
      case -2097151952:
        return "RFID: SO Signature Check Failed";
      case -2097151951:
        return "RFID: Hash Check Failed";
      case -2097151936:
        return "RFID: Invalid Aux Data Date Of Expiry";
      case -2097151935:
        return "RFID: Invalid Aux Data Date Of Birth";
      case -2097151934:
        return "RFID: Invalid Aux Data Community ID";
      case -2097151920:
        return "RFID: eSign Requires App Selection";
      case -2097151919:
        return "RFID: eSign PIN Not Set";
      case -2097151918:
        return "RFID: eSign PIN Not Verified";
      case -2097151904:
        return "RFID: Incorrect data";
      case -2097086464:
        return "RFID File: Not Enough Data";
      case -2097020928:
        return "RFID File: Incorrect Data";
      case -2096955392:
        return "RFID File: Unexpected Data";
      case -2096889856:
        return "RFID File: Contents Unexpected Data";
      case -2096824320:
        return "RFID File: Wrong Tag";
      case -2096758784:
        return "RFID File: Cannot Use Data";
      case -2096693248:
        return "RFID File: Cannot Read Data";
      case RFID_ERROR_SESSION_FILE_ACCESS_DENIED:
        return "RFID File: Access Denied";
      default:
        return value.toString();
    }
  }
}

class eRFID_Password_Type {
  static const int PPT_UNKNOWN = 0;
  static const int PPT_MRZ = 1;
  static const int PPT_CAN = 2;
  static const int PPT_PIN = 3;
  static const int PPT_PUK = 4;
  static const int PPT_PIN_ESIGN = 5;
  static const int PPT_SAI = 6;
}

class eRFID_SDK_ProfilerType {
  static const int SPT_DOC_9303_EDITION_2006 = 0x00000001;
  static const int SPT_DOC_9303_LDS_PKI_MAINTENANCE = 0x00000002;
}

class eRFID_TerminalType {
  static const int TET_UNDEFINED = 0;
  static const int TET_INSPECTION_SYSTEM = 1;
  static const int TET_AUTHENTICATION_TERMINAL = 2;
  static const int TET_SIGNATURE_TERMINAL = 3;
  static const int TET_UNAUTHENTICATED_TERMINAL = 4;
}

class eRPRM_Authenticity {
  static const int NONE = 0;
  static const int UV_LUMINESCENCE = 1;
  static const int IR_B900 = 2;
  static const int IMAGE_PATTERN = 4;
  static const int AXIAL_PROTECTION = 8;
  static const int UV_FIBERS = 16;
  static const int IR_VISIBILITY = 32;
  static const int OCR_SECURITY_TEXT = 64;
  static const int IPI = 128;
  static const int PHOTO_EMBED_TYPE = 512;
  static const int HOLOGRAMS = 4096;
  static const int PHOTO_AREA = 8192;
  static const int PORTRAIT_COMPARISON = 32768;
  static const int BARCODE_FORMAT_CHECK = 65536;
  static const int KINEGRAM = 131072;
  static const int HOLOGRAMS_DETECTION = 524288;
}

class eRPRM_FieldVerificationResult {
  static const int RCF_DISABLED = 0;
  static const int RCF_VERIFIED = 1;
  static const int RCF_NOT_VERIFIED = 2;
  static const int RCF_COMPARE_TRUE = 3;
  static const int RCF_COMPARE_FALSE = 4;
}

class eRPRM_Lights {
  static const int NONE = 0;
  static const int RPRM_LIGHT_UV = 128;
  static const int RPRM_LIGHT_WHITE_FULL = 6;

  static String getTranslation(int value) {
    switch (value) {
      case RPRM_LIGHT_UV:
        return "UV";
      case RPRM_LIGHT_WHITE_FULL:
        return "Visible light";
      default:
        return value.toString();
    }
  }
}

class eRPRM_ResultType {
  static const int NONE = -1;
  static const int RPRM_RESULT_TYPE_EMPTY = 0;
  static const int RPRM_RESULT_TYPE_RAW_IMAGE = 1;
  static const int RPRM_RESULT_TYPE_FILE_IMAGE = 2;
  static const int RPRM_RESULT_TYPE_MRZ_OCR_EXTENDED = 3;
  static const int RPRM_RESULT_TYPE_BARCODES = 5;
  static const int RPRM_RESULT_TYPE_GRAPHICS = 6;
  static const int RPRM_RESULT_TYPE_MRZ_TEST_QUALITY = 7;
  static const int RPRM_RESULT_TYPE_DOCUMENT_TYPES_CANDIDATES = 8;
  static const int RPRM_RESULT_TYPE_CHOSEN_DOCUMENT_TYPE_CANDIDATE = 9;
  static const int RPRM_RESULT_TYPE_DOCUMENTS_INFO_LIST = 10;
  static const int RPRM_RESULT_TYPE_OCR_LEXICAL_ANALYZE = 15;
  static const int RPRM_RESULT_TYPE_RAW_UNCROPPED_IMAGE = 16;
  static const int RPRM_RESULT_TYPE_VISUAL_OCR_EXTENDED = 17;
  static const int RPRM_RESULT_TYPE_BAR_CODES_TEXT_DATA = 18;
  static const int RPRM_RESULT_TYPE_BAR_CODES_IMAGE_DATA = 19;
  static const int RPRM_RESULT_TYPE_AUTHENTICITY = 20;
  static const int RPRM_RESULT_TYPE_EOS_IMAGE = 23;
  static const int RPRM_RESULT_TYPE_BAYER_IMAGE = 24;
  static const int RPRM_RESULT_TYPE_MAGNETIC_STRIPE = 25;
  static const int RPRM_RESULT_TYPE_MAGNETIC_STRIPE_TEXT_DATA = 26;
  static const int RPRM_RESULT_TYPE_FIELD_FILE_IMAGE = 27;
  static const int RPRM_RESULT_TYPE_DATABASE_CHECK = 28;
  static const int RPRM_RESULT_TYPE_FINGERPRINT_TEMPLATE_ISO = 29;
  static const int RPRM_RESULT_TYPE_INPUT_IMAGE_QUALITY = 30;
  static const int RPRM_RESULT_TYPE_DOCUMENT_POSITION = 85;
  static const int RPRM_RESULT_TYPE_CUSTOM = 100;
  static const int RFID_RESULT_TYPE_RFID_RAW_DATA = 101;
  static const int RFID_RESULT_TYPE_RFID_TEXT_DATA = 102;
  static const int RFID_RESULT_TYPE_RFID_IMAGE_DATA = 103;
  static const int RFID_RESULT_TYPE_RFID_BINARY_DATA = 104;
  static const int RFID_RESULT_TYPE_RFID_ORIGINAL_GRAPHICS = 105;
  static const int RPRM_RESULT_TYPE_BARCODE_POSITION = 62;
  static const int RPRM_RESULT_TYPE_MRZ_POSITION = 61;
}

class eRPRM_SecurityFeatureType {
  static const int NONE = -1;
  static const int SECURITY_FEATURE_TYPE_BLANK = 0;
  static const int SECURITY_FEATURE_TYPE_FILL = 1;
  static const int SECURITY_FEATURE_TYPE_PHOTO = 2;
  static const int SECURITY_FEATURE_TYPE_MRZ = 3;
  static const int SECURITY_FEATURE_TYPE_FALSE_LUMINESCENCE = 4;
  static const int SECURITY_FEATURE_TYPE_HOLO_SIMPLE = 5;
  static const int SECURITY_FEATURE_TYPE_HOLO_VERIFY_STATIC = 6;
  static const int SECURITY_FEATURE_TYPE_HOLO_VERIFY_MULTI_STATIC = 7;
  static const int SECURITY_FEATURE_TYPE_HOLO_VERIFY_DINAMIC = 8;
  static const int SECURITY_FEATURE_TYPE_PATTERN_NOT_INTERRUPTED = 9;
  static const int SECURITY_FEATURE_TYPE_PATTERN_NOT_SHIFTED = 10;
  static const int SECURITY_FEATURE_TYPE_PATTERN_SAME_COLORS = 11;
  static const int SECURITY_FEATURE_TYPE_PATTERN_IR_INVISIBLE = 12;
  static const int SECURITY_FEATURE_TYPE_PHOTO_SIZE_CHECK = 13;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_VS_GHOST = 14;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_VS_RFID = 15;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_VS_VISUAL = 16;
  static const int SECURITY_FEATURE_TYPE_BARCODE = 17;
  static const int SECURITY_FEATURE_TYPE_PATTERN_DIFFERENT_LINES_THICKNESS = 18;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_VS_CAMERA = 19;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_RFID_VS_CAMERA = 20;
  static const int SECURITY_FEATURE_TYPE_GHOST_PHOTO = 21;
  static const int SECURITY_FEATURE_TYPE_CLEAR_GHOST_PHOTO = 22;
  static const int SECURITY_FEATURE_TYPE_INVISIBLE_OBJECT = 23;
  static const int SECURITY_FEATURE_TYPE_LOW_CONTRAST_OBJECT = 24;
  static const int SECURITY_FEATURE_TYPE_PHOTO_COLOR = 25;
  static const int SECURITY_FEATURE_TYPE_PHOTO_SHAPE = 26;
  static const int SECURITY_FEATURE_TYPE_PHOTO_CORNERS = 27;
  static const int DOCUMENT_CANCELLING_DETECTOR = 28;
}

class eSignManagementAction {
  static const int smaUndefined = 0;
  static const int smaCreatePIN = 1;
  static const int smaChangePIN = 2;
  static const int smaUnblockPIN = 3;
  static const int smaTerminatePIN = 4;
  static const int smaGenerateKeys = 5;
  static const int smaTerminateKeys = 6;
  static const int smaSignData = 7;
}

class eVisualFieldType {
  static const int FT_DOCUMENT_CLASS_CODE = 0;
  static const int FT_ISSUING_STATE_CODE = 1;
  static const int FT_DOCUMENT_NUMBER = 2;
  static const int FT_DATE_OF_EXPIRY = 3;
  static const int FT_DATE_OF_ISSUE = 4;
  static const int FT_DATE_OF_BIRTH = 5;
  static const int FT_PLACE_OF_BIRTH = 6;
  static const int FT_PERSONAL_NUMBER = 7;
  static const int FT_SURNAME = 8;
  static const int FT_GIVEN_NAMES = 9;
  static const int FT_MOTHERS_NAME = 10;
  static const int FT_NATIONALITY = 11;
  static const int FT_SEX = 12;
  static const int FT_HEIGHT = 13;
  static const int FT_WEIGHT = 14;
  static const int FT_EYES_COLOR = 15;
  static const int FT_HAIR_COLOR = 16;
  static const int FT_ADDRESS = 17;
  static const int FT_DONOR = 18;
  static const int FT_SOCIAL_SECURITY_NUMBER = 19;
  static const int FT_DL_CLASS = 20;
  static const int FT_DL_ENDORSED = 21;
  static const int FT_DL_RESTRICTION_CODE = 22;
  static const int FT_DL_UNDER_21_DATE = 23;
  static const int FT_AUTHORITY = 24;
  static const int FT_SURNAME_AND_GIVEN_NAMES = 25;
  static const int FT_NATIONALITY_CODE = 26;
  static const int FT_PASSPORT_NUMBER = 27;
  static const int FT_INVITATION_NUMBER = 28;
  static const int FT_VISA_ID = 29;
  static const int FT_VISA_CLASS = 30;
  static const int FT_VISA_SUB_CLASS = 31;
  static const int FT_MRZ_STRING_1 = 32;
  static const int FT_MRZ_STRING_2 = 33;
  static const int FT_MRZ_STRING_3 = 34;
  static const int FT_MRZ_TYPE = 35;
  static const int FT_OPTIONAL_DATA = 36;
  static const int FT_DOCUMENT_CLASS_NAME = 37;
  static const int FT_ISSUING_STATE_NAME = 38;
  static const int FT_PLACE_OF_ISSUE = 39;
  static const int FT_DOCUMENT_NUMBER_CHECKSUM = 40;
  static const int FT_DATE_OF_BIRTH_CHECKSUM = 41;
  static const int FT_DATE_OF_EXPIRY_CHECKSUM = 42;
  static const int FT_PERSONAL_NUMBER_CHECKSUM = 43;
  static const int FT_FINAL_CHECKSUM = 44;
  static const int FT_PASSPORT_NUMBER_CHECKSUM = 45;
  static const int FT_INVITATION_NUMBER_CHECKSUM = 46;
  static const int FT_VISA_ID_CHECKSUM = 47;
  static const int FT_SURNAME_AND_GIVEN_NAMES_CHECKSUM = 48;
  static const int FT_VISA_VALID_UNTIL_CHECKSUM = 49;
  static const int FT_OTHER = 50;
  static const int FT_MRZ_STRINGS = 51;
  static const int FT_NAME_SUFFIX = 52;
  static const int FT_NAME_PREFIX = 53;
  static const int FT_DATE_OF_ISSUE_CHECKSUM = 54;
  static const int FT_DATE_OF_ISSUE_CHECK_DIGIT = 55;
  static const int FT_DOCUMENT_SERIES = 56;
  static const int FT_REG_CERT_REG_NUMBER = 57;
  static const int FT_REG_CERT_CAR_MODEL = 58;
  static const int FT_REG_CERT_CAR_COLOR = 59;
  static const int FT_REG_CERT_BODY_NUMBER = 60;
  static const int FT_REG_CERT_CAR_TYPE = 61;
  static const int FT_REG_CERT_MAX_WEIGHT = 62;
  static const int FT_REG_CERT_WEIGHT = 63;
  static const int FT_ADDRESS_AREA = 64;
  static const int FT_ADDRESS_STATE = 65;
  static const int FT_ADDRESS_BUILDING = 66;
  static const int FT_ADDRESS_HOUSE = 67;
  static const int FT_ADDRESS_FLAT = 68;
  static const int FT_PLACE_OF_REGISTRATION = 69;
  static const int FT_DATE_OF_REGISTRATION = 70;
  static const int FT_RESIDENT_FROM = 71;
  static const int FT_RESIDENT_UNTIL = 72;
  static const int FT_AUTHORITY_CODE = 73;
  static const int FT_PLACE_OF_BIRTH_AREA = 74;
  static const int FT_PLACE_OF_BIRTH_STATE_CODE = 75;
  static const int FT_ADDRESS_STREET = 76;
  static const int FT_ADDRESS_CITY = 77;
  static const int FT_ADDRESS_JURISDICTION_CODE = 78;
  static const int FT_ADDRESS_POSTAL_CODE = 79;
  static const int FT_DOCUMENT_NUMBER_CHECK_DIGIT = 80;
  static const int FT_DATE_OF_BIRTH_CHECK_DIGIT = 81;
  static const int FT_DATE_OF_EXPIRY_CHECK_DIGIT = 82;
  static const int FT_PERSONAL_NUMBER_CHECK_DIGIT = 83;
  static const int FT_FINAL_CHECK_DIGIT = 84;
  static const int FT_PASSPORT_NUMBER_CHECK_DIGIT = 85;
  static const int FT_INVITATION_NUMBER_CHECK_DIGIT = 86;
  static const int FT_VISA_ID_CHECK_DIGIT = 87;
  static const int FT_SURNAME_AND_GIVEN_NAMES_CHECK_DIGIT = 88;
  static const int FT_VISA_VALID_UNTIL_CHECK_DIGIT = 89;
  static const int FT_PERMIT_DL_CLASS = 90;
  static const int FT_PERMIT_DATE_OF_EXPIRY = 91;
  static const int FT_PERMIT_IDENTIFIER = 92;
  static const int FT_PERMIT_DATE_OF_ISSUE = 93;
  static const int FT_PERMIT_RESTRICTION_CODE = 94;
  static const int FT_PERMIT_ENDORSED = 95;
  static const int FT_ISSUE_TIMESTAMP = 96;
  static const int FT_NUMBER_OF_DUPLICATES = 97;
  static const int FT_MEDICAL_INDICATOR_CODES = 98;
  static const int FT_NON_RESIDENT_INDICATOR = 99;
  static const int FT_VISA_TYPE = 100;
  static const int FT_VISA_VALID_FROM = 101;
  static const int FT_VISA_VALID_UNTIL = 102;
  static const int FT_DURATION_OF_STAY = 103;
  static const int FT_NUMBER_OF_ENTRIES = 104;
  static const int FT_DAY = 105;
  static const int FT_MONTH = 106;
  static const int FT_YEAR = 107;
  static const int FT_UNIQUE_CUSTOMER_IDENTIFIER = 108;
  static const int FT_COMMERCIAL_VEHICLE_CODES = 109;
  static const int FT_AKA_DATE_OF_BIRTH = 110;
  static const int FT_AKA_SOCIAL_SECURITY_NUMBER = 111;
  static const int FT_AKA_SURNAME = 112;
  static const int FT_AKA_GIVEN_NAMES = 113;
  static const int FT_AKA_NAME_SUFFIX = 114;
  static const int FT_AKA_NAME_PREFIX = 115;
  static const int FT_MAILING_ADDRESS_STREET = 116;
  static const int FT_MAILING_ADDRESS_CITY = 117;
  static const int FT_MAILING_ADDRESS_JURISDICTION_CODE = 118;
  static const int FT_MAILING_ADDRESS_POSTAL_CODE = 119;
  static const int FT_AUDIT_INFORMATION = 120;
  static const int FT_INVENTORY_NUMBER = 121;
  static const int FT_RACE_ETHNICITY = 122;
  static const int FT_JURISDICTION_VEHICLE_CLASS = 123;
  static const int FT_JURISDICTION_ENDORSEMENT_CODE = 124;
  static const int FT_JURISDICTION_RESTRICTION_CODE = 125;
  static const int FT_FAMILY_NAME = 126;
  static const int FT_GIVEN_NAMES_RUS = 127;
  static const int FT_VISA_ID_RUS = 128;
  static const int FT_FATHERS_NAME = 129;
  static const int FT_FATHERS_NAME_RUS = 130;
  static const int FT_SURNAME_AND_GIVEN_NAMES_RUS = 131;
  static const int FT_PLACE_OF_BIRTH_RUS = 132;
  static const int FT_AUTHORITY_RUS = 133;
  static const int FT_ISSUING_STATE_CODE_NUMERIC = 134;
  static const int FT_NATIONALITY_CODE_NUMERIC = 135;
  static const int FT_ENGINE_POWER = 136;
  static const int FT_ENGINE_VOLUME = 137;
  static const int FT_CHASSIS_NUMBER = 138;
  static const int FT_ENGINE_NUMBER = 139;
  static const int FT_ENGINE_MODEL = 140;
  static const int FT_VEHICLE_CATEGORY = 141;
  static const int FT_IDENTITY_CARD_NUMBER = 142;
  static const int FT_CONTROL_NO = 143;
  static const int FT_PARRENTS_GIVEN_NAMES = 144;
  static const int FT_SECOND_SURNAME = 145;
  static const int FT_MIDDLE_NAME = 146;
  static const int FT_REG_CERT_VIN = 147;
  static const int FT_REG_CERT_VIN_CHECK_DIGIT = 148;
  static const int FT_REG_CERT_VIN_CHECKSUM = 149;
  static const int FT_LINE_1_CHECK_DIGIT = 150;
  static const int FT_LINE_2_CHECK_DIGIT = 151;
  static const int FT_LINE_3_CHECK_DIGIT = 152;
  static const int FT_LINE_1_CHECKSUM = 153;
  static const int FT_LINE_2_CHECKSUM = 154;
  static const int FT_LINE_3_CHECKSUM = 155;
  static const int FT_REG_CERT_REG_NUMBER_CHECK_DIGIT = 156;
  static const int FT_REG_CERT_REG_NUMBER_CHECKSUM = 157;
  static const int FT_REG_CERT_VEHICLE_ITS_CODE = 158;
  static const int FT_CARD_ACCESS_NUMBER = 159;
  static const int FT_MARITAL_STATUS = 160;
  static const int FT_COMPANY_NAME = 161;
  static const int FT_SPECIAL_NOTES = 162;
  static const int FT_SURNAME_OF_SPOSE = 163;
  static const int FT_TRACKING_NUMBER = 164;
  static const int FT_BOOKLET_NUMBER = 165;
  static const int FT_CHILDREN = 166;
  static const int FT_COPY = 167;
  static const int FT_SERIAL_NUMBER = 168;
  static const int FT_DOSSIER_NUMBER = 169;
  static const int FT_AKA_SURNAME_AND_GIVEN_NAMES = 170;
  static const int FT_TERRITORIAL_VALIDITY = 171;
  static const int FT_MRZ_STRINGS_WITH_CORRECT_CHECK_SUMS = 172;
  static const int FT_DL_CDL_RESTRICTION_CODE = 173;
  static const int FT_DL_UNDER_18_DATE = 174;
  static const int FT_DL_RECORD_CREATED = 175;
  static const int FT_DL_DUPLICATE_DATE = 176;
  static const int FT_DL_ISS_TYPE = 177;
  static const int FT_MILITARY_BOOK_NUMBER = 178;
  static const int FT_DESTINATION = 179;
  static const int FT_BLOOD_GROUP = 180;
  static const int FT_SEQUENCE_NUMBER = 181;
  static const int FT_REG_CERT_BODY_TYPE = 182;
  static const int FT_REG_CERT_CAR_MARK = 183;
  static const int FT_TRANSACTION_NUMBER = 184;
  static const int FT_AGE = 185;
  static const int FT_FOLIO_NUMBER = 186;
  static const int FT_VOTER_KEY = 187;
  static const int FT_ADDRESS_MUNICIPALITY = 188;
  static const int FT_ADDRESS_LOCATION = 189;
  static const int FT_SECTION = 190;
  static const int FT_OCR_NUMBER = 191;
  static const int FT_FEDERAL_ELECTIONS = 192;
  static const int FT_REFERENCE_NUMBER = 193;
  static const int FT_OPTIONAL_DATA_CHECKSUM = 194;
  static const int FT_OPTIONAL_DATA_CHECK_DIGIT = 195;
  static const int FT_VISA_NUMBER = 196;
  static const int FT_VISA_NUMBER_CHECKSUM = 197;
  static const int FT_VISA_NUMBER_CHECK_DIGIT = 198;
  static const int FT_VOTER = 199;
  static const int FT_PREVIOUS_TYPE = 200;
  static const int FT_FIELD_FROM_MRZ = 220;
  static const int FT_CURRENT_DATE = 221;
  static const int FT_STATUS_DATE_OF_EXPIRY = 251;
  static const int FT_BANKNOTE_NUMBER = 252;
  static const int FT_CSC_CODE = 253;
  static const int FT_ARTISTIC_NAME = 254;
  static const int FT_ACADEMIC_TITLE = 255;
  static const int FT_ADDRESS_COUNTRY = 256;
  static const int FT_ADDRESS_ZIPCODE = 257;
  static const int FT_E_ID_RESIDENCE_PERMIT_1 = 258;
  static const int FT_E_ID_RESIDENCE_PERMIT_2 = 259;
  static const int FT_E_ID_PLACE_OF_BIRTH_STREET = 260;
  static const int FT_E_ID_PLACE_OF_BIRTH_CITY = 261;
  static const int FT_E_ID_PLACE_OF_BIRTH_STATE = 262;
  static const int FT_E_ID_PLACE_OF_BIRTH_COUNTRY = 263;
  static const int FT_E_ID_PLACE_OF_BIRTH_ZIPCODE = 264;
  static const int FT_CDL_CLASS = 265;
  static const int FT_DL_UNDER_19_DATE = 266;
  static const int FT_WEIGHT_POUNDS = 267;
  static const int FT_LIMITED_DURATION_DOCUMENT_INDICATOR = 268;
  static const int FT_ENDORSEMENT_EXPIRATION_DATE = 269;
  static const int FT_REVISION_DATE = 270;
  static const int FT_COMPLIANCE_TYPE = 271;
  static const int FT_FAMILY_NAME_TRUNCATION = 272;
  static const int FT_FIRST_NAME_TRUNCATION = 273;
  static const int FT_MIDDLE_NAME_TRUNCATION = 274;
  static const int FT_EXAM_DATE = 275;
  static const int FT_ORGANIZATION = 276;
  static const int FT_DEPARTMENT = 277;
  static const int FT_PAY_GRADE = 278;
  static const int FT_RANK = 279;
  static const int FT_BENEFITS_NUMBER = 280;
  static const int FT_SPONSOR_SERVICE = 281;
  static const int FT_SPONSOR_STATUS = 282;
  static const int FT_SPONSOR = 283;
  static const int FT_RELATIONSHIP = 284;
  static const int FT_USCIS = 285;
  static const int FT_CATEGORY = 286;
  static const int FT_CONDITIONS = 287;
  static const int FT_IDENTIFIER = 288;
  static const int FT_CONFIGURATION = 289;
  static const int FT_DISCRETIONARY_DATA = 290;
  static const int FT_LINE_1_OPTIONAL_DATA = 291;
  static const int FT_LINE_2_OPTIONAL_DATA = 292;
  static const int FT_LINE_3_OPTIONAL_DATA = 293;
  static const int FT_EQV_CODE = 294;
  static const int FT_ALT_CODE = 295;
  static const int FT_BINARY_CODE = 296;
  static const int FT_PSEUDO_CODE = 297;
  static const int FT_FEE = 298;
  static const int FT_STAMP_NUMBER = 299;
  static const int FT_SBH_SECURITYOPTIONS = 300;
  static const int FT_SBH_INTEGRITYOPTIONS = 301;
  static const int FT_DATE_OF_CREATION = 302;
  static const int FT_VALIDITY_PERIOD = 303;
  static const int FT_PATRON_HEADER_VERSION = 304;
  static const int FT_BDB_TYPE = 305;
  static const int FT_BIOMETRIC_TYPE = 306;
  static const int FT_BIOMETRIC_SUBTYPE = 307;
  static const int FT_BIOMETRIC_PRODUCTID = 308;
  static const int FT_BIOMETRIC_FORMAT_OWNER = 309;
  static const int FT_BIOMETRIC_FORMAT_TYPE = 310;
  static const int FT_PHONE = 311;
  static const int FT_PROFESSION = 312;
  static const int FT_TITLE = 313;
  static const int FT_PERSONAL_SUMMARY = 314;
  static const int FT_OTHER_VALID_ID = 315;
  static const int FT_CUSTODY_INFO = 316;
  static const int FT_OTHER_NAME = 317;
  static const int FT_OBSERVATIONS = 318;
  static const int FT_TAX = 319;
  static const int FT_DATE_OF_PERSONALIZATION = 320;
  static const int FT_PERSONALIZATION_SN = 321;
  static const int FT_OTHERPERSON_NAME = 322;
  static const int FT_PERSONTONOTIFY_DATE_OF_RECORD = 323;
  static const int FT_PERSONTONOTIFY_NAME = 324;
  static const int FT_PERSONTONOTIFY_PHONE = 325;
  static const int FT_PERSONTONOTIFY_ADDRESS = 326;
  static const int FT_DS_CERTIFICATE_ISSUER = 327;
  static const int FT_DS_CERTIFICATE_SUBJECT = 328;
  static const int FT_DS_CERTIFICATE_VALIDFROM = 329;
  static const int FT_DS_CERTIFICATE_VALIDTO = 330;
  static const int FT_VRC_DATAOBJECT_ENTRY = 331;
  static const int FT_TYPE_APPROVAL_NUMBER = 332;
  static const int FT_ADMINISTRATIVE_NUMBER = 333;
  static const int FT_DOCUMENT_DISCRIMINATOR = 334;
  static const int FT_DATA_DISCRIMINATOR = 335;
  static const int FT_ISO_ISSUER_ID_NUMBER = 336;
  static const int FT_GNIB_NUMBER = 340;
  static const int FT_DEPT_NUMBER = 341;
  static const int FT_TELEX_CODE = 342;
  static const int FT_ALLERGIES = 343;
  static const int FT_SP_CODE = 344;
  static const int FT_COURT_CODE = 345;
  static const int FT_CTY = 346;
  static const int FT_SPONSOR_SSN = 347;
  static const int FT_DO_D_NUMBER = 348;
  static const int FT_MC_NOVICE_DATE = 349;
  static const int FT_DUF_NUMBER = 350;
  static const int FT_AGY = 351;
  static const int FT_PNR_CODE = 352;
  static const int FT_FROM_AIRPORT_CODE = 353;
  static const int FT_TO_AIRPORT_CODE = 354;
  static const int FT_FLIGHT_NUMBER = 355;
  static const int FT_DATE_OF_FLIGHT = 356;
  static const int FT_SEAT_NUMBER = 357;
  static const int FT_DATE_OF_ISSUE_BOARDING_PASS = 358;
  static const int FT_CCW_UNTIL = 359;
  static const int FT_REFERENCE_NUMBER_CHECKSUM = 360;
  static const int FT_REFERENCE_NUMBER_CHECK_DIGIT = 361;
  static const int FT_ROOM_NUMBER = 362;
  static const int FT_RELIGION = 363;
  static const int FT_REMAINDER_TERM = 364;
  static const int FT_ELECTRONIC_TICKET_INDICATOR = 365;
  static const int FT_COMPARTMENT_CODE = 366;
  static const int FT_CHECK_IN_SEQUENCE_NUMBER = 367;
  static const int FT_AIRLINE_DESIGNATOR_OF_BOARDING_PASS_ISSUER = 368;
  static const int FT_AIRLINE_NUMERIC_CODE = 369;
  static const int FT_TICKET_NUMBER = 370;
  static const int FT_FREQUENT_FLYER_AIRLINE_DESIGNATOR = 371;
  static const int FT_FREQUENT_FLYER_NUMBER = 372;
  static const int FT_FREE_BAGGAGE_ALLOWANCE = 373;
  static const int FT_PDF_417_CODEC = 374;
  static const int FT_IDENTITY_CARD_NUMBER_CHECKSUM = 375;
  static const int FT_IDENTITY_CARD_NUMBER_CHECK_DIGIT = 376;
  static const int FT_VETERAN = 377;
  static const int FT_DL_CLASS_CODE_A_1_FROM = 378;
  static const int FT_DL_CLASS_CODE_A_1_TO = 379;
  static const int FT_DL_CLASS_CODE_A_1_NOTES = 380;
  static const int FT_DL_CLASS_CODE_A_FROM = 381;
  static const int FT_DL_CLASS_CODE_A_TO = 382;
  static const int FT_DL_CLASS_CODE_A_NOTES = 383;
  static const int FT_DL_CLASS_CODE_B_FROM = 384;
  static const int FT_DL_CLASS_CODE_B_TO = 385;
  static const int FT_DL_CLASS_CODE_B_NOTES = 386;
  static const int FT_DL_CLASS_CODE_C_1_FROM = 387;
  static const int FT_DL_CLASS_CODE_C_1_TO = 388;
  static const int FT_DL_CLASS_CODE_C_1_NOTES = 389;
  static const int FT_DL_CLASS_CODE_C_FROM = 390;
  static const int FT_DL_CLASS_CODE_C_TO = 391;
  static const int FT_DL_CLASS_CODE_C_NOTES = 392;
  static const int FT_DL_CLASS_CODE_D_1_FROM = 393;
  static const int FT_DL_CLASS_CODE_D_1_TO = 394;
  static const int FT_DL_CLASS_CODE_D_1_NOTES = 395;
  static const int FT_DL_CLASS_CODE_D_FROM = 396;
  static const int FT_DL_CLASS_CODE_D_TO = 397;
  static const int FT_DL_CLASS_CODE_D_NOTES = 398;
  static const int FT_DL_CLASS_CODE_BE_FROM = 399;
  static const int FT_DL_CLASS_CODE_BE_TO = 400;
  static const int FT_DL_CLASS_CODE_BE_NOTES = 401;
  static const int FT_DL_CLASS_CODE_C_1_E_FROM = 402;
  static const int FT_DL_CLASS_CODE_C_1_E_TO = 403;
  static const int FT_DL_CLASS_CODE_C_1_E_NOTES = 404;
  static const int FT_DL_CLASS_CODE_CE_FROM = 405;
  static const int FT_DL_CLASS_CODE_CE_TO = 406;
  static const int FT_DL_CLASS_CODE_CE_NOTES = 407;
  static const int FT_DL_CLASS_CODE_D_1_E_FROM = 408;
  static const int FT_DL_CLASS_CODE_D_1_E_TO = 409;
  static const int FT_DL_CLASS_CODE_D_1_E_NOTES = 410;
  static const int FT_DL_CLASS_CODE_DE_FROM = 411;
  static const int FT_DL_CLASS_CODE_DE_TO = 412;
  static const int FT_DL_CLASS_CODE_DE_NOTES = 413;
  static const int FT_DL_CLASS_CODE_M_FROM = 414;
  static const int FT_DL_CLASS_CODE_M_TO = 415;
  static const int FT_DL_CLASS_CODE_M_NOTES = 416;
  static const int FT_DL_CLASS_CODE_L_FROM = 417;
  static const int FT_DL_CLASS_CODE_L_TO = 418;
  static const int FT_DL_CLASS_CODE_L_NOTES = 419;
  static const int FT_DL_CLASS_CODE_T_FROM = 420;
  static const int FT_DL_CLASS_CODE_T_TO = 421;
  static const int FT_DL_CLASS_CODE_T_NOTES = 422;
  static const int FT_DL_CLASS_CODE_AM_FROM = 423;
  static const int FT_DL_CLASS_CODE_AM_TO = 424;
  static const int FT_DL_CLASS_CODE_AM_NOTES = 425;
  static const int FT_DL_CLASS_CODE_A_2_FROM = 426;
  static const int FT_DL_CLASS_CODE_A_2_TO = 427;
  static const int FT_DL_CLASS_CODE_A_2_NOTES = 428;
  static const int FT_DL_CLASS_CODE_B_1_FROM = 429;
  static const int FT_DL_CLASS_CODE_B_1_TO = 430;
  static const int FT_DL_CLASS_CODE_B_1_NOTES = 431;
  static const int FT_SURNAME_AT_BIRTH = 432;
  static const int FT_CIVIL_STATUS = 433;
  static const int FT_NUMBER_OF_SEATS = 434;
  static const int FT_NUMBER_OF_STANDING_PLACES = 435;
  static const int FT_MAX_SPEED = 436;
  static const int FT_FUEL_TYPE = 437;
  static const int FT_EC_ENVIRONMENTAL_TYPE = 438;
  static const int FT_POWER_WEIGHT_RATIO = 439;
  static const int FT_MAX_MASS_OF_TRAILER_BRAKED = 440;
  static const int FT_MAX_MASS_OF_TRAILER_UNBRAKED = 441;
  static const int FT_TRANSMISSION_TYPE = 442;
  static const int FT_TRAILER_HITCH = 443;
  static const int FT_ACCOMPANIED_BY = 444;
  static const int FT_POLICE_DISTRICT = 445;
  static const int FT_FIRST_ISSUE_DATE = 446;
  static const int FT_PAYLOAD_CAPACITY = 447;
  static const int FT_NUMBER_OF_AXELS = 448;
  static const int FT_PERMISSIBLE_AXLE_LOAD = 449;
  static const int FT_PRECINCT = 450;
  static const int FT_INVITED_BY = 451;
  static const int FT_PURPOSE_OF_ENTRY = 452;
  static const int FT_SKIN_COLOR = 453;
  static const int FT_COMPLEXION = 454;
  static const int FT_AIRPORT_FROM = 455;
  static const int FT_AIRPORT_TO = 456;
  static const int FT_AIRLINE_NAME = 457;
  static const int FT_AIRLINE_NAME_FREQUENT_FLYER = 458;
  static const int FT_LICENSE_NUMBER = 459;
  static const int FT_IN_TANKS = 460;
  static const int FT_EXEPT_IN_TANKS = 461;
  static const int FT_FAST_TRACK = 462;
  static const int FT_OWNER = 463;
  static const int FT_MRZ_STRINGS_ICAO_RFID = 464;
  static const int FT_NUMBER_OF_CARD_ISSUANCE = 465;
  static const int FT_NUMBER_OF_CARD_ISSUANCE_CHECKSUM = 466;
  static const int FT_NUMBER_OF_CARD_ISSUANCE_CHECK_DIGIT = 467;
  static const int FT_CENTURY_DATE_OF_BIRTH = 468;
  static const int FT_DL_CLASSCODE_A3_FROM = 469;
  static const int FT_DL_CLASSCODE_A3_TO = 470;
  static const int FT_DL_CLASSCODE_A3_NOTES = 471;
  static const int FT_DL_CLASSCODE_C2_FROM = 472;
  static const int FT_DL_CLASSCODE_C2_TO = 473;
  static const int FT_DL_CLASSCODE_C2_NOTES = 474;
  static const int FT_DL_CLASSCODE_B2_FROM = 475;
  static const int FT_DL_CLASSCODE_B2_TO = 476;
  static const int FT_DL_CLASSCODE_B2_NOTES = 477;
  static const int FT_DL_CLASSCODE_D2_FROM = 478;
  static const int FT_DL_CLASSCODE_D2_TO = 479;
  static const int FT_DL_CLASSCODE_D2_NOTES = 480;
  static const int FT_DL_CLASSCODE_B2E_FROM = 481;
  static const int FT_DL_CLASSCODE_B2E_TO = 482;
  static const int FT_DL_CLASSCODE_B2E_NOTES = 483;
  static const int FT_DL_CLASSCODE_G_FROM = 484;
  static const int FT_DL_CLASSCODE_G_TO = 485;
  static const int FT_DL_CLASSCODE_G_NOTES = 486;
  static const int FT_DL_CLASSCODE_J_FROM = 487;
  static const int FT_DL_CLASSCODE_J_TO = 488;
  static const int FT_DL_CLASSCODE_J_NOTES = 489;
  static const int FT_DL_CLASSCODE_LC_FROM = 490;
  static const int FT_DL_CLASSCODE_LC_TO = 491;
  static const int FT_DLC_LASSCODE_LC_NOTES = 492;
  static const int FT_BANKCARDNUMBER = 493;
  static const int FT_BANKCARDVALIDTHRU = 494;
  static const int FT_TAX_NUMBER = 495;
  static const int FT_HEALTH_NUMBER = 496;
  static const int FT_GRANDFATHERNAME = 497;
  static const int FT_SELECTEE_INDICATOR = 498;
  static const int FT_MOTHER_SURNAME = 499;
  static const int FT_MOTHER_GIVENNAME = 500;
  static const int FT_FATHER_SURNAME = 501;
  static const int FT_FATHER_GIVENNAME = 502;
  static const int FT_MOTHER_DATEOFBIRTH = 503;
  static const int FT_FATHER_DATEOFBIRTH = 504;
  static const int FT_MOTHER_PERSONALNUMBER = 505;
  static const int FT_FATHER_PERSONALNUMBER = 506;
  static const int FT_MOTHER_PLACEOFBIRTH = 507;
  static const int FT_FATHER_PLACEOFBIRTH = 508;
  static const int FT_MOTHER_COUNTRYOFBIRTH = 509;
  static const int FT_FATHER_COUNTRYOFBIRTH = 510;
  static const int FT_DATE_FIRST_RENEWAL = 511;
  static const int FT_DATE_SECOND_RENEWAL = 512;
  static const int FT_PLACE_OF_EXAMINATION = 513;
  static const int FT_APPLICATION_NUMBER = 514;
  static const int FT_VOUCHER_NUMBER = 515;
  static const int FT_AUTHORIZATION_NUMBER = 516;
  static const int FT_FACULTY = 517;
  static const int FT_FORM_OF_EDUCATION = 518;
  static const int FT_DNI_NUMBER = 519;
  static const int FT_RETIREMENT_NUMBER = 520;
  static const int FT_PROFESSIONAL_ID_NUMBER = 521;
  static const int FT_AGE_AT_ISSUE = 522;
  static const int FT_YEARS_SINCE_ISSUE = 523;
  static const int FT_DLCLASSCODE_BTP_FROM = 524;
  static const int FT_DLCLASSCODE_BTP_NOTES = 525;
  static const int FT_DLCLASSCODE_BTP_TO = 526;
  static const int FT_DLCLASSCODE_C3_FROM = 527;
  static const int FT_DLCLASSCODE_C3_NOTES = 528;
  static const int FT_DLCLASSCODE_C3_TO = 529;
  static const int FT_DLCLASSCODE_E_FROM = 530;
  static const int FT_DLCLASSCODE_E_NOTES = 531;
  static const int FT_DLCLASSCODE_E_TO = 532;
  static const int FT_DLCLASSCODE_F_FROM = 533;
  static const int FT_DLCLASSCODE_F_NOTES = 534;
  static const int FT_DLCLASSCODE_F_TO = 535;
  static const int FT_DLCLASSCODE_FA_FROM = 536;
  static const int FT_DLCLASSCODE_FA_NOTES = 537;
  static const int FT_DLCLASSCODE_FA_TO = 538;
  static const int FT_DLCLASSCODE_FA1_FROM = 539;
  static const int FT_DLCLASSCODE_FA1_NOTES = 540;
  static const int FT_DLCLASSCODE_FA1_TO = 541;
  static const int FT_DLCLASSCODE_FB_FROM = 542;
  static const int FT_DLCLASSCODE_FB_NOTES = 543;
  static const int FT_DLCLASSCODE_FB_TO = 544;
  static const int FT_DLCLASSCODE_G1_FROM = 545;
  static const int FT_DLCLASSCODE_G1_NOTES = 546;
  static const int FT_DLCLASSCODE_G1_TO = 547;
  static const int FT_DLCLASSCODE_H_FROM = 548;
  static const int FT_DLCLASSCODE_H_NOTES = 549;
  static const int FT_DLCLASSCODE_H_TO = 550;
  static const int FT_DLCLASSCODE_I_FROM = 551;
  static const int FT_DLCLASSCODE_I_NOTES = 552;
  static const int FT_DLCLASSCODE_I_TO = 553;
  static const int FT_DLCLASSCODE_K_FROM = 554;
  static const int FT_DLCLASSCODE_K_NOTES = 555;
  static const int FT_DLCLASSCODE_K_TO = 556;
  static const int FT_DLCLASSCODE_LK_FROM = 557;
  static const int FT_DLCLASSCODE_LK_NOTES = 558;
  static const int FT_DLCLASSCODE_LK_TO = 559;
  static const int FT_DLCLASSCODE_N_FROM = 560;
  static const int FT_DLCLASSCODE_N_NOTES = 561;
  static const int FT_DLCLASSCODE_N_TO = 562;
  static const int FT_DLCLASSCODE_S_FROM = 563;
  static const int FT_DLCLASSCODE_S_NOTES = 564;
  static const int FT_DLCLASSCODE_S_TO = 565;
  static const int FT_DLCLASSCODE_TB_FROM = 566;
  static const int FT_DLCLASSCODE_TB_NOTES = 567;
  static const int FT_DLCLASSCODE_TB_TO = 568;
  static const int FT_DLCLASSCODE_TM_FROM = 569;
  static const int FT_DLCLASSCODE_TM_NOTES = 570;
  static const int FT_DLCLASSCODE_TM_TO = 571;
  static const int FT_DLCLASSCODE_TR_FROM = 572;
  static const int FT_DLCLASSCODE_TR_NOTES = 573;
  static const int FT_DLCLASSCODE_TR_TO = 574;
  static const int FT_DLCLASSCODE_TV_FROM = 575;
  static const int FT_DLCLASSCODE_TV_NOTES = 576;
  static const int FT_DLCLASSCODE_TV_TO = 577;
  static const int FT_DLCLASSCODE_V_FROM = 578;
  static const int FT_DLCLASSCODE_V_NOTES = 579;
  static const int FT_DLCLASSCODE_V_TO = 580;
  static const int FT_DLCLASSCODE_W_FROM = 581;
  static const int FT_DLCLASSCODE_W_NOTES = 582;
  static const int FT_DLCLASSCODE_W_TO = 583;
  static const int FT_URL = 584;
  static const int FT_CALIBER = 585;
  static const int FT_MODEL = 586;
  static const int FT_MAKE = 587;
  static const int FT_NUMBER_OF_CYLINDERS = 588;
  static const int FT_SURNAME_OF_HUSBAND_AFTER_REGISTRATION = 589;
  static const int FT_SURNAME_OF_WIFE_AFTER_REGISTRATION = 590;
  static const int FT_DATE_OF_BIRTH_OF_WIFE = 591;
  static const int FT_DATE_OF_BIRTH_OF_HUSBAND = 592;
  static const int FT_CITIZENSHIP_OF_FIRST_PERSON = 593;
  static const int FT_CITIZENSHIP_OF_SECOND_PERSON = 594;
  static const int FT_CVV = 595;
  static const int FT_DATE_OF_INSURANCE_EXPIRY = 596;
  static const int FT_MORTGAGE_BY = 597;
  static const int FT_OLD_DOCUMENT_NUMBER = 598;
  static const int FT_OLD_DATE_OF_ISSUE = 599;
  static const int FT_OLD_PLACE_OF_ISSUE = 600;
  static const int FT_DLCLASSCODE_LR_FROM = 601;
  static const int FT_DLCLASSCODE_LR_TO = 602;
  static const int FT_DLCLASSCODE_LR_NOTES = 603;
  static const int FT_DLCLASSCODE_MR_FROM = 604;
  static const int FT_DLCLASSCODE_MR_TO = 605;
  static const int FT_DLCLASSCODE_MR_NOTES = 606;
  static const int FT_DLCLASSCODE_HR_FROM = 607;
  static const int FT_DLCLASSCODE_HR_TO = 608;
  static const int FT_DLCLASSCODE_HR_NOTES = 609;
  static const int FT_DLCLASSCODE_HC_FROM = 610;
  static const int FT_DLCLASSCODE_HC_TO = 611;
  static const int FT_DLCLASSCODE_HC_NOTES = 612;
  static const int FT_DLCLASSCODE_MC_FROM = 613;
  static const int FT_DLCLASSCODE_MC_TO = 614;
  static const int FT_DLCLASSCODE_MC_NOTES = 615;
  static const int FT_DLCLASSCODE_RE_FROM = 616;
  static const int FT_DLCLASSCODE_RE_TO = 617;
  static const int FT_DLCLASSCODE_RE_NOTES = 618;
  static const int FT_DLCLASSCODE_R_FROM = 619;
  static const int FT_DLCLASSCODE_R_TO = 620;
  static const int FT_DLCLASSCODE_R_NOTES = 621;
  static const int FT_DLCLASSCODE_CA_FROM = 622;
  static const int FT_DLCLASSCODE_CA_TO = 623;
  static const int FT_DLCLASSCODE_CA_NOTES = 624;

  static String getTranslation(int value) {
    switch (value) {
      case FT_DOCUMENT_CLASS_CODE:
        return "Document class code";
      case FT_ISSUING_STATE_CODE:
        return "Issuing state code";
      case FT_DOCUMENT_NUMBER:
        return "Document number";
      case FT_DATE_OF_EXPIRY:
        return "Date of expiry";
      case FT_DATE_OF_ISSUE:
        return "Date of issue";
      case FT_DATE_OF_BIRTH:
        return "Date of birth";
      case FT_PLACE_OF_BIRTH:
        return "Place of birth";
      case FT_PERSONAL_NUMBER:
        return "Personal number";
      case FT_SURNAME:
        return "Surname";
      case FT_GIVEN_NAMES:
        return "Given name";
      case FT_MOTHERS_NAME:
        return "Mother\'s name";
      case FT_NATIONALITY:
        return "Nationality";
      case FT_SEX:
        return "Sex";
      case FT_HEIGHT:
        return "Height";
      case FT_WEIGHT:
        return "Weight";
      case FT_EYES_COLOR:
        return "Eye color";
      case FT_HAIR_COLOR:
        return "Hair color";
      case FT_ADDRESS:
        return "Address";
      case FT_DONOR:
        return "Donor";
      case FT_SOCIAL_SECURITY_NUMBER:
        return "Social insurance number";
      case FT_DL_CLASS:
        return "DL category";
      case FT_DL_ENDORSED:
        return "DL endorsement code";
      case FT_DL_RESTRICTION_CODE:
        return "DL Restriction Code";
      case FT_DL_UNDER_21_DATE:
        return "Date of 21st birthday";
      case FT_AUTHORITY:
        return "Issuing authority";
      case FT_SURNAME_AND_GIVEN_NAMES:
        return "Surname and given names";
      case FT_NATIONALITY_CODE:
        return "Nationality code";
      case FT_PASSPORT_NUMBER:
        return "Passport number";
      case FT_INVITATION_NUMBER:
        return "Invitation number";
      case FT_VISA_ID:
        return "Visa ID";
      case FT_VISA_CLASS:
        return "Visa Class";
      case FT_VISA_SUB_CLASS:
        return "Visa subclass";
      case FT_MRZ_STRING_1:
        return "MRZ line 1";
      case FT_MRZ_STRING_2:
        return "MRZ line 2";
      case FT_MRZ_STRING_3:
        return "MRZ line 3";
      case FT_MRZ_TYPE:
        return "MRZ Type";
      case FT_OPTIONAL_DATA:
        return "Optional data";
      case FT_DOCUMENT_CLASS_NAME:
        return "Document class";
      case FT_ISSUING_STATE_NAME:
        return "Issuing state";
      case FT_PLACE_OF_ISSUE:
        return "Place of issue";
      case FT_DOCUMENT_NUMBER_CHECKSUM:
        return "Checksum for document number";
      case FT_DATE_OF_BIRTH_CHECKSUM:
        return "Checksum for date of birth";
      case FT_DATE_OF_EXPIRY_CHECKSUM:
        return "Checksum for date of expiry";
      case FT_PERSONAL_NUMBER_CHECKSUM:
        return "Checksum for personal number";
      case FT_FINAL_CHECKSUM:
        return "Final checksum";
      case FT_PASSPORT_NUMBER_CHECKSUM:
        return "Checksum for passport number";
      case FT_INVITATION_NUMBER_CHECKSUM:
        return "Checksum for invitation number";
      case FT_VISA_ID_CHECKSUM:
        return "Checksum for visa ID";
      case FT_SURNAME_AND_GIVEN_NAMES_CHECKSUM:
        return "Checksum for surname and given names";
      case FT_VISA_VALID_UNTIL_CHECKSUM:
        return "Checksum for visa expiry date";
      case FT_OTHER:
        return "Other";
      case FT_MRZ_STRINGS:
        return "MRZ lines";
      case FT_NAME_SUFFIX:
        return "Name suffix";
      case FT_NAME_PREFIX:
        return "Name prefix";
      case FT_DATE_OF_ISSUE_CHECKSUM:
        return "Checksum for date of issue";
      case FT_DATE_OF_ISSUE_CHECK_DIGIT:
        return "Check digit for date of issue";
      case FT_DOCUMENT_SERIES:
        return "Document series";
      case FT_REG_CERT_REG_NUMBER:
        return "Registration number";
      case FT_REG_CERT_CAR_MODEL:
        return "Vehicle model";
      case FT_REG_CERT_CAR_COLOR:
        return "Vehicle color";
      case FT_REG_CERT_BODY_NUMBER:
        return "Body number";
      case FT_REG_CERT_CAR_TYPE:
        return "Vehicle type";
      case FT_REG_CERT_MAX_WEIGHT:
        return "Max permissible weight";
      case FT_REG_CERT_WEIGHT:
        return "Unladen mass";
      case FT_ADDRESS_AREA:
        return "Area";
      case FT_ADDRESS_STATE:
        return "State";
      case FT_ADDRESS_BUILDING:
        return "Unit";
      case FT_ADDRESS_HOUSE:
        return "Building";
      case FT_ADDRESS_FLAT:
        return "Apartment";
      case FT_PLACE_OF_REGISTRATION:
        return "Place of registration";
      case FT_DATE_OF_REGISTRATION:
        return "Date of registration";
      case FT_RESIDENT_FROM:
        return "Resident from";
      case FT_RESIDENT_UNTIL:
        return "Resident until";
      case FT_AUTHORITY_CODE:
        return "Issuing authority code";
      case FT_PLACE_OF_BIRTH_AREA:
        return "Area of birthplace";
      case FT_PLACE_OF_BIRTH_STATE_CODE:
        return "State code of birthplace";
      case FT_ADDRESS_STREET:
        return "Street";
      case FT_ADDRESS_CITY:
        return "City";
      case FT_ADDRESS_JURISDICTION_CODE:
        return "Jurisdiction code";
      case FT_ADDRESS_POSTAL_CODE:
        return "Postal code";
      case FT_DOCUMENT_NUMBER_CHECK_DIGIT:
        return "Check digit for document number";
      case FT_DATE_OF_BIRTH_CHECK_DIGIT:
        return "Check digit for date of birth";
      case FT_DATE_OF_EXPIRY_CHECK_DIGIT:
        return "Check digit for date of expiry";
      case FT_PERSONAL_NUMBER_CHECK_DIGIT:
        return "Check digit for personal number";
      case FT_FINAL_CHECK_DIGIT:
        return "Final check digit";
      case FT_PASSPORT_NUMBER_CHECK_DIGIT:
        return "Check digit for passport number";
      case FT_INVITATION_NUMBER_CHECK_DIGIT:
        return "Check digit for invitation number";
      case FT_VISA_ID_CHECK_DIGIT:
        return "Check digit for visa ID";
      case FT_SURNAME_AND_GIVEN_NAMES_CHECK_DIGIT:
        return "Check digit for surname and given names";
      case FT_VISA_VALID_UNTIL_CHECK_DIGIT:
        return "Check digit for visa expiry date";
      case FT_PERMIT_DL_CLASS:
        return "Permit class";
      case FT_PERMIT_DATE_OF_EXPIRY:
        return "Permit expiry date";
      case FT_PERMIT_IDENTIFIER:
        return "Permit identifier";
      case FT_PERMIT_DATE_OF_ISSUE:
        return "Permit issue date";
      case FT_PERMIT_RESTRICTION_CODE:
        return "Permit restriction code";
      case FT_PERMIT_ENDORSED:
        return "Permit endorsement code";
      case FT_ISSUE_TIMESTAMP:
        return "Issue time";
      case FT_NUMBER_OF_DUPLICATES:
        return "Number of duplicates";
      case FT_MEDICAL_INDICATOR_CODES:
        return "Medical notes/codes";
      case FT_NON_RESIDENT_INDICATOR:
        return "Non-resident indicator";
      case FT_VISA_TYPE:
        return "Visa type";
      case FT_VISA_VALID_FROM:
        return "Visa valid from";
      case FT_VISA_VALID_UNTIL:
        return "Visa valid until";
      case FT_DURATION_OF_STAY:
        return "Duration of stay";
      case FT_NUMBER_OF_ENTRIES:
        return "Number of entries";
      case FT_DAY:
        return "Day";
      case FT_MONTH:
        return "Month";
      case FT_YEAR:
        return "Year";
      case FT_UNIQUE_CUSTOMER_IDENTIFIER:
        return "Unique customer identifier";
      case FT_COMMERCIAL_VEHICLE_CODES:
        return "Commercial vehicle code";
      case FT_AKA_DATE_OF_BIRTH:
        return "AKA Date of birth";
      case FT_AKA_SOCIAL_SECURITY_NUMBER:
        return "AKA Social Insurance Number";
      case FT_AKA_SURNAME:
        return "AKA Surname";
      case FT_AKA_GIVEN_NAMES:
        return "AKA Given name";
      case FT_AKA_NAME_SUFFIX:
        return "AKA Name suffix";
      case FT_AKA_NAME_PREFIX:
        return "AKA Name prefix";
      case FT_MAILING_ADDRESS_STREET:
        return "Mailing address - street";
      case FT_MAILING_ADDRESS_CITY:
        return "Mailing address - city";
      case FT_MAILING_ADDRESS_JURISDICTION_CODE:
        return "Mailing address - jurisdiction code";
      case FT_MAILING_ADDRESS_POSTAL_CODE:
        return "Mailing address - postal code";
      case FT_AUDIT_INFORMATION:
        return "Number for validation";
      case FT_INVENTORY_NUMBER:
        return "Inventory number";
      case FT_RACE_ETHNICITY:
        return "Race/ethnicity";
      case FT_JURISDICTION_VEHICLE_CLASS:
        return "Jurisdiction vehicle class";
      case FT_JURISDICTION_ENDORSEMENT_CODE:
        return "Jurisdiction endorsement code";
      case FT_JURISDICTION_RESTRICTION_CODE:
        return "Jurisdiction restriction code";
      case FT_FAMILY_NAME:
        return "Surname/given name at birth";
      case FT_GIVEN_NAMES_RUS:
        return "Given name (National)";
      case FT_VISA_ID_RUS:
        return "Visa ID (National)";
      case FT_FATHERS_NAME:
        return "Father\'s name";
      case FT_FATHERS_NAME_RUS:
        return "Father\'s name (National)";
      case FT_SURNAME_AND_GIVEN_NAMES_RUS:
        return "Surname and given names (National)";
      case FT_PLACE_OF_BIRTH_RUS:
        return "Place of birth (National)";
      case FT_AUTHORITY_RUS:
        return "Issuing authority (National)";
      case FT_ISSUING_STATE_CODE_NUMERIC:
        return "Numeric issuing state code";
      case FT_NATIONALITY_CODE_NUMERIC:
        return "Numeric nationality code";
      case FT_ENGINE_POWER:
        return "Engine power";
      case FT_ENGINE_VOLUME:
        return "Engine volume";
      case FT_CHASSIS_NUMBER:
        return "Chassis number";
      case FT_ENGINE_NUMBER:
        return "Engine number";
      case FT_ENGINE_MODEL:
        return "Engine model";
      case FT_VEHICLE_CATEGORY:
        return "Vehicle category";
      case FT_IDENTITY_CARD_NUMBER:
        return "Identity card number";
      case FT_CONTROL_NO:
        return "Control number";
      case FT_PARRENTS_GIVEN_NAMES:
        return "Parents\' given names";
      case FT_SECOND_SURNAME:
        return "Second surname";
      case FT_MIDDLE_NAME:
        return "Middle name";
      case FT_REG_CERT_VIN:
        return "Vehicle identification number";
      case FT_REG_CERT_VIN_CHECK_DIGIT:
        return "Check digit for VIN";
      case FT_REG_CERT_VIN_CHECKSUM:
        return "Checksum for VIN";
      case FT_LINE_1_CHECK_DIGIT:
        return "Check digit for line 1";
      case FT_LINE_2_CHECK_DIGIT:
        return "Check digit for line 2";
      case FT_LINE_3_CHECK_DIGIT:
        return "Check digit for line 3";
      case FT_LINE_1_CHECKSUM:
        return "Checksum for line 1";
      case FT_LINE_2_CHECKSUM:
        return "Checksum for line 2";
      case FT_LINE_3_CHECKSUM:
        return "Checksum for line 3";
      case FT_REG_CERT_REG_NUMBER_CHECK_DIGIT:
        return "Check digit for registration number";
      case FT_REG_CERT_REG_NUMBER_CHECKSUM:
        return "Checksum for registration number";
      case FT_REG_CERT_VEHICLE_ITS_CODE:
        return "Vehicle ITS code";
      case FT_CARD_ACCESS_NUMBER:
        return "Card access number";
      case FT_MARITAL_STATUS:
        return "Marital status";
      case FT_COMPANY_NAME:
        return "Company name";
      case FT_SPECIAL_NOTES:
        return "Special notes";
      case FT_SURNAME_OF_SPOSE:
        return "Spouse\'s surname";
      case FT_TRACKING_NUMBER:
        return "Tracking number";
      case FT_BOOKLET_NUMBER:
        return "Booklet number";
      case FT_CHILDREN:
        return "Children";
      case FT_COPY:
        return "Copy";
      case FT_SERIAL_NUMBER:
        return "Serial number";
      case FT_DOSSIER_NUMBER:
        return "Dossier number";
      case FT_AKA_SURNAME_AND_GIVEN_NAMES:
        return "AKA Full name";
      case FT_TERRITORIAL_VALIDITY:
        return "Territorial validity";
      case FT_MRZ_STRINGS_WITH_CORRECT_CHECK_SUMS:
        return "MRZ lines with correct checksums";
      case FT_DL_CDL_RESTRICTION_CODE:
        return "CDL Restriction Code";
      case FT_DL_UNDER_18_DATE:
        return "Date of 18th birthday";
      case FT_DL_RECORD_CREATED:
        return "Record created";
      case FT_DL_DUPLICATE_DATE:
        return "Date of duplicate issue";
      case FT_DL_ISS_TYPE:
        return "Card type";
      case FT_MILITARY_BOOK_NUMBER:
        return "Military ID number";
      case FT_DESTINATION:
        return "Destination";
      case FT_BLOOD_GROUP:
        return "Blood group";
      case FT_SEQUENCE_NUMBER:
        return "Sequence number";
      case FT_REG_CERT_BODY_TYPE:
        return "Body type";
      case FT_REG_CERT_CAR_MARK:
        return "Vehicle make";
      case FT_TRANSACTION_NUMBER:
        return "Transaction number";
      case FT_AGE:
        return "Age";
      case FT_FOLIO_NUMBER:
        return "Folio number";
      case FT_VOTER_KEY:
        return "Voter Key";
      case FT_ADDRESS_MUNICIPALITY:
        return "Municipality";
      case FT_ADDRESS_LOCATION:
        return "Location";
      case FT_SECTION:
        return "Section";
      case FT_OCR_NUMBER:
        return "OCR number";
      case FT_FEDERAL_ELECTIONS:
        return "Federal elections";
      case FT_REFERENCE_NUMBER:
        return "Unique number";
      case FT_OPTIONAL_DATA_CHECKSUM:
        return "Checksum for optional data";
      case FT_OPTIONAL_DATA_CHECK_DIGIT:
        return "Check digit for optional data";
      case FT_VISA_NUMBER:
        return "Visa Number";
      case FT_VISA_NUMBER_CHECKSUM:
        return "Checksum for visa number";
      case FT_VISA_NUMBER_CHECK_DIGIT:
        return "Check digit for visa number";
      case FT_VOTER:
        return "Voter";
      case FT_PREVIOUS_TYPE:
        return "Type/number of the previous document";
      case FT_FIELD_FROM_MRZ:
        return "Field from MRZ";
      case FT_CURRENT_DATE:
        return "Current date";
      case FT_STATUS_DATE_OF_EXPIRY:
        return "Status Expiry Date";
      case FT_BANKNOTE_NUMBER:
        return "Banknote number";
      case FT_CSC_CODE:
        return "CSC Code";
      case FT_ARTISTIC_NAME:
        return "Pseudonym";
      case FT_ACADEMIC_TITLE:
        return "Academic title";
      case FT_ADDRESS_COUNTRY:
        return "Country";
      case FT_ADDRESS_ZIPCODE:
        return "ZIP code";
      case FT_E_ID_RESIDENCE_PERMIT_1:
        return "Residence permit 1";
      case FT_E_ID_RESIDENCE_PERMIT_2:
        return "Residence permit 2";
      case FT_E_ID_PLACE_OF_BIRTH_STREET:
        return "Place of Birth: Street";
      case FT_E_ID_PLACE_OF_BIRTH_CITY:
        return "Place of Birth: City";
      case FT_E_ID_PLACE_OF_BIRTH_STATE:
        return "Place of Birth: State";
      case FT_E_ID_PLACE_OF_BIRTH_COUNTRY:
        return "Place of Birth: Country";
      case FT_E_ID_PLACE_OF_BIRTH_ZIPCODE:
        return "Place of Birth: Postal code";
      case FT_CDL_CLASS:
        return "CDL Class";
      case FT_DL_UNDER_19_DATE:
        return "Date of 19th birthday";
      case FT_WEIGHT_POUNDS:
        return "Weight (pound)";
      case FT_LIMITED_DURATION_DOCUMENT_INDICATOR:
        return "Indicator of document limited duration";
      case FT_ENDORSEMENT_EXPIRATION_DATE:
        return "Endorsement expiration date";
      case FT_REVISION_DATE:
        return "Revision date";
      case FT_COMPLIANCE_TYPE:
        return "Compliance type";
      case FT_FAMILY_NAME_TRUNCATION:
        return "Truncated surname/given name at birth";
      case FT_FIRST_NAME_TRUNCATION:
        return "First name truncation";
      case FT_MIDDLE_NAME_TRUNCATION:
        return "Middle name truncation";
      case FT_EXAM_DATE:
        return "Exam date";
      case FT_ORGANIZATION:
        return "Organization";
      case FT_DEPARTMENT:
        return "Department";
      case FT_PAY_GRADE:
        return "Pay grade";
      case FT_RANK:
        return "Rank";
      case FT_BENEFITS_NUMBER:
        return "Benefits number";
      case FT_SPONSOR_SERVICE:
        return "Sponsor service";
      case FT_SPONSOR_STATUS:
        return "Sponsor status";
      case FT_SPONSOR:
        return "Sponsor";
      case FT_RELATIONSHIP:
        return "Relationship";
      case FT_USCIS:
        return "USCIS";
      case FT_CATEGORY:
        return "Category";
      case FT_CONDITIONS:
        return "Conditions";
      case FT_IDENTIFIER:
        return "Identifier";
      case FT_CONFIGURATION:
        return "Configuration";
      case FT_DISCRETIONARY_DATA:
        return "Discretionary data";
      case FT_LINE_1_OPTIONAL_DATA:
        return "Optional data from line 1";
      case FT_LINE_2_OPTIONAL_DATA:
        return "Optional data from line 2";
      case FT_LINE_3_OPTIONAL_DATA:
        return "Optional data from line 3";
      case FT_EQV_CODE:
        return "EQV code";
      case FT_ALT_CODE:
        return "ALT code";
      case FT_BINARY_CODE:
        return "Binary code";
      case FT_PSEUDO_CODE:
        return "Pseudocode";
      case FT_FEE:
        return "Fee";
      case FT_STAMP_NUMBER:
        return "Stamp number";
      case FT_GNIB_NUMBER:
        return "GNIB number";
      case FT_DEPT_NUMBER:
        return "Department number";
      case FT_TELEX_CODE:
        return "Telegraph code";
      case FT_ALLERGIES:
        return "Allergies";
      case FT_SP_CODE:
        return "Special code";
      case FT_COURT_CODE:
        return "Court code";
      case FT_CTY:
        return "County";
      case FT_SPONSOR_SSN:
        return "Sponsor SSN";
      case FT_DO_D_NUMBER:
        return "DoD number";
      case FT_MC_NOVICE_DATE:
        return "Expiry date of Motorcycle Novice status";
      case FT_DUF_NUMBER:
        return "DUF number";
      case FT_AGY:
        return "AGY";
      case FT_PNR_CODE:
        return "PNR code";
      case FT_FROM_AIRPORT_CODE:
        return "Code of the airport of departure";
      case FT_TO_AIRPORT_CODE:
        return "Code of the airport of arrival";
      case FT_FLIGHT_NUMBER:
        return "Flight number";
      case FT_DATE_OF_FLIGHT:
        return "Date of flight";
      case FT_SEAT_NUMBER:
        return "Seat number";
      case FT_DATE_OF_ISSUE_BOARDING_PASS:
        return "Date of boarding pass issue";
      case FT_CCW_UNTIL:
        return "CCW until";
      case FT_REFERENCE_NUMBER_CHECKSUM:
        return "Unique number checksum";
      case FT_REFERENCE_NUMBER_CHECK_DIGIT:
        return "Unique number check digit";
      case FT_ROOM_NUMBER:
        return "Room number";
      case FT_RELIGION:
        return "Religion";
      case FT_REMAINDER_TERM:
        return "Months to expire";
      case FT_ELECTRONIC_TICKET_INDICATOR:
        return "Electronic ticket indicator";
      case FT_COMPARTMENT_CODE:
        return "Compartment code";
      case FT_CHECK_IN_SEQUENCE_NUMBER:
        return "Check-in sequence number";
      case FT_AIRLINE_DESIGNATOR_OF_BOARDING_PASS_ISSUER:
        return "Airline designator of boarding pass issuer";
      case FT_AIRLINE_NUMERIC_CODE:
        return "Airline numeric code";
      case FT_TICKET_NUMBER:
        return "Ticket number";
      case FT_FREQUENT_FLYER_AIRLINE_DESIGNATOR:
        return "Frequent flyer airline designator";
      case FT_FREQUENT_FLYER_NUMBER:
        return "Frequent flyer number";
      case FT_FREE_BAGGAGE_ALLOWANCE:
        return "Free baggage allowance";
      case FT_PDF_417_CODEC:
        return "PDF417 codec";
      case FT_IDENTITY_CARD_NUMBER_CHECKSUM:
        return "Checksum for identity card number";
      case FT_IDENTITY_CARD_NUMBER_CHECK_DIGIT:
        return "Check digit for identity card number";
      case FT_VETERAN:
        return "Veteran";
      case FT_DL_CLASS_CODE_A_1_FROM:
        return "DL category A1 valid from";
      case FT_DL_CLASS_CODE_A_1_TO:
        return "DL category A1 valid to";
      case FT_DL_CLASS_CODE_A_1_NOTES:
        return "DL category A1 codes";
      case FT_DL_CLASS_CODE_A_FROM:
        return "DL category A valid from";
      case FT_DL_CLASS_CODE_A_TO:
        return "DL category A valid to";
      case FT_DL_CLASS_CODE_A_NOTES:
        return "DL category A codes";
      case FT_DL_CLASS_CODE_B_FROM:
        return "DL category B valid from";
      case FT_DL_CLASS_CODE_B_TO:
        return "DL category B valid to";
      case FT_DL_CLASS_CODE_B_NOTES:
        return "DL category B codes";
      case FT_DL_CLASS_CODE_C_1_FROM:
        return "DL category C1 valid from";
      case FT_DL_CLASS_CODE_C_1_TO:
        return "DL category C1 valid to";
      case FT_DL_CLASS_CODE_C_1_NOTES:
        return "DL category C1 codes";
      case FT_DL_CLASS_CODE_C_FROM:
        return "DL category C valid from";
      case FT_DL_CLASS_CODE_C_TO:
        return "DL category C valid to";
      case FT_DL_CLASS_CODE_C_NOTES:
        return "DL category C codes";
      case FT_DL_CLASS_CODE_D_1_FROM:
        return "DL category D1 valid from";
      case FT_DL_CLASS_CODE_D_1_TO:
        return "DL category D1 valid to";
      case FT_DL_CLASS_CODE_D_1_NOTES:
        return "DL category D1 codes";
      case FT_DL_CLASS_CODE_D_FROM:
        return "DL category D valid from";
      case FT_DL_CLASS_CODE_D_TO:
        return "DL category D valid to";
      case FT_DL_CLASS_CODE_D_NOTES:
        return "DL category D codes";
      case FT_DL_CLASS_CODE_BE_FROM:
        return "DL category BE valid from";
      case FT_DL_CLASS_CODE_BE_TO:
        return "DL category BE valid to";
      case FT_DL_CLASS_CODE_BE_NOTES:
        return "DL category BE codes";
      case FT_DL_CLASS_CODE_C_1_E_FROM:
        return "DL category C1E valid from";
      case FT_DL_CLASS_CODE_C_1_E_TO:
        return "DL category C1E valid to";
      case FT_DL_CLASS_CODE_C_1_E_NOTES:
        return "DL category C1E codes";
      case FT_DL_CLASS_CODE_CE_FROM:
        return "DL category CE valid from";
      case FT_DL_CLASS_CODE_CE_TO:
        return "DL category CE valid to";
      case FT_DL_CLASS_CODE_CE_NOTES:
        return "DL category CE codes";
      case FT_DL_CLASS_CODE_D_1_E_FROM:
        return "DL category D1E valid from";
      case FT_DL_CLASS_CODE_D_1_E_TO:
        return "DL category D1E valid to";
      case FT_DL_CLASS_CODE_D_1_E_NOTES:
        return "DL category D1E codes";
      case FT_DL_CLASS_CODE_DE_FROM:
        return "DL category DE valid from";
      case FT_DL_CLASS_CODE_DE_TO:
        return "DL category DE valid to";
      case FT_DL_CLASS_CODE_DE_NOTES:
        return "DL category DE codes";
      case FT_DL_CLASS_CODE_M_FROM:
        return "DL category M valid from";
      case FT_DL_CLASS_CODE_M_TO:
        return "DL category M valid to";
      case FT_DL_CLASS_CODE_M_NOTES:
        return "DL category M codes";
      case FT_DL_CLASS_CODE_L_FROM:
        return "DL category L valid from";
      case FT_DL_CLASS_CODE_L_TO:
        return "DL category L valid to";
      case FT_DL_CLASS_CODE_L_NOTES:
        return "DL category L codes";
      case FT_DL_CLASS_CODE_T_FROM:
        return "DL category T valid from";
      case FT_DL_CLASS_CODE_T_TO:
        return "DL category T valid to";
      case FT_DL_CLASS_CODE_T_NOTES:
        return "DL category T codes";
      case FT_DL_CLASS_CODE_AM_FROM:
        return "DL category AM valid from";
      case FT_DL_CLASS_CODE_AM_TO:
        return "DL category AM valid to";
      case FT_DL_CLASS_CODE_AM_NOTES:
        return "DL category AM codes";
      case FT_DL_CLASS_CODE_A_2_FROM:
        return "DL category A2 valid from";
      case FT_DL_CLASS_CODE_A_2_TO:
        return "DL category A2 valid to";
      case FT_DL_CLASS_CODE_A_2_NOTES:
        return "DL category A2 codes";
      case FT_DL_CLASS_CODE_B_1_FROM:
        return "DL category B1 valid from";
      case FT_DL_CLASS_CODE_B_1_TO:
        return "DL category B1 valid to";
      case FT_DL_CLASS_CODE_B_1_NOTES:
        return "DL category B1 codes";
      case FT_SURNAME_AT_BIRTH:
        return "Surname at birth";
      case FT_CIVIL_STATUS:
        return "Civil status";
      case FT_NUMBER_OF_SEATS:
        return "Number of seats";
      case FT_NUMBER_OF_STANDING_PLACES:
        return "Number of standing places";
      case FT_MAX_SPEED:
        return "Max speed";
      case FT_FUEL_TYPE:
        return "Fuel type";
      case FT_EC_ENVIRONMENTAL_TYPE:
        return "Vehicle environmental type";
      case FT_POWER_WEIGHT_RATIO:
        return "Power-to-weight ratio";
      case FT_MAX_MASS_OF_TRAILER_BRAKED:
        return "Max mass of trailer (braked)";
      case FT_MAX_MASS_OF_TRAILER_UNBRAKED:
        return "Max mass of trailer (unbraked)";
      case FT_TRANSMISSION_TYPE:
        return "Transmission type";
      case FT_TRAILER_HITCH:
        return "Trailer hitch";
      case FT_ACCOMPANIED_BY:
        return "Accompanied by";
      case FT_POLICE_DISTRICT:
        return "Police district";
      case FT_FIRST_ISSUE_DATE:
        return "First issue date";
      case FT_PAYLOAD_CAPACITY:
        return "Payload capacity";
      case FT_NUMBER_OF_AXELS:
        return "Number of axles";
      case FT_PERMISSIBLE_AXLE_LOAD:
        return "Permissible axle load";
      case FT_PRECINCT:
        return "Precinct";
      case FT_INVITED_BY:
        return "Invited by";
      case FT_PURPOSE_OF_ENTRY:
        return "Purpose of entry";
      case FT_SKIN_COLOR:
        return "Skin color";
      case FT_COMPLEXION:
        return "Complexion";
      case FT_AIRPORT_FROM:
        return "Airport of departure";
      case FT_AIRPORT_TO:
        return "Airport of arrival";
      case FT_AIRLINE_NAME:
        return "Airline name";
      case FT_AIRLINE_NAME_FREQUENT_FLYER:
        return "Airline loyalty program for frequent flyers";
      case FT_LICENSE_NUMBER:
        return "License number";
      case FT_IN_TANKS:
        return "In tanks";
      case FT_EXEPT_IN_TANKS:
        return "Except in tanks";
      case FT_FAST_TRACK:
        return "Fast Track service";
      case FT_OWNER:
        return "Owner";
      case FT_MRZ_STRINGS_ICAO_RFID:
        return "MRZ lines from ICAO RFID";
      case FT_NUMBER_OF_CARD_ISSUANCE:
        return "Number of card issuances";
      case FT_NUMBER_OF_CARD_ISSUANCE_CHECKSUM:
        return "Checksum for number of card issuances";
      case FT_NUMBER_OF_CARD_ISSUANCE_CHECK_DIGIT:
        return "Check digit for number of card issuances";
      case FT_CENTURY_DATE_OF_BIRTH:
        return "Century of birth";
      case FT_DL_CLASSCODE_A3_FROM:
        return "DL category A3 valid from";
      case FT_DL_CLASSCODE_A3_TO:
        return "DL category A3 valid to";
      case FT_DL_CLASSCODE_A3_NOTES:
        return "DL category A3 codes";
      case FT_DL_CLASSCODE_C2_FROM:
        return "DL category C2 valid from";
      case FT_DL_CLASSCODE_C2_TO:
        return "DL category C2 valid to";
      case FT_DL_CLASSCODE_C2_NOTES:
        return "DL category C2 codes";
      case FT_DL_CLASSCODE_B2_FROM:
        return "DL category B2 valid from";
      case FT_DL_CLASSCODE_B2_TO:
        return "DL category B2 valid to";
      case FT_DL_CLASSCODE_B2_NOTES:
        return "DL category B2 codes";
      case FT_DL_CLASSCODE_D2_FROM:
        return "DL category D2 valid from";
      case FT_DL_CLASSCODE_D2_TO:
        return "DL category D2 valid to";
      case FT_DL_CLASSCODE_D2_NOTES:
        return "DL category D2 codes";
      case FT_DL_CLASSCODE_B2E_FROM:
        return "DL category B2E valid from";
      case FT_DL_CLASSCODE_B2E_TO:
        return "DL category B2E valid to";
      case FT_DL_CLASSCODE_B2E_NOTES:
        return "DL category B2E codes";
      case FT_DL_CLASSCODE_G_FROM:
        return "DL category G valid from";
      case FT_DL_CLASSCODE_G_TO:
        return "DL category G valid to";
      case FT_DL_CLASSCODE_G_NOTES:
        return "DL category G codes";
      case FT_DL_CLASSCODE_J_FROM:
        return "DL category J valid from";
      case FT_DL_CLASSCODE_J_TO:
        return "DL category J valid to";
      case FT_DL_CLASSCODE_J_NOTES:
        return "DL category J codes";
      case FT_DL_CLASSCODE_LC_FROM:
        return "DL category LC valid from";
      case FT_DL_CLASSCODE_LC_TO:
        return "DL category LC valid to";
      case FT_DLC_LASSCODE_LC_NOTES:
        return "DL category LC codes";
      case FT_BANKCARDNUMBER:
        return "Bank card number";
      case FT_BANKCARDVALIDTHRU:
        return "Bank card validity";
      case FT_TAX_NUMBER:
        return "Tax number";
      case FT_SBH_SECURITYOPTIONS:
        return "SBH security options";
      case FT_SBH_INTEGRITYOPTIONS:
        return "SBH integrity options";
      case FT_DATE_OF_CREATION:
        return "Creation date";
      case FT_VALIDITY_PERIOD:
        return "Validity period";
      case FT_PATRON_HEADER_VERSION:
        return "Patron header version";
      case FT_BDB_TYPE:
        return "BDB type";
      case FT_BIOMETRIC_TYPE:
        return "Biometric type";
      case FT_BIOMETRIC_SUBTYPE:
        return "Biometric subtype";
      case FT_BIOMETRIC_PRODUCTID:
        return "Biometric product ID";
      case FT_BIOMETRIC_FORMAT_OWNER:
        return "Biometric format owner";
      case FT_BIOMETRIC_FORMAT_TYPE:
        return "Biometric format type";
      case FT_PHONE:
        return "Phone";
      case FT_PROFESSION:
        return "Profession";
      case FT_TITLE:
        return "Position";
      case FT_PERSONAL_SUMMARY:
        return "Personal data summary";
      case FT_OTHER_VALID_ID:
        return "Other valid IDs";
      case FT_CUSTODY_INFO:
        return "Custody info";
      case FT_OTHER_NAME:
        return "Other name";
      case FT_OBSERVATIONS:
        return "Observations";
      case FT_TAX:
        return "Tax";
      case FT_DATE_OF_PERSONALIZATION:
        return "Personalization date";
      case FT_PERSONALIZATION_SN:
        return "Serial number of personalization";
      case FT_OTHERPERSON_NAME:
        return "Other person, name";
      case FT_PERSONTONOTIFY_DATE_OF_RECORD:
        return "Notify person: Date of record";
      case FT_PERSONTONOTIFY_NAME:
        return "Notify person: Name";
      case FT_PERSONTONOTIFY_PHONE:
        return "Notify person: Phone";
      case FT_PERSONTONOTIFY_ADDRESS:
        return "Notify person: Address";
      case FT_DS_CERTIFICATE_ISSUER:
        return "DS certificate issuer";
      case FT_DS_CERTIFICATE_SUBJECT:
        return "DS certificate subject";
      case FT_DS_CERTIFICATE_VALIDFROM:
        return "DS certificate valid from";
      case FT_DS_CERTIFICATE_VALIDTO:
        return "DS certificate valid to";
      case FT_VRC_DATAOBJECT_ENTRY:
        return "Vehicle data from the DG1 data group";
      case FT_GRANDFATHERNAME:
        return "Grandfather\'s name";
      case FT_HEALTH_NUMBER:
        return "Health insurance number";
      case FT_TYPE_APPROVAL_NUMBER:
        return "Type of approval number";
      case FT_ADMINISTRATIVE_NUMBER:
        return "Administrative number";
      case FT_DOCUMENT_DISCRIMINATOR:
        return "Document discriminator";
      case FT_DATA_DISCRIMINATOR:
        return "Data discriminator";
      case FT_ISO_ISSUER_ID_NUMBER:
        return "ID number of ISO issuer";
      case FT_SELECTEE_INDICATOR:
        return "Selectee indicator";
      case FT_MOTHER_SURNAME:
        return "Mother\'s surname";
      case FT_MOTHER_GIVENNAME:
        return "Mother\'s given name";
      case FT_FATHER_SURNAME:
        return "Father\'s surname";
      case FT_FATHER_GIVENNAME:
        return "Father\'s given name";
      case FT_MOTHER_DATEOFBIRTH:
        return "Mother\'s date of birth";
      case FT_FATHER_DATEOFBIRTH:
        return "Father\'s date of birth";
      case FT_MOTHER_PERSONALNUMBER:
        return "Mother\'s personal number";
      case FT_FATHER_PERSONALNUMBER:
        return "Father\'s personal number";
      case FT_MOTHER_PLACEOFBIRTH:
        return "Mother\'s place of birth";
      case FT_FATHER_PLACEOFBIRTH:
        return "Father\'s place of birth";
      case FT_MOTHER_COUNTRYOFBIRTH:
        return "Mother\'s country of birth";
      case FT_FATHER_COUNTRYOFBIRTH:
        return "Father\'s country of birth";
      case FT_DATE_FIRST_RENEWAL:
        return "Date of first renewal";
      case FT_DATE_SECOND_RENEWAL:
        return "Date of second renewal";
      case FT_PLACE_OF_EXAMINATION:
        return "Place of examination";
      case FT_APPLICATION_NUMBER:
        return "Application number";
      case FT_VOUCHER_NUMBER:
        return "Voucher number";
      case FT_AUTHORIZATION_NUMBER:
        return "Authorization number";
      case FT_FACULTY:
        return "Faculty";
      case FT_FORM_OF_EDUCATION:
        return "Form of education";
      case FT_DNI_NUMBER:
        return "DNI number";
      case FT_RETIREMENT_NUMBER:
        return "Retirement number";
      case FT_PROFESSIONAL_ID_NUMBER:
        return "Professional ID number";
      case FT_AGE_AT_ISSUE:
        return "Age at issue";
      case FT_YEARS_SINCE_ISSUE:
        return "Years since issue";
      case FT_DLCLASSCODE_BTP_FROM:
        return "DL category BTP valid from";
      case FT_DLCLASSCODE_BTP_NOTES:
        return "DL category BTP codes";
      case FT_DLCLASSCODE_BTP_TO:
        return "DL category BTP valid to";
      case FT_DLCLASSCODE_C3_FROM:
        return "DL category C3 valid from";
      case FT_DLCLASSCODE_C3_NOTES:
        return "DL category C3 codes";
      case FT_DLCLASSCODE_C3_TO:
        return "DL category C3 valid to";
      case FT_DLCLASSCODE_E_FROM:
        return "DL category E valid from";
      case FT_DLCLASSCODE_E_NOTES:
        return "DL category E codes";
      case FT_DLCLASSCODE_E_TO:
        return "DL category E valid to";
      case FT_DLCLASSCODE_F_FROM:
        return "DL category F valid from";
      case FT_DLCLASSCODE_F_NOTES:
        return "DL category F codes";
      case FT_DLCLASSCODE_F_TO:
        return "DL category F valid to";
      case FT_DLCLASSCODE_FA_FROM:
        return "DL category FA valid from";
      case FT_DLCLASSCODE_FA_NOTES:
        return "DL category FA codes";
      case FT_DLCLASSCODE_FA_TO:
        return "DL category FA valid to";
      case FT_DLCLASSCODE_FA1_FROM:
        return "DL category FA1 valid from";
      case FT_DLCLASSCODE_FA1_NOTES:
        return "DL category FA1 codes";
      case FT_DLCLASSCODE_FA1_TO:
        return "DL category FA1 valid to";
      case FT_DLCLASSCODE_FB_FROM:
        return "DL category FB valid from";
      case FT_DLCLASSCODE_FB_NOTES:
        return "DL category FB codes";
      case FT_DLCLASSCODE_FB_TO:
        return "DL category FB valid to";
      case FT_DLCLASSCODE_G1_FROM:
        return "DL category G1 valid from";
      case FT_DLCLASSCODE_G1_NOTES:
        return "DL category G1 codes";
      case FT_DLCLASSCODE_G1_TO:
        return "DL category G1 valid to";
      case FT_DLCLASSCODE_H_FROM:
        return "DL category H valid from";
      case FT_DLCLASSCODE_H_NOTES:
        return "DL category H codes";
      case FT_DLCLASSCODE_H_TO:
        return "DL category H valid to";
      case FT_DLCLASSCODE_I_FROM:
        return "DL category I valid from";
      case FT_DLCLASSCODE_I_NOTES:
        return "DL category I codes";
      case FT_DLCLASSCODE_I_TO:
        return "DL category I valid to";
      case FT_DLCLASSCODE_K_FROM:
        return "DL category K valid from";
      case FT_DLCLASSCODE_K_NOTES:
        return "DL category K codes";
      case FT_DLCLASSCODE_K_TO:
        return "DL category K valid to";
      case FT_DLCLASSCODE_LK_FROM:
        return "DL category LK valid from";
      case FT_DLCLASSCODE_LK_NOTES:
        return "DL category LK codes";
      case FT_DLCLASSCODE_LK_TO:
        return "DL category LK valid to";
      case FT_DLCLASSCODE_N_FROM:
        return "DL category N valid from";
      case FT_DLCLASSCODE_N_NOTES:
        return "DL category N codes";
      case FT_DLCLASSCODE_N_TO:
        return "DL category N valid to";
      case FT_DLCLASSCODE_S_FROM:
        return "DL category S valid from";
      case FT_DLCLASSCODE_S_NOTES:
        return "DL category S codes";
      case FT_DLCLASSCODE_S_TO:
        return "DL category S valid to";
      case FT_DLCLASSCODE_TB_FROM:
        return "DL category TB valid from";
      case FT_DLCLASSCODE_TB_NOTES:
        return "DL category TB codes";
      case FT_DLCLASSCODE_TB_TO:
        return "DL category TB valid to";
      case FT_DLCLASSCODE_TM_FROM:
        return "DL category TM valid from";
      case FT_DLCLASSCODE_TM_NOTES:
        return "DL category TM codes";
      case FT_DLCLASSCODE_TM_TO:
        return "DL category TM valid to";
      case FT_DLCLASSCODE_TR_FROM:
        return "DL category TR valid from";
      case FT_DLCLASSCODE_TR_NOTES:
        return "DL category TR codes";
      case FT_DLCLASSCODE_TR_TO:
        return "DL category TR valid to";
      case FT_DLCLASSCODE_TV_FROM:
        return "DL category TV valid from";
      case FT_DLCLASSCODE_TV_NOTES:
        return "DL category TV codes";
      case FT_DLCLASSCODE_TV_TO:
        return "DL category TV valid to";
      case FT_DLCLASSCODE_V_FROM:
        return "DL category V valid from";
      case FT_DLCLASSCODE_V_NOTES:
        return "DL category V codes";
      case FT_DLCLASSCODE_V_TO:
        return "DL category V valid to";
      case FT_DLCLASSCODE_W_FROM:
        return "DL category W valid from";
      case FT_DLCLASSCODE_W_NOTES:
        return "DL category W codes";
      case FT_DLCLASSCODE_W_TO:
        return "DL category W valid to";
      case FT_CALIBER:
        return "Caliber";
      case FT_CITIZENSHIP_OF_FIRST_PERSON:
        return "Citizenship of the first person";
      case FT_CITIZENSHIP_OF_SECOND_PERSON:
        return "Citizenship of the second person";
      case FT_CVV:
        return "CVV/CVC";
      case FT_DATE_OF_BIRTH_OF_HUSBAND:
        return "Date of birth of husband";
      case FT_DATE_OF_BIRTH_OF_WIFE:
        return "Date of birth of wife";
      case FT_MAKE:
        return "Make";
      case FT_MODEL:
        return "Model";
      case FT_NUMBER_OF_CYLINDERS:
        return "Number of cylinders";
      case FT_SURNAME_OF_HUSBAND_AFTER_REGISTRATION:
        return "Surname of husband after registration";
      case FT_SURNAME_OF_WIFE_AFTER_REGISTRATION:
        return "Surname of wife after registration";
      case FT_URL:
        return "URL";
      case FT_DATE_OF_INSURANCE_EXPIRY:
        return "Expiry date of insurance";
      case FT_MORTGAGE_BY:
        return "Mortgage by";
      case FT_OLD_DOCUMENT_NUMBER:
        return "Old document number";
      case FT_OLD_DATE_OF_ISSUE:
        return "Old date of issue";
      case FT_OLD_PLACE_OF_ISSUE:
        return "Old place of issue";
      case FT_DLCLASSCODE_LR_FROM:
        return "DL category LR valid from";
      case FT_DLCLASSCODE_LR_TO:
        return "DL category LR valid to";
      case FT_DLCLASSCODE_LR_NOTES:
        return "DL category LR codes";
      case FT_DLCLASSCODE_MR_FROM:
        return "DL category MR valid from";
      case FT_DLCLASSCODE_MR_TO:
        return "DL category MR valid to";
      case FT_DLCLASSCODE_MR_NOTES:
        return "DL category MR codes";
      case FT_DLCLASSCODE_HR_FROM:
        return "DL category HR valid from";
      case FT_DLCLASSCODE_HR_TO:
        return "DL category HR valid to";
      case FT_DLCLASSCODE_HR_NOTES:
        return "DL category HR codes";
      case FT_DLCLASSCODE_HC_FROM:
        return "DL category HC valid from";
      case FT_DLCLASSCODE_HC_TO:
        return "DL category HC valid to";
      case FT_DLCLASSCODE_HC_NOTES:
        return "DL category HC codes";
      case FT_DLCLASSCODE_MC_FROM:
        return "DL category MC valid from";
      case FT_DLCLASSCODE_MC_TO:
        return "DL category MC valid to";
      case FT_DLCLASSCODE_MC_NOTES:
        return "DL category MC codes";
      case FT_DLCLASSCODE_RE_FROM:
        return "DL category RE valid from";
      case FT_DLCLASSCODE_RE_TO:
        return "DL category RE valid to";
      case FT_DLCLASSCODE_RE_NOTES:
        return "DL category RE codes";
      case FT_DLCLASSCODE_R_FROM:
        return "DL category R valid from";
      case FT_DLCLASSCODE_R_TO:
        return "DL category R valid to";
      case FT_DLCLASSCODE_R_NOTES:
        return "DL category R codes";
      case FT_DLCLASSCODE_CA_FROM:
        return "DL category CA valid from";
      case FT_DLCLASSCODE_CA_TO:
        return "DL category CA valid to";
      case FT_DLCLASSCODE_CA_NOTES:
        return "DL category CA codes";
      default:
        return value.toString();
    }
  }
}

class FontStyle {
  static const int NORMAL = 0;
  static const int BOLD = 1;
  static const int ITALIC = 2;
  static const int BOLD_ITALIC = 3;
}

class FrameShapeType {
  static const int LINE = 0;
  static const int CORNER = 1;
}

class LCID {
  static const int LATIN = 0;
  static const int AFRIKAANS = 1078;
  static const int ALBANIAN = 1052;
  static const int ARABIC_ALGERIA = 5121;
  static const int ARABIC_BAHRAIN = 15361;
  static const int ARABIC_EGYPT = 3073;
  static const int ARABIC_IRAQ = 2049;
  static const int ARABIC_JORDAN = 11265;
  static const int ARABIC_KUWAIT = 13313;
  static const int ARABIC_LEBANON = 12289;
  static const int ARABIC_LIBYA = 4097;
  static const int ARABIC_MOROCCO = 6145;
  static const int ARABIC_OMAN = 8193;
  static const int ARABIC_QATAR = 16385;
  static const int ARABIC_SAUDI_ARABIA = 1025;
  static const int ARABIC_SYRIA = 10241;
  static const int ARABIC_TUNISIA = 7169;
  static const int ARABIC_UAE = 14337;
  static const int ARABIC_YEMEN = 9217;
  static const int ARABIC_ARMENIAN = 1067;
  static const int AZERI_CYRILIC = 2092;
  static const int AZERI_LATIN = 1068;
  static const int BASQUE = 1069;
  static const int BELARUSIAN = 1059;
  static const int BULGARIAN = 1026;
  static const int CATALAN = 1027;
  static const int CHINESE_HONGKONG_SAR = 3076;
  static const int CHINESE_MACAO_SAR = 5124;
  static const int CHINESE = 2052;
  static const int CHINESE_SINGAPORE = 4100;
  static const int CHINESE_TAIWAN = 1028;
  static const int CROATIAN = 1050;
  static const int CZECH = 1029;
  static const int DANISH = 1030;
  static const int DIVEHI = 1125;
  static const int DUTCH_BELGIUM = 2067;
  static const int DUTCH_NETHERLANDS = 1043;
  static const int ENGLISH_AUSTRALIA = 3081;
  static const int ENGLISH_BELIZE = 10249;
  static const int ENGLISH_CANADA = 4105;
  static const int ENGLISH_CARRIBEAN = 9225;
  static const int ENGLISH_IRELAND = 6153;
  static const int ENGLISH_JAMAICA = 8201;
  static const int ENGLISH_NEW_ZEALAND = 5129;
  static const int ENGLISH_PHILIPPINES = 13321;
  static const int ENGLISH_SOUTH_AFRICA = 7177;
  static const int ENGLISH_TRINIDAD = 11273;
  static const int ENGLISH_UK = 2057;
  static const int ENGLISH_US = 1033;
  static const int ENGLISH_ZIMBABWE = 12297;
  static const int ESTONIAN = 1061;
  static const int FAEROESE = 1080;
  static const int FARSI = 1065;
  static const int FINNISH = 1035;
  static const int FRENCH_BELGIUM = 2060;
  static const int FRENCH_CANADA = 3084;
  static const int FRENCH_FRANCE = 1036;
  static const int FRENCH_LUXEMBOURG = 5132;
  static const int FRENCH_MONACO = 6156;
  static const int FRENCH_SWITZERLAND = 4108;
  static const int FYRO_MACEDONIAN = 1071;
  static const int GALICIAN = 1110;
  static const int GEORGIAN = 1079;
  static const int GERMAN_AUSTRIA = 3079;
  static const int GERMAN_GERMANY = 1031;
  static const int GERMAN_LIECHTENSTEIN = 5127;
  static const int GERMAN_LUXEMBOURG = 4103;
  static const int GERMAN_SWITZERLAND = 2055;
  static const int GREEK = 1032;
  static const int GUJARATI = 1095;
  static const int HEBREW = 1037;
  static const int HINDI_INDIA = 1081;
  static const int HUNGARIAN = 1038;
  static const int ICELANDIC = 1039;
  static const int INDONESIAN = 1057;
  static const int ITALIAN_ITALY = 1040;
  static const int ITALIAN_SWITZERLAND = 2064;
  static const int JAPANESE = 1041;
  static const int KANNADA = 1099;
  static const int KAZAKH = 1087;
  static const int KONKANI = 1111;
  static const int KOREAN = 1042;
  static const int KYRGYZ_CYRILICK = 1088;
  static const int LATVIAN = 1062;
  static const int LITHUANIAN = 1063;
  static const int MALAY_MALAYSIA = 1086;
  static const int MALAY_BRUNEI_DARUSSALAM = 2110;
  static const int MARATHI = 1102;
  static const int MONGOLIAN_CYRILIC = 1104;
  static const int NORWEGIAN_BOKMAL = 1044;
  static const int NORWEGIAN_NYORSK = 2068;
  static const int POLISH = 1045;
  static const int PORTUGUESE_BRAZIL = 1046;
  static const int PORTUGUESE_PORTUGAL = 2070;
  static const int PUNJABI = 1094;
  static const int RHAETO_ROMANIC = 1047;
  static const int ROMANIAN = 1048;
  static const int RUSSIAN = 1049;
  static const int SANSKRIT = 1103;
  static const int SERBIAN_CYRILIC = 3098;
  static const int SERBIAN_LATIN = 2074;
  static const int SLOVAK = 1051;
  static const int SLOVENIAN = 1060;
  static const int SPANISH_ARGENTINA = 11274;
  static const int SPANISH_BOLIVIA = 16394;
  static const int SPANISH_CHILE = 13322;
  static const int SPANICH_COLOMBIA = 9226;
  static const int SPANISH_COSTA_RICA = 5130;
  static const int SPANISH_DOMINICAN_REPUBLIC = 7178;
  static const int SPANISH_ECUADOR = 12298;
  static const int SPANISH_EL_SALVADOR = 17418;
  static const int SPANISH_GUATEMALA = 4106;
  static const int SPANISH_HONDURAS = 18442;
  static const int SPANISH_MEXICO = 2058;
  static const int SPANISH_NICARAGUA = 19466;
  static const int SPANISH_PANAMA = 6154;
  static const int SPANISH_PARAGUAY = 15370;
  static const int SPANISH_PERU = 10250;
  static const int SPANISH_PUERTO_RICO = 20490;
  static const int SPANISH_TRADITIONAL_SORT = 1034;
  static const int SPANISH_INTERNATIONAL_SORT = 3082;
  static const int SPANISH_URUGUAY = 14346;
  static const int SPANISH_VENEZUELA = 8202;
  static const int SWAHILI = 1089;
  static const int SWEDISH = 1053;
  static const int SWEDISH_FINLAND = 2077;
  static const int SYRIAC = 1114;
  static const int TAMIL = 1097;
  static const int TATAR = 1092;
  static const int TELUGU = 1098;
  static const int THAI_THAILAND = 1054;
  static const int TURKISH = 1055;
  static const int TAJIK_CYRILLIC = 1064;
  static const int TURKMEN = 1090;
  static const int UKRAINIAN = 1058;
  static const int URDU = 1056;
  static const int UZBEK_CYRILIC = 2115;
  static const int UZBEK_LATIN = 1091;
  static const int VIETNAMESE = 1066;
  static const int CTC_SIMPLIFIED = 50001;
  static const int CTC_TRADITIONAL = 50002;

  static String getTranslation(int value) {
    switch (value) {
      case LATIN:
        return "Latin";
      case AFRIKAANS:
        return "Afrikaans";
      case ALBANIAN:
        return "Albanian";
      case ARABIC_ALGERIA:
        return "Arabic (Algeria)";
      case ARABIC_BAHRAIN:
        return "Arabic (Bahrain)";
      case ARABIC_EGYPT:
        return "Arabic (Egypt)";
      case ARABIC_IRAQ:
        return "Arabic (Iraq)";
      case ARABIC_JORDAN:
        return "Arabic (Jordan)";
      case ARABIC_KUWAIT:
        return "Arabic (Kuwait)";
      case ARABIC_LEBANON:
        return "Arabic (Lebanon)";
      case ARABIC_LIBYA:
        return "Arabic (Libya)";
      case ARABIC_MOROCCO:
        return "Arabic (Morocco)";
      case ARABIC_OMAN:
        return "Arabic (Oman)";
      case ARABIC_QATAR:
        return "Arabic (Qatar)";
      case ARABIC_SAUDI_ARABIA:
        return "Arabic (Saudi Arabia)";
      case ARABIC_SYRIA:
        return "Arabic (Syria)";
      case ARABIC_TUNISIA:
        return "Arabic (Tunisia)";
      case ARABIC_UAE:
        return "Arabic (U.A.E.)";
      case ARABIC_YEMEN:
        return "Arabic (Yemen)";
      case ARABIC_ARMENIAN:
        return "Armenian";
      case AZERI_CYRILIC:
        return "Azeri (Cyrillic)";
      case AZERI_LATIN:
        return "Azeri (Latin)";
      case BASQUE:
        return "Basque";
      case BELARUSIAN:
        return "Belarusian";
      case BULGARIAN:
        return "Bulgarian";
      case CATALAN:
        return "Catalan";
      case CHINESE_HONGKONG_SAR:
        return "Chinese (HongKong S.A.R.)";
      case CHINESE_MACAO_SAR:
        return "Chinese (Macao S.A.R.)";
      case CHINESE:
        return "Chinese";
      case CHINESE_SINGAPORE:
        return "Chinese (Singapore)";
      case CHINESE_TAIWAN:
        return "Chinese (Taiwan)";
      case CROATIAN:
        return "Croatian";
      case CZECH:
        return "Czech";
      case DANISH:
        return "Danish";
      case DIVEHI:
        return "Divehi";
      case DUTCH_BELGIUM:
        return "Dutch (Belgium)";
      case DUTCH_NETHERLANDS:
        return "Dutch (Netherlands)";
      case ENGLISH_AUSTRALIA:
        return "English (Australia)";
      case ENGLISH_BELIZE:
        return "English (Belize)";
      case ENGLISH_CANADA:
        return "English (Canada)";
      case ENGLISH_CARRIBEAN:
        return "English (Caribbean)";
      case ENGLISH_IRELAND:
        return "English (Ireland)";
      case ENGLISH_JAMAICA:
        return "English (Jamaica)";
      case ENGLISH_NEW_ZEALAND:
        return "English (New Zealand)";
      case ENGLISH_PHILIPPINES:
        return "English (Philippines)";
      case ENGLISH_SOUTH_AFRICA:
        return "English (South Africa)";
      case ENGLISH_TRINIDAD:
        return "English (Trinidad)";
      case ENGLISH_UK:
        return "English (United Kingdom)";
      case ENGLISH_US:
        return "English (United States)";
      case ENGLISH_ZIMBABWE:
        return "English (Zimbabwe)";
      case ESTONIAN:
        return "Estonian";
      case FAEROESE:
        return "Faeroese";
      case FARSI:
        return "Farsi";
      case FINNISH:
        return "Finnish";
      case FRENCH_BELGIUM:
        return "French (Belgium)";
      case FRENCH_CANADA:
        return "French (Canada)";
      case FRENCH_FRANCE:
        return "French (France)";
      case FRENCH_LUXEMBOURG:
        return "French (Luxembourg)";
      case FRENCH_MONACO:
        return "French (Monaco)";
      case FRENCH_SWITZERLAND:
        return "French (Switzerland)";
      case GALICIAN:
        return "Galician";
      case GEORGIAN:
        return "Georgian";
      case GERMAN_AUSTRIA:
        return "German (Austria)";
      case GERMAN_GERMANY:
        return "German (Germany)";
      case GERMAN_LIECHTENSTEIN:
        return "German (Liechtenstein)";
      case GERMAN_LUXEMBOURG:
        return "German (Luxembourg)";
      case GERMAN_SWITZERLAND:
        return "German (Switzerland)";
      case GREEK:
        return "Greek";
      case GUJARATI:
        return "Gujarati";
      case HEBREW:
        return "Hebrew";
      case HINDI_INDIA:
        return "Hindi (India)";
      case HUNGARIAN:
        return "Hungarian";
      case ICELANDIC:
        return "Icelandic";
      case INDONESIAN:
        return "Indonesian";
      case ITALIAN_ITALY:
        return "Italian (Italy)";
      case ITALIAN_SWITZERLAND:
        return "Italian (Switzerland)";
      case JAPANESE:
        return "Japanese";
      case KANNADA:
        return "Kannada";
      case KAZAKH:
        return "Kazakh";
      case KONKANI:
        return "Konkani";
      case KOREAN:
        return "Korean";
      case KYRGYZ_CYRILICK:
        return "Kyrgyz (Cyrillic)";
      case LATVIAN:
        return "Latvian";
      case LITHUANIAN:
        return "Lithuanian";
      case FYRO_MACEDONIAN:
        return "FYRO Macedonian";
      case MALAY_MALAYSIA:
        return "Malay (Malaysia)";
      case MALAY_BRUNEI_DARUSSALAM:
        return "Malay (Brunei Darussalam)";
      case MARATHI:
        return "Marathi";
      case MONGOLIAN_CYRILIC:
        return "Mongolian (Cyrillic)";
      case NORWEGIAN_BOKMAL:
        return "Norwegian (Bokmal)";
      case NORWEGIAN_NYORSK:
        return "Norwegian (Nynorsk)";
      case POLISH:
        return "Polish";
      case PORTUGUESE_BRAZIL:
        return "Portuguese (Brazil)";
      case PORTUGUESE_PORTUGAL:
        return "Portuguese (Portugal)";
      case PUNJABI:
        return "Punjabi";
      case RHAETO_ROMANIC:
        return "Rhaeto-Romanic";
      case ROMANIAN:
        return "Romanian";
      case RUSSIAN:
        return "Russian";
      case SANSKRIT:
        return "Sanskrit";
      case SERBIAN_CYRILIC:
        return "Serbian (Cyrillic)";
      case SERBIAN_LATIN:
        return "Serbian (Latin)";
      case SLOVAK:
        return "Slovak";
      case SLOVENIAN:
        return "Slovenian";
      case SPANISH_ARGENTINA:
        return "Spanish (Argentina)";
      case SPANISH_BOLIVIA:
        return "Spanish (Bolivia)";
      case SPANISH_CHILE:
        return "Spanish (Chile)";
      case SPANICH_COLOMBIA:
        return "Spanish (Colombia)";
      case SPANISH_COSTA_RICA:
        return "Spanish (Costa Rica)";
      case SPANISH_DOMINICAN_REPUBLIC:
        return "Spanish (Dominican Republic)";
      case SPANISH_ECUADOR:
        return "Spanish (Ecuador)";
      case SPANISH_EL_SALVADOR:
        return "Spanish (El Salvador)";
      case SPANISH_GUATEMALA:
        return "Spanish (Guatemala)";
      case SPANISH_HONDURAS:
        return "Spanish (Honduras)";
      case SPANISH_MEXICO:
        return "Spanish (Mexico)";
      case SPANISH_NICARAGUA:
        return "Spanish (Nicaragua)";
      case SPANISH_PANAMA:
        return "Spanish (Panama)";
      case SPANISH_PARAGUAY:
        return "Spanish (Paraguay)";
      case SPANISH_PERU:
        return "Spanish (Peru)";
      case SPANISH_PUERTO_RICO:
        return "Spanish (Puerto Rico)";
      case SPANISH_TRADITIONAL_SORT:
        return "Spanish (Traditional Sort)";
      case SPANISH_INTERNATIONAL_SORT:
        return "Spanish (International Sort)";
      case SPANISH_URUGUAY:
        return "Spanish (Uruguay)";
      case SPANISH_VENEZUELA:
        return "Spanish (Venezuela)";
      case SWAHILI:
        return "Swahili";
      case SWEDISH:
        return "Swedish";
      case SWEDISH_FINLAND:
        return "Swedish (Finland)";
      case SYRIAC:
        return "Syriac";
      case TAMIL:
        return "Tamil";
      case TATAR:
        return "Tatar";
      case TELUGU:
        return "Telugu";
      case THAI_THAILAND:
        return "Thai (Thailand)";
      case TURKISH:
        return "Turkish";
      case TAJIK_CYRILLIC:
        return "Tajik (Cyrillic)";
      case TURKMEN:
        return "Turkmen";
      case UKRAINIAN:
        return "Ukrainian";
      case URDU:
        return "Urdu";
      case UZBEK_CYRILIC:
        return "Uzbek (Cyrillic)";
      case UZBEK_LATIN:
        return "Uzbek (Latin)";
      case VIETNAMESE:
        return "Vietnamese";
      case CTC_SIMPLIFIED:
        return "CTC Simplified";
      case CTC_TRADITIONAL:
        return "CTC Traditional";
      default:
        return value.toString();
    }
  }
}

class PKDResourceType {
  static const int CERTIFICATE_PA = 0;
  static const int CERTIFICATE_TA = 1;
  static const int LDIF = 2;
  static const int CRL = 3;
  static const int ML = 4;
  static const int DEFL = 5;
  static const int DEVL = 6;
  static const int BL = 7;

  static int getType(String value) {
    switch (value) {
      case "pa":
        return CERTIFICATE_PA;
      case "ta":
        return CERTIFICATE_TA;
      case "ldif":
        return LDIF;
      case "crl":
        return CRL;
      case "ml":
        return ML;
      case "defl":
        return DEFL;
      case "devl":
        return DEVL;
      case "bl":
        return BL;
      default:
        return CERTIFICATE_PA;
    }
  }
}

class ProcessingFinishedStatus {
  static const int NOT_READY = 0;
  static const int READY = 1;
  static const int TIMEOUT = 2;
}

class RGLMeasureSystem {
  static const int METRIC = 0;
  static const int IMPERIAL = 1;
}

class ScenarioIdentifier {
  static const String SCENARIO_MRZ = "Mrz";
  static const String SCENARIO_BARCODE = "Barcode";
  static const String SCENARIO_LOCATE = "Locate";
  static const String SCENARIO_OCR = "Ocr";
  static const String SCENARIO_DOCTYPE = "DocType";
  static const String SCENARIO_MRZ_OR_BARCODE = "MrzOrBarcode";
  static const String SCENARIO_MRZ_OR_LOCATE = "MrzOrLocate";
  static const String SCENARIO_MRZ_AND_LOCATE = "MrzAndLocate";
  static const String SCENARIO_MRZ_OR_OCR = "MrzOrOcr";
  static const String SCENARIO_MRZ_OR_BARCODE_OR_OCR = "MrzOrBarcodeOrOcr";
  static const String SCENARIO_LOCATE_VISUAL_AND_MRZ_OR_OCR = "LocateVisual_And_MrzOrOcr";
  static const String SCENARIO_FULL_PROCESS = "FullProcess";
  static const String SCENARIO_FULL_AUTH = "FullAuth";
  static const String SCENARIO_ID3RUS = "Id3Rus";
  static const String SCENARIO_RUS_STAMP = "RusStamp";
  static const String SCENARIO_OCR_FREE = "OcrFree";
  static const String SCENARIO_CREDIT_CARD = "CreditCard";
  static const String SCENARIO_CAPTURE = "Capture";
}

class LineCap {
  static const int Butt = 0;
  static const int Round = 1;
  static const int Square = 2;
}

class UIInterfaceOrientationMask {
  static const int Portrait = 0;
  static const int LandscapeLeft = 1;
  static const int LandscapeRight = 2;
  static const int PortraitUpsideDown = 3;
  static const int Landscape = 4;
  static const int All = 5;
  static const int AllButUpsideDown = 6;
}

class AVCaptureSessionPreset {
  static const int Low = 0;
  static const int Medium = 1;
  static const int High = 2;
  static const int Photo = 3;
  static const int InputPriority = 4;
  static const int QHD960x540 = 5;
  static const int Hd1280x720 = 6;
  static const int Hd1920x1080 = 7;
  static const int Hd4K3840x2160 = 8;
  static const int IFrame960x540 = 9;
  static const int IFrame1280x720 = 10;
  static const int Qvga320x240 = 11;
  static const int Vga640x480 = 12;
  static const int Cif352x288 = 13;
}

class AVCaptureDevicePosition {
  static const int Front = 0;
  static const int Back = 1;
  static const int Unspecified = 2;
}

class UIViewContentMode {
  static const int ScaleToFill = 0;
  static const int ScaleAspectFit = 1;
  static const int ScaleAspectFill = 2;
  static const int Redraw = 3;
  static const int Center = 4;
  static const int Top = 5;
  static const int Bottom = 6;
  static const int Left = 7;
  static const int Right = 8;
  static const int TopLeft = 9;
  static const int TopRight = 10;
  static const int BottomLeft = 11;
  static const int BottomRight = 12;
}

class DocumentReader {
  static const MethodChannel _channel = const MethodChannel('flutter_document_reader_api/method');

  static Future<dynamic> getAPIVersion() async {
    return await _channel.invokeMethod("getAPIVersion", []);
  }

  static Future<dynamic> getAvailableScenarios() async {
    return await _channel.invokeMethod("getAvailableScenarios", []);
  }

  static Future<dynamic> isRFIDAvailableForUse() async {
    return await _channel.invokeMethod("isRFIDAvailableForUse", []);
  }

  static Future<dynamic> getCoreMode() async {
    return await _channel.invokeMethod("getCoreMode", []);
  }

  static Future<dynamic> getCoreVersion() async {
    return await _channel.invokeMethod("getCoreVersion", []);
  }

  static Future<dynamic> getDatabaseDate() async {
    return await _channel.invokeMethod("getDatabaseDate", []);
  }

  static Future<dynamic> getDatabaseID() async {
    return await _channel.invokeMethod("getDatabaseID", []);
  }

  static Future<dynamic> getDatabaseVersion() async {
    return await _channel.invokeMethod("getDatabaseVersion", []);
  }

  static Future<dynamic> getDocumentReaderIsReady() async {
    return await _channel.invokeMethod("getDocumentReaderIsReady", []);
  }

  static Future<dynamic> getDocumentReaderStatus() async {
    return await _channel.invokeMethod("getDocumentReaderStatus", []);
  }

  static Future<dynamic> getDatabaseCountriesNumber() async {
    return await _channel.invokeMethod("getDatabaseCountriesNumber", []);
  }

  static Future<dynamic> getDatabaseDocumentsNumber() async {
    return await _channel.invokeMethod("getDatabaseDocumentsNumber", []);
  }

  static Future<dynamic> selectedScenario() async {
    return await _channel.invokeMethod("selectedScenario", []);
  }

  static Future<dynamic> getSessionLogFolder() async {
    return await _channel.invokeMethod("getSessionLogFolder", []);
  }

  static Future<dynamic> getDatabaseDescription() async {
    return await _channel.invokeMethod("getDatabaseDescription", []);
  }

  static Future<dynamic> showScanner() async {
    return await _channel.invokeMethod("showScanner", []);
  }

  static Future<dynamic> startNewPage() async {
    return await _channel.invokeMethod("startNewPage", []);
  }

  static Future<dynamic> startNewSession() async {
    return await _channel.invokeMethod("startNewSession", []);
  }

  static Future<dynamic> startRFIDReader() async {
    return await _channel.invokeMethod("startRFIDReader", []);
  }

  static Future<dynamic> stopRFIDReader() async {
    return await _channel.invokeMethod("stopRFIDReader", []);
  }

  static Future<dynamic> stopScanner() async {
    return await _channel.invokeMethod("stopScanner", []);
  }

  static Future<dynamic> deinitializeReader() async {
    return await _channel.invokeMethod("deinitializeReader", []);
  }

  static Future<dynamic> isAuthenticatorAvailableForUse() async {
    return await _channel.invokeMethod("isAuthenticatorAvailableForUse", []);
  }

  static Future<dynamic> getConfig() async {
    return await _channel.invokeMethod("getConfig", []);
  }

  static Future<dynamic> getRfidScenario() async {
    return await _channel.invokeMethod("getRfidScenario", []);
  }

  static Future<dynamic> getLicenseExpiryDate() async {
    return await _channel.invokeMethod("getLicenseExpiryDate", []);
  }

  static Future<dynamic> getLicenseCountryFilter() async {
    return await _channel.invokeMethod("getLicenseCountryFilter", []);
  }

  static Future<dynamic> licenseIsRfidAvailable() async {
    return await _channel.invokeMethod("licenseIsRfidAvailable", []);
  }

  static Future<dynamic> getCameraSessionIsPaused() async {
    return await _channel.invokeMethod("getCameraSessionIsPaused", []);
  }

  static Future<dynamic> removeDatabase() async {
    return await _channel.invokeMethod("removeDatabase", []);
  }

  static Future<dynamic> cancelDBUpdate() async {
    return await _channel.invokeMethod("cancelDBUpdate", []);
  }

  static Future<dynamic> resetConfiguration() async {
    return await _channel.invokeMethod("resetConfiguration", []);
  }

  static Future<dynamic> clearPKDCertificates() async {
    return await _channel.invokeMethod("clearPKDCertificates", []);
  }

  static Future<dynamic> readRFID() async {
    return await _channel.invokeMethod("readRFID", []);
  }

  static Future<dynamic> getRfidSessionStatus() async {
    return await _channel.invokeMethod("getRfidSessionStatus", []);
  }

  static Future<dynamic> setEnableCoreLogs(logs) async {
    return await _channel.invokeMethod("setEnableCoreLogs", [logs]);
  }

  static Future<dynamic> addPKDCertificates(certificates) async {
    return await _channel.invokeMethod("addPKDCertificates", [certificates]);
  }

  static Future<dynamic> setCameraSessionIsPaused(paused) async {
    return await _channel.invokeMethod("setCameraSessionIsPaused", [paused]);
  }

  static Future<dynamic> getScenario(scenario) async {
    return await _channel.invokeMethod("getScenario", [scenario]);
  }

  static Future<dynamic> recognizeImages(images) async {
    return await _channel.invokeMethod("recognizeImages", [images]);
  }

  static Future<dynamic> showScannerWithCameraID(cameraID) async {
    return await _channel.invokeMethod("showScannerWithCameraID", [cameraID]);
  }

  static Future<dynamic> runAutoUpdate(databaseType) async {
    return await _channel.invokeMethod("runAutoUpdate", [databaseType]);
  }

  static Future<dynamic> setConfig(config) async {
    return await _channel.invokeMethod("setConfig", [config]);
  }

  static Future<dynamic> setRfidScenario(scenario) async {
    return await _channel.invokeMethod("setRfidScenario", [scenario]);
  }

  static Future<dynamic> initializeReader(license) async {
    return await _channel.invokeMethod("initializeReader", [license]);
  }

  static Future<dynamic> prepareDatabase(databaseType) async {
    return await _channel.invokeMethod("prepareDatabase", [databaseType]);
  }

  static Future<dynamic> recognizeImage(image) async {
    return await _channel.invokeMethod("recognizeImage", [image]);
  }

  static Future<dynamic> setRfidSessionStatus(status) async {
    return await _channel.invokeMethod("setRfidSessionStatus", [status]);
  }

  static Future<dynamic> initializeReaderWithDatabasePath(license, path) async {
    return await _channel.invokeMethod("initializeReaderWithDatabasePath", [license, path]);
  }

  static Future<dynamic> recognizeImageFrame(image, params) async {
    return await _channel.invokeMethod("recognizeImageFrame", [image, params]);
  }

  static Future<dynamic> recognizeImageWithOpts(image, options) async {
    return await _channel.invokeMethod("recognizeImageWithOpts", [image, options]);
  }

  static Future<dynamic> recognizeVideoFrame(byteString, params) async {
    return await _channel.invokeMethod("recognizeVideoFrame", [byteString, params]);
  }

  static Future<dynamic> showScannerWithCameraIDAndOpts(cameraID, options) async {
    return await _channel.invokeMethod("showScannerWithCameraIDAndOpts", [cameraID, options]);
  }

  static Future<dynamic> recognizeImageWithImageInputParams(image, params) async {
    return await _channel.invokeMethod("recognizeImageWithImageInputParams", [image, params]);
  }

  static Future<dynamic> recognizeImageWithCameraMode(image, mode) async {
    return await _channel.invokeMethod("recognizeImageWithCameraMode", [image, mode]);
  }
}