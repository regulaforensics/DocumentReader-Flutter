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

  bool? get checkBlackAndWhiteCopy => _checkBlackAndWhiteCopy;
  bool? _checkBlackAndWhiteCopy;
  set checkBlackAndWhiteCopy(bool? val) {
    _checkBlackAndWhiteCopy = val;
    _set({"checkBlackAndWhiteCopy": val});
  }

  /// This parameter is used to enable Dynaprint detection.
  bool? get checkDynaprint => _checkDynaprint;
  bool? _checkDynaprint;
  set checkDynaprint(bool? val) {
    _checkDynaprint = val;
    _set({"checkDynaprint": val});
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
    result.checkBlackAndWhiteCopy = jsonObject["checkBlackAndWhiteCopy"];
    result.checkDynaprint = jsonObject["checkDynaprint"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "checkOVI": checkOVI,
        "checkMLI": checkMLI,
        "checkHolo": checkHolo,
        "checkED": checkED,
        "checkBlackAndWhiteCopy": checkBlackAndWhiteCopy,
        "checkDynaprint": checkDynaprint,
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
