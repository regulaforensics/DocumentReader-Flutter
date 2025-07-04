//
//  RfidParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class RFIDParams {
  /// A list of notification codes that should be ignored during
  /// passive authentication (PA).
  List<int>? get paIgnoreNotificationCodes => _paIgnoreNotificationCodes;
  List<int>? _paIgnoreNotificationCodes;

  RFIDParams({List<int>? paIgnoreNotificationCodes})
      : _paIgnoreNotificationCodes = paIgnoreNotificationCodes;

  /// Allows you to deserialize object.
  static RFIDParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return RFIDParams(
      paIgnoreNotificationCodes: _intListFrom(
        jsonObject["paIgnoreNotificationCodes"],
      ),
    );
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {"paIgnoreNotificationCodes": paIgnoreNotificationCodes}.clearNulls();
}
