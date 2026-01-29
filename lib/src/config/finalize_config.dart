part of "../../flutter_document_reader_api.dart";

class FinalizeConfig {
  bool? _rawImages;
  bool? _video;
  bool? _rfidSession;

  FinalizeConfig({
    bool? rawImages,
    bool? video,
    bool? rfidSession,
  })  : _rawImages = rawImages,
        _video = video,
        _rfidSession = rfidSession;

  @visibleForTesting
  static FinalizeConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FinalizeConfig();

    result._rawImages = jsonObject["rawImages"];
    result._video = jsonObject["video"];
    result._rfidSession = jsonObject["rfidSession"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "rawImages": _rawImages,
        "video": _video,
        "rfidSession": _rfidSession,
      }.clearNulls();
}
