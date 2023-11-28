//
//  InitConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// A configuration file for DocumentReader initialization.
/// Controls initialization time properties such as licenseUpdate and delayedNNLoad.
class InitConfig {
  /// The license binary file.
  Uint8List? get license => _license;
  Uint8List? _license;

  /// Enables automatic license update check during [DocumentReader] initialization.
  bool licenseUpdate = true;

  /// Defines whether the [DocumentReader] delays loading of neural networks.
  ///
  /// When set to `true` the initialization starts in the background thread after
  /// the method [DocumentReader.initializeReader] is called. If the document
  /// processing is initiated before all the networks are loaded,
  /// the [DocumentReader] will wait for it before starting the handling.
  ///
  /// When set to `false` the initialization is performed during
  /// [DocumentReader.initializeReader] method.
  bool delayedNNLoad = false;

  /// The path to the database file.
  ///
  /// IOS only. For Android use [customDb].
  String? databasePath;

  /// Custom database binary.
  ///
  /// Android only. For iOS use [databasePath].
  Uint8List? customDb;

  /// Android only.
  dynamic blackList;

  /// Constructor for initialization using a license binary.
  InitConfig(Uint8List license) : _license = license;

  /// Constructor for initialization using a ble device.
  /// Doesn't need a license file, it will be fetched automatically from your ble device.
  ///
  /// Android only.
  InitConfig.withBleDevice() {
    if (!Platform.isAndroid)
      throw PlatformException(
        code: "android-only",
        message: "withBleDevice constructor is accessible only on Android",
      );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "license": _toBase64(license),
      "delayedNNLoad": delayedNNLoad,
      "licenseUpdate": licenseUpdate,
      "blackList": blackList
    };

    if (customDb != null) result["customDb"] = base64Encode(customDb!);
    if (databasePath != null) result["databasePath"] = databasePath;

    return result;
  }

  @visibleForTesting
  static InitConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new InitConfig(base64Decode(jsonObject["license"]));

    if (jsonObject["customDb"] != null)
      result.customDb = base64Decode(jsonObject["customDb"]);
    result.delayedNNLoad = jsonObject["delayedNNLoad"];
    result.licenseUpdate = jsonObject["licenseUpdate"];
    result.blackList = jsonObject["blackList"];
    result.databasePath = jsonObject["databasePath"];

    return result;
  }
}
