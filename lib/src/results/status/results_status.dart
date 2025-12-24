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

  /// Summary of all mDL results.
  CheckResult get mDL => _mDL;
  late CheckResult _mDL;

  /// Summary of all age results.
  CheckResult get age => _age;
  late CheckResult _age;

  /// Android only.
  CheckResult? get captureProcessIntegrity => _captureProcessIntegrity;
  late CheckResult? _captureProcessIntegrity;

  /// Container for an details age scanning statuses.
  AgeStatus get ageStatus => _ageStatus;
  late AgeStatus _ageStatus;

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
    result._mDL = CheckResult.getByValue(jsonObject["mDL"])!;
    result._age = CheckResult.getByValue(jsonObject["age"])!;
    result._captureProcessIntegrity =
        CheckResult.getByValue(jsonObject["captureProcessIntegrity"]);
    result._ageStatus = AgeStatus.fromJson(jsonObject["detailsAge"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "overallStatus": overallStatus.value,
        "optical": optical.value,
        "rfid": rfid.value,
        "portrait": portrait.value,
        "stopList": stopList.value,
        "mDL": mDL.value,
        "age": age.value,
        "captureProcessIntegrity": captureProcessIntegrity?.value,
        "detailsOptical": detailsOptical.toJson(),
        "detailsAge": ageStatus.toJson(),
        "detailsRFID": detailsRFID.toJson(),
      }.clearNulls();
}
