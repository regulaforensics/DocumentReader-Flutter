part of "../../../flutter_document_reader_api.dart";

/// Structure describing single value of the field.
class Comparison {
  /// The value's origin source.
  ResultType get sourceTypeLeft => _sourceTypeLeft;
  late ResultType _sourceTypeLeft;

  /// The value's origin source.
  ResultType get sourceTypeRight => _sourceTypeRight;
  late ResultType _sourceTypeRight;

  /// The status of field comparisons.
  CheckResult get status => _status;
  late CheckResult _status;

  /// Allows you to deserialize object.
  static Comparison? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Comparison();

    result._sourceTypeLeft = ResultType.getByValue(jsonObject["sourceTypeLeft"])!;
    result._sourceTypeRight = ResultType.getByValue(jsonObject["sourceTypeRight"])!;
    result._status = CheckResult.getByValue(jsonObject["status"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "sourceTypeLeft": sourceTypeLeft.value,
        "sourceTypeRight": sourceTypeRight.value,
        "status": status.value,
      }.clearNulls();
}
