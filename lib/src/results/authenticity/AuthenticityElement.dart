//
//  AuthenticityElement.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class AuthenticityElement {
  /// Indicates verification result of the field.
  CheckResult get status => _status;
  CheckResult _status = CheckResult.WAS_NOT_DONE;

  /// Indicates element type.
  SecurityFeatureType get elementType => _elementType;
  late SecurityFeatureType _elementType;

  /// Indicates element diagnose.
  CheckDiagnose get elementDiagnose => _elementDiagnose;
  late CheckDiagnose _elementDiagnose;

  String get elementTypeName => _elementTypeName;
  late String _elementTypeName;

  String get elementDiagnoseName => _elementDiagnoseName;
  late String _elementDiagnoseName;

  /// Allows you to deserialize object.
  static AuthenticityElement? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = AuthenticityElement();

    result._status = CheckResult.getByValue(jsonObject["status"])!;
    result._elementType =
        SecurityFeatureType.getByValue(jsonObject["elementType"])!;
    result._elementDiagnose =
        CheckDiagnose.getByValue(jsonObject["elementDiagnose"])!;
    result._elementTypeName = jsonObject["elementTypeName"];
    result._elementDiagnoseName = jsonObject["elementDiagnoseName"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "status": status.value,
        "elementType": elementType.value,
        "elementDiagnose": elementDiagnose.value,
        "elementTypeName": elementTypeName,
        "elementDiagnoseName": elementDiagnoseName,
      }.clearNulls();
}
