part of "../../flutter_document_reader_api.dart";

class NameSpaceMDL {
  late String _name;
  Map<String, MDLIntentToRetain> _map = {};

  NameSpaceMDL(this._name);

  addField(String name, MDLIntentToRetain intentToRetain) {
    _map[name] = intentToRetain;
  }

  /// Allows you to deserialize object.
  static NameSpaceMDL? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = NameSpaceMDL(jsonObject["name"]);

    result._map = (jsonObject["map"] as Map).map(
        (key, value) => MapEntry(key, MDLIntentToRetain.getByValue(value)!));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "name": _name,
        "map": _map.map((key, value) => MapEntry(key, value.value)),
      }.clearNulls();
}

enum MDLIntentToRetain {
  FALSE(0),

  TRUE(1);

  const MDLIntentToRetain(this.value);
  final int value;

  static MDLIntentToRetain? getByValue(int? i) {
    if (i == null) return null;
    return MDLIntentToRetain.values.firstWhere((x) => x.value == i);
  }
}
