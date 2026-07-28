part of "../../../flutter_document_reader_api.dart";

class AuthenticityPropertiesParams {
  /// Set to true to enable detection of the document holder’s signature.
  bool? get checkHoldersSignature => _checkHoldersSignature;
  bool? _checkHoldersSignature;
  set checkHoldersSignature(bool? val) {
    _checkHoldersSignature = val;
    _set({"checkHoldersSignature": val});
  }

  /// Allows you to deserialize object.
  static AuthenticityPropertiesParams fromJson(jsonObject) {
    if (jsonObject == null) return AuthenticityPropertiesParams();
    var result = AuthenticityPropertiesParams();
    result.testSetters = {};

    result.checkHoldersSignature = jsonObject["checkHoldersSignature"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "checkHoldersSignature": checkHoldersSignature,
      }.clearNulls();

  void _set(Map<String, dynamic> json, {AuthenticityParams? directParent}) {
    var parentJson = {"propertiesParams": json};
    var parent = DocumentReader.instance.processParams.authenticityParams;
    if (identical(this, parent.propertiesParams)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(AuthenticityParams parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
