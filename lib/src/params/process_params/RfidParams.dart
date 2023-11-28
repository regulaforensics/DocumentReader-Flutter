//
//  RfidParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class RFIDParams {
  /// A list of notification codes that should be ignored during
  /// passive authentication (PA).
  List<int>? paIgnoreNotificationCodes;

  /// Allows you to deserialize object.
  static RFIDParams? fromJson(jsonObject) {
    var result = new RFIDParams();
    if (jsonObject == null) return null;

    result.paIgnoreNotificationCodes = jsonObject["paIgnoreNotificationCodes"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (paIgnoreNotificationCodes != null)
      result["paIgnoreNotificationCodes"] = paIgnoreNotificationCodes;

    return result;
  }
}
