//
//  AuthenticityParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class AuthenticityParams {
  /// This parameter is used to enable document liveness check.
  bool? get useLivenessCheck => _useLivenessCheck;
  bool? _useLivenessCheck;
  set useLivenessCheck(bool? val) {
    _useLivenessCheck = val;
    _set({"useLivenessCheck": val});
  }

  LivenessParams get livenessParams => _livenessParams;
  LivenessParams _livenessParams = LivenessParams();
  set livenessParams(LivenessParams val) {
    (_livenessParams = val)._apply(this);
  }

  bool? get checkUVLuminiscence => _checkUVLuminiscence;
  bool? _checkUVLuminiscence;
  set checkUVLuminiscence(bool? val) {
    _checkUVLuminiscence = val;
    _set({"checkUVLuminiscence": val});
  }

  bool? get checkIRB900 => _checkIRB900;
  bool? _checkIRB900;
  set checkIRB900(bool? val) {
    _checkIRB900 = val;
    _set({"checkIRB900": val});
  }

  bool? get checkImagePatterns => _checkImagePatterns;
  bool? _checkImagePatterns;
  set checkImagePatterns(bool? val) {
    _checkImagePatterns = val;
    _set({"checkImagePatterns": val});
  }

  bool? get checkFibers => _checkFibers;
  bool? _checkFibers;
  set checkFibers(bool? val) {
    _checkFibers = val;
    _set({"checkFibers": val});
  }

  bool? get checkExtMRZ => _checkExtMRZ;
  bool? _checkExtMRZ;
  set checkExtMRZ(bool? val) {
    _checkExtMRZ = val;
    _set({"checkExtMRZ": val});
  }

  bool? get checkExtOCR => _checkExtOCR;
  bool? _checkExtOCR;
  set checkExtOCR(bool? val) {
    _checkExtOCR = val;
    _set({"checkExtOCR": val});
  }

  bool? get checkAxial => _checkAxial;
  bool? _checkAxial;
  set checkAxial(bool? val) {
    _checkAxial = val;
    _set({"checkAxial": val});
  }

  bool? get checkBarcodeFormat => _checkBarcodeFormat;
  bool? _checkBarcodeFormat;
  set checkBarcodeFormat(bool? val) {
    _checkBarcodeFormat = val;
    _set({"checkBarcodeFormat": val});
  }

  bool? get checkIRVisibility => _checkIRVisibility;
  bool? _checkIRVisibility;
  set checkIRVisibility(bool? val) {
    _checkIRVisibility = val;
    _set({"checkIRVisibility": val});
  }

  bool? get checkIPI => _checkIPI;
  bool? _checkIPI;
  set checkIPI(bool? val) {
    _checkIPI = val;
    _set({"checkIPI": val});
  }

  bool? get checkPhotoEmbedding => _checkPhotoEmbedding;
  bool? _checkPhotoEmbedding;
  set checkPhotoEmbedding(bool? val) {
    _checkPhotoEmbedding = val;
    _set({"checkPhotoEmbedding": val});
  }

  bool? get checkPhotoComparison => _checkPhotoComparison;
  bool? _checkPhotoComparison;
  set checkPhotoComparison(bool? val) {
    _checkPhotoComparison = val;
    _set({"checkPhotoComparison": val});
  }

  bool? get checkLetterScreen => _checkLetterScreen;
  bool? _checkLetterScreen;
  set checkLetterScreen(bool? val) {
    _checkLetterScreen = val;
    _set({"checkLetterScreen": val});
  }

  /// Allows you to deserialize object.
  static AuthenticityParams fromJson(jsonObject) {
    if (jsonObject == null) return AuthenticityParams();
    var result = AuthenticityParams();
    result.testSetters = {};

    result.useLivenessCheck = jsonObject["useLivenessCheck"];
    result.livenessParams =
        LivenessParams.fromJson(jsonObject["livenessParams"]);
    result.checkUVLuminiscence = jsonObject["checkUVLuminiscence"];
    result.checkIRB900 = jsonObject["checkIRB900"];
    result.checkImagePatterns = jsonObject["checkImagePatterns"];
    result.checkFibers = jsonObject["checkFibers"];
    result.checkExtMRZ = jsonObject["checkExtMRZ"];
    result.checkExtOCR = jsonObject["checkExtOCR"];
    result.checkAxial = jsonObject["checkAxial"];
    result.checkBarcodeFormat = jsonObject["checkBarcodeFormat"];
    result.checkIRVisibility = jsonObject["checkIRVisibility"];
    result.checkIPI = jsonObject["checkIPI"];
    result.checkPhotoEmbedding = jsonObject["checkPhotoEmbedding"];
    result.checkPhotoComparison = jsonObject["checkPhotoComparison"];
    result.checkLetterScreen = jsonObject["checkLetterScreen"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "useLivenessCheck": useLivenessCheck,
        "livenessParams": livenessParams.toJson(),
        "checkUVLuminiscence": checkUVLuminiscence,
        "checkIRB900": checkIRB900,
        "checkImagePatterns": checkImagePatterns,
        "checkFibers": checkFibers,
        "checkExtMRZ": checkExtMRZ,
        "checkExtOCR": checkExtOCR,
        "checkAxial": checkAxial,
        "checkBarcodeFormat": checkBarcodeFormat,
        "checkIRVisibility": checkIRVisibility,
        "checkIPI": checkIPI,
        "checkPhotoEmbedding": checkPhotoEmbedding,
        "checkPhotoComparison": checkPhotoComparison,
        "checkLetterScreen": checkLetterScreen,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {ProcessParams? directParent}) {
    var parentJson = {"authenticityParams": json};
    var parent = DocumentReader.instance.processParams;
    if (identical(this, parent.authenticityParams)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(ProcessParams parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
