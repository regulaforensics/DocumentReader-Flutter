//
//  PKDCertificate.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Class contains information about PKD certificate.
class PKDCertificate {
  /// Certificate in binary type.
  Uint8List get binaryData => _binaryData;
  late Uint8List _binaryData;

  /// Indicates type of certificate.
  PKDResourceType get resourceType => _resourceType;
  late PKDResourceType _resourceType;

  /// Private key in binary type.
  Uint8List? get privateKey => _privateKey;
  Uint8List? _privateKey;

  PKDCertificate._empty();

  PKDCertificate(Uint8List binaryData, PKDResourceType resourceType) {
    _binaryData = binaryData;
    _resourceType = resourceType;
  }

  PKDCertificate.withPrivateKey(
    Uint8List binaryData,
    PKDResourceType resourceType,
    Uint8List privateKey,
  ) {
    _binaryData = binaryData;
    _resourceType = resourceType;
    _privateKey = privateKey;
  }

  @visibleForTesting
  static PKDCertificate? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PKDCertificate._empty();

    result._binaryData = base64Decode(jsonObject["binaryData"]);
    result._resourceType =
        PKDResourceType.getByValue(jsonObject["resourceType"])!;
    result._privateKey = base64Decode(jsonObject["privateKey"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "binaryData": base64Encode(binaryData),
      "resourceType": resourceType.value
    };

    if (privateKey != null) result["privateKey"] = base64Encode(privateKey!);

    return result;
  }

  static List<dynamic>? _listToJson(List<PKDCertificate>? certificates) {
    List<dynamic>? json = [];
    if (certificates != null) {
      for (PKDCertificate cert in certificates) {
        json.add(cert.toJson());
      }
    } else {
      json = null;
    }
    return json;
  }
}

enum PKDResourceType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  CERTIFICATE_PA(0),

  CERTIFICATE_TA(1),

  LDIF(2),

  CRL(3),

  ML(4),

  DEFL(5),

  DEVL(6),

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
