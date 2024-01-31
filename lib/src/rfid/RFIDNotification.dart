//
//  RFIDNotification.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure containing data of notification about RFID reading process.
class RFIDNotification {
  /// RFID notification code.
  RFIDNotificationCodes get notificationCode => _notificationCode;
  late RFIDNotificationCodes _notificationCode;

  /// Defines the file type (or logical belonging of the data object) within
  /// the context of the communication session with electronic document.
  RFIDDataFileType get dataFileType => _dataFileType;
  late RFIDDataFileType _dataFileType;

  /// RFID progress.
  int get progress => _progress;
  late int _progress;

  @visibleForTesting
  static RFIDNotification? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDNotification();

    result._notificationCode =
        RFIDNotificationCodes.getByValue(jsonObject["notificationCode"])!;
    result._dataFileType =
        RFIDDataFileType.getByValue(jsonObject["dataFileType"])!;
    result._progress = jsonObject["progress"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "notificationCode": notificationCode.value,
        "dataFileType": dataFileType.value,
        "progress": progress
      }.clearNulls();
}

/// Enumeration contains a set of notification returned
/// to the user application by calling the callback-function.
enum RFIDNotificationCodes {
  /// Will be returned by [getByValue] if a non-existent value was passed.
  UNKNOWN(-1),

  /// The notification indicates an error.
  ERROR(65536),

  /// Event of appearance of RFID-chip in the scope of the reader antenna
  /// or its moving away from the scope of the reader.
  DOCUMENT_READY(65537),

  /// Event of the beginning/end of data reading from the RFID-chip via ISO/IEC
  /// 14443-4 proto-col When working in the batch mode.
  READ_PROTOCOL4(65539),

  /// Event of the beginning/end of data reading from the RFID-chip via ISO/IEC
  /// 14443-3 proto-col.
  READ_PROTOCOL3(65546),

  /// Indication of the progress of execution of data reading operation.
  PROGRESS(65547),

  /// Indication of the next step of terminal authentication in
  /// Online-authentication mode.
  TA_STEP(65550),

  /// Event of detection of the need to organize a secure communication channel.
  SM_REQUIRED(65551),

  /// Event informing the user application on detection of data incompliance
  /// processed with the regulations of normative documents, errors when
  /// executing the current operation.
  ISO_ERROR(69632),

  /// Request of the user-defined DS-certificate priot to the procedure of digital
  /// signature verifi-cation of EF.SOD document security object in the batch mode.
  PA_REQUEST(77824),

  /// Event of the result of the opening of a secure communication channel.
  SM_ESTABLISHED(81935),

  /// Event of unplugging of the RFID-chip reader from the PC.
  PCSC_READER_DISCONNECTED(131072),

  /// Event of the beginning of reorganization of the list of RFID-readers
  /// connected to the PC, working under PC/SC-driver control.
  PCSC_READER_LIST_CHANGED(131073),

  /// Transfer of the total amount of information received from the RFID-chip
  /// to the user appli-cation during execution of data reading operation.
  PCSC_BYTES_RECEIVED(131074),

  /// Transfer of the total time of execution of data reading operation
  /// to the user application.
  PCSC_TOTAL_READING_TIME(131075),

  /// Transfer of the total amount of information and service groups data
  /// received from the RF-ID-chip to the user application during execution
  /// of data reading operation.
  PCSC_DATA_RECEIVED(131076),

  /// Transfer of the total amount of information transmitted to the RFID-chip
  /// to the user appli-cation during execution of data reading operation.
  PCSC_BYTES_SENT(131077),

  /// Transfer of the average data reading rate to the user application.
  PCSC_TOTAL_READING_SPEED(131078),

  /// Transfer of the total time of execution of data reading procedure
  /// to the user application.
  PCSC_TOTAL_PROCESS_TIME(131079),

  /// Event of the beginning of reorganization of the list of RFID-readers
  /// connected to the PC, working under PC/SC-driver control.
  PCSC_READER_LIST_CHANGING(131080),

  /// Event of detection of extended length reading commands support
  /// by the RFID-chip.
  PCSC_EXT_LENGTH_SUPPORT(131088),

  /// Event of the start/end of the certificate chain formation for the
  /// document security object digital signature verification
  /// as a part of passive authentication procedure.
  PA_CERTIFICATE_CHAIN(131089),

  /// Event that indicates a type of the current analyzed element of the
  /// certificate chain being composed.
  ///
  /// All subsequent notifications prior to the next [PA_CERTIFICATE_CHAIN_ITEM]
  /// or [PA_CERTIFICATE_CHAIN] will correspond to this element.
  PA_CERTIFICATE_CHAIN_ITEM(131090),

  /// A request from the user application of some data or actions in a certain
  /// step of the scenario.
  SCENARIO(131104),

  /// Event of the beginning/end of file reading.
  PCSC_READING_DATAGROUP(196608),

  /// Event of detection of file absence.
  PCSC_FILE_NOT_FOUND(262144),

  /// Event of reaching the file end when performing its reading.
  PCSC_END_OF_FILE(327680),

  /// Event of detection of absence of the file access rights.
  PCSC_FILE_ACCESS_DENIED(393216),

  /// Event of the application selection operation.
  PCSC_APPLICATION_SELECTED(458752),

  /// Event of the beginning of the authentication or secure data access procedure.
  AC_PROCEDURE_START(524288),

  /// Event of the end of the authentication or secure data access procedure.
  AC_PROCEDURE_FINISH(589824),

  /// Event of the data security object verification as part of PA.
  PA_SECURITY_OBJECT_CHECK(655360),

  /// Event of the file data integrity checking as part of PA.
  PA_FILE_CHECK(720896),

  /// Event of the procedure of file contents updating.
  PCSC_UPDATING_DATAGROUP(786432),

  /// Event of the auxiliary data verification.
  AUXILIARY_DATA_VALIDATION(851968),

  /// Event of the receiving of the sector identifier data during RI.
  RI_SECTOR_ID(917504),

  /// Event of the detection of real biometric data absence in DG3 or DG4
  /// and random filling data usage.
  BIOMETRICS_EMPTY_PLACEHOLDER(983040);

  const RFIDNotificationCodes(this.value);
  final int value;

  static RFIDNotificationCodes? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDNotificationCodes.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDNotificationCodes.UNKNOWN;
    }
  }
}
