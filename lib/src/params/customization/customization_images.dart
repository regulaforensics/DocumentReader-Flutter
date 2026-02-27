//
//  CustomizationImages.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class CustomizationImages {
  ByteData? get rfidProcessingScreenFailureImage =>
      _rfidProcessingScreenFailureImage;
  ByteData? _rfidProcessingScreenFailureImage;
  set rfidProcessingScreenFailureImage(ByteData? val) {
    _rfidProcessingScreenFailureImage = val;
    _set({"rfidProcessingScreenFailureImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get rfidEnableNfcImage => _rfidEnableNfcImage;
  ByteData? _rfidEnableNfcImage;
  set rfidEnableNfcImage(ByteData? val) {
    _rfidEnableNfcImage = val;
    _set({"rfidEnableNfcImage": _dataToBase64(val)});
  }

  ByteData? get mdlProcessingScreenFailureImage =>
      _mdlProcessingScreenFailureImage;
  ByteData? _mdlProcessingScreenFailureImage;
  set mdlProcessingScreenFailureImage(ByteData? val) {
    _mdlProcessingScreenFailureImage = val;
    _set({"mdlProcessingScreenFailureImage": _dataToBase64(val)});
  }

  /// Android only.
  ByteData? get mdlEnableNfcImage => _mdlEnableNfcImage;
  ByteData? _mdlEnableNfcImage;
  set mdlEnableNfcImage(ByteData? val) {
    _mdlEnableNfcImage = val;
    _set({"mdlEnableNfcImage": _dataToBase64(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationImages fromJson(jsonObject) {
    var result = CustomizationImages();
    result.testSetters = {};

    result.rfidProcessingScreenFailureImage =
        _dataFromBase64(jsonObject["rfidProcessingScreenFailureImage"]);
    result.rfidEnableNfcImage =
        _dataFromBase64(jsonObject["rfidEnableNfcImage"]);
    result.mdlProcessingScreenFailureImage =
        _dataFromBase64(jsonObject["mdlProcessingScreenFailureImage"]);
    result.mdlEnableNfcImage = _dataFromBase64(jsonObject["mdlEnableNfcImage"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "rfidProcessingScreenFailureImage": _dataToBase64(
          rfidProcessingScreenFailureImage,
        ),
        "rfidEnableNfcImage": _dataToBase64(
          rfidEnableNfcImage,
        ),
        "mdlProcessingScreenFailureImage": _dataToBase64(
          mdlProcessingScreenFailureImage,
        ),
        "mdlEnableNfcImage": _dataToBase64(
          mdlEnableNfcImage,
        ),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"images": json};
    var parent = DocumentReader.instance.customization;
    if (identical(this, parent.images)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
