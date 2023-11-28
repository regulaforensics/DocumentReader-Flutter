//
//  GraphicResult.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure, containing all graphic fields extracted.
class GraphicResult {
  /// An array of graphic results.
  List<GraphicField> get fields => _fields;
  List<GraphicField> _fields = [];

  /// Allows you to deserialize object.
  static GraphicResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new GraphicResult();

    for (var item in jsonObject["fields"])
      result._fields.addSafe(GraphicField.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    List<dynamic> list = [];
    for (var item in fields) list.add(item.toJson());
    result["fields"] = list;

    return result;
  }
}
