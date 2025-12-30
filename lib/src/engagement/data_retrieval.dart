part of "../../flutter_document_reader_api.dart";

class DataRetrieval {
  MDLDocRequestPreset _deviceRetrieval;
  MDLDocRequestPreset? _docRequestPreset;
  MDLIntentToRetain _intentToRetain = MDLIntentToRetain.TRUE;
  List<DocumentRequestMDL> _requests = [];

  DataRetrieval(this._deviceRetrieval);

  setDocRequestPreset(
    MDLDocRequestPreset docRequestPreset,
    MDLIntentToRetain intentToRetain,
  ) {
    _docRequestPreset = docRequestPreset;
    _intentToRetain = intentToRetain;
  }

  addDocRequest(DocumentRequestMDL request) {
    _requests.add(request);
  }

  /// Allows you to deserialize object.
  static DataRetrieval? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DataRetrieval(
        MDLDocRequestPreset.getByValue(jsonObject["deviceRetrieval"])!);

    result._docRequestPreset =
        MDLDocRequestPreset.getByValue(jsonObject["docRequestPreset"]);
    result._intentToRetain =
        MDLIntentToRetain.getByValue(jsonObject["intentToRetain"])!;
    result._requests = (jsonObject["requests"] as List)
        .map((item) => DocumentRequestMDL.fromJson(item)!)
        .toList();

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "deviceRetrieval": _deviceRetrieval.value,
        "docRequestPreset": _docRequestPreset?.value,
        "intentToRetain": _intentToRetain.value,
        "requests": _requests.map((item) => item.toJson()),
      }.clearNulls();
}

enum MDLDocRequestPreset {
  ALL(0),

  AGE(1),

  STANDARD_ID(2),

  TRAVEL(3),

  DRIVERS_LICENSE(4);

  const MDLDocRequestPreset(this.value);
  final int value;

  static MDLDocRequestPreset? getByValue(int? i) {
    if (i == null) return null;
    return MDLDocRequestPreset.values.firstWhere((x) => x.value == i);
  }
}

/// Contains device retrieval types.
enum MDLDeviceRetrieval {
  NFC(1),

  BLE(2);

  const MDLDeviceRetrieval(this.value);
  final int value;

  static MDLDeviceRetrieval? getByValue(int? i) {
    if (i == null) return null;
    return MDLDeviceRetrieval.values.firstWhere((x) => x.value == i);
  }
}
