//
//  DocReaderVersion.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Class contains properties to get the information about the SDK.
class DocReaderVersion {
  /// A version of the API framework.
  String? get api => _api;
  String? _api;

  /// A version of the Core framework.
  String? get core => _core;
  String? _core;

  /// A type of the Core framework.
  String? get coreMode => _coreMode;
  String? _coreMode;

  /// A version of the database.
  DocumentsDatabase? get database => _database;
  DocumentsDatabase? _database;

  @visibleForTesting
  static DocReaderVersion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocReaderVersion();

    result._api = jsonObject["api"];
    result._core = jsonObject["core"];
    result._coreMode = jsonObject["coreMode"];
    result._database = DocumentsDatabase.fromJson(jsonObject["database"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "api": api,
        "core": core,
        "coreMode": coreMode,
        "database": database?.toJson()
      }.clearNulls();
}
