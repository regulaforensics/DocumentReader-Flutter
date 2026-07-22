part of "../../flutter_document_reader_api.dart";

/// Class contains properties to get the information about the license.
class License {
  /// Allows you to get an expiration date of your license.
  String? get expiryDate => _expiryDate;
  String? _expiryDate;

  /// Allows you to get a list of country identifiers which are defined for
  /// processing in the license. If the array is empty, there are no
  /// restrictions for processing.
  List<String>? get countryFilter => _countryFilter;
  List<String>? _countryFilter;

  /// Allows you to verify that RFID chip reading capabilities are added to your license.
  bool get isRfidAvailable => _isRfidAvailable;
  late bool _isRfidAvailable;

  @visibleForTesting
  static License? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = License();

    result._expiryDate = jsonObject["expiryDate"];
    result._countryFilter = _stringListFrom(jsonObject["countryFilter"]);
    result._isRfidAvailable = jsonObject["isRfidAvailable"] ?? false;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "expiryDate": expiryDate,
        "countryFilter": countryFilter,
        "isRfidAvailable": isRfidAvailable,
      }.clearNulls();
}
