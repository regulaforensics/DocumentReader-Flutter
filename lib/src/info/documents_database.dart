//
//  DocumentsDatabase.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Class contains properties to get the information about the database.
class DocumentsDatabase {
  /// An ID of the database, e.g. BLR, RUS.
  String? get databaseID => _databaseID;
  String? _databaseID;

  /// A version of the database.
  String? get version => _version;
  String? _version;

  /// A date when the database was created.
  String? get date => _date;
  String? _date;

  /// A list of supported documents in the database.
  String? get databaseDescription => _databaseDescription;
  String? _databaseDescription;

  /// A number of countries included in the database.
  int get countriesNumber => _countriesNumber;
  late int _countriesNumber;

  /// A number of documents included in the database.
  int get documentsNumber => _documentsNumber;
  late int _documentsNumber;

  /// Database size. In bytes.
  /// Available for database update check.
  int? get size => _size;
  int? _size;

  @visibleForTesting
  static DocumentsDatabase? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocumentsDatabase();

    result._databaseID = jsonObject["databaseID"];
    result._version = jsonObject["version"];
    result._date = jsonObject["date"];
    result._databaseDescription = jsonObject["databaseDescription"];
    result._countriesNumber = jsonObject["countriesNumber"];
    result._documentsNumber = jsonObject["documentsNumber"];
    result._size = jsonObject["size"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "databaseID": databaseID,
        "version": version,
        "date": date,
        "databaseDescription": databaseDescription,
        "countriesNumber": countriesNumber,
        "documentsNumber": documentsNumber,
        "size": size,
      }.clearNulls();
}
