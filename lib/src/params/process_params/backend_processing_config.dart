//
//  BackendProcessingConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class BackendProcessingConfig {
  String get url => _url;
  String _url;

  Map<String, String>? get httpHeaders => _httpHeaders;
  Map<String, String>? _httpHeaders;

  bool? get rfidServerSideChipVerification => _rfidServerSideChipVerification;
  bool? _rfidServerSideChipVerification;

  /// Timeout in seconds that can be configured for backend transaction creation and package finalization.
  double? get timeoutConnection => _timeoutConnection;
  double? _timeoutConnection;

  BackendProcessingConfig(
    String url, {
    bool? rfidServerSideChipVerification,
    Map<String, String>? httpHeaders,
    double? timeoutConnection,
  })  : _url = url,
        _rfidServerSideChipVerification = rfidServerSideChipVerification,
        _httpHeaders = httpHeaders,
        _timeoutConnection = timeoutConnection;

  /// Allows you to deserialize object.
  static BackendProcessingConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = BackendProcessingConfig(jsonObject["url"]);

    result._rfidServerSideChipVerification =
        jsonObject["rfidServerSideChipVerification"];
    if (jsonObject["httpHeaders"] != null) {
      result._httpHeaders = Map<String, String>.from(jsonObject["httpHeaders"]);
    }
    result._timeoutConnection = _toDouble(jsonObject["timeoutConnection"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "url": url,
        "rfidServerSideChipVerification": rfidServerSideChipVerification,
        "httpHeaders": httpHeaders,
        "timeoutConnection": timeoutConnection,
      }.clearNulls();
}
