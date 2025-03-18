//
//  Symbol.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure describing single value of the field.
class Symbol {
  /// ASCII code of symbol.
  int get code => _code;
  late int _code;

  /// Bounds result of the particular value.
  Rect? get rect => _rect;
  Rect? _rect;

  /// Symbol recognition probability (0–100, %).
  int get probability => _probability;
  late int _probability;

  /// Allows you to deserialize object.
  static Symbol? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Symbol();

    result._code = jsonObject["code"];
    result._rect = Rect.fromJson(jsonObject["rect"]);
    result._probability = jsonObject["probability"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "rect": rect?.toJson(),
        "code": code,
        "probability": probability,
      }.clearNulls();
}
