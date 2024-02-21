//
//  CustomizationFonts.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

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

  /// Allows you to deserialize object.
  static CustomizationFonts fromJson(jsonObject) {
    var result = CustomizationFonts();
    result.testSetters = {};

    result.rfidProcessingScreenHintLabel =
        Font.fromJson(jsonObject["rfidProcessingScreenHintLabel"]);
    result.rfidProcessingScreenProgressLabel =
        Font.fromJson(jsonObject["rfidProcessingScreenProgressLabel"]);
    result.rfidProcessingScreenResultLabel =
        Font.fromJson(jsonObject["rfidProcessingScreenResultLabel"]);

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
