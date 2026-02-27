//
//  CustomizationColors.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CustomizationColors {
  Color? get rfidProcessingScreenBackground => _rfidProcessingScreenBackground;
  Color? _rfidProcessingScreenBackground;
  set rfidProcessingScreenBackground(Color? val) {
    _rfidProcessingScreenBackground = val;
    _set({"rfidProcessingScreenBackground": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenHintLabelText =>
      _rfidProcessingScreenHintLabelText;
  Color? _rfidProcessingScreenHintLabelText;
  set rfidProcessingScreenHintLabelText(Color? val) {
    _rfidProcessingScreenHintLabelText = val;
    _set({"rfidProcessingScreenHintLabelText": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenHintLabelBackground =>
      _rfidProcessingScreenHintLabelBackground;
  Color? _rfidProcessingScreenHintLabelBackground;
  set rfidProcessingScreenHintLabelBackground(Color? val) {
    _rfidProcessingScreenHintLabelBackground = val;
    _set({"rfidProcessingScreenHintLabelBackground": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenProgressLabelText =>
      _rfidProcessingScreenProgressLabelText;
  Color? _rfidProcessingScreenProgressLabelText;
  set rfidProcessingScreenProgressLabelText(Color? val) {
    _rfidProcessingScreenProgressLabelText = val;
    _set({"rfidProcessingScreenProgressLabelText": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenProgressBar =>
      _rfidProcessingScreenProgressBar;
  Color? _rfidProcessingScreenProgressBar;
  set rfidProcessingScreenProgressBar(Color? val) {
    _rfidProcessingScreenProgressBar = val;
    _set({"rfidProcessingScreenProgressBar": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenProgressBarBackground =>
      _rfidProcessingScreenProgressBarBackground;
  Color? _rfidProcessingScreenProgressBarBackground;
  set rfidProcessingScreenProgressBarBackground(Color? val) {
    _rfidProcessingScreenProgressBarBackground = val;
    _set({"rfidProcessingScreenProgressBarBackground": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenResultLabelText =>
      _rfidProcessingScreenResultLabelText;
  Color? _rfidProcessingScreenResultLabelText;
  set rfidProcessingScreenResultLabelText(Color? val) {
    _rfidProcessingScreenResultLabelText = val;
    _set({"rfidProcessingScreenResultLabelText": _intFromColor(val)});
  }

  Color? get rfidProcessingScreenLoadingBar => _rfidProcessingScreenLoadingBar;
  Color? _rfidProcessingScreenLoadingBar;
  set rfidProcessingScreenLoadingBar(Color? val) {
    _rfidProcessingScreenLoadingBar = val;
    _set({"rfidProcessingScreenLoadingBar": _intFromColor(val)});
  }

  /// Android only.
  Color? get rfidEnableNfcTitleText => _rfidEnableNfcTitleText;
  Color? _rfidEnableNfcTitleText;
  set rfidEnableNfcTitleText(Color? val) {
    _rfidEnableNfcTitleText = val;
    _set({"rfidEnableNfcTitleText": _intFromColor(val)});
  }

  /// Android only.
  Color? get rfidEnableNfcDescriptionText => _rfidEnableNfcDescriptionText;
  Color? _rfidEnableNfcDescriptionText;
  set rfidEnableNfcDescriptionText(Color? val) {
    _rfidEnableNfcDescriptionText = val;
    _set({"rfidEnableNfcDescriptionText": _intFromColor(val)});
  }

  /// Android only.
  Color? get rfidEnableNfcButtonText => _rfidEnableNfcButtonText;
  Color? _rfidEnableNfcButtonText;
  set rfidEnableNfcButtonText(Color? val) {
    _rfidEnableNfcButtonText = val;
    _set({"rfidEnableNfcButtonText": _intFromColor(val)});
  }

  /// Android only.
  Color? get rfidEnableNfcButtonBackground => _rfidEnableNfcButtonBackground;
  Color? _rfidEnableNfcButtonBackground;
  set rfidEnableNfcButtonBackground(Color? val) {
    _rfidEnableNfcButtonBackground = val;
    _set({"rfidEnableNfcButtonBackground": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenBackground => _mdlProcessingScreenBackground;
  Color? _mdlProcessingScreenBackground;
  set mdlProcessingScreenBackground(Color? val) {
    _mdlProcessingScreenBackground = val;
    _set({"mdlProcessingScreenBackground": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenHintLabelText =>
      _mdlProcessingScreenHintLabelText;
  Color? _mdlProcessingScreenHintLabelText;
  set mdlProcessingScreenHintLabelText(Color? val) {
    _mdlProcessingScreenHintLabelText = val;
    _set({"mdlProcessingScreenHintLabelText": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenHintLabelBackground =>
      _mdlProcessingScreenHintLabelBackground;
  Color? _mdlProcessingScreenHintLabelBackground;
  set mdlProcessingScreenHintLabelBackground(Color? val) {
    _mdlProcessingScreenHintLabelBackground = val;
    _set({"mdlProcessingScreenHintLabelBackground": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenProgressLabelText =>
      _mdlProcessingScreenProgressLabelText;
  Color? _mdlProcessingScreenProgressLabelText;
  set mdlProcessingScreenProgressLabelText(Color? val) {
    _mdlProcessingScreenProgressLabelText = val;
    _set({"mdlProcessingScreenProgressLabelText": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenResultLabelText =>
      _mdlProcessingScreenResultLabelText;
  Color? _mdlProcessingScreenResultLabelText;
  set mdlProcessingScreenResultLabelText(Color? val) {
    _mdlProcessingScreenResultLabelText = val;
    _set({"mdlProcessingScreenResultLabelText": _intFromColor(val)});
  }

  Color? get mdlProcessingScreenLoadingBar => _mdlProcessingScreenLoadingBar;
  Color? _mdlProcessingScreenLoadingBar;
  set mdlProcessingScreenLoadingBar(Color? val) {
    _mdlProcessingScreenLoadingBar = val;
    _set({"mdlProcessingScreenLoadingBar": _intFromColor(val)});
  }

  /// Android only.
  Color? get mdlEnableNfcTitleText => _mdlEnableNfcTitleText;
  Color? _mdlEnableNfcTitleText;
  set mdlEnableNfcTitleText(Color? val) {
    _mdlEnableNfcTitleText = val;
    _set({"mdlEnableNfcTitleText": _intFromColor(val)});
  }

  /// Android only.
  Color? get mdlEnableNfcDescriptionText => _mdlEnableNfcDescriptionText;
  Color? _mdlEnableNfcDescriptionText;
  set mdlEnableNfcDescriptionText(Color? val) {
    _mdlEnableNfcDescriptionText = val;
    _set({"mdlEnableNfcDescriptionText": _intFromColor(val)});
  }

  /// Android only.
  Color? get mdlEnableNfcButtonText => _mdlEnableNfcButtonText;
  Color? _mdlEnableNfcButtonText;
  set mdlEnableNfcButtonText(Color? val) {
    _mdlEnableNfcButtonText = val;
    _set({"mdlEnableNfcButtonText": _intFromColor(val)});
  }

  /// Android only.
  Color? get mdlEnableNfcButtonBackground => _mdlEnableNfcButtonBackground;
  Color? _mdlEnableNfcButtonBackground;
  set mdlEnableNfcButtonBackground(Color? val) {
    _mdlEnableNfcButtonBackground = val;
    _set({"mdlEnableNfcButtonBackground": _intFromColor(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationColors fromJson(jsonObject) {
    var result = CustomizationColors();
    result.testSetters = {};

    result.rfidProcessingScreenBackground =
        _intToColor(jsonObject["rfidProcessingScreenBackground"]);
    result.rfidProcessingScreenHintLabelText =
        _intToColor(jsonObject["rfidProcessingScreenHintLabelText"]);
    result.rfidProcessingScreenHintLabelBackground =
        _intToColor(jsonObject["rfidProcessingScreenHintLabelBackground"]);
    result.rfidProcessingScreenProgressLabelText =
        _intToColor(jsonObject["rfidProcessingScreenProgressLabelText"]);
    result.rfidProcessingScreenProgressBar =
        _intToColor(jsonObject["rfidProcessingScreenProgressBar"]);
    result.rfidProcessingScreenProgressBarBackground =
        _intToColor(jsonObject["rfidProcessingScreenProgressBarBackground"]);
    result.rfidProcessingScreenResultLabelText =
        _intToColor(jsonObject["rfidProcessingScreenResultLabelText"]);
    result.rfidProcessingScreenLoadingBar =
        _intToColor(jsonObject["rfidProcessingScreenLoadingBar"]);
    result.rfidEnableNfcTitleText =
        _intToColor(jsonObject["rfidEnableNfcTitleText"]);
    result.rfidEnableNfcDescriptionText =
        _intToColor(jsonObject["rfidEnableNfcDescriptionText"]);
    result.rfidEnableNfcButtonText =
        _intToColor(jsonObject["rfidEnableNfcButtonText"]);
    result.rfidEnableNfcButtonBackground =
        _intToColor(jsonObject["rfidEnableNfcButtonBackground"]);
    result.mdlProcessingScreenBackground =
        _intToColor(jsonObject["mdlProcessingScreenBackground"]);
    result.mdlProcessingScreenHintLabelText =
        _intToColor(jsonObject["mdlProcessingScreenHintLabelText"]);
    result.mdlProcessingScreenHintLabelBackground =
        _intToColor(jsonObject["mdlProcessingScreenHintLabelBackground"]);
    result.mdlProcessingScreenProgressLabelText =
        _intToColor(jsonObject["mdlProcessingScreenProgressLabelText"]);
    result.mdlProcessingScreenResultLabelText =
        _intToColor(jsonObject["mdlProcessingScreenResultLabelText"]);
    result.mdlProcessingScreenLoadingBar =
        _intToColor(jsonObject["mdlProcessingScreenLoadingBar"]);
    result.mdlEnableNfcTitleText =
        _intToColor(jsonObject["mdlEnableNfcTitleText"]);
    result.mdlEnableNfcDescriptionText =
        _intToColor(jsonObject["mdlEnableNfcDescriptionText"]);
    result.mdlEnableNfcButtonText =
        _intToColor(jsonObject["mdlEnableNfcButtonText"]);
    result.mdlEnableNfcButtonBackground =
        _intToColor(jsonObject["mdlEnableNfcButtonBackground"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "rfidProcessingScreenBackground": _intFromColor(
          rfidProcessingScreenBackground,
        ),
        "rfidProcessingScreenHintLabelText": _intFromColor(
          rfidProcessingScreenHintLabelText,
        ),
        "rfidProcessingScreenHintLabelBackground": _intFromColor(
          rfidProcessingScreenHintLabelBackground,
        ),
        "rfidProcessingScreenProgressLabelText": _intFromColor(
          rfidProcessingScreenProgressLabelText,
        ),
        "rfidProcessingScreenProgressBar": _intFromColor(
          rfidProcessingScreenProgressBar,
        ),
        "rfidProcessingScreenProgressBarBackground": _intFromColor(
          rfidProcessingScreenProgressBarBackground,
        ),
        "rfidProcessingScreenResultLabelText": _intFromColor(
          rfidProcessingScreenResultLabelText,
        ),
        "rfidProcessingScreenLoadingBar": _intFromColor(
          rfidProcessingScreenLoadingBar,
        ),
        "rfidEnableNfcTitleText": _intFromColor(
          rfidEnableNfcTitleText,
        ),
        "rfidEnableNfcDescriptionText": _intFromColor(
          rfidEnableNfcDescriptionText,
        ),
        "rfidEnableNfcButtonText": _intFromColor(
          rfidEnableNfcButtonText,
        ),
        "rfidEnableNfcButtonBackground": _intFromColor(
          rfidEnableNfcButtonBackground,
        ),
        "mdlProcessingScreenBackground": _intFromColor(
          mdlProcessingScreenBackground,
        ),
        "mdlProcessingScreenHintLabelText": _intFromColor(
          mdlProcessingScreenHintLabelText,
        ),
        "mdlProcessingScreenHintLabelBackground": _intFromColor(
          mdlProcessingScreenHintLabelBackground,
        ),
        "mdlProcessingScreenProgressLabelText": _intFromColor(
          mdlProcessingScreenProgressLabelText,
        ),
        "mdlProcessingScreenResultLabelText": _intFromColor(
          mdlProcessingScreenResultLabelText,
        ),
        "mdlProcessingScreenLoadingBar": _intFromColor(
          mdlProcessingScreenLoadingBar,
        ),
        "mdlEnableNfcTitleText": _intFromColor(
          mdlEnableNfcTitleText,
        ),
        "mdlEnableNfcDescriptionText": _intFromColor(
          mdlEnableNfcDescriptionText,
        ),
        "mdlEnableNfcButtonText": _intFromColor(
          mdlEnableNfcButtonText,
        ),
        "mdlEnableNfcButtonBackground": _intFromColor(
          mdlEnableNfcButtonBackground,
        ),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"colors": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.colors)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
