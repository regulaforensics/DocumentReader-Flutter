part of "../../../flutter_document_reader_api.dart";

class CustomizationContentModes {
  ViewContentMode? get nextPageIdCardFront => _nextPageIdCardFront;
  ViewContentMode? _nextPageIdCardFront;
  set nextPageIdCardFront(ViewContentMode? val) {
    _nextPageIdCardFront = val;
    _set({"nextPageIdCardFront": val?.value});
  }

  ViewContentMode? get nextPageIdCardBack => _nextPageIdCardBack;
  ViewContentMode? _nextPageIdCardBack;
  set nextPageIdCardBack(ViewContentMode? val) {
    _nextPageIdCardBack = val;
    _set({"nextPageIdCardBack": val?.value});
  }

  /// Allows you to deserialize object.
  static CustomizationContentModes fromJson(jsonObject) {
    var result = CustomizationContentModes();
    if (jsonObject == null) return result;
    result.testSetters = {};

    result.nextPageIdCardFront =
        ViewContentMode.getByValue(jsonObject["nextPageIdCardFront"]);
    result.nextPageIdCardBack =
        ViewContentMode.getByValue(jsonObject["nextPageIdCardBack"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "nextPageIdCardFront": nextPageIdCardFront?.value,
        "nextPageIdCardBack": nextPageIdCardBack?.value,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"contentModes": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.contentModes)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}

/// Clone of iOS native enum `UIViewContentMode`
enum ViewContentMode {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  SCALE_TO_FILL(0),

  /// Contents scaled to fit with fixed aspect. remainder is transparent.
  SCALE_ASPECT_FIT(1),

  /// Contents scaled to fill with fixed aspect. some portion of content may be clipped.
  SCALE_ASPECT_FILL(2),

  /// redraw on bounds change (calls -setNeedsDisplay).
  REDRAW(3),

  /// contents remain same size. positioned adjusted.
  CENTER(4),

  TOP(5),

  BOTTOM(6),

  LEFT(7),

  RIGHT(8),

  TOP_LEFT(9),

  TOP_RIGHT(10),

  BOTTOM_LEFT(11),

  BOTTOM_RIGHT(12);

  const ViewContentMode(this.value);
  final int value;

  static ViewContentMode? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ViewContentMode.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ViewContentMode.UNKNOWN;
    }
  }
}
