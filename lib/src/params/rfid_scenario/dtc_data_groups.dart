part of "../../../flutter_document_reader_api.dart";

class DTCDataGroup {
  bool get dg17 => _dg17;
  bool _dg17 = true;
  set dg17(bool val) {
    _dg17 = val;
    _set({"DG17": val});
  }

  bool get dg18 => _dg18;
  bool _dg18 = true;
  set dg18(bool val) {
    _dg18 = val;
    _set({"DG18": val});
  }

  bool get dg22 => _dg22;
  bool _dg22 = true;
  set dg22(bool val) {
    _dg22 = val;
    _set({"DG22": val});
  }

  bool get dg23 => _dg23;
  bool _dg23 = true;
  set dg23(bool val) {
    _dg23 = val;
    _set({"DG23": val});
  }

  bool get dg24 => _dg24;
  bool _dg24 = true;
  set dg24(bool val) {
    _dg24 = val;
    _set({"DG24": val});
  }

  /// Allows you to deserialize object.
  static DTCDataGroup fromJson(jsonObject) {
    var result = DTCDataGroup();
    result.testSetters = {};

    result.dg17 = jsonObject["DG17"];
    result.dg18 = jsonObject["DG18"];
    result.dg22 = jsonObject["DG22"];
    result.dg23 = jsonObject["DG23"];
    result.dg24 = jsonObject["DG24"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "DG17": dg17,
        "DG18": dg18,
        "DG22": dg22,
        "DG23": dg23,
        "DG24": dg24,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {RFIDScenario? parent}) {
    var rfidScenarioJson = {"dtcDataGroups": json};
    var rfidScenario = DocumentReader.instance.rfidScenario;
    if (identical(this, rfidScenario.dtcDataGroups)) {
      rfidScenario._set(rfidScenarioJson);
    }
    parent?.testSetters.addAll(rfidScenarioJson);
    testSetters.addAll(json);
  }

  void _apply(RFIDScenario parent) => _set(toJson(), parent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
