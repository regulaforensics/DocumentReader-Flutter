part of "../../../flutter_document_reader_api.dart";

class CustomizationMatrices {
  List<double>? get nextPageIdCardFront => _nextPageIdCardFront;
  List<double>? _nextPageIdCardFront;
  set nextPageIdCardFront(List<double>? val) {
    _nextPageIdCardFront = val;
    _set({"nextPageIdCardFront": val});
  }

  List<double>? get nextPageIdCardBack => _nextPageIdCardBack;
  List<double>? _nextPageIdCardBack;
  set nextPageIdCardBack(List<double>? val) {
    _nextPageIdCardBack = val;
    _set({"nextPageIdCardBack": val});
  }

  /// Allows you to deserialize object.
  static CustomizationMatrices fromJson(jsonObject) {
    var result = CustomizationMatrices();
    if (jsonObject == null) return result;
    result.testSetters = {};

    if (jsonObject["nextPageIdCardFront"] != null) {
      List<double> array = [];
      for (var value in jsonObject["nextPageIdCardFront"]) {
        array.add(value.toDouble());
      }
      result.nextPageIdCardFront = array;
    } else {
      result.nextPageIdCardFront = null;
    }

    if (jsonObject["nextPageIdCardBack"] != null) {
      List<double> array = [];
      for (var value in jsonObject["nextPageIdCardBack"]) {
        array.add(value.toDouble());
      }
      result.nextPageIdCardBack = array;
    } else {
      result.nextPageIdCardBack = null;
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "nextPageIdCardFront": nextPageIdCardFront,
        "nextPageIdCardBack": nextPageIdCardBack,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"matrices": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.matrices)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
