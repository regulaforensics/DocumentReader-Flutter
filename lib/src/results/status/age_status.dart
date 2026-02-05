part of "../../../flutter_document_reader_api.dart";

/// Container for an age related scanning statuses.
class AgeStatus {
  int? get threshold => _threshold;
  late int? _threshold;

  CheckResult get overThreshold => _overThreshold;
  late CheckResult _overThreshold;

  CheckResult get over18 => _over18;
  late CheckResult _over18;

  CheckResult get over21 => _over21;
  late CheckResult _over21;

  CheckResult get over25 => _over25;
  late CheckResult _over25;

  CheckResult get over65 => _over65;
  late CheckResult _over65;

  /// Allows you to deserialize object.
  static AgeStatus? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = AgeStatus();

    result._threshold = jsonObject["threshold"];
    result._overThreshold =
        CheckResult.getByValue(jsonObject["overThreshold"])!;
    result._over18 = CheckResult.getByValue(jsonObject["over18"])!;
    result._over21 = CheckResult.getByValue(jsonObject["over21"])!;
    result._over25 = CheckResult.getByValue(jsonObject["over25"])!;
    result._over65 = CheckResult.getByValue(jsonObject["over65"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "threshold": threshold,
        "overThreshold": overThreshold.value,
        "over18": over18.value,
        "over21": over21.value,
        "over25": over25.value,
        "over65": over65.value,
      }.clearNulls();
}
