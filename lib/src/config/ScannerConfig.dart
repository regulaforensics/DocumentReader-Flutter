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
  Image? livePortrait;

  /// Portrait photo from an external source.
  ///
  /// Requires network connection.
  Image? extPortrait;

  /// Camera id.
  ///
  /// Android only.
  int? cameraId;

  ScannerConfig(
      Scenario scenario, OnlineProcessingConfig onlineProcessingConfig)
      : _scenario = scenario,
        _onlineProcessingConfig = onlineProcessingConfig;

  ScannerConfig.withScenario(Scenario scenario)
      : _scenario = scenario,
        _onlineProcessingConfig = null;

  ScannerConfig.withOnlineProcessingConfig(
      OnlineProcessingConfig onlineProcessingConfig)
      : _scenario = null,
        _onlineProcessingConfig = onlineProcessingConfig;

  ScannerConfig._empty();

  @visibleForTesting
  static ScannerConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = ScannerConfig._empty();

    result._scenario = Scenario.getByValue(jsonObject["scenario"]);
    result._onlineProcessingConfig =
        OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.livePortrait = _imageFromBase64(jsonObject["livePortrait"]);
    result.extPortrait = _imageFromBase64(jsonObject["extPortrait"]);
    result.cameraId = jsonObject["cameraId"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "scenario": scenario?.value,
        "onlineProcessingConfig": onlineProcessingConfig?.toJson(),
        "livePortrait": _imageToBase64(livePortrait),
        "extPortrait": _imageToBase64(extPortrait),
        "cameraId": cameraId
      }.clearNulls();
}
