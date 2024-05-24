//
//  ResultsStatus.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Provision of document verification status.
class ResultsStatus {
  /// Summary of all results.
  CheckResult get overallStatus => _overallStatus;
  late CheckResult _overallStatus;

  /// Summary of all optical results. The same value as [OpticalStatus.overallStatus]
  CheckResult get optical => _optical;
  late CheckResult _optical;

  /// Container for an optical related scanning statuses.
  OpticalStatus get detailsOptical => _detailsOptical;
  late OpticalStatus _detailsOptical;

  /// Summary of all RFID results. Same as [RFIDStatus.overallStatus].
  CheckResult get rfid => _rfid;
  late CheckResult _rfid;

  /// Container for a RFID related scanning statuses.
  RFIDStatus get detailsRFID => _detailsRFID;
  late RFIDStatus _detailsRFID;

  /// Comparison status for portrait in the document aganist live or external image.
  CheckResult get portrait => _portrait;
  late CheckResult _portrait;

  /// Verification status for document data against database.
  CheckResult get stopList => _stopList;
  late CheckResult _stopList;

  /// Allows you to deserialize object.
  static ResultsStatus? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ResultsStatus();

    result._overallStatus =
        CheckResult.getByValue(jsonObject["overallStatus"])!;
    result._optical = CheckResult.getByValue(jsonObject["optical"])!;
    result._detailsOptical =
        OpticalStatus.fromJson(jsonObject["detailsOptical"])!;
    result._rfid = CheckResult.getByValue(jsonObject["rfid"])!;
    result._detailsRFID = RFIDStatus.fromJson(jsonObject["detailsRFID"])!;
    result._portrait = CheckResult.getByValue(jsonObject["portrait"])!;
    result._stopList = CheckResult.getByValue(jsonObject["stopList"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "overallStatus": overallStatus.value,
        "optical": optical.value,
        "rfid": rfid.value,
        "portrait": portrait.value,
        "stopList": stopList.value,
        "detailsOptical": detailsOptical.toJson(),
        "detailsRFID": detailsRFID.toJson(),
      }.clearNulls();
}
