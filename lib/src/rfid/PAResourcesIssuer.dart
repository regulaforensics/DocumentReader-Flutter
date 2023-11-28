//
//  PAResourcesIssuer.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

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
    var result = new PAResourcesIssuer();

    result._data = base64Decode(jsonObject["data"]);
    result._friendlyName = jsonObject["friendlyName"];
    for (var item in jsonObject["attributes"])
      result._attributes.addSafe(PAAttribute.fromJson(item));

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["data"] = base64Encode(data);
    result["friendlyName"] = friendlyName;
    List<dynamic> list = [];
    for (var item in attributes) list.add(item.toJson());
    result["attributes"] = list;

    return result;
  }
}
