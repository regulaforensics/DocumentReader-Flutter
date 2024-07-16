//
//  CustomizationColors.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CustomizationColors {
  Color get rfidProcessingScreenBackground => _rfidProcessingScreenBackground;
  late Color _rfidProcessingScreenBackground;
  set rfidProcessingScreenBackground(Color val) {
    _rfidProcessingScreenBackground = val;
    _set({"rfidProcessingScreenBackground": _intFromColor(val)});
  }

  Color get rfidProcessingScreenHintLabelText =>
      _rfidProcessingScreenHintLabelText;
  late Color _rfidProcessingScreenHintLabelText;
  set rfidProcessingScreenHintLabelText(Color val) {
    _rfidProcessingScreenHintLabelText = val;
    _set({"rfidProcessingScreenHintLabelText": _intFromColor(val)});
  }

  Color get rfidProcessingScreenHintLabelBackground =>
      _rfidProcessingScreenHintLabelBackground;
  late Color _rfidProcessingScreenHintLabelBackground;
  set rfidProcessingScreenHintLabelBackground(Color val) {
    _rfidProcessingScreenHintLabelBackground = val;
    _set({"rfidProcessingScreenHintLabelBackground": _intFromColor(val)});
  }

  Color get rfidProcessingScreenProgressLabelText =>
      _rfidProcessingScreenProgressLabelText;
  late Color _rfidProcessingScreenProgressLabelText;
  set rfidProcessingScreenProgressLabelText(Color val) {
    _rfidProcessingScreenProgressLabelText = val;
    _set({"rfidProcessingScreenProgressLabelText": _intFromColor(val)});
  }

  Color get rfidProcessingScreenProgressBar => _rfidProcessingScreenProgressBar;
  late Color _rfidProcessingScreenProgressBar;
  set rfidProcessingScreenProgressBar(Color val) {
    _rfidProcessingScreenProgressBar = val;
    _set({"rfidProcessingScreenProgressBar": _intFromColor(val)});
  }

  Color get rfidProcessingScreenProgressBarBackground =>
      _rfidProcessingScreenProgressBarBackground;
  late Color _rfidProcessingScreenProgressBarBackground;
  set rfidProcessingScreenProgressBarBackground(Color val) {
    _rfidProcessingScreenProgressBarBackground = val;
    _set({"rfidProcessingScreenProgressBarBackground": _intFromColor(val)});
  }

  Color get rfidProcessingScreenResultLabelText =>
      _rfidProcessingScreenResultLabelText;
  late Color _rfidProcessingScreenResultLabelText;
  set rfidProcessingScreenResultLabelText(Color val) {
    _rfidProcessingScreenResultLabelText = val;
    _set({"rfidProcessingScreenResultLabelText": _intFromColor(val)});
  }

  Color get rfidProcessingScreenLoadingBar => _rfidProcessingScreenLoadingBar;
  late Color _rfidProcessingScreenLoadingBar;
  set rfidProcessingScreenLoadingBar(Color val) {
    _rfidProcessingScreenLoadingBar = val;
    _set({"rfidProcessingScreenLoadingBar": _intFromColor(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationColors fromJson(jsonObject) {
    var result = CustomizationColors();
    result.testSetters = {};

    result.rfidProcessingScreenBackground =
        _intToColor(jsonObject["rfidProcessingScreenBackground"])!;
    result.rfidProcessingScreenHintLabelText =
        _intToColor(jsonObject["rfidProcessingScreenHintLabelText"])!;
    result.rfidProcessingScreenHintLabelBackground =
        _intToColor(jsonObject["rfidProcessingScreenHintLabelBackground"])!;
    result.rfidProcessingScreenProgressLabelText =
        _intToColor(jsonObject["rfidProcessingScreenProgressLabelText"])!;
    result.rfidProcessingScreenProgressBar =
        _intToColor(jsonObject["rfidProcessingScreenProgressBar"])!;
    result.rfidProcessingScreenProgressBarBackground =
        _intToColor(jsonObject["rfidProcessingScreenProgressBarBackground"])!;
    result.rfidProcessingScreenResultLabelText =
        _intToColor(jsonObject["rfidProcessingScreenResultLabelText"])!;
    result.rfidProcessingScreenLoadingBar =
        _intToColor(jsonObject["rfidProcessingScreenLoadingBar"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "rfidProcessingScreenBackground":
            _intFromColor(rfidProcessingScreenBackground),
        "rfidProcessingScreenHintLabelText":
            _intFromColor(rfidProcessingScreenHintLabelText),
        "rfidProcessingScreenHintLabelBackground":
            _intFromColor(rfidProcessingScreenHintLabelBackground),
        "rfidProcessingScreenProgressLabelText":
            _intFromColor(rfidProcessingScreenProgressLabelText),
        "rfidProcessingScreenProgressBar":
            _intFromColor(rfidProcessingScreenProgressBar),
        "rfidProcessingScreenProgressBarBackground":
            _intFromColor(rfidProcessingScreenProgressBarBackground),
        "rfidProcessingScreenResultLabelText":
            _intFromColor(rfidProcessingScreenResultLabelText),
        "rfidProcessingScreenLoadingBar":
            _intFromColor(rfidProcessingScreenLoadingBar),
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
