//
//  RecognizeConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Image processing configuration.
class RecognizeConfig {
  /// Documents processing scenario.
  Scenario? get scenario => _scenario;
  Scenario? _scenario;

  /// Configuration class for online processing.
  ///
  /// /// Requires network connection.
  OnlineProcessingConfig? get onlineProcessingConfig => _onlineProcessingConfig;
  OnlineProcessingConfig? _onlineProcessingConfig;

  /// Image for processing.
  Uint8List? image;

  /// Images for processing.
  List<Uint8List>? images;

  /// Binary for processing.
  Uint8List? data;

  /// Images(with input data) for processing.
  List<ImageInputData>? imageInputData;

  /// DTC file for processing.
  Uint8List? dtc;

  /// Live portrait photo.
  ///
  /// Requires network connection.
  Uint8List? livePortrait;

  /// Portrait photo from an external source.
  ///
  /// Requires network connection.
  Uint8List? extPortrait;

  /// This parameter is for processing an image that contains a person and
  /// a document and compare the portrait photo from the document with
  /// the person's face. It works only in the single-frame processing,
  /// but not in the video frame processing. Requires network connection.
  bool oneShotIdentification = false;

  RecognizeConfig.withScenario(
    Scenario scenario, {
    Uint8List? image,
    List<Uint8List>? images,
    Uint8List? data,
    List<ImageInputData>? imageInputData,
    Uint8List? dtc,
    Uint8List? livePortrait,
    Uint8List? extPortrait,
    bool oneShotIdentification = false,
  })  : _scenario = scenario,
        _onlineProcessingConfig = null,
        livePortrait = livePortrait,
        extPortrait = extPortrait,
        oneShotIdentification = oneShotIdentification,
        image = image,
        images = images,
        data = data,
        imageInputData = imageInputData,
        dtc = dtc;

  RecognizeConfig.withOnlineProcessingConfig(
    OnlineProcessingConfig onlineProcessingConfig, {
    Uint8List? image,
    List<Uint8List>? images,
    Uint8List? data,
    List<ImageInputData>? imageInputData,
    Uint8List? dtc,
    Uint8List? livePortrait,
    Uint8List? extPortrait,
    bool oneShotIdentification = false,
  })  : _scenario = null,
        _onlineProcessingConfig = onlineProcessingConfig,
        livePortrait = livePortrait,
        extPortrait = extPortrait,
        oneShotIdentification = oneShotIdentification,
        image = image,
        images = images,
        data = data,
        imageInputData = imageInputData,
        dtc = dtc;

  RecognizeConfig._empty();

  @visibleForTesting
  static RecognizeConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RecognizeConfig._empty();

    result._scenario = Scenario.getByValue(jsonObject["scenario"]);
    result._onlineProcessingConfig =
        OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.image = _bytesFromBase64(jsonObject["image"]);
    if (jsonObject["images"] != null) {
      result.images = [];
      for (var item in jsonObject["images"]) {
        result.images!.addSafe(_bytesFromBase64(item));
      }
    }
    result.data = _bytesFromBase64(jsonObject["data"]);
    if (jsonObject["imageInputData"] != null) {
      result.imageInputData = [];
      for (var item in jsonObject["imageInputData"]) {
        result.imageInputData!.addSafe(ImageInputData.fromJson(item));
      }
    }
    result.dtc = _bytesFromBase64(jsonObject["dtc"]);
    result.livePortrait = _bytesFromBase64(jsonObject["livePortrait"]);
    result.extPortrait = _bytesFromBase64(jsonObject["extPortrait"]);
    result.oneShotIdentification = jsonObject["oneShotIdentification"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "scenario": scenario?.value,
        "onlineProcessingConfig": onlineProcessingConfig?.toJson(),
        "image": _bytesToBase64(image),
        "images": images?.map((e) => _bytesToBase64(e)).toList(),
        "data": _bytesToBase64(data),
        "imageInputData": imageInputData?.map((e) => e.toJson()).toList(),
        "dtc": _bytesToBase64(dtc),
        "oneShotIdentification": oneShotIdentification,
        "livePortrait": _bytesToBase64(livePortrait),
        "extPortrait": _bytesToBase64(extPortrait),
      }.clearNulls();
}

class ImageInputData {
  /// An image.
  Uint8List get image => _image;
  Uint8List _image;

  /// Light type, one of RGLGraphicFieldLight values.
  Lights get light => _light;
  Lights _light;

  /// An index of the document page whence the graphic field is extracted.
  int get pageIndex => _pageIndex;
  int _pageIndex;

  ImageInputData(Uint8List image,
      {Lights light = Lights.WHITE_FULL, int pageIndex = 0})
      : _image = image,
        _light = light,
        _pageIndex = pageIndex;

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _bytesToBase64(image),
        "light": light.value,
        "pageIndex": pageIndex,
      };

  @visibleForTesting
  static ImageInputData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageInputData(_bytesFromBase64(jsonObject["image"])!);

    result._pageIndex = jsonObject["pageIndex"];
    result._light = Lights.getByValue(jsonObject["light"])!;

    return result;
  }
}
