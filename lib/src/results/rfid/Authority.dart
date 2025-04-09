//
//  Authority.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class Authority {
  List<Attribute> get attributes => _attributes;
  List<Attribute> _attributes = [];

  String? get data => _data;
  String? _data;

  RFIDValue? get friendlyName => _friendlyName;
  RFIDValue? _friendlyName;

  /// Allows you to deserialize object.
  static Authority? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Authority();

    result._data = jsonObject["data"];
    result._friendlyName = RFIDValue.fromJson(jsonObject["friendlyName"]);
    for (var item in jsonObject["attributes"]) {
      result._attributes.addSafe(Attribute.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "attributes": attributes.map((e) => e.toJson()).toList(),
        "data": data,
        "friendlyName": friendlyName?.toJson(),
      }.clearNulls();
}
