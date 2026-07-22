part of "../../../flutter_document_reader_api.dart";

/// Structure containing rfid origin values.
class RFIDOrigin {
  int get dg => _dg;
  late int _dg;

  int get dgTag => _dgTag;
  late int _dgTag;

  int get entryView => _entryView;
  late int _entryView;

  int get tagEntry => _tagEntry;
  late int _tagEntry;

  /// Allows you to deserialize object.
  static RFIDOrigin? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDOrigin();

    result._dg = jsonObject["dg"];
    result._dgTag = jsonObject["dgTag"];
    result._entryView = jsonObject["entryView"];
    result._tagEntry = jsonObject["tagEntry"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "dg": dg,
        "dgTag": dgTag,
        "entryView": entryView,
        "tagEntry": tagEntry,
      }.clearNulls();
}
