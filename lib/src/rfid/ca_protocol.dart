part of "../../flutter_document_reader_api.dart";

class CAProtocol {
  String get version => _version;
  late String _version;

  String get scheme => _scheme;
  late String _scheme;

  String get keyAlgorithm => _keyAlgorithm;
  late String _keyAlgorithm;

  bool get chipIndividual => _chipIndividual;
  late bool _chipIndividual;

  @visibleForTesting
  static CAProtocol? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = CAProtocol();

    result._version = jsonObject["version"];
    result._scheme = jsonObject["scheme"];
    result._keyAlgorithm = jsonObject["keyAlgorithm"];
    result._chipIndividual = jsonObject["chipIndividual"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "version": version,
        "scheme": scheme,
        "keyAlgorithm": keyAlgorithm,
        "chipIndividual": chipIndividual,
      }.clearNulls();
}
