//
//  Extension.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class Extension {
  String? get data => _data;
  String? _data;

  String? get type => _type;
  String? _type;

  /// Allows you to deserialize object.
  static Extension? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Extension();

    result._data = jsonObject["data"];
    result._type = jsonObject["type"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["data"] = data;
    result["type"] = type;

    return result;
  }
}
