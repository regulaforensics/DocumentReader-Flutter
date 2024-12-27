//
//  PKDCertificate.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Class contains information about PKD certificate.
class PKDCertificate {
  /// Certificate in binary type.
  ByteData get binaryData => _binaryData;
  ByteData _binaryData;

  /// Indicates type of certificate.
  PKDResourceType get resourceType => _resourceType;
  PKDResourceType _resourceType;

  /// Private key in binary type.
  ByteData? get privateKey => _privateKey;
  ByteData? _privateKey;

  PKDCertificate(ByteData binaryData, PKDResourceType resourceType,
      {ByteData? privateKey})
      : _binaryData = binaryData,
        _resourceType = resourceType,
        _privateKey = privateKey;

  @visibleForTesting
  static PKDCertificate? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return PKDCertificate(
      _dataFromBase64(jsonObject["binaryData"])!,
      PKDResourceType.getByValue(jsonObject["resourceType"])!,
      privateKey: _dataFromBase64(jsonObject["privateKey"]),
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "binaryData": _dataToBase64(binaryData),
        "resourceType": resourceType.value,
        "privateKey": _dataToBase64(privateKey)
      }.clearNulls();
}

enum PKDResourceType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Certificate file contents (.pem, .cer, .crt, .der).
  CERTIFICATE_PA(0),

  /// Certificate file contents (.cvcert) and private key file contents (.pkcs8).
  CERTIFICATE_TA(1),

  /// LDIF file contents (.ldif).
  LDIF(2),

  /// CRL file contents (.crl).
  CRL(3),

  /// Master List (.ml, .mls).
  ML(4),

  /// Defect List (.dl, .dls, .dfl).
  DEFL(5),

  /// Deviance List (.dl, .dls, .dvl).
  DEVL(6),

  /// Black List (.bl, .bls).
  BL(7);

  const PKDResourceType(this.value);
  final int value;

  static PKDResourceType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return PKDResourceType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return PKDResourceType.UNKNOWN;
    }
  }

  static PKDResourceType getType(String value) {
    switch (value) {
      case "pa":
        return CERTIFICATE_PA;
      case "ta":
        return CERTIFICATE_TA;
      case "ldif":
        return LDIF;
      case "crl":
        return CRL;
      case "ml":
        return ML;
      case "defl":
        return DEFL;
      case "devl":
        return DEVL;
      case "bl":
        return BL;
      default:
        return CERTIFICATE_PA;
    }
  }
}
