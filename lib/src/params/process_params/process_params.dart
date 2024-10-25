//
//  ProcessParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Params that influence the scanning process.
class ProcessParams {
  /// If set to `true`, processing of more than one page of the document
  /// (if they exist) will be triggered, otherwise, only one page will be processed.
  bool? get multipageProcessing => _multipageProcessing;
  bool? _multipageProcessing;
  set multipageProcessing(bool? val) {
    _multipageProcessing = val;
    _set({"multipageProcessing": val});
  }

  /// If set to `true`, the DocumentReader logs will be shown in the console.
  bool? get logs => _logs;
  bool? _logs;
  set logs(bool? val) {
    _logs = val;
    _set({"logs": val});
  }

  /// If set to `true`, images will be saved to the application's directory.
  bool? get debugSaveImages => _debugSaveImages;
  bool? _debugSaveImages;
  set debugSaveImages(bool? val) {
    _debugSaveImages = val;
    _set({"debugSaveImages": val});
  }

  /// If set to `true`, text logs will be saved to the application's directory.
  bool? get debugSaveLogs => _debugSaveLogs;
  bool? _debugSaveLogs;
  set debugSaveLogs(bool? val) {
    _debugSaveLogs = val;
    _set({"debugSaveLogs": val});
  }

  /// If set to `true`, an original (uncropped) image will be received,
  ///  which is sent for recognition.
  bool? get returnUncroppedImage => _returnUncroppedImage;
  bool? _returnUncroppedImage;
  set returnUncroppedImage(bool? val) {
    _returnUncroppedImage = val;
    _set({"returnUncroppedImage": val});
  }

  /// Set to `true` when torch is connected and enabled by user.
  ///
  /// Android only.
  bool? get uvTorchEnabled => _uvTorchEnabled;
  bool? _uvTorchEnabled;
  set uvTorchEnabled(bool? val) {
    _uvTorchEnabled = val;
    _set({"uvTorchEnabled": val});
  }

  /// If set to `true`, cropped images will be saved to the application's directory.
  bool? get debugSaveCroppedImages => _debugSaveCroppedImages;
  bool? _debugSaveCroppedImages;
  set debugSaveCroppedImages(bool? val) {
    _debugSaveCroppedImages = val;
    _set({"debugSaveCroppedImages": val});
  }

  /// If set to `true`, document focus check will be omitted.
  bool? get disableFocusingCheck => _disableFocusingCheck;
  bool? _disableFocusingCheck;
  set disableFocusingCheck(bool? val) {
    _disableFocusingCheck = val;
    _set({"disableFocusingCheck": val});
  }

  /// If set to `true`, RFID sessions will be saved to the application's directory.
  bool? get debugSaveRFIDSession => _debugSaveRFIDSession;
  bool? _debugSaveRFIDSession;
  set debugSaveRFIDSession(bool? val) {
    _debugSaveRFIDSession = val;
    _set({"debugSaveRFIDSession": val});
  }

  /// If set to `true`, allows to process up to two pages of the document
  /// (so-called "a double-page spread") for one-shot if they are presented
  /// on the frame (image).
  bool? get doublePageSpread => _doublePageSpread;
  bool? _doublePageSpread;
  set doublePageSpread(bool? val) {
    _doublePageSpread = val;
    _set({"doublePageSpread": val});
  }

  /// If set to `true`, allows you to manually set the document's bounds
  /// after it is detected.
  bool? get manualCrop => _manualCrop;
  bool? _manualCrop;
  set manualCrop(bool? val) {
    _manualCrop = val;
    _set({"manualCrop": val});
  }

  /// Allows to build an integral image, taking into account the quality of
  /// fixation of each of the individual images.
  bool? get integralImage => _integralImage;
  bool? _integralImage;
  set integralImage(bool? val) {
    _integralImage = val;
    _set({"integralImage": val});
  }

  /// If set to `true`, an image with cropped barcode will be returned.
  bool? get returnCroppedBarcode => _returnCroppedBarcode;
  bool? _returnCroppedBarcode;
  set returnCroppedBarcode(bool? val) {
    _returnCroppedBarcode = val;
    _set({"returnCroppedBarcode": val});
  }

  /// If set to `true`, in case required fields are not read, their values
  /// will be empty.
  bool? get checkRequiredTextFields => _checkRequiredTextFields;
  bool? _checkRequiredTextFields;
  set checkRequiredTextFields(bool? val) {
    _checkRequiredTextFields = val;
    _set({"checkRequiredTextFields": val});
  }

  /// If set to `true`, personal information will be removed from logs.
  bool? get depersonalizeLog => _depersonalizeLog;
  bool? _depersonalizeLog;
  set depersonalizeLog(bool? val) {
    _depersonalizeLog = val;
    _set({"depersonalizeLog": val});
  }

  /// When enabled together with [doublePageSpread] and there is a passport
  /// with two pages spread in the image, pages will be cropped, straightened
  /// and aligned together, as if the document was captured on a flatbed scanner.
  bool? get generateDoublePageSpreadImage => _generateDoublePageSpreadImage;
  bool? _generateDoublePageSpreadImage;
  set generateDoublePageSpreadImage(bool? val) {
    _generateDoublePageSpreadImage = val;
    _set({"generateDoublePageSpreadImage": val});
  }

  /// This option can be set to `true` if you know for sure that the image you
  /// provide contains already cropped document by its edges. This was designed
  /// to process on the server side images captured and cropped on mobile.
  bool? get alreadyCropped => _alreadyCropped;
  bool? _alreadyCropped;
  set alreadyCropped(bool? val) {
    _alreadyCropped = val;
    _set({"alreadyCropped": val});
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
    _set({"matchTextFieldMask": val});
  }

  /// When enabled, fail OCR field validity, if there is a glare over the text
  /// ƒfield on the image.
  bool? get updateOCRValidityByGlare => _updateOCRValidityByGlare;
  bool? _updateOCRValidityByGlare;
  set updateOCRValidityByGlare(bool? val) {
    _updateOCRValidityByGlare = val;
    _set({"updateOCRValidityByGlare": val});
  }

  /// When enabled no graphic fields will be cropped from document image.
  bool? get noGraphics => _noGraphics;
  bool? _noGraphics;
  set noGraphics(bool? val) {
    _noGraphics = val;
    _set({"noGraphics": val});
  }

  /// This option allows locating and cropping multiple documents
  /// from one image if enabled.
  bool? get multiDocOnImage => _multiDocOnImage;
  bool? _multiDocOnImage;
  set multiDocOnImage(bool? val) {
    _multiDocOnImage = val;
    _set({"multiDocOnImage": val});
  }

  /// This option can be set to `true` to make sure that in series processing
  /// MRZ is located fully inside the result document image, if present
  /// on the document. Enabling this option may add extra processing time,
  /// by disabling optimizations, but allows more stability in output image quality.
  bool? get forceReadMrzBeforeLocate => _forceReadMrzBeforeLocate;
  bool? _forceReadMrzBeforeLocate;
  set forceReadMrzBeforeLocate(bool? val) {
    _forceReadMrzBeforeLocate = val;
    _set({"forceReadMrzBeforeLocate": val});
  }

  /// When set to `false`, the Barcode code parsing will be skipped
  /// and the raw information from the code will be returned instead.
  bool? get parseBarcodes => _parseBarcodes;
  bool? _parseBarcodes;
  set parseBarcodes(bool? val) {
    _parseBarcodes = val;
    _set({"parseBarcodes": val});
  }

  /// When set to `true`, the `rawResults` property of the [Results]
  /// will contain the encrypted containers of scanning results
  /// that may be used for later reprocessing.
  bool? get shouldReturnPackageForReprocess => _shouldReturnPackageForReprocess;
  bool? _shouldReturnPackageForReprocess;
  set shouldReturnPackageForReprocess(bool? val) {
    _shouldReturnPackageForReprocess = val;
    _set({"shouldReturnPackageForReprocess": val});
  }

  /// When enabled, OCR of perforated fields in the document template
  /// will not be performed.
  bool? get disablePerforationOCR => _disablePerforationOCR;
  bool? _disablePerforationOCR;
  set disablePerforationOCR(bool? val) {
    _disablePerforationOCR = val;
    _set({"disablePerforationOCR": val});
  }

  /// When enabled, image quality checks status affects document optical
  /// and overall status.
  bool? get respectImageQuality => _respectImageQuality;
  bool? _respectImageQuality;
  set respectImageQuality(bool? val) {
    _respectImageQuality = val;
    _set({"respectImageQuality": val});
  }

  /// When enabled, the Surname and GivenNames field ([TextField])
  /// will be divided into fields with fieldTypes [FieldType.FIRST_NAME],
  /// [FieldType.SECOND_NAME], [FieldType.THIRD_NAME], [FieldType.LAST_NAME].
  bool? get splitNames => _splitNames;
  bool? _splitNames;
  set splitNames(bool? val) {
    _splitNames = val;
    _set({"splitNames": val});
  }

  /// Use this property to set up the Face API integration.
  bool? get useFaceApi => _useFaceApi;
  bool? _useFaceApi;
  set useFaceApi(bool? val) {
    _useFaceApi = val;
    _set({"useFaceApi": val});
  }

  /// This parameter is used to enable document authenticity check.
  bool? get useAuthenticityCheck => _useAuthenticityCheck;
  bool? _useAuthenticityCheck;
  set useAuthenticityCheck(bool? val) {
    _useAuthenticityCheck = val;
    _set({"useAuthenticityCheck": val});
  }

  @Deprecated("Use `authenticityParams.checkLiveness` instead.")
  bool? get checkHologram => _checkHologram;
  bool? _checkHologram;
  @Deprecated("Use `authenticityParams.checkLiveness` instead.")
  set checkHologram(bool? val) {
    _checkHologram = val;
    _set({"checkHologram": val});
  }

  /// This parameter is used to generate numeric representation for issuing state and nationality codes.
  bool? get generateNumericCodes => _generateNumericCodes;
  bool? _generateNumericCodes;
  set generateNumericCodes(bool? val) {
    _generateNumericCodes = val;
    _set({"generateNumericCodes": val});
  }

  /// There are documents that contain barcodes which data can be parsed only
  /// if document type verification is performed. The following property allows
  /// setting the barcode parser type which should be used during recognition.
  /// It allows parsing barcode data without performing document type verification.
  int? get barcodeParserType => _barcodeParserType;
  int? _barcodeParserType;
  set barcodeParserType(int? val) {
    _barcodeParserType = val;
    _set({"barcodeParserType": val});
  }

  /// Allows you to set the maximum value of the deviation of the corners
  /// of the document from the value of `90` degrees.
  int? get perspectiveAngle => _perspectiveAngle;
  int? _perspectiveAngle;
  set perspectiveAngle(int? val) {
    _perspectiveAngle = val;
    _set({"perspectiveAngle": val});
  }

  /// Allows you to set the minimum acceptable DPI value of the camera frame
  /// that is passed for recognition. Camera frames the DPI of which are less
  /// than you set won't be passed for recognition.
  int? get minDPI => _minDPI;
  int? _minDPI;
  set minDPI(int? val) {
    _minDPI = val;
    _set({"minDPI": val});
  }

  /// This option controls maximum resolution in dpi of output images.
  /// Resolution will remain original in case `0` is set.
  int? get imageDpiOutMax => _imageDpiOutMax;
  int? _imageDpiOutMax;
  set imageDpiOutMax(int? val) {
    _imageDpiOutMax = val;
    _set({"imageDpiOutMax": val});
  }

  /// Force use of specified document format when locating and recognizing
  /// document to reduce the number of candidates.
  DocFormat? get forceDocFormat => _forceDocFormat;
  DocFormat? _forceDocFormat;
  set forceDocFormat(DocFormat? val) {
    _forceDocFormat = val;
    _set({"forceDocFormat": val?.value});
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
    _set({"shiftExpiryDate": val});
  }

  /// This options allows specifying the minimal age in years of the document
  /// holder for the document to be considered valid.
  int? get minimalHolderAge => _minimalHolderAge;
  int? _minimalHolderAge;
  set minimalHolderAge(int? val) {
    _minimalHolderAge = val;
    _set({"minimalHolderAge": val});
  }

  /// Maximum height of output images. In pixels.
  int? get imageOutputMaxHeight => _imageOutputMaxHeight;
  int? _imageOutputMaxHeight;
  set imageOutputMaxHeight(int? val) {
    _imageOutputMaxHeight = val;
    _set({"imageOutputMaxHeight": val});
  }

  /// Maximum width of output images. In pixels.
  int? get imageOutputMaxWidth => _imageOutputMaxWidth;
  int? _imageOutputMaxWidth;
  set imageOutputMaxWidth(int? val) {
    _imageOutputMaxWidth = val;
    _set({"imageOutputMaxWidth": val});
  }

  /// Accepts sum of [Authenticity] values.
  int? get processAuth => _processAuth;
  int? _processAuth;
  set processAuth(int? val) {
    _processAuth = val;
    _set({"processAuth": val});
  }

  /// This option allows output text case transformation.
  /// No changes applied by default to original values.
  int? get convertCase => _convertCase;
  int? _convertCase;
  set convertCase(int? val) {
    _convertCase = val;
    _set({"convertCase": val});
  }

  /// Sets the level of logs detalization when used together with [logs] parameter.
  LogLevel? get logLevel => _logLevel;
  LogLevel? _logLevel;
  set logLevel(LogLevel? val) {
    _logLevel = val;
    _set({"logLevel": val?.value});
  }

  /// Make better MRZ detection on complex noisy backgrounds, like BW photocopy of some documents.
  /// Works only in the single-frame processing.
  MrzDetectionModes? get mrzDetectMode => _mrzDetectMode;
  MrzDetectionModes? _mrzDetectMode;
  set mrzDetectMode(MrzDetectionModes? val) {
    _mrzDetectMode = val;
    _set({"mrzDetectMode": val?.value});
  }

  /// Measure system of fields' values that are presented in results.
  /// Default: If the country code is `US` or `LR` or `MM`, the
  /// [MeasureSystem.IMPERIAL] system of measurement, otherwise, the [MeasureSystem.METRIC].
  MeasureSystem? get measureSystem => _measureSystem;
  MeasureSystem? _measureSystem;
  set measureSystem(MeasureSystem? val) {
    _measureSystem = val;
    _set({"measureSystem": val?.value});
  }

  /// Force use of specific template ID and skip document type identification step.
  int? get forceDocID => _forceDocID;
  int? _forceDocID;
  set forceDocID(int? val) {
    _forceDocID = val;
    _set({"forceDocID": val});
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
    _set({"dateFormat": val});
  }

  /// Documents processing scenario.
  Scenario? get scenario => _scenario;
  Scenario? _scenario;
  set scenario(Scenario? val) {
    _scenario = val;
    _set({"scenario": val?.value});
  }

  /// Documents processing scenario for the Capture button.
  Scenario? get captureButtonScenario => _captureButtonScenario;
  Scenario? _captureButtonScenario;
  set captureButtonScenario(Scenario? val) {
    _captureButtonScenario = val;
    _set({"captureButtonScenario": val?.value});
  }

  /// The path to the folder of the current session. Before using this, save logs.
  /// Each new session provides a different path.
  String? get sessionLogFolder => _sessionLogFolder;
  String? _sessionLogFolder;
  set sessionLogFolder(String? val) {
    _sessionLogFolder = val;
    _set({"sessionLogFolder": val});
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the scenario starts.
  /// Setting value to `0` means infinity.
  double? get timeout => _timeout;
  double? _timeout;
  set timeout(double? val) {
    _timeout = val;
    _set({"timeout": val});
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the document is detected.
  /// Setting value to `0` means infinity.
  double? get timeoutFromFirstDetect => _timeoutFromFirstDetect;
  double? _timeoutFromFirstDetect;
  set timeoutFromFirstDetect(double? val) {
    _timeoutFromFirstDetect = val;
    _set({"timeoutFromFirstDetect": val});
  }

  /// Allows you to set the time limit for document recognition (in seconds),
  /// beyond which the recognition does not continue regardless of its result.
  /// The countdown starts from the moment the document type is recognized.
  /// Setting value to `0` means infinity.
  double? get timeoutFromFirstDocType => _timeoutFromFirstDocType;
  double? _timeoutFromFirstDocType;
  set timeoutFromFirstDocType(double? val) {
    _timeoutFromFirstDocType = val;
    _set({"timeoutFromFirstDocType": val});
  }

  /// Specifies minimal area of the image that document should cover to be treated
  /// as candidate when locating. Value should be in range from `0` to `1`,
  /// where `1` is when document should fully cover the image.
  double? get documentAreaMin => _documentAreaMin;
  double? _documentAreaMin;
  set documentAreaMin(double? val) {
    _documentAreaMin = val;
    _set({"documentAreaMin": val});
  }

  /// Start the countdown from the moment the document liveness authenticity check is started (in seconds).
  /// Setting value to `0` means infinity.
  double? get timeoutLiveness => _timeoutLiveness;
  double? _timeoutLiveness;
  set timeoutLiveness(double? val) {
    _timeoutLiveness = val;
    _set({"timeoutLiveness": val});
  }

  /// Takes the list of the document IDs to process.
  /// All documents will be processed if it's empty.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<int>? get documentIDList => _documentIDList;
  List<int>? _documentIDList;
  set documentIDList(List<int>? val) {
    if (val != null) val = List.unmodifiable(val);
    _documentIDList = val;
    _set({"documentIDList": val});
  }

  /// Set types of barcodes that you wish to recognize.
  /// All barcodes will be recognized if it's empty.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<BarcodeType>? get barcodeTypes => _barcodeTypes;
  List<BarcodeType>? _barcodeTypes;
  set barcodeTypes(List<BarcodeType>? val) {
    if (val != null) val = List.unmodifiable(val);
    _barcodeTypes = val;
    _set({"barcodeTypes": val?.map((e) => e.value).toList()});
  }

  /// If you recognize the MRZ of documents, all fields will be extracted.
  /// If you recognize the Visual zone of documents, you can set the list
  /// of field types that you wish to extract, other fields will be skipped
  /// during processing. All fields will be extracted if it is empty.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<FieldType>? get fieldTypesFilter => _fieldTypesFilter;
  List<FieldType>? _fieldTypesFilter;
  set fieldTypesFilter(List<FieldType>? val) {
    if (val != null) val = List.unmodifiable(val);
    _fieldTypesFilter = val;
    _set({"fieldTypesFilter": val?.map((e) => e.value).toList()});
  }

  /// Types of results to return in response.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<ResultType>? get resultTypeOutput => _resultTypeOutput;
  List<ResultType>? _resultTypeOutput;
  set resultTypeOutput(List<ResultType>? val) {
    if (val != null) val = List.unmodifiable(val);
    _resultTypeOutput = val;
    _set({"resultTypeOutput": val?.map((e) => e.value).toList()});
  }

  /// This option allows limiting MRZ formats to be recognized by specifying
  /// them in array.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<MRZFormat>? get mrzFormatsFilter => _mrzFormatsFilter;
  List<MRZFormat>? _mrzFormatsFilter;
  set mrzFormatsFilter(List<MRZFormat>? val) {
    if (val != null) val = List.unmodifiable(val);
    _mrzFormatsFilter = val;
    _set({"mrzFormatsFilter": val?.map((e) => e.value).toList()});
  }

  /// Array of specific eligible document types to recognize from. You may,
  /// for example, specify only passports to be recognized by setting this property.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<DocType>? get documentGroupFilter => _documentGroupFilter;
  List<DocType>? _documentGroupFilter;
  set documentGroupFilter(List<DocType>? val) {
    if (val != null) val = List.unmodifiable(val);
    _documentGroupFilter = val;
    _set({"documentGroupFilter": val?.map((e) => e.value).toList()});
  }

  /// The list of LCID types to ignore during the recognition.
  /// If empty, values with all LCID types will be extracted.
  /// Narrowing down the list can reduce processing time.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<LCID>? get lcidIgnoreFilter => _lcidIgnoreFilter;
  List<LCID>? _lcidIgnoreFilter;
  set lcidIgnoreFilter(List<LCID>? val) {
    if (val != null) val = List.unmodifiable(val);
    _lcidIgnoreFilter = val;
    _set({"lcidIgnoreFilter": val?.map((e) => e.value).toList()});
  }

  /// The whitelist of LCID types to use during the recognition.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<LCID>? get lcidFilter => _lcidFilter;
  List<LCID>? _lcidFilter;
  set lcidFilter(List<LCID>? val) {
    if (val != null) val = List.unmodifiable(val);
    _lcidFilter = val;
    _set({"lcidFilter": val?.map((e) => e.value).toList()});
  }

  /// Controls properties of [ImageQA] checks.
  ImageQA get imageQA => _imageQA;
  ImageQA _imageQA = ImageQA();
  set imageQA(ImageQA val) {
    (_imageQA = val)._apply(this);
  }

  /// Custom RFID params.
  RFIDParams? get rfidParams => _rfidParams;
  RFIDParams? _rfidParams;
  set rfidParams(RFIDParams? val) {
    _rfidParams = val;
    _set({"rfidParams": val?.toJson()});
  }

  /// Custom Face API integration params.
  FaceApiParams? get faceApiParams => _faceApiParams;
  FaceApiParams? _faceApiParams;
  set faceApiParams(FaceApiParams? val) {
    _faceApiParams = val;
    _set({"faceApiParams": val?.toJson()});
  }

  /// Set up the backend processing service parameters.
  BackendProcessingConfig? get backendProcessingConfig =>
      _backendProcessingConfig;
  BackendProcessingConfig? _backendProcessingConfig;
  set backendProcessingConfig(BackendProcessingConfig? val) {
    _backendProcessingConfig = val;
    _set({"backendProcessingConfig": val?.toJson()});
  }

  AuthenticityParams get authenticityParams => _authenticityParams;
  AuthenticityParams _authenticityParams = AuthenticityParams();
  set authenticityParams(AuthenticityParams val) {
    (_authenticityParams = val)._apply(this);
  }

  /// Takes JSON with parameters that are not presented in the DocumentReader.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  Map<String, dynamic>? get customParams => _customParams;
  Map<String, dynamic>? _customParams;
  set customParams(Map<String, dynamic>? val) {
    if (val != null) val = Map.unmodifiable(val);
    _customParams = val;
    _set({"customParams": val});
  }

  /// Allows you to deserialize object.
  static ProcessParams fromJson(jsonObject) {
    var result = ProcessParams();
    result.testSetters = {};

    result.multipageProcessing = jsonObject["multipageProcessing"];
    result.logs = jsonObject["logs"];
    result.debugSaveImages = jsonObject["debugSaveImages"];
    result.debugSaveLogs = jsonObject["debugSaveLogs"];
    result.returnUncroppedImage = jsonObject["returnUncroppedImage"];
    result.uvTorchEnabled = jsonObject["uvTorchEnabled"];
    result.debugSaveCroppedImages = jsonObject["debugSaveCroppedImages"];
    result.disableFocusingCheck = jsonObject["disableFocusingCheck"];
    result.debugSaveRFIDSession = jsonObject["debugSaveRFIDSession"];
    result.doublePageSpread = jsonObject["doublePageSpread"];
    result.manualCrop = jsonObject["manualCrop"];
    result.integralImage = jsonObject["integralImage"];
    result.returnCroppedBarcode = jsonObject["returnCroppedBarcode"];
    result.checkRequiredTextFields = jsonObject["checkRequiredTextFields"];
    result.depersonalizeLog = jsonObject["depersonalizeLog"];
    result.generateDoublePageSpreadImage =
        jsonObject["generateDoublePageSpreadImage"];
    result.alreadyCropped = jsonObject["alreadyCropped"];
    result.matchTextFieldMask = jsonObject["matchTextFieldMask"];
    result.updateOCRValidityByGlare = jsonObject["updateOCRValidityByGlare"];
    result.noGraphics = jsonObject["noGraphics"];
    result.multiDocOnImage = jsonObject["multiDocOnImage"];
    result.forceReadMrzBeforeLocate = jsonObject["forceReadMrzBeforeLocate"];
    result.parseBarcodes = jsonObject["parseBarcodes"];
    result.shouldReturnPackageForReprocess =
        jsonObject["shouldReturnPackageForReprocess"];
    result.disablePerforationOCR = jsonObject["disablePerforationOCR"];
    result.respectImageQuality = jsonObject["respectImageQuality"];
    result.splitNames = jsonObject["splitNames"];
    result.useFaceApi = jsonObject["useFaceApi"];
    result.useAuthenticityCheck = jsonObject["useAuthenticityCheck"];
    // ignore: deprecated_member_use_from_same_package
    result.checkHologram = jsonObject["checkHologram"];
    result.generateNumericCodes = jsonObject["generateNumericCodes"];

    result.measureSystem =
        MeasureSystem.getByValue(jsonObject["measureSystem"]);
    result.barcodeParserType = jsonObject["barcodeParserType"];
    result.perspectiveAngle = jsonObject["perspectiveAngle"];
    result.minDPI = jsonObject["minDPI"];
    result.imageDpiOutMax = jsonObject["imageDpiOutMax"];
    result.forceDocID = jsonObject["forceDocID"];
    result.forceDocFormat = DocFormat.getByValue(jsonObject["forceDocFormat"]);
    result.shiftExpiryDate = jsonObject["shiftExpiryDate"];
    result.minimalHolderAge = jsonObject["minimalHolderAge"];
    result.imageOutputMaxHeight = jsonObject["imageOutputMaxHeight"];
    result.imageOutputMaxWidth = jsonObject["imageOutputMaxWidth"];
    result.processAuth = jsonObject["processAuth"];
    result.convertCase = jsonObject["convertCase"];
    result.logLevel = LogLevel.getByValue(jsonObject["logLevel"]);
    result.mrzDetectMode =
        MrzDetectionModes.getByValue(jsonObject["mrzDetectMode"]);

    result.dateFormat = jsonObject["dateFormat"];
    result.scenario = Scenario.getByValue(jsonObject["scenario"]);
    result.captureButtonScenario =
        Scenario.getByValue(jsonObject["captureButtonScenario"]);
    result.sessionLogFolder = jsonObject["sessionLogFolder"];

    result.timeout = _toDouble(jsonObject["timeout"]);
    result.timeoutFromFirstDetect =
        _toDouble(jsonObject["timeoutFromFirstDetect"]);
    result.timeoutFromFirstDocType =
        _toDouble(jsonObject["timeoutFromFirstDocType"]);
    result.documentAreaMin = _toDouble(jsonObject["documentAreaMin"]);
    result.timeoutLiveness = _toDouble(jsonObject["timeoutLiveness"]);

    result.documentIDList = _intListFrom(jsonObject["documentIDList"]);
    result.barcodeTypes = BarcodeType.fromIntList(jsonObject["barcodeTypes"]);

    result.fieldTypesFilter =
        FieldType.fromIntList(jsonObject["fieldTypesFilter"]);
    result.resultTypeOutput =
        ResultType.fromIntList(jsonObject["resultTypeOutput"]);
    result.mrzFormatsFilter =
        MRZFormat.fromStringList(jsonObject["mrzFormatsFilter"]);
    result.documentGroupFilter =
        DocType.fromIntList(jsonObject["documentGroupFilter"]);
    result.lcidIgnoreFilter = LCID.fromIntList(jsonObject["lcidIgnoreFilter"]);
    result.lcidFilter = LCID.fromIntList(jsonObject["lcidFilter"]);

    result.imageQA = ImageQA.fromJson(jsonObject["imageQA"]);
    result.rfidParams = RFIDParams.fromJson(jsonObject["rfidParams"]);
    result.faceApiParams = FaceApiParams.fromJson(jsonObject["faceApiParams"]);
    result.backendProcessingConfig =
        BackendProcessingConfig.fromJson(jsonObject["backendProcessingConfig"]);
    result.authenticityParams =
        AuthenticityParams.fromJson(jsonObject["authenticityParams"]);

    result.customParams = jsonObject["customParams"];

    return result;
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
        "checkRequiredTextFields": checkRequiredTextFields,
        "depersonalizeLog": depersonalizeLog,
        "generateDoublePageSpreadImage": generateDoublePageSpreadImage,
        "alreadyCropped": alreadyCropped,
        "matchTextFieldMask": matchTextFieldMask,
        "updateOCRValidityByGlare": updateOCRValidityByGlare,
        "noGraphics": noGraphics,
        "multiDocOnImage": multiDocOnImage,
        "forceReadMrzBeforeLocate": forceReadMrzBeforeLocate,
        "parseBarcodes": parseBarcodes,
        "shouldReturnPackageForReprocess": shouldReturnPackageForReprocess,
        "disablePerforationOCR": disablePerforationOCR,
        "respectImageQuality": respectImageQuality,
        "splitNames": splitNames,
        "useFaceApi": useFaceApi,
        "useAuthenticityCheck": useAuthenticityCheck,
        // ignore: deprecated_member_use_from_same_package
        "checkHologram": checkHologram,
        "generateNumericCodes": generateNumericCodes,
        "measureSystem": measureSystem?.value,
        "barcodeParserType": barcodeParserType,
        "perspectiveAngle": perspectiveAngle,
        "minDPI": minDPI,
        "imageDpiOutMax": imageDpiOutMax,
        "forceDocID": forceDocID,
        "forceDocFormat": forceDocFormat?.value,
        "shiftExpiryDate": shiftExpiryDate,
        "minimalHolderAge": minimalHolderAge,
        "imageOutputMaxHeight": imageOutputMaxHeight,
        "imageOutputMaxWidth": imageOutputMaxWidth,
        "processAuth": processAuth,
        "convertCase": convertCase,
        "logLevel": logLevel?.value,
        "mrzDetectMode": mrzDetectMode?.value,
        "dateFormat": dateFormat,
        "scenario": scenario?.value,
        "captureButtonScenario": captureButtonScenario?.value,
        "sessionLogFolder": sessionLogFolder,
        "timeout": timeout,
        "timeoutFromFirstDetect": timeoutFromFirstDetect,
        "timeoutFromFirstDocType": timeoutFromFirstDocType,
        "documentAreaMin": documentAreaMin,
        "timeoutLiveness": timeoutLiveness,
        "documentIDList": documentIDList,
        "barcodeTypes": barcodeTypes?.map((e) => e.value).toList(),
        "fieldTypesFilter": fieldTypesFilter?.map((e) => e.value).toList(),
        "resultTypeOutput": resultTypeOutput?.map((e) => e.value).toList(),
        "mrzFormatsFilter": mrzFormatsFilter?.map((e) => e.value).toList(),
        "documentGroupFilter":
            documentGroupFilter?.map((e) => e.value).toList(),
        "lcidIgnoreFilter": lcidIgnoreFilter?.map((e) => e.value).toList(),
        "lcidFilter": lcidFilter?.map((e) => e.value).toList(),
        "imageQA": imageQA.toJson(),
        "rfidParams": rfidParams?.toJson(),
        "faceApiParams": faceApiParams?.toJson(),
        "backendProcessingConfig": backendProcessingConfig?.toJson(),
        "authenticityParams": authenticityParams.toJson(),
        "customParams": customParams,
      }.clearNulls();

  void _set(Map<String, dynamic> json) {
    if (identical(this, DocumentReader.instance.processParams)) {
      _bridge.invokeMethod("setProcessParams", [json]);
    }
    testSetters.addAll(json);
  }

  void _apply() => _set(toJson());

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
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

  static List<MRZFormat>? fromStringList(List<dynamic>? input) {
    if (input == null) return null;
    List<MRZFormat> list = [];
    for (String item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}

enum LogLevel {
  /// Fatal error.
  FatalError("FatalError"),

  /// Error.
  Error("Error"),

  /// Warning.
  Warning("Warning"),

  /// Info.
  Info("Info"),

  /// Debug.
  Debug("Debug");

  const LogLevel(this.value);
  final String value;

  static LogLevel? getByValue(String? i) {
    if (i == null) return null;
    try {
      return LogLevel.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return null;
    }
  }
}

/// Enumeration contains the types of barcodes that can be processed.
enum MrzDetectionModes {
  DEFAULT(0),
  RESIZE_BINARIZE_WINDOW(1),
  BLUR_BEFORE_BINARIZATION(2);

  const MrzDetectionModes(this.value);
  final int value;

  static MrzDetectionModes? getByValue(int? i) {
    if (i == null) return null;
    return MrzDetectionModes.values.firstWhere((x) => x.value == i);
  }
}
