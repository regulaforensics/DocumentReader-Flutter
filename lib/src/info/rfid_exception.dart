//
//  RFIDException.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class RFIDException {
  RFIDErrorCodes get code => _code;
  late RFIDErrorCodes _code;

  String get message => _message;
  late String _message;

  @visibleForTesting
  static RFIDException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDException();

    result._code = RFIDErrorCodes.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"code": code.value, "message": message}.clearNulls();
}
