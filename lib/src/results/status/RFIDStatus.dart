//
//  RFIDStatus.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Container for a RFID related scanning statuses.
class RFIDStatus {
  /// Summary of all RFID results.
  CheckResult get overallStatus => _overallStatus;
  late CheckResult _overallStatus;

  /// Passive authentication status.
  CheckResult get pa => _pa;
  late CheckResult _pa;

  /// Chip authentication status.
  CheckResult get ca => _ca;
  late CheckResult _ca;

  /// Acitve authentication status.
  CheckResult get aa => _aa;
  late CheckResult _aa;

  /// Terminal authentication status.
  CheckResult get ta => _ta;
  late CheckResult _ta;

  /// Basics access control status.
  CheckResult get bac => _bac;
  late CheckResult _bac;

  /// Password authenticated connection establishment status.
  CheckResult get pace => _pace;
  late CheckResult _pace;

  /// Allows you to deserialize object.
  static RFIDStatus? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDStatus();

    result._pa = CheckResult.getByValue(jsonObject["pa"])!;
    result._ca = CheckResult.getByValue(jsonObject["ca"])!;
    result._aa = CheckResult.getByValue(jsonObject["aa"])!;
    result._ta = CheckResult.getByValue(jsonObject["ta"])!;
    result._bac = CheckResult.getByValue(jsonObject["bac"])!;
    result._pace = CheckResult.getByValue(jsonObject["pace"])!;
    result._overallStatus =
        CheckResult.getByValue(jsonObject["overallStatus"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "overallStatus": overallStatus.value,
        "pa": pa.value,
        "ca": ca.value,
        "aa": aa.value,
        "ta": ta.value,
        "bac": bac.value,
        "pace": pace.value,
      }.clearNulls();
}
