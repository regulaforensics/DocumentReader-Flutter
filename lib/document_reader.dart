import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';

// Classes

class DocumentReaderScenario {
  String? name;
  String? caption;
  String? description;
  bool? multiPageOff;
  double? frameKWHLandscape;
  double? frameKWHPortrait;
  double? frameKWHDoublePageSpreadPortrait;
  double? frameKWHDoublePageSpreadLandscape;
  int? frameOrientation;
  bool? uvTorch;
  bool? faceExt;
  bool? seriesProcessMode;
  bool? manualCrop;

  static DocumentReaderScenario? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderScenario();

    result.name = jsonObject["name"];
    result.caption = jsonObject["caption"];
    result.description = jsonObject["description"];
    result.multiPageOff = jsonObject["multiPageOff"];
    result.frameKWHLandscape = jsonObject["frameKWHLandscape"] == null ? null : jsonObject["frameKWHLandscape"].toDouble();
    result.frameKWHPortrait = jsonObject["frameKWHPortrait"] == null ? null : jsonObject["frameKWHPortrait"].toDouble();
    result.frameKWHDoublePageSpreadPortrait = jsonObject["frameKWHDoublePageSpreadPortrait"] == null ? null : jsonObject["frameKWHDoublePageSpreadPortrait"].toDouble();
    result.frameKWHDoublePageSpreadLandscape = jsonObject["frameKWHDoublePageSpreadLandscape"] == null ? null : jsonObject["frameKWHDoublePageSpreadLandscape"].toDouble();
    result.frameOrientation = jsonObject["frameOrientation"];
    result.uvTorch = jsonObject["uvTorch"];
    result.faceExt = jsonObject["faceExt"];
    result.seriesProcessMode = jsonObject["seriesProcessMode"];
    result.manualCrop = jsonObject["manualCrop"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (name != null) _result.addAll({"name": name});
    if (caption != null) _result.addAll({"caption": caption});
    if (description != null) _result.addAll({"description": description});
    if (multiPageOff != null) _result.addAll({"multiPageOff": multiPageOff});
    if (frameKWHLandscape != null) _result.addAll({"frameKWHLandscape": frameKWHLandscape});
    if (frameKWHPortrait != null) _result.addAll({"frameKWHPortrait": frameKWHPortrait});
    if (frameKWHDoublePageSpreadPortrait != null) _result.addAll({"frameKWHDoublePageSpreadPortrait": frameKWHDoublePageSpreadPortrait});
    if (frameKWHDoublePageSpreadLandscape != null) _result.addAll({"frameKWHDoublePageSpreadLandscape": frameKWHDoublePageSpreadLandscape});
    if (frameOrientation != null) _result.addAll({"frameOrientation": frameOrientation});
    if (uvTorch != null) _result.addAll({"uvTorch": uvTorch});
    if (faceExt != null) _result.addAll({"faceExt": faceExt});
    if (seriesProcessMode != null) _result.addAll({"seriesProcessMode": seriesProcessMode});
    if (manualCrop != null) _result.addAll({"manualCrop": manualCrop});

    return _result;
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
    Map _result = {};

    if (bottom != null) _result.addAll({"bottom": bottom});
    if (top != null) _result.addAll({"top": top});
    if (left != null) _result.addAll({"left": left});
    if (right != null) _result.addAll({"right": right});

    return _result;
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
    Map _result = {};

    if (bottom != null) _result.addAll({"bottom": bottom});
    if (top != null) _result.addAll({"top": top});
    if (left != null) _result.addAll({"left": left});
    if (right != null) _result.addAll({"right": right});

    return _result;
  }
}

class DocumentReaderGraphicField {
  int? sourceType;
  int? fieldType;
  int? light;
  int? pageIndex;
  int? originalPageIndex;
  String? fieldName;
  String? lightName;
  String? value;
  DocReaderFieldRect? fieldRect;

  static DocumentReaderGraphicField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderGraphicField();

    result.sourceType = jsonObject["sourceType"];
    result.fieldType = jsonObject["fieldType"];
    result.light = jsonObject["light"];
    result.pageIndex = jsonObject["pageIndex"];
    result.originalPageIndex = jsonObject["originalPageIndex"];
    result.fieldName = jsonObject["fieldName"];
    result.lightName = jsonObject["lightName"];
    result.value = jsonObject["value"];
    result.fieldRect = DocReaderFieldRect.fromJson(jsonObject["fieldRect"]);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (sourceType != null) _result.addAll({"sourceType": sourceType});
    if (fieldType != null) _result.addAll({"fieldType": fieldType});
    if (light != null) _result.addAll({"light": light});
    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (originalPageIndex != null) _result.addAll({"originalPageIndex": originalPageIndex});
    if (fieldName != null) _result.addAll({"fieldName": fieldName});
    if (lightName != null) _result.addAll({"lightName": lightName});
    if (value != null) _result.addAll({"value": value});
    if (fieldRect != null) _result.addAll({"fieldRect": fieldRect});

    return _result;
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
    Map _result = {};

    _result.addAll({"fields": fields});

    return _result;
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
  List<DocumentReaderSymbol?> originalSymbols = [];
  DocumentReaderRfidOrigin? rfidOrigin;

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
    if (jsonObject["originalSymbols"] != null)
      for (var item in jsonObject["originalSymbols"])
        result.originalSymbols.add(DocumentReaderSymbol.fromJson(item));
    result.rfidOrigin = DocumentReaderRfidOrigin.fromJson(jsonObject["rfidOrigin"]);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (sourceType != null) _result.addAll({"sourceType": sourceType});
    if (validity != null) _result.addAll({"validity": validity});
    if (probability != null) _result.addAll({"probability": probability});
    if (value != null) _result.addAll({"value": value});
    if (originalValue != null) _result.addAll({"originalValue": originalValue});
    if (boundRect != null) _result.addAll({"boundRect": boundRect});
    _result.addAll({"comparison": comparison});
    _result.addAll({"originalSymbols": originalSymbols});
    if (rfidOrigin != null) _result.addAll({"rfidOrigin": rfidOrigin});

    return _result;
  }
}

class DocumentReaderTextField {
  int? fieldType;
  int? lcid;
  int? status;
  String? lcidName;
  String? fieldName;
  String? value;
  DocumentReaderValue? getValue;
  List<DocumentReaderValue?> values = [];
  List<DocumentReaderComparison?> comparisonList = [];
  List<DocumentReaderValidity?> validityList = [];
  int? comparisonStatus;
  int? validityStatus;

  static DocumentReaderTextField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextField();

    result.fieldType = jsonObject["fieldType"];
    result.lcid = jsonObject["lcid"];
    result.status = jsonObject["status"];
    result.lcidName = jsonObject["lcidName"];
    result.fieldName = jsonObject["fieldName"];
    result.value = jsonObject["value"];
    result.getValue = DocumentReaderValue.fromJson(jsonObject["getValue"]);
    if (jsonObject["values"] != null)
      for (var item in jsonObject["values"])
        result.values.add(DocumentReaderValue.fromJson(item));
    if (jsonObject["comparisonList"] != null)
      for (var item in jsonObject["comparisonList"])
        result.comparisonList.add(DocumentReaderComparison.fromJson(item));
    if (jsonObject["validityList"] != null)
      for (var item in jsonObject["validityList"])
        result.validityList.add(DocumentReaderValidity.fromJson(item));
    result.comparisonStatus = jsonObject["comparisonStatus"];
    result.validityStatus = jsonObject["validityStatus"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (fieldType != null) _result.addAll({"fieldType": fieldType});
    if (lcid != null) _result.addAll({"lcid": lcid});
    if (status != null) _result.addAll({"status": status});
    if (lcidName != null) _result.addAll({"lcidName": lcidName});
    if (fieldName != null) _result.addAll({"fieldName": fieldName});
    if (value != null) _result.addAll({"value": value});
    if (getValue != null) _result.addAll({"getValue": getValue});
    _result.addAll({"values": values});
    _result.addAll({"comparisonList": comparisonList});
    _result.addAll({"validityList": validityList});
    if (comparisonStatus != null) _result.addAll({"comparisonStatus": comparisonStatus});
    if (validityStatus != null) _result.addAll({"validityStatus": validityStatus});

    return _result;
  }
}

class DocumentReaderTextResult {
  int? status;
  int? comparisonStatus;
  int? validityStatus;
  List<DocumentReaderTextSource?> availableSourceList = [];
  List<DocumentReaderTextField?> fields = [];

  static DocumentReaderTextResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextResult();

    result.status = jsonObject["status"];
    result.comparisonStatus = jsonObject["comparisonStatus"];
    result.validityStatus = jsonObject["validityStatus"];
    if (jsonObject["availableSourceList"] != null)
      for (var item in jsonObject["availableSourceList"])
        result.availableSourceList.add(DocumentReaderTextSource.fromJson(item));
    if (jsonObject["fields"] != null)
      for (var item in jsonObject["fields"])
        result.fields.add(DocumentReaderTextField.fromJson(item));

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (status != null) _result.addAll({"status": status});
    if (comparisonStatus != null) _result.addAll({"comparisonStatus": comparisonStatus});
    if (validityStatus != null) _result.addAll({"validityStatus": validityStatus});
    _result.addAll({"availableSourceList": availableSourceList});
    _result.addAll({"fields": fields});

    return _result;
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
    Map _result = {};

    if (x != null) _result.addAll({"x": x});
    if (y != null) _result.addAll({"y": y});

    return _result;
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
    Map _result = {};

    if (docFormat != null) _result.addAll({"docFormat": docFormat});
    if (width != null) _result.addAll({"width": width});
    if (height != null) _result.addAll({"height": height});
    if (dpi != null) _result.addAll({"dpi": dpi});
    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (inverse != null) _result.addAll({"inverse": inverse});
    if (perspectiveTr != null) _result.addAll({"perspectiveTr": perspectiveTr});
    if (objArea != null) _result.addAll({"objArea": objArea});
    if (objIntAngleDev != null) _result.addAll({"objIntAngleDev": objIntAngleDev});
    if (resultStatus != null) _result.addAll({"resultStatus": resultStatus});
    if (angle != null) _result.addAll({"angle": angle});
    if (center != null) _result.addAll({"center": center});
    if (leftTop != null) _result.addAll({"leftTop": leftTop});
    if (leftBottom != null) _result.addAll({"leftBottom": leftBottom});
    if (rightTop != null) _result.addAll({"rightTop": rightTop});
    if (rightBottom != null) _result.addAll({"rightBottom": rightBottom});

    return _result;
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
    Map _result = {};

    if (featureType != null) _result.addAll({"featureType": featureType});
    if (result != null) _result.addAll({"result": result});
    if (type != null) _result.addAll({"type": type});

    return _result;
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
    Map _result = {};

    if (count != null) _result.addAll({"count": count});
    if (result != null) _result.addAll({"result": result});
    _result.addAll({"imageQualityList": imageQualityList});
    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});

    return _result;
  }
}

class DocumentReaderDocumentType {
  int? pageIndex;
  int? documentID;
  int? dType;
  int? dFormat;
  bool? dMRZ;
  bool? isDeprecated;
  String? name;
  String? iCAOCode;
  String? dDescription;
  String? dYear;
  String? dCountryName;
  List<int?> fDSID = [];

  static DocumentReaderDocumentType? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderDocumentType();

    result.pageIndex = jsonObject["pageIndex"];
    result.documentID = jsonObject["documentID"];
    result.dType = jsonObject["dType"];
    result.dFormat = jsonObject["dFormat"];
    result.dMRZ = jsonObject["dMRZ"];
    result.isDeprecated = jsonObject["isDeprecated"];
    result.name = jsonObject["name"];
    result.iCAOCode = jsonObject["ICAOCode"];
    result.dDescription = jsonObject["dDescription"];
    result.dYear = jsonObject["dYear"];
    result.dCountryName = jsonObject["dCountryName"];
    if (jsonObject["FDSID"] != null)
      for (var item in jsonObject["FDSID"])
        result.fDSID.add(item);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (documentID != null) _result.addAll({"documentID": documentID});
    if (dType != null) _result.addAll({"dType": dType});
    if (dFormat != null) _result.addAll({"dFormat": dFormat});
    if (dMRZ != null) _result.addAll({"dMRZ": dMRZ});
    if (isDeprecated != null) _result.addAll({"isDeprecated": isDeprecated});
    if (name != null) _result.addAll({"name": name});
    if (iCAOCode != null) _result.addAll({"ICAOCode": iCAOCode});
    if (dDescription != null) _result.addAll({"dDescription": dDescription});
    if (dYear != null) _result.addAll({"dYear": dYear});
    if (dCountryName != null) _result.addAll({"dCountryName": dCountryName});
    _result.addAll({"FDSID": fDSID});

    return _result;
  }
}

class DocumentReaderNotification {
  int? notificationCode;
  int? dataFileType;
  int? progress;

  static DocumentReaderNotification? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderNotification();

    result.notificationCode = jsonObject["notificationCode"];
    result.dataFileType = jsonObject["dataFileType"];
    result.progress = jsonObject["progress"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (notificationCode != null) _result.addAll({"notificationCode": notificationCode});
    if (dataFileType != null) _result.addAll({"dataFileType": dataFileType});
    if (progress != null) _result.addAll({"progress": progress});

    return _result;
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
    Map _result = {};

    if (activeOptionIdx != null) _result.addAll({"activeOptionIdx": activeOptionIdx});
    if (type != null) _result.addAll({"type": type});
    if (status != null) _result.addAll({"status": status});
    _result.addAll({"notifications": notifications});

    return _result;
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
    Map _result = {};

    if (length != null) _result.addAll({"length": length});
    if (type != null) _result.addAll({"type": type});
    if (status != null) _result.addAll({"status": status});
    if (data != null) _result.addAll({"data": data});

    return _result;
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
    Map _result = {};

    if (length != null) _result.addAll({"length": length});
    if (data != null) _result.addAll({"data": data});

    return _result;
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
    Map _result = {};

    if (securityObject != null) _result.addAll({"securityObject": securityObject});

    return _result;
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
    Map _result = {};

    if (readingTime != null) _result.addAll({"readingTime": readingTime});
    if (type != null) _result.addAll({"type": type});
    if (pAStatus != null) _result.addAll({"pAStatus": pAStatus});
    if (readingStatus != null) _result.addAll({"readingStatus": readingStatus});
    if (fileID != null) _result.addAll({"fileID": fileID});
    if (fileData != null) _result.addAll({"fileData": fileData});
    if (certificates != null) _result.addAll({"certificates": certificates});
    _result.addAll({"docFieldsText": docFieldsText});
    _result.addAll({"docFieldsGraphics": docFieldsGraphics});
    _result.addAll({"docFieldsOriginals": docFieldsOriginals});
    _result.addAll({"notifications": notifications});

    return _result;
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
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (status != null) _result.addAll({"status": status});
    if (applicationID != null) _result.addAll({"applicationID": applicationID});
    if (dataHashAlgorithm != null) _result.addAll({"dataHashAlgorithm": dataHashAlgorithm});
    if (unicodeVersion != null) _result.addAll({"unicodeVersion": unicodeVersion});
    if (version != null) _result.addAll({"version": version});
    _result.addAll({"files": files});

    return _result;
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
    Map _result = {};

    if (length != null) _result.addAll({"length": length});
    if (type != null) _result.addAll({"type": type});
    if (status != null) _result.addAll({"status": status});
    if (data != null) _result.addAll({"data": data});
    if (format != null) _result.addAll({"format": format});

    return _result;
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
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (value != null) _result.addAll({"value": value});

    return _result;
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
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (friendlyName != null) _result.addAll({"friendlyName": friendlyName});
    _result.addAll({"attributes": attributes});

    return _result;
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
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (type != null) _result.addAll({"type": type});

    return _result;
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
    Map _result = {};

    if (notAfter != null) _result.addAll({"notAfter": notAfter});
    if (notBefore != null) _result.addAll({"notBefore": notBefore});

    return _result;
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
    Map _result = {};

    if (origin != null) _result.addAll({"origin": origin});
    if (type != null) _result.addAll({"type": type});
    if (version != null) _result.addAll({"version": version});
    if (paStatus != null) _result.addAll({"paStatus": paStatus});
    if (serialNumber != null) _result.addAll({"serialNumber": serialNumber});
    if (signatureAlgorithm != null) _result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (subjectPKAlgorithm != null) _result.addAll({"subjectPKAlgorithm": subjectPKAlgorithm});
    if (fileName != null) _result.addAll({"fileName": fileName});
    if (validity != null) _result.addAll({"validity": validity});
    if (issuer != null) _result.addAll({"issuer": issuer});
    if (subject != null) _result.addAll({"subject": subject});
    _result.addAll({"notifications": notifications});
    _result.addAll({"extensions": extensions});

    return _result;
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
    Map _result = {};

    if (version != null) _result.addAll({"version": version});
    if (paStatus != null) _result.addAll({"paStatus": paStatus});
    if (dataToHash != null) _result.addAll({"dataToHash": dataToHash});
    if (digestAlgorithm != null) _result.addAll({"digestAlgorithm": digestAlgorithm});
    if (signatureAlgorithm != null) _result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (serialNumber != null) _result.addAll({"serialNumber": serialNumber});
    if (signature != null) _result.addAll({"signature": signature});
    if (subjectKeyIdentifier != null) _result.addAll({"subjectKeyIdentifier": subjectKeyIdentifier});
    if (issuer != null) _result.addAll({"issuer": issuer});
    _result.addAll({"notifications": notifications});
    _result.addAll({"signedAttributes": signedAttributes});
    _result.addAll({"certificateChain": certificateChain});

    return _result;
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
    Map _result = {};

    if (fileReference != null) _result.addAll({"fileReference": fileReference});
    if (version != null) _result.addAll({"version": version});
    if (objectType != null) _result.addAll({"objectType": objectType});
    _result.addAll({"notifications": notifications});
    _result.addAll({"signerInfos": signerInfos});

    return _result;
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
    Map _result = {};

    if (aTQA != null) _result.addAll({"aTQA": aTQA});
    if (bitRateR != null) _result.addAll({"bitRateR": bitRateR});
    if (bitRateS != null) _result.addAll({"bitRateS": bitRateS});
    if (chipTypeA != null) _result.addAll({"chipTypeA": chipTypeA});
    if (mifareMemory != null) _result.addAll({"mifareMemory": mifareMemory});
    if (rfidType != null) _result.addAll({"rfidType": rfidType});
    if (sAK != null) _result.addAll({"sAK": sAK});
    if (support4 != null) _result.addAll({"support4": support4});
    if (supportMifare != null) _result.addAll({"supportMifare": supportMifare});
    if (aTQB != null) _result.addAll({"aTQB": aTQB});
    if (aTR != null) _result.addAll({"aTR": aTR});
    if (baudrate1 != null) _result.addAll({"baudrate1": baudrate1});
    if (baudrate2 != null) _result.addAll({"baudrate2": baudrate2});
    if (uID != null) _result.addAll({"uID": uID});

    return _result;
  }
}

class RFIDSessionData {
  int? totalBytesReceived;
  int? totalBytesSent;
  int? status;
  int? extLeSupport;
  int? processTime;
  CardProperties? cardProperties;
  List<AccessControlProcedureType?> accessControls = [];
  List<Application?> applications = [];
  List<SecurityObject?> securityObjects = [];
  List<int?> dataGroups = [];
  List<DataField?> dataFields = [];

  static RFIDSessionData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RFIDSessionData();

    result.totalBytesReceived = jsonObject["totalBytesReceived"];
    result.totalBytesSent = jsonObject["totalBytesSent"];
    result.status = jsonObject["status"];
    result.extLeSupport = jsonObject["extLeSupport"];
    result.processTime = jsonObject["processTime"];
    result.cardProperties = CardProperties.fromJson(jsonObject["cardProperties"]);
    if (jsonObject["accessControls"] != null)
      for (var item in jsonObject["accessControls"])
        result.accessControls.add(AccessControlProcedureType.fromJson(item));
    if (jsonObject["applications"] != null)
      for (var item in jsonObject["applications"])
        result.applications.add(Application.fromJson(item));
    if (jsonObject["securityObjects"] != null)
      for (var item in jsonObject["securityObjects"])
        result.securityObjects.add(SecurityObject.fromJson(item));
    if (jsonObject["dataGroups"] != null)
      for (var item in jsonObject["dataGroups"])
        result.dataGroups.add(item);
    if (jsonObject["dataFields"] != null)
      for (var item in jsonObject["dataFields"])
        result.dataFields.add(DataField.fromJson(item));

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (totalBytesReceived != null) _result.addAll({"totalBytesReceived": totalBytesReceived});
    if (totalBytesSent != null) _result.addAll({"totalBytesSent": totalBytesSent});
    if (status != null) _result.addAll({"status": status});
    if (extLeSupport != null) _result.addAll({"extLeSupport": extLeSupport});
    if (processTime != null) _result.addAll({"processTime": processTime});
    if (cardProperties != null) _result.addAll({"cardProperties": cardProperties});
    _result.addAll({"accessControls": accessControls});
    _result.addAll({"applications": applications});
    _result.addAll({"securityObjects": securityObjects});
    _result.addAll({"dataGroups": dataGroups});
    _result.addAll({"dataFields": dataFields});

    return _result;
  }
}

class DataField {
  String? data;
  int? fieldType;

  static DataField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DataField();

    result.data = jsonObject["data"];
    result.fieldType = jsonObject["fieldType"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (fieldType != null) _result.addAll({"fieldType": fieldType});

    return _result;
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
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (status != null) _result.addAll({"status": status});
    if (typeName != null) _result.addAll({"typeName": typeName});
    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    _result.addAll({"elements": elements});

    return _result;
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
    Map _result = {};

    if (errorLevel != null) _result.addAll({"errorLevel": errorLevel});
    if (columns != null) _result.addAll({"columns": columns});
    if (rows != null) _result.addAll({"rows": rows});

    return _result;
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
    Map _result = {};

    _result.addAll({"fields": fields});

    return _result;
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
    Map _result = {};

    if (barcodeType != null) _result.addAll({"barcodeType": barcodeType});
    if (status != null) _result.addAll({"status": status});
    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (pdf417Info != null) _result.addAll({"pdf417Info": pdf417Info});
    if (data != null) _result.addAll({"data": data});

    return _result;
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
    Map _result = {};

    if (status != null) _result.addAll({"status": status});
    _result.addAll({"checks": checks});

    return _result;
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
    Map _result = {};

    if (status != null) _result.addAll({"status": status});
    if (elementType != null) _result.addAll({"elementType": elementType});
    if (elementDiagnose != null) _result.addAll({"elementDiagnose": elementDiagnose});
    if (elementTypeName != null) _result.addAll({"elementTypeName": elementTypeName});
    if (elementDiagnoseName != null) _result.addAll({"elementDiagnoseName": elementDiagnoseName});

    return _result;
  }
}

class DocumentReaderCompletion {
  int? action;
  DocumentReaderResults? results;
  RegulaException? error;

  static DocumentReaderCompletion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderCompletion();

    result.action = jsonObject["action"];
    result.results = DocumentReaderResults.fromJson(jsonObject["results"]);
    result.error = RegulaException.fromJson(jsonObject["error"]);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (action != null) _result.addAll({"action": action});
    if (results != null) _result.addAll({"results": results});
    if (error != null) _result.addAll({"error": error});

    return _result;
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
    Map _result = {};

    if (notification != null) _result.addAll({"notification": notification});
    if (value != null) _result.addAll({"value": value});

    return _result;
  }
}

class RegulaException {
  int? errorCode;
  String? message;

  static RegulaException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RegulaException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
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
    Map _result = {};

    if (binaryData != null) _result.addAll({"binaryData": binaryData});
    if (resourceType != null) _result.addAll({"resourceType": resourceType});
    if (privateKey != null) _result.addAll({"privateKey": privateKey});

    return _result;
  }
}

class ImageInputParam {
  int? width;
  int? height;
  int? type;
  bool? disableFrameShiftIR;
  bool? doFlipYAxis;

  static ImageInputParam? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageInputParam();

    result.width = jsonObject["width"];
    result.height = jsonObject["height"];
    result.type = jsonObject["type"];
    result.disableFrameShiftIR = jsonObject["disableFrameShiftIR"];
    result.doFlipYAxis = jsonObject["doFlipYAxis"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (width != null) _result.addAll({"width": width});
    if (height != null) _result.addAll({"height": height});
    if (type != null) _result.addAll({"type": type});
    if (disableFrameShiftIR != null) _result.addAll({"disableFrameShiftIR": disableFrameShiftIR});
    if (doFlipYAxis != null) _result.addAll({"doFlipYAxis": doFlipYAxis});

    return _result;
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
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (friendlyName != null) _result.addAll({"friendlyName": friendlyName});
    _result.addAll({"attributes": attributes});

    return _result;
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
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (value != null) _result.addAll({"value": value});

    return _result;
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
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (auxPCD != null) _result.addAll({"auxPCD": auxPCD});
    if (challengePICC != null) _result.addAll({"challengePICC": challengePICC});
    if (hashPK != null) _result.addAll({"hashPK": hashPK});
    if (idPICC != null) _result.addAll({"idPICC": idPICC});

    return _result;
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
    Map _result = {};

    if (overallStatus != null) _result.addAll({"overallStatus": overallStatus});
    if (optical != null) _result.addAll({"optical": optical});
    if (detailsOptical != null) _result.addAll({"detailsOptical": detailsOptical});
    if (rfid != null) _result.addAll({"rfid": rfid});
    if (detailsRFID != null) _result.addAll({"detailsRFID": detailsRFID});
    if (portrait != null) _result.addAll({"portrait": portrait});
    if (stopList != null) _result.addAll({"stopList": stopList});

    return _result;
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
    Map _result = {};

    if (overallStatus != null) _result.addAll({"overallStatus": overallStatus});
    if (mrz != null) _result.addAll({"mrz": mrz});
    if (text != null) _result.addAll({"text": text});
    if (docType != null) _result.addAll({"docType": docType});
    if (security != null) _result.addAll({"security": security});
    if (imageQA != null) _result.addAll({"imageQA": imageQA});
    if (expiry != null) _result.addAll({"expiry": expiry});
    if (vds != null) _result.addAll({"vds": vds});
    if (pagesCount != null) _result.addAll({"pagesCount": pagesCount});

    return _result;
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
    Map _result = {};

    if (pa != null) _result.addAll({"pa": pa});
    if (ca != null) _result.addAll({"ca": ca});
    if (aa != null) _result.addAll({"aa": aa});
    if (ta != null) _result.addAll({"ta": ta});
    if (bac != null) _result.addAll({"bac": bac});
    if (pace != null) _result.addAll({"pace": pace});
    if (overallStatus != null) _result.addAll({"overallStatus": overallStatus});

    return _result;
  }
}

class VDSNCData {
  String? type;
  int? version;
  String? issuingCountry;
  dynamic message;
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
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (version != null) _result.addAll({"version": version});
    if (issuingCountry != null) _result.addAll({"issuingCountry": issuingCountry});
    if (message != null) _result.addAll({"message": message});
    if (signatureAlgorithm != null) _result.addAll({"signatureAlgorithm": signatureAlgorithm});
    if (signature != null) _result.addAll({"signature": signature});
    if (certificate != null) _result.addAll({"certificate": certificate});
    _result.addAll({"certificateChain": certificateChain});
    _result.addAll({"notifications": notifications});

    return _result;
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
    Map _result = {};

    if (data != null) _result.addAll({"data": data});
    if (length != null) _result.addAll({"length": length});
    if (status != null) _result.addAll({"status": status});
    if (type != null) _result.addAll({"type": type});

    return _result;
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
    Map _result = {};

    if (pageIndex != null) _result.addAll({"pageIndex": pageIndex});
    if (light != null) _result.addAll({"light": light});
    if (type != null) _result.addAll({"type": type});
    if (width != null) _result.addAll({"width": width});
    if (height != null) _result.addAll({"height": height});
    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (imgBytes != null) _result.addAll({"imgBytes": imgBytes});

    return _result;
  }
}

class DocReaderDocumentsDatabase {
  String? databaseID;
  String? version;
  String? date;
  String? databaseDescription;
  int? countriesNumber;
  int? documentsNumber;
  int? size;

  static DocReaderDocumentsDatabase? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocReaderDocumentsDatabase();

    result.databaseID = jsonObject["databaseID"];
    result.version = jsonObject["version"];
    result.date = jsonObject["date"];
    result.databaseDescription = jsonObject["databaseDescription"];
    result.countriesNumber = jsonObject["countriesNumber"];
    result.documentsNumber = jsonObject["documentsNumber"];
    result.size = jsonObject["size"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (databaseID != null) _result.addAll({"databaseID": databaseID});
    if (version != null) _result.addAll({"version": version});
    if (date != null) _result.addAll({"date": date});
    if (databaseDescription != null) _result.addAll({"databaseDescription": databaseDescription});
    if (countriesNumber != null) _result.addAll({"countriesNumber": countriesNumber});
    if (documentsNumber != null) _result.addAll({"documentsNumber": documentsNumber});
    if (size != null) _result.addAll({"size": size});

    return _result;
  }
}

class DocumentReaderComparison {
  int? sourceTypeLeft;
  int? sourceTypeRight;
  int? status;

  static DocumentReaderComparison? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderComparison();

    result.sourceTypeLeft = jsonObject["sourceTypeLeft"];
    result.sourceTypeRight = jsonObject["sourceTypeRight"];
    result.status = jsonObject["status"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (sourceTypeLeft != null) _result.addAll({"sourceTypeLeft": sourceTypeLeft});
    if (sourceTypeRight != null) _result.addAll({"sourceTypeRight": sourceTypeRight});
    if (status != null) _result.addAll({"status": status});

    return _result;
  }
}

class DocumentReaderRfidOrigin {
  int? dg;
  int? dgTag;
  int? entryView;
  int? tagEntry;

  static DocumentReaderRfidOrigin? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderRfidOrigin();

    result.dg = jsonObject["dg"];
    result.dgTag = jsonObject["dgTag"];
    result.entryView = jsonObject["entryView"];
    result.tagEntry = jsonObject["tagEntry"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (dg != null) _result.addAll({"dg": dg});
    if (dgTag != null) _result.addAll({"dgTag": dgTag});
    if (entryView != null) _result.addAll({"entryView": entryView});
    if (tagEntry != null) _result.addAll({"tagEntry": tagEntry});

    return _result;
  }
}

class DocumentReaderTextSource {
  int? sourceType;
  String? source;
  int? validityStatus;

  static DocumentReaderTextSource? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderTextSource();

    result.sourceType = jsonObject["sourceType"];
    result.source = jsonObject["source"];
    result.validityStatus = jsonObject["validityStatus"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (sourceType != null) _result.addAll({"sourceType": sourceType});
    if (source != null) _result.addAll({"source": source});
    if (validityStatus != null) _result.addAll({"validityStatus": validityStatus});

    return _result;
  }
}

class DocumentReaderSymbol {
  int? code;
  Rect? rect;
  int? probability;

  static DocumentReaderSymbol? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderSymbol();

    result.code = jsonObject["code"];
    result.rect = Rect.fromJson(jsonObject["rect"]);
    result.probability = jsonObject["probability"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (code != null) _result.addAll({"code": code});
    if (rect != null) _result.addAll({"rect": rect});
    if (probability != null) _result.addAll({"probability": probability});

    return _result;
  }
}

class DocumentReaderValidity {
  int? sourceType;
  int? status;

  static DocumentReaderValidity? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderValidity();

    result.sourceType = jsonObject["sourceType"];
    result.status = jsonObject["status"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (sourceType != null) _result.addAll({"sourceType": sourceType});
    if (status != null) _result.addAll({"status": status});

    return _result;
  }
}

class FaceApiParams {
  String? url;
  String? mode;
  Search? searchParams;
  int? threshold;
  int? serviceTimeout;
  String? proxy;
  String? proxyPassword;
  int? proxyType;

  static FaceApiParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceApiParams();

    result.url = jsonObject["url"];
    result.mode = jsonObject["mode"];
    result.searchParams = Search.fromJson(jsonObject["searchParams"]);
    result.threshold = jsonObject["threshold"];
    result.serviceTimeout = jsonObject["serviceTimeout"];
    result.proxy = jsonObject["proxy"];
    result.proxyPassword = jsonObject["proxyPassword"];
    result.proxyType = jsonObject["proxyType"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (url != null) _result.addAll({"url": url});
    if (mode != null) _result.addAll({"mode": mode});
    if (searchParams != null) _result.addAll({"searchParams": searchParams});
    if (threshold != null) _result.addAll({"threshold": threshold});
    if (serviceTimeout != null) _result.addAll({"serviceTimeout": serviceTimeout});
    if (proxy != null) _result.addAll({"proxy": proxy});
    if (proxyPassword != null) _result.addAll({"proxyPassword": proxyPassword});
    if (proxyType != null) _result.addAll({"proxyType": proxyType});

    return _result;
  }
}

class Search {
  int? limit;
  double? threshold;
  List<int?> groupIds = [];

  static Search? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Search();

    result.limit = jsonObject["limit"];
    result.threshold = jsonObject["threshold"] == null ? null : jsonObject["threshold"].toDouble();
    if (jsonObject["groupIds"] != null)
      for (var item in jsonObject["groupIds"])
        result.groupIds.add(item);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (limit != null) _result.addAll({"limit": limit});
    if (threshold != null) _result.addAll({"threshold": threshold});
    _result.addAll({"groupIds": groupIds});

    return _result;
  }
}

class ImageQA {
  int? dpiThreshold;
  int? angleThreshold;
  bool? focusCheck;
  bool? glaresCheck;
  bool? colornessCheck;
  bool? moireCheck;
  List<int?> expectedPass = [];
  GlaresCheckParams? glaresCheckParams;
  int? documentPositionIndent;

  static ImageQA? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQA();

    result.dpiThreshold = jsonObject["dpiThreshold"];
    result.angleThreshold = jsonObject["angleThreshold"];
    result.focusCheck = jsonObject["focusCheck"];
    result.glaresCheck = jsonObject["glaresCheck"];
    result.colornessCheck = jsonObject["colornessCheck"];
    result.moireCheck = jsonObject["moireCheck"];
    if (jsonObject["expectedPass"] != null)
      for (var item in jsonObject["expectedPass"])
        result.expectedPass.add(item);
    result.glaresCheckParams = GlaresCheckParams.fromJson(jsonObject["glaresCheckParams"]);
    result.documentPositionIndent = jsonObject["documentPositionIndent"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (dpiThreshold != null) _result.addAll({"dpiThreshold": dpiThreshold});
    if (angleThreshold != null) _result.addAll({"angleThreshold": angleThreshold});
    if (focusCheck != null) _result.addAll({"focusCheck": focusCheck});
    if (glaresCheck != null) _result.addAll({"glaresCheck": glaresCheck});
    if (colornessCheck != null) _result.addAll({"colornessCheck": colornessCheck});
    if (moireCheck != null) _result.addAll({"moireCheck": moireCheck});
    _result.addAll({"expectedPass": expectedPass});
    if (glaresCheckParams != null) _result.addAll({"glaresCheckParams": glaresCheckParams});
    if (documentPositionIndent != null) _result.addAll({"documentPositionIndent": documentPositionIndent});

    return _result;
  }
}

class GlaresCheckParams {
  double? imgMarginPart;
  double? maxGlaringPart;

  static GlaresCheckParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new GlaresCheckParams();

    result.imgMarginPart = jsonObject["imgMarginPart"] == null ? null : jsonObject["imgMarginPart"].toDouble();
    result.maxGlaringPart = jsonObject["maxGlaringPart"] == null ? null : jsonObject["maxGlaringPart"].toDouble();

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (imgMarginPart != null) _result.addAll({"imgMarginPart": imgMarginPart});
    if (maxGlaringPart != null) _result.addAll({"maxGlaringPart": maxGlaringPart});

    return _result;
  }
}

class RFIDParams {
  List<int?> paIgnoreNotificationCodes = [];

  static RFIDParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RFIDParams();

    if (jsonObject["paIgnoreNotificationCodes"] != null)
      for (var item in jsonObject["paIgnoreNotificationCodes"])
        result.paIgnoreNotificationCodes.add(item);

    return result;
  }

  Map toJson(){
    Map _result = {};

    _result.addAll({"paIgnoreNotificationCodes": paIgnoreNotificationCodes});

    return _result;
  }
}

class OnlineProcessingConfig {
  int? mode;
  String? url;
  dynamic processParam;
  int? imageFormat;
  double? imageCompressionQuality;

  static OnlineProcessingConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new OnlineProcessingConfig();

    result.mode = jsonObject["mode"];
    result.url = jsonObject["url"];
    result.processParam = jsonObject["processParam"];
    result.imageFormat = jsonObject["imageFormat"];
    result.imageCompressionQuality = jsonObject["imageCompressionQuality"] == null ? null : jsonObject["imageCompressionQuality"].toDouble();

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (mode != null) _result.addAll({"mode": mode});
    if (url != null) _result.addAll({"url": url});
    if (processParam != null) _result.addAll({"processParam": processParam});
    if (imageFormat != null) _result.addAll({"imageFormat": imageFormat});
    if (imageCompressionQuality != null) _result.addAll({"imageCompressionQuality": imageCompressionQuality});

    return _result;
  }
}

class ScannerConfig {
  String? scenario;
  String? livePortrait;
  String? extPortrait;
  OnlineProcessingConfig? onlineProcessingConfig;
  int? cameraId;

  static ScannerConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ScannerConfig();

    result.scenario = jsonObject["scenario"];
    result.livePortrait = jsonObject["livePortrait"];
    result.extPortrait = jsonObject["extPortrait"];
    result.onlineProcessingConfig = OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.cameraId = jsonObject["cameraId"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (scenario != null) _result.addAll({"scenario": scenario});
    if (livePortrait != null) _result.addAll({"livePortrait": livePortrait});
    if (extPortrait != null) _result.addAll({"extPortrait": extPortrait});
    if (onlineProcessingConfig != null) _result.addAll({"onlineProcessingConfig": onlineProcessingConfig});
    if (cameraId != null) _result.addAll({"cameraId": cameraId});

    return _result;
  }
}

class RecognizeConfig {
  String? scenario;
  String? livePortrait;
  String? extPortrait;
  OnlineProcessingConfig? onlineProcessingConfig;
  String? image;
  bool? oneShotIdentification;
  List<String?> images = [];
  List<ImageInputData?> imageInputData = [];

  static RecognizeConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RecognizeConfig();

    result.scenario = jsonObject["scenario"];
    result.livePortrait = jsonObject["livePortrait"];
    result.extPortrait = jsonObject["extPortrait"];
    result.onlineProcessingConfig = OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.image = jsonObject["image"];
    result.oneShotIdentification = jsonObject["oneShotIdentification"];
    if (jsonObject["images"] != null)
      for (var item in jsonObject["images"])
        result.images.add(item);
    if (jsonObject["imageInputData"] != null)
      for (var item in jsonObject["imageInputData"])
        result.imageInputData.add(ImageInputData.fromJson(item));

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (scenario != null) _result.addAll({"scenario": scenario});
    if (livePortrait != null) _result.addAll({"livePortrait": livePortrait});
    if (extPortrait != null) _result.addAll({"extPortrait": extPortrait});
    if (onlineProcessingConfig != null) _result.addAll({"onlineProcessingConfig": onlineProcessingConfig});
    if (image != null) _result.addAll({"image": image});
    if (oneShotIdentification != null) _result.addAll({"oneShotIdentification": oneShotIdentification});
    _result.addAll({"images": images});
    _result.addAll({"imageInputData": imageInputData});

    return _result;
  }
}

class DocumentReaderResults {
  String? videoCaptureSessionId;
  int? chipPage;
  int? irElapsedTime;
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
  int? ppmIn;
  List<DocumentReaderDocumentType?> documentType = [];
  DocumentReaderResultsStatus? status;
  VDSNCData? vdsncData;

  Future<String?> textFieldValueByType(int fieldType) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByType", [rawResult, fieldType]);
  }

  Future<String?> textFieldValueByTypeLcid(int fieldType, int lcid) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByTypeLcid", [rawResult, fieldType, lcid]);
  }

  Future<String?> textFieldValueByTypeSource(int fieldType, int source) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByTypeSource", [rawResult, fieldType, source]);
  }

  Future<String?> textFieldValueByTypeLcidSource(int fieldType, int lcid, int source) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByTypeLcidSource", [rawResult, fieldType, lcid, source]);
  }

  Future<String?> textFieldValueByTypeSourceOriginal(int fieldType, int source, bool original) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByTypeSourceOriginal", [rawResult, fieldType, source, original]);
  }

  Future<String?> textFieldValueByTypeLcidSourceOriginal(int fieldType, int lcid, int source, bool original) async {
    return await DocumentReader._channel.invokeMethod("textFieldValueByTypeLcidSourceOriginal", [rawResult, fieldType, lcid, source, original]);
  }

  Future<DocumentReaderTextField?> textFieldByType(int fieldType) async {
    String? result = await DocumentReader._channel.invokeMethod("textFieldByType", [rawResult, fieldType]);
    if (result == null) return null;
    return DocumentReaderTextField.fromJson(json.decode(result));
  }

  Future<DocumentReaderTextField?> textFieldByTypeLcid(int fieldType, int lcid) async {
    String? result = await DocumentReader._channel.invokeMethod("textFieldByTypeLcid", [rawResult, fieldType, lcid]);
    if (result == null) return null;
    return DocumentReaderTextField.fromJson(json.decode(result));
  }

  Future<DocumentReaderGraphicField?> graphicFieldByTypeSource(int fieldType, int source) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldByTypeSource", [rawResult, fieldType, source]);
    if (result == null) return null;
    return DocumentReaderGraphicField.fromJson(json.decode(result));
  }

  Future<DocumentReaderGraphicField?> graphicFieldByTypeSourcePageIndex(int fieldType, int source, int pageIndex) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldByTypeSourcePageIndex", [rawResult, fieldType, source, pageIndex]);
    if (result == null) return null;
    return DocumentReaderGraphicField.fromJson(json.decode(result));
  }

  Future<DocumentReaderGraphicField?> graphicFieldByTypeSourcePageIndexLight(int fieldType, int source, int pageIndex, int light) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldByTypeSourcePageIndex", [rawResult, fieldType, source, pageIndex, light]);
    if (result == null) return null;
    return DocumentReaderGraphicField.fromJson(json.decode(result));
  }

  Future<Uri?> graphicFieldImageByType(int fieldType) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldImageByType", [rawResult, fieldType]);
    if (result == null) return null;
    return Uri.parse("data:image/png;base64," + result.replaceAll('\n', ''));
  }

  Future<Uri?> graphicFieldImageByTypeSource(int fieldType, int source) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldImageByTypeSource", [rawResult, fieldType, source]);
    if (result == null) return null;
    return Uri.parse("data:image/png;base64," + result.replaceAll('\n', ''));
  }

  Future<Uri?> graphicFieldImageByTypeSourcePageIndex(int fieldType, int source, int pageIndex) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldImageByTypeSourcePageIndex", [rawResult, fieldType, source, pageIndex]);
    if (result == null) return null;
    return Uri.parse("data:image/png;base64," + result.replaceAll('\n', ''));
  }

  Future<Uri?> graphicFieldImageByTypeSourcePageIndexLight(int fieldType, int source, int pageIndex, int light) async {
    String? result = await DocumentReader._channel.invokeMethod("graphicFieldImageByTypeSourcePageIndexLight", [rawResult, fieldType, source, pageIndex, light]);
    if (result == null) return null;
    return Uri.parse("data:image/png;base64," + result.replaceAll('\n', ''));
  }

  Future<String?> containers(List<int> resultType) async {
    return await DocumentReader._channel.invokeMethod("containers", [rawResult, resultType]);
  }

  Future<String?> encryptedContainers() async {
    return await DocumentReader._channel.invokeMethod("encryptedContainers", [rawResult]);
  }

  static DocumentReaderResults? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DocumentReaderResults();

    result.videoCaptureSessionId = jsonObject["videoCaptureSessionId"];
    result.chipPage = jsonObject["chipPage"];
    result.irElapsedTime = jsonObject["irElapsedTime"];
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
    result.ppmIn = jsonObject["ppmIn"];
    if (jsonObject["documentType"] != null)
      for (var item in jsonObject["documentType"])
        result.documentType.add(DocumentReaderDocumentType.fromJson(item));
    result.status = DocumentReaderResultsStatus.fromJson(jsonObject["status"]);
    result.vdsncData = VDSNCData.fromJson(jsonObject["vdsncData"]);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (videoCaptureSessionId != null) _result.addAll({"videoCaptureSessionId": videoCaptureSessionId});
    if (chipPage != null) _result.addAll({"chipPage": chipPage});
    if (irElapsedTime != null) _result.addAll({"irElapsedTime": irElapsedTime});
    if (processingFinishedStatus != null) _result.addAll({"processingFinishedStatus": processingFinishedStatus});
    if (elapsedTime != null) _result.addAll({"elapsedTime": elapsedTime});
    if (elapsedTimeRFID != null) _result.addAll({"elapsedTimeRFID": elapsedTimeRFID});
    if (morePagesAvailable != null) _result.addAll({"morePagesAvailable": morePagesAvailable});
    if (rfidResult != null) _result.addAll({"rfidResult": rfidResult});
    if (highResolution != null) _result.addAll({"highResolution": highResolution});
    if (graphicResult != null) _result.addAll({"graphicResult": graphicResult});
    if (textResult != null) _result.addAll({"textResult": textResult});
    _result.addAll({"documentPosition": documentPosition});
    _result.addAll({"barcodePosition": barcodePosition});
    _result.addAll({"mrzPosition": mrzPosition});
    _result.addAll({"imageQuality": imageQuality});
    if (rawResult != null) _result.addAll({"rawResult": rawResult});
    if (documentReaderNotification != null) _result.addAll({"documentReaderNotification": documentReaderNotification});
    if (rfidSessionData != null) _result.addAll({"rfidSessionData": rfidSessionData});
    if (authenticityResult != null) _result.addAll({"authenticityResult": authenticityResult});
    if (barcodeResult != null) _result.addAll({"barcodeResult": barcodeResult});
    if (ppmIn != null) _result.addAll({"ppmIn": ppmIn});
    _result.addAll({"documentType": documentType});
    if (status != null) _result.addAll({"status": status});
    if (vdsncData != null) _result.addAll({"vdsncData": vdsncData});

    return _result;
  }
}

// Enum

class FontStyle {
  static const int NORMAL = 0;
  static const int BOLD = 1;
  static const int ITALIC = 2;
  static const int BOLD_ITALIC = 3;
}

class ERPRMAuthenticity {
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
  static const int MRZ = 8388608;
  static const int STATUS_ONLY = 0x80000000;
  static const int OVI = 1024;
  static const int LIVENESS = 2097152;
  static const int OCR = 4194304;
}

class ERFIDErrorCodes {
  static const int RFID_ERROR_NO_ERROR = 0x00000001;
  static const int RFID_ERROR_ALREADY_DONE = 0x00000002;
  static const int RFID_ERROR_FAILED = 0xffffffff;
  static const int RFID_ERROR_NO_CHIP_DETECTED = 0x80010001;
  static const int RFID_ERROR_NOT_AVAILABLE = 0x80010002;
  static const int RFID_ERROR_INVALID_PARAMETER = 0x80010004;
  static const int RFID_ERROR_NOT_INITIALIZED = 0x80010005;
  static const int RFID_ERROR_NOT_ENOUGH_MEMORY = 0x80010006;
  static const int RFID_ERROR_INVALID_DIRECTORY = 0x80010008;
  static const int RFID_ERROR_UNKNOWN_COMMAND = 0x80010009;
  static const int RFID_ERROR_FILE_IO_ERROR = 0x8001000A;
  static const int RFID_ERROR_BUSY = 0x8001000B;
  static const int RFID_ERROR_OLD_FIRMWARE = 0x8001000C;
  static const int RFID_ERROR_PCSC_FAILED = 0x80020000;
  static const int RFID_ERROR_PCSC_READER_NOT_AVAILABLE = 0x80020001;
  static const int RFID_ERROR_PCSC_CANT_CONNECT_CARD = 0x80020002;
  static const int RFID_ERROR_PCSC_CARD_IS_NOT_CONNECTED = 0x80020003;
  static const int RFID_ERROR_PCSC_OPERATION_CANCELLED = 0x80020004;
  static const int RFID_ERROR_PCSC_CARD_IS_BUSY = 0x80020005;
  static const int RFID_ERROR_PCSC_FAILED_SCARD = 0x80020006;
  static const int RFID_ERROR_PCSC_EXT_LE_FAILED = 0x80020010;
  static const int RFID_ERROR_LAYER6_SECURITY_MANAGER = 0x86000000;
  static const int RFID_ERROR_LAYER6_APP_SELECTION_FAILURE = 0x86000001;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_MAC_FAIL = 0x86000100;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_ENC_FAIL = 0x86000101;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_FAILURE = 0x86000102;
  static const int RFID_ERROR_LAYER6_MUTUAL_AUTH_FAILURE_DATA = 0x86000103;
  static const int RFID_ERROR_LAYER6_SM_DO_8E_MISSING = 0x86000200;
  static const int RFID_ERROR_LAYER6_SM_DO_87_MISSING = 0x86000201;
  static const int RFID_ERROR_LAYER6_SM_DO_99_MISSING = 0x86000202;
  static const int RFID_ERROR_LAYER6_SM_MAC_INCORRECT = 0x86000203;
  static const int RFID_ERROR_LAYER6_SM_DO_87_INCORRECT = 0x86000204;
  static const int RFID_ERROR_LAYER6_NON_TLV_RESPONSE_DATA = 0x86000300;
  static const int RFID_ERROR_LAYER6_WRONG_RND_ICC_LENGTH = 0x86000301;
  static const int RFID_ERROR_LAYER6_INT_AUTH_FAILURE = 0x86000302;
  static const int RFID_ERROR_LAYER6_MSE_SET_KAT_FAILURE = 0x86000303;
  static const int RFID_ERROR_LAYER6_MSE_SET_DST_FAILURE = 0x86000304;
  static const int RFID_ERROR_LAYER6_PSO_CERTIFICATE_FAILURE = 0x86000305;
  static const int RFID_ERROR_LAYER6_MSE_SET_AT_FAILURE = 0x86000306;
  static const int RFID_ERROR_LAYER6_GET_CHALLENGE_FAILURE = 0x86000307;
  static const int RFID_ERROR_LAYER6_EXT_AUTH_FAILURE = 0x86000308;
  static const int RFID_ERROR_LAYER6_GENERAL_AUTH_FAILURE = 0x86000309;
  static const int RFID_ERROR_LAYER6_FILE_NOT_FOUND = 0x80006A82;
  static const int RFID_ERROR_LAYER6_FILE_EOF1 = 0x80006282;
  static const int RFID_ERROR_LAYER6_FILE_EOF2 = 0x80006B00;
  static const int RFID_ERROR_LAYER6_INCORRECT_PARAMS = 0x80006A80;
  static const int RFID_ERROR_LAYER6_NO_REFERENCE_DATA = 0x80006A88;
  static const int RFID_ERROR_LAYER6_PWD_SUSPEND = 0x800063C1;
  static const int RFID_ERROR_LAYER6_PWD_BLOCKED = 0x800063C0;
  static const int RFID_ERROR_LAYER6_PWD_DEACTIVATED = 0x80006283;
  static const int RFID_ERROR_LAYER6_PWD_BLOCKED2 = 0x80006983;
  static const int RFID_ERROR_LAYER6_PWD_DEACTIVATED2 = 0x80006984;
  static const int RFID_ERROR_LAYER6_PWD_SUSPEND2 = 0x80006985;
  static const int RFID_ERROR_LAYER6_PWD_FAILED = 0x801063C0;
  static const int RFID_ERROR_NOT_PERFORMED = 0x83000000;
  static const int RFID_ERROR_SESSION_IS_CLOSED = 0x83000001;
  static const int RFID_ERROR_SESSION_TERMINAL_UNSUPPORTED_OPERATION = 0x83000002;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_UNKNOWN = 0x83000010;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_BAD_CERTIFICATE = 0x83000011;
  static const int RFID_ERROR_SESSION_TERMINAL_TYPE_NOT_SET = 0x83000012;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_UNKNOWN = 0x83000013;
  static const int RFID_ERROR_Session_Procedure_Type_Unsupported = 0x83000014;
  static const int RFID_ERROR_SESSION_PROCEDURE_TYPE_NOT_SET = 0x83000015;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_UNKNOWN_TYPE = 0x83000016;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_UNSUPPORTED_SM_TYPE = 0x83000017;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_INCORRECT_SM_TYPE = 0x83000018;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_RESTRICTED = 0x83000019;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_INCORRECT_DATA = 0x8300001A;
  static const int RFID_ERROR_SESSION_ACCESS_KEY_NOT_SET = 0x8300001B;
  static const int RFID_ERROR_SESSION_PWD_MANAGEMENT_NOT_AUTHORIZED = 0x8300001C;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_UNKNOWN_TYPE = 0x83000020;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_SM = 0x83000021;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_PACE = 0x83000022;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_CA_KEYS = 0x83000023;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_TA = 0x83000024;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_REQUIRES_CA = 0x83000025;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_INCORRECT_OPTION_CA = 0x83000026;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_CA_FAILED = 0x83000027;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_TA_FAILED = 0x83000028;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_AA_FAILED = 0x83000029;
  static const int RFID_ERROR_SESSION_ACCESS_CONTROL_RI_FAILED = 0x8300002A;
  static const int RFID_ERROR_SESSION_PA_SIGNATURE_CHECK_FAILED = 0x83000030;
  static const int RFID_ERROR_SESSION_PA_HASH_CHECK_FAILED = 0x83000031;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_DATE_OF_EXPIRY = 0x83000040;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_DATE_OF_BIRTH = 0x83000041;
  static const int RFID_ERROR_SESSION_INVALID_AUX_DATA_COMMUNITY_ID = 0x83000042;
  static const int RFID_ERROR_SESSION_E_SIGN_REQUIRES_APP_SELECTION = 0x83000050;
  static const int RFID_ERROR_SESSION_E_SIGN_PIN_NOT_SET = 0x83000051;
  static const int RFID_ERROR_SESSION_E_SIGN_PIN_NOT_VERIFIED = 0x83000052;
  static const int RFID_ERROR_SESSION_INCORRECT_DATA = 0x83000060;
  static const int RFID_ERROR_SESSION_FILE_NOT_ENOUGH_DATA = 0x83010000;
  static const int RFID_ERROR_SESSION_FILE_INCORRECT_DATA = 0x83020000;
  static const int RFID_ERROR_SESSION_FILE_UNEXPECTED_DATA = 0x83030000;
  static const int RFID_ERROR_SESSION_FILE_CONTENTS_UNEXPECTED_DATA = 0x83040000;
  static const int RFID_ERROR_SESSION_FILE_WRONG_TAG = 0x83050000;
  static const int RFID_ERROR_SESSION_FILE_CANT_USE_DATA = 0x83060000;
  static const int RFID_ERROR_SESSION_FILE_CANT_READ_DATA = 0x83070000;
  static const int RFID_ERROR_SESSION_FILE_ACCESS_DENIED = 0x83080000;
  static const int RFID_ERROR_LAYER34_NO_ERROR = 0x84000000;
  static const int RFID_ERROR_LAYER34_TIME_OUT = 0x84010000;
  static const int RFID_ERROR_LAYER34_COLLISION = 0x84020000;
  static const int RFID_ERROR_LAYER34_CRC = 0x84030000;
  static const int RFID_ERROR_LAYER34_DATA_INTEGRITY = 0x84040000;
  static const int RFID_ERROR_LAYER34_DATA_LENGTH = 0x84050000;
  static const int RFID_ERROR_Layer34_RFU = 0x84060000;
  static const int RFID_ERROR_LAYER34_COLLISION_TOO_MANY = 0x84070000;
  static const int RFID_ERROR_LAYER34_PROTOCOL_B = 0x84080000;
  static const int RFID_ERROR_LAYER34_DATA_CONTENTS = 0x84090000;
  static const int RFID_ERROR_LAYER34_PROTOCOL = 0x840A0000;
  static const int RFID_ERROR_LAYER34_GLOBAL_TIME_OUT = 0x840B0000;
  static const int RFID_ERROR_LAYER34_MIFARE_AUTH = 0x840C0000;
  static const int RFID_ERROR_LAYER34_SAM_ERROR = 0x840D0000;
  static const int RFID_ERROR_LAYER34_SAM_COLLISION = 0x840E0000;
  static const int RFID_ERROR_LAYER34_SAM_ACKNOWLEDGE = 0x840F0000;
}

class ELDSParsingErrorCodes {
  static const int ERR_LDS_OK = 0x00000001;
  static const int ERR_LDS_ASN_INCORRECT_DATA = 0x80000001;
  static const int RR_LDS_ASN_NOT_ENOUGH_DATA = 0x80000002;
  static const int ERR_LDS_ASN_CONTENTS_UNEXPECTED_DATA = 0x80000003;
  static const int ERR_LDS_ASN_SIGNED_DATA_INCORRECT_DATA = 0x80000008;
  static const int ERR_LDS_ASN_SIGNED_DATA_ENCAP_CONTENTS_INCORRECT_DATA = 0x80000009;
  static const int ERR_LDS_ASN_SIGNED_DATA_VERSION_INCORRECT_DATA = 0x8000000A;
  static const int ERR_LDS_ASN_SIGNED_DATA_DIGEST_ALGORITHMS_INCORRECT_DATA = 0x80000011;
  static const int ERR_LDS_ASN_LDS_OBJECT_INCORRECT_DATA = 0x80000013;
  static const int ERR_LDS_ASN_LDS_OBJECT_VERSION_INCORRECT_DATA = 0x80000014;
  static const int ERR_LDS_ASN_LDS_OBJECT_DIGEST_ALGORITHM_INCORRECT_DATA = 0x80000015;
  static const int ERR_LDS_ASN_LDS_OBJECT_DG_HASHES_INCORRECT_DATA = 0x80000016;
  static const int ERR_LDS_ASN_LDS_OBJECT_VERSION_INFO_INCORRECT_DATA = 0x80000012;
  static const int ERR_LDS_ASN_CERTIFICATE_INCORRECT_DATA = 0x80000017;
  static const int ERR_LDS_ASN_CERTIFICATE_VERSION_INCORRECT_DATA = 0x80000018;
  static const int ERR_LDS_ASN_CERTIFICATE_SN_INCORRECT_DATA = 0x80000019;
  static const int ERR_LDS_ASN_CERTIFICATE_SIGNATURE_INCORRECT_DATA = 0x8000001A;
  static const int ERR_LDS_ASN_CERTIFICATE_ISSUER_INCORRECT_DATA = 0x8000001B;
  static const int ERR_LDS_ASN_CERTIFICATE_VALIDITY_INCORRECT_DATA = 0x8000001C;
  static const int ERR_LDS_ASN_CERTIFICATE_SUBJECT_INCORRECT_DATA = 0x8000001D;
  static const int ERR_LDS_ASN_CERTIFICATE_SUBJECT_PK_INCORRECT_DATA = 0x8000001E;
  static const int ERR_LDS_ASN_CERTIFICATE_EXTENSIONS_INCORRECT_DATA = 0x8000001F;
  static const int ERR_LDS_ASN_SIGNER_INFO_INCORRECT_DATA = 0x80000020;
  static const int ERR_LDS_ASN_SIGNER_INFO_VERSION_INCORRECT_DATA = 0x80000021;
  static const int ERR_LDS_ASN_SIGNER_INFO_SID_INCORRECT_DATA = 0x80000022;
  static const int ERR_LDS_ASN_SIGNER_INFO_DIGEST_ALG_INCORRECT_DATA = 0x80000023;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGNED_ATTRS_INCORRECT_DATA = 0x80000024;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGN_ALG_INCORRECT_DATA = 0x80000025;
  static const int ERR_LDS_ASN_SIGNER_INFO_SIGNATURE_INCORRECT_DATA = 0x80000026;
  static const int ERR_LDS_ASN_SIGNER_INFO_UNSIGNED_ATTRS_INCORRECT_DATA = 0x80000027;
  static const int ERR_LDS_ICAO_LDS_OBJECT_UNSUPPORTED_DIGEST_ALGORITHM = 0x80000030;
  static const int ERR_LDS_ICAO_SIGNED_DATA_SIGNER_INFOS_EMPTY = 0x80000031;
  static const int ERR_LDS_ICAO_SIGNER_INFO_UNSUPPORTED_DIGEST_ALGORITHM = 0x80000032;
  static const int ERR_LDS_ICAO_SIGNER_INFO_UNSUPPORTED_SIGNATURE_ALGORITHM = 0x80000033;
  static const int ERR_LDS_ICAO_SIGNER_INFO_MESSAGE_DIGEST_ERROR = 0x80000034;
  static const int ERR_LDS_ICAO_SIGNER_INFO_SIGNED_ATTRS_MISSED = 0x80000036;
  static const int ERR_LDS_AUTH_SIGNER_INFO_CANT_FIND_CERTIFICATE = 0x80000035;
  static const int ERR_LDS_AUTH_ERROR = 0x80000050;
  static const int ERR_LDS_AUTH_UNSUPPORTED_SIGNATURE_ALGORITHM = 0x80000051;
  static const int ERR_LDS_AUTH_UNSUPPORTED_PUBLIC_KEY_ALGORITHM = 0x80000052;
  static const int ERR_LDS_AUTH_MESSED_ALGORITHMS = 0x80000053;
  static const int ERR_LDS_AUTH_PUBLIC_KEY_DATA_INVALID = 0x80000054;
  static const int ERR_LDS_AUTH_ALGORITHM_PARAMETERS_DATA_INVALID = 0x80000055;
  static const int ERR_LDS_AUTH_SIGNATURE_DATA_INVALID = 0x80000056;
  static const int ERR_LDS_AUTH_UNSUPPORTED_DIGEST_ALGORITHM = 0x80000057;
  static const int ERR_LDS_AUTH_SIGNATURE_DATA_INCORRECT = 0x80000058;
  static const int ERR_LDS_AUTH_ALGORITHM_PARAMETERS_NOT_DEFINED = 0x80000059;
  static const int ERR_LDS_AUTH_SIGNATURE_CHECK_FAILED = 0x8000005A;
  static const int ERR_LDS_DG_WRONG_TAH = 0x80000070;
  static const int ERR_LDS_DG_CONTENTS_UNEXPECTED_DATA = 0x80000071;
  static const int ERR_LDS_BAP_SYMMETRIC_CYPHER_CANT_INITIALIZE = 0x81000011;
  static const int ERR_LDS_PACE_INFO_NOT_AVAILABLE = 0x81000020;
  static const int ERR_LDS_PACE_SYMMETRIC_CYPHER_CANT_INITIALIZE = 0x81000021;
  static const int ERR_LDS_PACE_KEY_AGREEMENT_CANT_INITIALIZE = 0x81000022;
  static const int ERR_LDS_PACE_EPHEMERAL_KEYS_CANT_CREATE = 0x81000023;
  static const int ERR_LDS_PACE_MAPPING_CANT_DECODE_NONCE = 0x81000024;
  static const int ERR_LDS_PACE_SHARED_SECRET_CANT_CREATE = 0x81000025;
  static const int ERR_LDS_PACE_DOMAIN_PARAMS_UNSUPPORTED_FORMAT = 0x81000026;
  static const int ERR_LDS_PACE_EPHEMERAL_KEYS_INCORRECT = 0x81000027;
  static const int ERR_LDS_PACE_MAPPING_EPHEMERAL_KEYS_INCORRECT = 0x81000028;
  static const int ERR_LDS_PACE_MAPPING_CANT_PERFORM = 0x81000029;
  static const int ERR_LDS_PACE_NON_MATCHING_AUTH_TOKENS = 0x8100002A;
  static const int ERR_LDS_PACE_CAM_DATA_INCORRECT = 0x8100002B;
  static const int ERR_LDS_PACE_CAM_DATA_CANT_VERIFY = 0x8100002C;
  static const int ERR_LDS_PACE_CAM_DATA_NON_MATCHING = 0x8100002D;
  static const int ERR_LDS_PACE_IM_SCHEME_INCORRECT = 0x8100002E;
  static const int ERR_LDS_PACE_IM_RANDOM_MAPPING_FAILED = 0x8100002F;
  static const int ERR_LDS_CA_CANT_FIND_PUBLIC_KEY = 0x81000030;
  static const int ERR_LDS_CA_CANT_FIND_INFO = 0x81000031;
  static const int ERR_LDS_CA_INCORRECT_VERSION = 0x81000032;
  static const int ERR_LDS_CA_CANT_FIND_DOMAIN_PARAMETERS = 0x81000033;
  static const int ERR_LDS_CA_KEY_AGREEMENT_CANT_INITIALIZE = 0x81000034;
  static const int ERR_LDS_CA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = 0x81000035;
  static const int ERR_LDS_CA_EPHEMERAL_KEYS_CANT_CREATE = 0x81000036;
  static const int ERR_LDS_CA_SHARED_SECRET_CANT_CREATE = 0x81000037;
  static const int ERR_LDS_CA_NON_MATCHING_AUTH_TOKENS = 0x81000038;
  static const int ERR_LDS_TA_INCORRECT_VERSION = 0x81000040;
  static const int ERR_LDS_TA_CANT_BUILD_CERTIFICATE_CHAIN = 0x81000041;
  static const int ERR_LDS_TA_CANT_FIND_IS_PRIVATE_KEY = 0x81000042;
  static const int ERR_LDS_TA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = 0x81000043;
  static const int ERR_LDS_TA_SIGNATURE_BUILDING_ERROR = 0x81000044;
  static const int ERR_LDS_TA_INVALID_KEY_ALGORITHM_PARAMETERS = 0x81000045;
  static const int ERR_LDS_AA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = 0x81000050;
  static const int ERR_LDS_AA_PUBLIC_KEY_INCORRECT_DATA = 0x81000051;
  static const int ERR_LDS_AA_PUBLIC_KEY_INCORRECT_PARAMETERS = 0x81000052;
  static const int ERR_LDS_AA_PUBLIC_KEY_UNDEFINED_PARAMETERS = 0x81000053;
  static const int ERR_LDS_AA_SIGNATURE_INCORRECT_DATA = 0x81000054;
  static const int ERR_LDS_AA_UNSUPPORTED_RECOVERY_SCHEME = 0x81000055;
  static const int ERR_LDS_AA_INCORRECT_TRAILER = 0x81000056;
  static const int ERR_LDS_AA_UNSUPPORTED_DIGEST_ALGORITHM = 0x81000057;
  static const int ERR_LDS_RI_SECTOR_KEY_CANT_FIND = 0x81000070;
  static const int ERR_LDS_RI_SECTOR_KEY_INCORRECT_DATA = 0x81000071;
  static const int ERR_LDS_RI_SECTOR_KEY_INCOMPLETE_DATA = 0x81000072;
  static const int ERR_LDS_CV_CERTIFICATE_MISSING_MANDATORY_DATA_PK = 0x81000060;
  static const int ERR_LDS_CV_CERTIFICATE_PUBLIC_KEY_UNSUPPORTED = 0x81000062;
  static const int ERR_LDS_CV_CERTIFICATE_CHAT_UNSUPPORTED_TERMINAL_TYPE = 0x81000063;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_UNSUPPORTED = 0x8100006;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_INVALID_PARAMS = 0x81000065;
  static const int ERR_LDS_CV_CERTIFICATE_INCORRECT_DATA = 0x81000160;
  static const int ERR_LDS_CV_CERTIFICATE_CPI_INCORRECT_DATA = 0x81000161;
  static const int ERR_LDS_CV_CERTIFICATE_CAR_INCORRECT_DATA = 0x81000162;
  static const int ERR_LDS_CV_CERTIFICATE_PUBLIC_KEY_INCORRECT_DATA = 0x81000163;
  static const int ERR_LDS_CV_CERTIFICATE_CHR_INCORRECT_DATA = 0x81000164;
  static const int ERR_LDS_CV_CERTIFICATE_CHAT_INCORRECT_DATA = 0x81000165;
  static const int ERR_LDS_CV_CERTIFICATE_VALID_FROM_INCORRECT_DATA = 0x81000166;
  static const int ERR_LDS_CV_CERTIFICATE_VALID_TO_INCORRECT_DATA = 0x81000167;
  static const int ERR_LDS_CV_CERTIFICATE_EXTENSIONS_INCORRECT_DATA = 0x81000168;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_INCORRECT_DATA = 0x81000169;
  static const int ERR_LDS_CV_CERTIFICATE_PRIVATE_KEY_MISSING = 0x8100016A;
  static const int ERR_LDS_VDS_UNSUPPORTED_VERSION = 0x81000200;
  static const int ERR_LDS_VDS_ISSUING_COUNTRY_SIZE = 0x81000201;
  static const int ERR_LDS_VDS_ISSUING_COUNTRY_INCORRECT_DATA = 0x81000202;
  static const int ERR_LDS_VDS_SIGNER_CERTIFICATE_SIZE = 0x81000203;
  static const int ERR_LDS_VDS_SIGNER_CERTIFICATE_DATA = 0x81000204;
  static const int ERR_LDS_VDS_SIGNATURE_INCORRECT_DATA = 0x81000205;
  static const int ERR_LDS_VDS_NC_INCORRECT_DATA = 0x81000300;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_DATA = 0x81000301;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_HEADER = 0x81000302;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_TYPE = 0x81000303;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_VERSION = 0x81000304;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_ISSUING_COUNTRY = 0x81000305;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_MESSAGE = 0x81000306;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIGNATURE = 0x81000307;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIG_ALGORITHM = 0x81000308;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_CERTIFICATE = 0x81000309;
  static const int ERR_LDS_VDS_NC_MISSING_OR_INCORRECT_SIG_VALUE = 0x8100030A;
}

class ERFIDCertificateType {
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

class RGLMeasureSystem {
  static const int METRIC = 0;
  static const int IMPERIAL = 1;
}

class ERPRMResultType {
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
  static const int RPRM_RESULT_TYPE_INTERNAL_RFID_SESSION = 48;
  static const int RPRM_RESULT_TYPE_INTERNAL_ENCRYPTED_RCL = 49;
  static const int RPRM_RESULT_TYPE_INTERNAL_LICENSE = 50;
  static const int RPRM_RESULT_TYPE_TEXT = 36;
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
  static const int RPRM_RESULT_TYPE_LIVE_PORTRAIT = 32;
  static const int RPRM_RESULT_TYPE_STATUS = 33;
  static const int RPRM_RESULT_TYPE_PORTRAIT_COMPARISON = 34;
  static const int RPRM_RESULT_TYPE_EXT_PORTRAIT = 35;
}

class CameraTypes {
  static const String FRONT = "front";
  static const String BACK = "back";
}

class FrameShapeType {
  static const int LINE = 0;
  static const int CORNER = 1;
}

class ERFIDBaudRate {
  static const int rfbr_106 = 1;
  static const int rfbr_212 = 2;
  static const int rfbr_424 = 4;
  static const int rfbr_848 = 8;
}

class ERPRMFieldVerificationResult {
  static const int RCF_DISABLED = 0;
  static const int RCF_VERIFIED = 1;
  static const int RCF_NOT_VERIFIED = 2;
  static const int RCF_COMPARE_TRUE = 3;
  static const int RCF_COMPARE_FALSE = 4;
}

class DocReaderAction {
  static const int COMPLETE = 0;
  static const int PROCESS = 1;
  static const int MORE_PAGES_AVAILABLE = 2;
  static const int CANCEL = 3;
  static const int ERROR = 4;
  static const int PROCESS_WHITE_FLASHLIGHT = 5;
  static const int TIMEOUT = 6;
  static const int PROCESSING_ON_SERVICE = 7;
  static const int NOTIFICATION = 101;
  static const int PROCESS_WHITE_UV_IMAGES = 102;
  static const int PROCESS_IR_FRAME = 103;
}

class EProcessGLCommands {
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
  static const int ePC_RFID_SetTCCParams = 12522;
  static const int ePC_RFID_SetReprocessingParams = 12523;
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

class ERFIDAuthenticationProcedureType {
  static const int aptUndefined = 0;
  static const int aptStandard = 1;
  static const int aptAdvanced = 2;
  static const int aptGeneral = 3;
}

class DocumentReaderErrorCodes {
  static const int INITIALIZATION_CORE_ABSENT = 0;
  static const int INITIALIZATION_FAILED = 1;
  static const int INCORRECT_SCENARIO = 2;
  static const int NO_RESULT = 3;
  static const int REMOVE_DATABASE = 4;
  static const int FETCHING_DATABASE = 5;
  static const int DB_ID_NOT_FOUND = 6;
  static const int DB_DESCRIPTION_NOT_FOUND = 7;
  static const int SAVE_DB = 8;
  static const int DOWNLOAD_DB_INCORRECT_CHECKSUM = 9;
  static const int DB_DOWNLOAD = 10;
  static const int LICENSE_ABSENT_OR_CORRUPTED = 13;
  static const int LICENSE_INVALID_DATE = 14;
  static const int LICENSE_INVALID_VERSION = 15;
  static const int LICENSE_INVALID_DEVICE_ID = 16;
  static const int LICENSE_INVALID_SYSTEM_OR_APP_ID = 17;
  static const int LICENSE_NO_CAPABILITIES = 18;
  static const int LICENSE_NO_AUTHENTICITY = 19;
  static const int RECORD_PROCESS_INVALID_OUTPUT_URL = 20;
  static const int LICENSE_ONLINE_ERROR = 21;
  static const int LICENSE_NO_DATABASE = 22;
  static const int LICENSE_DATABASE_INCORRECT = 23;
  static const int INVALID_TCC_PARAMS = 24;
  static const int RFID_IN_PROGRESS = 25;
  static const int NATIVE_JAVA_EXCEPTION = 1000;
  static const int BACKEND_ONLINE_PROCESSING = 303;
  static const int WRONG_INPUT = 400;
  static const int STATE_EXCEPTION = 500;
  static const int BLE_EXCEPTION = 600;
  static const int FEATURE_BLUETOOTH_LE_NOT_SUPPORTED = 601;
  static const int APP_BACKGROUND = 700;
  static const int ONLINE_PROCESSING_WRONG_INPUT = 800;
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
  static const String SCENARIO_BARCODE_AND_LOCATE = "BarcodeAndLocate";
}

class ERFIDAccessControlProcedureType {
  static const int ACPT_UNDEFINED = 0;
  static const int ACPT_BAC = 1;
  static const int ACPT_PACE = 2;
  static const int ACPT_CA = 3;
  static const int ACPT_TA = 4;
  static const int ACPT_AA = 5;
  static const int ACPT_RI = 6;
  static const int ACPT_CARD_INFO = 10;
}

class ERFIDNotificationCodes {
  static const int RFID_NOTIFICATION_ERROR = 0x00010000;
  static const int RFID_NOTIFICATION_DOCUMENT_READY = 0x00010001;
  static const int RFID_NOTIFICATION_READ_PROTOCOL4 = 0x00010003;
  static const int RFID_NOTIFICATION_READ_PROTOCOL3 = 0x0001000A;
  static const int RFID_NOTIFICATION_PROGRESS = 0x0001000B;
  static const int RFID_NOTIFICATION_TA_STEP = 0x0001000E;
  static const int RFID_NOTIFICATION_SM_REQUIRED = 0x0001000F;
  static const int RFID_NOTIFICATION_ISO_ERROR = 0x00011000;
  static const int RFID_NOTIFICATION_PA_REQUEST = 0x00013000;
  static const int RFID_NOTIFICATION_SM_ESTABLISHED = 0x0001400F;
  static const int RFID_NOTIFICATION_PCSC_READER_DISCONNECTED = 0x00020000;
  static const int RFID_NOTIFICATION_PCSC_READER_LIST_CHANGED = 0x00020001;
  static const int RFID_NOTIFICATION_PCSC_BYTES_RECEIVED = 0x00020002;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_READING_TIME = 0x00020003;
  static const int RFID_NOTIFICATION_PCSC_DATA_RECEIVED = 0x00020004;
  static const int RFID_NOTIFICATION_PCSC_BYTES_SENT = 0x00020005;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_READING_SPEED = 0x00020006;
  static const int RFID_NOTIFICATION_PCSC_TOTAL_PROCESS_TIME = 0x00020007;
  static const int RFID_NOTIFICATION_PCSC_READER_LIST_CHANGING = 0x00020008;
  static const int RFID_NOTIFICATION_PCSC_EXT_LENGTH_SUPPORT = 0x00020010;
  static const int RFID_NOTIFICATION_PA_CERTIFICATE_CHAIN = 0x00020011;
  static const int RFID_NOTIFICATION_PA_CERTIFICATE_CHAIN_ITEM = 0x00020012;
  static const int RFID_NOTIFICATION_SCENARIO = 0x00020020;
  static const int RFID_NOTIFICATION_PCSC_READING_DATAGROUP = 0x00030000;
  static const int RFID_NOTIFICATION_PCSC_FILE_NOT_FOUND = 0x00040000;
  static const int RFID_NOTIFICATION_PCSC_END_OF_FILE = 0x00050000;
  static const int RFID_NOTIFICATION_PCSC_FILE_ACCESS_DENIED = 0x00060000;
  static const int RFID_NOTIFICATION_PCSC_APPLICATION_SELECTED = 0x00070000;
  static const int RFID_NOTIFICATION_AC_PROCEDURE_START = 0x00080000;
  static const int RFID_NOTIFICATION_AC_PROCEDURE_FINISH = 0x00090000;
  static const int RFID_NOTIFICATION_PA_SECURITY_OBJECT_CHECK = 0x000A0000;
  static const int RFID_NOTIFICATION_PA_FILE_CHECK = 0x000B0000;
  static const int RFID_NOTIFICATION_PCSC_UPDATING_DATAGROUP = 0x000C0000;
  static const int RFID_NOTIFICATION_AUXILIARY_DATA_VALIDATION = 0x000D0000;
  static const int RFID_NOTIFICATION_RI_SECTOR_ID = 0x000E0000;
  static const int RFID_NOTIFICATION_BIOMETRICS_EMPTY_PLACEHOLDER = 0x000F0000;
}

class ERFIDPasswordType {
  static const int PPT_UNKNOWN = 0;
  static const int PPT_MRZ = 1;
  static const int PPT_CAN = 2;
  static const int PPT_PIN = 3;
  static const int PPT_PUK = 4;
  static const int PPT_PIN_ESIGN = 5;
  static const int PPT_SAI = 6;
}

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

class ESignManagementAction {
  static const int smaUndefined = 0;
  static const int smaCreatePIN = 1;
  static const int smaChangePIN = 2;
  static const int smaUnblockPIN = 3;
  static const int smaTerminatePIN = 4;
  static const int smaGenerateKeys = 5;
  static const int smaTerminateKeys = 6;
  static const int smaSignData = 7;
}

class ECheckDiagnose {
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
  static const int FIELD_POS_CORRECTOR_PHOTO_REPLACED = 82;
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
  static const int GLARES_IN_BARCODE_AREA = 144;
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
  static const int HOLO_PHOTO_DOCUMENT_OUTSIDE_FRAME = 187;
  static const int LIVENESS_DEPTH_CHECK_FAILED = 190;
  static const int MRZ_QUALITY_WRONG_SYMBOL_POSITION = 200;
  static const int MRZ_QUALITY_WRONG_BACKGROUND = 201;
  static const int MRZ_QUALITY_WRONG_MRZ_WIDTH = 202;
  static const int MRZ_QUALITY_WRONG_MRZ_HEIGHT = 203;
  static const int MRZ_QUALITY_WRONG_LINE_POSITION = 204;
  static const int MRZ_QUALITY_WRONG_FONT_TYPE = 205;
  static const int OCR_QUALITY_TEXT_POSITION = 220;
  static const int OCR_QUALITY_INVALID_FONT = 221;
  static const int OCR_QUALITY_INVALID_BACKGROUND = 222;
  static const int LAS_INK_INVALID_LINES_FREQUENCY = 230;
  static const int DOC_LIVENESS_ELECTRONIC_DEVICE_DETECTED = 240;
  static const int DOC_LIVENESS_INVALID_BARCODE_BACKGROUND = 241;
  static const int LAST_DIAGNOSE_VALUE = 250;
}

class RFIDDelegate {
  static const int NULL = 0;
  static const int NO_PA = 1;
  static const int FULL = 2;
}

class TextProcessing {
  static const int ocNoChange = 0;
  static const int ocUppercase = 1;
  static const int ocLowercase = 2;
  static const int ocCapital = 3;
}

class ProcessingFinishedStatus {
  static const int NOT_READY = 0;
  static const int READY = 1;
  static const int TIMEOUT = 2;
}

class DocFormat {
  static const int ID1 = 0;
  static const int ID2 = 1;
  static const int ID3 = 2;
  static const int NON = 3;
  static const int A4 = 4;
  static const int ID3_x2 = 5;
  static const int ID2_TURKEY = 6;
  static const int ID1_90 = 10;
  static const int ID1_180 = 11;
  static const int ID1_270 = 12;
  static const int ID2_180 = 13;
  static const int ID3_180 = 14;
  static const int CUSTOM = 1000;
  static const int PHOTO = 1001;
  static const int FLEXIBLE = 1002;
  static const int UNKNOWN = -1;
}

class ELDSParsingNotificationCodes {
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_VERSION = 0x90000001;
  static const int NTF_LDS_ASN_CERTIFICATE_NON_MATCHING_SIGNATURE_ALGORITHM = 0x90000002;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_TIME_CODING = 0x90000003;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_USE_OF_GENERALIZED_TIME = 0x90000004;
  static const int NTF_LDS_ASN_CERTIFICATE_EMPTY_ISSUER = 0x90000005;
  static const int NTF_LDS_ASN_CERTIFICATE_EMPTY_SUBJECT = 0x90000006;
  static const int NTF_LDS_ASN_CERTIFICATE_UNSUPPORTED_CRITICAL_EXTENSION = 0x90000008;
  static const int NTF_LDS_ASN_CERTIFICATE_FORCED_DEFAULT_CSCA_ROLE = 0x9000000E;
  static const int NTF_LDS_ASN_CERTIFICATE_FORCED_DEFAULT_DS_ROLE = 0x9000000F;
  static const int NTF_LDS_ASN_CERTIFICATE_INCORRECT_ISSUER_SUBJECT_DS = 0x90000010;
  static const int NTF_LDS_ASN_CERTIFICATE_DUPLICATING_EXTENSIONS = 0x90000017;
  static const int NTF_LDS_ICAO_CERTIFICATE_VERSION_MISSED = 0x90000200;
  static const int NTF_LDS_ICAO_CERTIFICATE_VERSION_INCORRECT = 0x90000201;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COUNTRY_MISSED = 0x90000202;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COMMON_NAME_MISSED = 0x90000203;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_COUNTRY_NON_COMPLIANT = 0x90000204;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COUNTRY_MISSED = 0x90000205;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COMMON_NAME_MISSED = 0x90000206;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COUNTRY_NON_COMPLIANT = 0x90000207;
  static const int NTF_LDS_ICAO_CERTIFICATE_USING_NON_COMPLIANT_DATA = 0x90000208;
  static const int NTF_LDS_ICAO_CERTIFICATE_UNSUPPORTED_SIGNATURE_ALGORITHM = 0x90000209;
  static const int NTF_LDS_ICAO_CERTIFICATE_UNSUPPORTED_PUBLIC_KEY_ALGORITHM = 0x9000020A;
  static const int NTF_LDS_ICAO_CERTIFICATE_MISSED_EXTENSIONS = 0x9000020B;
  static const int NTF_LDS_ICAO_CERTIFICATE_VALIDITY = 0x9000020C;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_USING_NON_COMPLIANT_DATA = 0x9000020D;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_MISSED = 0x9000020E;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_NOT_CRITICAL = 0x9000020F;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_KEY_USAGE_INCORRECT_DATA = 0x90000210;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_MISSED = 0x90000211;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_USAGE1 = 0x90000212;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_USAGE2 = 0x90000213;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_NOT_CRITICAL = 0x90000214;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_INCORRECT_DATA = 0x90000215;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_PATH_LEN_C_MISSED = 0x90000216;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_BASIC_C_PATH_LEN_C_INCORRECT = 0x90000217;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_NOT_CRITICAL = 0x90000218;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_INCORRECT_USAGE = 0x90000219;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_EXT_KEY_USAGE_INCORRECT_DATA = 0x9000021A;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_MISSED = 0x9000021B;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_INCORRECT_DATA = 0x9000021C;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_AUTH_KEY_ID_KEY_ID_MISSED = 0x9000021D;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_KEY_ID_MISSED = 0x9000021E;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_KEY_ID_INCORRECT_DATA = 0x9000021F;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_MISSED = 0x90000220;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_INCORRECT_DATA = 0x90000221;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_PRIVATE_KEY_UP_EMPTY = 0x90000222;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_MISSED = 0x90000223;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_INCORRECT_DATA = 0x90000224;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_EMPTY = 0x90000225;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_NON_COMPLIANT = 0x90000226;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_CRITICAL = 0x90000228;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_EMPTY = 0x90000229;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_INCORRECT = 0x9000022A;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_SUBJECT_ALT_NAME_DN_NON_COMPLIANT = 0x9000022B;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_MISSED = 0x9000022C;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_INCORRECT_DATA = 0x9000022D;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_EMPTY = 0x9000022E;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_NON_COMPLIANT = 0x9000022F;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_CRITICAL = 0x90000231;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_EMPTY = 0x90000232;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_INCORRECT = 0x90000233;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_ISSUER_ALT_NAME_DN_NON_COMPLIANT = 0x90000234;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_MISSED = 0x90000235;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_INCORRECT_DATA = 0x90000236;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_VERSION = 0x90000237;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_DOC_TYPES = 0x90000238;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_DOC_TYPES_EMPTY = 0x90000239;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_INCORRECT_DATA = 0x9000023A;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_EMPTY = 0x9000023B;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CERT_POLICIES_POLICY_ID_MISSED = 0x9000023C;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_MISSED = 0x9000023D;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_INCORRECT_DATA = 0x9000023E;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_EMPTY = 0x9000023F;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CRL_DIST_POINT_POINT_MISSED = 0x90000240;
  static const int NTF_LDS_ICAO_CERTIFICATE_SN_NON_COMPLIANT = 0x90000241;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_SN_NON_COMPLIANT = 0x90000242;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_SN_NON_COMPLIANT = 0x90000243;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_ATTRIBUTE_NON_COMPLIANT = 0x90000244;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_ATTRIBUTE_NON_COMPLIANT = 0x90000245;
  static const int NTF_LDS_ICAO_CERTIFICATE_ISSUER_SUBJECT_COUNTRY_NON_MATCHING = 0x90000246;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_CSCA_ALT_NAMES_NON_MATCHING = 0x90000247;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_INCORRECT_DATA = 0x90000248;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_NON_COMPLIANT = 0x90000249;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_NAME_CHANGE_CRITICAL = 0x9000024A;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_NON_COMPLIANT = 0x9000024B;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_DOC_TYPE_LIST_CRITICAL = 0x9000024C;
  static const int NTF_LDS_ICAO_CERTIFICATE_EXT_OPTIONAL_CRITICAL = 0x9000024D;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_NON_COMPLIANT = 0x9000024E;
  static const int NTF_LDS_ICAO_CERTIFICATE_SUBJECT_COMMON_NAME_NON_COMPLIANT = 0x9000024F;
  static const int NTF_LDS_ICAO_COM_LDS_VERSION_INCORRECT = 0x90000020;
  static const int NTF_LDS_ICAO_COM_LDS_VERSION_MISSING = 0x90000021;
  static const int NTF_LDS_ICAO_COM_UNICODE_VERSION_INCORRECT = 0x90000022;
  static const int NTF_LDS_ICAO_COM_UNICODE_VERSION_MISSING = 0x90000023;
  static const int NTF_LDS_ICAO_COM_DGPM_INCORRECT = 0x90000024;
  static const int NTF_LDS_ICAO_COM_DGPM_MISSING = 0x90000025;
  static const int NTF_LDS_ICAO_COM_DGPM_UNEXPECTED = 0x90000026;
  static const int NTF_LDS_ICAO_APPLICATION_LDS_VERSION_UNSUPPORTED = 0x90000030;
  static const int NTF_LDS_ICAO_APPLICATION_UNICODE_VERSION_UNSUPPORTED = 0x90000031;
  static const int NTF_LDS_ICAO_APPLICATION_LDS_VERSION_INCONSISTENT = 0x90000032;
  static const int NTF_LDS_ICAO_APPLICATION_UNICODE_VERSION_INCONSISTENT = 0x90000033;
  static const int NTF_LDS_ASN_SIGNED_DATA_OID_INCORRECT = 0x90000100;
  static const int NTF_LDS_ASN_SIGNED_DATA_VERSION_INCORRECT = 0x900001A0;
  static const int NTF_LDS_ASN_SIGNED_DATA_CONTENT_OID_INCORRECT = 0x900001A1;
  static const int NTF_LDS_ICAO_SIGNED_DATA_VERSION_INCORRECT = 0x90000101;
  static const int NTF_LDS_ICAO_SIGNED_DATA_DIGEST_ALGORITHMS_EMPTY = 0x90000102;
  static const int NTF_LDS_ICAO_SIGNED_DATA_DIGEST_ALGORITHMS_UNSUPPORTED = 0x90000103;
  static const int NTF_LDS_ICAO_SIGNED_DATA_SIGNER_INFOS_MULTIPLE_ENTRIES = 0x90000109;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CERTIFICATES_MISSED = 0x900001B0;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CERTIFICATES_EMPTY = 0x900001B1;
  static const int NTF_LDS_ICAO_SIGNED_DATA_CRLS_INCORRECT_USAGE = 0x900001B2;
  static const int NTF_LDS_ICAO_LDS_OBJECT_INCORRECT_CONTENT_OID = 0x90000104;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_NUMBER_INCORRECT = 0x90000105;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_HASH_MISSING = 0x90000106;
  static const int NTF_LDS_ICAO_LDS_OBJECT_DG_HASH_EXTRA = 0x90000107;
  static const int NTF_LDS_ICAO_LDS_OBJECT_VERSION_INCORRECT = 0x90000108;
  static const int NTF_LDS_ICAO_MASTER_LIST_VERSION_INCORRECT = 0x900001C0;
  static const int NTF_LDS_ICAO_DEVIATION_LIST_VERSION_INCORRECT = 0x900001C8;
  static const int NTF_LDS_BSI_DEFECT_LIST_VERSION_INCORRECT = 0x900001D0;
  static const int NTF_LDS_BSI_BLACK_LIST_VERSION_INCORRECT = 0x900001D8;
  static const int NTF_LDS_ASN_SIGNER_INFO_VERSION_INCORRECT = 0x9000010A;
  static const int NTF_LDS_ASN_SIGNER_INFO_SID_INCORRECT_CHOICE = 0x9000010B;
  static const int NTF_LDS_ASN_SIGNER_INFO_SID_DIGEST_ALGORITHM_NOT_LISTED = 0x9000010C;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_MISSING = 0x9000010D;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_DATA = 0x9000010E;
  static const int NTF_LDS_ASN_SIGNER_INFO_MESSAGE_DIGEST_ATTR_Value = 0x9000010F;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_MISSING = 0x90000110;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_DATA = 0x90000111;
  static const int NTF_LDS_ASN_SIGNER_INFO_CONTENT_TYPE_ATTR_VALUE = 0x90000112;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_MISSING = 0x9000011B;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_DATA = 0x9000011C;
  static const int NTF_LDS_ASN_SIGNER_INFO_SIGNING_TIME_ATTR_VALUE = 0x9000011D;
  static const int NTF_LDS_ASN_SIGNER_INFO_LIST_CONTENT_DESCRIPTION_ATTR_MISSING = 0x9000011E;
  static const int NTF_LDS_ASN_SIGNER_INFO_LIST_CONTENT_DESCRIPTION_ATTR_DATA = 0x9000011F;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_VALIDITY = 0x90000115;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_ROOT_IS_NOT_TRUSTED = 0x90000116;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_CANT_FIND_CSCA = 0x90000117;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_REVOKED = 0x90000118;
  static const int NTF_LDS_AUTH_SIGNER_INFO_CERTIFICATE_SIGNATURE_INVALID = 0x90000119;
  static const int NTF_LDS_UNSUPPORTED_IMAGE_FORMAT = 0x9000011A;
  static const int NTF_LDS_MRZ_DOCUMENT_TYPE_UNKNOWN = 0x00022008;
  static const int NTF_LDS_MRZ_ISSUING_STATE_SYNTAX_ERROR = 0x00022009;
  static const int NTF_LDS_MRZ_NAME_IS_VOID = 0x0002200A;
  static const int NTF_LDS_MRZ_NUMBER_INCORRECT_CHECKSUM = 0x0002200D;
  static const int NTF_LDS_MRZ_NATIONALITY_SYNTAX_ERROR = 0x0002200E;
  static const int NTF_LDS_MRZ_DOB_SYNTAX_ERROR = 0x0002200F;
  static const int NTF_LDS_MRZ_DOB_ERROR = 0x00022010;
  static const int NTF_LDS_MRZ_DOB_INCORRECT_CHECKSUM = 0x00022011;
  static const int NTF_LDS_MRZ_SEX_INCORRECT = 0x00022012;
  static const int NTF_LDS_MRZ_DOE_SYNTAX_ERROR = 0x00022013;
  static const int NTF_LDS_MRZ_DOE_ERROR = 0x00022014;
  static const int NTF_LDS_MRZ_DOE_INCORRECT_CHECKSUM = 0x00022015;
  static const int NTF_LDS_MRZ_OPTIONAL_DATA_INCORRECT_CHECKSUM = 0x00022016;
  static const int NTF_LDS_MRZ_INCORRECT_CHECKSUM = 0x00022017;
  static const int NTF_LDS_MRZ_INCORRECT = 0x00022018;
  static const int NTF_LDS_BIOMETRICS_FORMAT_OWNER_MISSING = 0x90010000;
  static const int NTF_LDS_BIOMETRICS_FORMAT_OWNER_INCORRECT = 0x90020000;
  static const int NTF_LDS_BIOMETRICS_FORMAT_TYPE_MISSING = 0x90030000;
  static const int NTF_LDS_BIOMETRICS_FORMAT_TYPE_INCORRECT = 0x90040000;
  static const int NTF_LDS_BIOMETRICS_TYPE_INCORRECT = 0x90050000;
  static const int NTF_LDS_BIOMETRICS_SUB_TYPE_MISSING = 0x90060000;
  static const int NTF_LDS_BIOMETRICS_SUB_TYPE_INCORRECT = 0x90070000;
  static const int NTF_LDS_BIOMETRICS_BDB_IMAGE_MISSING = 0x90080000;
  static const int NTF_LDS_BIOMETRICS_BDB_FORMAT_ID_INCORRECT = 0x90090000;
  static const int NTF_LDS_BIOMETRICS_BDB_VERSION_INCORRECT = 0x900A0000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_LENGTH_INCORRECT = 0x900B0000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_GENDER = 0x90100000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_EYE_COLOR = 0x90110000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_HAIR_COLOR = 0x90120000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_YAW = 0x90130000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_PITCH = 0x90140000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_ROLL = 0x90150000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_YAW = 0x90160000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_PITCH = 0x90170000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_POSE_ANGLE_U_ROLL = 0x90180000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_FACE_IMAGE_TYPE = 0x90190000;
  static const int NTF_LDS_BIOMETRICS_BDB_DATA_IMAGE_DATA_TYPE = 0x901A0000;
  static const int NTF_LDS_SI_PACE_INFO_UNSUPPORTED_STD_PARAMETERS = 0x91000000;
  static const int NTF_LDS_SI_PACE_INFO_DEPRECATED_VERSION = 0x91000001;
  static const int NTF_LDS_SI_PACE_DOMAIN_PARAMS_USING_STD_REF = 0x91000002;
  static const int NTF_LDS_SI_PACE_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = 0x91000003;
  static const int NTF_LDS_SI_CA_INFO_INCORRECT_VERSION = 0x91000004;
  static const int NTF_LDS_SI_CA_PUBLIC_KEY_UNSUPPORTED_ALGORITHM = 0x91000005;
  static const int NTF_LDS_SI_CA_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = 0x91000006;
  static const int NTF_LDS_SI_TA_INFO_INCORRECT_VERSION = 0x91000007;
  static const int NTF_LDS_SI_TA_INFO_FILE_ID_FOR_VERSION2 = 0x91000008;
  static const int NTF_LDS_SI_EID_SECURITY_UNSUPPORTED_DIGEST_ALGORITHM = 0x91000009;
  static const int NTF_LDS_SI_RI_INFO_INCORRECT_VERSION = 0x9100000A;
  static const int NTF_LDS_SI_RI_DOMAIN_PARAMS_UNSUPPORTED_ALGORITHM = 0x9100000B;
  static const int NTF_LDS_SI_AA_INFO_INCORRECT_VERSION = 0x9100000C;
  static const int NTF_LDS_SI_AA_INFO_UNSUPPORTED_ALGORITHM = 0x9100000D;
  static const int NTF_LDS_SI_AA_INFO_INCONSISTENT_ALGORITHM_REFERENCE = 0x9100000E;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NOT_AVAILABLE = 0x91000100;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NO_STD_PARAMETERS = 0x91000101;
  static const int NTF_LDS_SI_STORAGE_PACE_INFO_NO_MATCHING_DOMAIN_PARAMS = 0x91000102;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NOT_AVAILABLE = 0x91000103;
  static const int NTF_LDS_SI_STORAGE_CA_DOMAIN_PARAMS_NO_REQUIRED_OPTION = 0x91000104;
  static const int NTF_LDS_SI_STORAGE_CA_DOMAIN_PARAMS_NOT_AVAILABLE = 0x91000105;
  static const int NTF_LDS_SI_STORAGE_CA_ANONYMOUS_INFOS = 0x91000106;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NO_MATCHING_DOMAIN_PARAMS = 0x91000107;
  static const int NTF_LDS_SI_STORAGE_CA_INFO_NO_MATCHING_PUBLIC_KEY = 0x91000108;
  static const int NTF_LDS_SI_STORAGE_CA_INCORRECT_INFOS_QUANTITY = 0x91000109;
  static const int NTF_LDS_SI_STORAGE_TA_INFO_NOT_AVAILABLE = 0x9100010A;
  static const int NTF_LDS_SI_STORAGE_CARD_INFO_LOCATOR_MULTIPLE_ENTRIES = 0x9100010B;
  static const int NTF_LDS_SI_STORAGE_EID_SECURITY_INFO_MULTIPLE_ENTRIES = 0x9100010C;
  static const int NTF_LDS_SI_STORAGE_PRIVILEGED_TI_MULTIPLE_ENTRIES = 0x9100010D;
  static const int NTF_LDS_SI_STORAGE_PRIVILEGED_TI_INCORRECT_USAGE = 0x9100010E;
  static const int NTF_LDS_SI_STORAGE_RI_DOMAIN_PARAMS_MULTIPLE_ENTRIES = 0x9100010F;
  static const int NTF_LDS_SI_STORAGE_PACE_INFOS_NON_CONSISTANT = 0x91000110;
  static const int NTF_LDS_CV_CERTIFICATE_PROFILE_INCORRECT_VERSION = 0x91000201;
  static const int NTF_LDS_CV_CERTIFICATE_VALIDITY = 0x91000202;
  static const int NTF_LDS_CV_CERTIFICATE_NON_CV_CA_DOMAIN_PARAMETERS = 0x91000203;
  static const int NTF_LDS_CV_CERTIFICATE_PRIVATE_KEY_INCORRECT_VERSION = 0x91000204;
  static const int NTF_LDS_TA_PACE_STATIC_BINDING_USED = 0x91000300;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_VALIDITY = 0x92000115;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_ROOT_IS_NOT_TRUSTED = 0x92000116;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_CANT_FIND_CSCA = 0x92000117;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_REVOKED = 0x92000118;
  static const int NTF_LDS_AUTH_ML_SIGNER_INFO_CERTIFICATE_SIGNATURE_INVALID = 0x92000119;
}

class EImageQualityCheckType {
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

class MRZFormat {
  static const String FORMAT_1X30 = "1x30";
  static const String FORMAT_3X30 = "3x30";
  static const String FORMAT_2X36 = "2x36";
  static const String FORMAT_2X44 = "2x44";
  static const String FORMAT_1X6 = "1x6";
  static const String FORMAT_2X30 = "2x30";
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
  static const int JABCODE = 19;
}

class ERPRMSecurityFeatureType {
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
  static const int SECURITY_FEATURE_TYPE_OCR = 28;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_EXTVS_VISUAL = 29;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_EXTVS_RFID = 30;
  static const int SECURITY_FEATURE_TYPE_PORTRAIT_COMPARISON_EXTVS_LIVE = 31;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_DEPTH = 32;
  static const int SECURITY_FEATURE_TYPE_MICROTEXT = 33;
  static const int SECURITY_FEATURE_TYPE_FLUORESCENT_OBJECT = 34;
  static const int SECURITY_FEATURE_TYPE_LANDMARKS_CHECK = 35;
  static const int SECURITY_FEATURE_TYPE_FACE_PRESENCE = 36;
  static const int SECURITY_FEATURE_TYPE_FACE_ABSENCE = 38;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_SCREEN_CAPTURE = 39;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_ELECTRONIC_DEVICE = 40;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_OVI = 41;
  static const int SECURITY_FEATURE_TYPE_BARCODE_SIZE_CHECK = 42;
  static const int SECURITY_FEATURE_TYPE_LAS_INK = 43;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_MLI = 44;
  static const int SECURITY_FEATURE_TYPE_LIVENESS_BARCODE_BACKGROUND = 45;
}

class OnlineMode {
  static const int MANUAL = 0;
  static const int AUTO = 1;
}

class ERFIDSDKProfilerType {
  static const int SPT_DOC_9303_EDITION_2006 = 0x00000001;
  static const int SPT_DOC_9303_LDS_PKI_MAINTENANCE = 0x00000002;
}

class DiDocType {
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

class HoloAnimationType {
  static const int DocumentHoloAnimationUnknown = 0;
  static const int DocumentHoloAnimationTypeHorizontal = 1;
  static const int DocumentHoloAnimationTypeVertical = 2;
  static const int DocumentHoloAnimationTypeLeftBottomRightTop = 4;
  static const int DocumentHoloAnimationTypeRightBottomLeftTop = 8;
}

class ERequestCommand {
  static const int eReqCmd_RFid_SendData = 100;
  static const int eReqCmd_RFid_Notify = 101;
  static const int eReqCmd_RFid_GetDataForScenario = 102;
  static const int eReqCmd_Torch_GetUVFoto = 200;
  static const int eReqCmd_InternetSend = 300;
  static const int eReqCmd_GetGuid = 400;
  static const int eReqCmd_WltToImage = 401;
}

class ImageFormat {
  static const int PNG = 0;
  static const int JPG = 1;
}

class EGraphicFieldType {
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
}

class RegDeviceConfigType {
  static const int DEVICE_7310 = 1;
}

class CameraMode {
  static const int AUTO = 0;
  static const int CAMERA1 = 1;
  static const int CAMERA2 = 2;
}

class CaptureMode {
  static const int AUTO = 0;
  static const int CAPTURE_VIDEO = 1;
  static const int CAPTURE_FRAME = 2;
}

class ECheckResult {
  static const int CH_CHECK_ERROR = 0;
  static const int CH_CHECK_OK = 1;
  static const int CH_CHECK_WAS_NOT_DONE = 2;
}

class ERFIDTerminalType {
  static const int TET_UNDEFINED = 0;
  static const int TET_INSPECTION_SYSTEM = 1;
  static const int TET_AUTHENTICATION_TERMINAL = 2;
  static const int TET_SIGNATURE_TERMINAL = 3;
  static const int TET_UNAUTHENTICATED_TERMINAL = 4;
}

class ERFIDDataFileType {
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
  static const int DFT_SAM_DATA_MAX = 800 + 32;
  static const int DFT_VDS = 900;
  static const int DFT_VDSNC = 901;
  static const int DFT_USERDEFINED = 1000;
}

class EVisualFieldType {
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
  static const int FT_DLCLASSCODE_RM_FROM = 651;
  static const int FT_DLCLASSCODE_RM_NOTES = 652;
  static const int FT_DLCLASSCODE_RM_TO = 653;
  static const int FT_DLCLASSCODE_PW_FROM = 654;
  static const int FT_DLCLASSCODE_PW_NOTES = 655;
  static const int FT_DLCLASSCODE_PW_TO = 656;
  static const int FT_DLCLASSCODE_EB_FROM = 657;
  static const int FT_DLCLASSCODE_EB_NOTES = 658;
  static const int FT_DLCLASSCODE_EB_TO = 659;
  static const int FT_DLCLASSCODE_EC_FROM = 660;
  static const int FT_DLCLASSCODE_EC_NOTES = 661;
  static const int FT_DLCLASSCODE_EC_TO = 662;
  static const int FT_DLCLASSCODE_EC1_FROM = 663;
  static const int FT_DLCLASSCODE_EC1_NOTES = 664;
  static const int FT_DLCLASSCODE_EC1_TO = 665;
  static const int FT_PLACE_OF_BIRTH_CITY = 666;
  static const int FT_YEAR_OF_BIRTH = 667;
  static const int FT_YEAR_OF_EXPIRY = 668;
  static const int FT_GRANDFATHER_NAME_MATERNAL = 669;
  static const int FT_FIRST_SURNAME = 670;
  static const int FT_MONTH_OF_BIRTH = 671;
  static const int FT_ADDRESS_FLOOR_NUMBER = 672;
  static const int FT_ADDRESS_ENTRANCE = 673;
  static const int FT_ADDRESS_BLOCK_NUMBER = 674;
  static const int FT_ADDRESS_STREET_NUMBER = 675;
  static const int FT_ADDRESS_STREET_TYPE = 676;
  static const int FT_ADDRESS_CITY_SECTOR = 677;
  static const int FT_ADDRESS_COUNTY_TYPE = 678;
  static const int FT_ADDRESS_CITY_TYPE = 679;
  static const int FT_ADDRESS_BUILDING_TYPE = 680;
}

class DocReaderOrientation {
  static const int ALL = 0;
  static const int PORTRAIT = 1;
  static const int LANDSCAPE = 2;
  static const int LANDSCAPE_LEFT = 3;
  static const int LANDSCAPE_RIGHT = 4;
}

class LCID {
  static const int LATIN = 0;
  static const int ABKHAZIAN_CYRILLIC = 10011;
  static const int AFRIKAANS = 1078;
  static const int ALBANIAN = 1052;
  static const int AMHARIC = 1118;
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
  static const int ARABIC_WORLD = 4096;
  static const int AZERI_CYRILIC = 2092;
  static const int AZERI_LATIN = 1068;
  static const int BASQUE = 1069;
  static const int BANK_CARD = 10003;
  static const int BANK_CARD_CVV2 = 10004;
  static const int BANK_CARD_NAME = 10002;
  static const int BANK_CARD_NUMBER = 10000;
  static const int BANK_CARD_VALID_THRU = 10001;
  static const int BELARUSIAN = 1059;
  static const int BENGALI = 2117;
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
  static const int KASHMIRI = 1120;
  static const int KAZAKH = 1087;
  static const int KONKANI = 1111;
  static const int KOREAN = 1042;
  static const int KYRGYZ_CYRILICK = 1088;
  static const int LAO = 1108;
  static const int LATVIAN = 1062;
  static const int LITHUANIAN = 1063;
  static const int MALAY_MALAYSIA = 1086;
  static const int MALAY_BRUNEI_DARUSSALAM = 2110;
  static const int MARATHI = 1102;
  static const int MONGOLIAN_CYRILIC = 1104;
  static const int NORWEGIAN_BOKMAL = 1044;
  static const int NORWEGIAN_NYORSK = 2068;
  static const int PASHTO = 1123;
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
  static const int SINDHI = 2137;
  static const int SINDHI_INDIA = 1113;
  static const int SINHALA = 1115;
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
}

class DocReaderFrame {
  static const String MAX = "max";
  static const String SCENARIO_DEFAULT = "id1";
  static const String NONE = "none";
  static const String DOCUMENT = "document";
}

class ERPRMLights {
  static const int NONE = 0;
  static const int RPRM_LIGHT_UV = 128;
  static const int RPRM_LIGHT_WHITE_FULL = 6;
  static const int RPRM_LIGHT_IR = 16777216;
  static const int RPRM_Light_IR_TOP = 8;
  static const int RPRM_Light_IR_SIDE = 16;
  static const int RPRM_Light_IR_Full = (8 | 16);
  static const int RPRM_LIGHT_OVD = 67108864;
  static const int RPRM_LIGHT_WHITE_FULL_OVD = (6 | 67108864);
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

  static Future<dynamic> isBlePermissionsGranted() async {
    return await _channel.invokeMethod("isBlePermissionsGranted", []);
  }

  static Future<dynamic> startBluetoothService() async {
    return await _channel.invokeMethod("startBluetoothService", []);
  }

  static Future<dynamic> initializeReaderBleDeviceConfig() async {
    return await _channel.invokeMethod("initializeReaderBleDeviceConfig", []);
  }

  static Future<dynamic> getTag() async {
    return await _channel.invokeMethod("getTag", []);
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

  @deprecated
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

  static Future<dynamic> setTag(tag) async {
    return await _channel.invokeMethod("setTag", [tag]);
  }

  static Future<dynamic> checkDatabaseUpdate(databaseId) async {
    return await _channel.invokeMethod("checkDatabaseUpdate", [databaseId]);
  }

  static Future<dynamic> scan(config) async {
    return await _channel.invokeMethod("scan", [config]);
  }

  static Future<dynamic> recognize(config) async {
    return await _channel.invokeMethod("recognize", [config]);
  }

  @deprecated
  static Future<dynamic> recognizeImages(images) async {
    return await _channel.invokeMethod("recognizeImages", [images]);
  }

  @deprecated
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

  static Future<dynamic> initializeReader(config) async {
    return await _channel.invokeMethod("initializeReader", [config]);
  }

  static Future<dynamic> prepareDatabase(databaseType) async {
    return await _channel.invokeMethod("prepareDatabase", [databaseType]);
  }

  @deprecated
  static Future<dynamic> recognizeImage(image) async {
    return await _channel.invokeMethod("recognizeImage", [image]);
  }

  @deprecated
  static Future<dynamic> recognizeData(data) async {
    return await _channel.invokeMethod("recognizeData", [data]);
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

  static Future<dynamic> provideTASignature(signature) async {
    return await _channel.invokeMethod("provideTASignature", [signature]);
  }

  static Future<dynamic> parseCoreResults(json) async {
    return await _channel.invokeMethod("parseCoreResults", [json]);
  }

  static Future<dynamic> setTCCParams(params) async {
    return await _channel.invokeMethod("setTCCParams", [params]);
  }

  @deprecated
  static Future<dynamic> recognizeImageWithOpts(image, options) async {
    return await _channel.invokeMethod("recognizeImageWithOpts", [image, options]);
  }

  static Future<dynamic> recognizeVideoFrame(byteString, params) async {
    return await _channel.invokeMethod("recognizeVideoFrame", [byteString, params]);
  }

  @deprecated
  static Future<dynamic> showScannerWithCameraIDAndOpts(cameraID, options) async {
    return await _channel.invokeMethod("showScannerWithCameraIDAndOpts", [cameraID, options]);
  }

  static Future<dynamic> recognizeImageWithCameraMode(image, mode) async {
    return await _channel.invokeMethod("recognizeImageWithCameraMode", [image, mode]);
  }

  @deprecated
  static Future<dynamic> recognizeImagesWithImageInputs(images) async {
    return await _channel.invokeMethod("recognizeImagesWithImageInputs", [images]);
  }

  static Future<dynamic> setLanguage(language) async {
    return await _channel.invokeMethod("setLanguage", [language]);
  }
}