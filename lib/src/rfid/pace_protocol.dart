part of "../../flutter_document_reader_api.dart";

class PACEProtocol {
  String get version => _version;
  late String _version;

  String get stdDomainParams => _stdDomainParams;
  late String _stdDomainParams;

  String get keyAlgorithm => _keyAlgorithm;
  late String _keyAlgorithm;

  @visibleForTesting
  static PACEProtocol? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PACEProtocol();

    result._version = jsonObject["version"];
    result._stdDomainParams = jsonObject["stdDomainParams"];
    result._keyAlgorithm = jsonObject["keyAlgorithm"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "version": version,
        "stdDomainParams": stdDomainParams,
        "keyAlgorithm": keyAlgorithm,
      }.clearNulls();
}
