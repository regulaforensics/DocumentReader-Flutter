//
//  CertificateData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class CertificateData {
  String? get data => _data;
  String? _data;

  int get length => _length;
  late int _length;

  /// Allows you to deserialize object.
  static CertificateData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CertificateData();

    result._length = jsonObject["length"];
    result._data = jsonObject["data"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["data"] = data;
    result["length"] = length;

    return result;
  }
}
