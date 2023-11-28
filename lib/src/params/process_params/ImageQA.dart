//
//  ImageQA.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Class contains properties to configure image quality.
class ImageQA {
  /// This parameter sets threshold for Image QA check of the presented
  /// document physical dpi. If actual document dpi is below this threshold,
  /// check will fail.
  int? dpiThreshold;

  /// This parameter sets threshold for Image QA check of the presented
  /// document perspective angle in degrees. If actual document perspective
  /// angle is above this threshold, check will fail.
  int? angleThreshold;

  /// This option disabled focus check during performing image quality validation.
  bool? focusCheck;

  /// This option disabled glares check during performing image quality validation.
  bool? glaresCheck;

  /// Parameters for glares image quality validation.
  GlaresCheckParams? glaresCheckParams;

  /// This option disabled colorness check during performing image quality validation.
  bool? colornessCheck;

  /// This option disabled moire patterns check during performing image quality validation.
  bool? moireCheck;

  /// This option controls the quality checks that the image should pass
  /// in order to be considered a valid input during the scanning process.
  List<int>? expectedPass;

  /// Specify the minimum indent from the corners of the document to the borders
  /// of the image. The value reflects the allowed percentage for the indent
  /// relative to the width of the document. If it is detected that the corners
  /// of the document are closer than the specified value, the status will contain
  /// an error in the `DocumentReaderResults.imageQuality.imageQualityList.result` field.
  int? documentPositionIndent;

  /// Allows you to deserialize object.
  static ImageQA? fromJson(jsonObject) {
    var result = new ImageQA();
    if (jsonObject == null) return null;

    result.dpiThreshold = jsonObject["dpiThreshold"];
    result.angleThreshold = jsonObject["angleThreshold"];
    result.focusCheck = jsonObject["focusCheck"];
    result.glaresCheck = jsonObject["glaresCheck"];
    result.colornessCheck = jsonObject["colornessCheck"];
    result.moireCheck = jsonObject["moireCheck"];
    result.expectedPass = jsonObject["expectedPass"];
    result.glaresCheckParams =
        GlaresCheckParams.fromJson(jsonObject["glaresCheckParams"]);
    result.documentPositionIndent = jsonObject["documentPositionIndent"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (dpiThreshold != null) result["dpiThreshold"] = dpiThreshold;
    if (angleThreshold != null) result["angleThreshold"] = angleThreshold;
    if (documentPositionIndent != null)
      result["documentPositionIndent"] = documentPositionIndent;
    if (focusCheck != null) result["focusCheck"] = focusCheck;
    if (glaresCheck != null) result["glaresCheck"] = glaresCheck;
    if (colornessCheck != null) result["colornessCheck"] = colornessCheck;
    if (moireCheck != null) result["moireCheck"] = moireCheck;
    if (expectedPass != null) result["expectedPass"] = expectedPass;
    if (glaresCheckParams != null)
      result["glaresCheckParams"] = glaresCheckParams!.toJson();

    return result;
  }
}
