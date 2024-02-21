//
//  Validity.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure describing single value of the field.
class Validity {
  /// The value's origin source.
  ResultType get sourceType => _sourceType;
  late ResultType _sourceType;

  /// Overall validity status of all text fields of this particular field.
  CheckResult get status => _status;
  late CheckResult _status;

  /// Allows you to deserialize object.
  static Validity? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Validity();

    result._sourceType = ResultType.getByValue(jsonObject["sourceType"])!;
    result._status = CheckResult.getByValue(jsonObject["status"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "sourceType": sourceType.value,
        "status": status.value,
      }.clearNulls();
}
