//
//  BarcodeStatus.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

enum BarcodeStatus {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// No error.
  NO_ERR(0),

  /// Null pointer of input arg/param error.
  NULL_PTR_ERR(-6001),

  /// Function arg/param is bad.
  BAD_ARG_ERR(-6002),

  /// Wrong value of data size.
  SIZE_ERR(-6003),

  /// Bad values of any parameter range.
  RANGE_ERR(-6004),

  /// Internal program error.
  INTERNAL_ERR(-6005),

  /// try-except process.
  TRY_EXCEPT_ERR(-6006),

  /// Barcode detection error.
  BAR_CODE_NOT_FOUND(-6008),

  /// Barcode decoding error.
  BAR_CODE_DECODE_ERR(-6010),

  /// "ImageProcess.dll" connection error.
  NO_USER_DLL_FOUND(-6019),

  /// IPP Dll connection error.
  NO_IPP_DLL_FOUND(-6020),

  /// Run-time error in IPP-function.
  IPP_EXEC_ERR(-6024),

  /// try-except execution in IPP-function.
  IPP_TRY_EXCEPT_ERR(-6025),

  /// Input data error.
  BARCODE_ERROR_INPUT_PARAM(-11001),

  /// Initialization error.
  BARCODE_ERROR_FINIT(-11006),

  /// "IpDecode.dll" connection error.
  BARCODE_ERROR_NOT_LOAD_IP_DECODED_LL(-11012),

  /// Internal program error.
  BARCODE_ERROR_INNER_PROBLEM(-11100),

  /// 1D-barcode decoding error.
  BARCODE_ERROR_DECODE_1D_BAD_DECODE(-11200),

  /// Row or Column count computational error (PDF417).
  BARCODE_ERROR_FIND_ROW_OR_COLUMN(-11201),

  /// MinX computational error (PDF417).
  BARCODE_ERROR_FIND_3X8_2D_X(-11202),

  /// MinY computational error (PDF417).
  BARCODE_ERROR_FIND_3X8_2D_Y(-11203),

  /// Invalid barcode angle (> 3 degree).
  BARCODE_ERROR_2D_UGOL_MAX(-11204),

  /// The result may contain decoding errors.
  BARCODE_ERROR_INDEFINITELY_DECODED(-11210),

  /// Dll initialization error.
  BARCODE_ERROR_DLL_NOT_INIT(-11300),

  /// try-except in IPDECODE-function.
  BARCODE_ERROR_IP_DECODE_DLL_Try_Except(-11400),

  /// Too many invalid code words.
  IPDECODE_ERROR_LARGEERRORS(-4503),

  /// Invalid number of columns.
  IPDECODE_ERROR_FAULTCOLUMNS(-4504),

  /// Invalid number of rows.
  IPDECODE_ERROR_FAULTROWS(-4505),

  /// Correction Level error.
  IPDECODE_ERROR_INCORRECT_ERROR_LEVEL(-4511),

  /// Loading "DevTable.bin" error.
  IPDECODE_ERROR_LOADING_DEV_TABLE(-4512);

  const BarcodeStatus(this.value);
  final int value;

  static BarcodeStatus? getByValue(int? i) {
    if (i == null) return null;
    try {
      return BarcodeStatus.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return BarcodeStatus.UNKNOWN;
    }
  }
}
