//
//  CustomizationImages.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class CustomizationImages {
  ///
  ByteData get rfidProcessingScreenFailureImage =>
      _rfidProcessingScreenFailureImage;
  late ByteData _rfidProcessingScreenFailureImage;
  set rfidProcessingScreenFailureImage(ByteData val) {
    _rfidProcessingScreenFailureImage = val;
    _set({"rfidProcessingScreenFailureImage": _dataToBase64(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationImages fromJson(jsonObject) {
    var result = CustomizationImages();
    result.testSetters = {};

    result.rfidProcessingScreenFailureImage =
        _dataFromBase64(jsonObject["rfidProcessingScreenFailureImage"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "rfidProcessingScreenFailureImage":
            _dataToBase64(rfidProcessingScreenFailureImage),
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
