//
//  FaceApiParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class FaceApiParams {
  /// The URL of the Regula Face SDK service instance to be used.
  String url = "https://faceapi.regulaforensics.com";

  /// The processing mode: "match" or "match+search".
  String mode = "match";

  /// The similarity threshold, 0-100. Above 75 means that the faces' similarity
  /// is verified, below 75 is not.
  int threshold = 75;

  /// A search filter that can be applied if the "match+search" mode is enabled.
  FaceApiSearchParams? searchParams;

  /// The service request timeout, ms.
  int serviceTimeout = 3000;

  /// Proxy to use, should be set according to the cURL standart.
  String? proxy;

  /// Username and password to use for proxy authentication,
  /// should be set according to the cURL standart.
  String? proxyPassword;

  /// Proxy protocol type, should be set according to the cURL standart.
  int? proxyType;

  /// Allows you to deserialize object.
  static FaceApiParams? fromJson(jsonObject) {
    var result = new FaceApiParams();
    if (jsonObject == null) return null;

    result.url = jsonObject["url"];
    result.mode = jsonObject["mode"];
    result.searchParams =
        FaceApiSearchParams.fromJson(jsonObject["searchParams"]);
    result.threshold = jsonObject["threshold"];
    result.serviceTimeout = jsonObject["serviceTimeout"];
    result.proxy = jsonObject["proxy"];
    result.proxyPassword = jsonObject["proxyPassword"];
    result.proxyType = jsonObject["proxyType"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["url"] = url;
    result["mode"] = mode;
    result["threshold"] = threshold;
    result["serviceTimeout"] = serviceTimeout;
    if (proxy != null) result["proxy"] = proxy;
    if (proxyPassword != null) result["proxyPassword"] = proxyPassword;
    if (proxyType != null) result["proxyType"] = proxyType;
    if (searchParams != null) result["searchParams"] = searchParams!.toJson();

    return result;
  }
}
