//
//  TransactionInfo.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class TransactionInfo {
  String? get transactionId => _transactionId;
  String? _transactionId;

  String? get tag => _tag;
  String? _tag;

  /// Allows you to deserialize object.
  static TransactionInfo? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = TransactionInfo();

    result._transactionId = jsonObject["transactionId"];
    result._tag = jsonObject["tag"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "tag": tag,
      }.clearNulls();
}
