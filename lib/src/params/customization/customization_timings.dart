part of "../../../flutter_document_reader_api.dart";

class CustomizationTimings {
  int? get nextPageIdCardStartDelay => _nextPageIdCardStartDelay;
  int? _nextPageIdCardStartDelay;
  set nextPageIdCardStartDelay(int? val) {
    _nextPageIdCardStartDelay = val;
    _set({"nextPageIdCardStartDelay": val});
  }

  int? get nextPageIdCardEndDelay => _nextPageIdCardEndDelay;
  int? _nextPageIdCardEndDelay;
  set nextPageIdCardEndDelay(int? val) {
    _nextPageIdCardEndDelay = val;
    _set({"nextPageIdCardEndDelay": val});
  }

  int? get nextPagePassportShiftStartDelay => _nextPagePassportShiftStartDelay;
  int? _nextPagePassportShiftStartDelay;
  set nextPagePassportShiftStartDelay(int? val) {
    _nextPagePassportShiftStartDelay = val;
    _set({"nextPagePassportShiftStartDelay": val});
  }

  int? get nextPagePassportShiftEndDelay => _nextPagePassportShiftEndDelay;
  int? _nextPagePassportShiftEndDelay;
  set nextPagePassportShiftEndDelay(int? val) {
    _nextPagePassportShiftEndDelay = val;
    _set({"nextPagePassportShiftEndDelay": val});
  }

  int? get nextPagePassportFlipStartDelay => _nextPagePassportFlipStartDelay;
  int? _nextPagePassportFlipStartDelay;
  set nextPagePassportFlipStartDelay(int? val) {
    _nextPagePassportFlipStartDelay = val;
    _set({"nextPagePassportFlipStartDelay": val});
  }

  int? get nextPagePassportFlipEndDelay => _nextPagePassportFlipEndDelay;
  int? _nextPagePassportFlipEndDelay;
  set nextPagePassportFlipEndDelay(int? val) {
    _nextPagePassportFlipEndDelay = val;
    _set({"nextPagePassportFlipEndDelay": val});
  }

  /// Allows you to deserialize object.
  static CustomizationTimings fromJson(jsonObject) {
    var result = CustomizationTimings();
    result.testSetters = {};

    result.nextPageIdCardStartDelay = jsonObject["nextPageIdCardStartDelay"];
    result.nextPageIdCardEndDelay = jsonObject["nextPageIdCardEndDelay"];
    result.nextPagePassportShiftStartDelay =
        jsonObject["nextPagePassportShiftStartDelay"];
    result.nextPagePassportShiftEndDelay =
        jsonObject["nextPagePassportShiftEndDelay"];
    result.nextPagePassportFlipStartDelay =
        jsonObject["nextPagePassportFlipStartDelay"];
    result.nextPagePassportFlipEndDelay =
        jsonObject["nextPagePassportFlipEndDelay"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "nextPageIdCardStartDelay": nextPageIdCardStartDelay,
        "nextPageIdCardEndDelay": nextPageIdCardEndDelay,
        "nextPagePassportShiftStartDelay": nextPagePassportShiftStartDelay,
        "nextPagePassportShiftEndDelay": nextPagePassportShiftEndDelay,
        "nextPagePassportFlipStartDelay": nextPagePassportFlipStartDelay,
        "nextPagePassportFlipEndDelay": nextPagePassportFlipEndDelay,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"timings": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.timings)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
