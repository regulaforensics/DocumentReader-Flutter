//
//  Results.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Class describing results returned on completion of Document Reader work.
class Results {
  /// Document type results.
  List<DocumentType>? get documentType => _documentType;
  List<DocumentType>? _documentType;

  /// Textual results.
  TextResult? get textResult => _textResult;
  TextResult? _textResult;

  /// Graphic results.
  GraphicResult? get graphicResult => _graphicResult;
  GraphicResult? _graphicResult;

  /// Position of a document.
  List<Position>? get documentPosition => _documentPosition;
  List<Position>? _documentPosition;

  /// Position of a barcode.
  List<Position>? get barcodePosition => _barcodePosition;
  List<Position>? _barcodePosition;

  /// Position of MRZ.
  List<Position>? get mrzPosition => _mrzPosition;
  List<Position>? _mrzPosition;

  /// Image quality results.
  List<ImageQualityGroup>? get imageQuality => _imageQuality;
  List<ImageQualityGroup>? _imageQuality;

  /// Status information for each operation.
  ResultsStatus get status => _status;
  late ResultsStatus _status;

  /// Authenticity results.
  AuthenticityResult? get authenticityResult => _authenticityResult;
  AuthenticityResult? _authenticityResult;

  /// RFID session data.
  RFIDSessionData? get rfidSessionData => _rfidSessionData;
  RFIDSessionData? _rfidSessionData;

  /// Indicates which page of the document contains an RFID chip (0 if there's
  /// no page containing it). Requires document type recognition, otherwise 1 by default.
  int get chipPage => _chipPage;
  late int _chipPage;

  /// Barcode results.
  BarcodeResult? get barcodeResult => _barcodeResult;
  BarcodeResult? _barcodeResult;

  /// Visible Digital Seal data.
  VDSNCData? get vdsncData => _vdsncData;
  VDSNCData? _vdsncData;

  /// Visible Digital Seal data.
  VDSData? get vdsData => _vdsData;
  VDSData? _vdsData;

  /// DTCVC data.
  Uint8List? get dtcData => _dtcData;
  Uint8List? _dtcData;

  /// Document processing finish status, one of RGLProcessingFinishedStatus values.
  ProcessingFinishedStatus get processingFinishedStatus =>
      _processingFinishedStatus;
  late ProcessingFinishedStatus _processingFinishedStatus;

  /// Indicates how many pages of a document remains to process.
  ///  Requires Document Type recognition, otherwise 0 by default.
  int get morePagesAvailable => _morePagesAvailable;
  late int _morePagesAvailable;

  /// Indicates how much time has been required for document processing, milliseconds.
  int get elapsedTime => _elapsedTime;
  late int _elapsedTime;

  /// Indicates how much time has been required for RFID chip processing, milliseconds.
  int get elapsedTimeRFID => _elapsedTimeRFID;
  late int _elapsedTimeRFID;

  /// Raw results, i.e. in their initial view.
  String get rawResult => _rawResult;
  late String _rawResult;

  /// Contains results in accordance with the BSI TR-03135 standard.
  String get bsiTr03135Results => _bsiTr03135Results;
  late String _bsiTr03135Results;

  TransactionInfo? get transactionInfo => _transactionInfo;
  TransactionInfo? _transactionInfo;

  /// Allows you to get a value of a text field.
  Future<String?> textFieldValueByType(FieldType fieldType) async {
    return await _bridge.invokeMethod("textFieldValueByType", [
      rawResult,
      fieldType.value,
    ]);
  }

  /// Allows you to get a value of a text field based on LCID.
  Future<String?> textFieldValueByTypeLcid(
    FieldType fieldType,
    LCID lcid,
  ) async {
    return await _bridge.invokeMethod("textFieldValueByTypeLcid", [
      rawResult,
      fieldType.value,
      lcid.value,
    ]);
  }

  /// Allows you to get a value of a text field based on a source type.
  Future<String?> textFieldValueByTypeSource(
    FieldType fieldType,
    ResultType source,
  ) async {
    return await _bridge.invokeMethod("textFieldValueByTypeSource", [
      rawResult,
      fieldType.value,
      source.value,
    ]);
  }

  /// Allows you to get a value of a text field based on LCID and a source type.
  Future<String?> textFieldValueByTypeLcidSource(
    FieldType fieldType,
    LCID lcid,
    ResultType source,
  ) async {
    return await _bridge.invokeMethod("textFieldValueByTypeLcidSource", [
      rawResult,
      fieldType.value,
      lcid.value,
      source.value,
    ]);
  }

  /// Allows you to get a value of a text field based on a source type and
  /// its originality.
  Future<String?> textFieldValueByTypeSourceOriginal(
    FieldType fieldType,
    ResultType source,
    bool original,
  ) async {
    return await _bridge.invokeMethod("textFieldValueByTypeSourceOriginal", [
      rawResult,
      fieldType.value,
      source.value,
      original,
    ]);
  }

  /// Allows you to get a value of a text field based on LCID, a source type
  /// and its originality.
  Future<String?> textFieldValueByTypeLcidSourceOriginal(
    FieldType fieldType,
    LCID lcid,
    ResultType source,
    bool original,
  ) async {
    return await _bridge.invokeMethod(
      "textFieldValueByTypeLcidSourceOriginal",
      [rawResult, fieldType.value, lcid.value, source.value, original],
    );
  }

  /// Allows you to get an instance of a text field.
  Future<TextField?> textFieldByType(FieldType fieldType) async {
    String? result = await _bridge.invokeMethod("textFieldByType", [
      rawResult,
      fieldType.value,
    ]);
    if (result == null) return null;
    return TextField.fromJson(json.decode(result));
  }

  /// Allows you to get an instance of a text field based on LCID.
  Future<TextField?> textFieldByTypeLcid(FieldType fieldType, LCID lcid) async {
    String? result = await _bridge.invokeMethod("textFieldByTypeLcid", [
      rawResult,
      fieldType.value,
      lcid.value,
    ]);
    if (result == null) return null;
    return TextField.fromJson(json.decode(result));
  }

  /// Allows you to get an image of a graphic field based on a source type
  /// and page index.
  Future<GraphicField?> graphicFieldByTypeSource(
    GraphicFieldType fieldType,
    ResultType source,
  ) async {
    String? result = await _bridge.invokeMethod("graphicFieldByTypeSource", [
      rawResult,
      fieldType.value,
      source.value,
    ]);
    if (result == null) return null;
    return GraphicField.fromJson(json.decode(result));
  }

  /// Allows you to get an image of a graphic field based on a source type
  /// and page index.
  Future<GraphicField?> graphicFieldByTypeSourcePageIndex(
    GraphicFieldType fieldType,
    ResultType source,
    int pageIndex,
  ) async {
    String? result = await _bridge.invokeMethod(
      "graphicFieldByTypeSourcePageIndex",
      [rawResult, fieldType.value, source.value, pageIndex],
    );
    if (result == null) return null;
    return GraphicField.fromJson(json.decode(result));
  }

  /// Allows you to get an image of a graphic field based on a source type,
  /// page index and light type.
  Future<GraphicField?> graphicFieldByTypeSourcePageIndexLight(
    GraphicFieldType fieldType,
    ResultType source,
    int pageIndex,
    Lights light,
  ) async {
    String? result = await _bridge.invokeMethod(
      "graphicFieldByTypeSourcePageIndex",
      [rawResult, fieldType.value, source.value, pageIndex, light.value],
    );
    if (result == null) return null;
    return GraphicField.fromJson(json.decode(result));
  }

  /// Allows you to get an image of a graphic field.
  Future<Uint8List?> graphicFieldImageByType(GraphicFieldType fieldType) async {
    String? result = await _bridge.invokeMethod("graphicFieldImageByType", [
      rawResult,
      fieldType.value,
    ]);
    if (result == null) return null;
    // return Uri.parse("data:image/png;base64," + result);
    return _bytesFromBase64(result);
  }

  /// Allows you to get an image of a graphic field based on a source type.
  Future<Uint8List?> graphicFieldImageByTypeSource(
    GraphicFieldType fieldType,
    ResultType source,
  ) async {
    String? result = await _bridge.invokeMethod(
      "graphicFieldImageByTypeSource",
      [rawResult, fieldType.value, source.value],
    );
    if (result == null) return null;
    return _bytesFromBase64(result);
  }

  /// Allows you to get an image of a graphic field based on a source type
  /// and page index.
  Future<Uint8List?> graphicFieldImageByTypeSourcePageIndex(
    GraphicFieldType fieldType,
    ResultType source,
    int pageIndex,
  ) async {
    String? result = await _bridge.invokeMethod(
      "graphicFieldImageByTypeSourcePageIndex",
      [rawResult, fieldType.value, source.value, pageIndex],
    );
    if (result == null) return null;
    return _bytesFromBase64(result);
  }

  /// Allows you to get an image of a graphic field based on a source type,
  /// page index and light type.
  Future<Uint8List?> graphicFieldImageByTypeSourcePageIndexLight(
    GraphicFieldType fieldType,
    ResultType source,
    int pageIndex,
    Lights light,
  ) async {
    String? result = await _bridge.invokeMethod(
      "graphicFieldImageByTypeSourcePageIndexLight",
      [rawResult, fieldType.value, source.value, pageIndex, light.value],
    );
    if (result == null) return null;
    return _bytesFromBase64(result);
  }

  /// Method returns containers by result type. If result type doesn't exist,
  /// the result of the search will be null.
  ///
  /// Returns original containers from rawResult including information about the transaction.
  Future<String?> containers(List<ResultType> resultType) async {
    List<int> converted = [];
    for (ResultType item in resultType) {
      converted.add(item.value);
    }
    return await _bridge.invokeMethod("containers", [rawResult, converted]);
  }

  /// Method returns only containers for [ResultType.INTERNAL_RFID_SESSION],
  /// [ResultType.INTERNAL_ENCRYPTED_RCL] and [ResultType.INTERNAL_LICENSE] values.
  ///
  /// For more details, see [containers] method.
  /// Returns all encrypted containers from rawResult to reprocess data on the server side.
  Future<String?> encryptedContainers() async {
    return await _bridge.invokeMethod("encryptedContainers", [rawResult]);
  }

  /// Allows you to deserialize object.
  static Results? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Results();

    result._chipPage = jsonObject["chipPage"];
    result._processingFinishedStatus = ProcessingFinishedStatus.getByValue(
      jsonObject["processingFinishedStatus"],
    )!;
    result._elapsedTime = jsonObject["elapsedTime"];
    result._elapsedTimeRFID = jsonObject["elapsedTimeRFID"];
    result._morePagesAvailable = jsonObject["morePagesAvailable"];
    result._graphicResult = GraphicResult.fromJson(jsonObject["graphicResult"]);
    result._textResult = TextResult.fromJson(jsonObject["textResult"]);
    if (jsonObject["documentPosition"] != null) {
      result._documentPosition = [];
      for (var item in jsonObject["documentPosition"]) {
        result._documentPosition!.addSafe(Position.fromJson(item));
      }
    }
    if (jsonObject["barcodePosition"] != null) {
      result._barcodePosition = [];
      for (var item in jsonObject["barcodePosition"]) {
        result._barcodePosition!.addSafe(Position.fromJson(item));
      }
    }
    if (jsonObject["mrzPosition"] != null) {
      result._mrzPosition = [];
      for (var item in jsonObject["mrzPosition"]) {
        result._mrzPosition!.addSafe(Position.fromJson(item));
      }
    }
    if (jsonObject["imageQuality"] != null) {
      result._imageQuality = [];
      for (var item in jsonObject["imageQuality"]) {
        result._imageQuality!.addSafe(ImageQualityGroup.fromJson(item));
      }
    }
    if (jsonObject["documentType"] != null) {
      result._documentType = [];
      for (var item in jsonObject["documentType"]) {
        result._documentType!.addSafe(DocumentType.fromJson(item));
      }
    }
    result._rawResult = jsonObject["rawResult"];
    result._bsiTr03135Results = jsonObject["bsiTr03135Results"];
    result._rfidSessionData = RFIDSessionData.fromJson(
      jsonObject["rfidSessionData"],
    );
    result._authenticityResult = AuthenticityResult.fromJson(
      jsonObject["authenticityResult"],
    );
    result._barcodeResult = BarcodeResult.fromJson(jsonObject["barcodeResult"]);
    result._status = ResultsStatus.fromJson(jsonObject["status"])!;
    result._vdsncData = VDSNCData.fromJson(jsonObject["vdsncData"]);
    result._vdsData = VDSData.fromJson(jsonObject["vdsData"]);
    result._dtcData = _bytesFromBase64(jsonObject["dtcData"]);
    result._transactionInfo = TransactionInfo.fromJson(
      jsonObject["transactionInfo"],
    );

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "documentType": documentType?.map((e) => e.toJson()).toList(),
        "documentPosition": documentPosition?.map((e) => e.toJson()).toList(),
        "barcodePosition": barcodePosition?.map((e) => e.toJson()).toList(),
        "mrzPosition": mrzPosition?.map((e) => e.toJson()).toList(),
        "imageQuality": imageQuality?.map((e) => e.toJson()).toList(),
        "textResult": textResult?.toJson(),
        "graphicResult": graphicResult?.toJson(),
        "status": status.toJson(),
        "authenticityResult": authenticityResult?.toJson(),
        "rfidSessionData": rfidSessionData?.toJson(),
        "barcodeResult": barcodeResult?.toJson(),
        "vdsncData": vdsncData?.toJson(),
        "vdsData": vdsData?.toJson(),
        "dtcData": _bytesToBase64(dtcData),
        "chipPage": chipPage,
        "processingFinishedStatus": processingFinishedStatus.value,
        "morePagesAvailable": morePagesAvailable,
        "elapsedTime": elapsedTime,
        "elapsedTimeRFID": elapsedTimeRFID,
        "rawResult": rawResult,
        "bsiTr03135Results": bsiTr03135Results,
        "transactionInfo": transactionInfo?.toJson(),
      }.clearNulls();
}

/// Enumeration contains identifiers that determine the processing finish status.
enum ProcessingFinishedStatus {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Processing is not finished.
  NOT_READY(0),

  /// Processing is finished.
  READY(1),

  /// Processing is finished by timeout.
  TIMEOUT(2);

  const ProcessingFinishedStatus(this.value);
  final int value;

  static ProcessingFinishedStatus? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ProcessingFinishedStatus.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ProcessingFinishedStatus.UNKNOWN;
    }
  }
}

/// Enumeration contains a pool of constants that determine the type of resulting
/// data formed during the data scanning and processing cycle and passed
/// to the user application.
enum ResultType {
  /// No result.
  NONE(-1),

  /// Stores a graphic image.
  EMPTY(0),

  /// Represented as binary array which contains image of the image graphic file.
  RAW_IMAGE(1),

  /// Serves for storing text results of MRZ, document filling and bar-codes reading.
  FILE_IMAGE(2),

  /// Serves for storing and passing to the user application of results of bar-codes
  /// areas search on the scanned document page and their.
  MRZ_OCR_EXTENDED(3),

  /// Serves for storing and passing to the user application of results of bar-codes
  /// areas search on the scanned document page and their reading in binary non-formatted code.
  BARCODES(5),

  /// Serves for storing graphic results of document filling area and bar-codes reading.
  GRAPHICS(6),

  /// Serves for storing the information on document MRZ printing quality check results.
  MRZ_TEST_QUALITY(7),

  /// Serves for storing information on candidate documents and passing it to the user
  /// application when performing the recognition of the document type.
  DOCUMENT_TYPES_CANDIDATES(8),

  /// Contains information on one candidate document when determining the document type.
  CHOSEN_DOCUMENT_TYPE_CANDIDATE(9),

  /// Not used. Serves for storing the full list of documents stored in the current
  /// document database and passing it to the user application.
  DOCUMENTS_INFO_LIST(10),

  /// Serves for storing the results of comparing the MRZ text data, document filling
  /// area data, bar-codes data and data retrieved from RFID-chip memory and passing
  /// it to the user application.
  OCR_LEXICAL_ANALYZE(15),

  /// Result stores a graphic image without compression.
  RAW_UNCROPPED_IMAGE(16),

  /// Result serves for storing text results of MRZ, document filling and bar-codes reading.
  VISUAL_OCR_EXTENDED(17),

  /// Result serves for storing text results of MRZ, document filling and bar-codes reading.
  BAR_CODES_TEXT_DATA(18),

  /// Serves for storing graphic results of document filling area and bar-codes reading.
  BAR_CODES_IMAGE_DATA(19),

  /// Serves for storing the result of document authenticity check using
  /// the images for different lighting schemes and passing it to the user
  /// application.
  AUTHENTICITY(20),

  /// Not used
  EXPERT_ANALYZE(21),

  /// Not used
  OCR_LEXICAL_ANALYZE_EX(22),

  /// Stores a graphic image in without compression and passing it to the user application.
  EOS_IMAGE(23),

  ///Stores a graphic image in without compression and passing it to the user application.
  BAYER_IMAGE(24),

  ///Represented as binary array which contains array if data erade from magnetic stripe.
  MAGNETIC_STRIPE(25),

  ///Serves for storing text results of MRZ, document filling and bar-codes reading.
  MAGNETIC_STRIPE_TEXT_DATA(26),

  ///Represented as binary array which contains image of the graphic field image graphic file.
  FIELD_FILE_IMAGE(27),

  ///Serves for storing the result of documents database check.
  DATABASE_CHECK(28),

  ///Represented as binary array which contains ISO fingerprint template.
  FINGERPRINT_TEMPLATE_ISO(29),

  ///Used for storing input image quality check results list.
  INPUT_IMAGE_QUALITY(30),

  /// Serves for storing the result of document authenticity check using live
  /// portrait image.
  LIVE_PORTRAIT(32),

  /// Stores information about operations status.
  STATUS(33),

  /// Serves for storing the result of document authenticity check using portrait images.
  PORTRAIT_COMPARISON(34),

  /// Serves for storing the result of document authenticity check using external portait.
  EXT_PORTRAIT(35),

  /// Used for storing text results list.
  TEXT(36),

  /// Used for storing images results list.
  IMAGES(37),

  /// Serves to store RFID session as binary data.
  INTERNAL_RFID_SESSION(48),

  /// Serves to store the encrypted data object.
  INTERNAL_ENCRYPTED_RCL(49),

  /// Serves to store the encrypted license key.
  INTERNAL_LICENSE(50),

  /// Used for storing MRZ position.
  MRZ_POSITION(61),

  /// Used for storing barcode position.
  BARCODE_POSITION(62),

  /// Results in accordance with the BSI TR-03135 standard.
  RESULT_TYPE_BSI_XML_V2(73),

  /// Used for storing document position.
  DOCUMENT_POSITION(85),

  /// Not used
  CUSTOM(100),

  /// Servers for storing the data reading results from the RFID-chip in a form
  /// of a list of the logically separated data groups.
  RFID_RAW_DATA(101),

  /// Servers for storing the results of data reading from the RFID-chip in a form
  /// of a list of logically separated text data (text fields).
  RFID_TEXT_DATA(102),

  /// Servers for storing the results of data reading from the RFID- chip in a form
  /// of a list of logically separated graphic data (images, graphic fields).
  RFID_IMAGE_DATA(103),

  /// Servers for storing the data reading results from the RFID-chip in a form
  /// of a list of the logically separated data groups.
  RFID_BINARY_DATA(104),

  /// Servers for storing the results of data reading in a form of a list of objects
  /// of the original binary representation of the graphics in memory of the RFID-chip.
  RFID_ORIGINAL_GRAPHICS(105),

  /// Digital Travel Credential data.
  RFID_DTC_VC(109),

  MDL_PARSED_RESPONSE(121),

  /// VDS_NC.
  VDSNC(124),

  /// VDS.
  VDS(125);

  const ResultType(this.value);
  final int value;

  static ResultType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ResultType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ResultType.NONE;
    }
  }

  static List<ResultType>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<ResultType> list = [];
    for (int item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}
