//
//  BarcodeField.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure describing single value of the field.
class BarcodeField {
  /// Decoded barcode type.
  BarcodeType get barcodeType => _barcodeType;
  late BarcodeType _barcodeType;

  /// Indicates barcode reading result.
  BarcodeStatus get status => _status;
  late BarcodeStatus _status;

  /// Contains the information about the PDF417 barcode.
  PDF417Info? get pdf417Info => _pdf417Info;
  PDF417Info? _pdf417Info;

  /// Results of reading data from barcode modules.
  Uint8List? get data => _data;
  Uint8List? _data;

  /// Indicates an index of the document page, whence the result is received.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Allows you to deserialize object.
  static BarcodeField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = BarcodeField();

    result._barcodeType = BarcodeType.getByValue(jsonObject["barcodeType"])!;
    result._status = BarcodeStatus.getByValue(jsonObject["status"])!;
    result._pageIndex = jsonObject["pageIndex"];
    result._pdf417Info = PDF417Info.fromJson(jsonObject["pdf417Info"]);
    result._data = _bytesFromBase64(jsonObject["data"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "barcodeType": barcodeType.value,
        "status": status.value,
        "pdf417Info": pdf417Info?.toJson(),
        "data": _bytesToBase64(data),
        "pageIndex": pageIndex,
      }.clearNulls();
}
