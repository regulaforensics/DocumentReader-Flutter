//
//  LivenessParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class LivenessParams {
  bool? get checkOVI => _checkOVI;
  bool? _checkOVI;
  set checkOVI(bool? val) {
    _checkOVI = val;
    _set({"checkOVI": val});
  }

  bool? get checkMLI => _checkMLI;
  bool? _checkMLI;
  set checkMLI(bool? val) {
    _checkMLI = val;
    _set({"checkMLI": val});
  }

  bool? get checkHolo => _checkHolo;
  bool? _checkHolo;
  set checkHolo(bool? val) {
    _checkHolo = val;
    _set({"checkHolo": val});
  }

  bool? get checkED => _checkED;
  bool? _checkED;
  set checkED(bool? val) {
    _checkED = val;
    _set({"checkED": val});
  }

  /// Allows you to deserialize object.
  static LivenessParams fromJson(jsonObject) {
    if (jsonObject == null) return LivenessParams();
    var result = LivenessParams();
    result.testSetters = {};

    result.checkOVI = jsonObject["checkOVI"];
    result.checkMLI = jsonObject["checkMLI"];
    result.checkHolo = jsonObject["checkHolo"];
    result.checkED = jsonObject["checkED"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "checkOVI": checkOVI,
        "checkMLI": checkMLI,
        "checkHolo": checkHolo,
        "checkED": checkED,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {AuthenticityParams? directParent}) {
    var parentJson = {"livenessParams": json};
    var parent = DocumentReader.instance.processParams.authenticityParams;
    if (identical(this, parent.livenessParams)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(AuthenticityParams parent) =>
      _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
