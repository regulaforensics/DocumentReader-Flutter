//
//  TextSource.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure describing single value of the field.
class TextSource {
  /// The value's origin source.
  ResultType get sourceType => _sourceType;
  late ResultType _sourceType;

  /// The value's origin source string description.
  String? get source => _source;
  String? _source;

  /// Overall validity status of all text fields of this source type.
  CheckResult get validityStatus => _validityStatus;
  late CheckResult _validityStatus;

  /// Allows you to deserialize object.
  static TextSource? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = TextSource();

    result._sourceType = ResultType.getByValue(jsonObject["sourceType"])!;
    result._source = jsonObject["source"];
    result._validityStatus =
        CheckResult.getByValue(jsonObject["validityStatus"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "sourceType": sourceType.value,
        "source": source,
        "validityStatus": validityStatus.value,
      }.clearNulls();
}
