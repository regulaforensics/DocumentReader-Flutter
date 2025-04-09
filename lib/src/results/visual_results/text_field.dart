//
//  TextField.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Serves for storing information from one text data field.
class TextField {
  /// Textual field logical type.
  FieldType get fieldType => _fieldType;
  late FieldType _fieldType;

  /// Textual field symbolic name.
  String get fieldName => _fieldName;
  late String _fieldName;

  /// ID of language-culture to differentiate one field of the same type from
  ///  another (for example Belarus Passport Page # 31 – Belarusian and Russian
  /// fields of the same type).
  LCID get lcid => _lcid;
  late LCID _lcid;

  /// LCID symbolic name.
  String get lcidName => _lcidName;
  late String _lcidName;

  /// Value from the field.
  String? get value => _value;
  String? _value;

  Value? getValue() => _getValue;
  Value? _getValue;

  /// An array of values.
  List<Value> get values => _values;
  List<Value> _values = [];

  /// Textual field check result.
  CheckResult get status => _status;
  late CheckResult _status;

  /// List of all comparison statuses for this field type.
  List<Comparison> get comparisonList => _comparisonList;
  List<Comparison> _comparisonList = [];

  /// List of all  validity statuses for this field type.
  List<Validity> get validityList => _validityList;
  List<Validity> _validityList = [];

  /// Comparison result of the field.
  CheckResult get comparisonStatus => _comparisonStatus;
  late CheckResult _comparisonStatus;

  /// Validity result of the field
  CheckResult get validityStatus => _validityStatus;
  late CheckResult _validityStatus;

  /// Allows you to deserialize object.
  static TextField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = TextField();

    result._fieldType = FieldType.getByValue(jsonObject["fieldType"])!;
    result._lcid = LCID.getByValue(jsonObject["lcid"])!;
    result._status = CheckResult.getByValue(jsonObject["status"])!;
    result._comparisonStatus =
        CheckResult.getByValue(jsonObject["comparisonStatus"])!;
    result._validityStatus =
        CheckResult.getByValue(jsonObject["validityStatus"])!;
    result._lcidName = jsonObject["lcidName"];
    result._fieldName = jsonObject["fieldName"];
    result._value = jsonObject["value"];
    result._getValue = Value.fromJson(jsonObject["getValue"]);
    for (var item in jsonObject["values"]) {
      result._values.addSafe(Value.fromJson(item));
    }
    for (var item in jsonObject["comparisonList"]) {
      result._comparisonList.addSafe(Comparison.fromJson(item));
    }
    for (var item in jsonObject["validityList"]) {
      result._validityList.addSafe(Validity.fromJson(item));
    }
    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "fieldType": fieldType.value,
        "fieldName": fieldName,
        "lcid": lcid.value,
        "lcidName": lcidName,
        "value": value,
        "getValue": getValue()?.toJson(),
        "values": values.map((e) => e.toJson()).toList(),
        "status": status.value,
        "comparisonList": comparisonList.map((e) => e.toJson()).toList(),
        "validityList": validityList.map((e) => e.toJson()).toList(),
        "comparisonStatus": comparisonStatus.value,
        "validityStatus": validityStatus.value,
      }.clearNulls();
}
