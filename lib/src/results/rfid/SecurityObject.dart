//
//  SecurityObject.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure is used to describe the contents of a single document
/// security object (SO) and the results of its check within the context
/// of the communication session with electronic document.
class SecurityObject {
  /// Reference to the source file of the security object data.
  int get fileReference => _fileReference;
  late int _fileReference;

  /// Security object identifier.
  String? get objectType => _objectType;
  String? _objectType;

  /// Security object version.
  int get version => _version;
  late int _version;

  /// List of containers to store information about digital
  /// signature objects contained in the SO.
  List<SignerInfo> get signerInfos => _signerInfos;
  List<SignerInfo> _signerInfos = [];

  /// The list of remarks occured during the scanning procedure.
  ///
  /// Each element belongs to the [LDSParsingErrorCodes].
  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  /// Allows you to deserialize object.
  static SecurityObject? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SecurityObject();

    result._fileReference = jsonObject["fileReference"];
    result._version = jsonObject["version"];
    result._objectType = jsonObject["objectType"];
    result._notifications = jsonObject["notifications"].cast<int>();
    for (var item in jsonObject["signerInfos"])
      result.signerInfos.addSafe(SignerInfo.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "fileReference": fileReference,
        "objectType": objectType,
        "version": version,
        "signerInfos": signerInfos.map((e) => e.toJson()).toList(),
        "notifications": notifications,
      }.clearNulls();
}
