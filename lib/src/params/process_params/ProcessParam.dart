//
//  ProcessParam.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Params that influence the scanning process.
class ProcessParam {
  /// If set to `true`, processing of more than one page of the document
  /// (if they exist) will be triggered, otherwise, only one page will be processed.
  bool? get multipageProcessing => _multipageProcessing;
  bool? _multipageProcessing;
  set multipageProcessing(bool? val) {
    _multipageProcessing = val;
    _setProcessParams({"multipageProcessing": val}, this);
  }

  /// If set to `true`, the DocumentReader logs will be shown in the console.
  bool? get logs => _logs;
  bool? _logs;
  set logs(bool? val) {
    _logs = val;
    _setProcessParams({"logs": val}, this);
  }

  /// If set to `true`, images will be saved to the application's directory.
  bool? get debugSaveImages => _debugSaveImages;
  bool? _debugSaveImages;
  set debugSaveImages(bool? val) {
    _debugSaveImages = val;
    _setProcessParams({"debugSaveImages": val}, this);
  }

  /// If set to `true`, text logs will be saved to the application's directory.
  bool? get debugSaveLogs => _debugSaveLogs;
  bool? _debugSaveLogs;
  set debugSaveLogs(bool? val) {
    _debugSaveLogs = val;
    _setProcessParams({"debugSaveLogs": val}, this);
  }

  /// If set to `true`, an original (uncropped) image will be received,
  ///  which is sent for recognition.
  bool? get returnUncroppedImage => _returnUncroppedImage;
  bool? _returnUncroppedImage;
  set returnUncroppedImage(bool? val) {
    _returnUncroppedImage = val;
    _setProcessParams({"returnUncroppedImage": val}, this);
  }

  /// Set to `true` when torch is connected and enabled by user.
  ///
  /// Android only.
  bool? get uvTorchEnabled => _uvTorchEnabled;
  bool? _uvTorchEnabled;
  set uvTorchEnabled(bool? val) {
    _uvTorchEnabled = val;
    _setProcessParams({"uvTorchEnabled": val}, this);
  }

  /// If set to `true`, cropped images will be saved to the application's directory.
  bool? get debugSaveCroppedImages => _debugSaveCroppedImages;
  bool? _debugSaveCroppedImages;
  set debugSaveCroppedImages(bool? val) {
    _debugSaveCroppedImages = val;
    _setProcessParams({"debugSaveCroppedImages": val}, this);
  }

  /// If set to `true`, document focus check will be omitted.
  bool? get disableFocusingCheck => _disableFocusingCheck;
  bool? _disableFocusingCheck;
  set disableFocusingCheck(bool? val) {
    _disableFocusingCheck = val;
    _setProcessParams({"disableFocusingCheck": val}, this);
  }

  /// If set to `true`, RFID sessions will be saved to the application's directory.
  bool? get debugSaveRFIDSession => _debugSaveRFIDSession;
  bool? _debugSaveRFIDSession;
  set debugSaveRFIDSession(bool? val) {
    _debugSaveRFIDSession = val;
    _setProcessParams({"debugSaveRFIDSession": val}, this);
  }

  /// If set to `true`, allows to process up to two pages of the document
  /// (so-called "a double-page spread") for one-shot if they are presented
  /// on the frame (image).
  bool? get doublePageSpread => _doublePageSpread;
  bool? _doublePageSpread;
  set doublePageSpread(bool? val) {
    _doublePageSpread = val;
    _setProcessParams({"doublePageSpread": val}, this);
  }

  /// If set to `true`, allows you to manually set the document's bounds
  /// after it is detected.
  bool? get manualCrop => _manualCrop;
  bool? _manualCrop;
  set manualCrop(bool? val) {
    _manualCrop = val;
    _setProcessParams({"manualCrop": val}, this);
  }

  /// Allows to build an integral image, taking into account the quality of
  /// fixation of each of the individual images.
  bool? get integralImage => _integralImage;
  bool? _integralImage;
  set integralImage(bool? val) {
    _integralImage = val;
    _setProcessParams({"integralImage": val}, this);
  }

  /// If set to `true`, an image with cropped barcode will be returned.
  bool? get returnCroppedBarcode => _returnCroppedBarcode;
  bool? _returnCroppedBarcode;
  set returnCroppedBarcode(bool? val) {
    _returnCroppedBarcode = val;
    _setProcessParams({"returnCroppedBarcode": val}, this);
  }

  /// If set to `true`, a document's holograms presence will be checked.
  bool? get checkHologram => _checkHologram;
  bool? _checkHologram;
  set checkHologram(bool? val) {
    _checkHologram = val;
    _setProcessParams({"checkHologram": val}, this);
  }

  /// If set to `true`, in case required fields are not read, their values
  /// will be empty.
  bool? get checkRequiredTextFields => _checkRequiredTextFields;
  bool? _checkRequiredTextFields;
  set checkRequiredTextFields(bool? val) {
    _checkRequiredTextFields = val;
    _setProcessParams({"checkRequiredTextFields": val}, this);
  }

  /// If set to `true`, personal information will be removed from logs.
  bool? get depersonalizeLog => _depersonalizeLog;
  bool? _depersonalizeLog;
  set depersonalizeLog(bool? val) {
    _depersonalizeLog = val;
    _setProcessParams({"depersonalizeLog": val}, this);
  }

  /// When enabled together with [doublePageSpread] and there is a passport
  /// with two pages spread in the image, pages will be cropped, straightened
  /// and aligned together, as if the document was captured on a flatbed scanner.
  bool? get generateDoublePageSpreadImage => _generateDoublePageSpreadImage;
  bool? _generateDoublePageSpreadImage;
  set generateDoublePageSpreadImage(bool? val) {
    _generateDoublePageSpreadImage = val;
    _setProcessParams({"generateDoublePageSpreadImage": val}, this);
  }

  /// This option can be set to `true` if you know for sure that the image you
  /// provide contains already cropped document by its edges. This was designed
  /// to process on the server side images captured and cropped on mobile.
  bool? get alreadyCropped => _alreadyCropped;
  bool? _alreadyCropped;
  set alreadyCropped(bool? val) {
    _alreadyCropped = val;
    _setProcessParams({"alreadyCropped": val}, this);
  }

  /// When disabled, text field OCR will be done as is and then the recognized
  /// value will be matched to the field mask for validity. If enabled, we
  /// are trying to read a field value with maximum efforts to match the mask
  /// and provide a correctly formatted value, making assumptions based on the
  /// provided field mask in the template.
  bool? get matchTextFieldMask => _matchTextFieldMask;
  bool? _matchTextFieldMask;
  set matchTextFieldMask(bool? val) {
    _matchTextFieldMask = val;
    _setProcessParams({"matchTextFieldMask": val}, this);
  }

  /// When enabled, shorten the list of candidates to process during document
  /// detection in single image process mode. Reduces processing time
  /// for specific backgrounds.
  bool? get fastDocDetect => _fastDocDetect;
  bool? _fastDocDetect;
  set fastDocDetect(bool? val) {
    _fastDocDetect = val;
    _setProcessParams({"fastDocDetect": val}, this);
  }

  /// When enabled, fail OCR field validity, if there is a glare over the text
  /// ƒfield on the image.
  bool? get updateOCRValidityByGlare => _updateOCRValidityByGlare;
  bool? _updateOCRValidityByGlare;
  set updateOCRValidityByGlare(bool? val) {
    _updateOCRValidityByGlare = val;
    _setProcessParams({"updateOCRValidityByGlare": val}, this);
  }

  /// When enabled no graphic fields will be cropped from document image.
  bool? get noGraphics => _noGraphics;
  bool? _noGraphics;
  set noGraphics(bool? val) {
    _noGraphics = val;
    _setProcessParams({"noGraphics": val}, this);
  }

  /// This option allows locating and cropping multiple documents
  /// from one image if enabled.
  bool? get multiDocOnImage => _multiDocOnImage;
  bool? _multiDocOnImage;
  set multiDocOnImage(bool? val) {
    _multiDocOnImage = val;
    _setProcessParams({"multiDocOnImage": val}, this);
  }

  /// This option can be set to `true` to make sure that in series processing
  /// MRZ is located fully inside the result document image, if present
  /// on the document. Enabling this option may add extra processing time,
  /// by disabling optimizations, but allows more stability in output image quality.
  bool? get forceReadMrzBeforeLocate => _forceReadMrzBeforeLocate;
  bool? _forceReadMrzBeforeLocate;
  set forceReadMrzBeforeLocate(bool? val) {
    _forceReadMrzBeforeLocate = val;
    _setProcessParams({"forceReadMrzBeforeLocate": val}, this);
  }

  /// When set to `false`, the Barcode code parsing will be skipped
  /// and the raw information from the code will be returned instead.
  bool? get parseBarcodes => _parseBarcodes;
  bool? _parseBarcodes;
  set parseBarcodes(bool? val) {
    _parseBarcodes = val;
    _setProcessParams({"parseBarcodes": val}, this);
  }

  /// When set to `true`, the `rawResults` property of the [Results]
  /// will contain the encrypted containers of scanning results
  /// that may be used for later reprocessing.
  bool? get shouldReturnPackageForReprocess => _shouldReturnPackageForReprocess;
  bool? _shouldReturnPackageForReprocess;
  set shouldReturnPackageForReprocess(bool? val) {
    _shouldReturnPackageForReprocess = val;
    _setProcessParams({"shouldReturnPackageForReprocess": val}, this);
  }

  /// When enabled, OCR of perforated fields in the document template
  /// will not be performed.
  bool? get disablePerforationOCR => _disablePerforationOCR;
  bool? _disablePerforationOCR;
  set disablePerforationOCR(bool? val) {
    _disablePerforationOCR = val;
    _setProcessParams({"disablePerforationOCR": val}, this);
  }

  /// When enabled, image quality checks status affects document optical
  /// and overall status.
  bool? get respectImageQuality => _respectImageQuality;
  bool? _respectImageQuality;
  set respectImageQuality(bool? val) {
    _respectImageQuality = val;
    _setProcessParams({"respectImageQuality": val}, this);
  }

  /// When enabled, the Surname and GivenNames field ([TextField])
  /// will be divided into fields with fieldTypes [VisualFieldType.FIRST_NAME],
  /// [VisualFieldType.SECOND_NAME], [VisualFieldType.THIRD_NAME], [VisualFieldType.LAST_NAME].
  bool? get splitNames => _splitNames;
  bool? _splitNames;
  set splitNames(bool? val) {
    _splitNames = val;
    _setProcessParams({"splitNames": val}, this);
  }

  /// Enable the CAN (Card Access Number) detection when using scenarios
  /// with document location and MRZ reading, such as the MrzAndLocate scenario.
  bool? get doDetectCan => _doDetectCan;
  bool? _doDetectCan;
  set doDetectCan(bool? val) {
    _doDetectCan = val;
    _setProcessParams({"doDetectCan": val}, this);
  }

  /// Use this property to set up the Face API integration.
  bool? get useFaceApi => _useFaceApi;
  bool? _useFaceApi;
  set useFaceApi(bool? val) {
    _useFaceApi = val;
    _setProcessParams({"useFaceApi": val}, this);
  }

  /// There are documents that contain barcodes which data can be parsed only
  /// if document type verification is performed. The following property allows
  /// setting the barcode parser type which should be used during recognition.
  /// It allows parsing barcode data without performing document type verification.
  int? get barcodeParserType => _barcodeParserType;
  int? _barcodeParserType;
  set barcodeParserType(int? val) {
    _barcodeParserType = val;
    _setProcessParams({"barcodeParserType": val}, this);
  }

  /// Allows you to set the maximum value of the deviation of the corners
  /// of the document from the value of `90` degrees.
  int? get perspectiveAngle => _perspectiveAngle;
  int? _perspectiveAngle;
  set perspectiveAngle(int? val) {
    _perspectiveAngle = val;
    _setProcessParams({"perspectiveAngle": val}, this);
  }

  /// Allows you to set the minimum acceptable DPI value of the camera frame
  /// that is passed for recognition. Camera frames the DPI of which are less
  /// than you set won't be passed for recognition.
  int? get minDPI => _minDPI;
  int? _minDPI;
  set minDPI(int? val) {
    _minDPI = val;
    _setProcessParams({"minDPI": val}, this);
  }

  /// This option controls maximum resolution in dpi of output images.
  /// Resolution will remain original in case `0` is set.
  int? get imageDpiOutMax => _imageDpiOutMax;
  int? _imageDpiOutMax;
  set imageDpiOutMax(int? val) {
    _imageDpiOutMax = val;
    _setProcessParams({"imageDpiOutMax": val}, this);
  }

  /// Force use of specified document format when locating and recognizing
  /// document to reduce the number of candidates.
  int? get forceDocFormat => _forceDocFormat;
  int? _forceDocFormat;
  set forceDocFormat(int? val) {
    _forceDocFormat = val;
    _setProcessParams({"forceDocFormat": val}, this);
  }

  /// This option allows shifting the date of expiry into the future or past
  /// for number of months specified. This is useful, for example, in some cases
  /// when document might be still valid for some period after original
  /// expiration date to prevent negative validity status for such documents.
  /// Or by shifting the date to the past will set negative validity
  /// for the documents that is about to expire in a specified number of months.
  int? get shiftExpiryDate => _shiftExpiryDate;
  int? _shiftExpiryDate;
  set shiftExpiryDate(int? val) {
    _shiftExpiryDate = val;
    _setProcessParams({"shiftExpiryDate": val}, this);
  }

  /// This options allows specifying the minimal age in years of the document
  /// holder for the document to be considered valid.
  int? get minimalHolderAge => _minimalHolderAge;
  int? _minimalHolderAge;
  set minimalHolderAge(int? val) {
    _minimalHolderAge = val;
    _setProcessParams({"minimalHolderAge": val}, this);
  }

  /// Maximum height of output images. In pixels.
  int? get imageOutputMaxHeight => _imageOutputMaxHeight;
  int? _imageOutputMaxHeight;
  set imageOutputMaxHeight(int? val) {
    _imageOutputMaxHeight = val;
    _setProcessParams({"imageOutputMaxHeight": val}, this);
  }

  /// Maximum width of output images. In pixels.
  int? get imageOutputMaxWidth => _imageOutputMaxWidth;
  int? _imageOutputMaxWidth;
  set imageOutputMaxWidth(int? val) {
    _imageOutputMaxWidth = val;
    _setProcessParams({"imageOutputMaxWidth": val}, this);
  }

  /// Accepts sum of [Authenticity] values.
  int? get processAuth => _processAuth;
  int? _processAuth;
  set processAuth(int? val) {
    _processAuth = val;
    _setProcessParams({"processAuth": val}, this);
  }

  /// This option allows output text case transformation.
  /// No changes applied by default to original values.
  int? get convertCase => _convertCase;
  int? _convertCase;
  set convertCase(int? val) {
    _convertCase = val;
    _setProcessParams({"convertCase": val}, this);
  }

  /// Measure system of fields' values that are presented in results.
  /// Default: If the country code is `US` or `LR` or `MM`, the
  /// [MeasureSystem.IMPERIAL] system of measurement, otherwise, the [MeasureSystem.METRIC].
  MeasureSystem? get measureSystem => _measureSystem;
  MeasureSystem? _measureSystem;
  set measureSystem(MeasureSystem? val) {
    _measureSystem = val;
    _setProcessParams({"measureSystem": val?.value}, this);
  }

  /// Force use of specific template ID and skip document type identification step.
  DocFormat? get forceDocID => _forceDocID;
  DocFormat? _forceDocID;
  set forceDocID(DocFormat? val) {
    _forceDocID = val;
    _setProcessParams({"forceDocID": val?.value}, this);
  }

  /// Change the format string of displayed dates in the results.
  ///
  /// Mask examples: `dd/mm/yyyy`, `mm/dd/yyyy`, `dd-mm-yyyy`, `mm-dd-yyyy`, `dd/mm/yy`.
  /// Set to `null` to revert default value.
  ///
  /// Default: depends on the device's locale.
  String? get dateFormat => _dateFormat;
  String? _dateFormat;
  set dateFormat(String? val) {
    _dateFormat = val;
    _setProcessParams({"dateFormat": val}, this);
  }

  /// Documents processing scenario.
  Scenario? get scenario => _scenario;
  Scenario? _scenario;
  set scenario(Scenario? val) {
    _scenario = val;
    _setProcessParams({"scenario": val?.value}, this);
  }

  /// Documents processing scenario for the Capture button.
  String? get captureButtonScenario => _captureButtonScenario;
  String? _captureButtonScenario;
  set captureButtonScenario(String? val) {
    _captureButtonScenario = val;
    _setProcessParams({"captureButtonScenario": val}, this);
  }

  /// The path to the folder of the current session. Before using this, save logs.
  /// Each new session provides a different path.
  String? get sessionLogFolder => _sessionLogFolder;
  String? _sessionLogFolder;
  set sessionLogFolder(String? val) {
    _sessionLogFolder = val;
    _setProcessParams({"sessionLogFolder": val}, this);
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the scenario starts.
  /// Setting value to `0` means infinity.
  double? get timeout => _timeout;
  double? _timeout;
  set timeout(double? val) {
    _timeout = val;
    _setProcessParams({"timeout": val}, this);
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the document is detected.
  /// Setting value to `0` means infinity.
  double? get timeoutFromFirstDetect => _timeoutFromFirstDetect;
  double? _timeoutFromFirstDetect;
  set timeoutFromFirstDetect(double? val) {
    _timeoutFromFirstDetect = val;
    _setProcessParams({"timeoutFromFirstDetect": val}, this);
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the document type is recognized.
  /// Setting value to `0` means infinity.
  double? get timeoutFromFirstDocType => _timeoutFromFirstDocType;
  double? _timeoutFromFirstDocType;
  set timeoutFromFirstDocType(double? val) {
    _timeoutFromFirstDocType = val;
    _setProcessParams({"timeoutFromFirstDocType": val}, this);
  }

  /// Specifies minimal area of the image that document should cover to be treated
  /// as candidate when locating. Value should be in range from `0` to `1`,
  /// where `1` is when document should fully cover the image.
  double? get documentAreaMin => _documentAreaMin;
  double? _documentAreaMin;
  set documentAreaMin(double? val) {
    _documentAreaMin = val;
    _setProcessParams({"documentAreaMin": val}, this);
  }

  /// Takes the list of the document IDs to process.
  /// All documents will be processed if it's empty.
  List<int>? get documentIDList => _documentIDList;
  List<int>? _documentIDList;
  set documentIDList(List<int>? val) {
    _documentIDList = val;
    _setProcessParams({"documentIDList": val}, this);
  }

  /// Set types of barcodes that you wish to recognize.
  /// All barcodes will be recognized if it's empty.
  List<BarcodeType>? get barcodeTypes => _barcodeTypes;
  List<BarcodeType>? _barcodeTypes;
  set barcodeTypes(List<BarcodeType>? val) {
    _barcodeTypes = val;
    _setProcessParams({"barcodeTypes": BarcodeType.toIntList(val)}, this);
  }

  /// If you recognize the MRZ of documents, all fields will be extracted.
  /// If you recognize the Visual zone of documents, you can set the list
  /// of field types that you wish to extract, other fields will be skipped
  /// during processing. All fields will be extracted if it is empty.
  List<VisualFieldType>? get fieldTypesFilter => _fieldTypesFilter;
  List<VisualFieldType>? _fieldTypesFilter;
  set fieldTypesFilter(List<VisualFieldType>? val) {
    _fieldTypesFilter = val;
    _setProcessParams(
        {"fieldTypesFilter": VisualFieldType.toIntList(val)}, this);
  }

  /// Types of results to return in response.
  List<ResultType>? get resultTypeOutput => _resultTypeOutput;
  List<ResultType>? _resultTypeOutput;
  set resultTypeOutput(List<ResultType>? val) {
    _resultTypeOutput = val;
    _setProcessParams({"resultTypeOutput": ResultType.toIntList(val)}, this);
  }

  /// This option allows limiting MRZ formats to be recognized by specifying
  /// them in array.
  List<MRZFormat>? get mrzFormatsFilter => _mrzFormatsFilter;
  List<MRZFormat>? _mrzFormatsFilter;
  set mrzFormatsFilter(List<MRZFormat>? val) {
    _mrzFormatsFilter = val;
    _setProcessParams({"mrzFormatsFilter": MRZFormat.toStringList(val)}, this);
  }

  /// Array of specific eligible document types to recognize from. You may,
  /// for example, specify only passports to be recognized by setting this property.
  List<DocType>? get documentGroupFilter => _documentGroupFilter;
  List<DocType>? _documentGroupFilter;
  set documentGroupFilter(List<DocType>? val) {
    _documentGroupFilter = val;
    _setProcessParams({"documentGroupFilter": DocType.toIntList(val)}, this);
  }

  /// Controls properties of [ImageQA] checks.
  ImageQA get imageQA => _imageQA;
  ImageQA _imageQA = ImageQA();
  set imageQA(ImageQA val) {
    _imageQA = val;
    _setProcessParams({"imageQA": val.toJson()}, this);
  }

  /// Custom RFID params.
  RFIDParams? get rfidParams => _rfidParams;
  RFIDParams? _rfidParams;
  set rfidParams(RFIDParams? val) {
    _rfidParams = val;
    _setProcessParams({"rfidParams": val?.toJson()}, this);
  }

  /// Custom Face API integration params.
  FaceApiParams? get faceApiParams => _faceApiParams;
  FaceApiParams? _faceApiParams;
  set faceApiParams(FaceApiParams? val) {
    _faceApiParams = val;
    _setProcessParams({"faceApiParams": val?.toJson()}, this);
  }

  /// Takes JSON with parameters that are not presented in the DocumentReader.
  dynamic get customParams => _customParams;
  dynamic _customParams;
  set customParams(dynamic val) {
    _customParams = val;
    _setProcessParams({"customParams": val}, this);
  }

  /// Allows you to deserialize object.
  fromJson(Map<String, dynamic> jsonObject) {
    _multipageProcessing = jsonObject["multipageProcessing"];
    _logs = jsonObject["logs"];
    _debugSaveImages = jsonObject["debugSaveImages"];
    _debugSaveLogs = jsonObject["debugSaveLogs"];
    _returnUncroppedImage = jsonObject["returnUncroppedImage"];
    _uvTorchEnabled = jsonObject["uvTorchEnabled"];
    _debugSaveCroppedImages = jsonObject["debugSaveCroppedImages"];
    _disableFocusingCheck = jsonObject["disableFocusingCheck"];
    _debugSaveRFIDSession = jsonObject["debugSaveRFIDSession"];
    _doublePageSpread = jsonObject["doublePageSpread"];
    _manualCrop = jsonObject["manualCrop"];
    _integralImage = jsonObject["integralImage"];
    _returnCroppedBarcode = jsonObject["returnCroppedBarcode"];
    _checkHologram = jsonObject["checkHologram"];
    _checkRequiredTextFields = jsonObject["checkRequiredTextFields"];
    _depersonalizeLog = jsonObject["depersonalizeLog"];
    _generateDoublePageSpreadImage =
        jsonObject["generateDoublePageSpreadImage"];
    _alreadyCropped = jsonObject["alreadyCropped"];
    _matchTextFieldMask = jsonObject["matchTextFieldMask"];
    _fastDocDetect = jsonObject["fastDocDetect"];
    _updateOCRValidityByGlare = jsonObject["updateOCRValidityByGlare"];
    _noGraphics = jsonObject["noGraphics"];
    _multiDocOnImage = jsonObject["multiDocOnImage"];
    _forceReadMrzBeforeLocate = jsonObject["forceReadMrzBeforeLocate"];
    _parseBarcodes = jsonObject["parseBarcodes"];
    _shouldReturnPackageForReprocess =
        jsonObject["shouldReturnPackageForReprocess"];
    _disablePerforationOCR = jsonObject["disablePerforationOCR"];
    _respectImageQuality = jsonObject["respectImageQuality"];
    _splitNames = jsonObject["splitNames"];
    _doDetectCan = jsonObject["doDetectCan"];
    _useFaceApi = jsonObject["useFaceApi"];

    _measureSystem = MeasureSystem.getByValue(jsonObject["measureSystem"]);
    _barcodeParserType = jsonObject["barcodeParserType"];
    _perspectiveAngle = jsonObject["perspectiveAngle"];
    _minDPI = jsonObject["minDPI"];
    _imageDpiOutMax = jsonObject["imageDpiOutMax"];
    _forceDocID = DocFormat.getByValue(jsonObject["forceDocID"]);
    _forceDocFormat = jsonObject["forceDocFormat"];
    _shiftExpiryDate = jsonObject["shiftExpiryDate"];
    _minimalHolderAge = jsonObject["minimalHolderAge"];
    _imageOutputMaxHeight = jsonObject["imageOutputMaxHeight"];
    _imageOutputMaxWidth = jsonObject["imageOutputMaxWidth"];
    _processAuth = jsonObject["processAuth"];
    _convertCase = jsonObject["convertCase"];

    _dateFormat = jsonObject["dateFormat"];
    _scenario = Scenario.getByValue(jsonObject["scenario"]);
    _captureButtonScenario = jsonObject["captureButtonScenario"];
    _sessionLogFolder = jsonObject["sessionLogFolder"];

    _timeout = _toDouble(jsonObject["timeout"]);
    _timeoutFromFirstDetect = _toDouble(jsonObject["timeoutFromFirstDetect"]);
    _timeoutFromFirstDocType = _toDouble(jsonObject["timeoutFromFirstDocType"]);
    _documentAreaMin = _toDouble(jsonObject["documentAreaMin"]);

    _documentIDList = jsonObject["documentIDList"];
    _barcodeTypes = BarcodeType.fromIntList(jsonObject["barcodeTypes"]);

    _fieldTypesFilter =
        VisualFieldType.fromIntList(jsonObject["fieldTypesFilter"]);
    _resultTypeOutput = ResultType.fromIntList(jsonObject["resultTypeOutput"]);
    _mrzFormatsFilter =
        MRZFormat.fromStringList(jsonObject["mrzFormatsFilter"]);
    _documentGroupFilter =
        DocType.fromIntList(jsonObject["documentGroupFilter"]);

    _imageQA = ImageQA.fromJson(jsonObject["imageQA"])!;
    _rfidParams = RFIDParams.fromJson(jsonObject["rfidParams"]);
    _faceApiParams = FaceApiParams.fromJson(jsonObject["faceApiParams"]);

    _customParams = jsonObject["customParams"];

    return this;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "multipageProcessing": multipageProcessing,
        "debugSaveImages": debugSaveImages,
        "debugSaveLogs": debugSaveLogs,
        "returnUncroppedImage": returnUncroppedImage,
        "uvTorchEnabled": uvTorchEnabled,
        "debugSaveCroppedImages": debugSaveCroppedImages,
        "disableFocusingCheck": disableFocusingCheck,
        "debugSaveRFIDSession": debugSaveRFIDSession,
        "doublePageSpread": doublePageSpread,
        "manualCrop": manualCrop,
        "integralImage": integralImage,
        "returnCroppedBarcode": returnCroppedBarcode,
        "checkHologram": checkHologram,
        "checkRequiredTextFields": checkRequiredTextFields,
        "depersonalizeLog": depersonalizeLog,
        "generateDoublePageSpreadImage": generateDoublePageSpreadImage,
        "alreadyCropped": alreadyCropped,
        "matchTextFieldMask": matchTextFieldMask,
        "fastDocDetect": fastDocDetect,
        "updateOCRValidityByGlare": updateOCRValidityByGlare,
        "noGraphics": noGraphics,
        "multiDocOnImage": multiDocOnImage,
        "forceReadMrzBeforeLocate": forceReadMrzBeforeLocate,
        "parseBarcodes": parseBarcodes,
        "shouldReturnPackageForReprocess": shouldReturnPackageForReprocess,
        "disablePerforationOCR": disablePerforationOCR,
        "respectImageQuality": respectImageQuality,
        "splitNames": splitNames,
        "doDetectCan": doDetectCan,
        "useFaceApi": useFaceApi,
        "measureSystem": measureSystem!.value,
        "barcodeParserType": barcodeParserType,
        "perspectiveAngle": perspectiveAngle,
        "minDPI": minDPI,
        "imageDpiOutMax": imageDpiOutMax,
        "forceDocID": forceDocID!.value,
        "forceDocFormat": forceDocFormat,
        "shiftExpiryDate": shiftExpiryDate,
        "minimalHolderAge": minimalHolderAge,
        "imageOutputMaxHeight": imageOutputMaxHeight,
        "imageOutputMaxWidth": imageOutputMaxWidth,
        "processAuth": processAuth,
        "convertCase": convertCase,
        "dateFormat": dateFormat,
        "scenario": scenario?.value,
        "captureButtonScenario": captureButtonScenario,
        "sessionLogFolder": sessionLogFolder,
        "timeout": timeout,
        "timeoutFromFirstDetect": timeoutFromFirstDetect,
        "timeoutFromFirstDocType": timeoutFromFirstDocType,
        "documentAreaMin": documentAreaMin,
        "documentIDList": documentIDList,
        "barcodeTypes": BarcodeType.toIntList(barcodeTypes),
        "fieldTypesFilter": VisualFieldType.toIntList(fieldTypesFilter),
        "resultTypeOutput": ResultType.toIntList(resultTypeOutput),
        "mrzFormatsFilter": MRZFormat.toStringList(mrzFormatsFilter),
        "documentGroupFilter": DocType.toIntList(documentGroupFilter),
        "imageQA": imageQA.toJson(),
        "rfidParams": rfidParams?.toJson(),
        "faceApiParams": faceApiParams?.toJson(),
        "customParams": customParams,
      };

  static _setProcessParams(
    Map<String, dynamic> json,
    ProcessParam instance,
  ) {
    if (identical(instance, DocumentReader.instance.processParams))
      _bridge.invokeMethod("setProcessParams", [json]);
  }

  Future<void> _sync() async {
    String response = await _bridge.invokeMethod("getProcessParams", []);
    this.fromJson(_decode(response));
  }

  _apply() => _setProcessParams(this.toJson(), this);
}

/// The constants of the enumeration identify the system
/// for measuring distances and weight.
enum MeasureSystem {
  /// The Metric System of Measurement, which uses the measuring units
  /// such as meters and grams and adds prefixes like kilo, milli
  /// and centi to count orders of magnitude.
  METRIC(0),

  /// The Imperial System of Measurement, where things are measured in feet,
  /// inches and pounds.
  IMPERIAL(1);

  const MeasureSystem(this.value);
  final int value;

  static MeasureSystem? getByValue(int? i) {
    if (i == null) return null;
    return MeasureSystem.values.firstWhere((x) => x.value == i);
  }
}

enum MRZFormat {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(""),

  FORMAT_1X30("1x30"),

  FORMAT_3X30("3x30"),

  FORMAT_2X36("2x36"),

  FORMAT_2X44("2x44"),

  FORMAT_1X6("1x6"),

  FORMAT_2X30("2x30");

  const MRZFormat(this.value);
  final String value;

  static MRZFormat? getByValue(String? i) {
    if (i == null) return null;
    try {
      return MRZFormat.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return MRZFormat.UNKNOWN;
    }
  }

  static List<String>? toStringList(List<MRZFormat>? input) {
    if (input == null) return null;
    List<String> list = [];
    for (var item in input) list.add(item.value);
    return list;
  }

  static List<MRZFormat>? fromStringList(List<String>? input) {
    if (input == null) return null;
    List<MRZFormat> list = [];
    for (String item in input) list.addSafe(getByValue(item));
    return list;
  }
}
