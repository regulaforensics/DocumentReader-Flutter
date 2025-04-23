//
//  TccParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// TCC service related parameters for RFID session configuration.
class TccParams {
  /// The TA URL for the TCC service. The value of the property
  /// must be a valid URL string.
  String? serviceUrlTA;

  /// The PA URL for the TCC service. The value of the property
  /// must be a valid URL string.
  String? serviceUrlPA;

  /// The URL for the certificate for a TCC service.
  /// The value of the property must be a valid URL string.
  String? pfxCertUrl;

  /// The passphrase for the cerficiate provided by the [pfxCertUrl] property.
  String? pfxPassPhrase;

  /// The bytes of the certificate for a TCC service.
  /// This data will be used instead of loading the certificate via [pfxCertUrl].
  ByteData? pfxCert;

  @visibleForTesting
  static TccParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = TccParams();

    result.serviceUrlTA = jsonObject["serviceUrlTA"];
    result.serviceUrlPA = jsonObject["serviceUrlPA"];
    result.pfxCertUrl = jsonObject["pfxCertUrl"];
    result.pfxPassPhrase = jsonObject["pfxPassPhrase"];
    result.pfxCert = _dataFromBase64(jsonObject["pfxCert"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "serviceUrlTA": serviceUrlTA,
        "serviceUrlPA": serviceUrlPA,
        "pfxCertUrl": pfxCertUrl,
        "pfxPassPhrase": pfxPassPhrase,
        "pfxCert": _dataToBase64(pfxCert),
      }.clearNulls();
}
