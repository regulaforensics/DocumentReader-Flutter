//
//  GraphicField.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure, describing single graphic field extracted.
class GraphicField {
  /// Identifies zone whence data is extracted.
  ResultType get sourceType => _sourceType;
  late ResultType _sourceType;

  /// Graphic field logical type.
  GraphicFieldType get fieldType => _fieldType;
  late GraphicFieldType _fieldType;

  /// Graphic field symbolic name.
  String get fieldName => _fieldName;
  late String _fieldName;

  /// Light type.
  Lights get light => _light;
  late Lights _light;

  /// Light symbolic name.
  String get lightName => _lightName;
  late String _lightName;

  /// An index of the document page whence the graphic field is extracted.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Original page index.
  int get originalPageIndex => _originalPageIndex;
  late int _originalPageIndex;

  /// An image.
  Uint8List? get value => _value;
  Uint8List? _value;

  /// Field area coordinates on the general image.
  Rect? get fieldRect => _fieldRect;
  Rect? _fieldRect;

  /// Allows you to deserialize object.
  static GraphicField? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = GraphicField();

    result._sourceType = ResultType.getByValue(jsonObject["sourceType"])!;
    result._fieldType = GraphicFieldType.getByValue(jsonObject["fieldType"])!;
    result._light = Lights.getByValue(jsonObject["light"])!;
    result._pageIndex = jsonObject["pageIndex"];
    result._originalPageIndex = jsonObject["originalPageIndex"];
    result._fieldName = jsonObject["fieldName"];
    result._lightName = jsonObject["lightName"];
    result._value = _bytesFromBase64(jsonObject["value"]);
    result._fieldRect = Rect.fromJson(jsonObject["fieldRect"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "sourceType": sourceType.value,
        "fieldType": fieldType.value,
        "fieldName": fieldName,
        "light": light.value,
        "lightName": lightName,
        "pageIndex": pageIndex,
        "originalPageIndex": originalPageIndex,
        "value": _bytesToBase64(value),
        "fieldRect": fieldRect?.toJson(),
      }.clearNulls();
}
