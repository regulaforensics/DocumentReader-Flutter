//
//  Attribute.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class Attribute {
  String? get type => _type;
  String? _type;

  RFIDValue? get value => _value;
  RFIDValue? _value;

  /// Allows you to deserialize object.
  static Attribute? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Attribute();

    result._type = jsonObject["type"];
    result._value = RFIDValue.fromJson(jsonObject["value"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {"type": type, "value": value?.toJson()}.clearNulls();
}
