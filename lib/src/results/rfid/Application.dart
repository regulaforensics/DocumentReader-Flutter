//
//  Application.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure is used to describe the contents of a single LDS applica-tion
/// and their analysis within the context of the communication session with
/// electronic document.
class Application {
  /// Application identifier.
  String? get applicationID => _applicationID;
  String? _applicationID;

  /// Algorithm for calculating hash values for files for the proce-dure of PA.
  String? get dataHashAlgorithm => _dataHashAlgorithm;
  String? _dataHashAlgorithm;

  /// List of containers to store information about the read files of the application.
  List<File> get files => _files;
  List<File> _files = [];

  /// Status of the application selection procedure.
  RFIDErrorCodes get status => _status;
  late RFIDErrorCodes _status;

  /// Type of application of electronic document.
  RFIDApplicationType get type => _type;
  late RFIDApplicationType _type;

  /// Unicode version for application.
  String? get unicodeVersion => _unicodeVersion;
  String? _unicodeVersion;

  /// Application version.
  String? get version => _version;
  String? _version;

  /// Allows you to deserialize object.
  static Application? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Application();

    result._type = RFIDApplicationType.getByValue(jsonObject["type"])!;
    result._status = RFIDErrorCodes.getByValue(jsonObject["status"])!;
    result._applicationID = jsonObject["applicationID"];
    result._dataHashAlgorithm = jsonObject["dataHashAlgorithm"];
    result._unicodeVersion = jsonObject["unicodeVersion"];
    result._version = jsonObject["version"];
    for (var item in jsonObject["files"]) {
      result._files.addSafe(File.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "applicationID": applicationID,
        "dataHashAlgorithm": dataHashAlgorithm,
        "files": files.map((e) => e.toJson()).toList(),
        "status": status.value,
        "type": type.value,
        "unicodeVersion": unicodeVersion,
        "version": version,
      }.clearNulls();
}

/// Type of application of electronic document.
enum RFIDApplicationType {
  /// ePassport.
  E_PASSPORT(1),

  E_ID(2),

  E_SIGN(3),

  E_DL(4),

  /// Travel Records.
  LDS2_TRAVEL_RECORDS(5),

  /// Visa Records.
  LDS2_VISA_RECORDS(6),

  /// Add Biometrics.
  LDS2_ADD_BIOMETRICS(7),

  /// eDTC PC.
  E_DTC_PC(8);

  const RFIDApplicationType(this.value);
  final int value;

  static RFIDApplicationType? getByValue(int? i) {
    if (i == null) return null;
    return RFIDApplicationType.values.firstWhere((x) => x.value == i);
  }
}
