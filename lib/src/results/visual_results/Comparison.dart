//
//  Comparison.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure describing single value of the field.
class Comparison {
  /// The value's origin source.
  ResultType get sourceTypeLeft => _sourceTypeLeft;
  late ResultType _sourceTypeLeft;

  /// The value's origin source.
  ResultType get sourceTypeRight => _sourceTypeRight;
  late ResultType _sourceTypeRight;

  /// The status of field comparisons.
  CheckResult get status => _status;
  late CheckResult _status;

  /// Allows you to deserialize object.
  static Comparison? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Comparison();

    result._sourceTypeLeft =
        ResultType.getByValue(jsonObject["sourceTypeLeft"])!;
    result._sourceTypeRight =
        ResultType.getByValue(jsonObject["sourceTypeRight"])!;
    result._status = CheckResult.getByValue(jsonObject["status"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["sourceTypeLeft"] = sourceTypeLeft.value;
    result["sourceTypeRight"] = sourceTypeRight.value;
    result["status"] = status.value;

    return result;
  }
}
