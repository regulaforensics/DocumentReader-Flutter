//
//  PAAttribute.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class PAAttribute {
  String get type => _type;
  late String _type;

  String get value => _value;
  late String _value;

  @visibleForTesting
  static PAAttribute? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PAAttribute();

    result._type = jsonObject["type"] ?? "";
    result._value = jsonObject["value"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      }.clearNulls();
}
