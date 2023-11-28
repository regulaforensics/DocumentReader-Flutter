//
//  DataField.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class DataField {
  String get data => _data;
  String _data = "";

  RFIDDataFileType get fieldType => _fieldType;
  RFIDDataFileType _fieldType = RFIDDataFileType.UNSPECIFIED;

  /// Allows you to deserialize object.
  static DataField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DataField();

    result._data = jsonObject["data"];
    var fieldType = RFIDDataFileType.getByValue(jsonObject["fieldType"]);
    if (fieldType == null) return null;
    result._fieldType = fieldType;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["data"] = data;
    result["fieldType"] = fieldType.value;

    return result;
  }
}
