//
//  EIDDataGroups.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class EIDDataGroups {
  bool get dg1 => _dg1;
  bool _dg1 = true;
  set dg1(bool val) {
    dg1 = val;
    _setEIDDataGroups({"dg1": val}, this);
  }

  bool get dg2 => _dg2;
  bool _dg2 = true;
  set dg2(bool val) {
    dg2 = val;
    _setEIDDataGroups({"dg2": val}, this);
  }

  bool get dg3 => _dg3;
  bool _dg3 = true;
  set dg3(bool val) {
    dg3 = val;
    _setEIDDataGroups({"dg3": val}, this);
  }

  bool get dg4 => _dg4;
  bool _dg4 = true;
  set dg4(bool val) {
    dg4 = val;
    _setEIDDataGroups({"dg4": val}, this);
  }

  bool get dg5 => _dg5;
  bool _dg5 = true;
  set dg5(bool val) {
    dg5 = val;
    _setEIDDataGroups({"dg5": val}, this);
  }

  bool get dg6 => _dg6;
  bool _dg6 = true;
  set dg6(bool val) {
    dg6 = val;
    _setEIDDataGroups({"dg6": val}, this);
  }

  bool get dg7 => _dg7;
  bool _dg7 = true;
  set dg7(bool val) {
    dg7 = val;
    _setEIDDataGroups({"dg7": val}, this);
  }

  bool get dg8 => _dg8;
  bool _dg8 = true;
  set dg8(bool val) {
    dg8 = val;
    _setEIDDataGroups({"dg8": val}, this);
  }

  bool get dg9 => _dg9;
  bool _dg9 = true;
  set dg9(bool val) {
    dg9 = val;
    _setEIDDataGroups({"dg9": val}, this);
  }

  bool get dg10 => _dg10;
  bool _dg10 = true;
  set dg10(bool val) {
    dg10 = val;
    _setEIDDataGroups({"dg10": val}, this);
  }

  bool get dg11 => _dg11;
  bool _dg11 = true;
  set dg11(bool val) {
    dg11 = val;
    _setEIDDataGroups({"dg11": val}, this);
  }

  bool get dg12 => _dg12;
  bool _dg12 = true;
  set dg12(bool val) {
    dg12 = val;
    _setEIDDataGroups({"dg12": val}, this);
  }

  bool get dg13 => _dg13;
  bool _dg13 = false;
  set dg13(bool val) {
    dg13 = val;
    _setEIDDataGroups({"dg13": val}, this);
  }

  bool get dg14 => _dg14;
  bool _dg14 = false;
  set dg14(bool val) {
    dg14 = val;
    _setEIDDataGroups({"dg14": val}, this);
  }

  bool get dg15 => _dg15;
  bool _dg15 = false;
  set dg15(bool val) {
    dg15 = val;
    _setEIDDataGroups({"dg15": val}, this);
  }

  bool get dg16 => _dg16;
  bool _dg16 = false;
  set dg16(bool val) {
    dg16 = val;
    _setEIDDataGroups({"dg16": val}, this);
  }

  bool get dg17 => _dg17;
  bool _dg17 = true;
  set dg17(bool val) {
    dg17 = val;
    _setEIDDataGroups({"dg17": val}, this);
  }

  bool get dg18 => _dg18;
  bool _dg18 = true;
  set dg18(bool val) {
    dg18 = val;
    _setEIDDataGroups({"dg18": val}, this);
  }

  bool get dg19 => _dg19;
  bool _dg19 = true;
  set dg19(bool val) {
    dg19 = val;
    _setEIDDataGroups({"dg19": val}, this);
  }

  bool get dg20 => _dg20;
  bool _dg20 = true;
  set dg20(bool val) {
    dg20 = val;
    _setEIDDataGroups({"dg20": val}, this);
  }

  bool get dg21 => _dg21;
  bool _dg21 = true;
  set dg21(bool val) {
    dg21 = val;
    _setEIDDataGroups({"dg21": val}, this);
  }

  /// Allows you to deserialize object.
  fromJson(Map<String, dynamic> jsonObject) {
    _dg1 = jsonObject["DG1"];
    _dg2 = jsonObject["DG2"];
    _dg3 = jsonObject["DG3"];
    _dg4 = jsonObject["DG4"];
    _dg5 = jsonObject["DG5"];
    _dg6 = jsonObject["DG6"];
    _dg7 = jsonObject["DG7"];
    _dg8 = jsonObject["DG8"];
    _dg9 = jsonObject["DG9"];
    _dg10 = jsonObject["DG10"];
    _dg11 = jsonObject["DG11"];
    _dg12 = jsonObject["DG12"];
    _dg13 = jsonObject["DG13"];
    _dg14 = jsonObject["DG14"];
    _dg15 = jsonObject["DG15"];
    _dg16 = jsonObject["DG16"];
    _dg17 = jsonObject["DG17"];
    _dg18 = jsonObject["DG18"];
    _dg19 = jsonObject["DG19"];
    _dg20 = jsonObject["DG20"];
    _dg21 = jsonObject["DG21"];

    return this;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
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
        "DG17": dg17,
        "DG18": dg18,
        "DG19": dg19,
        "DG20": dg20,
        "DG21": dg21,
      };

  static _setEIDDataGroups(
    Map<String, dynamic> json,
    EIDDataGroups instance,
  ) {
    if (identical(instance, DocumentReader.instance.rfidScenario.eIDDataGroups))
      _bridge.invokeMethod(
        "setRfidScenario",
        [
          {"eIDDataGroups": json}
        ],
      );
  }

  _apply() => _setEIDDataGroups(this.toJson(), this);
}
