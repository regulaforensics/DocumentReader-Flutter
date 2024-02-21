//
//  SecurityObjectCertificates.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class SecurityObjectCertificates {
  CertificateData? get securityObject => _securityObject;
  CertificateData? _securityObject;

  /// Allows you to deserialize object.
  static SecurityObjectCertificates? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SecurityObjectCertificates();

    result._securityObject =
        CertificateData.fromJson(jsonObject["securityObject"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "securityObject": securityObject?.toJson(),
      }.clearNulls();
}
