part of "../../../flutter_document_reader_api.dart";

class FileData {
  String? get data => _data;
  String? _data;

  int get length => _length;
  late int _length;

  int get type => _type;
  late int _type;

  int get status => _status;
  late int _status;

  /// Allows you to serialize object.
  static FileData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FileData();

    result._length = jsonObject["length"];
    result._type = jsonObject["type"];
    result._status = jsonObject["status"];
    result._data = jsonObject["data"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "data": data,
        "length": length,
        "type": type,
        "status": status,
      }.clearNulls();
}
