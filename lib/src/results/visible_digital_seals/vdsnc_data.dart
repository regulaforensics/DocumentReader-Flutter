//
//  VDSNCData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Visible Digital Seal for Non Constrained environments.
class VDSNCData {
  /// Visible Digital Seal use case type.
  /// Type is set to `icao.test` for Proof of Testing (data defined by CAPSCA),
  /// `icao.vacc` for Proof of Vaccination (data defined by WHO).
  /// Other Types may be added in the future.
  String? get type => _type;
  String? _type;

  /// Visible Digital Seal use case version.
  int get version => _version;
  late int _version;

  /// Three letter code identifying the issuing state or organization.
  String? get issuingCountry => _issuingCountry;
  String? _issuingCountry;

  /// The message field contains the actual data as a dictionary (JSON).
  Map<String, dynamic>? get message => _message;
  Map<String, dynamic>? _message = {};

  /// The signature algorithm used to produce the signature. ECDSA scheme.
  String? get signatureAlgorithm => _signatureAlgorithm;
  String? _signatureAlgorithm;

  /// The binary data of the verified digital signature.
  BytesData? get signature => _signature;
  BytesData? _signature;

  /// The binary data of the signer certificate.
  BytesData? get certificate => _certificate;
  BytesData? _certificate;

  /// The certificate chain, used for the digital signature verification.
  List<CertificateChain> get certificateChain => _certificateChain;
  List<CertificateChain> _certificateChain = [];

  /// The list of remarks occured during the scanning procedure.
  ///
  /// Each element belongs to the [LDSParsingErrorCodes] or the [LDSParsingNotificationCodes].
  List<int>? get notifications => _notifications;
  List<int>? _notifications = [];

  /// Allows you to deserialize object.
  static VDSNCData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = VDSNCData();

    result._type = jsonObject["type"];
    result._version = jsonObject["version"];
    result._issuingCountry = jsonObject["issuingCountry"];
    result._message = jsonObject["message"];
    result._signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result._signature = BytesData.fromJson(jsonObject["signature"]);
    result._certificate = BytesData.fromJson(jsonObject["certificate"]);
    for (var item in jsonObject["certificateChain"]) {
      result._certificateChain.addSafe(CertificateChain.fromJson(item));
    }
    result._notifications = jsonObject["notifications"] == null
        ? null
        : List<int>.from(jsonObject["notifications"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "issuingCountry": issuingCountry,
        "message": message,
        "signatureAlgorithm": signatureAlgorithm,
        "signature": signature?.toJson(),
        "certificate": certificate?.toJson(),
        "certificateChain": certificateChain.map((e) => e.toJson()).toList(),
        "notifications": notifications,
      }.clearNulls();
}
