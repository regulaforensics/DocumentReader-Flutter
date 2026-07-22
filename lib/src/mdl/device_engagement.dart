part of "../../flutter_document_reader_api.dart";

class DeviceEngagement {
  List<DeviceRetrievalMethod> deviceRetrievalMethods = [];

  /// Allows you to deserialize object.
  static DeviceEngagement? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DeviceEngagement();

    result.deviceRetrievalMethods =
        (jsonObject["deviceRetrievalMethods"] as List)
            .map((item) => DeviceRetrievalMethod.fromJson(item)!)
            .toList();

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "deviceRetrievalMethods":
            deviceRetrievalMethods.map((e) => e.toJson()).toList()
      }.clearNulls();
}

/// Contains device engagement types.
enum MDLDeviceEngagement {
  QR(0),

  NFC(1);

  const MDLDeviceEngagement(this.value);
  final int value;

  static MDLDeviceEngagement? getByValue(int? i) {
    if (i == null) return null;
    return MDLDeviceEngagement.values.firstWhere((x) => x.value == i);
  }
}
