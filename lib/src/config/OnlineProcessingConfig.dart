//
//  OnlineProcessingConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class OnlineProcessingConfig {
  OnlineMode mode;

  String url = "https://api.regulaforensics.com";

  ProcessParams processParams = ProcessParams();

  ImageFormat imageFormat = ImageFormat.JPG;

  double imageCompressionQuality = 0.8;

  OnlineProcessingConfig(this.mode) {
    processParams = ProcessParams();
    processParams.scenario = Scenario.FULL_PROCESS;
  }

  @visibleForTesting
  static OnlineProcessingConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    OnlineMode mode = OnlineMode.getByValue(jsonObject["mode"])!;
    var result = OnlineProcessingConfig(mode);

    result.url = jsonObject["url"];
    result.imageFormat = ImageFormat.getByValue(jsonObject["imageFormat"])!;
    result.imageCompressionQuality =
        jsonObject["imageCompressionQuality"].toDouble();
    result.processParams = ProcessParams.fromJson(jsonObject["processParams"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "mode": mode.value,
        "url": url,
        "imageFormat": imageFormat.value,
        "imageCompressionQuality": imageCompressionQuality,
        "processParams": processParams.toJson(),
      }.clearNulls();
}

enum ImageFormat {
  PNG(0),

  JPG(1);

  const ImageFormat(this.value);
  final int value;

  static ImageFormat? getByValue(int? i) {
    if (i == null) return null;
    return ImageFormat.values.firstWhere((x) => x.value == i);
  }
}

enum OnlineMode {
  MANUAL(0),

  AUTO(1);

  const OnlineMode(this.value);
  final int value;

  static OnlineMode? getByValue(int? i) {
    if (i == null) return null;
    return OnlineMode.values.firstWhere((x) => x.value == i);
  }
}
