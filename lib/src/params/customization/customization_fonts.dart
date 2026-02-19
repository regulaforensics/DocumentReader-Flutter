//
//  CustomizationFonts.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CustomizationFonts {
  Font? get rfidProcessingScreenHintLabel => _rfidProcessingScreenHintLabel;
  Font? _rfidProcessingScreenHintLabel;
  set rfidProcessingScreenHintLabel(Font? val) {
    _rfidProcessingScreenHintLabel = val;
    _set({"rfidProcessingScreenHintLabel": val?.toJson()});
  }

  Font? get rfidProcessingScreenProgressLabel =>
      _rfidProcessingScreenProgressLabel;
  Font? _rfidProcessingScreenProgressLabel;
  set rfidProcessingScreenProgressLabel(Font? val) {
    _rfidProcessingScreenProgressLabel = val;
    _set({"rfidProcessingScreenProgressLabel": val?.toJson()});
  }

  Font? get rfidProcessingScreenResultLabel => _rfidProcessingScreenResultLabel;
  Font? _rfidProcessingScreenResultLabel;
  set rfidProcessingScreenResultLabel(Font? val) {
    _rfidProcessingScreenResultLabel = val;
    _set({"rfidProcessingScreenResultLabel": val?.toJson()});
  }

  /// Android only.
  Font? get rfidEnableNfcTitleText => _rfidEnableNfcTitleText;
  Font? _rfidEnableNfcTitleText;
  set rfidEnableNfcTitleText(Font? val) {
    _rfidEnableNfcTitleText = val;
    _set({"rfidEnableNfcTitleText": val?.toJson()});
  }

  /// Android only.
  Font? get rfidEnableNfcDescriptionText => _rfidEnableNfcDescriptionText;
  Font? _rfidEnableNfcDescriptionText;
  set rfidEnableNfcDescriptionText(Font? val) {
    _rfidEnableNfcDescriptionText = val;
    _set({"rfidEnableNfcDescriptionText": val?.toJson()});
  }

  /// Android only.
  Font? get rfidEnableNfcButtonText => _rfidEnableNfcButtonText;
  Font? _rfidEnableNfcButtonText;
  set rfidEnableNfcButtonText(Font? val) {
    _rfidEnableNfcButtonText = val;
    _set({"rfidEnableNfcButtonText": val?.toJson()});
  }

  Font? get mdlProcessingScreenHintLabel => _mdlProcessingScreenHintLabel;
  Font? _mdlProcessingScreenHintLabel;
  set mdlProcessingScreenHintLabel(Font? val) {
    _mdlProcessingScreenHintLabel = val;
    _set({"mdlProcessingScreenHintLabel": val?.toJson()});
  }

  Font? get mdlProcessingScreenProgressLabel =>
      _mdlProcessingScreenProgressLabel;
  Font? _mdlProcessingScreenProgressLabel;
  set mdlProcessingScreenProgressLabel(Font? val) {
    _mdlProcessingScreenProgressLabel = val;
    _set({"mdlProcessingScreenProgressLabel": val?.toJson()});
  }

  Font? get mdlProcessingScreenResultLabel => _mdlProcessingScreenResultLabel;
  Font? _mdlProcessingScreenResultLabel;
  set mdlProcessingScreenResultLabel(Font? val) {
    _mdlProcessingScreenResultLabel = val;
    _set({"mdlProcessingScreenResultLabel": val?.toJson()});
  }

  /// Android only.
  Font? get mdlEnableNfcTitleText => _mdlEnableNfcTitleText;
  Font? _mdlEnableNfcTitleText;
  set mdlEnableNfcTitleText(Font? val) {
    _mdlEnableNfcTitleText = val;
    _set({"mdlEnableNfcTitleText": val?.toJson()});
  }

  /// Android only.
  Font? get mdlEnableNfcDescriptionText => _mdlEnableNfcDescriptionText;
  Font? _mdlEnableNfcDescriptionText;
  set mdlEnableNfcDescriptionText(Font? val) {
    _mdlEnableNfcDescriptionText = val;
    _set({"mdlEnableNfcDescriptionText": val?.toJson()});
  }

  /// Android only.
  Font? get mdlEnableNfcButtonText => _mdlEnableNfcButtonText;
  Font? _mdlEnableNfcButtonText;
  set mdlEnableNfcButtonText(Font? val) {
    _mdlEnableNfcButtonText = val;
    _set({"mdlEnableNfcButtonText": val?.toJson()});
  }

  /// Allows you to deserialize object.
  static CustomizationFonts fromJson(jsonObject) {
    var result = CustomizationFonts();
    result.testSetters = {};

    result.rfidProcessingScreenHintLabel = Font.fromJson(
      jsonObject["rfidProcessingScreenHintLabel"],
    );
    result.rfidProcessingScreenProgressLabel = Font.fromJson(
      jsonObject["rfidProcessingScreenProgressLabel"],
    );
    result.rfidProcessingScreenResultLabel = Font.fromJson(
      jsonObject["rfidProcessingScreenResultLabel"],
    );
    result.rfidEnableNfcTitleText = Font.fromJson(
      jsonObject["rfidEnableNfcTitleText"],
    );
    result.rfidEnableNfcDescriptionText = Font.fromJson(
      jsonObject["rfidEnableNfcDescriptionText"],
    );
    result.rfidEnableNfcButtonText = Font.fromJson(
      jsonObject["rfidEnableNfcButtonText"],
    );
    result.mdlProcessingScreenHintLabel = Font.fromJson(
      jsonObject["mdlProcessingScreenHintLabel"],
    );
    result.mdlProcessingScreenProgressLabel = Font.fromJson(
      jsonObject["mdlProcessingScreenProgressLabel"],
    );
    result.mdlProcessingScreenResultLabel = Font.fromJson(
      jsonObject["mdlProcessingScreenResultLabel"],
    );
    result.mdlEnableNfcTitleText = Font.fromJson(
      jsonObject["mdlEnableNfcTitleText"],
    );
    result.mdlEnableNfcDescriptionText = Font.fromJson(
      jsonObject["mdlEnableNfcDescriptionText"],
    );
    result.mdlEnableNfcButtonText = Font.fromJson(
      jsonObject["mdlEnableNfcButtonText"],
    );

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "rfidProcessingScreenHintLabel":
            rfidProcessingScreenHintLabel?.toJson(),
        "rfidProcessingScreenProgressLabel":
            rfidProcessingScreenProgressLabel?.toJson(),
        "rfidProcessingScreenResultLabel":
            rfidProcessingScreenResultLabel?.toJson(),
        "rfidEnableNfcTitleText": rfidEnableNfcTitleText?.toJson(),
        "rfidEnableNfcDescriptionText": rfidEnableNfcDescriptionText?.toJson(),
        "rfidEnableNfcButtonText": rfidEnableNfcButtonText?.toJson(),
        "mdlProcessingScreenHintLabel": mdlProcessingScreenHintLabel?.toJson(),
        "mdlProcessingScreenProgressLabel":
            mdlProcessingScreenProgressLabel?.toJson(),
        "mdlProcessingScreenResultLabel":
            mdlProcessingScreenResultLabel?.toJson(),
        "mdlEnableNfcTitleText": mdlEnableNfcTitleText?.toJson(),
        "mdlEnableNfcDescriptionText": mdlEnableNfcDescriptionText?.toJson(),
        "mdlEnableNfcButtonText": mdlEnableNfcButtonText?.toJson(),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"fonts": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.fonts)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
