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
  String get url => _url;
  String _url = "https://faceapi.regulaforensics.com";

  /// The processing mode: "match" or "match+search".
  String get mode => _mode;
  String _mode = "match";

  /// The similarity threshold, 0-100. Above 75 means that the faces' similarity
  /// is verified, below 75 is not.
  int get threshold => _threshold;
  int _threshold = 75;

  /// A search filter that can be applied if the "match+search" mode is enabled.
  FaceApiSearchParams? get searchParams => _searchParams;
  FaceApiSearchParams? _searchParams;

  /// The service request timeout, ms.
  int get serviceTimeout => _serviceTimeout;
  int _serviceTimeout = 3000;

  /// Proxy to use, should be set according to the cURL standart.
  String? get proxy => _proxy;
  String? _proxy;

  /// Username and password to use for proxy authentication,
  /// should be set according to the cURL standart.
  String? get proxyPassword => _proxyPassword;
  String? _proxyPassword;

  /// Proxy protocol type, should be set according to the cURL standart.
  int? get proxyType => _proxyType;
  int? _proxyType;

  FaceApiParams(
      {String url = "https://faceapi.regulaforensics.com",
      String mode = "match",
      int threshold = 75,
      FaceApiSearchParams? searchParams,
      int serviceTimeout = 3000,
      String? proxy,
      String? proxyPassword,
      int? proxyType})
      : _url = url,
        _mode = mode,
        _threshold = threshold,
        _searchParams = searchParams,
        _serviceTimeout = serviceTimeout,
        _proxy = proxy,
        _proxyPassword = proxyPassword,
        _proxyType = proxyType;

  /// Allows you to deserialize object.
  static FaceApiParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return FaceApiParams(
        url: jsonObject["url"],
        mode: jsonObject["mode"],
        searchParams: FaceApiSearchParams.fromJson(jsonObject["searchParams"]),
        threshold: jsonObject["threshold"],
        serviceTimeout: jsonObject["serviceTimeout"],
        proxy: jsonObject["proxy"],
        proxyPassword: jsonObject["proxyPassword"],
        proxyType: jsonObject["proxyType"]);
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "url": url,
        "mode": mode,
        "threshold": threshold,
        "serviceTimeout": serviceTimeout,
        "proxy": proxy,
        "proxyPassword": proxyPassword,
        "proxyType": proxyType,
        "searchParams": searchParams?.toJson(),
      }.clearNulls();
}
