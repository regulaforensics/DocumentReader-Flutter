//
//  EPassportDataGroups.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class EPassportDataGroups {
  bool get dg1 => _dg1;
  bool _dg1 = true;
  set dg1(bool val) {
    _dg1 = val;
    _set({"DG1": val});
  }

  bool get dg2 => _dg2;
  bool _dg2 = true;
  set dg2(bool val) {
    _dg2 = val;
    _set({"DG2": val});
  }

  bool get dg3 => _dg3;
  bool _dg3 = false;
  set dg3(bool val) {
    _dg3 = val;
    _set({"DG3": val});
  }

  bool get dg4 => _dg4;
  bool _dg4 = false;
  set dg4(bool val) {
    _dg4 = val;
    _set({"DG4": val});
  }

  bool get dg5 => _dg5;
  bool _dg5 = true;
  set dg5(bool val) {
    _dg5 = val;
    _set({"DG5": val});
  }

  bool get dg6 => _dg6;
  bool _dg6 = false;
  set dg6(bool val) {
    _dg6 = val;
    _set({"DG6": val});
  }

  bool get dg7 => _dg7;
  bool _dg7 = true;
  set dg7(bool val) {
    _dg7 = val;
    _set({"DG7": val});
  }

  bool get dg8 => _dg8;
  bool _dg8 = false;
  set dg8(bool val) {
    _dg8 = val;
    _set({"DG8": val});
  }

  bool get dg9 => _dg9;
  bool _dg9 = false;
  set dg9(bool val) {
    _dg9 = val;
    _set({"DG9": val});
  }

  bool get dg10 => _dg10;
  bool _dg10 = false;
  set dg10(bool val) {
    _dg10 = val;
    _set({"DG10": val});
  }

  bool get dg11 => _dg11;
  bool _dg11 = true;
  set dg11(bool val) {
    _dg11 = val;
    _set({"DG11": val});
  }

  bool get dg12 => _dg12;
  bool _dg12 = true;
  set dg12(bool val) {
    _dg12 = val;
    _set({"DG12": val});
  }

  bool get dg13 => _dg13;
  bool _dg13 = true;
  set dg13(bool val) {
    _dg13 = val;
    _set({"DG13": val});
  }

  bool get dg14 => _dg14;
  bool _dg14 = true;
  set dg14(bool val) {
    _dg14 = val;
    _set({"DG14": val});
  }

  bool get dg15 => _dg15;
  bool _dg15 = true;
  set dg15(bool val) {
    _dg15 = val;
    _set({"DG15": val});
  }

  bool get dg16 => _dg16;
  bool _dg16 = false;
  set dg16(bool val) {
    _dg16 = val;
    _set({"DG16": val});
  }

  /// Allows you to deserialize object.
  static EPassportDataGroups fromJson(jsonObject) {
    var result = EPassportDataGroups();
    result.testSetters = {};

    result.dg1 = jsonObject["DG1"];
    result.dg2 = jsonObject["DG2"];
    result.dg3 = jsonObject["DG3"];
    result.dg4 = jsonObject["DG4"];
    result.dg5 = jsonObject["DG5"];
    result.dg6 = jsonObject["DG6"];
    result.dg7 = jsonObject["DG7"];
    result.dg8 = jsonObject["DG8"];
    result.dg9 = jsonObject["DG9"];
    result.dg10 = jsonObject["DG10"];
    result.dg11 = jsonObject["DG11"];
    result.dg12 = jsonObject["DG12"];
    result.dg13 = jsonObject["DG13"];
    result.dg14 = jsonObject["DG14"];
    result.dg15 = jsonObject["DG15"];
    result.dg16 = jsonObject["DG16"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "DG1": dg1,
        "DG2": dg2,
        "DG3": dg3,
        "DG4": dg4,
        "DG5": dg5,
        "DG6": dg6,
        "DG7": dg7,
        "DG8": dg8,
        "DG9": dg9,
        "DG10": dg10,
        "DG11": dg11,
        "DG12": dg12,
        "DG13": dg13,
        "DG14": dg14,
        "DG15": dg15,
        "DG16": dg16,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {RFIDScenario? parent}) {
    var rfidScenarioJson = {"ePassportDataGroups": json};
    var rfidScenario = DocumentReader.instance.rfidScenario;
    if (identical(this, rfidScenario.ePassportDataGroups)) {
      rfidScenario._set(rfidScenarioJson);
    }
    parent?.testSetters.addAll(rfidScenarioJson);
    testSetters.addAll(json);
  }

  void _apply(RFIDScenario parent) => _set(toJson(), parent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
