//
//  document_reader.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

/// Regula Document Reader SDK
library document_reader;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'src/internal/Utils.dart';
part 'src/internal/Bridge.dart';
part 'src/internal/EventChannels.dart';

part 'src/params/process_params/ProcessParam.dart';
part 'src/params/process_params/ImageQA.dart';
part 'src/params/process_params/GlaresCheckParams.dart';
part 'src/params/process_params/FaceApiSearchParams.dart';
part 'src/params/process_params/FaceApiParams.dart';
part 'src/params/process_params/RFIDParams.dart';
part 'src/params/rfid_scenario/RfidScenario.dart';
part 'src/params/rfid_scenario/ReprocParams.dart';
part 'src/params/rfid_scenario/EDLDataGroups.dart';
part 'src/params/rfid_scenario/EIDDataGroups.dart';
part 'src/params/rfid_scenario/EPassportDataGroups.dart';
part 'src/params/Customization.dart';
part 'src/params/Functionality.dart';

part 'src/rfid/RFIDNotification.dart';
part 'src/rfid/PKDCertificate.dart';
part 'src/rfid/TccParams.dart';
part 'src/rfid/PAAttribute.dart';
part 'src/rfid/PAResourcesIssuer.dart';
part 'src/rfid/TAChallenge.dart';
part 'src/rfid/RFIDErrorCodes.dart';

part 'src/config/InitConfig.dart';
part 'src/config/ScannerConfig.dart';
part 'src/config/RecognizeConfig.dart';
part 'src/config/OnlineProcessingConfig.dart';
part 'src/config/RFIDConfig.dart';

part 'src/info/DocReaderException.dart';
part 'src/info/RFIDException.dart';
part 'src/info/License.dart';
part 'src/info/DocReaderScenario.dart';
part 'src/info/DocReaderVersion.dart';
part 'src/info/DocumentsDatabase.dart';

part 'src/results/authenticity/AuthenticityCheck.dart';
part 'src/results/authenticity/AuthenticityElement.dart';
part 'src/results/authenticity/AuthenticityResult.dart';
part 'src/results/authenticity/Authenticity.dart';
part 'src/results/authenticity/CheckDiagnose.dart';
part 'src/results/authenticity/SecurityFeatureType.dart';

part 'src/results/barcode/BarcodeField.dart';
part 'src/results/barcode/BarcodeResult.dart';
part 'src/results/barcode/PDF417Info.dart';
part 'src/results/barcode/BarcodeStatus.dart';
part 'src/results/barcode/BarcodeType.dart';

part 'src/results/image_quality/ImageQuality.dart';
part 'src/results/image_quality/ImageQualityGroup.dart';
part 'src/results/image_quality/ImageQualityCheckType.dart';

part 'src/results/rfid/AccessControlProcedureType.dart';
part 'src/results/rfid/Application.dart';
part 'src/results/rfid/Attribute.dart';
part 'src/results/rfid/Authority.dart';
part 'src/results/rfid/CardProperties.dart';
part 'src/results/rfid/CertificateChain.dart';
part 'src/results/rfid/CertificateData.dart';
part 'src/results/rfid/Extension.dart';
part 'src/results/rfid/File.dart';
part 'src/results/rfid/FileData.dart';
part 'src/results/rfid/RFIDSessionData.dart';
part 'src/results/rfid/SecurityObject.dart';
part 'src/results/rfid/SecurityObjectCertificates.dart';
part 'src/results/rfid/SignerInfo.dart';
part 'src/results/rfid/RFIDValidity.dart';
part 'src/results/rfid/RFIDValue.dart';
part 'src/results/rfid/DataField.dart';
part 'src/results/rfid/RFIDDataFileType.dart';
part 'src/results/rfid/RFIDAccessControlProcedureType.dart';
part 'src/results/rfid/RFIDCertificateType.dart';

part 'src/results/status/OpticalStatus.dart';
part 'src/results/status/RFIDStatus.dart';
part 'src/results/status/ResultsStatus.dart';
part 'src/results/status/CheckResult.dart';

part 'src/results/visible_digital_seals/VDSNCData.dart';
part 'src/results/visible_digital_seals/BytesData.dart';
part 'src/results/visible_digital_seals/LDSParsingErrorCodes.dart';
part 'src/results/visible_digital_seals/LDSParsingNotificationCodes.dart';

part 'src/results/visual_results/Comparison.dart';
part 'src/results/visual_results/GraphicField.dart';
part 'src/results/visual_results/GraphicResult.dart';
part 'src/results/visual_results/RFIDOrigin.dart';
part 'src/results/visual_results/Symbol.dart';
part 'src/results/visual_results/TextField.dart';
part 'src/results/visual_results/TextResult.dart';
part 'src/results/visual_results/TextSource.dart';
part 'src/results/visual_results/Validity.dart';
part 'src/results/visual_results/Value.dart';
part 'src/results/visual_results/Rect.dart';
part 'src/results/visual_results/Lights.dart';
part 'src/results/visual_results/GraphicFieldType.dart';
part 'src/results/visual_results/VisualFieldType.dart';
part 'src/results/visual_results/LCID.dart';

part 'src/results/Results.dart';
part 'src/results/ElementPosition.dart';
part 'src/results/DocumentType.dart';

/// Entry point of the Regula DocumentReader SDK.
class DocumentReader {
  DocumentReader._privateConstructor();

  /// The only instanse of singleton class [DocumentReader].
  static DocumentReader get instance => _instance;
  static final DocumentReader _instance = DocumentReader._privateConstructor();

  /// A list of scenarios that can be used for documents recognition based on
  /// your license and Core framework capabilities.
  List<DocReaderScenario> get availableScenarios => _availableScenarios;
  List<DocReaderScenario> _availableScenarios = [];

  /// Information about the SDK.
  DocReaderVersion? get version => _version;
  late final DocReaderVersion? _version;

  /// Information about your license.
  License get license => _license;
  License _license = new License();

  /// Allows you to check if RFID chip reading can be performed based on your
  /// license and Core framework capabilities.
  bool get isRFIDAvailableForUse => _isRFIDAvailableForUse;
  bool _isRFIDAvailableForUse = false;

  /// Allows you to get a status of the RFID chip reading process.
  ///
  /// IOS only.
  String? get rfidSessionStatus {
    if (!Platform.isIOS)
      throw PlatformException(
        code: "ios-only",
        message: "rfidSessionStatus is accessible only on iOS",
      );
    return _rfidSessionStatus;
  }

  String? _rfidSessionStatus;
  set rfidSessionStatus(String? val) {
    if (!Platform.isIOS)
      throw PlatformException(
        code: "ios-only",
        message: "rfidSessionStatus is accessible only on iOS",
      );
    _rfidSessionStatus = val;
    _setRfidSessionStatus(val);
  }

  /// Current Session identifier.
  String? get tag => _tag;
  String? _tag;
  set tag(String? val) {
    _tag = val;
    _setTag(val);
  }

  /// A localization dictionary to override default localization logic.
  /// Allows to replace any string of DocumentReader SDK with an arbitrary string.
  ///
  /// To see all the localization keys, look up the `RegulaSDK.strings` file at
  /// `ios/Pods/DocumentReader/DocumentReader.xcframework/ios-arm64/DocumentReader.framework/en.lproj/RegulaSDK.strings`.
  Map<String, String>? get localizationDictionary => _localizationDictionary;
  Map<String, String>? _localizationDictionary;
  set localizationDictionary(Map<String, String>? val) {
    _localizationDictionary = val;
    _setLocalizationDictionary(val);
  }

  /// Params that influence the scanning process, camera view controller
  /// customization and etc.
  Functionality get functionality => _functionality;
  Functionality _functionality = new Functionality();
  set functionality(Functionality val) {
    _functionality = val;
    _functionality._apply();
  }

  /// Params that influence the scanning process.
  ProcessParam get processParams => _processParams;
  ProcessParam _processParams = new ProcessParam();
  set processParams(ProcessParam val) {
    _processParams = val;
    _processParams._apply();
  }

  /// Params that relate to the camera view controller customization and etc.
  Customization get customization => _customization;
  Customization _customization = new Customization();
  set customization(Customization val) {
    _customization = val;
    _customization._apply();
  }

  /// Params that influence the RFID chip processing.
  RFIDScenario get rfidScenario => _rfidScenario;
  RFIDScenario _rfidScenario = new RFIDScenario();
  set rfidScenario(RFIDScenario val) {
    _rfidScenario = val;
    _rfidScenario._apply();
  }

  /// Allows you to check if Document Reader is ready for use.
  Future<bool> get isReady async {
    return await _bridge.invokeMethod("getDocumentReaderIsReady", []);
  }

  /// Allows you to get a status of Document Reader.
  Future<String> get status async {
    return await _bridge.invokeMethod("getDocumentReaderStatus", []);
  }

  /// Allows you to check if you can use external Regula Bluetooth devices based
  /// on your license and Core framework capabilities.
  ///
  /// Android only.
  Future<bool> get isAuthenticatorAvailableForUse async {
    return await _bridge.invokeMethod("isAuthenticatorAvailableForUse", []);
  }

  /// Checks if the app has all the required bluetooth permissions.
  ///
  /// Android only.
  Future<bool> get isBlePermissionsGranted async {
    if (!Platform.isAndroid)
      throw PlatformException(
        code: "android-only",
        message: "isBlePermissionsGranted is accessible only on Android",
      );
    return await _bridge.invokeMethod("isBlePermissionsGranted", []);
  }

  /// Use this method to reset all parameters to their default values.
  resetConfiguration() {
    _bridge.invokeMethod("resetConfiguration", []);
    _functionality = Functionality();
    _processParams = ProcessParam();
    _customization = Customization();
    _rfidScenario = RFIDScenario();
  }

  // Set click listener for buttons from the UI customization layer.
  set onCustomButtonTapped(CustomButtonTappedCompletion completion) =>
      _setCustomButtonTappedCompletion(completion);

  /// Allows user to receive a video file of current session
  set videoEncoderCompletion(VideoEncoderCompletion completion) =>
      _setVideoEncoderCompletion(completion);

  /// Allows you to initialize Document Reader.
  ///
  /// [config] A configuration file for DocumentReader initialization.
  ///
  /// [successCompletion] The block to execute after the initialization finishes.
  ///
  /// Note: for convinience function returns `Future<bool>`.
  /// This is the same `bool` that is returned by [SuccessCompletion], indicating
  /// whether the function has succeeded or not. If you don't need to handle
  /// an error, you can leave [successCompletion] as `null` and only use the
  /// return value of the function.
  Future<bool> initializeReader(
    InitConfig config,
    SuccessCompletion? successCompletion,
  ) async {
    var funcName = "initializeReader";
    if (config.license == null)
      funcName = "initializeReaderWithBleDeviceConfig";

    bool success = _successCompletionFromJson(
      await _bridge.invokeMethod(funcName, [config.toJson()]),
      successCompletion,
    );

    await _onInit(success);

    return success;
  }

  /// Used to connect to the ble device.
  ///
  /// Android only.
  startBluetoothService(
    BluetoothServiceCompletion completion,
  ) async {
    if (!Platform.isAndroid)
      throw PlatformException(
        code: "android-only",
        message: "startBluetoothService is accessible only on Android",
      );
    _setBluetoothServiceCompletion(completion);
    _bridge.invokeMethod("startBluetoothService", []);
  }

  /// Used to deinitialize Document Reader and free up RAM as a
  /// consequence of this.
  Future<void> deinitializeReader() async {
    await _bridge.invokeMethod("deinitializeReader", []);
  }

  /// Allows you to download a database from the Regula server. If it exists
  /// in your app and compatible with the SDK, it won't be downloaded.
  ///
  /// [databaseID] An identifier of the database.
  ///
  /// [prepareCompletion] A callback that returns downloading progress.
  ///
  /// [successCompletion] The block to execute after the download finishes.
  ///
  /// Note: for convinience function returns `Future<bool>`.
  /// This is the same `bool` that is returned by [SuccessCompletion], indicating
  /// whether the function has succeeded or not. If you don't need to handle
  /// an error, you can leave [successCompletion] as `null` and only use the
  /// return value of the function.
  Future<bool> prepareDatabase(
    String databaseID,
    DocumentReaderPrepareCompletion prepareCompletion,
    SuccessCompletion? successCompletion,
  ) async {
    _setDocumentReaderPrepareCompletion(prepareCompletion);
    return _successCompletionFromJson(
      await _bridge.invokeMethod("prepareDatabase", [databaseID]),
      successCompletion,
    );
  }

  /// Allows you to download a database from the Regula server.
  /// Each new update of the database will be downloaded.
  ///
  /// [databaseID] An identifier of the database.
  ///
  /// [prepareCompletion] A callback that returns downloading progress.
  ///
  /// [successCompletion] The block to execute after the download finishes.
  ///
  /// Note: for convinience function returns `Future<bool>`.
  /// This is the same `bool` that is returned by [SuccessCompletion], indicating
  /// whether the function has succeeded or not. If you don't need to handle
  /// an error, you can leave [successCompletion] as `null` and only use the
  /// return value of the function.
  Future<bool> runAutoUpdate(
    String databaseID,
    DocumentReaderPrepareCompletion prepareCompletion,
    SuccessCompletion? successCompletion,
  ) async {
    _setDocumentReaderPrepareCompletion(prepareCompletion);
    return _successCompletionFromJson(
      await _bridge.invokeMethod("runAutoUpdate", [databaseID]),
      successCompletion,
    );
  }

  /// Allows you to to check database update.
  ///
  /// [databaseID] An identifier of the database.
  Future<DocumentsDatabase?> checkDatabaseUpdate(
    String databaseID,
  ) async {
    String? response = await _bridge.invokeMethod(
      "checkDatabaseUpdate",
      [databaseID],
    );
    return DocumentsDatabase.fromJson(_decode(response));
  }

  /// Allows you to cancel the database update.
  Future<bool> cancelDBUpdate() async {
    return await _bridge.invokeMethod("cancelDBUpdate", []);
  }

  /// Allows you to remove the database from your app.
  Future<bool> removeDatabase() async {
    return await _bridge.invokeMethod("removeDatabase", []);
  }

  /// Used to start the processing of the next page of the document once the
  /// current one is processed.
  Future<void> startNewPage() async {
    await _bridge.invokeMethod("startNewPage", []);
  }

  /// Used to start a scanning process.
  Future<void> startNewSession() async {
    await _bridge.invokeMethod("startNewSession", []);
  }

  /// Used for multiple frames processing which are captured from the camera.
  ///
  /// [config] Scanning configuration.
  ///
  /// [completion] The block to execute after the recognition process finishes.
  scan(ScannerConfig config, DocumentReaderCompletion completion) {
    _setDocumentReaderCompletion(completion);
    _bridge.invokeMethod("scan", [config.toJson()]);
  }

  /// Used for proccessing predefined images.
  ///
  /// [config] Scanning configuration.
  ///
  /// [completion] The block to execute after the recognition process finishes.
  recognize(RecognizeConfig config, DocumentReaderCompletion completion) {
    _setDocumentReaderCompletion(completion);
    _bridge.invokeMethod("recognize", [config.toJson()]);
  }

  /// Used for the RFID chip processing.
  ///
  /// [config] Chip reading configuration.
  rfid(RFIDConfig config) {
    config._disableUI
        ? _setRFIDCompletion(config._rfidCompletion!)
        : _setDocumentReaderCompletion(config._completion!);

    _setRFIDProgressCompletion(config.onProgress);
    _setChipDetectedCompletion(config.onChipDetected);
    _setRetryReadChipCompletion(config.onRetryReadChip);

    _setPaCertificateCompletion(config.onRequestPACertificates);
    _setTaCertificateCompletion(config.onRequestTACertificates);
    _setTaSignatureCompletion(config.onRequestTASignature);

    var requestType = 0;
    if (config.onRequestPACertificates != null)
      requestType = 2;
    else if (config.onRequestTACertificates != null ||
        config.onRequestTASignature != null) requestType = 1;

    // Currently(in 6.9) in iOS onChipDetected and onRetryReadChip
    // are parts of RGLDocReaderRFIDDelegate.
    // Waiting for iOS rfid rework in 6.10
    if (Platform.isIOS &&
        requestType == 0 &&
        (config.onChipDetected != null || config.onRetryReadChip != null))
      requestType = 1;

    var nativeFunction = config._disableUI ? "readRFID" : "startRFIDReader";

    _bridge.invokeMethod(nativeFunction, [requestType]);
  }

  /// Used to stop the scanning process.
  Future<void> stopScanner() async {
    await _bridge.invokeMethod("stopScanner", []);
  }

  /// Used to stop the scanning process.
  Future<void> stopRFIDReader() async {
    await _bridge.invokeMethod("stopRFIDReader", []);
  }

  /// Used to pass certificates to Document Reader that will be used during the
  /// RFID chip processing.
  ///
  /// [certificates] PKD certificates.
  Future<void> addPKDCertificates(List<PKDCertificate> certificates) async {
    List<dynamic> json = [];
    for (PKDCertificate cert in certificates) {
      json.add(cert.toJson());
    }
    await _bridge.invokeMethod("addPKDCertificates", [json]);
  }

  /// It's used to remove certificates from your app that are used during the
  /// RFID chip processing.
  Future<void> clearPKDCertificates() async {
    await _bridge.invokeMethod("clearPKDCertificates", []);
  }

  /// Bool 'success' is not only passed to [SuccessCompletion],
  /// but for convenience it is also returned as [Future]
  ///
  ///
  /// Sets the given `TCCParams` to the RFID  session.
  /// The parameters are required to be set before starting RFID session.
  ///
  /// [params] TCC related parameters.
  ///
  /// [successCompletion] Completion block of the operation.
  ///
  /// Note: for convinience function returns `Future<bool>`.
  /// This is the same `bool` that is returned by [SuccessCompletion], indicating
  /// whether the function has succeeded or not. If you don't need to handle
  /// an error, you can leave [successCompletion] as `null` and only use the
  /// return value of the function.
  Future<bool> setTCCParams(
    TccParams params,
    SuccessCompletion? successCompletion,
  ) async {
    return _successCompletionFromJson(
      await _bridge.invokeMethod("setTCCParams", [params.toJson()]),
      successCompletion,
    );
  }

  bool _successCompletionFromJson(
      String jsonString, SuccessCompletion? completion) {
    var jsonObject = json.decode(jsonString);
    var success = jsonObject["success"];
    var error = DocReaderException.fromJson(jsonObject["error"]);

    completion?.call(success, error);
    return success;
  }

  _onInit(bool success) async {
    _version = await _getDocReaderVersion();
    _availableScenarios = await _getAvailableScenarios();
    _license = await _getLicense();
    _isRFIDAvailableForUse = await _getIsRFIDAvailableForUse();
    _tag = await _getTag();
    if (Platform.isIOS) _rfidSessionStatus = await _getRfidSessionStatus();
    await _functionality._sync();
    await _processParams._sync();
    await _customization._sync();
    await _rfidScenario._sync();
  }

  Future<License> _getLicense() async {
    String? response = await _bridge.invokeMethod("getLicense", []);
    return License.fromJson(_decode(response))!;
  }

  Future<List<DocReaderScenario>> _getAvailableScenarios() async {
    String response = await _bridge.invokeMethod("getAvailableScenarios", []);
    List<DocReaderScenario> scenarios = [];
    for (var s in json.decode(response)) {
      scenarios.add(DocReaderScenario.fromJson(s)!);
    }
    return scenarios;
  }

  Future<bool> _getIsRFIDAvailableForUse() async {
    return await _bridge.invokeMethod("getIsRFIDAvailableForUse", []);
  }

  Future<DocReaderVersion?> _getDocReaderVersion() async {
    String? response = await _bridge.invokeMethod("getDocReaderVersion", []);
    return DocReaderVersion.fromJson(_decode(response));
  }

  Future<String?> _getRfidSessionStatus() async {
    return await _bridge.invokeMethod("getRfidSessionStatus", []);
  }

  _setRfidSessionStatus(String? status) {
    _bridge.invokeMethod("setRfidSessionStatus", [status]);
  }

  Future<String?> _getTag() async {
    return await _bridge.invokeMethod("getTag", []);
  }

  _setTag(String? tag) {
    _bridge.invokeMethod("setTag", [tag]);
  }

  _setLocalizationDictionary(Map<String, String>? dictionary) async {
    await _bridge.invokeMethod("setLocalizationDictionary", [dictionary]);
  }
}

/// Callback for receiving answer from any function
/// which does not return anything, but we need to know whether the function
/// has succeeded or not.
///
/// [success] Indicates success status.
///
/// [error] in case success status is `false` - brief message for developer,
/// `null` otherwise.
typedef SuccessCompletion = void Function(
  bool success,
  DocReaderException? error,
);

/// Callback for receiving answer from processing engine.
///
/// [action] defines current processing status.
///
/// [results] defines current processing results.
///
/// [error] in case of anything is wrong - brief message for developer, `null` otherwise.
typedef DocumentReaderCompletion = void Function(
  DocReaderAction action,
  Results? results,
  DocReaderException? error,
);

/// Callback for receiving notifications on
/// Documents Database preparation.
///
/// [progress] current % value of progress.
typedef DocumentReaderPrepareCompletion = void Function(int progress);

/// Keeps user notified about btDevice`s connection state.
/// Used in [DocumentReader.startBluetoothService]
///
/// [onServiceConnected] fires when android`s bluetooth service is initialized.
///
/// [onServiceDisconnected] fires when android`s bluetooth service is destroyed.
///
/// [onDeviceReady] fires when a bluetooth device is connected and ready to use.
/// [DocumentReader.initializeReaderWithBleDeviceConfig] should be run here.
///
/// Android only.
abstract class BluetoothServiceCompletion {
  void onServiceConnected(bool isBleManagerConnected);

  void onServiceDisconnected();

  void onDeviceReady();
}

/// Callback for receiving signal, when a custom button,
/// configured in [Customization.uiCustomizationLayer], is pressed.
///
/// [tag] button id, indication which button was pressed.
typedef CustomButtonTappedCompletion = void Function(int tag);

/// Callback that allows user to receive a video file of current session.
/// Called by DocumentReader when recording process finished.
///
/// [filePath] The output file URL. Contains URL to recording output for every scanning session.
typedef VideoEncoderCompletion = void Function(
  String filePath,
);

/// Contains all possible DocumentReaderNotification callback codes
enum DocReaderAction {
  /// Processing finished, the results were received
  COMPLETE(0),

  /// Processing didn't finish, intermediate results may be obtained
  PROCESS(1),

  /// Processing of a page is completed, the next one can be processed
  MORE_PAGES_AVAILABLE(2),

  /// Processing was cancelled, incomplete results may be obtained
  CANCEL(3),

  /// An error occurred during processing, incomplete results may be obtained
  ERROR(4),

  /// Processing of a hologram is started
  PROCESS_WHITE_FLASHLIGHT(5),

  /// Processing is finished by timeout, intermediate results can be received. Processing finishes due to non-compliance with the image quality requirements
  TIMEOUT(6),

  /// Online processing is started
  PROCESSING_ON_SERVICE(7),

  /// Processing didn't finish, intermediate results may be obtained, UV images may be obtained
  PROCESS_WHITE_UV_IMAGES(102),

  /// Processing didn't finish, intermediate results may be obtained, IR images may be obtained
  PROCESS_IR_FRAME(103);

  const DocReaderAction(this.value);
  final int value;

  static DocReaderAction? getByValue(int? i) {
    if (i == null) return null;
    return DocReaderAction.values.firstWhere((x) => x.value == i);
  }

  bool finished() => this == COMPLETE || this == TIMEOUT;

  bool interrupted() => this == CANCEL || this == ERROR;

  bool stopped() => finished() || interrupted();
}
