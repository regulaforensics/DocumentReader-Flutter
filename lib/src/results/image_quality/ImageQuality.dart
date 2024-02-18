//
//  ImageQuality.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure, containing information about single image quality check.
class ImageQuality {
  /// Check result.
  int get featureType => _featureType;
  late int _featureType;

  /// Check result.
  CheckResult get result => _result;
  late CheckResult _result;

  /// Check result type.
  ImageQualityCheckType get type => _type;
  late ImageQualityCheckType _type;

  /// Coordinates of glares.
  List<Rect> get boundRects => _boundRects;
  List<Rect> _boundRects = [];

  /// Allows you to deserialize object.
  static ImageQuality? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageQuality();

    result._featureType = jsonObject["featureType"];
    result._result = CheckResult.getByValue(jsonObject["result"])!;
    result._type = ImageQualityCheckType.getByValue(jsonObject["type"])!;
    for (var item in jsonObject["boundRects"])
      result._boundRects.addSafe(Rect.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "featureType": featureType,
        "result": result.value,
        "type": type.value,
        "boundRects": boundRects.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
