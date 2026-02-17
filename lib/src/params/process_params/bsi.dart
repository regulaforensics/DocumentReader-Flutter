part of "../../../flutter_document_reader_api.dart";

class Bsi {
  bool? _generateResult;

  Bsi({
    bool? generateResult,
  }) : _generateResult = generateResult;

  /// Allows you to deserialize object.
  static Bsi? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return Bsi(
      generateResult: jsonObject["generateResult"],
    );
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "generateResult": _generateResult,
      }.clearNulls();
}
