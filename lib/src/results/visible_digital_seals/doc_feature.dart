part of "../../../flutter_document_reader_api.dart";

class DocFeature {
  int? get type => _type;
  int? _type;

  BytesData? get data => _data;
  BytesData? _data;

  /// Allows you to deserialize object.
  static DocFeature? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocFeature();

    result._type = jsonObject["type"];
    result._data = BytesData.fromJson(jsonObject["data"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "type": type,
        "data": data?.toJson(),
      }.clearNulls();
}
