//
//  ImageQualityCheckType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

enum ImageQualityCheckType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Glares presence check.
  IMAGE_GLARES(0),

  /// Focus quality check.
  IMAGE_FOCUS(1),

  /// Image resolution check.
  IMAGE_RESOLUTION(2),

  /// Image colorness check.
  IMAGE_COLORNESS(3),

  /// Image perspective check, i.e. the deviation of the corners of the document
  /// from the value of 90 degrees is checked.
  PERSPECTIVE(4),

  /// Image quality check if the whole document page is completely within the image.
  BOUNDS(5),

  /// Image moire check.
  SCREEN_CAPTURE(6),

  /// Portrait image check.
  PORTRAIT(7),

  /// Handwritten image check.
  HANDWRITTEN(8),

  /// Signals whether the document image is bright enough.
  BRIGHTNESS(9);

  const ImageQualityCheckType(this.value);
  final int value;

  Future<String> getTranslation() async {
    return await _bridge.invokeMethod("getTranslation", [
      runtimeType.toString(),
      value,
    ]);
  }

  static ImageQualityCheckType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ImageQualityCheckType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ImageQualityCheckType.UNKNOWN;
    }
  }

  static List<ImageQualityCheckType>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<ImageQualityCheckType> list = [];
    for (int item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}
