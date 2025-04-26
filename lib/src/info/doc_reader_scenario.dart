//
//  DocReaderScenario.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class DocReaderScenario {
  /// ID of the scenario.
  String get name => _name;
  late String _name;

  /// string representation of scenario ID.
  String get caption => _caption;
  late String _caption;

  /// Description of the scenario.
  String get description => _description;
  late String _description;

  /// Available orientation for scenario.
  DocReaderOrientation get frameOrientation => _frameOrientation;
  late DocReaderOrientation _frameOrientation;

  bool get uvTorch => _uvTorch;
  late bool _uvTorch;

  bool get faceExt => _faceExt;
  late bool _faceExt;

  bool get multiPageOff => _multiPageOff;
  late bool _multiPageOff;

  bool get seriesProcessMode => _seriesProcessMode;
  late bool _seriesProcessMode;

  double get frameKWHLandscape => _frameKWHLandscape;
  late double _frameKWHLandscape;

  double get frameKWHPortrait => _frameKWHPortrait;
  late double _frameKWHPortrait;

  double get frameKWHDoublePageSpreadLandscape =>
      _frameKWHDoublePageSpreadLandscape;
  late double _frameKWHDoublePageSpreadLandscape;

  double get frameKWHDoublePageSpreadPortrait =>
      _frameKWHDoublePageSpreadPortrait;
  late double _frameKWHDoublePageSpreadPortrait;

  bool get manualCrop => _manualCrop;
  late bool _manualCrop;

  @visibleForTesting
  static DocReaderScenario? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocReaderScenario();

    result._uvTorch = jsonObject["uvTorch"];
    result._frameOrientation =
        DocReaderOrientation.getByValue(jsonObject["frameOrientation"])!;
    result._faceExt = jsonObject["faceExt"];
    result._multiPageOff = jsonObject["multiPageOff"];
    result._seriesProcessMode = jsonObject["seriesProcessMode"];
    result._frameKWHLandscape = jsonObject["frameKWHLandscape"].toDouble();
    result._frameKWHPortrait = jsonObject["frameKWHPortrait"].toDouble();
    result._frameKWHDoublePageSpreadPortrait =
        jsonObject["frameKWHDoublePageSpreadPortrait"].toDouble();
    result._frameKWHDoublePageSpreadLandscape =
        jsonObject["frameKWHDoublePageSpreadLandscape"].toDouble();
    result._name = jsonObject["name"];
    result._caption = jsonObject["caption"];
    result._description = jsonObject["description"];
    result._manualCrop = jsonObject["manualCrop"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "uvTorch": uvTorch,
        "frameOrientation": frameOrientation.value,
        "faceExt": faceExt,
        "multiPageOff": multiPageOff,
        "seriesProcessMode": seriesProcessMode,
        "frameKWHLandscape": frameKWHLandscape,
        "frameKWHPortrait": frameKWHPortrait,
        "frameKWHDoublePageSpreadPortrait": frameKWHDoublePageSpreadPortrait,
        "frameKWHDoublePageSpreadLandscape": frameKWHDoublePageSpreadLandscape,
        "name": name,
        "caption": caption,
        "description": description,
        "manualCrop": manualCrop,
      }.clearNulls();
}

enum Scenario {
  /// Processing scenario for obtaining MRZ data.
  MRZ("Mrz"),

  /// Processing scenario for obtaining barcode data.
  BARCODE("Barcode"),

  /// Processing scenario for detecting document boundaries.
  LOCATE("Locate"),

  /// Processing scenario for obtaining visual zone OCR results.
  OCR("Ocr"),

  /// Processing scenario for document type recognition.
  DOCTYPE("DocType"),

  /// Processing scenario for obtaining MRZ and/or barcode data.
  MRZ_OR_BARCODE("MrzOrBarcode"),

  /// Processing scenario for detecting document boundaries and/or obtaining MRZ data.
  MRZ_OR_LOCATE("MrzOrLocate"),

  /// Processing scenario for detecting document boundaries and obtaining MRZ data.
  MRZ_AND_LOCATE("MrzAndLocate"),

  /// Processing scenario for detecting document boundaries and obtaining barcode data.
  BARCODE_AND_LOCATE("BarcodeAndLocate"),

  /// Processing scenario for obtaining MRZ data or visual zone OCR results.
  MRZ_OR_OCR("MrzOrOcr"),

  /// Processing scenario for obtaining MRZ or barcode or visual zone OCR results.
  MRZ_OR_BARCODE_OR_OCR("MrzOrBarcodeOrOcr"),

  /// Processing scenario for detecting document boundaries and obtaining
  /// MRZ data or visual zone OCR results.
  LOCATE_VISUAL_AND_MRZ_OR_OCR("LocateVisual_And_MrzOrOcr"),

  /// Processing scenario for obtaining all document data.
  FULL_PROCESS("FullProcess"),

  /// Processing scenario for obtaining all document data and document authentication.
  FULL_AUTH("FullAuth"),

  /// Processing scenario for obtaining visual zone OCR results from
  /// Russian National Passport and MRZ data from any document.
  ID3RUS("Id3Rus"),

  /// Processing scenario for obtaining data from registration stamps in
  /// Russian passports.
  RUS_STAMP("RusStamp"),

  /// Processing scenario for obtaining OCR results of any image.
  OCR_FREE("OcrFree"),

  /// Processing scenario for obtaining bank card data.
  CREDIT_CARD("CreditCard"),

  /// Scenario for obtaining an original image without any processing.
  CAPTURE("Capture"),

  /// Scenario for Digital Travel Credentials (DTC) processing.
  DTC("DTC");

  const Scenario(this.value);
  final String value;

  static Scenario? getByValue(String? i) {
    if (i == null || i == "") return null;
    return Scenario.values.firstWhere((x) => x.value == i);
  }
}

/// Contains set of values of the application's orientation.
enum DocReaderOrientation {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// All interface orientations - orientation not set, activities will rotate.
  ALL(0),

  /// A portrait interface orientation.
  PORTRAIT(1),

  /// Both landscape-left and landscape-right interface orientation.
  LANDSCAPE(2),

  /// A landscape-left interface orientation.
  LANDSCAPE_LEFT(3),

  /// A landscape-right interface orientation.
  LANDSCAPE_RIGHT(4);

  const DocReaderOrientation(this.value);
  final int value;

  static DocReaderOrientation? getByValue(int? i) {
    if (i == null) return null;
    try {
      return DocReaderOrientation.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return DocReaderOrientation.UNKNOWN;
    }
  }
}
