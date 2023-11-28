//
//  RFIDValidity.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class RFIDValidity {
  RFIDValue? get notAfter => _notAfter;
  RFIDValue? _notAfter;

  RFIDValue? get notBefore => _notBefore;
  RFIDValue? _notBefore;

  /// Allows you to deserialize object.
  static RFIDValidity? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RFIDValidity();

    result._notAfter = RFIDValue.fromJson(jsonObject["notAfter"]);
    result._notBefore = RFIDValue.fromJson(jsonObject["notBefore"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["notAfter"] = notAfter?.toJson();
    result["notBefore"] = notBefore?.toJson();

    return result;
  }
}
