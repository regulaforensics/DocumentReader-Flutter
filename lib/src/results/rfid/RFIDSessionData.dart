//
//  RFIDSessionData.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Used to describe the results of work with the SDK within the context
/// of the current communication session with electronic document.
class RFIDSessionData {
  /// List of containers to store information about the supported procedures
  /// of authentication and secure data access within the context of the session.
  List<AccessControlProcedureType> get accessControls => _accessControls;
  List<AccessControlProcedureType> _accessControls = [];

  /// List of containers to store information about the involved ap-plications
  /// of electronic document.
  List<Application> get applications => _applications;
  List<Application> _applications = [];

  /// ist of containers to store information about the detected
  /// document security objects.
  List<SecurityObject> get securityObjects => _securityObjects;
  List<SecurityObject> _securityObjects = [];

  /// Set of electronic document chip characteristics.
  CardProperties? get cardProperties => _cardProperties;
  CardProperties? _cardProperties;

  /// Total number of bytes received from the RFID-chip during the whole session.
  int get totalBytesReceived => _totalBytesReceived;
  late int _totalBytesReceived;

  /// Total number of bytes transmitted to the RFID-chip during the whole session.
  int get totalBytesSent => _totalBytesSent;
  late int _totalBytesSent;

  /// Status.
  RFIDErrorCodes get status => _status;
  late RFIDErrorCodes _status;

  /// Sign of support of RFID-chip for extended length commands of reading.
  RFIDErrorCodes get extLeSupport => _extLeSupport;
  late RFIDErrorCodes _extLeSupport;

  /// Total time of all operations performed during the session, ms.
  int get processTime => _processTime;
  late int _processTime;

  /// List of data fields
  List<DataField> get dataFields => _dataFields;
  List<DataField> _dataFields = [];

  /// List of data groups.
  List<RFIDDataFileType>? get dataGroups => _dataGroups;
  List<RFIDDataFileType>? _dataGroups;

  /// Allows you to deserialize object.
  static RFIDSessionData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RFIDSessionData();

    result._totalBytesReceived = jsonObject["totalBytesReceived"];
    result._totalBytesSent = jsonObject["totalBytesSent"];
    result._status = RFIDErrorCodes.getByValue(jsonObject["status"])!;
    result._extLeSupport =
        RFIDErrorCodes.getByValue(jsonObject["extLeSupport"])!;
    result._processTime = jsonObject["processTime"];
    result._cardProperties =
        CardProperties.fromJson(jsonObject["cardProperties"]);
    for (var item in jsonObject["accessControls"])
      result._accessControls.addSafe(AccessControlProcedureType.fromJson(item));
    for (var item in jsonObject["applications"])
      result._applications.addSafe(Application.fromJson(item));
    for (var item in jsonObject["securityObjects"])
      result._securityObjects.addSafe(SecurityObject.fromJson(item));
    for (var item in jsonObject["dataFields"])
      result._dataFields.addSafe(DataField.fromJson(item));
    if (jsonObject["dataGroups"] != null) {
      result._dataGroups = [];
      for (var item in jsonObject["dataGroups"])
        result._dataGroups!.addSafe(RFIDDataFileType.getByValue(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "cardProperties": cardProperties?.toJson(),
        "totalBytesReceived": totalBytesReceived,
        "totalBytesSent": totalBytesSent,
        "status": status.value,
        "extLeSupport": extLeSupport.value,
        "processTime": processTime,
        "accessControls": accessControls.map((e) => e.toJson()).toList(),
        "applications": applications.map((e) => e.toJson()).toList(),
        "securityObjects": securityObjects.map((e) => e.toJson()).toList(),
        "dataFields": dataFields.map((e) => e.toJson()).toList(),
        "dataGroups": dataGroups?.map((e) => e.value).toList(),
      }.clearNulls();
}
