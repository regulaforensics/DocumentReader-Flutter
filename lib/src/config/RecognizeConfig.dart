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

  Uint8List? get image => _image;
  Uint8List? _image;

  List<Uint8List>? get images => _images;
  List<Uint8List>? _images;

  List<ImageInputData>? get imageInputData => _imageInputData;
  List<ImageInputData>? _imageInputData;

  RecognizeConfig.fromScenario(Scenario scenario, RecognizeData data)
      : _scenario = scenario,
        _onlineProcessingConfig = null,
        _image = data.image,
        _images = data.images,
        _imageInputData = data.imageInputData;

  RecognizeConfig.fromOnlineProcessingConfig(
      OnlineProcessingConfig onlineProcessingConfig, RecognizeData data)
      : _scenario = null,
        _onlineProcessingConfig = onlineProcessingConfig,
        _image = data.image,
        _images = data.images,
        _imageInputData = data.imageInputData;

  RecognizeConfig._empty();

  @visibleForTesting
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (scenario != null) result["scenario"] = scenario!.value;
    if (onlineProcessingConfig != null)
      result["onlineProcessingConfig"] = onlineProcessingConfig!.toJson();
    if (livePortrait != null) result["livePortrait"] = _toBase64(livePortrait);
    if (extPortrait != null) result["extPortrait"] = _toBase64(extPortrait);
    if (image != null) result["image"] = _toBase64(image);
    if (images != null) {
      List<String> list = [];
      for (Uint8List item in images!) {
        list.add(base64Encode(item));
      }
      result["images"] = list;
    }
    if (imageInputData != null) {
      List<dynamic> list = [];
      for (ImageInputData item in imageInputData!) {
        list.add(item.toJson());
      }
      result["imageInputData"] = list;
    }
    result["oneShotIdentification"] = oneShotIdentification;

    return result;
  }

  @visibleForTesting
  static RecognizeConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new RecognizeConfig._empty();

    result._scenario = Scenario.getByValue(jsonObject["scenario"]);
    result._onlineProcessingConfig =
        OnlineProcessingConfig.fromJson(jsonObject["onlineProcessingConfig"]);
    result.livePortrait = base64Decode(jsonObject["livePortrait"]);
    result.extPortrait = base64Decode(jsonObject["extPortrait"]);
    result.oneShotIdentification = jsonObject["oneShotIdentification"];
    result._image = base64Decode(jsonObject["image"]);
    if (jsonObject["images"] != null) {
      result._images = [];
      for (var item in jsonObject["images"])
        result._images!.addSafe(base64Decode(item));
    }
    if (jsonObject["imageInputData"] != null) {
      result._imageInputData = [];
      for (var item in jsonObject["imageInputData"])
        result._imageInputData!.addSafe(ImageInputData.fromJson(item));
    }

    return result;
  }
}

/// Insures that [RecognizeConfig] has exactly one of three parameters set:
/// [image], [images], [imageInputData]
class RecognizeData {
  Uint8List? get image => _image;
  Uint8List? _image;

  List<Uint8List>? get images => _images;
  List<Uint8List>? _images;

  List<ImageInputData>? get imageInputData => _imageInputData;
  List<ImageInputData>? _imageInputData;

  RecognizeData.fromImage(Uint8List image)
      : _image = image,
        _images = null,
        _imageInputData = null;

  RecognizeData.fromImages(List<Uint8List> images)
      : _image = null,
        _images = images,
        _imageInputData = null;

  RecognizeData.fromImageInputData(List<ImageInputData> imageInputData)
      : _image = null,
        _images = null,
        _imageInputData = imageInputData;
}

class ImageInputData {
  /// An image.
  Uint8List get image => _image;
  late Uint8List _image;

  /// Light type, one of RGLGraphicFieldLight values.
  Lights get light => _light;
  Lights _light = Lights.WHITE_FULL;

  /// An index of the document page whence the graphic field is extracted.
  int get pageIndex => _pageIndex;
  int _pageIndex = 0;

  ImageInputData(Uint8List image) : _image = image;

  ImageInputData.withLight(Uint8List image, Lights light)
      : _image = image,
        _light = light;

  ImageInputData.withLightPageIndex(
    Uint8List image,
    Lights light,
    int pageIndex,
  )   : _image = image,
        _light = light,
        _pageIndex = pageIndex;

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _toBase64(image),
        "light": light.value,
        "pageIndex": pageIndex,
      };

  @visibleForTesting
  static ImageInputData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageInputData(base64Decode(jsonObject["image"]));

    result._pageIndex = jsonObject["pageIndex"];
    result._light = Lights.getByValue(jsonObject["light"])!;

    return result;
  }
}
