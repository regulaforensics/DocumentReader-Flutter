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
  Image? livePortrait;

  /// Portrait photo from an external source.
  ///
  /// Requires network connection.
  Image? extPortrait;

  /// This parameter is for processing an image that contains a person and
  /// a document and compare the portrait photo from the document with
  /// the person's face. It works only in the single-frame processing,
  /// but not in the video frame processing. Requires network connection.
  bool oneShotIdentification = false;

  /// Image for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  Image? get image => _image;
  Image? _image;

  /// Binary for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  ByteData? get data => _data;
  ByteData? _data;

  /// Images for processing
  ///
  /// Only one of [image], [data], [images], [imageInputData] can be set
  /// at a time. All the others must be `null`.
  List<Image>? get images => _images;
  List<Image>? _images;

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
    result.livePortrait = _imageFromBase64(jsonObject["livePortrait"]);
    result.extPortrait = _imageFromBase64(jsonObject["extPortrait"]);
    result.oneShotIdentification = jsonObject["oneShotIdentification"];
    result._image = _imageFromBase64(jsonObject["image"]);
    result._data = _fromBase64(jsonObject["data"]);
    if (jsonObject["images"] != null) {
      result._images = [];
      for (var item in jsonObject["images"])
        result._images!.addSafe(_imageFromBase64(item));
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
        "livePortrait": _imageToBase64(livePortrait),
        "extPortrait": _imageToBase64(extPortrait),
        "image": _imageToBase64(image),
        "data": _toBase64(data),
        "images": images?.map((e) => _imageToBase64(e)).toList(),
        "imageInputData": imageInputData?.map((e) => e.toJson()).toList(),
      }.clearNulls();
}

/// Insures that [RecognizeConfig] has exactly one of four parameters set:
/// [image], [data], [images], [imageInputData]
class RecognizeData {
  Image? get image => _image;
  Image? _image;

  ByteData? get data => _data;
  ByteData? _data;

  List<Image>? get images => _images;
  List<Image>? _images;

  List<ImageInputData>? get imageInputData => _imageInputData;
  List<ImageInputData>? _imageInputData;

  RecognizeData.withImage(Image image)
      : _image = image,
        _data = null,
        _images = null,
        _imageInputData = null;

  RecognizeData.withData(ByteData data)
      : _image = null,
        _data = data,
        _images = null,
        _imageInputData = null;

  RecognizeData.withImages(List<Image> images)
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
  Image get image => _image;
  Image _image;

  /// Light type, one of RGLGraphicFieldLight values.
  Lights get light => _light;
  Lights _light;

  /// An index of the document page whence the graphic field is extracted.
  int get pageIndex => _pageIndex;
  int _pageIndex;

  ImageInputData(Image image,
      {Lights light = Lights.WHITE_FULL, int pageIndex = 0})
      : _image = image,
        _light = light,
        _pageIndex = pageIndex;

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _imageToBase64(image),
        "light": light.value,
        "pageIndex": pageIndex,
      };

  @visibleForTesting
  static ImageInputData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageInputData(_imageFromBase64(jsonObject["image"])!);

    result._pageIndex = jsonObject["pageIndex"];
    result._light = Lights.getByValue(jsonObject["light"])!;

    return result;
  }
}
