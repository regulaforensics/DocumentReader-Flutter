//
//  RecognizeConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

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

  /// Image for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  Uint8List? get image => _image;
  Uint8List? _image;

  /// Binary for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  Uint8List? get data => _data;
  Uint8List? _data;

  /// Images for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  List<Uint8List>? get images => _images;
  List<Uint8List>? _images;

  /// Images(with input data) for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  List<ImageInputData>? get imageInputData => _imageInputData;
  List<ImageInputData>? _imageInputData;

  RecognizeConfig.withScenario(Scenario scenario, RecognizeData data)
      : _scenario = scenario,
        _onlineProcessingConfig = null,
        _image = data.image,
        _images = data.images,
        _imageInputData = data.imageInputData;

  RecognizeConfig.withOnlineProcessingConfig(
      OnlineProcessingConfig onlineProcessingConfig, RecognizeData data)
      : _scenario = null,
        _onlineProcessingConfig = onlineProcessingConfig,
        _image = data.image,
        _images = data.images,
        _imageInputData = data.imageInputData;

  RecognizeConfig._empty();

  @visibleForTesting
  static RecognizeConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = RecognizeConfig._empty();

    result._scenario = Scenario.getByValue(jsonObject["scenario"]);
    result._onlineProcessingConfig =
        OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.livePortrait = _bytesFromBase64(jsonObject["livePortrait"]);
    result.extPortrait = _bytesFromBase64(jsonObject["extPortrait"]);
    result.oneShotIdentification = jsonObject["oneShotIdentification"];
    result._image = _bytesFromBase64(jsonObject["image"]);
    result._data = _bytesFromBase64(jsonObject["data"]);
    if (jsonObject["images"] != null) {
      result._images = [];
      for (var item in jsonObject["images"])
        result._images!.addSafe(_bytesFromBase64(item));
    }
    if (jsonObject["imageInputData"] != null) {
      result._imageInputData = [];
      for (var item in jsonObject["imageInputData"])
        result._imageInputData!.addSafe(ImageInputData.fromJson(item));
    }

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "scenario": scenario?.value,
        "onlineProcessingConfig": onlineProcessingConfig?.toJson(),
        "oneShotIdentification": oneShotIdentification,
        "livePortrait": _bytesToBase64(livePortrait),
        "extPortrait": _bytesToBase64(extPortrait),
        "image": _bytesToBase64(image),
        "data": _bytesToBase64(data),
        "images": images?.map((e) => _bytesToBase64(e)).toList(),
        "imageInputData": imageInputData?.map((e) => e.toJson()).toList(),
      }.clearNulls();
}

/// Insures that [RecognizeConfig] has exactly one of four parameters set:
/// [image], [data], [images], [imageInputData]
class RecognizeData {
  Uint8List? get image => _image;
  Uint8List? _image;

  Uint8List? get data => _data;
  Uint8List? _data;

  List<Uint8List>? get images => _images;
  List<Uint8List>? _images;

  List<ImageInputData>? get imageInputData => _imageInputData;
  List<ImageInputData>? _imageInputData;

  RecognizeData.withImage(Uint8List image)
      : _image = image,
        _data = null,
        _images = null,
        _imageInputData = null;

  RecognizeData.withData(Uint8List data)
      : _image = null,
        _data = data,
        _images = null,
        _imageInputData = null;

  RecognizeData.withImages(List<Uint8List> images)
      : _image = null,
        _data = null,
        _images = images,
        _imageInputData = null;

  RecognizeData.withImageInputData(List<ImageInputData> imageInputData)
      : _image = null,
        _data = null,
        _images = null,
        _imageInputData = imageInputData;
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
