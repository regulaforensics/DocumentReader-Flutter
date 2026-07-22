//
//  RFIDValue.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class RFIDValue {
  String? get data => _data;
  String? _data;

  int get length => _length;
  late int _length;

  int get status => _status;
  late int _status;

  int get type => _type;
  late int _type;

  String? get format => _format;
  String? _format;

  /// Allows you to deserialize object.
  static RFIDValue? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDValue();

    result._length = jsonObject["length"];
    result._type = jsonObject["type"];
    result._status = jsonObject["status"];
    result._data = jsonObject["data"];
    result._format = jsonObject["format"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "data": data,
        "length": length,
        "status": status,
        "type": type,
        "format": format,
      }.clearNulls();
}
