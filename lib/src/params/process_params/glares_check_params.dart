//
//  GlaresCheckParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class GlaresCheckParams {
  /// Part of margin from the edges of the image that is ignored by glares check.
  /// Example: value 0.07 is 7% of image area is ignored.
  double? get imgMarginPart => _imgMarginPart;
  double? _imgMarginPart;

  /// The maximum allowable part of glared area.
  /// Example: value 0.1 is 10% allowed.
  double? get maxGlaringPart => _maxGlaringPart;
  double? _maxGlaringPart;

  GlaresCheckParams({double? imgMarginPart, double? maxGlaringPart})
    : _imgMarginPart = imgMarginPart,
      _maxGlaringPart = maxGlaringPart;

  /// Allows you to deserialize object.
  static GlaresCheckParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return GlaresCheckParams(
      imgMarginPart: _toDouble(jsonObject["imgMarginPart"]),
      maxGlaringPart: _toDouble(jsonObject["maxGlaringPart"]),
    );
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "imgMarginPart": imgMarginPart,
        "maxGlaringPart": maxGlaringPart,
      }.clearNulls();
}
