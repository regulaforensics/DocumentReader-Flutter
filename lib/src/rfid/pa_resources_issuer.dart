//
//  PAResourcesIssuer.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class PAResourcesIssuer {
  Uint8List get data => _data;
  late Uint8List _data;

  String? get friendlyName => _friendlyName;
  String? _friendlyName;

  List<PAAttribute> get attributes => _attributes;
  List<PAAttribute> _attributes = [];

  @visibleForTesting
  static PAResourcesIssuer? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PAResourcesIssuer();

    result._data = _bytesFromBase64(jsonObject["data"])!;
    result._friendlyName = jsonObject["friendlyName"];
    for (var item in jsonObject["attributes"]) {
      result._attributes.addSafe(PAAttribute.fromJson(item));
    }
    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "data": _bytesToBase64(data),
        "friendlyName": friendlyName,
        "attributes": attributes.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
