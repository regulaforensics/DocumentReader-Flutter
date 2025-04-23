//
//  File.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class File {
  FileData? get fileData => _fileData;
  FileData? _fileData;

  String? get fileID => _fileID;
  String? _fileID;

  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  RFIDErrorCodes get pAStatus => _pAStatus;
  late RFIDErrorCodes _pAStatus;

  RFIDErrorCodes get readingStatus => _readingStatus;
  late RFIDErrorCodes _readingStatus;

  int get readingTime => _readingTime;
  late int _readingTime;

  RFIDDataFileType get type => _type;
  late RFIDDataFileType _type;

  String get typeName => _typeName;
  late String _typeName;

  List<int> get docFieldsText => _docFieldsText;
  List<int> _docFieldsText = [];

  List<int> get docFieldsGraphics => _docFieldsGraphics;
  List<int> _docFieldsGraphics = [];

  List<int> get docFieldsOriginals => _docFieldsOriginals;
  List<int> _docFieldsOriginals = [];

  SecurityObjectCertificates? get certificates => _certificates;
  SecurityObjectCertificates? _certificates;

  /// Allows you to deserialize object.
  static File? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = File();

    result._readingTime = jsonObject["readingTime"];
    result._type = RFIDDataFileType.getByValue(jsonObject["type"])!;
    result._typeName = jsonObject["typeName"];
    result._pAStatus = RFIDErrorCodes.getByValue(jsonObject["pAStatus"])!;
    result._readingStatus =
        RFIDErrorCodes.getByValue(jsonObject["readingStatus"])!;
    result._fileID = jsonObject["fileID"];
    result._fileData = FileData.fromJson(jsonObject["fileData"]);
    result._certificates = SecurityObjectCertificates.fromJson(
      jsonObject["certificates"],
    );
    result._docFieldsText = _intListFrom(jsonObject["docFieldsText"])!;
    result._docFieldsGraphics = _intListFrom(jsonObject["docFieldsGraphics"])!;
    result._docFieldsOriginals =
        _intListFrom(jsonObject["docFieldsOriginals"])!;
    result._notifications = _intListFrom(jsonObject["notifications"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "fileData": fileData?.toJson(),
        "fileID": fileID,
        "notifications": notifications,
        "pAStatus": pAStatus.value,
        "readingStatus": readingStatus.value,
        "readingTime": readingTime,
        "type": type.value,
        "typeName": typeName,
        "docFieldsText": docFieldsText,
        "docFieldsGraphics": docFieldsGraphics,
        "docFieldsOriginals": docFieldsOriginals,
        "certificates": certificates?.toJson(),
      }.clearNulls();
}
