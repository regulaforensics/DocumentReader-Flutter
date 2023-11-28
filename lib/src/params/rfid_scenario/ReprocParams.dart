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
  late String serviceUrl;

  /// If set to `true`, it will fail if service is unreachable.
  bool? failIfNoService;

  /// Allows you to set custom headers to http request.
  Map<String, String>? httpHeaders;

  ReprocParams(String serviceUrl) {
    this.serviceUrl = serviceUrl;
  }

  /// Allows you to deserialize object.
  static ReprocParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = new ReprocParams(jsonObject["serviceUrl"]);
    result.failIfNoService = jsonObject["failIfNoService"];
    result.httpHeaders = Map<String, String>.from(jsonObject["httpHeaders"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "serviceUrl": serviceUrl,
    };

    if (failIfNoService != null) result["failIfNoService"] = failIfNoService;
    if (httpHeaders != null) result["httpHeaders"] = httpHeaders;

    return result;
  }
}
