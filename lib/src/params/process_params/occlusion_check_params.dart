part of "../../../flutter_document_reader_api.dart";

class OcclusionCheckParams {
  /// The maximum size for the occluded area of a document; only those exceeding this size will be validated.
  double? get maxOcclusionPart => _maxOcclusionPart;
  double? _maxOcclusionPart;

  OcclusionCheckParams({double? maxOcclusionPart}) : _maxOcclusionPart = maxOcclusionPart;

  /// Allows you to deserialize object.
  static OcclusionCheckParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return OcclusionCheckParams(
      maxOcclusionPart: _toDouble(jsonObject["maxOcclusionPart"]),
    );
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "maxOcclusionPart": maxOcclusionPart,
      }.clearNulls();
}
