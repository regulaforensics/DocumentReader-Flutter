//
//  InitConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// A configuration file for DocumentReader initialization.
/// Controls initialization time properties such as licenseUpdate and delayedNNLoad.
class InitConfig {
  /// The license binary file.
  ByteData get license => _license;
  ByteData _license;

  /// Enables automatic license update check during [DocumentReader] initialization.
  bool licenseUpdate = true;

  /// Defines whether the [DocumentReader] delays loading of neural networks.
  ///
  /// When set to `true` the initialization starts in the background thread after
  /// the method [DocumentReader.initialize] is called. If the document
  /// processing is initiated before all the networks are loaded,
  /// the [DocumentReader] will wait for it before starting the handling.
  ///
  /// When set to `false` the initialization is performed during
  /// [DocumentReader.initialize] method.
  bool delayedNNLoad = false;

  /// The path to the database file.
  ///
  /// IOS only. For Android use [customDb].
  String? databasePath;

  /// Custom database binary.
  ///
  /// Android only. For iOS use [databasePath].
  ByteData? customDb;

  /// Android only.
  Map<String, dynamic>? blackList;

  /// Constructor for initialization using a license binary.
  InitConfig(ByteData license) : _license = license;

  bool _useBleDevice = false;

  /// Constructor for initialization using a ble device.
  /// Doesn't need a license file, it will be fetched automatically from your ble device.
  ///
  /// Requires [btdevice plugin](https://pub.dev/packages/flutter_document_reader_btdevice_beta).
  InitConfig.withBleDevice() : _license = ByteData(0) {
    _useBleDevice = true;
  }

  @visibleForTesting
  static InitConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = InitConfig(_dataFromBase64(jsonObject["license"])!);

    result.customDb = _dataFromBase64(jsonObject["customDb"]);
    result.delayedNNLoad = jsonObject["delayedNNLoad"];
    result.licenseUpdate = jsonObject["licenseUpdate"];
    result.blackList = jsonObject["blackList"];
    result.databasePath = jsonObject["databasePath"];
    result._useBleDevice = jsonObject["useBleDevice"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "license": _dataToBase64(license),
        "delayedNNLoad": delayedNNLoad,
        "licenseUpdate": licenseUpdate,
        "blackList": blackList,
        "customDb": _dataToBase64(customDb),
        "databasePath": databasePath,
        "useBleDevice": _useBleDevice,
      }.clearNulls();
}
