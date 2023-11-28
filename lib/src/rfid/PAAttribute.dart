//
//  PAAttribute.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class PAAttribute {
  String? get type => _type;
  String? _type;

  String? get value => _value;
  String? _value;

  @visibleForTesting
  static PAAttribute? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PAAttribute();

    result._type = jsonObject["type"];
    result._value = jsonObject["value"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
