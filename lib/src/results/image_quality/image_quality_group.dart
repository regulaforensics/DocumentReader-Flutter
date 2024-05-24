//
//  ImageQualityGroup.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Structure, containing overall data about quality checks performed.
class ImageQualityGroup {
  /// Number of results.
  int get count => _count;
  late int _count;

  /// Overall check result for document page.
  CheckResult get result => _result;
  late CheckResult _result;

  /// An array of single check result pointers.
  List<ImageQuality> get imageQualityList => _imageQualityList;
  List<ImageQuality> _imageQualityList = [];

  /// Index of the document page, whence the result is received.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Allows you to deserialize object.
  static ImageQualityGroup? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageQualityGroup();

    result._count = jsonObject["count"];
    result._result = CheckResult.getByValue(jsonObject["result"])!;
    result._pageIndex = jsonObject["pageIndex"];
    for (var item in jsonObject["imageQualityList"]) {
      result._imageQualityList.addSafe(ImageQuality.fromJson(item));
    }

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "count": count,
        "result": result.value,
        "pageIndex": pageIndex,
        "imageQualityList": imageQualityList.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
