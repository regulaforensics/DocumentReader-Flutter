//
//  Functionality.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Params that influence the scanning process, camera view controller
/// customization and etc.
class Functionality {
  /// If set to `true`, as soon as document is located during video mode,
  /// picture wil be taken and processed as single frame.
  ///
  /// Used for devices with poor-quality video preview.
  ///
  /// Android only.
  bool? get pictureOnBoundsReady => _pictureOnBoundsReady;
  bool? _pictureOnBoundsReady;
  set pictureOnBoundsReady(bool? val) {
    _pictureOnBoundsReady = val;
    _setFunctionality({"pictureOnBoundsReady": val}, this);
  }

  /// If it's set to `true`, the button that allows you to turn on/off
  /// the torch will be displayed.
  ///
  /// Default: `true`.
  bool? get showTorchButton => _showTorchButton;
  bool? _showTorchButton;
  set showTorchButton(bool? val) {
    _showTorchButton = val;
    _setFunctionality({"showTorchButton": val}, this);
  }

  /// If it's set to `true`, the button that allows you to close the scanner
  /// will be displayed.
  ///
  /// Default: `true`.
  bool? get showCloseButton => _showCloseButton;
  bool? _showCloseButton;
  set showCloseButton(bool? val) {
    _showCloseButton = val;
    _setFunctionality({"showCloseButton": val}, this);
  }

  /// If it's set to `true`, camera frames won't be taken for recognition
  /// while a device is moving based on motion sensors.
  ///
  /// Default: `true`.
  bool? get videoCaptureMotionControl => _videoCaptureMotionControl;
  bool? _videoCaptureMotionControl;
  set videoCaptureMotionControl(bool? val) {
    _videoCaptureMotionControl = val;
    _setFunctionality({"videoCaptureMotionControl": val}, this);
  }

  /// If it's set to `true`, the button that allows you to take a picture
  /// and process it as a single frame will be displayed.
  ///
  /// Default: `false`.
  bool? get showCaptureButton => _showCaptureButton;
  bool? _showCaptureButton;
  set showCaptureButton(bool? val) {
    _showCaptureButton = val;
    _setFunctionality({"showCaptureButton": val}, this);
  }

  /// If it's set to `true`, the button that allows you to change the camera
  /// frame type will be displayed.
  ///
  /// Default: `false`.
  bool? get showChangeFrameButton => _showChangeFrameButton;
  bool? _showChangeFrameButton;
  set showChangeFrameButton(bool? val) {
    _showChangeFrameButton = val;
    _setFunctionality({"showChangeFrameButton": val}, this);
  }

  /// If it's set to `true`, the button that allows you to skip processing
  /// of the next page of a document will be displayed.
  ///
  /// Default: `true`.
  bool? get showSkipNextPageButton => _showSkipNextPageButton;
  bool? _showSkipNextPageButton;
  set showSkipNextPageButton(bool? val) {
    _showSkipNextPageButton = val;
    _setFunctionality({"showSkipNextPageButton": val}, this);
  }

  /// If it's set to `true`, allows you to connect to the external
  /// Regula Bluetooth devices like Regula 1120 and others.
  bool? get useAuthenticator => _useAuthenticator;
  bool? _useAuthenticator;
  set useAuthenticator(bool? val) {
    _useAuthenticator = val;
    _setFunctionality({"useAuthenticator": val}, this);
  }

  /// If it's set to `true`, camera frames won't be taken for recognition
  /// while a camera is focusing.
  ///
  /// Default: `true`.
  bool? get skipFocusingFrames => _skipFocusingFrames;
  bool? _skipFocusingFrames;
  set skipFocusingFrames(bool? val) {
    _skipFocusingFrames = val;
    _setFunctionality({"skipFocusingFrames": val}, this);
  }

  /// If it's set to `true`, the button that allows you to change a position
  /// of a capture device for the video session will be displayed.
  ///
  /// Default: `false`.
  bool? get showCameraSwitchButton => _showCameraSwitchButton;
  bool? _showCameraSwitchButton;
  set showCameraSwitchButton(bool? val) {
    _showCameraSwitchButton = val;
    _setFunctionality({"showCameraSwitchButton": val}, this);
  }

  /// If it's set to `true`, the metadata will be displayed over the camera
  /// preview during document processing, namely the perspective angle value.
  ///
  /// Default: `false`.
  bool? get displayMetadata => _displayMetadata;
  bool? _displayMetadata;
  set displayMetadata(bool? val) {
    _displayMetadata = val;
    _setFunctionality({"displayMetadata": val}, this);
  }

  /// If it's set to `true`, allows you to adjust a zoom level using the pinch
  /// gesture (its range is from 1x to 10x).
  ///
  /// Default: `false`.
  bool? get isZoomEnabled => _isZoomEnabled;
  bool? _isZoomEnabled;
  set isZoomEnabled(bool? val) {
    _isZoomEnabled = val;
    _setFunctionality({"isZoomEnabled": val}, this);
  }

  /// Allows you to disable all validations of having a torch in case Android
  /// returns that it's not available, but it can be used when checks are skipped.
  ///
  /// Default: `false`.
  ///
  /// Android only.
  bool? get isCameraTorchCheckDisabled => _isCameraTorchCheckDisabled;
  bool? _isCameraTorchCheckDisabled;
  set isCameraTorchCheckDisabled(bool? val) {
    _isCameraTorchCheckDisabled = val;
    _setFunctionality({"isCameraTorchCheckDisabled": val}, this);
  }

  /// If set to `true`, video during processing of the document will be recorded.
  /// This can be used later for debugging and troubleshooting.
  ///
  /// Default: `false`.
  bool? get recordScanningProcess => _recordScanningProcess;
  bool? _recordScanningProcess;
  set recordScanningProcess(bool? val) {
    _recordScanningProcess = val;
    _setFunctionality({"recordScanningProcess": val}, this);
  }

  /// If it's set to `true`, scanner operate in manual multipage scanning mode.
  /// Set this flag to true, if you wanna create for example, custom logic
  /// (or UI) between scanning document pages.
  ///
  /// Default: `false`.
  bool? get manualMultipageMode => _manualMultipageMode;
  bool? _manualMultipageMode;
  set manualMultipageMode(bool? val) {
    _manualMultipageMode = val;
    _setFunctionality({"manualMultipageMode": val}, this);
  }

  /// If it's set to `true`, once the scanning process is finished,
  /// the scanner will be dismissed.
  ///
  /// Default: `true`.
  ///
  /// iOS only.
  bool? get singleResult => _singleResult;
  bool? _singleResult;
  set singleResult(bool? val) {
    _singleResult = val;
    _setFunctionality({"singleResult": val}, this);
  }

  /// Allows you to specify a time interval when the Capture button
  /// has to be displayed after the document is detected.
  /// Don't forget to set the [showCaptureButton] to `true`,
  /// otherwise, it won't be displayed.
  ///
  /// Default: 5.
  int? get showCaptureButtonDelayFromDetect =>
      _showCaptureButtonDelayFromDetect;
  int? _showCaptureButtonDelayFromDetect;
  set showCaptureButtonDelayFromDetect(int? val) {
    _showCaptureButtonDelayFromDetect = val;
    _setFunctionality({"showCaptureButtonDelayFromDetect": val}, this);
  }

  /// Allows you to specify a time interval when the Capture button
  /// has to be displayed after the scanning process is started.
  /// Don't forget to set the [showCaptureButton] to `true`,
  /// otherwise, it won't be displayed.
  ///
  /// Default: 10.
  int? get showCaptureButtonDelayFromStart => _showCaptureButtonDelayFromStart;
  int? _showCaptureButtonDelayFromStart;
  set showCaptureButtonDelayFromStart(int? val) {
    _showCaptureButtonDelayFromStart = val;
    _setFunctionality({"showCaptureButtonDelayFromStart": val}, this);
  }

  /// Use the parameter to set the time limit (in seconds) for the RFID chip reading,
  /// beyond which it does not continue regardless of its result.
  ///
  /// Android only.
  int? get rfidTimeout => _rfidTimeout;
  int? _rfidTimeout;
  set rfidTimeout(int? val) {
    _rfidTimeout = val;
    _setFunctionality({"rfidTimeout": val}, this);
  }

  /// Sets a limit on the number of pages to be processed.
  int? get forcePagesCount => _forcePagesCount;
  int? _forcePagesCount;
  set forcePagesCount(int? val) {
    _forcePagesCount = val;
    _setFunctionality({"forcePagesCount": val}, this);
  }

  /// Allows you to specify an orientation of the camera view controller.
  ///
  /// Default: [DocReaderOrientation.ALL].
  DocReaderOrientation? get orientation => _orientation;
  DocReaderOrientation? _orientation;
  set orientation(DocReaderOrientation? val) {
    _orientation = val;
    _setFunctionality({"orientation": val?.value}, this);
  }

  /// Allows you to specify the video processing mode.
  ///
  /// Default: [CaptureMode.AUTO].
  CaptureMode? get captureMode => _captureMode;
  CaptureMode? _captureMode;
  set captureMode(CaptureMode? val) {
    _captureMode = val;
    _setFunctionality({"captureMode": val}, this);
  }

  /// Allows you to specify a position of a capture device for the video session.
  ///
  /// Default: [CameraPosition.AUTO].
  CameraPosition? get cameraPosition => _cameraPosition;
  CameraPosition? _cameraPosition;
  set cameraPosition(CameraPosition? val) {
    _cameraPosition = val;
    _setFunctionality({"cameraPosition": val?.value}, this);
  }

  /// Set this setting to override the default cropping frame provided by scenarios.
  ///
  /// Default: [DocReaderFrame.SCENARIO_DEFAULT].
  DocReaderFrame? get cameraFrame => _cameraFrame;
  DocReaderFrame? _cameraFrame;
  set cameraFrame(DocReaderFrame? val) {
    _cameraFrame = val;
    _setFunctionality({"cameraFrame": val?.value}, this);
  }

  /// Allows you to specify a name of a Regula device that will be used
  /// with Document Reader SDK.
  String? get btDeviceName => _btDeviceName;
  String? _btDeviceName;
  set btDeviceName(String? val) {
    _btDeviceName = val;
    _setFunctionality({"btDeviceName": val}, this);
  }

  /// Allows you to set the desired zoom level (its range from 1x to 10x).
  ///
  /// Default: 1.0.
  double? get zoomFactor => _zoomFactor;
  double? _zoomFactor;
  set zoomFactor(double? val) {
    _zoomFactor = val;
    _setFunctionality({"zoomFactor": val}, this);
  }

  /// Allows you to control exposure.
  ///
  /// Android only.
  double? get exposure => _exposure;
  double? _exposure;
  set exposure(double? val) {
    _exposure = val;
    _setFunctionality({"exposure": val}, this);
  }

  /// A list of devices that must not use the camera2 API.
  ///
  /// Android only.
  List<String>? get excludedCamera2Models => _excludedCamera2Models;
  List<String>? _excludedCamera2Models;
  set excludedCamera2Models(List<String>? val) {
    _excludedCamera2Models = val;
    _setFunctionality({"excludedCamera2Models": val}, this);
  }

  /// Allows you to specify the frame resolution.
  ///
  /// Android only. For iOS use [cameraResolutionIOS]
  CameraSize? get cameraResolutionAndroid => _cameraResolutionAndroid;
  CameraSize? _cameraResolutionAndroid;
  set cameraResolutionAndroid(CameraSize? val) {
    _cameraResolutionAndroid = val;
    _setFunctionality({"cameraSize": val}, this);
  }

  /// Allows you to specify the frame resolution.
  ///
  /// iOS only. For  Android use [cameraResolutionAndroid]
  CaptureSessionPreset? get cameraResolutionIOS => _cameraResolutionIOS;
  CaptureSessionPreset? _cameraResolutionIOS;
  set cameraResolutionIOS(CaptureSessionPreset? val) {
    _cameraResolutionIOS = val;
    _setFunctionality({"videoSessionPreset": val}, this);
  }

  /// Allows you to deserialize object.
  fromJson(Map<String, dynamic> jsonObject) {
    _pictureOnBoundsReady = jsonObject["pictureOnBoundsReady"];
    _showTorchButton = jsonObject["showTorchButton"];
    _showCloseButton = jsonObject["showCloseButton"];
    _videoCaptureMotionControl = jsonObject["videoCaptureMotionControl"];
    _showCaptureButton = jsonObject["showCaptureButton"];
    _showChangeFrameButton = jsonObject["showChangeFrameButton"];
    _showSkipNextPageButton = jsonObject["showSkipNextPageButton"];
    _useAuthenticator = jsonObject["useAuthenticator"];
    _skipFocusingFrames = jsonObject["skipFocusingFrames"];
    _showCameraSwitchButton = jsonObject["showCameraSwitchButton"];
    _displayMetadata = jsonObject["displayMetadata"];
    _isZoomEnabled = jsonObject["isZoomEnabled"];
    _isCameraTorchCheckDisabled = jsonObject["isCameraTorchCheckDisabled"];
    _recordScanningProcess = jsonObject["recordScanningProcess"];
    _manualMultipageMode = jsonObject["manualMultipageMode"];
    _singleResult = jsonObject["singleResult"];

    _showCaptureButtonDelayFromDetect =
        jsonObject["showCaptureButtonDelayFromDetect"];
    _showCaptureButtonDelayFromStart =
        jsonObject["showCaptureButtonDelayFromStart"];
    _rfidTimeout = jsonObject["rfidTimeout"];
    _forcePagesCount = jsonObject["forcePagesCount"];
    _orientation = DocReaderOrientation.getByValue(jsonObject["orientation"]);
    _captureMode = CaptureMode.getByValue(jsonObject["captureMode"]);
    _cameraPosition = CameraPosition.getByValue(jsonObject["cameraPosition"]);

    _cameraFrame = DocReaderFrame.getByValue(jsonObject["cameraFrame"]);
    _btDeviceName = jsonObject["btDeviceName"];

    _zoomFactor = _toDouble(jsonObject["zoomFactor"]);
    _exposure = _toDouble(jsonObject["exposure"]);

    _excludedCamera2Models = jsonObject["excludedCamera2Models"] == null
        ? null
        : List<String>.from(jsonObject["excludedCamera2Models"]);

    _cameraResolutionAndroid = CameraSize.fromJson(jsonObject["cameraSize"]);
    _cameraResolutionIOS =
        CaptureSessionPreset.getByValue(jsonObject["videoSessionPreset"]);

    return this;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "pictureOnBoundsReady": pictureOnBoundsReady,
        "showTorchButton": showTorchButton,
        "showCloseButton": showCloseButton,
        "videoCaptureMotionControl": videoCaptureMotionControl,
        "showCaptureButton": showCaptureButton,
        "showChangeFrameButton": showChangeFrameButton,
        "showSkipNextPageButton": showSkipNextPageButton,
        "useAuthenticator": useAuthenticator,
        "skipFocusingFrames": skipFocusingFrames,
        "showCameraSwitchButton": showCameraSwitchButton,
        "displayMetadata": displayMetadata,
        "isZoomEnabled": isZoomEnabled,
        "isCameraTorchCheckDisabled": isCameraTorchCheckDisabled,
        "recordScanningProcess": recordScanningProcess,
        "manualMultipageMode": manualMultipageMode,
        "singleResult": singleResult,
        "showCaptureButtonDelayFromDetect": showCaptureButtonDelayFromDetect,
        "showCaptureButtonDelayFromStart": showCaptureButtonDelayFromStart,
        "rfidTimeout": rfidTimeout,
        "forcePagesCount": forcePagesCount,
        "orientation": orientation?.value,
        "captureMode": captureMode?.value,
        "cameraPosition": cameraPosition?.value,
        "cameraFrame": cameraFrame?.value,
        "btDeviceName": btDeviceName,
        "zoomFactor": zoomFactor,
        "exposure": exposure,
        "excludedCamera2Models": excludedCamera2Models,
        "cameraSize": cameraResolutionAndroid?.toJson(),
        "videoSessionPreset": cameraResolutionIOS?.value,
      };

  static _setFunctionality(
    Map<String, dynamic> json,
    Functionality instance,
  ) {
    if (identical(instance, DocumentReader.instance.functionality))
      _bridge.invokeMethod("setFunctionality", [json]);
  }

  Future<void> _sync() async {
    String response = await _bridge.invokeMethod("getFunctionality", []);
    this.fromJson(_decode(response));
  }

  _apply() => _setFunctionality(this.toJson(), this);
}

enum CameraPosition {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  AUTO(0),

  BACK(1),

  FRONT(2);

  const CameraPosition(this.value);
  final int value;

  static CameraPosition? getByValue(int? i) {
    if (i == null) return null;
    try {
      return CameraPosition.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return CameraPosition.UNKNOWN;
    }
  }
}

enum CaptureMode {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// A flow of frames is taken for recognition right after a scenario is started.
  AUTO(0),

  /// A flow of frames is taken for recognition right after the Capture button is pushed.
  CAPTURE_VIDEO(1),

  /// A single frame is taken for recognition right after the Capture button is pushed.
  CAPTURE_FRAME(2);

  const CaptureMode(this.value);
  final int value;

  static CaptureMode? getByValue(int? i) {
    if (i == null) return null;
    try {
      return CaptureMode.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return CaptureMode.UNKNOWN;
    }
  }
}

enum CaptureSessionPreset {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// An AVCaptureSession preset suitable for low quality output.
  LOW(0),

  /// An AVCaptureSession preset suitable for medium quality output.
  MEDIUM(1),

  /// An AVCaptureSession preset suitable for high quality video and audio output.
  HIGH(2),
  // An AVCaptureSession preset suitable for high resolution photo quality output.
  PHOTO(3),

  /// An AVCaptureSession preset indicating that the formats of the session's
  /// inputs are being given priority.
  INPUT_PRIORITY(4),

  /// An AVCaptureSession preset suitable for 1280x720 video output.
  PRESET_1280x720(6),

  /// An AVCaptureSession preset suitable for 1920x1080 video output.
  PRESET_1920x1080(7),

  /// An AVCaptureSession preset suitable for 3840x2160 (UHD 4K) video output.
  PRESET_3840x2160(8),

  /// An AVCaptureSession preset producing 960x540 Apple iFrame video and audio content.
  FRAME_960x540(9),

  /// An AVCaptureSession preset producing 1280x720 Apple iFrame video and audio content.
  FRAME_1280x720(10),

  /// An AVCaptureSession preset suitable for 640x480 video output.
  PRESET_640x480(12),

  /// An AVCaptureSession preset suitable for 352x288 video output.
  PRESET_352x288(13);

  const CaptureSessionPreset(this.value);
  final int value;

  static CaptureSessionPreset? getByValue(int? i) {
    if (i == null) return null;
    try {
      return CaptureSessionPreset.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return CaptureSessionPreset.UNKNOWN;
    }
  }
}

enum DocReaderFrame {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(""),

  /// Size of the frame depends on the scenario, that means default values are used.
  SCENARIO_DEFAULT("id1"),

  /// Full frame.
  MAX("max"),

  /// No frame.
  NONE("none"),

  /// Size of the frame corresponds to the ID-3 format in the portrait mode
  /// and to the ID-1 in the landscape mode.
  DOCUMENT("document");

  const DocReaderFrame(this.value);
  final String value;

  static DocReaderFrame? getByValue(String? i) {
    if (i == null) return null;
    try {
      return DocReaderFrame.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return DocReaderFrame.UNKNOWN;
    }
  }
}

class CameraSize {
  late int width;

  late int height;

  /// Allows you to deserialize object.
  static CameraSize? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CameraSize();

    result.width = jsonObject["width"];
    result.height = jsonObject["height"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    return {
      "width": width,
      "height": height,
    };
  }
}
