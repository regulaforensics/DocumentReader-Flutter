part of "../../flutter_document_reader_api.dart";

class DocumentRequestMDL {
  late String _docType;
  List<NameSpaceMDL> _namespaces = [];

  DocumentRequestMDL(String docType) : _docType = docType;

  addNameSpace(NameSpaceMDL namespace) {
    _namespaces.add(namespace);
  }

  /// Allows you to deserialize object.
  static DocumentRequestMDL? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var docType = jsonObject["docType"];
    if (docType == "org.iso.18013.5.1.mDL") {
      return DocumentRequest18013MDL.fromJson(jsonObject);
    }
    var result = DocumentRequestMDL(docType);

    result._namespaces = (jsonObject["namespaces"] as List)
        .map((item) => NameSpaceMDL.fromJson(item)!)
        .toList();

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    if (_docType == "org.iso.18013.5.1.mDL") {
      try {
        return (this as DocumentRequest18013MDL).toJson();
      } catch (_) {}
    }
    return {
      "docType": _docType,
      "namespaces": _namespaces.map((item) => item.toJson()).toList(),
    }.clearNulls();
  }
}
