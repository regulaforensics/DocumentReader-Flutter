//
//  FileData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class FileData {
  String? get data => _data;
  String? _data;

  int get length => _length;
  late int _length;

  int get type => _type;
  late int _type;

  int get status => _status;
  late int _status;

  /// Allows you to serialize object.
  static FileData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FileData();

    result._length = jsonObject["length"];
    result._type = jsonObject["type"];
    result._status = jsonObject["status"];
    result._data = jsonObject["data"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["data"] = data;
    result["length"] = length;
    result["type"] = type;
    result["status"] = status;

    return result;
  }
}
