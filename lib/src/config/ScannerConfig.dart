//
//  ScannerConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class ScannerConfig {
  /// Documents processing scenario.
  Scenario? get scenario => _scenario;
  Scenario? _scenario;

  /// Configuration class for online processing.
  ///
  /// /// Requires network connection.
  OnlineProcessingConfig? get onlineProcessingConfig => _onlineProcessingConfig;
  OnlineProcessingConfig? _onlineProcessingConfig;

  /// Live portrait photo.
  ///
  /// Requires network connection.
  Uint8List? livePortrait;

  /// Portrait photo from an external source.
  ///
  /// Requires network connection.
  Uint8List? extPortrait;

  /// Camera id.
  ///
  /// Android only.
  int? cameraId;

  ScannerConfig(
      Scenario scenario, OnlineProcessingConfig onlineProcessingConfig)
      : _scenario = scenario,
        _onlineProcessingConfig = onlineProcessingConfig;

  ScannerConfig.fromScenario(Scenario scenario)
      : _scenario = scenario,
        _onlineProcessingConfig = null;

  ScannerConfig.fromOnlineProcessingConfig(
      OnlineProcessingConfig onlineProcessingConfig)
      : _scenario = null,
        _onlineProcessingConfig = onlineProcessingConfig;

  ScannerConfig._empty();

  @visibleForTesting
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (scenario != null) result["scenario"] = scenario!.value;
    if (onlineProcessingConfig != null)
      result["onlineProcessingConfig"] = onlineProcessingConfig!.toJson();
    if (livePortrait != null) result["livePortrait"] = _toBase64(livePortrait);
    if (extPortrait != null) result["extPortrait"] = _toBase64(extPortrait);
    if (cameraId != null) result["cameraId"] = cameraId;

    return result;
  }

  @visibleForTesting
  static ScannerConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = new ScannerConfig._empty();

    result._scenario = Scenario.getByValue(jsonObject["scenario"])!;
    result._onlineProcessingConfig =
        OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.livePortrait = base64Decode(jsonObject["livePortrait"]);
    result.extPortrait = base64Decode(jsonObject["extPortrait"]);
    result.cameraId = jsonObject["cameraId"];

    return result;
  }
}
