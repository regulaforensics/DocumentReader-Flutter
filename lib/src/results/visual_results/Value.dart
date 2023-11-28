//
//  Value.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure describing single value of the field.
class Value {
  /// Identifies zone whence data is extracted.
  ResultType get sourceType => _sourceType;
  late ResultType _sourceType;

  /// A value.
  String? get value => _value;
  String? _value;

  /// An original value.
  String? get originalValue => _originalValue;
  String? _originalValue;

  /// An index of the document page whence the textual field is extracted.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Field rectangular area coordinates on the image.
  Rect? get boundRect => _boundRect;
  Rect? _boundRect;

  /// RFID origin data. Only for the 'RFID' source.
  RFIDOrigin? get rfidOrigin => _rfidOrigin;
  RFIDOrigin? _rfidOrigin;

  /// List of all symbols for this value.
  List<Symbol> get originalSymbols => _originalSymbols;
  List<Symbol> _originalSymbols = [];

  /// Textual field recognition probability (0 - 100, %).
  int get probability => _probability;
  late int _probability;

  /// Allows you to deserialize object.
  static Value? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Value();

    result._pageIndex = jsonObject["pageIndex"];
    result._sourceType = ResultType.getByValue(jsonObject["sourceType"])!;
    result._probability = jsonObject["probability"];
    result._value = jsonObject["value"];
    result._originalValue = jsonObject["originalValue"];
    result._boundRect = Rect.fromJson(jsonObject["boundRect"]);
    for (var item in jsonObject["originalSymbols"])
      result._originalSymbols.addSafe(Symbol.fromJson(item));
    result._rfidOrigin = RFIDOrigin.fromJson(jsonObject["rfidOrigin"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["sourceType"] = sourceType.value;
    result["value"] = value;
    result["originalValue"] = originalValue;
    result["pageIndex"] = pageIndex;
    result["boundRect"] = boundRect?.toJson();
    result["rfidOrigin"] = rfidOrigin?.toJson();
    List<dynamic> list = [];
    for (var item in originalSymbols) list.add(item.toJson());
    result["originalSymbols"] = list;
    result["probability"] = probability;

    return result;
  }
}
