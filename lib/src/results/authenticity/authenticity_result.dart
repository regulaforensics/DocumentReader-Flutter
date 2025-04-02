//
//  AuthenticityResult.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class AuthenticityResult {
  @Deprecated("since 7.6, use `ResultsStatus.optical` instead")
  CheckResult get status => _status;
  late CheckResult _status;

  List<AuthenticityCheck> get checks => _checks;
  List<AuthenticityCheck> _checks = [];

  /// Allows you to deserialize object.
  static AuthenticityResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = AuthenticityResult();

    result._status = CheckResult.getByValue(jsonObject["status"])!;
    for (var item in jsonObject["checks"]) {
      result._checks.addSafe(AuthenticityCheck.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "status": status.value,
        "checks": checks.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
