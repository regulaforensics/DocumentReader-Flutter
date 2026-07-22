//
//  SignerInfo.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure is used to store the result of the verification of a single digital
/// signature of the number present in EF.SOD.
class SignerInfo {
  /// Data to hash.
  String? get dataToHash => _dataToHash;
  String? _dataToHash;

  /// Digital signature hash-function algorithm identifier.
  String? get digestAlgorithm => _digestAlgorithm;
  String? _digestAlgorithm;

  /// Result of the digital signature verification.
  int get paStatus => _paStatus;
  late int _paStatus;

  /// Digital signature algorithm identifier.
  String? get signatureAlgorithm => _signatureAlgorithm;
  String? _signatureAlgorithm;

  /// Version of the digital signature data structure.
  int get version => _version;
  late int _version;

  /// Identifier of the necessary certificate issuer.
  Authority? get issuer => _issuer;
  Authority? _issuer;

  /// Serial number of the necessary certificate.
  RFIDValue? get serialNumber => _serialNumber;
  RFIDValue? _serialNumber;

  /// Binary data of the verified digital signature.
  RFIDValue? get signature => _signature;
  RFIDValue? _signature;

  /// List of the signed attributes.
  List<Extension> get signedAttributes => _signedAttributes;
  List<Extension> _signedAttributes = [];

  /// Signature object identifier of the necessary certificate.
  RFIDValue? get subjectKeyIdentifier => _subjectKeyIdentifier;
  RFIDValue? _subjectKeyIdentifier;

  /// Certificate chain, used for the digital signature verification.
  List<CertificateChain> get certificateChain => _certificateChain;
  List<CertificateChain> _certificateChain = [];

  /// The list of remarks occured during the scanning procedure.
  ///
  /// Each element belongs to the [LDSParsingErrorCodes].
  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  /// Allows you to deserialize object.
  static SignerInfo? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SignerInfo();

    result._version = jsonObject["version"];
    result._paStatus = jsonObject["paStatus"];
    result._dataToHash = jsonObject["dataToHash"];
    result._digestAlgorithm = jsonObject["digestAlgorithm"];
    result._signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result._serialNumber = RFIDValue.fromJson(jsonObject["serialNumber"]);
    result._signature = RFIDValue.fromJson(jsonObject["signature"]);
    result._subjectKeyIdentifier = RFIDValue.fromJson(
      jsonObject["subjectKeyIdentifier"],
    );
    result._issuer = Authority.fromJson(jsonObject["issuer"]);
    result._notifications = _intListFrom(jsonObject["notifications"])!;
    for (var item in jsonObject["signedAttributes"]) {
      result._signedAttributes.addSafe(Extension.fromJson(item));
    }
    for (var item in jsonObject["certificateChain"]) {
      result._certificateChain.addSafe(CertificateChain.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "dataToHash": dataToHash,
        "digestAlgorithm": digestAlgorithm,
        "version": version,
        "paStatus": paStatus,
        "signatureAlgorithm": signatureAlgorithm,
        "issuer": issuer?.toJson(),
        "serialNumber": serialNumber?.toJson(),
        "signature": signature?.toJson(),
        "subjectKeyIdentifier": subjectKeyIdentifier?.toJson(),
        "signedAttributes": signedAttributes.map((e) => e.toJson()).toList(),
        "certificateChain": certificateChain.map((e) => e.toJson()).toList(),
        "notifications": notifications,
      }.clearNulls();
}
