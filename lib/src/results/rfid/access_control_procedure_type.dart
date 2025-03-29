//
//  AccessControlProcedureType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure is used to describe the results of a single authentication
/// procedure or a procedure of secure data access within the context
/// of the communication session with electronic document.
class AccessControlProcedureType {
  /// Index of the active variant of the procedure.
  int get activeOptionIdx => _activeOptionIdx;
  late int _activeOptionIdx;

  /// List of remarks arisen during the procedure.
  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  /// Procedure status.
  RFIDErrorCodes get status => _status;
  late RFIDErrorCodes _status;

  /// Procedure type.
  RFIDAccessControlProcedureType get type => _type;
  late RFIDAccessControlProcedureType _type;

  /// Allows you to deserialize object.
  static AccessControlProcedureType? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = AccessControlProcedureType();

    result._activeOptionIdx = jsonObject["activeOptionIdx"];
    result._type =
        RFIDAccessControlProcedureType.getByValue(jsonObject["type"])!;
    result._status = RFIDErrorCodes.getByValue(jsonObject["status"])!;
    result._notifications = _intListFrom(jsonObject["notifications"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "activeOptionIdx": activeOptionIdx,
        "notifications": notifications,
        "status": status.value,
        "type": type.value,
      }.clearNulls();
}
