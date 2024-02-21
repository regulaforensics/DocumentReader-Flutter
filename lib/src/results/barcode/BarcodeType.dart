//
//  BarcodeType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Enumeration contains the types of barcodes that can be processed.
enum BarcodeType {
  /// Unknown.
  UNKNOWN(0),

  /// One-dimensional barcode, ISO 15417 (ANSI/AIM BC4-1999 Code 128).
  BCT_CODE128(1),

  /// One-dimensional barcode, ISO 16388 (ANSI/AIM BC1-1995 Code 39).
  CODE39(2),

  /// One-dimensional barcode, EAN8, ISO 15418.
  EAN8(3),

  /// One-dimensional barcode, Interleaved 2 of 5, ISO 16390 (ANSI/AIM BC2-1995 Interleaved 2 of 5).
  ITF(4),

  /// Two-dimensional barcode, ISO 15438 (AIM USS PDF417).
  PDF417(5),

  /// One-dimensional barcode, Standard 2 of 5 (Industrial).
  STF(6),

  /// One-dimensional barcode, Matrix 2 of 5.
  MTF(7),

  /// One-dimensional barcode, IATA 2 of 5 (Airline).
  IATA(8),

  /// One-dimensional barcode, (ANSI/AIM BC3-1995, USS - Codabar).
  CODABAR(9),

  /// One-dimensional barcode, UPC-A.
  UPCA(10),

  /// One-dimensional barcode, (ANSI/AIM BC5-1995, USS - Code 93).
  CODE93(11),

  /// One-dimensional barcode, UPC-E.
  UPCE(12),

  /// One-dimensional barcode, EAN13, ISO 15418.
  EAN13(13),

  /// Two-dimensional QR barcode.
  QRCODE(14),

  /// Two-dimensional AZTEC barcode.
  AZTEC(15),

  /// Two-dimensional DATAMATRIX barcode.
  DATAMATRIX(16),

  /// One-dimensional barcodes.
  ALL_1D(17),

  /// One-dimensional barcode, Code 11.
  CODE11(18),

  /// Two-dimensional barcode, JAB Code
  JABCODE(19);

  const BarcodeType(this.value);
  final int value;

  static BarcodeType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return BarcodeType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return BarcodeType.UNKNOWN;
    }
  }

  static List<BarcodeType>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<BarcodeType> list = [];
    for (int item in input) list.addSafe(getByValue(item));
    return list;
  }
}
