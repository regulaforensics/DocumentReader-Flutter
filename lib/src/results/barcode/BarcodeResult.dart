//
//  BarcodeResult.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure, describing single barcode extracted.
class BarcodeResult {
  List<BarcodeField> get fields => _fields;
  List<BarcodeField> _fields = [];

  /// Allows you to deserialize object.
  static BarcodeResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = BarcodeResult();

    for (var item in jsonObject["fields"])
      result._fields.addSafe(BarcodeField.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "fields": fields.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
