//
//  Rect.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class Rect {
  int get bottom => _bottom;
  late int _bottom;

  int get top => _top;
  late int _top;

  int get left => _left;
  late int _left;

  int get right => _right;
  late int _right;

  /// Allows you to deserialize object.
  static Rect? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Rect();

    result._bottom = jsonObject["bottom"];
    result._top = jsonObject["top"];
    result._left = jsonObject["left"];
    result._right = jsonObject["right"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {"bottom": bottom, "top": top, "left": left, "right": right}.clearNulls();
}
