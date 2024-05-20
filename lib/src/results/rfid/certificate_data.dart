//
//  CertificateData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CertificateData {
  String? get data => _data;
  String? _data;

  int get length => _length;
  late int _length;

  /// Allows you to deserialize object.
  static CertificateData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = CertificateData();

    result._length = jsonObject["length"];
    result._data = jsonObject["data"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "data": data,
        "length": length,
      }.clearNulls();
}
