import 'dart:async';
import 'package:flutter/services.dart';

// Classes

class DocumentReaderScenario {
  String? name;
  String? caption;
  String? description;

  static DocumentReaderScenario? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderScenario();

    result.name = jsonObject["name"];
    result.caption = jsonObject["caption"];
    result.description = jsonObject["description"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (name != null) result.addAll({"name": name});
    if (caption != null) result.addAll({"caption": caption});
    if (description != null) result.addAll({"description": description});

    return result;
  }
}

class CoreDetailedScenario {
  bool? uvTorch;
  int? frameOrientation;
  bool? faceExt;
  int? multiPageOff;
  bool? seriesProcessMode;
  double? frameKWHLandscape;
  double? frameKWHPortrait;
  double? frameKWHDoublePageSpreadPortrait;
  double? frameKWHDoublePageSpreadLandscape;
  String? name;
  String? caption;
  String? description;
  bool? manualCrop;

  static CoreDetailedScenario? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CoreDetailedScenario();

    result.uvTorch = jsonObject["uvTorch"];
    result.frameOrientation = jsonObject["frameOrientation"];
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
    result.manualCrop = jsonObject["manualCrop"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (uvTorch != null) result.addAll({"uvTorch": uvTorch});
    if (frameOrientation != null) result.addAll({"frameOrientation": frameOrientation});
    if (faceExt != null) result.addAll({"faceExt": faceExt});
    if (multiPageOff != null) result.addAll({"multiPageOff": multiPageOff});
    if (seriesProcessMode != null) result.addAll({"seriesProcessMode": seriesProcessMode});
    if (frameKWHLandscape != null) result.addAll({"frameKWHLandscape": frameKWHLandscape});
    if (frameKWHPortrait != null) result.addAll({"frameKWHPortrait": frameKWHPortrait});
    if (frameKWHDoublePageSpreadPortrait != null) result.addAll({"frameKWHDoublePageSpreadPortrait": frameKWHDoublePageSpreadPortrait});
    if (frameKWHDoublePageSpreadLandscape != null) result.addAll({"frameKWHDoublePageSpreadLandscape": frameKWHDoublePageSpreadLandscape});
    if (name != null) result.addAll({"name": name});
    if (caption != null) result.addAll({"caption": caption});
    if (description != null) result.addAll({"description": description});
    if (manualCrop != null) result.addAll({"manualCrop": manualCrop});

    return result;
  }
}

class FaceMetaData {
  int? ID;
  int? rollAngle;
  Bounds? bounds;

  static FaceMetaData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceMetaData();

    result.ID = jsonObject["ID"];
    result.rollAngle = jsonObject["rollAngle"];
    result.bounds = Bounds.fromJson(jsonObject["bounds"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (ID != null) result.addAll({"ID": ID});
    if (rollAngle != null) result.addAll({"rollAngle": rollAngle});
    if (bounds != null) result.addAll({"bounds": bounds});

    return result;
  }
}

class Bounds {
  int? x;
  int? y;
  int? width;
  int? height;

  static Bounds? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Bounds();

    result.x = jsonObject["x"];
    result.y = jsonObject["y"];
    result.width = jsonObject["width"];
    result.height = jsonObject["height"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (x != null) result.addAll({"x": x});
    if (y != null) result.addAll({"y": y});
    if (width != null) result.addAll({"width": width});
    if (height != null) result.addAll({"height": height});

    return result;
  }
}

class Rect {
  int? bottom;
  int? top;
  int? left;
  int? right;

  static Rect? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Rect();

    result.bottom = jsonObject["bottom"];
    result.top = jsonObject["top"];
    result.left = jsonObject["left"];
    result.right = jsonObject["right"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (bottom != null) result.addAll({"bottom": bottom});
    if (top != null) result.addAll({"top": top});
    if (left != null) result.addAll({"left": left});
    if (right != null) result.addAll({"right": right});

    return result;
  }
}

class DocReaderFieldRect {
  int? bottom;
  int? top;
  int? left;
  int? right;

  static DocReaderFieldRect? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocReaderFieldRect();

    result.bottom = jsonObject["bottom"];
    result.top = jsonObject["top"];
    result.left = jsonObject["left"];
    result.right = jsonObject["right"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (bottom != null) result.addAll({"bottom": bottom});
    if (top != null) result.addAll({"top": top});
    if (left != null) result.addAll({"left": left});
    if (right != null) result.addAll({"right": right});

    return result;
  }
}

class DocumentReaderGraphicField {
  int? sourceType;
  int? fieldType;
  int? lightType;
  int? pageIndex;
  String? fieldName;
  String? lightName;
  String? value;
  DocReaderFieldRect? fieldRect;

  static DocumentReaderGraphicField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderGraphicField();

    result.sourceType = jsonObject["sourceType"];
    result.fieldType = jsonObject["fieldType"];
    result.lightType = jsonObject["lightType"];
    result.pageIndex = jsonObject["pageIndex"];
    result.fieldName = jsonObject["fieldName"];
    result.lightName = jsonObject["lightName"];
    result.value = jsonObject["value"];
    result.fieldRect = DocReaderFieldRect.fromJson(jsonObject["fieldRect"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (sourceType != null) result.addAll({"sourceType": sourceType});
    if (fieldType != null) result.addAll({"fieldType": fieldType});
    if (lightType != null) result.addAll({"lightType": lightType});
    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (fieldName != null) result.addAll({"fieldName": fieldName});
    if (lightName != null) result.addAll({"lightName": lightName});
    if (value != null) result.addAll({"value": value});
    if (fieldRect != null) result.addAll({"fieldRect": fieldRect});

    return result;
  }
}

class DocumentReaderGraphicResult {
  List<DocumentReaderGraphicField?> fields = [];

  static DocumentReaderGraphicResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderGraphicResult();

    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderGraphicField.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (fields != null) result.addAll({"fields": fields});

    return result;
  }
}

class DocumentReaderValue {
  int? pageIndex;
  int? sourceType;
  int? validity;
  int? probability;
  String? value;
  String? originalValue;
  Rect? boundRect;
  Map<int, int> comparison = {};

  static DocumentReaderValue? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (sourceType != null) result.addAll({"sourceType": sourceType});
    if (validity != null) result.addAll({"validity": validity});
    if (probability != null) result.addAll({"probability": probability});
    if (value != null) result.addAll({"value": value});
    if (originalValue != null) result.addAll({"originalValue": originalValue});
    if (boundRect != null) result.addAll({"boundRect": boundRect});
    if (comparison != null) result.addAll({"comparison": comparison});

    return result;
  }
}

class DocumentReaderTextField {
  int? fieldType;
  int? lcid;
  int? status;
  String? lcidName;
  String? fieldName;
  DocumentReaderValue? value;
  List<DocumentReaderValue?> values = [];

  static DocumentReaderTextField? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (fieldType != null) result.addAll({"fieldType": fieldType});
    if (lcid != null) result.addAll({"lcid": lcid});
    if (status != null) result.addAll({"status": status});
    if (lcidName != null) result.addAll({"lcidName": lcidName});
    if (fieldName != null) result.addAll({"fieldName": fieldName});
    if (value != null) result.addAll({"value": value});
    if (values != null) result.addAll({"values": values});

    return result;
  }
}

class DocumentReaderTextResult {
  int? status;
  List<DocumentReaderTextField?> fields = [];

  static DocumentReaderTextResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextResult();

    result.status = jsonObject["status"];
    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderTextField.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (status != null) result.addAll({"status": status});
    if (fields != null) result.addAll({"fields": fields});

    return result;
  }
}

class Coordinate {
  int? x;
  int? y;

  static Coordinate? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Coordinate();

    result.x = jsonObject["x"];
    result.y = jsonObject["y"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (x != null) result.addAll({"x": x});
    if (y != null) result.addAll({"y": y});

    return result;
  }
}

class ElementPosition {
  int? docFormat;
  int? width;
  int? height;
  int? dpi;
  int? pageIndex;
  int? inverse;
  int? perspectiveTr;
  int? objArea;
  int? objIntAngleDev;
  int? resultStatus;
  double? angle;
  Coordinate? center;
  Coordinate? leftTop;
  Coordinate? leftBottom;
  Coordinate? rightTop;
  Coordinate? rightBottom;

  static ElementPosition? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (docFormat != null) result.addAll({"docFormat": docFormat});
    if (width != null) result.addAll({"width": width});
    if (height != null) result.addAll({"height": height});
    if (dpi != null) result.addAll({"dpi": dpi});
    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (inverse != null) result.addAll({"inverse": inverse});
    if (perspectiveTr != null) result.addAll({"perspectiveTr": perspectiveTr});
    if (objArea != null) result.addAll({"objArea": objArea});
    if (objIntAngleDev != null) result.addAll({"objIntAngleDev": objIntAngleDev});
    if (resultStatus != null) result.addAll({"resultStatus": resultStatus});
    if (angle != null) result.addAll({"angle": angle});
    if (center != null) result.addAll({"center": center});
    if (leftTop != null) result.addAll({"leftTop": leftTop});
    if (leftBottom != null) result.addAll({"leftBottom": leftBottom});
    if (rightTop != null) result.addAll({"rightTop": rightTop});
    if (rightBottom != null) result.addAll({"rightBottom": rightBottom});

    return result;
  }
}

class ImageQuality {
  int? featureType;
  int? result;
  int? type;

  static ImageQuality? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQuality();

    result.featureType = jsonObject["featureType"];
    result.result = jsonObject["result"];
    result.type = jsonObject["type"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (featureType != null) result.addAll({"featureType": featureType});
    if (result != null) result.addAll({"result": result});
    if (type != null) result.addAll({"type": type});

    return result;
  }
}

class ImageQualityGroup {
  int? count;
  int? result;
  List<ImageQuality?> imageQualityList = [];
  int? pageIndex;

  static ImageQualityGroup? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQualityGroup();

    result.count = jsonObject["count"];
    result.result = jsonObject["result"];
    if (jsonObject["imageQualityList"] != null)
      for (var item in jsonObject["imageQualityList"])
        result.imageQualityList.add(ImageQuality.fromJson(item));
    result.pageIndex = jsonObject["pageIndex"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (count != null) result.addAll({"count": count});
    if (result != null) result.addAll({"result": result});
    if (imageQualityList != null) result.addAll({"imageQualityList": imageQualityList});
    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});

    return result;
  }
}

class DocumentReaderDocumentType {
  int? pageIndex;
  int? documentID;
  int? dType;
  int? dFormat;
  bool? dMRZ;
  String? name;
  String? ICAOCode;
  String? dDescription;
  String? dYear;
  String? dCountryName;
  List<int?> FDSID = [];

  static DocumentReaderDocumentType? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (documentID != null) result.addAll({"documentID": documentID});
    if (dType != null) result.addAll({"dType": dType});
    if (dFormat != null) result.addAll({"dFormat": dFormat});
    if (dMRZ != null) result.addAll({"dMRZ": dMRZ});
    if (name != null) result.addAll({"name": name});
    if (ICAOCode != null) result.addAll({"ICAOCode": ICAOCode});
    if (dDescription != null) result.addAll({"dDescription": dDescription});
    if (dYear != null) result.addAll({"dYear": dYear});
    if (dCountryName != null) result.addAll({"dCountryName": dCountryName});
    if (FDSID != null) result.addAll({"FDSID": FDSID});

    return result;
  }
}

class DocumentReaderNotification {
  int? code;
  int? attachment;
  int? value;

  static DocumentReaderNotification? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderNotification();

    result.code = jsonObject["code"];
    result.attachment = jsonObject["attachment"];
    result.value = jsonObject["value"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (code != null) result.addAll({"code": code});
    if (attachment != null) result.addAll({"attachment": attachment});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class AccessControlProcedureType {
  int? activeOptionIdx;
  int? type;
  int? status;
  List<int?> notifications = [];

  static AccessControlProcedureType? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (activeOptionIdx != null) result.addAll({"activeOptionIdx": activeOptionIdx});
    if (type != null) result.addAll({"type": type});
    if (status != null) result.addAll({"status": status});
    if (notifications != null) result.addAll({"notifications": notifications});

    return result;
  }
}

class FileData {
  int? length;
  int? type;
  int? status;
  String? data;

  static FileData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FileData();

    result.length = jsonObject["length"];
    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.data = jsonObject["data"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (length != null) result.addAll({"length": length});
    if (type != null) result.addAll({"type": type});
    if (status != null) result.addAll({"status": status});
    if (data != null) result.addAll({"data": data});

    return result;
  }
}

class CertificateData {
  int? length;
  String? data;

  static CertificateData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CertificateData();

    result.length = jsonObject["length"];
    result.data = jsonObject["data"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (length != null) result.addAll({"length": length});
    if (data != null) result.addAll({"data": data});

    return result;
  }
}

class SecurityObjectCertificates {
  CertificateData? securityObject;

  static SecurityObjectCertificates? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SecurityObjectCertificates();

    result.securityObject = CertificateData.fromJson(jsonObject["securityObject"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (securityObject != null) result.addAll({"securityObject": securityObject});

    return result;
  }
}

class File {
  int? readingTime;
  int? type;
  int? pAStatus;
  int? readingStatus;
  String? fileID;
  FileData? fileData;
  SecurityObjectCertificates? certificates;
  List<int?> docFieldsText = [];
  List<int?> docFieldsGraphics = [];
  List<int?> docFieldsOriginals = [];
  List<int?> notifications = [];

  static File? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (readingTime != null) result.addAll({"readingTime": readingTime});
    if (type != null) result.addAll({"type": type});
    if (pAStatus != null) result.addAll({"pAStatus": pAStatus});
    if (readingStatus != null) result.addAll({"readingStatus": readingStatus});
    if (fileID != null) result.addAll({"fileID": fileID});
    if (fileData != null) result.addAll({"fileData": fileData});
    if (certificates != null) result.addAll({"certificates": certificates});
    if (docFieldsText != null) result.addAll({"docFieldsText": docFieldsText});
    if (docFieldsGraphics != null) result.addAll({"docFieldsGraphics": docFieldsGraphics});
    if (docFieldsOriginals != null) result.addAll({"docFieldsOriginals": docFieldsOriginals});
    if (notifications != null) result.addAll({"notifications": notifications});

    return result;
  }
}

class Application {
  int? type;
  int? status;
  String? applicationID;
  String? dataHashAlgorithm;
  String? unicodeVersion;
  String? version;
  List<File?> files = [];

  static Application? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (status != null) result.addAll({"status": status});
    if (applicationID != null) result.addAll({"applicationID": applicationID});
    if (dataHashAlgorithm != null) result.addAll({"dataHashAlgorithm": dataHashAlgorithm});
    if (unicodeVersion != null) result.addAll({"unicodeVersion": unicodeVersion});
    if (version != null) result.addAll({"version": version});
    if (files != null) result.addAll({"files": files});

    return result;
  }
}

class Value {
  int? length;
  int? type;
  int? status;
  String? data;
  String? format;

  static Value? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Value();

    result.length = jsonObject["length"];
    result.type = jsonObject["type"];
    result.status = jsonObject["status"];
    result.data = jsonObject["data"];
    result.format = jsonObject["format"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (length != null) result.addAll({"length": length});
    if (type != null) result.addAll({"type": type});
    if (status != null) result.addAll({"status": status});
    if (data != null) result.addAll({"data": data});
    if (format != null) result.addAll({"format": format});

    return result;
  }
}

class Attribute {
  String? type;
  Value? value;

  static Attribute? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Attribute();

    result.type = jsonObject["type"];
    result.value = Value.fromJson(jsonObject["value"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class Authority {
  String? data;
  Value? friendlyName;
  List<Attribute?> attributes = [];

  static Authority? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Authority();

    result.data = jsonObject["data"];
    result.friendlyName = Value.fromJson(jsonObject["friendlyName"]);
    if (jsonObject["attributes"] != null)
      for (var item in jsonObject["attributes"])
        result.attributes.add(Attribute.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (data != null) result.addAll({"data": data});
    if (friendlyName != null) result.addAll({"friendlyName": friendlyName});
    if (attributes != null) result.addAll({"attributes": attributes});

    return result;
  }
}

class Extension {
  String? data;
  String? type;

  static Extension? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Extension();

    result.data = jsonObject["data"];
    result.type = jsonObject["type"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (data != null) result.addAll({"data": data});
    if (type != null) result.addAll({"type": type});

    return result;
  }
}

class Validity {
  Value? notAfter;
  Value? notBefore;

  static Validity? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Validity();

    result.notAfter = Value.fromJson(jsonObject["notAfter"]);
    result.notBefore = Value.fromJson(jsonObject["notBefore"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (notAfter != null) result.addAll({"notAfter": notAfter});
    if (notBefore != null) result.addAll({"notBefore": notBefore});

    return result;
  }
}

class CertificateChain {
  int? origin;
  int? type;
  int? version;
  int? paStatus;
  String? serialNumber;
  String? signatureAlgorithm;
  String? subjectPKAlgorithm;
  Value? fileName;
  Validity? validity;
  Authority? issuer;
  Authority? subject;
  List<int?> notifications = [];
  List<Extension?> extensions = [];

  static CertificateChain? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (origin != null) result.addAll({"origin": origin});
    if (type != null) result.addAll({"type": type});
    if (version != null) result.addAll({"version": version});
    if (paStatus != null) result.addAll({"paStatus": paStatus});
    if (serialNumber != null) result.addAll({"serialNumber": serialNumber});
    if (signatureAlgorithm != null) result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (subjectPKAlgorithm != null) result.addAll({"subjectPKAlgorithm": subjectPKAlgorithm});
    if (fileName != null) result.addAll({"fileName": fileName});
    if (validity != null) result.addAll({"validity": validity});
    if (issuer != null) result.addAll({"issuer": issuer});
    if (subject != null) result.addAll({"subject": subject});
    if (notifications != null) result.addAll({"notifications": notifications});
    if (extensions != null) result.addAll({"extensions": extensions});

    return result;
  }
}

class SignerInfo {
  int? version;
  int? paStatus;
  String? dataToHash;
  String? digestAlgorithm;
  String? signatureAlgorithm;
  Value? serialNumber;
  Value? signature;
  Value? subjectKeyIdentifier;
  Authority? issuer;
  List<int?> notifications = [];
  List<Extension?> signedAttributes = [];
  List<CertificateChain?> certificateChain = [];

  static SignerInfo? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (version != null) result.addAll({"version": version});
    if (paStatus != null) result.addAll({"paStatus": paStatus});
    if (dataToHash != null) result.addAll({"dataToHash": dataToHash});
    if (digestAlgorithm != null) result.addAll({"digestAlgorithm": digestAlgorithm});
    if (signatureAlgorithm != null) result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (serialNumber != null) result.addAll({"serialNumber": serialNumber});
    if (signature != null) result.addAll({"signature": signature});
    if (subjectKeyIdentifier != null) result.addAll({"subjectKeyIdentifier": subjectKeyIdentifier});
    if (issuer != null) result.addAll({"issuer": issuer});
    if (notifications != null) result.addAll({"notifications": notifications});
    if (signedAttributes != null) result.addAll({"signedAttributes": signedAttributes});
    if (certificateChain != null) result.addAll({"certificateChain": certificateChain});

    return result;
  }
}

class SecurityObject {
  int? fileReference;
  int? version;
  String? objectType;
  List<int?> notifications = [];
  List<SignerInfo?> signerInfos = [];

  static SecurityObject? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (fileReference != null) result.addAll({"fileReference": fileReference});
    if (version != null) result.addAll({"version": version});
    if (objectType != null) result.addAll({"objectType": objectType});
    if (notifications != null) result.addAll({"notifications": notifications});
    if (signerInfos != null) result.addAll({"signerInfos": signerInfos});

    return result;
  }
}

class CardProperties {
  int? aTQA;
  int? bitRateR;
  int? bitRateS;
  int? chipTypeA;
  int? mifareMemory;
  int? rfidType;
  int? sAK;
  bool? support4;
  bool? supportMifare;
  String? aTQB;
  String? aTR;
  String? baudrate1;
  String? baudrate2;
  String? uID;

  static CardProperties? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (aTQA != null) result.addAll({"aTQA": aTQA});
    if (bitRateR != null) result.addAll({"bitRateR": bitRateR});
    if (bitRateS != null) result.addAll({"bitRateS": bitRateS});
    if (chipTypeA != null) result.addAll({"chipTypeA": chipTypeA});
    if (mifareMemory != null) result.addAll({"mifareMemory": mifareMemory});
    if (rfidType != null) result.addAll({"rfidType": rfidType});
    if (sAK != null) result.addAll({"sAK": sAK});
    if (support4 != null) result.addAll({"support4": support4});
    if (supportMifare != null) result.addAll({"supportMifare": supportMifare});
    if (aTQB != null) result.addAll({"aTQB": aTQB});
    if (aTR != null) result.addAll({"aTR": aTR});
    if (baudrate1 != null) result.addAll({"baudrate1": baudrate1});
    if (baudrate2 != null) result.addAll({"baudrate2": baudrate2});
    if (uID != null) result.addAll({"uID": uID});

    return result;
  }
}

class RFIDSessionData {
  int? totalBytesReceived;
  int? totalBytesSent;
  int? status;
  int? extLeSupport;
  int? processTime;
  CardProperties? cardProperties;
  RFIDSessionDataStatus? sessionDataStatus;
  List<AccessControlProcedureType?> accessControls = [];
  List<Application?> applications = [];
  List<SecurityObject?> securityObjects = [];

  static RFIDSessionData? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (totalBytesReceived != null) result.addAll({"totalBytesReceived": totalBytesReceived});
    if (totalBytesSent != null) result.addAll({"totalBytesSent": totalBytesSent});
    if (status != null) result.addAll({"status": status});
    if (extLeSupport != null) result.addAll({"extLeSupport": extLeSupport});
    if (processTime != null) result.addAll({"processTime": processTime});
    if (cardProperties != null) result.addAll({"cardProperties": cardProperties});
    if (sessionDataStatus != null) result.addAll({"sessionDataStatus": sessionDataStatus});
    if (accessControls != null) result.addAll({"accessControls": accessControls});
    if (applications != null) result.addAll({"applications": applications});
    if (securityObjects != null) result.addAll({"securityObjects": securityObjects});

    return result;
  }
}

class DocumentReaderAuthenticityCheck {
  int? type;
  int? status;
  String? typeName;
  int? pageIndex;
  List<DocumentReaderAuthenticityElement?> elements = [];

  static DocumentReaderAuthenticityCheck? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (status != null) result.addAll({"status": status});
    if (typeName != null) result.addAll({"typeName": typeName});
    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (elements != null) result.addAll({"elements": elements});

    return result;
  }
}

class PDF417Info {
  int? errorLevel;
  int? columns;
  int? rows;

  static PDF417Info? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PDF417Info();

    result.errorLevel = jsonObject["errorLevel"];
    result.columns = jsonObject["columns"];
    result.rows = jsonObject["rows"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (errorLevel != null) result.addAll({"errorLevel": errorLevel});
    if (columns != null) result.addAll({"columns": columns});
    if (rows != null) result.addAll({"rows": rows});

    return result;
  }
}

class RFIDSessionDataStatus {
  int? AA;
  int? BAC;
  int? CA;
  int? PA;
  int? PACE;
  int? TA;
  int? overallStatus;

  static RFIDSessionDataStatus? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (AA != null) result.addAll({"AA": AA});
    if (BAC != null) result.addAll({"BAC": BAC});
    if (CA != null) result.addAll({"CA": CA});
    if (PA != null) result.addAll({"PA": PA});
    if (PACE != null) result.addAll({"PACE": PACE});
    if (TA != null) result.addAll({"TA": TA});
    if (overallStatus != null) result.addAll({"overallStatus": overallStatus});

    return result;
  }
}

class DocumentReaderBarcodeResult {
  List<DocumentReaderBarcodeField?> fields = [];

  static DocumentReaderBarcodeResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderBarcodeResult();

    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderBarcodeField.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (fields != null) result.addAll({"fields": fields});

    return result;
  }
}

class DocumentReaderBarcodeField {
  int? barcodeType;
  int? status;
  int? pageIndex;
  PDF417Info? pdf417Info;
  List<dynamic>? data;

  static DocumentReaderBarcodeField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderBarcodeField();

    result.barcodeType = jsonObject["barcodeType"];
    result.status = jsonObject["status"];
    result.pageIndex = jsonObject["pageIndex"];
    result.pdf417Info = PDF417Info.fromJson(jsonObject["pdf417Info"]);
    result.data = jsonObject["data"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (barcodeType != null) result.addAll({"barcodeType": barcodeType});
    if (status != null) result.addAll({"status": status});
    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (pdf417Info != null) result.addAll({"pdf417Info": pdf417Info});
    if (data != null) result.addAll({"data": data});

    return result;
  }
}

class DocumentReaderAuthenticityResult {
  int? status;
  List<DocumentReaderAuthenticityCheck?> checks = [];

  static DocumentReaderAuthenticityResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderAuthenticityResult();

    result.status = jsonObject["status"];
    if (jsonObject["checks"] != null)
      for (var item in jsonObject["checks"])
        result.checks.add(DocumentReaderAuthenticityCheck.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (status != null) result.addAll({"status": status});
    if (checks != null) result.addAll({"checks": checks});

    return result;
  }
}

class DocumentReaderAuthenticityElement {
  int? status;
  int? elementType;
  int? elementDiagnose;
  String? elementTypeName;
  String? elementDiagnoseName;

  static DocumentReaderAuthenticityElement? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderAuthenticityElement();

    result.status = jsonObject["status"];
    result.elementType = jsonObject["elementType"];
    result.elementDiagnose = jsonObject["elementDiagnose"];
    result.elementTypeName = jsonObject["elementTypeName"];
    result.elementDiagnoseName = jsonObject["elementDiagnoseName"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (status != null) result.addAll({"status": status});
    if (elementType != null) result.addAll({"elementType": elementType});
    if (elementDiagnose != null) result.addAll({"elementDiagnose": elementDiagnose});
    if (elementTypeName != null) result.addAll({"elementTypeName": elementTypeName});
    if (elementDiagnoseName != null) result.addAll({"elementDiagnoseName": elementDiagnoseName});

    return result;
  }
}

class DocumentReaderCompletion {
  int? action;
  DocumentReaderResults? results;
  DocumentReaderException? error;

  static DocumentReaderCompletion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderCompletion();

    result.action = jsonObject["action"];
    result.results = DocumentReaderResults.fromJson(jsonObject["results"]);
    result.error = DocumentReaderException.fromJson(jsonObject["error"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (action != null) result.addAll({"action": action});
    if (results != null) result.addAll({"results": results});
    if (error != null) result.addAll({"error": error});

    return result;
  }
}

class RfidNotificationCompletion {
  int? notification;
  int? value;

  static RfidNotificationCompletion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RfidNotificationCompletion();

    result.notification = jsonObject["notification"];
    result.value = jsonObject["value"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (notification != null) result.addAll({"notification": notification});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class DocumentReaderException {
  int? errorCode;
  String? localizedMessage;
  String? message;
  String? string;
  List<StackTraceElement?> stackTrace = [];

  static DocumentReaderException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderException();

    result.errorCode = jsonObject["errorCode"];
    result.localizedMessage = jsonObject["localizedMessage"];
    result.message = jsonObject["message"];
    result.string = jsonObject["string"];
    if (jsonObject["stackTrace"] != null)
      for (var item in jsonObject["stackTrace"])
        result.stackTrace.add(StackTraceElement.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (errorCode != null) result.addAll({"errorCode": errorCode});
    if (localizedMessage != null) result.addAll({"localizedMessage": localizedMessage});
    if (message != null) result.addAll({"message": message});
    if (string != null) result.addAll({"string": string});
    if (stackTrace != null) result.addAll({"stackTrace": stackTrace});

    return result;
  }
}

class Throwable {
  String? localizedMessage;
  String? message;
  String? string;
  List<StackTraceElement?> stackTrace = [];

  static Throwable? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Throwable();

    result.localizedMessage = jsonObject["localizedMessage"];
    result.message = jsonObject["message"];
    result.string = jsonObject["string"];
    if (jsonObject["stackTrace"] != null)
      for (var item in jsonObject["stackTrace"])
        result.stackTrace.add(StackTraceElement.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (localizedMessage != null) result.addAll({"localizedMessage": localizedMessage});
    if (message != null) result.addAll({"message": message});
    if (string != null) result.addAll({"string": string});
    if (stackTrace != null) result.addAll({"stackTrace": stackTrace});

    return result;
  }
}

class StackTraceElement {
  int? lineNumber;
  bool? isNativeMethod;
  String? className;
  String? fileName;
  String? methodName;
  String? string;

  static StackTraceElement? fromJson(jsonObject) {
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

  Map toJson(){
    Map result = {};

    if (lineNumber != null) result.addAll({"lineNumber": lineNumber});
    if (isNativeMethod != null) result.addAll({"isNativeMethod": isNativeMethod});
    if (className != null) result.addAll({"className": className});
    if (fileName != null) result.addAll({"fileName": fileName});
    if (methodName != null) result.addAll({"methodName": methodName});
    if (string != null) result.addAll({"string": string});

    return result;
  }
}

class PKDCertificate {
  String? binaryData;
  int? resourceType;
  String? privateKey;

  static PKDCertificate? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PKDCertificate();

    result.binaryData = jsonObject["binaryData"];
    result.resourceType = jsonObject["resourceType"];
    result.privateKey = jsonObject["privateKey"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (binaryData != null) result.addAll({"binaryData": binaryData});
    if (resourceType != null) result.addAll({"resourceType": resourceType});
    if (privateKey != null) result.addAll({"privateKey": privateKey});

    return result;
  }
}

class ImageInputParam {
  int? width;
  int? height;
  int? type;

  static ImageInputParam? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageInputParam();

    result.width = jsonObject["width"];
    result.height = jsonObject["height"];
    result.type = jsonObject["type"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (width != null) result.addAll({"width": width});
    if (height != null) result.addAll({"height": height});
    if (type != null) result.addAll({"type": type});

    return result;
  }
}

class PAResourcesIssuer {
  List<dynamic>? data;
  String? friendlyName;
  List<PAAttribute?> attributes = [];

  static PAResourcesIssuer? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PAResourcesIssuer();

    result.data = jsonObject["data"];
    result.friendlyName = jsonObject["friendlyName"];
    if (jsonObject["attributes"] != null)
      for (var item in jsonObject["attributes"])
        result.attributes.add(PAAttribute.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (data != null) result.addAll({"data": data});
    if (friendlyName != null) result.addAll({"friendlyName": friendlyName});
    if (attributes != null) result.addAll({"attributes": attributes});

    return result;
  }
}

class PAAttribute {
  String? type;
  String? value;

  static PAAttribute? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PAAttribute();

    result.type = jsonObject["type"];
    result.value = jsonObject["value"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class TAChallenge {
  List<dynamic>? data;
  String? auxPCD;
  String? challengePICC;
  String? hashPK;
  String? idPICC;

  static TAChallenge? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new TAChallenge();

    result.data = jsonObject["data"];
    result.auxPCD = jsonObject["auxPCD"];
    result.challengePICC = jsonObject["challengePICC"];
    result.hashPK = jsonObject["hashPK"];
    result.idPICC = jsonObject["idPICC"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (data != null) result.addAll({"data": data});
    if (auxPCD != null) result.addAll({"auxPCD": auxPCD});
    if (challengePICC != null) result.addAll({"challengePICC": challengePICC});
    if (hashPK != null) result.addAll({"hashPK": hashPK});
    if (idPICC != null) result.addAll({"idPICC": idPICC});

    return result;
  }
}

class DocumentReaderResultsStatus {
  int? overallStatus;
  int? optical;
  DetailsOptical? detailsOptical;
  int? rfid;
  DetailsRFID? detailsRFID;
  int? portrait;
  int? stopList;

  static DocumentReaderResultsStatus? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderResultsStatus();

    result.overallStatus = jsonObject["overallStatus"];
    result.optical = jsonObject["optical"];
    result.detailsOptical = DetailsOptical.fromJson(jsonObject["detailsOptical"]);
    result.rfid = jsonObject["rfid"];
    result.detailsRFID = DetailsRFID.fromJson(jsonObject["detailsRFID"]);
    result.portrait = jsonObject["portrait"];
    result.stopList = jsonObject["stopList"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (overallStatus != null) result.addAll({"overallStatus": overallStatus});
    if (optical != null) result.addAll({"optical": optical});
    if (detailsOptical != null) result.addAll({"detailsOptical": detailsOptical});
    if (rfid != null) result.addAll({"rfid": rfid});
    if (detailsRFID != null) result.addAll({"detailsRFID": detailsRFID});
    if (portrait != null) result.addAll({"portrait": portrait});
    if (stopList != null) result.addAll({"stopList": stopList});

    return result;
  }
}

class DetailsOptical {
  int? overallStatus;
  int? mrz;
  int? text;
  int? docType;
  int? security;
  int? imageQA;
  int? expiry;
  int? vds;
  int? pagesCount;

  static DetailsOptical? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetailsOptical();

    result.overallStatus = jsonObject["overallStatus"];
    result.mrz = jsonObject["mrz"];
    result.text = jsonObject["text"];
    result.docType = jsonObject["docType"];
    result.security = jsonObject["security"];
    result.imageQA = jsonObject["imageQA"];
    result.expiry = jsonObject["expiry"];
    result.vds = jsonObject["vds"];
    result.pagesCount = jsonObject["pagesCount"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (overallStatus != null) result.addAll({"overallStatus": overallStatus});
    if (mrz != null) result.addAll({"mrz": mrz});
    if (text != null) result.addAll({"text": text});
    if (docType != null) result.addAll({"docType": docType});
    if (security != null) result.addAll({"security": security});
    if (imageQA != null) result.addAll({"imageQA": imageQA});
    if (expiry != null) result.addAll({"expiry": expiry});
    if (vds != null) result.addAll({"vds": vds});
    if (pagesCount != null) result.addAll({"pagesCount": pagesCount});

    return result;
  }
}

class DetailsRFID {
  int? pa;
  int? ca;
  int? aa;
  int? ta;
  int? bac;
  int? pace;
  int? overallStatus;

  static DetailsRFID? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetailsRFID();

    result.pa = jsonObject["pa"];
    result.ca = jsonObject["ca"];
    result.aa = jsonObject["aa"];
    result.ta = jsonObject["ta"];
    result.bac = jsonObject["bac"];
    result.pace = jsonObject["pace"];
    result.overallStatus = jsonObject["overallStatus"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (pa != null) result.addAll({"pa": pa});
    if (ca != null) result.addAll({"ca": ca});
    if (aa != null) result.addAll({"aa": aa});
    if (ta != null) result.addAll({"ta": ta});
    if (bac != null) result.addAll({"bac": bac});
    if (pace != null) result.addAll({"pace": pace});
    if (overallStatus != null) result.addAll({"overallStatus": overallStatus});

    return result;
  }
}

class VDSNCData {
  String? type;
  int? version;
  String? issuingCountry;
  dynamic? message;
  String? signatureAlgorithm;
  BytesData? signature;
  BytesData? certificate;
  List<CertificateChain?> certificateChain = [];
  List<int?> notifications = [];

  static VDSNCData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new VDSNCData();

    result.type = jsonObject["type"];
    result.version = jsonObject["version"];
    result.issuingCountry = jsonObject["issuingCountry"];
    result.message = jsonObject["message"];
    result.signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result.signature = BytesData.fromJson(jsonObject["signature"]);
    result.certificate = BytesData.fromJson(jsonObject["certificate"]);
    if (jsonObject["certificateChain"] != null)
      for (var item in jsonObject["certificateChain"])
        result.certificateChain.add(CertificateChain.fromJson(item));
    if (jsonObject["notifications"] != null)
      for (var item in jsonObject["notifications"])
        result.notifications.add(item);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (version != null) result.addAll({"version": version});
    if (issuingCountry != null) result.addAll({"issuingCountry": issuingCountry});
    if (message != null) result.addAll({"message": message});
    if (signatureAlgorithm != null) result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (signature != null) result.addAll({"signature": signature});
    if (certificate != null) result.addAll({"certificate": certificate});
    if (certificateChain != null) result.addAll({"certificateChain": certificateChain});
    if (notifications != null) result.addAll({"notifications": notifications});

    return result;
  }
}

class BytesData {
  String? data;
  int? length;
  int? status;
  int? type;

  static BytesData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new BytesData();

    result.data = jsonObject["data"];
    result.length = jsonObject["length"];
    result.status = jsonObject["status"];
    result.type = jsonObject["type"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (data != null) result.addAll({"data": data});
    if (length != null) result.addAll({"length": length});
    if (status != null) result.addAll({"status": status});
    if (type != null) result.addAll({"type": type});

    return result;
  }
}

class DocumentReaderUvFiberElement {
  List<DocReaderFieldRect?> rectArray = [];
  int? rectCount;
  int? expectedCount;
  List<int?> width = [];
  List<int?> length = [];
  List<int?> area = [];
  List<int?> colorValues = [];
  int? status;
  int? elementType;
  int? elementDiagnose;
  String? elementTypeName;
  String? elementDiagnoseName;

  static DocumentReaderUvFiberElement? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderUvFiberElement();

    if (jsonObject["rectArray"] != null)
      for (var item in jsonObject["rectArray"])
        result.rectArray.add(DocReaderFieldRect.fromJson(item));
    result.rectCount = jsonObject["rectCount"];
    result.expectedCount = jsonObject["expectedCount"];
    if (jsonObject["width"] != null)
      for (var item in jsonObject["width"])
        result.width.add(item);
    if (jsonObject["length"] != null)
      for (var item in jsonObject["length"])
        result.length.add(item);
    if (jsonObject["area"] != null)
      for (var item in jsonObject["area"])
        result.area.add(item);
    if (jsonObject["colorValues"] != null)
      for (var item in jsonObject["colorValues"])
        result.colorValues.add(item);
    result.status = jsonObject["status"];
    result.elementType = jsonObject["elementType"];
    result.elementDiagnose = jsonObject["elementDiagnose"];
    result.elementTypeName = jsonObject["elementTypeName"];
    result.elementDiagnoseName = jsonObject["elementDiagnoseName"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (rectArray != null) result.addAll({"rectArray": rectArray});
    if (rectCount != null) result.addAll({"rectCount": rectCount});
    if (expectedCount != null) result.addAll({"expectedCount": expectedCount});
    if (width != null) result.addAll({"width": width});
    if (length != null) result.addAll({"length": length});
    if (area != null) result.addAll({"area": area});
    if (colorValues != null) result.addAll({"colorValues": colorValues});
    if (status != null) result.addAll({"status": status});
    if (elementType != null) result.addAll({"elementType": elementType});
    if (elementDiagnose != null) result.addAll({"elementDiagnose": elementDiagnose});
    if (elementTypeName != null) result.addAll({"elementTypeName": elementTypeName});
    if (elementDiagnoseName != null) result.addAll({"elementDiagnoseName": elementDiagnoseName});

    return result;
  }
}

class ImageInputData {
  int? pageIndex;
  int? light;
  int? type;
  int? width;
  int? height;
  String? bitmap;
  List<dynamic>? imgBytes;

  static ImageInputData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageInputData();

    result.pageIndex = jsonObject["pageIndex"];
    result.light = jsonObject["light"];
    result.type = jsonObject["type"];
    result.width = jsonObject["width"];
    result.height = jsonObject["height"];
    result.bitmap = jsonObject["bitmap"];
    result.imgBytes = jsonObject["imgBytes"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (pageIndex != null) result.addAll({"pageIndex": pageIndex});
    if (light != null) result.addAll({"light": light});
    if (type != null) result.addAll({"type": type});
    if (width != null) result.addAll({"width": width});
    if (height != null) result.addAll({"height": height});
    if (bitmap != null) result.addAll({"bitmap": bitmap});
    if (imgBytes != null) result.addAll({"imgBytes": imgBytes});

    return result;
  }
}

class DocumentReaderResults {
  int? chipPage;
  int? overallResult;
  int? processingFinishedStatus;
  int? elapsedTime;
  int? elapsedTimeRFID;
  int? morePagesAvailable;
  int? rfidResult;
  bool? highResolution;
  DocumentReaderGraphicResult? graphicResult;
  DocumentReaderTextResult? textResult;
  List<ElementPosition?> documentPosition = [];
  List<ElementPosition?> barcodePosition = [];
  List<ElementPosition?> mrzPosition = [];
  List<ImageQualityGroup?> imageQuality = [];
  String? rawResult;
  DocumentReaderNotification? documentReaderNotification;
  RFIDSessionData? rfidSessionData;
  DocumentReaderAuthenticityResult? authenticityResult;
  DocumentReaderBarcodeResult? barcodeResult;
  List<DocumentReaderDocumentType?> documentType = [];
  DocumentReaderResultsStatus? status;
  VDSNCData? vdsncData;

  String? getTextFieldValueByType(int fieldType, { int lcid = 0, int source = -1, bool original = false }) {
    if (this.textResult == null) return null;
    var field = this.findByTypeAndLcid(fieldType, lcid);
    if (field == null) return null;
    var value = this.findBySource(field, source);
    if (value == null) return null;
    return original ? value.originalValue : value.value;
  }

  int? getTextFieldStatusByType(int fieldType, {int lcid = 0}) {
    if (this.textResult == null) return 0;
    var field = this.findByTypeAndLcid(fieldType, lcid);
    return field != null ? field.status : 0;
  }

  String? getGraphicFieldImageByType(int fieldType, { int source = -1, int pageIndex = -1, int light = -1 }) {
    if (this.graphicResult == null) return null;
    List<DocumentReaderGraphicField> foundFields = [];

    for (var field in this.graphicResult!.fields)
      if (field != null && field.fieldType == fieldType)
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

  int? getQualityResult(int imageQualityCheckType, { int securityFeature = -1, int pageIndex = 0 }) {
    int? resultSum = 2;
    ImageQualityGroup? imageQualityGroup;

    for(ImageQualityGroup? iq in this.imageQuality)
      if (iq != null && iq.pageIndex == pageIndex)
        imageQualityGroup = iq;
    if (imageQualityGroup == null)
      return resultSum;

    for (ImageQuality? iq in imageQualityGroup.imageQualityList) {
      if (iq != null && iq.type == imageQualityCheckType) {
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

  DocumentReaderTextField? findByTypeAndLcid(int type, int lcid) {
    List<DocumentReaderTextField> foundFields = [];
    for (DocumentReaderTextField? field in this.textResult!.fields)
      if (field != null && field.fieldType == type)
        foundFields.add(field);
    if (foundFields.length <= 0)
      return null;
    DocumentReaderTextField? foundField;

    for (DocumentReaderTextField field in foundFields)
      if (lcid == 0) {
        foundField = field;
        if (field.lcid == lcid)
          break;
      } else if (field.lcid == lcid) return field;

    return foundField;
  }

  DocumentReaderValue? findBySource(DocumentReaderTextField field, int sourceType) {
    DocumentReaderValue? value;
    if (sourceType == -1) {
      DocumentReaderValue? mrzVal = this.findBySource(field, 3);
      if (mrzVal != null) return mrzVal;
      value = findBySource(field, 18);
      if (value != null) return value;
      var visualVal = this.findBySource(field, 17);
      return visualVal != null ? visualVal : null;
    } else
      for (DocumentReaderValue? item in field.values)
        if (item != null && item.sourceType == sourceType) return item;

    return null;
  }

  static DocumentReaderResults? fromJson(jsonObject) {
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
    if (jsonObject["documentPosition"] != null)
      for (var item in jsonObject["documentPosition"])
        result.documentPosition.add(ElementPosition.fromJson(item));
    if (jsonObject["barcodePosition"] != null)
      for (var item in jsonObject["barcodePosition"])
        result.barcodePosition.add(ElementPosition.fromJson(item));
    if (jsonObject["mrzPosition"] != null)
      for (var item in jsonObject["mrzPosition"])
        result.mrzPosition.add(ElementPosition.fromJson(item));
    if (jsonObject["imageQuality"] != null)
      for (var item in jsonObject["imageQuality"])
        result.imageQuality.add(ImageQualityGroup.fromJson(item));
    result.rawResult = jsonObject["rawResult"];
    result.documentReaderNotification = DocumentReaderNotification.fromJson(jsonObject["documentReaderNotification"]);
    result.rfidSessionData = RFIDSessionData.fromJson(jsonObject["rfidSessionData"]);
    result.authenticityResult = DocumentReaderAuthenticityResult.fromJson(jsonObject["authenticityResult"]);
    result.barcodeResult = DocumentReaderBarcodeResult.fromJson(jsonObject["barcodeResult"]);
    if (jsonObject["documentType"] != null)
      for (var item in jsonObject["documentType"])
        result.documentType.add(DocumentReaderDocumentType.fromJson(item));
    result.status = DocumentReaderResultsStatus.fromJson(jsonObject["status"]);
    result.vdsncData = VDSNCData.fromJson(jsonObject["vdsncData"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (chipPage != null) result.addAll({"chipPage": chipPage});
    if (overallResult != null) result.addAll({"overallResult": overallResult});
    if (processingFinishedStatus != null) result.addAll({"processingFinishedStatus": processingFinishedStatus});
    if (elapsedTime != null) result.addAll({"elapsedTime": elapsedTime});
    if (elapsedTimeRFID != null) result.addAll({"elapsedTimeRFID": elapsedTimeRFID});
    if (morePagesAvailable != null) result.addAll({"morePagesAvailable": morePagesAvailable});
    if (rfidResult != null) result.addAll({"rfidResult": rfidResult});
    if (highResolution != null) result.addAll({"highResolution": highResolution});
    if (graphicResult != null) result.addAll({"graphicResult": graphicResult});
    if (textResult != null) result.addAll({"textResult": textResult});
    if (documentPosition != null) result.addAll({"documentPosition": documentPosition});
    if (barcodePosition != null) result.addAll({"barcodePosition": barcodePosition});
    if (mrzPosition != null) result.addAll({"mrzPosition": mrzPosition});
    if (imageQuality != null) result.addAll({"imageQuality": imageQuality});
    if (rawResult != null) result.addAll({"rawResult": rawResult});
    if (documentReaderNotification != null) result.addAll({"documentReaderNotification": documentReaderNotification});
    if (rfidSessionData != null) result.addAll({"rfidSessionData": rfidSessionData});
    if (authenticityResult != null) result.addAll({"authenticityResult": authenticityResult});
    if (barcodeResult != null) result.addAll({"barcodeResult": barcodeResult});
    if (documentType != null) result.addAll({"documentType": documentType});
    if (status != null) result.addAll({"status": status});
    if (vdsncData != null) result.addAll({"vdsncData": vdsncData});

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
  static const int dtSeamanIdentityDocument = 15;
  static const int dtIdentityCardForResidence = 16;
  static const int dtTravelDocument = 17;
  static const int dtOther = 99;
  static const int dtVisaID2 = 29;
  static const int dtVisaID3 = 30;
  static const int dtRegistrationCertificate = 206;
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
  static const int dtCommercialDrivingLicenseInstructionalPermit = 39;
  static const int dtCommercialDrivingLicenseUnder18 = 40;
  static const int dtCommercialDrivingLicenseUnder21 = 41;
  static const int dtCommercialInstructionPermit = 42;
  static const int dtCommercialNewPermit = 43;
  static const int dtConcealedCarryLicense = 44;
  static const int dtConcealedFirearmPermit = 45;
  static const int dtConditionalDrivingLicense = 46;
  static const int dtDepartmentOfVeteransAffairsIdentityCard = 47;
  static const int dtDiplomaticDrivingLicense = 48;
  static const int dtDrivingLicense = 49;
  static const int dtDrivingLicenseInstructionalPermit = 50;
  static const int dtDrivingLicenseInstructionalPermitUnder18 = 51;
  static const int dtDrivingLicenseInstructionalPermitUnder21 = 52;
  static const int dtDrivingLicenseLearnersPermit = 53;
  static const int dtDrivingLicenseLearnersPermitUnder18 = 54;
  static const int dtDrivingLicenseLearnersPermitUnder21 = 55;
  static const int dtDrivingLicenseNovice = 56;
  static const int dtDrivingLicenseNoviceUnder18 = 57;
  static const int dtDrivingLicenseNoviceUnder21 = 58;
  static const int dtDrivingLicenseRegisteredOffender = 59;
  static const int dtDrivingLicenseRestrictedUnder18 = 60;
  static const int dtDrivingLicenseRestrictedUnder21 = 61;
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
  static const int dtGraduatedInstructionPermitUnder18 = 86;
  static const int dtGraduatedInstructionPermitUnder21 = 87;
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
  static const int dtInstructionPermit = 102;
  static const int dtInstructionPermitUnder18 = 103;
  static const int dtInstructionPermitUnder21 = 104;
  static const int dtInterimDrivingLicense = 105;
  static const int dtInterimIdentityCard = 106;
  static const int dtIntermediateDrivingLicense = 107;
  static const int dtIntermediateDrivingLicenseUnder18 = 108;
  static const int dtIntermediateDrivingLicenseUnder21 = 109;
  static const int dtJuniorDrivingLicense = 110;
  static const int dtLearnerInstructionalPermit = 111;
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
  static const int dtRestrictedCommercialDrivingLicense = 148;
  static const int dtRestrictedDrivingLicense = 149;
  static const int dtRestrictedPermit = 150;
  static const int dtSeasonalPermit = 151;
  static const int dtSeasonalResidentIdentityCard = 152;
  static const int dtSeniorCitizenIdentityCard = 153;
  static const int dtSexOffender = 154;
  static const int dtSocialSecurityCard = 155;
  static const int dtTemporaryDrivingLicense = 156;
  static const int dtTemporaryDrivingLicenseUnder18 = 157;
  static const int dtTemporaryDrivingLicenseUnder21 = 158;
  static const int dtTemporaryIdentityCard = 159;
  static const int dtTemporaryInstructionPermitIdentityCard = 160;
  static const int dtTemporaryInstructionPermitIdentityCardUnder18 = 161;
  static const int dtTemporaryInstructionPermitIdentityCardUnder21 = 162;
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
  static const int dtAlienRegistrationCard = 185;
  static const int dtAPEHCard = 186;
  static const int dtCouponToDrivingLicense = 187;
  static const int dtCrewMemberCertificate = 188;
  static const int dtDocumentForReturn = 189;
  static const int dtECard = 190;
  static const int dtEmploymentCard = 191;
  static const int dtHKSARImmigrationForm = 192;
  static const int dtImmigrantCard = 193;
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
  static const int dtPermissionToTheLocalBorderTraffic = 205;
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
  static const int dtTradeLicense = 239;
  static const int dtPassportPage = 240;
  static const int dtInvoice = 241;
  static const int dtPassengerLocatorForm = 242;
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
  static const int PROCESS_WHITE_FLASHLIGHT = 7;
  static const int MORE_PAGES_AVAILABLE = 8;
  static const int PROCESS_IR_FRAME = 9;
  static const int TIMEOUT = 10;
}

class DocReaderFrame {
  static const String MAX = "max";
  static const String SCENARIO_DEFAULT = "id1";
  static const String NONE = "none";
  static const String DOCUMENT = "document";
}

class DocReaderOrientation {
  static const int ALL = 0;
  static const int PORTRAIT = 1;
  static const int LANDSCAPE = 2;
  static const int LANDSCAPE_LEFT = 3;
  static const int LANDSCAPE_RIGHT = 4;
}

class DocumentReaderExceptionEnum {
  static const int NATIVE_JAVA_EXCEPTION = 0;
  static const int DOCUMENT_READER_STATE_EXCEPTION = 1;
  static const int DOCUMENT_READER_WRONG_INPUT = 2;
  static const int INITIALIZATION_FAILED = 3;
  static const int DOCUMENT_READER_BLE_EXCEPTION = 201;
  static const int DB_DOWNLOAD_ERROR = 301;
  static const int LICENSE_ABSENT_OR_CORRUPTED = 101;
  static const int LICENSE_INVALID_DATE = 102;
  static const int LICENSE_INVALID_VERSION = 103;
  static const int LICENSE_INVALID_DEVICE_ID = 104;
  static const int LICENSE_INVALID_SYSTEM_OR_APP_ID = 105;
  static const int LICENSE_NO_CAPABILITIES = 106;
  static const int LICENSE_NO_AUTHENTICITY = 107;
  static const int LICENSE_NO_DATABASE = 110;
  static const int LICENSE_DATABASE_INCORRECT = 111;
  static const int FEATURE_BLUETOOTH_LE_NOT_SUPPORTED = 701;
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
  static const int PHOTO_WHITE_IR_DONT_MATCH = 44;
  static const int UV_DULL_PAPER_MRZ = 50;
  static const int FALSE_LUMINISCENCE_IN_MRZ = 51;
  static const int UV_DULL_PAPER_PHOTO = 52;
  static const int UV_DULL_PAPER_BLANK = 53;
  static const int UV_DULL_PAPER_ERROR = 54;
  static const int FALSE_LUMINISCENCE_IN_BLANK = 55;
  static const int BAD_AREA_IN_AXIAL = 60;
  static const int FALSE_IPI_PARAMETERS = 65;
  static const int FIELD_POS_CORRECTOR_HIGHLIGHT_IR = 80;
  static const int FIELD_POS_CORRECTOR_GLARES_IN_PHOTO_AREA = 81;
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
  static const int HOLOGRAM_FRAMES_IS_ABSENT = 103;
  static const int HOLOGRAM_HOLO_FIELD_IS_ABSENT = 104;
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
  static const int PORTRAIT_COMPARISON_NOT_ENOUGH_IMAGES = 153;
  static const int PORTRAIT_COMPARISON_NO_LIVE_PHOTO = 154;
  static const int PORTRAIT_COMPARISON_NO_SERVICE_LICENSE = 155;
  static const int PORTRAIT_COMPARISON_NO_PORTRAIT_DETECTED = 156;
  static const int MOBILE_IMAGES_UNSUITABLE_LIGHT_CONDITIONS = 160;
  static const int MOBILE_IMAGES_WHITE_UV_NO_DIFFERENCE = 161;
  static const int FINGERPRINTS_COMPARISON_MISMATCH = 170;
  static const int HOLO_PHOTO_FACE_NOT_DETECTED = 180;
  static const int HOLO_PHOTO_FACE_COMPARISON_FAILED = 181;
  static const int HOLO_PHOTO_FACE_GLARE_IN_CENTER_ABSENT = 182;
  static const int HOLO_ELEMENT_SHAPE_ERROR = 183;
  static const int ALGORITHM_STEPS_ERROR = 184;
  static const int HOLO_AREAS_NOT_LOADED = 185;
  static const int FINISHED_BY_TIMEOUT = 186;
  static const int LAST_DIAGNOSE_VALUE = 190;
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
  static const int IQC_IMAGE_COLORNESS = 3;
  static const int IQC_PERSPECTIVE = 4;
  static const int IQC_BOUNDS = 5;
  static const int IQC_SCREEN_CAPTURE = 6;
  static const int IQC_PORTRAIT = 7;
  static const int IQC_HANDWRITTEN = 8;
}

class eLDS_ParsingErrorCodes {
  static const int ERR_LDS_OK = 1;
  static const int ERR_LDS_ASN_INCORRECT_DATA = -2147483647;
  static const int RR_LDS_ASN_NOT_ENOUGH_DATA = -2147483646;
  static const int ERR_LDS_ASN_CONTENTS_UNEXPECTED_DATA = -2147483645;
  static const int ERR_LDS_ASN_SIGNED_DATA_INCORRECT_DATA = -2147483640;
  static const int ERR_LDS_ASN_SIGNED_DATA_ENCAP_CONTENTS_INCORRECT_DATA = -2147483639;
  static const int ERR_LDS_ASN_SIGNED_DATA_VERSION_INCORRECT_DATA = -2147483638;
  static const int ERR_LDS_ASN_SIGNED_DATA_DIGEST_ALGORITHMS_INCORRECT_DATA = -2147483631;
  static const int ERR_LDS_ASN_LDS_OBJECT_INCORRECT_DATA = -2147483629;
  static const int ERR_LDS_ASN_LDS_OBJECT_VERSION_INCORRECT_DATA = -2147483628;
  static const int ERR_LDS_ASN_LDS_OBJECT_DIGEST_ALGORITHM_INCORRECT_DATA = -2147483627;
  static const int ERR_LDS_ASN_LDS_OBJECT_DG_HASHES_INCORRECT_DATA = -2147483626;
  static const int ERR_LDS_ASN_LDS_OBJECT_VERSION_INFO_INCORRECT_DATA = -2147483630;
  static const int ERR_LDS_ASN_CERTIFICATE_INCORRECT_DATA = -2147483625;
  static const int ERR_LDS_ASN_CERTIFICATE_VERSION_INCORRECT_DATA = -2147483624;
  static const int ERR_LDS_ASN_CERTIFICATE_SN_INCORRECT_DATA = -2147483623;
  static const int ERR_LDS_ASN_CERTIFICATE_SIGNATURE_INCORRECT_DATA = -2147483622;
  static const int ERR_LDS_ASN_CERTIFICATE_ISSUER_INCORRECT_DATA = -2147483621;
  static const int ERR_LDS_ASN_CERTIFICATE_VALIDITY_INCORRECT_DATA = -2147483620;
  static const int ERR_LDS_ASN_CERTIFICATE_SUBJECT_INCORRECT_DATA = -2147483619;
  static const int ERR_LDS_ASN_CERTIFICATE_SUBJECT_PK_INCORRECT_DATA = -2147483618;
  static const int ERR_LDS_ASN_CERTIFICATE_EXTENSIONS_INCORRECT_DATA = -2147483617;
  static const int ERR_LDS_ASN_SIGNER_INFO_INCORRECT_DATA = -2147483616;
  static const int ERR_LDS_ASN_SIGNER_INFO_VERSION_INCORRECT_DATA = -2147483615;
  static const int ERR_LDS_ASN_SIGNER_INFO_SID_INCORRECT_DATA = -2147483614;
  static const int ERR_LDS_ASN_SIGNER_INFO_DIGEST_ALG_INCORRECT_DATA = -2147483613;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGNED_ATTRS_INCORRECT_DATA = -2147483612;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGN_ALG_INCORRECT_DATA = -2147483611;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGNATURE_INCORRECT_DATA = -2147483610;
  static const int ERR_LDS_ASN_SIGNER_INFO_UNSIGNED_ATTRS_INCORRECT_DATA = -2147483609;
  static const int ERR_LDS_ICAO_LDS_OBJECT_UNSUPPORTED_DIGEST_ALGORITHM = -2147483600;
  static const int ERR_LDS_ICAO_SIGNED_DATA_SIGNER_INFOS_EMPTY = -2147483599;
  static const int ERR_LDS_ICAO_SIGNER_INFO_UNSUPPORTED_DIGEST_ALGORITHM = -2147483598;
  static const int ERR_LDS_ICAO_SIGNER_INFO_UNSUPPORTED_SIGNATURE_ALGORITHM = -2147483597;
  static const int ERR_LDS_ICAO_SIGNER_INFO_MESSAGE_DIGEST_ERROR = -2147483596;
  static const int ERR_LDS_ICAO_SIGNER_INFO_SIGNED_ATTRS_MISSED = -2147483594;
  static const int ERR_LDS_AUTH_SIGNER_INFO_CANT_FIND_CERTIFICATE = -2147483595;
  static const int ERR_LDS_AUTH_ERROR = -2147483568;
  static const int ERR_LDS_AUTH_UNSUPPORTED_SIGNATURE_ALGORITHM = -2147483567;
  static const int ERR_LDS_AUTH_UNSUPPORTED_PUBLIC_KEY_ALGORITHM = -2147483566;
  static const int ERR_LDS_AUTH_MESSED_ALGORITHMS = -2147483565;
  static const int ERR_LDS_AUTH_PUBLIC_KEY_DATA_INVALID = -2147483564;
  static const int ERR_LDS_AUTH_ALGORITHM_PARAMETERS_DATA_INVALID = -2147483563;
  static const int ERR_LDS_AUTH_SIGNATURE_DATA_INVALID = -2147483562;
  static const int ERR_LDS_AUTH_UNSUPPORTED_DIGEST_ALGORITHM = -2147483561;
  static const int ERR_LDS_AUTH_SIGNATURE_DATA_INCORRECT = -2147483560;
  static const int ERR_LDS_AUTH_ALGORITHM_PARAMETERS_NOT_DEFINED = -2147483559;
  static const int ERR_LDS_AUTH_SIGNATURE_CHECK_FAILED = -2147483558;
  static const int ERR_LDS_DG_WRONG_TAH = -2147483536;
  static const int ERR_LDS_DG_CONTENTS_UNEXPECTED_DATA = -2147483535;
  static const int ERR_LDS_BAP_SYMMETRIC_CYPHER_CANT_INITIALIZE = -2130706415;
  static const int ERR_LDS_PACE_INFO_NOT_AVAILABLE = -2130706400;
  static const int ERR_LDS_PACE_SYMMETRIC_CYPHER_CANT_INITIALIZE = -2130706399;
  static const int ERR_LDS_PACE_KEY_AGREEMENT_CANT_INITIALIZE = -2130706398;
  static const int ERR_LDS_PACE_EPHEMERAL_KEYS_CANT_CREATE = -2130706397;
  static const int ERR_LDS_PACE_MAPPING_CANT_DECODE_NONCE = -2130706396;
  static const int ERR_LDS_PACE_SHARED_SECRET_CANT_CREATE = -2130706395;
  static const int ERR_LDS_PACE_DOMAIN_PARAMS_UNSUPPORTED_FORMAT = -2130706394;
  static const int ERR_LDS_PACE_EPHEMERAL_KEYS_INCORRECT = -2130706393;
  static const int ERR_LDS_PACE_MAPPING_EPHEMERAL_KEYS_INCORRECT = -2130706392;
  static const int ERR_LDS_PACE_MAPPING_CANT_PERFORM = -2130706391;
  static const int ERR_LDS_PACE_NON_MATCHING_AUTH_TOKENS = -2130706390;
  static const int ERR_LDS_PACE_CAM_DATA_INCORRECT = -2130706389;
  static const int ERR_LDS_PACE_CAM_DATA_CANT_VERIFY = -2130706388;
  static const int ERR_LDS_PACE_CAM_DATA_NON_MATCHING = -2130706387;
  static const int ERR_LDS_PACE_IM_SCHEME_INCORRECT = -2130706386;
  static const int ERR_LDS_PACE_IM_RANDOM_MAPPING_FAILED = -2130706385;
  static const int ERR_LDS_CA_CANT_FIND_PUBLIC_KEY = -2130706384;
  static const int ERR_LDS_CA_CANT_FIND_INFO = -2130706383;
  static const int ERR_LDS_CA_INCORRECT_VERSION = -2130706382;
  static const int ERR_LDS_CA_CANT_FIND_DOMAIN_PARAMETERS = -2130706381;
  static const int ERR_LDS_CA_KEY_AGREEMENT_CANT_INITIALIZE = -2130706380;
  static const int ERR_LDS_CA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = -2130706379;
  static const int ERR_LDS_CA_EPHEMERAL_KEYS_CANT_CREATE = -2130706378;
  static const int ERR_LDS_CA_SHARED_SECRET_CANT_CREATE = -2130706377;
  static const int ERR_LDS_CA_NON_MATCHING_AUTH_TOKENS = -2130706376;
  static const int ERR_LDS_TA_INCORRECT_VERSION = -2130706368;
  static const int ERR_LDS_TA_CANT_BUILD_CERTIFICATE_CHAIN = -2130706367;
  static const int ERR_LDS_TA_CANT_FIND_IS_PRIVATE_KEY = -2130706366;
  static const int ERR_LDS_TA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = -2130706365;
  static const int ERR_LDS_TA_SIGNATURE_BUILDING_ERROR = -2130706364;
  static const int ERR_LDS_TA_INVALID_KEY_ALGORITHM_PARAMETERS = -2130706363;
  static const int ERR_LDS_AA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = -2130706352;
  static const int ERR_LDS_AA_PUBLIC_KEY_INCORRECT_DATA = -2130706351;
  static const int ERR_LDS_AA_PUBLIC_KEY_INCORRECT_PARAMETERS = -2130706350;
  static const int ERR_LDS_AA_PUBLIC_KEY_UNDEFINED_PARAMETERS = -2130706349;
  static const int ERR_LDS_AA_SIGNATURE_INCORRECT_DATA = -2130706348;
  static const int ERR_LDS_AA_UNSUPPORTED_RECOVERY_SCHEME = -2130706347;
  static const int ERR_LDS_AA_INCORRECT_TRAILER = -2130706346;
  static const int ERR_LDS_AA_UNSUPPORTED_DIGEST_ALGORITHM = -2130706345;
  static const int ERR_LDS_RI_SECTOR_KEY_CANT_FIND = -2130706320;
  static const int ERR_LDS_RI_SECTOR_KEY_INCORRECT_DATA = -2130706319;
  static const int ERR_LDS_RI_SECTOR_KEY_INCOMPLETE_DATA = -2130706318;
  static const int ERR_LDS_CV_CERTIFICATE_MISSING_MANDATORY_DATA_PK = -2130706336;
  static const int ERR_LDS_CV_CERTIFICATE_PUBLIC_KEY_UNSUPPORTED = -2130706334;
  static const int ERR_LDS_CV_CERTIFICATE_CHAT_UNSUPPORTED_TERMINAL_TYPE = -2130706333;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_UNSUPPORTED = 135266310;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_INVALID_PARAMS = -2130706331;
  static const int ERR_LDS_CV_CERTIFICATE_INCORRECT_DATA = -2130706080;
  static const int ERR_LDS_CV_CERTIFICATE_CPI_INCORRECT_DATA = -2130706079;
  static const int ERR_LDS_CV_CERTIFICATE_CAR_INCORRECT_DATA = -2130706078;
  static const int ERR_LDS_CV_CERTIFICATE_PUBLIC_KEY_INCORRECT_DATA = -2130706077;
  static const int ERR_LDS_CV_CERTIFICATE_CHR_INCORRECT_DATA = -2130706076;
  static const int ERR_LDS_CV_CERTIFICATE_CHAT_INCORRECT_DATA = -2130706075;
  static const int ERR_LDS_CV_CERTIFICATE_VALID_FROM_INCORRECT_DATA = -2130706074;
  static const int ERR_LDS_CV_CERTIFICATE_VALID_TO_INCORRECT_DATA = -2130706073;
  static const int ERR_LDS_CV_CERTIFICATE_EXTENSIONS_INCORRECT_DATA = -2130706072;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_INCORRECT_DATA = -2130706071;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_MISSING = -2130706070;
  static const int ERR_LDS_VDS_UNSUPPORTED_VERSION = -2130705920;
  static const int ERR_LDS_VDS_ISSUING_COUNTRY_SIZE = -2130705919;
  static const int ERR_LDS_VDS_ISSUING_COUNTRY_INCORRECT_DATA = -2130705918;
  static const int ERR_LDS_VDS_SIGNER_CERTIFICATE_SIZE = -2130705917;
  static const int ERR_LDS_VDS_SIGNER_CERTIFICATE_DATA = -2130705916;
  static const int ERR_LDS_VDS_SIGNATURE_INCORRECT_DATA = -2130705915;
  static const int ERR_LDS_VDS_NC_INCORRECT_DATA = -2130705664;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_DATA = -2130705663;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_HEADER = -2130705662;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_TYPE = -2130705661;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_VERSION = -2130705660;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_ISSUING_COUNTRY = -2130705659;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_MESSAGE = -2130705658;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIGNATURE = -2130705657;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIG_ALGORITHM = -2130705656;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_CERTIFICATE = -2130705655;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIG_VALUE = -2130705654;

  static String getTranslation(int value) {
    switch (value) {
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
      case -2147483630:
        return "Error - ASN LDS object: Version info incorrect data";
      case -2147483629:
        return "Error - ASN LDS object: Incorrect data";
      case -2147483628:
        return "Error - ASN LDS object: Version incorrect data";
      case -2147483627:
        return "Error - ASN LDS object: Digest algorithm incorrect data";
      case -2147483626:
        return "Error - ASN LDS object: DG hashes incorrect data";
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
        return "Error - ICAO Signed data: Signer info empty";
      case -2147483598:
        return "Error - ICAO Signer info: Unsupported digest algorithm";
      case -2147483597:
        return "Error - ICAO Signer info: Unsupported signature algorithm";
      case -2147483596:
        return "Error - ICAO Signer info: Message digest error";
      case -2147483595:
        return "Error - Auth: Signer info cannot find certificate";
      case -2147483594:
        return "Error - ICAO Signer info: Signed attributes missed";
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
      case -2147483535:
        return "Error - DG: Contents unexpected data";
      case -2130706415:
        return "Error - BAP: Symmetric Cypher Cannot Initialize";
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
        return "Error - PACE: Non-Matching Auth Tokens";
      case -2130706389:
        return "Error - PACE: CAM data incorrect";
      case -2130706388:
        return "Error - PACE: CAM data cannot verify";
      case -2130706387:
        return "Error - PACE: CAM data non-matching";
      case -2130706386:
        return "Error - PACE: IM scheme incorrect";
      case -2130706385:
        return "Error - PACE: Random mapping failed";
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
        return "Error - CA: Non-Matching Auth Tokens";
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
      case -2130706336:
        return "Error - CV Certificate: Missing mandatory data PK";
      case -2130706334:
        return "Error - CV Certificate: Public key unsupported";
      case -2130706333:
        return "Error - CV Certificate: CHAT unsupported terminal type";
      case -2130706331:
        return "Error - CV Certificate: Private key invalid params";
      case -2130706320:
        return "Error - RI: Sector Key Cannot Find";
      case -2130706319:
        return "Error - RI: Sector Key Incorrect Data";
      case -2130706318:
        return "Error - RI: Sector Key Incomplete Data";
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
      case -2130705920:
        return "Error - VDS: Unsupported version";
      case -2130705919:
        return "Error - VDS: Issuing country size";
      case -2130705918:
        return "Error - VDS: Issuing country incorrect data";
      case -2130705917:
        return "Error - VDS: Signature certificate size";
      case -2130705916:
        return "Error - VDS: Signature certificate data";
      case -2130705915:
        return "Error - VDS: Signature incorrect data";
      case -2130705664:
        return "Error - VDS: Incorrect data";
      case -2130705663:
        return "Error - VDS: Missing or incorrect data";
      case -2130705662:
        return "Error - VDS: Missing or incorrect header";
      case -2130705661:
        return "Error - VDS: Missing or incorrect type";
      case -2130705660:
        return "Error - VDS: Missing or incorrect version";
      case -2130705659:
        return "Error - VDS: Missing or incorrect issuing country";
      case -2130705658:
        return "Error - VDS: Missing or incorrect message";
      case -2130705657:
        return "Error - VDS: Missing or incorrect signature";
      case -2130705656:
        return "Error - VDS: Missing or incorrect signature algorithm";
      case -2130705655:
        return "Error - VDS: Missing or incorrect certificate";
      case -2130705654:
        return "Error - VDS: Missing or incorrect signature value";
      case 1:
        return "OK";
      case 135266310:
        return "Error - CV Certificate: Private key unsupported";
      case 2147483599:
        return "Error - ICAO Signed data: Signer info empty";
      default:
        return value.toString();
    }
  }
}

class eLDS_ParsingNotificationCodes {
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_VERSION = -1879048191;
  static const int NTF_LDS_ASN_CERTIFICATE_NON_MATCHING_SIGNATURE_ALGORITHM = -1879048190;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_TIME_CODING = -1879048189;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_USE_OF_GENERALIZED_TIME = -1879048188;
  static const int NTF_LDS_ASN_CERTIFICATE_EMPTY_ISSUER = -1879048187;
  static const int NTF_LDS_ASN_CERTIFICATE_EMPTY_SUBJECT = -1879048186;
  static const int NTF_LDS_ASN_CERTIFICATE_UNSUPPORTED_CRITICAL_EXTENSION = -1879048184;
  static const int NTF_LDS_ASN_CERTIFICATE_FORCED_DEFAULT_CSCA_ROLE = -1879048178;
  static const int NTF_LDS_ASN_CERTIFICATE_FORCED_DEFAULT_DS_ROLE = -1879048177;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_ISSUER_SUBJECT_DS = -1879048176;
  static const int NTF_LDS_ASN_CERTIFICATE_DUPLICATING_EXTENSIONS = -1879048169;
  static const int NTF_LDS_ICAO_CERTIFICATE_VERSION_MISSED = -1879047680;
  static const int NTF_LDS_ICAO_CERTIFICATE_VERSION_INCORRECT = -1879047679;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COUNTRY_MISSED = -1879047678;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COMMON_NAME_MISSED = -1879047677;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COUNTRY_NON_COMPLIANT = -1879047676;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COUNTRY_MISSED = -1879047675;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COMMON_NAME_MISSED = -1879047674;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COUNTRY_NON_COMPLIANT = -1879047673;
  static const int NTF_LDS_ICAO_CERTIFICATE_USING_NON_COMPLIANT_DATA = -1879047672;
  static const int NTF_LDS_ICAO_CERTIFICATE_UNSUPPORTED_SIGNATURE_ALGORITHM = -1879047671;
  static const int NTF_LDS_ICAO_CERTIFICATE_UNSUPPORTED_PUBLIC_KEY_ALGORITHM = -1879047670;
  static const int NTF_LDS_ICAO_CERTIFICATE_MISSED_EXTENSIONS = -1879047669;
  static const int NTF_LDS_ICAO_CERTIFICATE_VALIDITY = -1879047668;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_USING_NON_COMPLIANT_DATA = -1879047667;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_MISSED = -1879047666;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_NOT_CRITICAL = -1879047665;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_INCORRECT_DATA = -1879047664;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_MISSED = -1879047663;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_USAGE1 = -1879047662;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_USAGE2 = -1879047661;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_NOT_CRITICAL = -1879047660;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_DATA = -1879047659;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_PATH_LEN_C_MISSED = -1879047658;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_PATH_LEN_C_INCORRECT = -1879047657;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_NOT_CRITICAL = -1879047656;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_INCORRECT_USAGE = -1879047655;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_INCORRECT_DATA = -1879047654;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_MISSED = -1879047653;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_INCORRECT_DATA = -1879047652;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_KEY_ID_MISSED = -1879047651;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_KEY_ID_MISSED = -1879047650;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_KEY_ID_INCORRECT_DATA = -1879047649;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_MISSED = -1879047648;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_INCORRECT_DATA = -1879047647;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_EMPTY = -1879047646;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_MISSED = -1879047645;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_INCORRECT_DATA = -1879047644;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_EMPTY = -1879047643;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_NON_COMPLIANT = -1879047642;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_CRITICAL = -1879047640;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_EMPTY = -1879047639;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_INCORRECT = -1879047638;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_NON_COMPLIANT = -1879047637;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_MISSED = -1879047636;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_INCORRECT_DATA = -1879047635;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_EMPTY = -1879047634;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_NON_COMPLIANT = -1879047633;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_CRITICAL = -1879047631;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_EMPTY = -1879047630;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_INCORRECT = -1879047629;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_NON_COMPLIANT = -1879047628;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_MISSED = -1879047627;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_INCORRECT_DATA = -1879047626;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_VERSION = -1879047625;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_DOC_TYPES = -1879047624;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_DOC_TYPES_EMPTY = -1879047623;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_INCORRECT_DATA = -1879047622;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_EMPTY = -1879047621;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_POLICY_ID_MISSED = -1879047620;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_MISSED = -1879047619;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_INCORRECT_DATA = -1879047618;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_EMPTY = -1879047617;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_POINT_MISSED = -1879047616;
  static const int NTF_LDS_ICAO_CERTIFICATE_SN_NON_COMPLIANT = -1879047615;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_SN_NON_COMPLIANT = -1879047614;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_SN_NON_COMPLIANT = -1879047613;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_ATTRIBUTE_NON_COMPLIANT = -1879047612;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_ATTRIBUTE_NON_COMPLIANT = -1879047611;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_SUBJECT_COUNTRY_NON_MATCHING = -1879047610;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CSCA_ALT_NAMES_NON_MATCHING = -1879047609;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_INCORRECT_DATA = -1879047608;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_NON_COMPLIANT = -1879047607;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_CRITICAL = -1879047606;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_NON_COMPLIANT = -1879047605;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_CRITICAL = -1879047604;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_OPTIONAL_CRITICAL = -1879047603;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_NON_COMPLIANT = -1879047602;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COMMON_NAME_NON_COMPLIANT = -1879047601;
  static const int NTF_LDS_ICAO_COM_LDS_VERSION_INCORRECT = -1879048160;
  static const int NTF_LDS_ICAO_COM_LDS_VERSION_MISSING = -1879048159;
  static const int NTF_LDS_ICAO_COM_UNICODE_VERSION_INCORRECT = -1879048158;
  static const int NTF_LDS_ICAO_COM_UNICODE_VERSION_MISSING = -1879048157;
  static const int NTF_LDS_ICAO_COM_DGPM_INCORRECT = -1879048156;
  static const int NTF_LDS_ICAO_COM_DGPM_MISSING = -1879048155;
  static const int NTF_LDS_ICAO_COM_DGPM_UNEXPECTED = -1879048154;
  static const int NTF_LDS_ICAO_APPLICATION_LDS_VERSION_UNSUPPORTED = -1879048144;
  static const int NTF_LDS_ICAO_APPLICATION_UNICODE_VERSION_UNSUPPORTED = -1879048143;
  static const int NTF_LDS_ICAO_APPLICATION_LDS_VERSION_INCONSISTENT = -1879048142;
  static const int NTF_LDS_ICAO_APPLICATION_UNICODE_VERSION_INCONSISTENT = -1879048141;
  static const int NTF_LDS_ASN_SIGNED_DATA_OID_INCORRECT = -1879047936;
  static const int NTF_LDS_ASN_SIGNED_DATA_VERSION_INCORRECT = -1879047776;
  static const int NTF_LDS_ASN_SIGNED_DATA_CONTENT_OID_INCORRECT = -1879047775;
  static const int NTF_LDS_ICAO_SIGNED_DATA_VERSION_INCORRECT = -1879047935;
  static const int NTF_LDS_ICAO_SIGNED_DATA_DIGEST_ALGORITHMS_EMPTY = -1879047934;
  static const int NTF_LDS_ICAO_SIGNED_DATA_DIGEST_ALGORITHMS_UNSUPPORTED = -1879047933;
  static const int NTF_LDS_ICAO_SIGNED_DATA_SIGNER_INFOS_MULTIPLE_ENTRIES = -1879047927;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CERTIFICATES_MISSED = -1879047760;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CERTIFICATES_EMPTY = -1879047759;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CRLS_INCORRECT_USAGE = -1879047758;
  static const int NTF_LDS_ICAO_LDS_OBJECT_INCORRECT_CONTENT_OID = -1879047932;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_NUMBER_INCORRECT = -1879047931;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_HASH_MISSING = -1879047930;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_HASH_EXTRA = -1879047929;
  static const int NTF_LDS_ICAO_LDS_OBJECT_VERSION_INCORRECT = -1879047928;
  static const int NTF_LDS_ICAO_MASTER_LIST_VERSION_INCORRECT = -1879047744;
  static const int NTF_LDS_ICAO_DEVIATION_LIST_VERSION_INCORRECT = -1879047736;
  static const int NTF_LDS_BSI_DEFECT_LIST_VERSION_INCORRECT = -1879047728;
  static const int NTF_LDS_BSI_BLACK_LIST_VERSION_INCORRECT = -1879047720;
  static const int NTF_LDS_ASN_SIGNER_INFO_VERSION_INCORRECT = -1879047926;
  static const int NTF_LDS_ASN_SIGNER_INFO_SID_INCORRECT_CHOICE = -1879047925;
  static const int NTF_LDS_ASN_SIGNER_INFO_SID_DIGEST_ALGORITHM_NOT_LISTED = -1879047924;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_MISSING = -1879047923;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_DATA = -1879047922;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_Value = -1879047921;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_MISSING = -1879047920;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_DATA = -1879047919;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_VALUE = -1879047918;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_MISSING = -1879047909;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_DATA = -1879047908;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_VALUE = -1879047907;
  static const int NTF_LDS_ASN_SIGNER_INFO_LIST_CONTENT_DESCRIPTION_ATTR_MISSING = -1879047906;
  static const int NTF_LDS_ASN_SIGNER_INFO_LIST_CONTENT_DESCRIPTION_ATTR_DATA = -1879047905;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_VALIDITY = -1879047915;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_ROOT_IS_NOT_TRUSTED = -1879047914;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_CANT_FIND_CSCA = -1879047913;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_REVOKED = -1879047912;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_SIGNATURE_INVALID = -1879047911;
  static const int NTF_LDS_UNSUPPORTED_IMAGE_FORMAT = -1879047910;
  static const int NTF_LDS_MRZ_DOCUMENT_TYPE_UNKNOWN = 139272;
  static const int NTF_LDS_MRZ_ISSUING_STATE_SYNTAX_ERROR = 139273;
  static const int NTF_LDS_MRZ_NAME_IS_VOID = 139274;
  static const int NTF_LDS_MRZ_NUMBER_INCORRECT_CHECKSUM = 139277;
  static const int NTF_LDS_MRZ_NATIONALITY_SYNTAX_ERROR = 139278;
  static const int NTF_LDS_MRZ_DOB_SYNTAX_ERROR = 139279;
  static const int NTF_LDS_MRZ_DOB_ERROR = 139280;
  static const int NTF_LDS_MRZ_DOB_INCORRECT_CHECKSUM = 139281;
  static const int NTF_LDS_MRZ_SEX_INCORRECT = 139282;
  static const int NTF_LDS_MRZ_DOE_SYNTAX_ERROR = 139283;
  static const int NTF_LDS_MRZ_DOE_ERROR = 139284;
  static const int NTF_LDS_MRZ_DOE_INCORRECT_CHECKSUM = 139285;
  static const int NTF_LDS_MRZ_OPTIONAL_DATA_INCORRECT_CHECKSUM = 139286;
  static const int NTF_LDS_MRZ_INCORRECT_CHECKSUM = 139287;
  static const int NTF_LDS_MRZ_INCORRECT = 139288;
  static const int NTF_LDS_BIOMETRICS_FORMAT_OWNER_MISSING = -1878982656;
  static const int NTF_LDS_BIOMETRICS_FORMAT_OWNER_INCORRECT = -1878917120;
  static const int NTF_LDS_BIOMETRICS_FORMAT_TYPE_MISSING = -1878851584;
  static const int NTF_LDS_BIOMETRICS_FORMAT_TYPE_INCORRECT = -1878786048;
  static const int NTF_LDS_BIOMETRICS_TYPE_INCORRECT = -1878720512;
  static const int NTF_LDS_BIOMETRICS_SUB_TYPE_MISSING = -1878654976;
  static const int NTF_LDS_BIOMETRICS_SUB_TYPE_INCORRECT = -1878589440;
  static const int NTF_LDS_BIOMETRICS_BDB_IMAGE_MISSING = -1878523904;
  static const int NTF_LDS_BIOMETRICS_BDB_FORMAT_ID_INCORRECT = -1878458368;
  static const int NTF_LDS_BIOMETRICS_BDB_VERSION_INCORRECT = -1878392832;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_LENGTH_INCORRECT = -1878327296;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_GENDER = -1877999616;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_EYE_COLOR = -1877934080;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_HAIR_COLOR = -1877868544;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_YAW = -1877803008;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_PITCH = -1877737472;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_ROLL = -1877671936;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_YAW = -1877606400;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_PITCH = -1877540864;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_ROLL = -1877475328;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_FACE_IMAGE_TYPE = -1877409792;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_IMAGE_DATA_TYPE = -1877344256;
  static const int NTF_LDS_SI_PACE_INFO_UNSUPPORTED_STD_PARAMETERS = -1862270976;
  static const int NTF_LDS_SI_PACE_INFO_DEPRECATED_VERSION = -1862270975;
  static const int NTF_LDS_SI_PACE_DOMAIN_PARAMS_USING_STD_REF = -1862270974;
  static const int NTF_LDS_SI_PACE_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = -1862270973;
  static const int NTF_LDS_SI_CA_INFO_INCORRECT_VERSION = -1862270972;
  static const int NTF_LDS_SI_CA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = -1862270971;
  static const int NTF_LDS_SI_CA_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = -1862270970;
  static const int NTF_LDS_SI_TA_INFO_INCORRECT_VERSION = -1862270969;
  static const int NTF_LDS_SI_TA_INFO_FILE_ID_FOR_VERSION2 = -1862270968;
  static const int NTF_LDS_SI_EID_SECURITY_UNSUPPORTED_DIGEST_ALGORITHM = -1862270967;
  static const int NTF_LDS_SI_RI_INFO_INCORRECT_VERSION = -1862270966;
  static const int NTF_LDS_SI_RI_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = -1862270965;
  static const int NTF_LDS_SI_AA_INFO_INCORRECT_VERSION = -1862270964;
  static const int NTF_LDS_SI_AA_INFO_UNSUPPORTED_ALGORITHM = -1862270963;
  static const int NTF_LDS_SI_AA_INFO_INCONSISTENT_ALGORITHM_REFERENCE = -1862270962;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NOT_AVAILABLE = -1862270720;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NO_STD_PARAMETERS = -1862270719;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NO_MATCHING_DOMAIN_PARAMS = -1862270718;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NOT_AVAILABLE = -1862270717;
  static const int NTF_LDS_SI_STORAGE_CA_DOMAIN_PARAMS_NO_REQUIRED_OPTION = -1862270716;
  static const int NTF_LDS_SI_STORAGE_CA_DOMAIN_PARAMS_NOT_AVAILABLE = -1862270715;
  static const int NTF_LDS_SI_STORAGE_CA_ANONYMOUS_INFOS = -1862270714;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NO_MATCHING_DOMAIN_PARAMS = -1862270713;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NO_MATCHING_PUBLIC_KEY = -1862270712;
  static const int NTF_LDS_SI_STORAGE_CA_INCORRECT_INFOS_QUANTITY = -1862270711;
  static const int NTF_LDS_SI_STORAGE_TA_INFO_NOT_AVAILABLE = -1862270710;
  static const int NTF_LDS_SI_STORAGE_CARD_INFO_LOCATOR_MULTIPLE_ENTRIES = -1862270709;
  static const int NTF_LDS_SI_STORAGE_EID_SECURITY_INFO_MULTIPLE_ENTRIES = -1862270708;
  static const int NTF_LDS_SI_STORAGE_PRIVILEGED_TI_MULTIPLE_ENTRIES = -1862270707;
  static const int NTF_LDS_SI_STORAGE_PRIVILEGED_TI_INCORRECT_USAGE = -1862270706;
  static const int NTF_LDS_SI_STORAGE_RI_DOMAIN_PARAMS_MULTIPLE_ENTRIES = -1862270705;
  static const int NTF_LDS_SI_STORAGE_PACE_INFOS_NON_CONSISTANT = -1862270704;
  static const int NTF_LDS_CV_CERTIFICATE_PROFILE_INCORRECT_VERSION = -1862270463;
  static const int NTF_LDS_CV_CERTIFICATE_VALIDITY = -1862270462;
  static const int NTF_LDS_CV_CERTIFICATE_NON_CV_CA_DOMAIN_PARAMETERS = -1862270461;
  static const int NTF_LDS_CV_CERTIFICATE_PRIVATE_KEY_INCORRECT_VERSION = -1862270460;
  static const int NTF_LDS_TA_PACE_STATIC_BINDING_USED = -1862270208;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_VALIDITY = -1845493483;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_ROOT_IS_NOT_TRUSTED = -1845493482;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_CANT_FIND_CSCA = -1845493481;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_REVOKED = -1845493480;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_SIGNATURE_INVALID = -1845493479;

  static String getTranslation(int value) {
    switch (value) {
      case -1879048191:
        return "Notification - ASN certificate: Incorrect version";
      case -1879048190:
        return "Notification - ASN certificate: Non-matching signature algorithm";
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
      case -1879047935:
        return "Notification - ICAO signed data: Version incorrect";
      case -1879047934:
        return "Notification - ICAO signed data: Digest algorithms empty";
      case -1879047933:
        return "Notification - ICAO signed data: Digest algorithms unsupported";
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
      case -1879047927:
        return "Notification - ICAO signed data: Signer infos multiple entries";
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
      case -1879047915:
        return "Notification - Auth signer info: Certificate validity";
      case -1879047914:
        return "Notification - Auth signer info: Certificate root is not trusted";
      case -1879047913:
        return "Notification - Auth signer info: Certificate cannot find CSCA";
      case -1879047912:
        return "Notification - Auth signer info: Certificate revoked";
      case -1879047911:
        return "Notification - Auth signer info: Certificate signature invalid";
      case -1879047910:
        return "Notification: Unsupported image format";
      case -1879047909:
        return "Notification - ASN signer info: Signing time attr missing";
      case -1879047908:
        return "Notification - ASN signer info: Signing time attr data";
      case -1879047907:
        return "Notification - ASN signer info: Signing time attr value";
      case -1879047906:
        return "Notification - ASN signer info: List content description attr missing";
      case -1879047905:
        return "Notification - ASN signer info: List content description attr data";
      case -1879047776:
        return "Notification - ASN signed data: Version incorrect";
      case -1879047775:
        return "Notification - ASN signed data: Content OID incorrect";
      case -1879047760:
        return "Notification - ICAO signed data: Certificates missed";
      case -1879047759:
        return "Notification - ICAO signed data: Certificates empty";
      case -1879047758:
        return "Notification - ICAO signed data: CRLs incorrect usage";
      case -1879047744:
        return "Notification - ICAO master list: Version incorrect";
      case -1879047736:
        return "Notification - ICAO Deviation list: Version incorrect";
      case -1879047728:
        return "Notification - BSI: Defect  list version incorrect";
      case -1879047720:
        return "Notification - BSI: Black list version incorrect";
      case -1879047680:
        return "Notification - ICAO certificate: Version missed";
      case -1879047679:
        return "Notification - ICAO certificate: Version incorrect";
      case -1879047678:
        return "Notification - ICAO certificate: Issuer country missed";
      case -1879047677:
        return "Notification - ICAO certificate: Issuer common name missed";
      case -1879047676:
        return "Notification - ICAO certificate: Issuer country non-compliant";
      case -1879047675:
        return "Notification - ICAO certificate: Subject country missed";
      case -1879047674:
        return "Notification - ICAO certificate: Subject common name missed";
      case -1879047673:
        return "Notification - ICAO certificate: Subject country non-compliant";
      case -1879047672:
        return "Notification - ICAO certificate: Using non-compliant data";
      case -1879047671:
        return "Notification - ICAO certificate: Unsupported signature algorithm";
      case -1879047670:
        return "Notification - ICAO certificate: Unsupported public key algorithm";
      case -1879047669:
        return "Notification - ICAO certificate: Missed extensions";
      case -1879047668:
        return "Notification - ICAO certificate: Validity";
      case -1879047667:
        return "Notification - ICAO certificate extension: Using non-compliant data";
      case -1879047666:
        return "Notification - ICAO certificate extension: Key usage missed";
      case -1879047665:
        return "Notification - ICAO certificate extension: Key usage not critical";
      case -1879047664:
        return "Notification - ICAO certificate extension: Key usage incorrect data";
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
        return "Notification - ICAO certificate extension: Subject alt name non-compliant";
      case -1879047640:
        return "Notification - ICAO certificate extension: Subject alt name critical";
      case -1879047639:
        return "Notification - ICAO certificate extension: Subject alt name DN empty";
      case -1879047638:
        return "Notification - ICAO certificate extension: Subject alt name DN incorrect";
      case -1879047637:
        return "Notification - ICAO certificate extension: Subject alt name DN non-compliant";
      case -1879047636:
        return "Notification - ICAO certificate extension: Issuer alt name missed";
      case -1879047635:
        return "Notification - ICAO certificate extension: Issuer alt name incorrect data";
      case -1879047634:
        return "Notification - ICAO certificate extension: Issuer alt name empty";
      case -1879047633:
        return "Notification - ICAO certificate extension: Issuer alt name non-compliant";
      case -1879047631:
        return "Notification - ICAO certificate extension: Issuer alt name critical";
      case -1879047630:
        return "Notification - ICAO certificate extension: Issuer alt name DN empty";
      case -1879047629:
        return "Notification - ICAO certificate extension: Issuer alt name DN incorrect";
      case -1879047628:
        return "Notification - ICAO certificate extension: Issuer alt name DN non-compliant";
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
      case -1879047615:
        return "Notification - ICAO certificate: SN non-compliant";
      case -1879047614:
        return "Notification - ICAO certificate: Issuer SN non-compliant";
      case -1879047613:
        return "Notification - ICAO certificate: Subject SN non-compliant";
      case -1879047612:
        return "Notification - ICAO certificate: Issuer attribute non-compliant";
      case -1879047611:
        return "Notification - ICAO certificate: Subject attribute non-compliant";
      case -1879047610:
        return "Notification - ICAO certificate: Issuer subject country non-matching";
      case -1879047609:
        return "Notification - ICAO certificate extension: CSCA alt names non-matching";
      case -1879047608:
        return "Notification - ICAO certificate extension: Name change incorrect data";
      case -1879047607:
        return "Notification - ICAO certificate extension: Name change non-compliant";
      case -1879047606:
        return "Notification - ICAO certificate extension: Name change critical";
      case -1879047605:
        return "Notification - ICAO certificate extension Doc type list: non-compliant";
      case -1879047604:
        return "Notification - ICAO certificate extension Doc type list: Critical";
      case -1879047603:
        return "Notification - ICAO certificate extension: Optional critical";
      case -1879047602:
        return "Notification - ICAO certificate: Subject non-compliant";
      case -1879047601:
        return "Notification - ICAO certificate: Subject common name non-compliant";
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
        return "Notification - Auth ML signer info: Certificate cannot find CSCA";
      case -1845493480:
        return "Notification - Auth ML signer info: Certificate revoked";
      case -1845493479:
        return "Notification - Auth ML signer info: Certificate signature invalid";
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
      default:
        return value.toString();
    }
  }
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
  static const int CT_BLS = 7;
  static const int CT_LDS2 = 8;
  static const int CT_BCS = 9;
  static const int CT_BCSNC = 10;
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
  static const int DFT_SAM_DATA = 800;
  static const int DFT_SAM_DATA_MAX = 832;
  static const int DFT_VDS = 900;
  static const int DFT_VDSNC = 901;
  static const int DFT_USERDEFINED = 1000;

  static String getTranslation(int value) {
    switch (value) {
      case 0:
        return "DFT_UNSPECIFIED";
      case 1:
        return "Machine Readable Zone (DG1)";
      case 2:
        return "Biometry - Facial data (DG2)";
      case 3:
        return "Biometry - Fingerprint(s) (DG3)";
      case 4:
        return "Biometry - Iris Data (DG4)";
      case 5:
        return "Portrait(s) (DG5)";
      case 6:
        return "not defined (DG6)";
      case 7:
        return "Signature / usual mark image (DG7)";
      case 8:
        return "not defined (DG8)";
      case 9:
        return "not defined (DG9)";
      case 10:
        return "not defined (DG10)";
      case 11:
        return "Additional personal detail(s) (DG11)";
      case 12:
        return "Additional document details (DG12)";
      case 13:
        return "Optional detail(s) (DG13)";
      case 14:
        return "EAC info (DG14)";
      case 15:
        return "Active Authentication info (DG15)";
      case 16:
        return "Person(s) to notify (DG16)";
      case 17:
        return "DG17";
      case 18:
        return "DG18";
      case 19:
        return "DG19";
      case 20:
        return "DG20";
      case 21:
        return "EF.SOD";
      case 165:
        return "EF.SOD";
      case 22:
        return "EF.CVCA";
      case 23:
        return "EF.COM";
      case 150:
        return "EF.COM";
      case 101:
        return "Document type" + " (DG1)";
      case 102:
        return "Issuing state" + " (DG2)";
      case 103:
        return "Date of expiry" + " (DG3)";
      case 104:
        return "Given name" + " (DG4)";
      case 105:
        return "Surname/given name at birth" + " (DG5)";
      case 106:
        return "Pseudonym" + " (DG6)";
      case 107:
        return "Academic title" + " (DG7)";
      case 108:
        return "Date of birth" + " (DG8)";
      case 109:
        return "Place of birth" + " (DG9)";
      case 110:
        return "Nationality" + " (DG10)";
      case 111:
        return "Sex" + " (DG11)";
      case 112:
        return "Optional details" + " (DG12)";
      case 113:
        return "Undefined" + " (DG13)";
      case 114:
        return "Undefined" + " (DG14)";
      case 115:
        return "Undefined" + " (DG15)";
      case 116:
        return "Undefined" + " (DG16)";
      case 117:
        return "Place of registration" + " (DG17)";
      case 118:
        return "Place of registration" + " (DG18)";
      case 119:
        return "Residence permit 1" + " (DG19)";
      case 120:
        return "Residence permit 2" + " (DG20)";
      case 121:
        return "Optional details" + " (DG21)";
      case 151:
        return "Text data elements (DG1)";
      case 152:
        return "License holder information (DG2)";
      case 153:
        return "Issuing authority details (DG3)";
      case 154:
        return "Portrait image (DG4)";
      case 155:
        return "Signature / usual mark image (DG5)";
      case 156:
        return "Biometry - Facial data (DG6)";
      case 157:
        return "Biometry - Fingerprint(s) (DG7)";
      case 158:
        return "Biometry - Iris Data (DG8)";
      case 159:
        return "Biometry - Other (DG9)";
      case 160:
        return "not defined (DG10)";
      case 161:
        return "Optional domestic data (DG11)";
      case 162:
        return "Non-match alert (DG12)";
      case 163:
        return "Active Authentication info (DG13)";
      case 164:
        return "EAC info (DG14)";
      case 166:
        return "DFT_DL_CE";
      case 167:
        return "DFT_DL_CVCA";
      case 200:
        return "EF.CardAccess";
      case 201:
        return "EF.CardSecurity";
      case 202:
        return "EF.ChipSecurity";
      case 300:
        return "MIFARE data";
      case 301:
        return "MIFARE validity";
      case 400:
        return "DFT_ATR";
      case 500:
        return "DFT_ESIGN_PK";
      case 501:
        return "DFT_ESIGN_SIGNEDDATA";
      case 600:
        return "Certificate";
      case 601:
        return "DFT_MASTERLIST";
      case 602:
        return "DFT_DEFECTLIST";
      case 603:
        return "DFT_DEVIATIONLIST";
      case 700:
        return "App directory";
      case 701:
        return "DFT_SESSION";
      case 702:
        return "DFT_LOGDATA";
      case 703:
        return "DFT_CHIP_PROPERTIES";
      case 1000:
        return "DFT_USERDEFINED";
      default:
        return value.toString();
    }
  }
}

class eRFID_ErrorCodes {
  static const int RFID_ERROR_NO_ERROR = 1;
  static const int RFID_ERROR_ALREADY_DONE = 2;
  static const int RFID_ERROR_FAILED = -1;
  static const int RFID_ERROR_NO_CHIP_DETECTED = -2147418111;
  static const int RFID_ERROR_NOT_AVAILABLE = -2147418110;
  static const int RFID_ERROR_INVALID_PARAMETER = -2147418108;
  static const int RFID_ERROR_NOT_INITIALIZED = -2147418107;
  static const int RFID_ERROR_NOT_ENOUGH_MEMORY = -2147418106;
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
  static const int RFID_ERROR_PCSC_FAILED_SCARD = -2147352570;
  static const int RFID_ERROR_PCSC_EXT_LE_FAILED = -2147352560;
  static const int RFID_ERROR_LAYER6_SECURITY_MANAGER = -2046820352;
  static const int RFID_ERROR_LAYER6_APP_SELECTION_FAILURE = -2046820351;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_MAC_FAIL = -2046820096;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_ENC_FAIL = -2046820095;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_FAILURE = -2046820094;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_FAILURE_DATA = -2046820093;
  static const int RFID_ERROR_LAYER6_SM_DO_8E_MISSING = -2046819840;
  static const int RFID_ERROR_LAYER6_SM_DO_87_MISSING = -2046819839;
  static const int RFID_ERROR_LAYER6_SM_DO_99_MISSING = -2046819838;
  static const int RFID_ERROR_LAYER6_SM_MAC_INCORRECT = -2046819837;
  static const int RFID_ERROR_LAYER6_SM_DO_87_INCORRECT = -2046819836;
  static const int RFID_ERROR_LAYER6_NON_TLV_RESPONSE_DATA = -2046819584;
  static const int RFID_ERROR_LAYER6_WRONG_RND_ICC_LENGTH = -2046819583;
  static const int RFID_ERROR_LAYER6_INT_AUTH_FAILURE = -2046819582;
  static const int RFID_ERROR_LAYER6_MSE_SET_KAT_FAILURE = -2046819581;
  static const int RFID_ERROR_LAYER6_MSE_SET_DST_FAILURE = -2046819580;
  static const int RFID_ERROR_LAYER6_PSO_CERTIFICATE_FAILURE = -2046819579;
  static const int RFID_ERROR_LAYER6_MSE_SET_AT_FAILURE = -2046819578;
  static const int RFID_ERROR_LAYER6_GET_CHALLENGE_FAILURE = -2046819577;
  static const int RFID_ERROR_LAYER6_EXT_AUTH_FAILURE = -2046819576;
  static const int RFID_ERROR_LAYER6_GENERAL_AUTH_FAILURE = -2046819575;
  static const int RFID_ERROR_LAYER6_FILE_NOT_FOUND = -2147456382;
  static const int RFID_ERROR_LAYER6_FILE_EOF1 = -2147458430;
  static const int RFID_ERROR_LAYER6_FILE_EOF2 = -2147456256;
  static const int RFID_ERROR_LAYER6_INCORRECT_PARAMS = -2147456384;
  static const int RFID_ERROR_LAYER6_NO_REFERENCE_DATA = -2147456376;
  static const int RFID_ERROR_LAYER6_PWD_SUSPEND = -2147458111;
  static const int RFID_ERROR_LAYER6_PWD_BLOCKED = -2147458112;
  static const int RFID_ERROR_LAYER6_PWD_DEACTIVATED = -2147458429;
  static const int RFID_ERROR_LAYER6_PWD_BLOCKED2 = -2147456637;
  static const int RFID_ERROR_LAYER6_PWD_DEACTIVATED2 = -2147456636;
  static const int RFID_ERROR_LAYER6_PWD_SUSPEND2 = -2147456635;
  static const int RFID_ERROR_LAYER6_PWD_FAILED = -2146409536;
  static const int RFID_ERROR_NOT_PERFORMED = -2097152000;
  static const int RFID_ERROR_SESSION_IS_CLOSED = -2097151999;
  static const int RFID_ERROR_SESSION_TERMINAL_UNSUPPORTED_OPERATION = -2097151998;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_UNKNOWN = -2097151984;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_BAD_CERTIFICATE = -2097151983;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_NOT_SET = -2097151982;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_UNKNOWN = -2097151981;
  static const int RFID_ERROR_Session_Procedure_Type_Unsupported = -2097151980;
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
  static const int RFID_ERROR_LAYER34_NO_ERROR = -2080374784;
  static const int RFID_ERROR_LAYER34_TIME_OUT = -2080309248;
  static const int RFID_ERROR_LAYER34_COLLISION = -2080243712;
  static const int RFID_ERROR_LAYER34_CRC = -2080178176;
  static const int RFID_ERROR_LAYER34_DATA_INTEGRITY = -2080112640;
  static const int RFID_ERROR_LAYER34_DATA_LENGTH = -2080047104;
  static const int RFID_ERROR_Layer34_RFU = -2079981568;
  static const int RFID_ERROR_LAYER34_COLLISION_TOO_MANY = -2079916032;
  static const int RFID_ERROR_LAYER34_PROTOCOL_B = -2079850496;
  static const int RFID_ERROR_LAYER34_DATA_CONTENTS = -2079784960;
  static const int RFID_ERROR_LAYER34_PROTOCOL = -2079719424;
  static const int RFID_ERROR_LAYER34_GLOBAL_TIME_OUT = -2079653888;
  static const int RFID_ERROR_LAYER34_MIFARE_AUTH = -2079588352;
  static const int RFID_ERROR_LAYER34_SAM_ERROR = -2079522816;
  static const int RFID_ERROR_LAYER34_SAM_COLLISION = -2079457280;
  static const int RFID_ERROR_LAYER34_SAM_ACKNOWLEDGE = -2079391744;

  static String getTranslation(int value) {
    switch (value) {
      case -2147458430:
        return "LAYER6: Reading beyond EOF / Unexpected EOF";
      case -2147458429:
        return "LAYER6: PWD deactivated";
      case -2147458112:
        return "LAYER6: PWD blocked";
      case -2147458111:
        return "LAYER6: PWD suspended";
      case -2147456637:
        return "LAYER6: PWD blocked 2";
      case -2147456636:
        return "LAYER6: PWD deactivated 2";
      case -2147456635:
        return "LAYER6: PWD suspended 2";
      case -2147456384:
        return "LAYER6: Incorrect params";
      case -2147456382:
        return "LAYER6: File selection failure / file not found";
      case -2147456376:
        return "LAYER6: No reference data";
      case -2147456256:
        return "LAYER6: Reading beyond EOF / Unexpected EOF";
      case -2147418111:
        return "RFID: No chip is detected";
      case -2147418110:
        return "RFID: Unavailable";
      case -2147418108:
        return "RFID: Invalid parameter in ExecuteCommand() call found";
      case -2147418107:
        return "RFID: Device is uninitialized";
      case -2147418106:
        return "RFID: Out of memory";
      case -2147418104:
        return "RFID: Invalid directory";
      case -2147418103:
        return "RFID: Unknown command";
      case -2147418102:
        return "RFID File: IO Error";
      case -2147418101:
        return "RFID: RFID is busy";
      case -2147418100:
        return "RFID: The firmware needs to be updated to a newer version";
      case -2147352576:
        return "PCSC: Failed";
      case -2147352575:
        return "PCSC: The reader is unavailable";
      case -2147352574:
        return "PCSC: The card cannot be connected";
      case -2147352573:
        return "PCSC: The card is not connected";
      case -2147352572:
        return "PCSC: Operation is cancelled";
      case -2147352571:
        return "PCSC: The card is busy";
      case -2147352570:
        return "PCSC: Failed Smart Card";
      case -2147352560:
        return "PCSC: ExtLe Failed";
      case -2146409536:
        return "LAYER6: PWD failed";
      case -2097152000:
        return "RFID: Not performed";
      case -2097151999:
        return "RFID: Session is closed";
      case -2097151998:
        return "RFID: Unsupported terminal operation";
      case -2097151984:
        return "RFID: Terminal type unknown";
      case -2097151983:
        return "RFID: Terminal type bad certificate";
      case -2097151982:
        return "RFID: Terminal type not set";
      case -2097151981:
        return "RFID: Unknown procedure type";
      case -2097151980:
        return "RFID: Unsupported procedure type";
      case -2097151979:
        return "RFID: Procedure type not set";
      case -2097151978:
        return "RFID: Access key unknown type";
      case -2097151977:
        return "RFID: Access key unsupported SM type";
      case -2097151976:
        return "RFID: Access key incorrect SM type";
      case -2097151975:
        return "RFID: Access key restricted";
      case -2097151974:
        return "RFID: Access key incorrect data";
      case -2097151973:
        return "RFID: Access key not set";
      case -2097151972:
        return "RFID: PWD management not authorized";
      case -2097151968:
        return "RFID: Access control unknown type";
      case -2097151967:
        return "RFID: Access control unknown type";
      case -2097151966:
        return "RFID: PACE required";
      case -2097151965:
        return "RFID: CA keys required";
      case -2097151964:
        return "RFID: TA required";
      case -2097151963:
        return "RFID: CA required";
      case -2097151962:
        return "RFID: Incorrect option CA";
      case -2097151961:
        return "RFID: CA failed";
      case -2097151960:
        return "RFID: TA failed";
      case -2097151959:
        return "RFID: AA failed";
      case -2097151958:
        return "RFID: RI failed";
      case -2097151952:
        return "RFID: SO signature check failed";
      case -2097151951:
        return "RFID: Hash check failed";
      case -2097151936:
        return "RFID: Invalid aux data - date of expiry";
      case -2097151935:
        return "RFID: Invalid aux data - date of birth";
      case -2097151934:
        return "RFID: Invalid aux data - community ID";
      case -2097151920:
        return "RFID: eSign requires app selection";
      case -2097151919:
        return "RFID: eSign PIN not set";
      case -2097151918:
        return "RFID: eSign PIN not verified";
      case -2097151904:
        return "RFID: Incorrect data";
      case -2097086464:
        return "RFID file: Insufficient data";
      case -2097020928:
        return "RFID file: Incorrect data";
      case -2096955392:
        return "RFID file: Unexpected data";
      case -2096889856:
        return "RFID file: Contains unexpected data";
      case -2096824320:
        return "RFID file: Wrong tag";
      case -2096758784:
        return "RFID file: Cannot use data";
      case -2096693248:
        return "RFID file: Cannot read data";
      case -2096627712:
        return "RFID file: Access denied";
      case -2080374784:
        return "RFID: Layer 34 - No error";
      case -2080309248:
        return "RFID: Layer 34 - Timeout";
      case -2080243712:
        return "RFID: Layer 34 - Collision";
      case -2080178176:
        return "RFID: Layer 34 - CRC";
      case -2080112640:
        return "RFID: Layer 34 - Data integrity";
      case -2080047104:
        return "RFID: Layer 34 - Data length";
      case -2079981568:
        return "RFID: Layer 34 - RFU";
      case -2079916032:
        return "RFID: Layer 34 - Too many collision";
      case -2079850496:
        return "RFID: Layer 34 - Protocol B";
      case -2079784960:
        return "RFID: Layer 34 - Data contents";
      case -2079719424:
        return "RFID: Layer 34 - Protocol";
      case -2079653888:
        return "RFID: Layer 34 - Globa timeout";
      case -2079588352:
        return "RFID: Layer 34 - MIFARE auth";
      case -2079522816:
        return "RFID: Layer 34 - SAM error";
      case -2079457280:
        return "RFID: Layer 34 - SAM collision";
      case -2079391744:
        return "RFID: Layer 34 - SAM acknowledge";
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
      case -2046820093:
        return "LAYER6: ISO7816_B_03 \"Mutual authentication failure data\"";
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
        return "LAYER6: APDU_INS_EXTERNAL_AUTHENTICATE (external authentication) failure";
      case -2046819575:
        return "LAYER6: General Authenticity Failure";
      case -1:
        return "RFID: Failed";
      case 1:
        return "RFID: No error";
      case 2:
        return "RFID: The requested operation is already performed";
      default:
        return value.toString();
    }
  }
}

class eRFID_NotificationCodes {
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
  static const int RPRM_LIGHT_IR = 16777216;
  static const int RPRM_Light_IR_TOP = 8;
  static const int RPRM_Light_IR_SIDE = 16;
  static const int RPRM_Light_IR_Full = 24;
  static const int RPRM_LIGHT_OVD = 67108864;

  static String getTranslation(int value) {
    switch (value) {
      case 6:
        return "Visible light";
      case 24:
        return "IR";
      case 128:
        return "UV";
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
  static const int RPRM_RESULT_TYPE_IMAGES = 37;
  static const int RPRM_RESULT_TYPE_HOLO_PARAMS = 47;
  static const int RPRM_RESULT_TYPE_DOCUMENT_POSITION = 85;
  static const int RPRM_RESULT_TYPE_CUSTOM = 100;
  static const int RFID_RESULT_TYPE_RFID_RAW_DATA = 101;
  static const int RFID_RESULT_TYPE_RFID_TEXT_DATA = 102;
  static const int RFID_RESULT_TYPE_RFID_IMAGE_DATA = 103;
  static const int RFID_RESULT_TYPE_RFID_BINARY_DATA = 104;
  static const int RFID_RESULT_TYPE_RFID_ORIGINAL_GRAPHICS = 105;
  static const int RPRM_RESULT_TYPE_BARCODE_POSITION = 62;
  static const int RPRM_RESULT_TYPE_MRZ_POSITION = 61;
  static const int RPRM_RESULT_TYPE_STATUS = 33;
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
  static const int FT_CITIZENSHIP_STATUS = 625;
  static const int FT_MILITARY_SERVICE_FROM = 626;
  static const int FT_MILITARY_SERVICE_TO = 627;
  static const int FT_DLCLASSCODE_NT_FROM = 628;
  static const int FT_DLCLASSCODE_NT_TO = 629;
  static const int FT_DLCLASSCODE_NT_NOTES = 630;
  static const int FT_DLCLASSCODE_TN_FROM = 631;
  static const int FT_DLCLASSCODE_TN_TO = 632;
  static const int FT_DLCLASSCODE_TN_NOTES = 633;
  static const int FT_DLCLASSCODE_D3_FROM = 634;
  static const int FT_DLCLASSCODE_D3_TO = 635;
  static const int FT_DLCLASSCODE_D3_NOTES = 636;
  static const int FT_ALT_DATE_OF_EXPIRY = 637;
  static const int FT_DLCLASSCODE_CD_FROM = 638;
  static const int FT_DLCLASSCODE_CD_TO = 639;
  static const int FT_DLCLASSCODE_CD_NOTES = 640;
  static const int FT_PAYMENT_PERIOD_TO = 643;
  static const int FT_PAYMENT_PERIOD_FROM = 642;
  static const int FT_ISSUER_IDENTIFICATION_NUMBER = 641;
  static const int FT_VACCINATION_CERTIFICATE_IDENTIFIER = 644;
  static const int FT_FIRST_NAME = 645;
  static const int FT_DATE_OF_ARRIVAL = 646;
  static const int FT_SECOND_NAME = 647;
  static const int FT_THIRD_NAME = 648;
  static const int FT_FOURTH_NAME = 649;
  static const int FT_LAST_NAME = 650;

  static String getTranslation(int value) {
    switch (value) {
      case 0:
        return "Document class code";
      case 1:
        return "Issuing state code";
      case 2:
        return "Document number";
      case 3:
        return "Date of expiry";
      case 4:
        return "Date of issue";
      case 5:
        return "Date of birth";
      case 6:
        return "Place of birth";
      case 7:
        return "Personal number";
      case 8:
        return "Surname";
      case 9:
        return "Given name";
      case 10:
        return "Mother\'s name";
      case 11:
        return "Nationality";
      case 12:
        return "Sex";
      case 13:
        return "Height";
      case 14:
        return "Weight";
      case 15:
        return "Eye color";
      case 16:
        return "Hair color";
      case 17:
        return "Address";
      case 18:
        return "Donor";
      case 19:
        return "Social insurance number";
      case 20:
        return "DL category";
      case 21:
        return "DL endorsement code";
      case 22:
        return "DL Restriction Code";
      case 23:
        return "Date of 21st birthday";
      case 24:
        return "Issuing authority";
      case 25:
        return "Surname and given names";
      case 26:
        return "Nationality code";
      case 27:
        return "Passport number";
      case 28:
        return "Invitation number";
      case 29:
        return "Visa ID";
      case 30:
        return "Visa Class";
      case 31:
        return "Visa subclass";
      case 32:
        return "MRZ line 1";
      case 33:
        return "MRZ line 2";
      case 34:
        return "MRZ line 3";
      case 35:
        return "MRZ Type";
      case 36:
        return "Optional data";
      case 37:
        return "Document class";
      case 38:
        return "Issuing state";
      case 39:
        return "Place of issue";
      case 40:
        return "Checksum for document number";
      case 41:
        return "Checksum for date of birth";
      case 42:
        return "Checksum for date of expiry";
      case 43:
        return "Checksum for personal number";
      case 44:
        return "Final checksum";
      case 45:
        return "Checksum for passport number";
      case 46:
        return "Checksum for invitation number";
      case 47:
        return "Checksum for visa ID";
      case 48:
        return "Checksum for surname and given names";
      case 49:
        return "Checksum for visa expiry date";
      case 50:
        return "Other";
      case 51:
        return "MRZ lines";
      case 52:
        return "Name suffix";
      case 53:
        return "Name prefix";
      case 54:
        return "Checksum for date of issue";
      case 55:
        return "Check digit for date of issue";
      case 56:
        return "Document series";
      case 57:
        return "Registration number";
      case 58:
        return "Vehicle model";
      case 59:
        return "Vehicle color";
      case 60:
        return "Body number";
      case 61:
        return "Vehicle type";
      case 62:
        return "Max permissible weight";
      case 63:
        return "Unladen mass";
      case 64:
        return "Area";
      case 65:
        return "State";
      case 66:
        return "Unit";
      case 67:
        return "Building";
      case 68:
        return "Apartment";
      case 69:
        return "Place of registration";
      case 70:
        return "Date of registration";
      case 71:
        return "Resident from";
      case 72:
        return "Resident until";
      case 73:
        return "Issuing authority code";
      case 74:
        return "Country/region of birth";
      case 75:
        return "Birth state code";
      case 76:
        return "Street";
      case 77:
        return "City";
      case 78:
        return "Jurisdiction code";
      case 79:
        return "Postal code";
      case 80:
        return "Check digit for document number";
      case 81:
        return "Check digit for date of birth";
      case 82:
        return "Check digit for date of expiry";
      case 83:
        return "Check digit for personal number";
      case 84:
        return "Final check digit";
      case 85:
        return "Check digit for passport number";
      case 86:
        return "Check digit for invitation number";
      case 87:
        return "Check digit for visa ID";
      case 88:
        return "Check digit for surname and given names";
      case 89:
        return "Check digit for visa expiry date";
      case 90:
        return "Permit class";
      case 91:
        return "Permit expiry date";
      case 92:
        return "Permit identifier";
      case 93:
        return "Permit issue date";
      case 94:
        return "Permit restriction code";
      case 95:
        return "Permit endorsement code";
      case 96:
        return "Issue time";
      case 97:
        return "Number of duplicates";
      case 98:
        return "Medical notes/codes";
      case 99:
        return "Non-resident indicator";
      case 100:
        return "Visa type";
      case 101:
        return "Visa valid from";
      case 102:
        return "Visa valid until";
      case 103:
        return "Duration of stay";
      case 104:
        return "Number of entries";
      case 105:
        return "Day";
      case 106:
        return "Month";
      case 107:
        return "Year";
      case 108:
        return "Unique customer identifier";
      case 109:
        return "Commercial vehicle code";
      case 110:
        return "AKA: Date of birth";
      case 111:
        return "AKA: Social Insurance Number";
      case 112:
        return "AKA: Surname";
      case 113:
        return "AKA: Given name";
      case 114:
        return "AKA: Name suffix";
      case 115:
        return "AKA: Name prefix";
      case 116:
        return "Mailing address - street";
      case 117:
        return "Mailing address - city";
      case 118:
        return "Mailing address - jurisdiction code";
      case 119:
        return "Mailing address - postal code";
      case 120:
        return "Number for validation";
      case 121:
        return "Inventory number";
      case 122:
        return "Race/ethnicity";
      case 123:
        return "Jurisdiction vehicle class";
      case 124:
        return "Jurisdiction endorsement code";
      case 125:
        return "Jurisdiction restriction code";
      case 126:
        return "Surname/given name at birth";
      case 127:
        return "Given name (National)";
      case 128:
        return "Visa ID (National)";
      case 129:
        return "Father\'s name";
      case 130:
        return "Father\'s name (National)";
      case 131:
        return "Surname and given names (National)";
      case 132:
        return "Place of birth (National)";
      case 133:
        return "Issuing authority (National)";
      case 134:
        return "Numeric issuing state code";
      case 135:
        return "Numeric nationality code";
      case 136:
        return "Engine power";
      case 137:
        return "Engine volume";
      case 138:
        return "Chassis number";
      case 139:
        return "Engine number";
      case 140:
        return "Engine model";
      case 141:
        return "Vehicle category";
      case 142:
        return "Identity card number";
      case 143:
        return "Control number";
      case 144:
        return "Parents\' given names";
      case 145:
        return "Second surname";
      case 146:
        return "Middle name";
      case 147:
        return "Vehicle identification number";
      case 148:
        return "Check digit for VIN";
      case 149:
        return "Checksum for VIN";
      case 150:
        return "Check digit for line 1";
      case 151:
        return "Check digit for line 2";
      case 152:
        return "Check digit for line 3";
      case 153:
        return "Checksum for line 1";
      case 154:
        return "Checksum for line 2";
      case 155:
        return "Checksum for line 3";
      case 156:
        return "Check digit for registration number";
      case 157:
        return "Checksum for registration number";
      case 158:
        return "Vehicle ITS code";
      case 159:
        return "Card access number";
      case 160:
        return "Marital status";
      case 161:
        return "Company name";
      case 162:
        return "Special notes";
      case 163:
        return "Spouse\'s surname";
      case 164:
        return "Tracking number";
      case 165:
        return "Booklet number";
      case 166:
        return "Children";
      case 167:
        return "Copy";
      case 168:
        return "Serial number";
      case 169:
        return "Dossier number";
      case 170:
        return "AKA: Surname and given names";
      case 171:
        return "Territorial validity";
      case 172:
        return "MRZ lines with correct checksums";
      case 173:
        return "CDL Restriction Code";
      case 174:
        return "Date of 18th birthday";
      case 175:
        return "Record created";
      case 176:
        return "Date of duplicate issue";
      case 177:
        return "Card type";
      case 178:
        return "Military ID number";
      case 179:
        return "Destination";
      case 180:
        return "Blood group";
      case 181:
        return "Sequence number";
      case 182:
        return "Body type";
      case 183:
        return "Vehicle make";
      case 184:
        return "Transaction number";
      case 185:
        return "Age";
      case 186:
        return "Folio number";
      case 187:
        return "Voter Key";
      case 188:
        return "Municipality";
      case 189:
        return "Location";
      case 190:
        return "Section";
      case 191:
        return "OCR number";
      case 192:
        return "Federal elections";
      case 193:
        return "Unique number";
      case 194:
        return "Checksum for optional data";
      case 195:
        return "Check digit for optional data";
      case 196:
        return "Visa Number";
      case 197:
        return "Checksum for visa number";
      case 198:
        return "Check digit for visa number";
      case 199:
        return "Voter";
      case 200:
        return "Type/number of the previous document";
      case 220:
        return "Field from MRZ";
      case 221:
        return "Current date";
      case 251:
        return "Status Expiry Date";
      case 252:
        return "Banknote number";
      case 253:
        return "CSC Code";
      case 254:
        return "Pseudonym";
      case 255:
        return "Academic title";
      case 256:
        return "Country";
      case 257:
        return "ZIP code";
      case 258:
        return "Residence permit 1";
      case 259:
        return "Residence permit 2";
      case 260:
        return "Place of birth: Street";
      case 261:
        return "Place of birth: City";
      case 262:
        return "Place of birth: State";
      case 263:
        return "Place of birth: Country";
      case 264:
        return "Place of birth: Postal code";
      case 265:
        return "CDL Class";
      case 266:
        return "Date of 19th birthday";
      case 267:
        return "Weight (pound)";
      case 268:
        return "Indicator of document limited duration";
      case 269:
        return "Endorsement expiration date";
      case 270:
        return "Revision date";
      case 271:
        return "Compliance type";
      case 272:
        return "Truncated surname/given name at birth";
      case 273:
        return "First name truncation";
      case 274:
        return "Middle name truncation";
      case 275:
        return "Exam date";
      case 276:
        return "Organization";
      case 277:
        return "Department";
      case 278:
        return "Pay grade";
      case 279:
        return "Rank";
      case 280:
        return "Benefits number";
      case 281:
        return "Sponsor service";
      case 282:
        return "Sponsor status";
      case 283:
        return "Sponsor";
      case 284:
        return "Relationship";
      case 285:
        return "USCIS";
      case 286:
        return "Category";
      case 287:
        return "Conditions";
      case 288:
        return "Identifier";
      case 289:
        return "Configuration";
      case 290:
        return "Discretionary data";
      case 291:
        return "Optional data from line 1";
      case 292:
        return "Optional data from line 2";
      case 293:
        return "Optional data from line 3";
      case 294:
        return "EQV code";
      case 295:
        return "ALT code";
      case 296:
        return "Binary code";
      case 297:
        return "Pseudocode";
      case 298:
        return "Fee";
      case 299:
        return "Stamp number";
      case 300:
        return "SBH security options";
      case 301:
        return "SBH integrity options";
      case 302:
        return "Creation date";
      case 303:
        return "Validity period";
      case 304:
        return "Patron header version";
      case 305:
        return "BDB type";
      case 306:
        return "Biometric type";
      case 307:
        return "Biometric subtype";
      case 308:
        return "Biometric product ID";
      case 309:
        return "Biometric format owner";
      case 310:
        return "Biometric format type";
      case 311:
        return "Phone";
      case 312:
        return "Profession";
      case 313:
        return "Position";
      case 314:
        return "Personal data summary";
      case 315:
        return "Other valid IDs";
      case 316:
        return "Custody info";
      case 317:
        return "Other name";
      case 318:
        return "Observations";
      case 319:
        return "Tax";
      case 320:
        return "Personalization date";
      case 321:
        return "Serial number of personalization";
      case 322:
        return "Other person, name";
      case 323:
        return "Notify person: Date of record";
      case 324:
        return "Notify person: Name";
      case 325:
        return "Notify person: Phone";
      case 326:
        return "Notify person: Address";
      case 327:
        return "DS certificate issuer";
      case 328:
        return "DS certificate subject";
      case 329:
        return "DS certificate valid from";
      case 330:
        return "DS certificate valid to";
      case 331:
        return "Vehicle data from the DG1 data group";
      case 332:
        return "Type of approval number";
      case 333:
        return "Administrative number";
      case 334:
        return "Document discriminator";
      case 335:
        return "Data discriminator";
      case 336:
        return "ID number of ISO issuer";
      case 340:
        return "GNIB number";
      case 341:
        return "Department number";
      case 342:
        return "Telegraph code";
      case 343:
        return "Allergies";
      case 344:
        return "Special code";
      case 345:
        return "Court code";
      case 346:
        return "County";
      case 347:
        return "Sponsor SSN";
      case 348:
        return "DoD number";
      case 349:
        return "Expiry date of Motorcycle Novice status";
      case 350:
        return "DUF number";
      case 351:
        return "AGY";
      case 352:
        return "PNR code";
      case 353:
        return "Code of the airport of departure";
      case 354:
        return "Code of the airport of arrival";
      case 355:
        return "Flight number";
      case 356:
        return "Date of flight";
      case 357:
        return "Seat number";
      case 358:
        return "Date of boarding pass issue";
      case 359:
        return "CCW until";
      case 360:
        return "Unique number checksum";
      case 361:
        return "Unique number check digit";
      case 362:
        return "Room number";
      case 363:
        return "Religion";
      case 364:
        return "Months to expire";
      case 365:
        return "Electronic ticket indicator";
      case 366:
        return "Compartment code";
      case 367:
        return "Check-in sequence number";
      case 368:
        return "Airline designator of boarding pass issuer";
      case 369:
        return "Airline numeric code";
      case 370:
        return "Ticket number";
      case 371:
        return "Frequent flyer airline designator";
      case 372:
        return "Frequent flyer number";
      case 373:
        return "Free baggage allowance";
      case 374:
        return "PDF417 codec";
      case 375:
        return "Checksum for identity card number";
      case 376:
        return "Check digit for identity card number";
      case 377:
        return "Veteran";
      case 378:
        return "DL category A1 valid from";
      case 379:
        return "DL category A1 valid to";
      case 380:
        return "DL category A1 codes";
      case 381:
        return "DL category A valid from";
      case 382:
        return "DL category A valid to";
      case 383:
        return "DL category A codes";
      case 384:
        return "DL category B valid from";
      case 385:
        return "DL category B valid to";
      case 386:
        return "DL category B codes";
      case 387:
        return "DL category C1 valid from";
      case 388:
        return "DL category C1 valid to";
      case 389:
        return "DL category C1 codes";
      case 390:
        return "DL category C valid from";
      case 391:
        return "DL category C valid to";
      case 392:
        return "DL category C codes";
      case 393:
        return "DL category D1 valid from";
      case 394:
        return "DL category D1 valid to";
      case 395:
        return "DL category D1 codes";
      case 396:
        return "DL category D valid from";
      case 397:
        return "DL category D valid to";
      case 398:
        return "DL category D codes";
      case 399:
        return "DL category BE valid from";
      case 400:
        return "DL category BE valid to";
      case 401:
        return "DL category BE codes";
      case 402:
        return "DL category C1E valid from";
      case 403:
        return "DL category C1E valid to";
      case 404:
        return "DL category C1E codes";
      case 405:
        return "DL category CE valid from";
      case 406:
        return "DL category CE valid to";
      case 407:
        return "DL category CE codes";
      case 408:
        return "DL category D1E valid from";
      case 409:
        return "DL category D1E valid to";
      case 410:
        return "DL category D1E codes";
      case 411:
        return "DL category DE valid from";
      case 412:
        return "DL category DE valid to";
      case 413:
        return "DL category DE codes";
      case 414:
        return "DL category M valid from";
      case 415:
        return "DL category M valid to";
      case 416:
        return "DL category M codes";
      case 417:
        return "DL category L valid from";
      case 418:
        return "DL category L valid to";
      case 419:
        return "DL category L codes";
      case 420:
        return "DL category T valid from";
      case 421:
        return "DL category T valid to";
      case 422:
        return "DL category T codes";
      case 423:
        return "DL category AM valid from";
      case 424:
        return "DL category AM valid to";
      case 425:
        return "DL category AM codes";
      case 426:
        return "DL category A2 valid from";
      case 427:
        return "DL category A2 valid to";
      case 428:
        return "DL category A2 codes";
      case 429:
        return "DL category B1 valid from";
      case 430:
        return "DL category B1 valid to";
      case 431:
        return "DL category B1 codes";
      case 432:
        return "Surname at birth";
      case 433:
        return "Civil status";
      case 434:
        return "Number of seats";
      case 435:
        return "Number of standing places";
      case 436:
        return "Max speed";
      case 437:
        return "Fuel type";
      case 438:
        return "Vehicle environmental type";
      case 439:
        return "Power-to-weight ratio";
      case 440:
        return "Max mass of trailer (braked)";
      case 441:
        return "Max mass of trailer (unbraked)";
      case 442:
        return "Transmission type";
      case 443:
        return "Trailer hitch";
      case 444:
        return "Accompanied by";
      case 445:
        return "Police district";
      case 446:
        return "First issue date";
      case 447:
        return "Payload capacity";
      case 448:
        return "Number of axles";
      case 449:
        return "Permissible axle load";
      case 450:
        return "Precinct";
      case 451:
        return "Invited by";
      case 452:
        return "Purpose of entry";
      case 453:
        return "Skin color";
      case 454:
        return "Complexion";
      case 455:
        return "Airport of departure";
      case 456:
        return "Airport of arrival";
      case 457:
        return "Airline name";
      case 458:
        return "Airline loyalty program for frequent flyers";
      case 459:
        return "License number";
      case 460:
        return "In tanks";
      case 461:
        return "Other than tanks";
      case 462:
        return "Fast Track service";
      case 463:
        return "Owner";
      case 464:
        return "MRZ lines from ICAO RFID";
      case 465:
        return "Number of card issuances";
      case 466:
        return "Checksum for number of card issuances";
      case 467:
        return "Check digit for number of card issuances";
      case 468:
        return "Century of birth";
      case 469:
        return "DL category A3 valid from";
      case 470:
        return "DL category A3 valid to";
      case 471:
        return "DL category A3 codes";
      case 472:
        return "DL category C2 valid from";
      case 473:
        return "DL category C2 valid to";
      case 474:
        return "DL category C2 codes";
      case 475:
        return "DL category B2 valid from";
      case 476:
        return "DL category B2 valid to";
      case 477:
        return "DL category B2 codes";
      case 478:
        return "DL category D2 valid from";
      case 479:
        return "DL category D2 valid to";
      case 480:
        return "DL category D2 codes";
      case 481:
        return "DL category B2E valid from";
      case 482:
        return "DL category B2E valid to";
      case 483:
        return "DL category B2E codes";
      case 484:
        return "DL category G valid from";
      case 485:
        return "DL category G valid to";
      case 486:
        return "DL category G codes";
      case 487:
        return "DL category J valid from";
      case 488:
        return "DL category J valid to";
      case 489:
        return "DL category J codes";
      case 490:
        return "DL category LC valid from";
      case 491:
        return "DL category LC valid to";
      case 492:
        return "DL category LC codes";
      case 493:
        return "Bank card number";
      case 494:
        return "Bank card validity";
      case 495:
        return "Tax number";
      case 496:
        return "Health insurance number";
      case 497:
        return "Grandfather\'s name";
      case 498:
        return "Selectee indicator";
      case 499:
        return "Mother\'s surname";
      case 500:
        return "Mother\'s given name";
      case 501:
        return "Father\'s surname";
      case 502:
        return "Father\'s given name";
      case 503:
        return "Mother\'s date of birth";
      case 504:
        return "Father\'s date of birth";
      case 505:
        return "Mother\'s personal number";
      case 506:
        return "Father\'s personal number";
      case 507:
        return "Mother\'s place of birth";
      case 508:
        return "Father\'s place of birth";
      case 509:
        return "Mother\'s country of birth";
      case 510:
        return "Father\'s country of birth";
      case 511:
        return "Date of first renewal";
      case 512:
        return "Date of second renewal";
      case 513:
        return "Place of examination";
      case 514:
        return "Application number";
      case 515:
        return "Voucher number";
      case 516:
        return "Authorization number";
      case 517:
        return "Faculty";
      case 518:
        return "Form of education";
      case 519:
        return "DNI number";
      case 520:
        return "Retirement number";
      case 521:
        return "Professional ID number";
      case 522:
        return "Age at issue";
      case 523:
        return "Years since issue";
      case 524:
        return "DL category BTP valid from";
      case 525:
        return "DL category BTP codes";
      case 526:
        return "DL category BTP valid to";
      case 527:
        return "DL category C3 valid from";
      case 528:
        return "DL category C3 codes";
      case 529:
        return "DL category C3 valid to";
      case 530:
        return "DL category E valid from";
      case 531:
        return "DL category E codes";
      case 532:
        return "DL category E valid to";
      case 533:
        return "DL category F valid from";
      case 534:
        return "DL category F codes";
      case 535:
        return "DL category F valid to";
      case 536:
        return "DL category FA valid from";
      case 537:
        return "DL category FA codes";
      case 538:
        return "DL category FA valid to";
      case 539:
        return "DL category FA1 valid from";
      case 540:
        return "DL category FA1 codes";
      case 541:
        return "DL category FA1 valid to";
      case 542:
        return "DL category FB valid from";
      case 543:
        return "DL category FB codes";
      case 544:
        return "DL category FB valid to";
      case 545:
        return "DL category G1 valid from";
      case 546:
        return "DL category G1 codes";
      case 547:
        return "DL category G1 valid to";
      case 548:
        return "DL category H valid from";
      case 549:
        return "DL category H codes";
      case 550:
        return "DL category H valid to";
      case 551:
        return "DL category I valid from";
      case 552:
        return "DL category I codes";
      case 553:
        return "DL category I valid to";
      case 554:
        return "DL category K valid from";
      case 555:
        return "DL category K codes";
      case 556:
        return "DL category K valid to";
      case 557:
        return "DL category LK valid from";
      case 558:
        return "DL category LK codes";
      case 559:
        return "DL category LK valid to";
      case 560:
        return "DL category N valid from";
      case 561:
        return "DL category N codes";
      case 562:
        return "DL category N valid to";
      case 563:
        return "DL category S valid from";
      case 564:
        return "DL category S codes";
      case 565:
        return "DL category S valid to";
      case 566:
        return "DL category TB valid from";
      case 567:
        return "DL category TB codes";
      case 568:
        return "DL category TB valid to";
      case 569:
        return "DL category TM valid from";
      case 570:
        return "DL category TM codes";
      case 571:
        return "DL category TM valid to";
      case 572:
        return "DL category TR valid from";
      case 573:
        return "DL category TR codes";
      case 574:
        return "DL category TR valid to";
      case 575:
        return "DL category TV valid from";
      case 576:
        return "DL category TV codes";
      case 577:
        return "DL category TV valid to";
      case 578:
        return "DL category V valid from";
      case 579:
        return "DL category V codes";
      case 580:
        return "DL category V valid to";
      case 581:
        return "DL category W valid from";
      case 582:
        return "DL category W codes";
      case 583:
        return "DL category W valid to";
      case 584:
        return "URL";
      case 585:
        return "Caliber";
      case 586:
        return "Model";
      case 587:
        return "Make";
      case 588:
        return "Number of cylinders";
      case 589:
        return "Surname of husband after registration";
      case 590:
        return "Surname of wife after registration";
      case 591:
        return "Date of birth of wife";
      case 592:
        return "Date of birth of husband";
      case 593:
        return "Citizenship of the first person";
      case 594:
        return "Citizenship of the second person";
      case 595:
        return "CVV/CVC";
      case 596:
        return "Expiry date of insurance";
      case 597:
        return "Mortgage by";
      case 598:
        return "Old document number";
      case 599:
        return "Old date of issue";
      case 600:
        return "Old place of issue";
      case 601:
        return "DL category LR valid from";
      case 602:
        return "DL category LR valid to";
      case 603:
        return "DL category LR codes";
      case 604:
        return "DL category MR valid from";
      case 605:
        return "DL category MR valid to";
      case 606:
        return "DL category MR codes";
      case 607:
        return "DL category HR valid from";
      case 608:
        return "DL category HR valid to";
      case 609:
        return "DL category HR codes";
      case 610:
        return "DL category HC valid from";
      case 611:
        return "DL category HC valid to";
      case 612:
        return "DL category HC codes";
      case 613:
        return "DL category MC valid from";
      case 614:
        return "DL category MC valid to";
      case 615:
        return "DL category MC codes";
      case 616:
        return "DL category RE valid from";
      case 617:
        return "DL category RE valid to";
      case 618:
        return "DL category RE codes";
      case 619:
        return "DL category R valid from";
      case 620:
        return "DL category R valid to";
      case 621:
        return "DL category R codes";
      case 622:
        return "DL category CA valid from";
      case 623:
        return "DL category CA valid to";
      case 624:
        return "DL category CA codes";
      case 625:
        return "Citizenship status";
      case 626:
        return "Military service from";
      case 627:
        return "Military service to";
      case 628:
        return "DL category NT valid from";
      case 629:
        return "DL category NT valid to";
      case 630:
        return "DL category NT codes";
      case 631:
        return "DL category TN valid from";
      case 632:
        return "DL category TN valid to";
      case 633:
        return "DL category TN codes";
      case 634:
        return "DL category D3 valid from";
      case 635:
        return "DL category D3 valid to";
      case 636:
        return "DL category D3 codes";
      case 637:
        return "Alternative date of expiry";
      case 638:
        return "DL category CD valid from";
      case 639:
        return "DL category CD valid to";
      case 640:
        return "DL category CD codes";
      case 641:
        return "Issuer identification number";
      case 642:
        return "Payment period from";
      case 643:
        return "Payment period to";
      case 644:
        return "Unique vaccination certificate identifier";
      case 645:
        return "First name";
      case 646:
        return "Date of arrival";
      case 647:
        return "Second name";
      case 648:
        return "Third name";
      case 649:
        return "Fourth name";
      case 650:
        return "Last name";
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

class IRfidNotificationCompletion {
  static const int RFID_EVENT_CHIP_DETECTED = 1;
  static const int RFID_EVENT_READING_ERROR = 2;
  static const String RFID_EXTRA_ERROR_CODE = "rfid.error.code";
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

class RFIDDelegate {
  static const int NULL = 0;
  static const int NO_PA = 1;
  static const int FULL = 2;
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

  static Future<dynamic> initializeReaderAutomatically() async {
    return await _channel.invokeMethod("initializeReaderAutomatically", []);
  }

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

  static Future<dynamic> stopRFIDReaderWithErrorMessage(message) async {
    return await _channel.invokeMethod("stopRFIDReaderWithErrorMessage", [message]);
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

  static Future<dynamic> setRfidDelegate(delegate) async {
    return await _channel.invokeMethod("setRfidDelegate", [delegate]);
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

  static Future<dynamic> providePACertificates(certificates) async {
    return await _channel.invokeMethod("providePACertificates", [certificates]);
  }

  static Future<dynamic> provideTACertificates(certificates) async {
    return await _channel.invokeMethod("provideTACertificates", [certificates]);
  }

  static Future<dynamic> provideTASignature(certificates) async {
    return await _channel.invokeMethod("provideTASignature", [certificates]);
  }

  static Future<dynamic> parseCoreResults(json) async {
    return await _channel.invokeMethod("parseCoreResults", [json]);
  }

  static Future<dynamic> setTCCParams(params) async {
    return await _channel.invokeMethod("setTCCParams", [params]);
  }

  static Future<dynamic> initializeReaderWithDatabase(license, db) async {
    return await _channel.invokeMethod("initializeReaderWithDatabase", [license, db]);
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

  static Future<dynamic> recognizeImageWithCameraMode(image, mode) async {
    return await _channel.invokeMethod("recognizeImageWithCameraMode", [image, mode]);
  }

  static Future<dynamic> recognizeImagesWithImageInputs(images) async {
    return await _channel.invokeMethod("recognizeImagesWithImageInputs", [images]);
  }
}