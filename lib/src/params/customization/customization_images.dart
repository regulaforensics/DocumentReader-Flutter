//
//  CustomizationImages.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CustomizationImages {
  ByteData? get helpAnimation => _helpAnimation;
  ByteData? _helpAnimation;
  set helpAnimation(ByteData? val) {
    _helpAnimation = val;
    _set({"helpAnimation": _dataToBase64(val)});
  }

  ByteData? get livenessAnimation => _livenessAnimation;
  ByteData? _livenessAnimation;
  set livenessAnimation(ByteData? val) {
    _livenessAnimation = val;
    _set({"livenessAnimation": _dataToBase64(val)});
  }

  ByteData? get borderBackground => _borderBackground;
  ByteData? _borderBackground;
  set borderBackground(ByteData? val) {
    _borderBackground = val;
    _set({"borderBackground": _dataToBase64(val)});
  }

  ByteData? get torchButtonOn => _torchButtonOn;
  ByteData? _torchButtonOn;
  set torchButtonOn(ByteData? val) {
    _torchButtonOn = val;
    _set({"torchButtonOn": _dataToBase64(val)});
  }

  ByteData? get torchButtonOff => _torchButtonOff;
  ByteData? _torchButtonOff;
  set torchButtonOff(ByteData? val) {
    _torchButtonOff = val;
    _set({"torchButtonOff": _dataToBase64(val)});
  }

  ByteData? get captureButton => _captureButton;
  ByteData? _captureButton;
  set captureButton(ByteData? val) {
    _captureButton = val;
    _set({"captureButton": _dataToBase64(val)});
  }

  ByteData? get switchButton => _switchButton;
  ByteData? _switchButton;
  set switchButton(ByteData? val) {
    _switchButton = val;
    _set({"switchButton": _dataToBase64(val)});
  }

  ByteData? get closeButton => _closeButton;
  ByteData? _closeButton;
  set closeButton(ByteData? val) {
    _closeButton = val;
    _set({"closeButton": _dataToBase64(val)});
  }

  ByteData? get multipageButton => _multipageButton;
  ByteData? _multipageButton;
  set multipageButton(ByteData? val) {
    _multipageButton = val;
    _set({"multipageButton": _dataToBase64(val)});
  }

  ByteData? get rfidProcessingScreenFailureImage =>
      _rfidProcessingScreenFailureImage;
  ByteData? _rfidProcessingScreenFailureImage;
  set rfidProcessingScreenFailureImage(ByteData? val) {
    _rfidProcessingScreenFailureImage = val;
    _set({"rfidProcessingScreenFailureImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get rfidEnableNfcImage => _rfidEnableNfcImage;
  ByteData? _rfidEnableNfcImage;
  set rfidEnableNfcImage(ByteData? val) {
    _rfidEnableNfcImage = val;
    _set({"rfidEnableNfcImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get rfidDisableNfcImage => _rfidDisableNfcImage;
  ByteData? _rfidDisableNfcImage;
  set rfidDisableNfcImage(ByteData? val) {
    _rfidDisableNfcImage = val;
    _set({"rfidDisableNfcImage": _dataToBase64(val)});
  }

  ByteData? get mdlProcessingScreenFailureImage =>
      _mdlProcessingScreenFailureImage;
  ByteData? _mdlProcessingScreenFailureImage;
  set mdlProcessingScreenFailureImage(ByteData? val) {
    _mdlProcessingScreenFailureImage = val;
    _set({"mdlProcessingScreenFailureImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get mdlEnableNfcImage => _mdlEnableNfcImage;
  ByteData? _mdlEnableNfcImage;
  set mdlEnableNfcImage(ByteData? val) {
    _mdlEnableNfcImage = val;
    _set({"mdlEnableNfcImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get mdlDisableNfcImage => _mdlDisableNfcImage;
  ByteData? _mdlDisableNfcImage;
  set mdlDisableNfcImage(ByteData? val) {
    _mdlDisableNfcImage = val;
    _set({"mdlDisableNfcImage": _dataToBase64(val)});
  }

  ByteData? get nextPageIdCardFront => _nextPageIdCardFront;
  ByteData? _nextPageIdCardFront;
  set nextPageIdCardFront(ByteData? val) {
    _nextPageIdCardFront = val;
    _set({"nextPageIdCardFront": _dataToBase64(val)});
  }

  ByteData? get nextPageIdCardBack => _nextPageIdCardBack;
  ByteData? _nextPageIdCardBack;
  set nextPageIdCardBack(ByteData? val) {
    _nextPageIdCardBack = val;
    _set({"nextPageIdCardBack": _dataToBase64(val)});
  }

  ByteData? get nextPagePassportShift => _nextPagePassportShift;
  ByteData? _nextPagePassportShift;
  set nextPagePassportShift(ByteData? val) {
    _nextPagePassportShift = val;
    _set({"nextPagePassportShift": _dataToBase64(val)});
  }

  ByteData? get nextPagePassportFlipStart => _nextPagePassportFlipStart;
  ByteData? _nextPagePassportFlipStart;
  set nextPagePassportFlipStart(ByteData? val) {
    _nextPagePassportFlipStart = val;
    _set({"nextPagePassportFlipStart": _dataToBase64(val)});
  }

  ByteData? get nextPagePassportFlipClean => _nextPagePassportFlipClean;
  ByteData? _nextPagePassportFlipClean;
  set nextPagePassportFlipClean(ByteData? val) {
    _nextPagePassportFlipClean = val;
    _set({"nextPagePassportFlipClean": _dataToBase64(val)});
  }

  ByteData? get nextPagePassportFlipTop => _nextPagePassportFlipTop;
  ByteData? _nextPagePassportFlipTop;
  set nextPagePassportFlipTop(ByteData? val) {
    _nextPagePassportFlipTop = val;
    _set({"nextPagePassportFlipTop": _dataToBase64(val)});
  }

  ByteData? get nextPagePassportFlipBottom => _nextPagePassportFlipBottom;
  ByteData? _nextPagePassportFlipBottom;
  set nextPagePassportFlipBottom(ByteData? val) {
    _nextPagePassportFlipBottom = val;
    _set({"nextPagePassportFlipBottom": _dataToBase64(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationImages fromJson(jsonObject) {
    var result = CustomizationImages();
    result.testSetters = {};

    result.helpAnimation = _dataFromBase64(jsonObject["helpAnimation"]);
    result.livenessAnimation = _dataFromBase64(jsonObject["livenessAnimation"]);
    result.borderBackground = _dataFromBase64(jsonObject["borderBackground"]);
    result.torchButtonOn = _dataFromBase64(jsonObject["torchButtonOn"]);
    result.torchButtonOff = _dataFromBase64(jsonObject["torchButtonOff"]);
    result.captureButton = _dataFromBase64(jsonObject["captureButton"]);
    result.switchButton = _dataFromBase64(jsonObject["switchButton"]);
    result.closeButton = _dataFromBase64(jsonObject["closeButton"]);
    result.multipageButton = _dataFromBase64(jsonObject["multipageButton"]);
    result.rfidProcessingScreenFailureImage =
        _dataFromBase64(jsonObject["rfidProcessingScreenFailureImage"]);
    result.rfidEnableNfcImage =
        _dataFromBase64(jsonObject["rfidEnableNfcImage"]);
    result.rfidDisableNfcImage =
        _dataFromBase64(jsonObject["rfidDisableNfcImage"]);
    result.mdlProcessingScreenFailureImage =
        _dataFromBase64(jsonObject["mdlProcessingScreenFailureImage"]);
    result.mdlEnableNfcImage = _dataFromBase64(jsonObject["mdlEnableNfcImage"]);
    result.mdlDisableNfcImage =
        _dataFromBase64(jsonObject["mdlDisableNfcImage"]);
    result.nextPageIdCardFront =
        _dataFromBase64(jsonObject["nextPageIdCardFront"]);
    result.nextPageIdCardBack =
        _dataFromBase64(jsonObject["nextPageIdCardBack"]);
    result.nextPagePassportShift =
        _dataFromBase64(jsonObject["nextPagePassportShift"]);
    result.nextPagePassportFlipStart =
        _dataFromBase64(jsonObject["nextPagePassportFlipStart"]);
    result.nextPagePassportFlipClean =
        _dataFromBase64(jsonObject["nextPagePassportFlipClean"]);
    result.nextPagePassportFlipTop =
        _dataFromBase64(jsonObject["nextPagePassportFlipTop"]);
    result.nextPagePassportFlipBottom =
        _dataFromBase64(jsonObject["nextPagePassportFlipBottom"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "helpAnimation": _dataToBase64(
          helpAnimation,
        ),
        "livenessAnimation": _dataToBase64(
          livenessAnimation,
        ),
        "borderBackground": _dataToBase64(
          borderBackground,
        ),
        "torchButtonOn": _dataToBase64(
          torchButtonOn,
        ),
        "torchButtonOff": _dataToBase64(
          torchButtonOff,
        ),
        "captureButton": _dataToBase64(
          captureButton,
        ),
        "switchButton": _dataToBase64(
          switchButton,
        ),
        "closeButton": _dataToBase64(
          closeButton,
        ),
        "multipageButton": _dataToBase64(
          rfidDisableNfcImage,
        ),
        "rfidProcessingScreenFailureImage": _dataToBase64(
          rfidProcessingScreenFailureImage,
        ),
        "rfidEnableNfcImage": _dataToBase64(
          rfidEnableNfcImage,
        ),
        "rfidDisableNfcImage": _dataToBase64(
          rfidDisableNfcImage,
        ),
        "mdlProcessingScreenFailureImage": _dataToBase64(
          mdlProcessingScreenFailureImage,
        ),
        "mdlEnableNfcImage": _dataToBase64(
          mdlEnableNfcImage,
        ),
        "mdlDisableNfcImage": _dataToBase64(
          mdlDisableNfcImage,
        ),
        "nextPageIdCardFront": _dataToBase64(
          nextPageIdCardFront,
        ),
        "nextPageIdCardBack": _dataToBase64(
          nextPageIdCardBack,
        ),
        "nextPagePassportShift": _dataToBase64(
          nextPagePassportShift,
        ),
        "nextPagePassportFlipStart": _dataToBase64(
          nextPagePassportFlipStart,
        ),
        "nextPagePassportFlipClean": _dataToBase64(
          nextPagePassportFlipClean,
        ),
        "nextPagePassportFlipTop": _dataToBase64(
          nextPagePassportFlipTop,
        ),
        "nextPagePassportFlipBottom": _dataToBase64(
          nextPagePassportFlipBottom,
        ),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"images": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.images)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
