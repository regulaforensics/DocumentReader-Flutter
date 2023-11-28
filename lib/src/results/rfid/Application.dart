//
//  Application.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

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
  int get type => _type;
  late int _type;

  /// Unicode version for application.
  String? get unicodeVersion => _unicodeVersion;
  String? _unicodeVersion;

  /// Application version.
  String? get version => _version;
  String? _version;

  /// Allows you to deserialize object.
  static Application? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Application();

    result._type = jsonObject["type"];
    result._status = RFIDErrorCodes.getByValue(jsonObject["status"])!;
    result._applicationID = jsonObject["applicationID"];
    result._dataHashAlgorithm = jsonObject["dataHashAlgorithm"];
    result._unicodeVersion = jsonObject["unicodeVersion"];
    result._version = jsonObject["version"];
    for (var item in jsonObject["files"])
      result._files.addSafe(File.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["applicationID"] = applicationID;
    result["dataHashAlgorithm"] = dataHashAlgorithm;
    List<dynamic> list = [];
    for (var item in files) list.add(item.toJson());
    result["files"] = list;
    result["status"] = status.value;
    result["type"] = type;
    result["unicodeVersion"] = unicodeVersion;
    result["version"] = version;

    return result;
  }
}
