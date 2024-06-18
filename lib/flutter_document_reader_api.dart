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
import 'package:flutter/widgets.dart';

part 'src/internal/utils.dart';
part 'src/internal/bridge.dart';
part 'src/internal/event_channels.dart';

part 'src/params/process_params/process_params.dart';
part 'src/params/process_params/image_qa.dart';
part 'src/params/process_params/glares_check_params.dart';
part 'src/params/process_params/face_api_search_params.dart';
part 'src/params/process_params/face_api_params.dart';
part 'src/params/process_params/liveness_params.dart';
part 'src/params/process_params/authenticity_params.dart';
part 'src/params/process_params/rfid_params.dart';
part 'src/params/rfid_scenario/rfid_scenario.dart';
part 'src/params/process_params/backend_processing_config.dart';
part 'src/params/rfid_scenario/edl_data_groups.dart';
part 'src/params/rfid_scenario/eid_data_groups.dart';
part 'src/params/rfid_scenario/e_passport_data_groups.dart';
part 'src/params/customization/customization.dart';
part 'src/params/customization/font.dart';
part 'src/params/customization/customization_colors.dart';
part 'src/params/customization/customization_fonts.dart';
part 'src/params/customization/customization_images.dart';
part 'src/params/functionality.dart';

part 'src/rfid/rfid_notification.dart';
part 'src/rfid/pkd_certificate.dart';
part 'src/rfid/tcc_params.dart';
part 'src/rfid/pa_attribute.dart';
part 'src/rfid/pa_resources_issuer.dart';
part 'src/rfid/ta_challenge.dart';
part 'src/rfid/rfid_error_codes.dart';

part 'src/config/init_config.dart';
part 'src/config/scanner_config.dart';
part 'src/config/recognize_config.dart';
part 'src/config/online_processing_config.dart';
part 'src/config/rfid_config.dart';

part 'src/info/doc_reader_exception.dart';
part 'src/info/rfid_exception.dart';
part 'src/info/license.dart';
part 'src/info/doc_reader_scenario.dart';
part 'src/info/doc_reader_version.dart';
part 'src/info/documents_database.dart';
part 'src/info/prepare_progress.dart';

part 'src/results/authenticity/authenticity_check.dart';
part 'src/results/authenticity/authenticity_element.dart';
part 'src/results/authenticity/authenticity_result.dart';
part 'src/results/authenticity/authenticity.dart';
part 'src/results/authenticity/check_diagnose.dart';
part 'src/results/authenticity/security_feature_type.dart';

part 'src/results/barcode/barcode_field.dart';
part 'src/results/barcode/barcode_result.dart';
part 'src/results/barcode/pdf417_info.dart';
part 'src/results/barcode/barcode_status.dart';
part 'src/results/barcode/barcode_type.dart';

part 'src/results/image_quality/image_quality.dart';
part 'src/results/image_quality/image_quality_group.dart';
part 'src/results/image_quality/image_quality_check_type.dart';

part 'src/results/rfid/access_control_procedure_type.dart';
part 'src/results/rfid/application.dart';
part 'src/results/rfid/attribute.dart';
part 'src/results/rfid/authority.dart';
part 'src/results/rfid/card_properties.dart';
part 'src/results/rfid/certificate_chain.dart';
part 'src/results/rfid/certificate_data.dart';
part 'src/results/rfid/extension.dart';
part 'src/results/rfid/file.dart';
part 'src/results/rfid/file_data.dart';
part 'src/results/rfid/rfid_session_data.dart';
part 'src/results/rfid/security_object.dart';
part 'src/results/rfid/security_object_certificates.dart';
part 'src/results/rfid/signer_info.dart';
part 'src/results/rfid/rfid_validity.dart';
part 'src/results/rfid/rfid_value.dart';
part 'src/results/rfid/data_field.dart';
part 'src/results/rfid/rfid_data_file_type.dart';
part 'src/results/rfid/rfid_access_control_procedure_type.dart';
part 'src/results/rfid/rfid_certificate_type.dart';

part 'src/results/status/optical_status.dart';
part 'src/results/status/rfid_status.dart';
part 'src/results/status/results_status.dart';
part 'src/results/status/check_result.dart';

part 'src/results/visible_digital_seals/vdsnc_data.dart';
part 'src/results/visible_digital_seals/bytes_data.dart';
part 'src/results/visible_digital_seals/lds_parsing_error_codes.dart';
part 'src/results/visible_digital_seals/lds_parsing_notification_codes.dart';

part 'src/results/visual_results/comparison.dart';
part 'src/results/visual_results/graphic_field.dart';
part 'src/results/visual_results/graphic_result.dart';
part 'src/results/visual_results/rfid_origin.dart';
part 'src/results/visual_results/symbol.dart';
part 'src/results/visual_results/text_field.dart';
part 'src/results/visual_results/text_result.dart';
part 'src/results/visual_results/text_source.dart';
part 'src/results/visual_results/validity.dart';
part 'src/results/visual_results/value.dart';
part 'src/results/visual_results/rect.dart';
part 'src/results/visual_results/lights.dart';
part 'src/results/visual_results/graphic_field_type.dart';
part 'src/results/visual_results/field_type.dart';
part 'src/results/visual_results/lcid.dart';

part 'src/results/results.dart';
part 'src/results/position.dart';
part 'src/results/document_type.dart';
part 'src/results/transaction_info.dart';

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
  DocReaderVersion? _version;

  /// Information about your license.
  License get license => _license;
  License _license = License();

  /// Allows you to check if RFID chip reading can be performed based on your
  /// license and Core framework capabilities.
  bool get isRFIDAvailableForUse => _isRFIDAvailableForUse;
  bool _isRFIDAvailableForUse = false;

  /// Allows you to get a status of the RFID chip reading process.
  ///
  /// IOS only.
  String? get rfidSessionStatus {
    if (!Platform.isIOS) {
      throw PlatformException(
        code: "ios-only",
        message: "rfidSessionStatus is accessible only on iOS",
      );
    }
    return _rfidSessionStatus;
  }

  String? _rfidSessionStatus;
  set rfidSessionStatus(String? val) {
    if (!Platform.isIOS) {
      throw PlatformException(
        code: "ios-only",
        message: "rfidSessionStatus is accessible only on iOS",
      );
    }
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
  Functionality _functionality = Functionality();
  set functionality(Functionality val) {
    _functionality = val;
    _functionality._apply();
  }

  /// Params that influence the scanning process.
  ProcessParams get processParams => _processParams;
  ProcessParams _processParams = ProcessParams();
  set processParams(ProcessParams val) {
    _processParams = val;
    _processParams._apply();
  }

  /// Params that relate to the camera view controller customization and etc.
  Customization get customization => _customization;
  Customization _customization = Customization();
  set customization(Customization val) {
    _customization = val;
    _customization._apply();
  }

  /// Params that influence the RFID chip processing.
  RFIDScenario get rfidScenario => _rfidScenario;
  RFIDScenario _rfidScenario = RFIDScenario();
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
  /// Android only. Requires [btdevice plugin](https://pub.dev/packages/flutter_document_reader_btdevice_beta).
  Future<bool> get isBlePermissionsGranted async {
    if (!Platform.isAndroid) {
      throw PlatformException(
        code: "android-only",
        message: "isBlePermissionsGranted is accessible only on Android",
      );
    }
    return await _bridge.invokeMethod("isBlePermissionsGranted", []);
  }

  /// Use this method to reset all parameters to their default values.
  void resetConfiguration() {
    _bridge.invokeMethod("resetConfiguration", []);
    _functionality = Functionality();
    _processParams = ProcessParams();
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
  /// [config] - configuration file for DocumentReader initialization.
  ///
  /// Check out [SuccessOrError] documentation for handling return type.
  Future<SuccessOrError> initializeReader(InitConfig config) async {
    var funcName = config._useBleDevice
        ? "initializeReaderWithBleDeviceConfig"
        : "initializeReader";
    var response = await _bridge.invokeMethod(funcName, [config.toJson()]);
    await _onInit();
    return _successOrErrorFromJson(response);
  }

  /// Used to connect to the ble device.
  ///
  /// Android only.
  void startBluetoothService(BluetoothServiceCompletion completion) {
    if (!Platform.isAndroid) {
      throw PlatformException(
        code: "android-only",
        message: "startBluetoothService is accessible only on Android",
      );
    }
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
  /// [databaseID] - identifier of the database.
  ///
  /// [prepareCompletion] - callback that returns downloading progress.
  ///
  /// Check out [SuccessOrError] documentation for handling return type.
  ///
  /// Requires `android.permission.INTERNET` android permission.
  Future<SuccessOrError> prepareDatabase(
    String databaseID,
    DocumentReaderPrepareCompletion prepareCompletion,
  ) async {
    _setDocumentReaderPrepareCompletion(prepareCompletion);
    var response = await _bridge.invokeMethod("prepareDatabase", [databaseID]);
    return _successOrErrorFromJson(response);
  }

  /// Allows you to download a database from the Regula server.
  /// Each new update of the database will be downloaded.
  ///
  /// [databaseID] - identifier of the database.
  ///
  /// [prepareCompletion] - callback that returns downloading progress.
  ///
  /// Check out [SuccessOrError] documentation for handling return type.
  ///
  /// Requires `android.permission.INTERNET` android permission.
  Future<SuccessOrError> runAutoUpdate(
    String databaseID,
    DocumentReaderPrepareCompletion prepareCompletion,
  ) async {
    _setDocumentReaderPrepareCompletion(prepareCompletion);
    var response = await _bridge.invokeMethod("runAutoUpdate", [databaseID]);
    return _successOrErrorFromJson(response);
  }

  /// Allows you to to check database update.
  ///
  /// [databaseID] - identifier of the database.
  ///
  /// Requires `android.permission.INTERNET` android permission.
  Future<DocumentsDatabase?> checkDatabaseUpdate(String databaseID) async {
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
  /// [config] - scanning configuration.
  ///
  /// [completion] - block to execute after the recognition process finishes.
  void scan(ScannerConfig config, DocumentReaderCompletion completion) {
    _setDocumentReaderCompletion(completion);
    _bridge.invokeMethod("scan", [config.toJson()]);
  }

  /// Used for proccessing predefined images.
  ///
  /// [config] - scanning configuration.
  ///
  /// [completion] - block to execute after the recognition process finishes.
  void recognize(RecognizeConfig config, DocumentReaderCompletion completion) {
    _setDocumentReaderCompletion(completion);
    _bridge.invokeMethod("recognize", [config.toJson()]);
  }

  /// Used for the RFID chip processing.
  ///
  /// [config] - chip reading configuration.
  ///
  /// Requires `android.permission.NFC` android permission.
  void rfid(RFIDConfig config) {
    config._disableUI
        ? _setRFIDCompletion(config._rfidCompletion!)
        : _setDocumentReaderCompletion(config._completion!);

    _setRFIDProgressCompletion(config.onProgress);
    _setChipDetectedCompletion(config.onChipDetected);
    _setRetryReadChipCompletion(config.onRetryReadChip);

    _setPaCertificateCompletion(config.onRequestPACertificates);
    _setTaCertificateCompletion(config.onRequestTACertificates);
    _setTaSignatureCompletion(config.onRequestTASignature);

    _bridge.invokeMethod(config._disableUI ? "readRFID" : "startRFIDReader", [
      config.onRequestPACertificates != null,
      config.onRequestTACertificates != null,
      config.onRequestTASignature != null,
    ]);
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
  /// [certificates] - PKD certificates.
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

  /// Sets the given `TCCParams` to the RFID  session.
  /// The parameters are required to be set before starting RFID session.
  ///
  /// [params] - TCC related parameters.
  ///
  /// Check out [SuccessOrError] documentation for handling return type.
  Future<SuccessOrError> setTCCParams(TccParams params) async {
    var response = await _bridge.invokeMethod(
      "setTCCParams",
      [params.toJson()],
    );
    return _successOrErrorFromJson(response);
  }

  Future<FinalizePackageCompletion> finalizePackage() async {
    var response = await _bridge.invokeMethod("finalizePackage", []);

    var jsonObject = json.decode(response);
    var action = DocReaderAction.getByValue(jsonObject["action"])!;
    var info = TransactionInfo.fromJson(jsonObject["info"]);
    var error = DocReaderException.fromJson(jsonObject["error"]);

    return (action, info, error);
  }

  (bool, DocReaderException?) _successOrErrorFromJson(String jsonString) {
    var jsonObject = json.decode(jsonString);
    var success = jsonObject["success"];
    var error = DocReaderException.fromJson(jsonObject["error"]);
    return (success, error);
  }

  Future<void> _onInit() async {
    _version = await _getDocReaderVersion();
    _availableScenarios = await _getAvailableScenarios();
    _license = await _getLicense();
    _isRFIDAvailableForUse = await _getIsRFIDAvailableForUse();
    _tag = await _getTag();
    if (Platform.isIOS) _rfidSessionStatus = await _getRfidSessionStatus();
    _functionality = await _getFunctionality();
    _processParams = await _getProcessParams();
    _customization = await _getCustomization();
    _rfidScenario = await _getRfidScenario();
  }

  Future<ProcessParams> _getProcessParams() async {
    String response = await _bridge.invokeMethod("getProcessParams", []);
    return ProcessParams.fromJson(_decode(response));
  }

  Future<Functionality> _getFunctionality() async {
    String response = await _bridge.invokeMethod("getFunctionality", []);
    return Functionality.fromJson(_decode(response));
  }

  Future<Customization> _getCustomization() async {
    String response = await _bridge.invokeMethod("getCustomization", []);
    return Customization.fromJson(_decode(response));
  }

  Future<RFIDScenario> _getRfidScenario() async {
    String response = await _bridge.invokeMethod("getRfidScenario", []);
    return RFIDScenario.fromJson(_decode(response));
  }

  Future<License> _getLicense() async {
    String response = await _bridge.invokeMethod("getLicense", []);
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

  void _setRfidSessionStatus(String? status) {
    _bridge.invokeMethod("setRfidSessionStatus", [status]);
  }

  Future<String?> _getTag() async {
    return await _bridge.invokeMethod("getTag", []);
  }

  void _setTag(String? tag) {
    _bridge.invokeMethod("setTag", [tag]);
  }

  void _setLocalizationDictionary(Map<String, String>? dictionary) {
    _bridge.invokeMethod("setLocalizationDictionary", [dictionary]);
  }
}

/// A type specifically made for receiving answer from any function
/// which does not return anything, but we need to know whether the function
/// has succeeded or not.
///
/// [bool] - indicates success status.
///
/// [DocReaderException] - in case success status is `false` - brief message for developer,
/// `null` otherwise.
///
/// Examples(`myFunction` returns [SuccessOrError]):
///
/// With error handling:
/// ```dart
/// var (success, error) = await myFunction();
/// if (success) {
///   print("success!");
/// } else {
///   print("Error: ${error!.message}");
/// }
/// ```
///
/// Using then:
/// ```dart
/// myFunction().then((response) {
///   var (success, error) = response;
///   if (success) {
///     print("success!");
///   } else {
///     print("Error: ${error!.message}");
///   }
/// });
/// ```
/// Without error handling:
/// ```dart
/// var (success, _) = await myFunction();
/// if (success) {
///   print("success!");
/// }
/// ```
///
/// Most compact:
/// ```dart
/// if ((await myFunction()).$1) print("success");
/// ```
typedef SuccessOrError = (bool, DocReaderException?);

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

/// Keeps user notified about btDevice`s connection state.
/// Used in [DocumentReader.startBluetoothService]
///
/// [onServiceConnected] fires when android`s bluetooth service is initialized.
///
/// [onServiceDisconnected] fires when android`s bluetooth service is destroyed.
///
/// [onDeviceReady] fires when a bluetooth device is connected and ready to use.
/// [DocumentReader.initializeReader] should be run here.
/// [InitConfig.withBleDevice] should be used to create configuration.
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

/// Type for receiving answer after backend processing has finished.
///
/// [DocReaderAction] defines processing status.
///
/// [TransactionInfo] contains transactionId and tag.
///
/// [DocReaderException] in case of anything is wrong - brief message for developer, `null` otherwise.
typedef FinalizePackageCompletion = (
  DocReaderAction action,
  TransactionInfo? info,
  DocReaderException? error,
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
