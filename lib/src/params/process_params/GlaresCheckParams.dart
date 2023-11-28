//
//  GlaresCheckParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class GlaresCheckParams {
  /// Part of margin from the edges of the image that is ignored by glares check.
  /// Example: value 0.07 is 7% of image area is ignored.
  double? imgMarginPart;

  /// The maximum allowable part of glared area.
  /// Example: value 0.1 is 10% allowed.
  double? maxGlaringPart;

  /// Allows you to deserialize object.
  static GlaresCheckParams? fromJson(jsonObject) {
    var result = new GlaresCheckParams();
    if (jsonObject == null) return null;

    result.imgMarginPart = _toDouble(jsonObject["imgMarginPart"]);
    result.maxGlaringPart = _toDouble(jsonObject["maxGlaringPart"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (imgMarginPart != null) result["imgMarginPart"] = imgMarginPart;
    if (maxGlaringPart != null) result["maxGlaringPart"] = maxGlaringPart;

    return result;
  }
}
