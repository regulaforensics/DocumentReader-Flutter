//
//  AuthenticityCheck.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class AuthenticityCheck {
  /// Indicates verification type result.
  Authenticity get type => _type;
  late Authenticity _type;

  /// Indicates verification result.
  CheckResult get status => _status;
  late CheckResult _status;

  int get pageIndex => _pageIndex;
  late int _pageIndex;

  List<AuthenticityElement> get elements => _elements;
  List<AuthenticityElement> _elements = [];

  String get typeName => _typeName;
  late String _typeName;

  /// Allows you to deserialize object.
  static AuthenticityCheck? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = AuthenticityCheck();

    result._type = Authenticity.getByValue(jsonObject["type"])!;
    result._status = CheckResult.getByValue(jsonObject["status"])!;
    result._typeName = jsonObject["typeName"];
    result._pageIndex = jsonObject["pageIndex"];
    for (var item in jsonObject["elements"]) {
      result.elements.addSafe(AuthenticityElement.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "type": type.value,
        "status": status.value,
        "pageIndex": pageIndex,
        "typeName": typeName,
        "elements": elements.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
