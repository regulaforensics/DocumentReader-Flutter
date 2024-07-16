//
//  PDF417Info.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class PDF417Info {
  /// Barcode error correction level.
  int get errorLevel => _errorLevel;
  late int _errorLevel;

  /// Number of columns in a barcode.
  int get columns => _columns;
  late int _columns;

  /// Number of rows in a barcode.
  int get rows => _rows;
  late int _rows;

  /// Allows you to deserialize object.
  static PDF417Info? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PDF417Info();

    result._errorLevel = jsonObject["errorLevel"];
    result._columns = jsonObject["columns"];
    result._rows = jsonObject["rows"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "errorLevel": errorLevel,
        "columns": columns,
        "rows": rows,
      }.clearNulls();
}
