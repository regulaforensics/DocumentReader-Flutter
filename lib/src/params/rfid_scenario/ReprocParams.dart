//
//  ReprocParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Class defines reprocessing parameters.
class ReprocParams {
  /// Url
  String get serviceUrl => _serviceUrl;
  String _serviceUrl;

  /// If set to `true`, it will fail if service is unreachable.
  bool? get failIfNoService => _failIfNoService;
  bool? _failIfNoService;

  /// Allows you to set custom headers to http request.
  Map<String, String>? get httpHeaders => _httpHeaders;
  Map<String, String>? _httpHeaders;

  ReprocParams(
    String serviceUrl, {
    bool? failIfNoService,
    Map<String, String>? httpHeaders,
  })  : _serviceUrl = serviceUrl,
        _failIfNoService = failIfNoService,
        _httpHeaders = httpHeaders;

  /// Allows you to deserialize object.
  static ReprocParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ReprocParams(jsonObject["serviceUrl"]);

    result._failIfNoService = jsonObject["failIfNoService"];
    if (jsonObject["httpHeaders"] != null)
      result._httpHeaders = Map<String, String>.from(jsonObject["httpHeaders"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "serviceUrl": serviceUrl,
        "failIfNoService": failIfNoService,
        "httpHeaders": httpHeaders
      }.clearNulls();
}
