//
//  TextResult.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure, containing all text data extracted and recognized from the document.
class TextResult {
  /// Textual fields check result.
  CheckResult get status => _status;
  late CheckResult _status;

  /// Comparison status of all text fields.
  CheckResult get comparisonStatus => _comparisonStatus;
  late CheckResult _comparisonStatus;

  /// Validity status of all text fields.
  CheckResult get validityStatus => _validityStatus;
  late CheckResult _validityStatus;

  /// List of all available origin source with overall validity
  /// status of all text fields of a particular source type.
  List<TextSource> get availableSourceList => _availableSourceList;
  List<TextSource> _availableSourceList = [];

  /// An array of textual results.
  List<TextField> get fields => _fields;
  List<TextField> _fields = [];

  /// Allows you to deserialize object.
  static TextResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new TextResult();

    result._status = CheckResult.getByValue(jsonObject["status"])!;
    result._comparisonStatus =
        CheckResult.getByValue(jsonObject["comparisonStatus"])!;
    result._validityStatus =
        CheckResult.getByValue(jsonObject["validityStatus"])!;
    for (var item in jsonObject["availableSourceList"])
      result._availableSourceList.addSafe(TextSource.fromJson(item));
    for (var item in jsonObject["fields"])
      result._fields.addSafe(TextField.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["status"] = status.value;
    result["comparisonStatus"] = comparisonStatus.value;
    result["validityStatus"] = validityStatus.value;
    List<dynamic> list = [];
    for (var item in availableSourceList) list.add(item.toJson());
    result["availableSourceList"] = list;
    list = [];
    for (var item in fields) list.add(item.toJson());
    result["fields"] = list;

    return result;
  }
}
