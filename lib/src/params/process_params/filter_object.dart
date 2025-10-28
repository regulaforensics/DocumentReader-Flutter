part of "../../../flutter_document_reader_api.dart";

class FilterObject {
  FilterObjectType? docIDsFilter;
  FilterObjectType? docFormatsFilter;
  FilterObjectType? docCategoriesFilter;
  FilterObjectType? docCountriesFilter;

  /// Allows you to deserialize object.
  static FilterObject fromJson(jsonObject) {
    var result = FilterObject();
    result.docIDsFilter = FilterObjectType.fromJson(jsonObject["docIDsFilter"]);
    result.docFormatsFilter =
        FilterObjectType.fromJson(jsonObject["docFormatsFilter"]);
    result.docCategoriesFilter =
        FilterObjectType.fromJson(jsonObject["docCategoriesFilter"]);
    result.docCountriesFilter =
        FilterObjectType.fromJson(jsonObject["docCountriesFilter"]);
    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "docIDsFilter": docIDsFilter?.toJson(),
        "docFormatsFilter": docFormatsFilter?.toJson(),
        "docCategoriesFilter": docCategoriesFilter?.toJson(),
        "docCountriesFilter": docCountriesFilter?.toJson()
      }.clearNulls();
}

class FilterObjectType {
  List<dynamic> _list;
  bool _isInclude;

  FilterObjectType.createIncludeList(List<dynamic> list)
      : _list = list,
        _isInclude = true;
  FilterObjectType.createExcludeList(List<dynamic> list)
      : _list = list,
        _isInclude = false;

  /// Allows you to deserialize object.
  static FilterObjectType? fromJson(json) {
    if (json == null) return null;
    if (json["isInclude"]) {
      return FilterObjectType.createIncludeList(json["list"]);
    } else {
      return FilterObjectType.createExcludeList(json["list"]);
    }
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "list": _list,
        "isInclude": _isInclude,
      }.clearNulls();
}
