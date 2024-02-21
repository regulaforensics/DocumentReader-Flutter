//
//  BackendProcessingConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class BackendProcessingConfig {
  String get url => _url;
  String _url;

  Map<String, String>? get httpHeaders => _httpHeaders;
  Map<String, String>? _httpHeaders;

  bool? get rfidServerSideChipVerification => _rfidServerSideChipVerification;
  bool? _rfidServerSideChipVerification;

  BackendProcessingConfig(
    String url, {
    bool? rfidServerSideChipVerification,
    Map<String, String>? httpHeaders,
  })  : _url = url,
        _rfidServerSideChipVerification = rfidServerSideChipVerification,
        _httpHeaders = httpHeaders;

  /// Allows you to deserialize object.
  static BackendProcessingConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = BackendProcessingConfig(jsonObject["url"]);

    result._rfidServerSideChipVerification =
        jsonObject["rfidServerSideChipVerification"];
    if (jsonObject["httpHeaders"] != null)
      result._httpHeaders = Map<String, String>.from(jsonObject["httpHeaders"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "url": url,
        "rfidServerSideChipVerification": rfidServerSideChipVerification,
        "httpHeaders": httpHeaders
      }.clearNulls();
}
