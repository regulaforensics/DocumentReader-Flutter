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
  int? get dpiThreshold => _dpiThreshold;
  int? _dpiThreshold;
  set dpiThreshold(int? val) {
    _dpiThreshold = val;
    _set({"dpiThreshold": val});
  }

  /// This parameter sets threshold for Image QA check of the presented
  /// document perspective angle in degrees. If actual document perspective
  /// angle is above this threshold, check will fail.
  int? get angleThreshold => _angleThreshold;
  int? _angleThreshold;
  set angleThreshold(int? val) {
    _angleThreshold = val;
    _set({"angleThreshold": val});
  }

  /// This option disabled focus check during performing image quality validation.
  bool? get focusCheck => _focusCheck;
  bool? _focusCheck;
  set focusCheck(bool? val) {
    _focusCheck = val;
    _set({"focusCheck": val});
  }

  /// This option disabled glares check during performing image quality validation.
  bool? get glaresCheck => _glaresCheck;
  bool? _glaresCheck;
  set glaresCheck(bool? val) {
    _glaresCheck = val;
    _set({"glaresCheck": val});
  }

  /// Parameters for glares image quality validation.
  GlaresCheckParams? get glaresCheckParams => _glaresCheckParams;
  GlaresCheckParams? _glaresCheckParams;
  set glaresCheckParams(GlaresCheckParams? val) {
    _glaresCheckParams = val;
    _set({"glaresCheckParams": val?.toJson()});
  }

  /// This option disabled colorness check during performing image quality validation.
  bool? get colornessCheck => _colornessCheck;
  bool? _colornessCheck;
  set colornessCheck(bool? val) {
    _colornessCheck = val;
    _set({"colornessCheck": val});
  }

  /// This option disabled moire patterns check during performing image quality validation.
  bool? get screenCapture => _screenCapture;
  bool? _screenCapture;
  set screenCapture(bool? val) {
    _screenCapture = val;
    _set({"screenCapture": val});
  }

  /// This option controls the quality checks that the image should pass
  /// in order to be considered a valid input during the scanning process.
  List<int>? get expectedPass => _expectedPass;
  List<int>? _expectedPass;
  set expectedPass(List<int>? val) {
    _expectedPass = val;
    _set({"expectedPass": val});
  }

  /// Specify the minimum indent from the corners of the document to the borders
  /// of the image. The value reflects the allowed percentage for the indent
  /// relative to the width of the document. If it is detected that the corners
  /// of the document are closer than the specified value, the status will contain
  /// an error in the `DocumentReaderResults.imageQuality.imageQualityList.result` field.
  int? get documentPositionIndent => _documentPositionIndent;
  int? _documentPositionIndent;
  set documentPositionIndent(int? val) {
    _documentPositionIndent = val;
    _set({"documentPositionIndent": val});
  }

  /// Set the threshold for an actual document brightness below which the check fails.
  double? get brightnessThreshold => _brightnessThreshold;
  double? _brightnessThreshold;
  set brightnessThreshold(double? val) {
    _brightnessThreshold = val;
    _set({"brightnessThreshold": val});
  }

  /// Allows you to deserialize object.
  static ImageQA fromJson(jsonObject) {
    var result = ImageQA();
    result.testSetters = {};

    result.dpiThreshold = jsonObject["dpiThreshold"];
    result.angleThreshold = jsonObject["angleThreshold"];
    result.focusCheck = jsonObject["focusCheck"];
    result.glaresCheck = jsonObject["glaresCheck"];
    result.colornessCheck = jsonObject["colornessCheck"];
    result.screenCapture = jsonObject["screenCapture"];
    result.expectedPass = jsonObject["expectedPass"];
    result.glaresCheckParams =
        GlaresCheckParams.fromJson(jsonObject["glaresCheckParams"]);
    result.documentPositionIndent = jsonObject["documentPositionIndent"];
    result.brightnessThreshold = _toDouble(jsonObject["brightnessThreshold"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "dpiThreshold": dpiThreshold,
        "angleThreshold": angleThreshold,
        "documentPositionIndent": documentPositionIndent,
        "focusCheck": focusCheck,
        "glaresCheck": glaresCheck,
        "colornessCheck": colornessCheck,
        "screenCapture": screenCapture,
        "expectedPass": expectedPass,
        "glaresCheckParams": glaresCheckParams?.toJson(),
        "brightnessThreshold": brightnessThreshold,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {ProcessParam? parent}) {
    var processParamsJson = {"imageQA": json};
    var processParams = DocumentReader.instance.processParams;
    if (identical(this, processParams.imageQA))
      processParams._set(processParamsJson);
    parent?.testSetters.addAll(processParamsJson);
    testSetters.addAll(json);
  }

  void _apply(ProcessParam parent) => _set(toJson(), parent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
