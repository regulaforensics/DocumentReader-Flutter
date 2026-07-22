//
//  DocReaderException.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class DocReaderException {
  ErrorCodes get code => _code;
  late ErrorCodes _code;

  String get message => _message;
  late String _message;

  DocReaderException.unknown() {
    _code = ErrorCodes.UNKNOWN;
    _message = "Unknown exception";
  }

  @visibleForTesting
  static DocReaderException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocReaderException.unknown();

    result._code = ErrorCodes.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"code": code.value, "message": message}.clearNulls();
}

/// Enum contains all possible error codes
enum ErrorCodes {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  ///  A Core framework is absent.
  INITIALIZATION_CORE_ABSENT(0),

  /// The reader is not initialized or an unknown initialization error occured.
  INITIALIZATION_FAILED(1),

  /// This scenario is not supported based on your license and Core framework
  /// capabilities.
  INCORRECT_SCENARIO(2),

  /// There are no results after recognition of camera frames.
  NO_RESULT(3),

  /// An error is encountered during database removal.
  REMOVE_DATABASE(4),

  /// An error is encountered during database download.
  FETCHING_DATABASE(5),

  /// An incorrect database ID.
  DB_ID_NOT_FOUND(6),

  /// An incorrect database ID.
  DB_DESCRIPTION_NOT_FOUND(7),

  /// An error is encountered during database save on your device.
  SAVE_DB(8),

  /// A database is corrupted.
  DOWNLOAD_DB_INCORRECT_CHECKSUM(9),

  /// A database is corrupted.
  DB_DOWNLOAD(10),

  /// Deprecated.
  DB_CREATION(11),

  /// An RFID error.
  RFID_ERROR(12),

  /// A license is absent or corrupted.
  LICENSE_ABSENT_OR_CORRUPTED(13),

  /// An invalid date, i.e. the license may be expired, or the date and time of
  /// set on the device doesn't correspond to reality.
  LICENSE_INVALID_DATE(14),

  /// An invalid version.
  LICENSE_INVALID_VERSION(15),

  /// An invalid device ID.
  LICENSE_INVALID_DEVICE_ID(16),

  /// An invalid OS or application ID.
  LICENSE_INVALID_SYSTEM_OR_APP_ID(17),

  /// There are no capabilities for this functionality in your license.
  LICENSE_NO_CAPABILITIES(18),

  /// There are no authenticity capabilities in your license.
  LICENSE_NO_AUTHENTICITY(19),

  /// An invalid URL of the video during its generating.
  RECORD_PROCESS_INVALID_OUTPUT_URL(20),

  /// Something went wrong with online license processing.
  LICENSE_ONLINE_ERROR(21),

  /// db.dat is absent.
  LICENSE_NO_DATABASE(22),

  /// db.dat is incorrect.
  LICENSE_DATABASE_INCORRECT(23),

  /// Failed to set TCC params.
  INVALID_TCC_PARAMS(24),

  /// The operation failed due to RFID reading has already started.
  RFID_IN_PROGRESS(25),

  START_BACKEND_PROCESSING(26),

  ADD_DATA_TO_PACKAGE(27),

  FINALIZE_FAILED(28),

  CAMERA_NO_PERMISSION(29),

  CAMERA_NOT_AVAILABLE(30),

  /// The camera not supported in this scenario.
  CANNOT_USE_CAMERA_IN_SCENARIO(40),

  BLUETOOTH_NO_PERMISSION(41),

  BACKEND_ONLINE_PROCESSING(303),

  WRONG_INPUT(400),

  /// Missing output result.
  RESULT_UNAVAILABLE(410),

  /// Incorrect result output.
  RESULT_WRONG_OUTPUT(411),

  STATE_EXCEPTION(500),

  BLE_EXCEPTION(600),

  FEATURE_BLUETOOTH_LE_NOT_SUPPORTED(601),

  APP_BACKGROUND(700),

  ONLINE_PROCESSING_WRONG_INPUT(800),

  MDL_EXCEPTION(900),

  NATIVE_JAVA_EXCEPTION(1000);

  const ErrorCodes(this.value);
  final int value;

  static ErrorCodes? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ErrorCodes.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ErrorCodes.UNKNOWN;
    }
  }
}
