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
    var result = new BarcodeResult();

    for (var item in jsonObject["fields"])
      result._fields.addSafe(BarcodeField.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    List<dynamic> list = [];
    for (var item in fields) list.add(item.toJson());
    result["fields"] = list;

    return result;
  }
}
