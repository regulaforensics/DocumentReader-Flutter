//
//  Position.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure is used for storing element bounds detection result._
class Position {
  /// Document format.
  DocFormat get docFormat => _docFormat;
  late DocFormat _docFormat;

  /// Document width.
  int get width => _width;
  late int _width;

  /// Document height.
  int get height => _height;
  late int _height;

  /// Document rotation angle.
  double get angle => _angle;
  late double _angle;

  /// Resolution in dots per inch.
  int get dpi => _dpi;
  late int _dpi;

  /// Internal use parameter.
  int get inverse => _inverse;
  late int _inverse;

  /// Internal use parameter.
  int get perspectiveTr => _perspectiveTr;
  late int _perspectiveTr;

  /// Internal use parameter.
  int get objArea => _objArea;
  late int _objArea;

  /// Internal use parameter.
  int get objIntAngleDev => _objIntAngleDev;
  late int _objIntAngleDev;

  /// Internal use parameter.
  CheckResult get resultStatus => _resultStatus;
  late CheckResult _resultStatus;

  /// Document center coordinates.
  Coordinate? get center => _center;
  Coordinate? _center;

  /// Document left top corner coordinates.
  Coordinate? get leftTop => _leftTop;
  Coordinate? _leftTop;

  /// Document left bottom corner coordinates.
  Coordinate? get leftBottom => _leftBottom;
  Coordinate? _leftBottom;

  /// Document right top corner coordinates.
  Coordinate? get rightTop => _rightTop;
  Coordinate? _rightTop;

  /// Document right bottom corner coordinates.
  Coordinate? get rightBottom => _rightBottom;
  Coordinate? _rightBottom;

  /// Index of the document page, whence the result is received.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Allows you to deserialize object.
  static Position? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Position();

    result._docFormat = DocFormat.getByValue(jsonObject["docFormat"])!;
    result._width = jsonObject["width"];
    result._height = jsonObject["height"];
    result._dpi = jsonObject["dpi"];
    result._pageIndex = jsonObject["pageIndex"];
    result._inverse = jsonObject["inverse"];
    result._perspectiveTr = jsonObject["perspectiveTr"];
    result._objArea = jsonObject["objArea"];
    result._objIntAngleDev = jsonObject["objIntAngleDev"];
    result._resultStatus = CheckResult.getByValue(jsonObject["resultStatus"])!;
    result._angle = _toDouble(jsonObject["angle"])!;
    result._center = Coordinate.fromJson(jsonObject["center"]);
    result._leftTop = Coordinate.fromJson(jsonObject["leftTop"]);
    result._leftBottom = Coordinate.fromJson(jsonObject["leftBottom"]);
    result._rightTop = Coordinate.fromJson(jsonObject["rightTop"]);
    result._rightBottom = Coordinate.fromJson(jsonObject["rightBottom"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "docFormat": docFormat.value,
        "resultStatus": resultStatus.value,
        "width": width,
        "height": height,
        "angle": angle,
        "dpi": dpi,
        "inverse": inverse,
        "perspectiveTr": perspectiveTr,
        "objArea": objArea,
        "objIntAngleDev": objIntAngleDev,
        "pageIndex": pageIndex,
        "center": center?.toJson(),
        "leftTop": leftTop?.toJson(),
        "leftBottom": leftBottom?.toJson(),
        "rightTop": rightTop?.toJson(),
        "rightBottom": rightBottom?.toJson(),
      }.clearNulls();
}

/// Structure describing point coordinate.
class Coordinate {
  int get x => _x;
  late int _x;

  int get y => _y;
  late int _y;

  /// Allows you to deserialize object.
  static Coordinate? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Coordinate();

    result._x = jsonObject["x"];
    result._y = jsonObject["y"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["x"] = x;
    result["y"] = y;

    return result;
  }
}
