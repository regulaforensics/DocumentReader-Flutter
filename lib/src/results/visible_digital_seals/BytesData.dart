//
//  BytesData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class BytesData {
  String get data => _data;
  late String _data;

  int get length => _length;
  late int _length;

  int get status => _status;
  late int _status;

  int get type => _type;
  late int _type;

  /// Allows you to deserialize object.
  static BytesData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = BytesData();

    result._data = jsonObject["data"];
    result._length = jsonObject["length"];
    result._status = jsonObject["status"];
    result._type = jsonObject["type"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "data": data,
        "length": length,
        "status": status,
        "type": type,
      }.clearNulls();
}
