//
//  TextField.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Serves for storing information from one text data field.
class TextField {
  /// Textual field logical type.
  VisualFieldType get fieldType => _fieldType;
  late VisualFieldType _fieldType;

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

  Value? get getValue => _getValue;
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
    var result = new TextField();

    result._fieldType = VisualFieldType.getByValue(jsonObject["fieldType"])!;
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
    for (var item in jsonObject["values"])
      result._values.addSafe(Value.fromJson(item));
    for (var item in jsonObject["comparisonList"])
      result._comparisonList.addSafe(Comparison.fromJson(item));
    for (var item in jsonObject["validityList"])
      result._validityList.addSafe(Validity.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["fieldType"] = fieldType.value;
    result["fieldName"] = fieldName;
    result["lcid"] = lcid.value;
    result["lcidName"] = lcidName;
    result["value"] = value;
    result["getValue"] = getValue?.toJson();
    List<dynamic> list = [];
    for (var item in values) list.add(item.toJson());
    result["values"] = list;
    result["status"] = status.value;
    list = [];
    for (var item in comparisonList) list.add(item.toJson());
    result["comparisonList"] = list;
    list = [];
    for (var item in validityList) list.add(item.toJson());
    result["validityList"] = list;
    result["comparisonStatus"] = comparisonStatus.value;
    result["validityStatus"] = validityStatus.value;

    return result;
  }
}
