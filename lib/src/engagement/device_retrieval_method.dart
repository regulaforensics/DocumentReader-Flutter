part of "../../flutter_document_reader_api.dart";

class DeviceRetrievalMethod {
  MDLDeviceRetrieval get type => _type;
  late MDLDeviceRetrieval _type;

  int? get version => _version;
  int? _version;

  int? get cmdMaxLength => _cmdMaxLength;
  int? _cmdMaxLength;

  int? get respMaxLength => _respMaxLength;
  int? _respMaxLength;

  bool? get clientModeSupport => _clientModeSupport;
  bool? _clientModeSupport;

  String? get clientModeUUID => _clientModeUUID;
  String? _clientModeUUID;

  bool? get serverModeSupport => _serverModeSupport;
  bool? _serverModeSupport;

  String? get serverModeUUID => _serverModeUUID;
  String? _serverModeUUID;

  /// Allows you to deserialize object.
  static DeviceRetrievalMethod? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DeviceRetrievalMethod();

    result._type = MDLDeviceRetrieval.getByValue(jsonObject["type"])!;
    result._version = jsonObject["version"];
    result._cmdMaxLength = jsonObject["cmdMaxLength"];
    result._respMaxLength = jsonObject["respMaxLength"];
    result._clientModeSupport = jsonObject["clientModeSupport"];
    result._clientModeUUID = jsonObject["clientModeUUID"];
    result._serverModeSupport = jsonObject["serverModeSupport"];
    result._serverModeUUID = jsonObject["serverModeUUID"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "type": type.value,
        "version": version,
        "cmdMaxLength": cmdMaxLength,
        "respMaxLength": respMaxLength,
        "clientModeSupport": clientModeSupport,
        "clientModeUUID": clientModeUUID,
        "serverModeSupport": serverModeSupport,
        "serverModeUUID": serverModeUUID,
      }.clearNulls();
}
