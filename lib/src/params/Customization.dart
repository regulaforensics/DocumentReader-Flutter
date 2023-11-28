//
//  Customization.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Params that relate to the camera view controller customization and etc.
class Customization {
  /// If it's set to `true`, status messages during the document processing
  /// will be shown.
  ///
  /// Default: `true`.
  bool? get showStatusMessages => _showStatusMessages;
  bool? _showStatusMessages;
  set showStatusMessages(bool? val) {
    _showStatusMessages = val;
    _setCustomization({"showStatusMessages": val}, this);
  }

  /// If it's set to `true`, result status messages during the document processing
  /// will be shown.
  ///
  /// Default: `true`.
  bool? get showResultStatusMessages => _showResultStatusMessages;
  bool? _showResultStatusMessages;
  set showResultStatusMessages(bool? val) {
    _showResultStatusMessages = val;
    _setCustomization({"showResultStatusMessages": val}, this);
  }

  /// If it's set to `true`, the animation showing how to position a document
  /// will be displayed.
  ///
  /// Default: `false`.
  bool? get showHelpAnimation => _showHelpAnimation;
  bool? _showHelpAnimation;
  set showHelpAnimation(bool? val) {
    _showHelpAnimation = val;
    _setCustomization({"showHelpAnimation": val}, this);
  }

  /// If it's set to `true`, the animation asking for processing
  /// the next page will be displayed.
  ///
  /// Default: `true`.
  bool? get showNextPageAnimation => _showNextPageAnimation;
  bool? _showNextPageAnimation;
  set showNextPageAnimation(bool? val) {
    _showNextPageAnimation = val;
    _setCustomization({"showNextPageAnimation": val}, this);
  }

  /// If it's set to `true`, the background mask next to the camera frame
  /// will be displayed.
  ///
  /// Default: `true`.
  bool? get showBackgroundMask => _showBackgroundMask;
  bool? _showBackgroundMask;
  set showBackgroundMask(bool? val) {
    _showBackgroundMask = val;
    _setCustomization({"showBackgroundMask": val}, this);
  }

  /// Allows you to set thickness of the camera frame borders.
  ///
  /// Default: 3.
  int? get cameraFrameBorderWidth => _cameraFrameBorderWidth;
  int? _cameraFrameBorderWidth;
  set cameraFrameBorderWidth(int? val) {
    _cameraFrameBorderWidth = val;
    _setCustomization({"cameraFrameBorderWidth": val}, this);
  }

  /// Allows you to set length of the lines of the camera frame.
  ///
  /// It's applied once you change the [cameraFrameShapeType] property to
  /// [FrameShapeType.CORNER].
  ///
  /// Default: 25.
  int? get cameraFrameLineLength => _cameraFrameLineLength;
  int? _cameraFrameLineLength;
  set cameraFrameLineLength(int? val) {
    _cameraFrameLineLength = val;
    _setCustomization({"cameraFrameLineLength": val}, this);
  }

  /// Allows you to set an offset for the camera frame (portrait orientation).
  ///
  /// Default: 3.
  int? get cameraFrameOffsetWidth => _cameraFrameOffsetWidth;
  int? _cameraFrameOffsetWidth;
  set cameraFrameOffsetWidth(int? val) {
    _cameraFrameOffsetWidth = val;
    _setCustomization({"cameraFrameOffsetWidth": val}, this);
  }

  /// Allows you to set a shape type for the camera frame.
  ///
  /// Default: [FrameShapeType.LINE].
  FrameShapeType? get cameraFrameShapeType => _cameraFrameShapeType;
  FrameShapeType? _cameraFrameShapeType;
  set cameraFrameShapeType(FrameShapeType? val) {
    _cameraFrameShapeType = val;
    _setCustomization({"cameraFrameShapeType": val?.value}, this);
  }

  /// Allows you to set any string to the status.
  String? get status => _status;
  String? _status;
  set status(String? val) {
    _status = val;
    _setCustomization({"status": val}, this);
  }

  /// Allows you to set any string to the result status.
  String? get resultStatus => _resultStatus;
  String? _resultStatus;
  set resultStatus(String? val) {
    _resultStatus = val;
    _setCustomization({"resultStatus": val}, this);
  }

  /// Allows you to set a color for the camera frame when a document is out
  /// of the camera frame or is not detected.
  ///
  /// Default: Colors.white.
  Color? get cameraFrameDefaultColor => _cameraFrameDefaultColor;
  Color? _cameraFrameDefaultColor;
  set cameraFrameDefaultColor(Color? val) {
    _cameraFrameDefaultColor = val;
    _setCustomization({"cameraFrameDefaultColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for the camera frame when a document is detected.
  ///
  /// Default: Colors.green.
  Color? get cameraFrameActiveColor => _cameraFrameActiveColor;
  Color? _cameraFrameActiveColor;
  set cameraFrameActiveColor(Color? val) {
    _cameraFrameActiveColor = val;
    _setCustomization({"cameraFrameActiveColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for the status messages.
  ///
  /// Default: Colors.white.
  Color? get statusTextColor => _statusTextColor;
  Color? _statusTextColor;
  set statusTextColor(Color? val) {
    _statusTextColor = val;
    _setCustomization({"statusTextColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for the result status messages.
  ///
  /// Default: Colors.white.
  Color? get resultStatusTextColor => _resultStatusTextColor;
  Color? _resultStatusTextColor;
  set resultStatusTextColor(Color? val) {
    _resultStatusTextColor = val;
    _setCustomization({"resultStatusTextColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color of the background for the result status messages.
  Color? get resultStatusBackgroundColor => _resultStatusBackgroundColor;
  Color? _resultStatusBackgroundColor;
  set resultStatusBackgroundColor(Color? val) {
    _resultStatusBackgroundColor = val;
    _setCustomization(
        {"resultStatusBackgroundColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for the "Skip next page" button.
  Color? get multipageButtonBackgroundColor => _multipageButtonBackgroundColor;
  Color? _multipageButtonBackgroundColor;
  set multipageButtonBackgroundColor(Color? val) {
    _multipageButtonBackgroundColor = val;
    _setCustomization(
        {"multipageButtonBackgroundColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for all visual elements.
  Color? get tintColor => _tintColor;
  Color? _tintColor;
  set tintColor(Color? val) {
    _tintColor = val;
    _setCustomization({"tintColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a color for the activity indicator.
  Color? get activityIndicatorColor => _activityIndicatorColor;
  Color? _activityIndicatorColor;
  set activityIndicatorColor(Color? val) {
    _activityIndicatorColor = val;
    _setCustomization({"activityIndicatorColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a background color for the status messages.
  ///
  /// Default: Colors.transparent.
  Color? get statusBackgroundColor => _statusBackgroundColor;
  Color? _statusBackgroundColor;
  set statusBackgroundColor(Color? val) {
    _statusBackgroundColor = val;
    _setCustomization({"statusBackgroundColor": _intFromColor(val)}, this);
  }

  /// Allows you to set a background color for the camera preview
  /// (top and bottom frames).
  ///
  /// Default: Colors.black.
  Color? get cameraPreviewBackgroundColor => _cameraPreviewBackgroundColor;
  Color? _cameraPreviewBackgroundColor;
  set cameraPreviewBackgroundColor(Color? val) {
    _cameraPreviewBackgroundColor = val;
    _setCustomization(
        {"cameraPreviewBackgroundColor": _intFromColor(val)}, this);
  }

  /// Allows you to change the location of the status.
  ///
  /// For example, if you set the multiplier to 0.5 and the number of pixels
  /// by vertical is equal to 800, your message will be centralized and located
  /// at 200 px from the top, i.e. (800 / 2) * 0.5 = 200 px. If the multiplier
  /// is equal to 1, the message will be centered. If the multiplier is equal
  /// to zero, the default location will be used.
  ///
  /// Default: 0.
  double? get statusPositionMultiplier => _statusPositionMultiplier;
  double? _statusPositionMultiplier;
  set statusPositionMultiplier(double? val) {
    _statusPositionMultiplier = val;
    _setCustomization({"statusPositionMultiplier": val}, this);
  }

  /// Allows you to change the location of the result status.
  ///
  /// For example, if you set the multiplier to 0.5 and the number of pixels
  /// by vertical is equal to 800, your message will be centralized and located
  /// at 200 px from the top, i.e. (800 / 2) * 0.5 = 200 px. If the multiplier
  /// is equal to 1, the message will be centered. If the multiplier is equal
  /// to zero, the default location will be used.
  ///
  /// Default: 0.
  double? get resultStatusPositionMultiplier => _resultStatusPositionMultiplier;
  double? _resultStatusPositionMultiplier;
  set resultStatusPositionMultiplier(double? val) {
    _resultStatusPositionMultiplier = val;
    _setCustomization({"resultStatusPositionMultiplier": val}, this);
  }

  /// Allows you to set a size for the toolbar
  /// (it's where all buttons are located).
  double? get toolbarSize => _toolbarSize;
  double? _toolbarSize;
  set toolbarSize(double? val) {
    _toolbarSize = val;
    _setCustomization({"toolbarSize": val}, this);
  }

  /// Allows you to set intensity of the background mask.
  ///
  /// Default: 0.3.
  double? get backgroundMaskAlpha => _backgroundMaskAlpha;
  double? _backgroundMaskAlpha;
  set backgroundMaskAlpha(double? val) {
    _backgroundMaskAlpha = val;
    _setCustomization({"backgroundMaskAlpha": val}, this);
  }

  /// Allows you to change the location of the custom status.
  ///
  /// For example, if you set the multiplier to 0.5 and the number of pixels
  /// by vertical is equal to 800, your message will be centralized and located
  /// at 200 px from the top, i.e. (800 / 2) * 0.5 = 200 px. If the multiplier
  /// is equal to 1, the message will be centered. If the multiplier is equal
  /// to zero, the default location will be used.
  ///
  /// Default: 1.
  double? get customStatusPositionMultiplier => _customStatusPositionMultiplier;
  double? _customStatusPositionMultiplier;
  set customStatusPositionMultiplier(double? val) {
    _customStatusPositionMultiplier = val;
    _setCustomization({"customStatusPositionMultiplier": val}, this);
  }

  /// Allows you to change the location of the hologram animation.
  ///
  /// For example, if you set the multiplier to 0.5 and the number of pixels
  /// by vertical is equal to 800, the animation will be centralized and located
  /// at 200 px from the top, i.e. (800 / 2) * 0.5 = 200 px. If the multiplier
  /// is set to 1, the animation will be centered. If the multiplier is
  /// set to 0, the default value will be used.
  ///
  /// Defaults to 1.
  double? get hologramAnimationPositionMultiplier =>
      _hologramAnimationPositionMultiplier;
  double? _hologramAnimationPositionMultiplier;
  set hologramAnimationPositionMultiplier(double? val) {
    _hologramAnimationPositionMultiplier = val;
    _setCustomization({"hologramAnimationPositionMultiplier": val}, this);
  }

  /// Allows you to change the location of the camera frame vertically.
  double? get cameraFrameVerticalPositionMultiplier =>
      _cameraFrameVerticalPositionMultiplier;
  double? _cameraFrameVerticalPositionMultiplier;
  set cameraFrameVerticalPositionMultiplier(double? val) {
    _cameraFrameVerticalPositionMultiplier = val;
    _setCustomization({"cameraFrameVerticalPositionMultiplier": val}, this);
  }

  /// Allows you to set an aspect ratio of the camera frame (landscape orientation).
  /// Default: 0.
  double? get cameraFrameLandscapeAspectRatio =>
      _cameraFrameLandscapeAspectRatio;
  double? _cameraFrameLandscapeAspectRatio;
  set cameraFrameLandscapeAspectRatio(double? val) {
    _cameraFrameLandscapeAspectRatio = val;
    _setCustomization({"cameraFrameLandscapeAspectRatio": val}, this);
  }

  /// Allows you to set an aspect ratio of the camera frame (portrait orientation).
  ///
  /// Default: 0.
  double? get cameraFramePortraitAspectRatio => _cameraFramePortraitAspectRatio;
  double? _cameraFramePortraitAspectRatio;
  set cameraFramePortraitAspectRatio(double? val) {
    _cameraFramePortraitAspectRatio = val;
    _setCustomization({"cameraFramePortraitAspectRatio": val}, this);
  }

  /// Allows you to set a corner radius of the camera frame.
  ///
  /// Default: 10.
  double? get cameraFrameCornerRadius => _cameraFrameCornerRadius;
  double? _cameraFrameCornerRadius;
  set cameraFrameCornerRadius(double? val) {
    _cameraFrameCornerRadius = val;
    _setCustomization({"cameraFrameCornerRadius": val}, this);
  }

  /// Allows you to set any image for the multipage animation (front side).
  Uint8List? get multipageAnimationFrontImage => _multipageAnimationFrontImage;
  Uint8List? _multipageAnimationFrontImage;
  set multipageAnimationFrontImage(Uint8List? val) {
    _multipageAnimationFrontImage = val;
    _setCustomization({"multipageAnimationFrontImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the multipage animation (back side).
  Uint8List? get multipageAnimationBackImage => _multipageAnimationBackImage;
  Uint8List? _multipageAnimationBackImage;
  set multipageAnimationBackImage(Uint8List? val) {
    _multipageAnimationBackImage = val;
    _setCustomization({"multipageAnimationBackImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image within the camera frame.
  Uint8List? get borderBackgroundImage => _borderBackgroundImage;
  Uint8List? _borderBackgroundImage;
  set borderBackgroundImage(Uint8List? val) {
    _borderBackgroundImage = val;
    _setCustomization({"borderBackgroundImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the help animation.
  Uint8List? get helpAnimationImage => _helpAnimationImage;
  Uint8List? _helpAnimationImage;
  set helpAnimationImage(Uint8List? val) {
    _helpAnimationImage = val;
    _setCustomization({"helpAnimationImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the close button.
  Uint8List? get closeButtonImage => _closeButtonImage;
  Uint8List? _closeButtonImage;
  set closeButtonImage(Uint8List? val) {
    _closeButtonImage = val;
    _setCustomization({"closeButtonImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the capture button.
  Uint8List? get captureButtonImage => _captureButtonImage;
  Uint8List? _captureButtonImage;
  set captureButtonImage(Uint8List? val) {
    _captureButtonImage = val;
    _setCustomization({"captureButtonImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the button that allows
  /// changing positions of the capture device.
  Uint8List? get cameraSwitchButtonImage => _cameraSwitchButtonImage;
  Uint8List? _cameraSwitchButtonImage;
  set cameraSwitchButtonImage(Uint8List? val) {
    _cameraSwitchButtonImage = val;
    _setCustomization({"cameraSwitchButtonImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the torch button when its state is ON.
  Uint8List? get torchButtonOnImage => _torchButtonOnImage;
  Uint8List? _torchButtonOnImage;
  set torchButtonOnImage(Uint8List? val) {
    _torchButtonOnImage = val;
    _setCustomization({"torchButtonOnImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the torch button when its state is OFF.
  Uint8List? get torchButtonOffImage => _torchButtonOffImage;
  Uint8List? _torchButtonOffImage;
  set torchButtonOffImage(Uint8List? val) {
    _torchButtonOffImage = val;
    _setCustomization({"torchButtonOffImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the button that allows changing
  /// shapes of the camera (expanded state).
  Uint8List? get changeFrameButtonExpandImage => _changeFrameButtonExpandImage;
  Uint8List? _changeFrameButtonExpandImage;
  set changeFrameButtonExpandImage(Uint8List? val) {
    _changeFrameButtonExpandImage = val;
    _setCustomization({"changeFrameButtonExpandImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the button that allows changing
  /// shapes of the camera (collapsed state).
  Uint8List? get changeFrameButtonCollapseImage =>
      _changeFrameButtonCollapseImage;
  Uint8List? _changeFrameButtonCollapseImage;
  set changeFrameButtonCollapseImage(Uint8List? val) {
    _changeFrameButtonCollapseImage = val;
    _setCustomization({"changeFrameButtonCollapseImage": _toBase64(val)}, this);
  }

  /// Allows you to set any image for the hologram animation.
  ///
  /// When set to `null` the default image will be used.
  /// This property can be set during the scanning process to tailor
  /// the user experiese for different types of documents.
  Uint8List? get hologramAnimationImage => _hologramAnimationImage;
  Uint8List? _hologramAnimationImage;
  set hologramAnimationImage(Uint8List? val) {
    _hologramAnimationImage = val;
    _setCustomization({"hologramAnimationImage": _toBase64(val)}, this);
  }

  /// Allows you to set a font for the status messages.
  Font? get statusTextFont => _statusTextFont;
  Font? _statusTextFont;
  set statusTextFont(Font? val) {
    _statusTextFont = val;
    _setCustomization({"statusTextFont": val?.toJson()}, this);
  }

  /// Allows you to set a font for the result status messages.
  Font? get resultStatusTextFont => _resultStatusTextFont;
  Font? _resultStatusTextFont;
  set resultStatusTextFont(Font? val) {
    _resultStatusTextFont = val;
    _setCustomization({"resultStatusTextFont": val?.toJson()}, this);
  }

  /// Allows you to create a custom status.
  String? get customLabelStatus => _customLabelStatus;
  String? _customLabelStatus;
  set customLabelStatus(String? val) {
    _customLabelStatus = val;
    _setCustomization({"customLabelStatus": val}, this);
  }

  /// Allows you to customize the beginning and ending of stroked lines
  /// of the camera frame.
  ///
  /// Default: [Cap.BUTT].
  Cap? get cameraFrameLineCap => _cameraFrameLineCap;
  Cap? _cameraFrameLineCap;
  set cameraFrameLineCap(Cap? val) {
    _cameraFrameLineCap = val;
    _setCustomization({"cameraFrameLineCap": val?.value}, this);
  }

  /// JSON structure defining labels and graphic elements
  /// to be added to the Camera UI
  dynamic get uiCustomizationLayer => _uiCustomizationLayer;
  dynamic _uiCustomizationLayer;
  set uiCustomizationLayer(dynamic val) {
    _uiCustomizationLayer = val;
    _setCustomization({"uiCustomizationLayer": val}, this);
  }

  /// Allows you to specify how a view of the help animation adjusts
  /// its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_ASPECT_FIT].
  ///
  /// IOS only. For Android use [helpAnimationImageTransformsAndroid].
  ViewContentMode? get helpAnimationImageTransformsIOS =>
      _helpAnimationImageTransformsIOS;
  ViewContentMode? _helpAnimationImageTransformsIOS;
  set helpAnimationImageTransformsIOS(ViewContentMode? val) {
    _helpAnimationImageTransformsIOS = val;
    _setCustomization({"helpAnimationImageContentMode": val?.value}, this);
  }

  /// Allows you to specify how a view of the multipage animation (front side)
  /// adjusts its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_TO_FILL].
  ///
  /// IOS only. For Android use [multipageAnimationFrontImageTransformsAndroid].
  ViewContentMode? get multipageAnimationFrontImageTransformsIOS =>
      _multipageAnimationFrontImageTransformsIOS;
  ViewContentMode? _multipageAnimationFrontImageTransformsIOS;
  set multipageAnimationFrontImageTransformsIOS(ViewContentMode? val) {
    _multipageAnimationFrontImageTransformsIOS = val;
    _setCustomization(
        {"multipageAnimationFrontImageContentMode": val?.value}, this);
  }

  /// Allows you to specify how a view of the multipage animation (back side)
  /// adjusts its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_TO_FILL].
  ///
  /// IOS only. For Android use [multipageAnimationBackImageTransformsAndroid].
  ViewContentMode? get multipageAnimationBackImageTransformsIOS =>
      _multipageAnimationBackImageTransformsIOS;
  ViewContentMode? _multipageAnimationBackImageTransformsIOS;
  set multipageAnimationBackImageTransformsIOS(ViewContentMode? val) {
    _multipageAnimationBackImageTransformsIOS = val;
    _setCustomization(
        {"multipageAnimationBackImageContentMode": val?.value}, this);
  }

  /// Allows you to specify how a view of the hologram animation
  /// adjusts its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_ASPECT_FIT].
  ///
  /// IOS only. For Android use [hologramAnimationImageTransformsAndroid].
  ViewContentMode? get hologramAnimationImageTransformsIOS =>
      _hologramAnimationImageTransformsIOS;
  ViewContentMode? _hologramAnimationImageTransformsIOS;
  set hologramAnimationImageTransformsIOS(ViewContentMode? val) {
    _hologramAnimationImageTransformsIOS = val;
    _setCustomization({"hologramAnimationImageContentMode": val?.value}, this);
  }

  /// Allows you to specify how a view within the camera frame adjusts
  /// its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_ASPECT_FIT].
  ///
  /// IOS only. For Android use [borderBackgroundImageTransformsAndroid].
  ViewContentMode? get borderBackgroundImageTransformsIOS =>
      _borderBackgroundImageTransformsIOS;
  ViewContentMode? _borderBackgroundImageTransformsIOS;
  set borderBackgroundImageTransformsIOS(ViewContentMode? val) {
    _borderBackgroundImageTransformsIOS = val;
    _setCustomization({"borderBackgroundImageContentMode": val?.value}, this);
  }

  /// Matrix used to scale help animation.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [helpAnimationImageTransformsIOS].
  List<double>? get helpAnimationImageTransformsAndroid =>
      _helpAnimationImageTransformsAndroid;
  List<double>? _helpAnimationImageTransformsAndroid;
  set helpAnimationImageTransformsAndroid(List<double>? val) {
    _helpAnimationImageTransformsAndroid = val;
    _setCustomization({"helpAnimationImageMatrix": val}, this);
  }

  /// Matrix used to scale multipage animation (front side).
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [multipageAnimationFrontImageTransformsIOS].
  List<double>? get multipageAnimationFrontImageTransformsAndroid =>
      _multipageAnimationFrontImageTransformsAndroid;
  List<double>? _multipageAnimationFrontImageTransformsAndroid;
  set multipageAnimationFrontImageTransformsAndroid(List<double>? val) {
    _multipageAnimationFrontImageTransformsAndroid = val;
    _setCustomization({"multipageAnimationFrontImageMatrix": val}, this);
  }

  /// Matrix used to scale multipage animation (back side).
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [multipageAnimationBackImageTransformsIOS].
  List<double>? get multipageAnimationBackImageTransformsAndroid =>
      _multipageAnimationBackImageTransformsAndroid;
  List<double>? _multipageAnimationBackImageTransformsAndroid;
  set multipageAnimationBackImageTransformsAndroid(List<double>? val) {
    _multipageAnimationBackImageTransformsAndroid = val;
    _setCustomization({"multipageAnimationBackImageMatrix": val}, this);
  }

  /// Matrix used to scale hologram animation.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [hologramAnimationImageTransformsIOS].
  List<double>? get hologramAnimationImageTransformsAndroid =>
      _hologramAnimationImageTransformsAndroid;
  List<double>? _hologramAnimationImageTransformsAndroid;
  set hologramAnimationImageTransformsAndroid(List<double>? val) {
    _hologramAnimationImageTransformsAndroid = val;
    _setCustomization({"hologramAnimationImageMatrix": val}, this);
  }

  /// Matrix used to scale the view within the camera frame.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [borderBackgroundImageTransformsIOS].
  List<double>? get borderBackgroundImageTransformsAndroid =>
      _borderBackgroundImageTransformsAndroid;
  List<double>? _borderBackgroundImageTransformsAndroid;
  set borderBackgroundImageTransformsAndroid(List<double>? val) {
    _borderBackgroundImageTransformsAndroid = val;
    _setCustomization({"borderBackgroundImageMatrix": val}, this);
  }

  /// Allows you to deserialize object.
  fromJson(Map<String, dynamic> jsonObject) {
    _showStatusMessages = jsonObject["showStatusMessages"];
    _showResultStatusMessages = jsonObject["showResultStatusMessages"];
    _showHelpAnimation = jsonObject["showHelpAnimation"];
    _showNextPageAnimation = jsonObject["showNextPageAnimation"];
    _showBackgroundMask = jsonObject["showBackgroundMask"];

    _cameraFrameBorderWidth = jsonObject["cameraFrameBorderWidth"];
    _cameraFrameLineLength = jsonObject["cameraFrameLineLength"];
    _cameraFrameShapeType =
        FrameShapeType.getByValue(jsonObject["cameraFrameShapeType"]);
    _cameraFrameOffsetWidth = jsonObject["cameraFrameOffsetWidth"];

    _status = jsonObject["status"];
    _resultStatus = jsonObject["resultStatus"];

    _cameraFrameDefaultColor =
        _intToColor(jsonObject["cameraFrameDefaultColor"]);
    _cameraFrameActiveColor = _intToColor(jsonObject["cameraFrameActiveColor"]);
    _statusTextColor = _intToColor(jsonObject["statusTextColor"]);
    _resultStatusTextColor = _intToColor(jsonObject["resultStatusTextColor"]);
    _resultStatusBackgroundColor =
        _intToColor(jsonObject["resultStatusBackgroundColor"]);
    _multipageButtonBackgroundColor =
        _intToColor(jsonObject["multipageButtonBackgroundColor"]);
    _tintColor = _intToColor(jsonObject["tintColor"]);
    _activityIndicatorColor = _intToColor(jsonObject["activityIndicatorColor"]);
    _statusBackgroundColor = _intToColor(jsonObject["statusBackgroundColor"]);
    _cameraPreviewBackgroundColor =
        _intToColor(jsonObject["cameraPreviewBackgroundColor"]);

    _statusPositionMultiplier =
        _toDouble(jsonObject["statusPositionMultiplier"]);
    _resultStatusPositionMultiplier =
        _toDouble(jsonObject["resultStatusPositionMultiplier"]);
    _toolbarSize = _toDouble(jsonObject["toolbarSize"]);
    _backgroundMaskAlpha = _toDouble(jsonObject["backgroundMaskAlpha"]);
    _customStatusPositionMultiplier =
        _toDouble(jsonObject["customStatusPositionMultiplier"]);
    _cameraFrameVerticalPositionMultiplier =
        _toDouble(jsonObject["cameraFrameVerticalPositionMultiplier"]);
    _cameraFrameLandscapeAspectRatio =
        _toDouble(jsonObject["cameraFrameLandscapeAspectRatio"]);
    _cameraFrameCornerRadius = _toDouble(jsonObject["cameraFrameCornerRadius"]);
    _cameraFramePortraitAspectRatio =
        _toDouble(jsonObject["cameraFramePortraitAspectRatio"]);
    _hologramAnimationPositionMultiplier =
        _toDouble(jsonObject["hologramAnimationPositionMultiplier"]);

    _multipageAnimationFrontImage =
        _fromBase64(jsonObject["multipageAnimationFrontImage"]);
    _multipageAnimationBackImage =
        _fromBase64(jsonObject["multipageAnimationBackImage"]);
    _borderBackgroundImage = _fromBase64(jsonObject["borderBackgroundImage"]);
    _helpAnimationImage = _fromBase64(jsonObject["helpAnimationImage"]);
    _closeButtonImage = _fromBase64(jsonObject["closeButtonImage"]);
    _captureButtonImage = _fromBase64(jsonObject["captureButtonImage"]);
    _cameraSwitchButtonImage =
        _fromBase64(jsonObject["cameraSwitchButtonImage"]);
    _torchButtonOnImage = _fromBase64(jsonObject["torchButtonOnImage"]);
    _torchButtonOffImage = _fromBase64(jsonObject["torchButtonOffImage"]);
    _changeFrameButtonExpandImage =
        _fromBase64(jsonObject["changeFrameButtonExpandImage"]);
    _changeFrameButtonCollapseImage =
        _fromBase64(jsonObject["changeFrameButtonCollapseImage"]);
    _hologramAnimationImage = _fromBase64(jsonObject["hologramAnimationImage"]);

    _customLabelStatus = jsonObject["customLabelStatus"];
    _cameraFrameLineCap = Cap.getByValue(jsonObject["cameraFrameLineCap"]);
    _uiCustomizationLayer = jsonObject["uiCustomizationLayer"];
    _statusTextFont = Font.fromJson(jsonObject["statusTextFont"]);
    _resultStatusTextFont = Font.fromJson(jsonObject["resultStatusTextFont"]);

    _helpAnimationImageTransformsIOS =
        ViewContentMode.getByValue(jsonObject["helpAnimationImageContentMode"]);
    _multipageAnimationFrontImageTransformsIOS = ViewContentMode.getByValue(
        jsonObject["multipageAnimationFrontImageContentMode"]);
    _multipageAnimationBackImageTransformsIOS = ViewContentMode.getByValue(
        jsonObject["multipageAnimationBackImageContentMode"]);
    _hologramAnimationImageTransformsIOS = ViewContentMode.getByValue(
        jsonObject["hologramAnimationImageContentMode"]);
    _borderBackgroundImageTransformsIOS = ViewContentMode.getByValue(
        jsonObject["borderBackgroundImageContentMode"]);

    if (jsonObject["helpAnimationImageMatrix"] != null) {
      _helpAnimationImageTransformsAndroid = [];
      for (var value in jsonObject["helpAnimationImageMatrix"])
        _helpAnimationImageTransformsAndroid!.add(value.toDouble());
    } else
      _helpAnimationImageTransformsAndroid = null;
    if (jsonObject["multipageAnimationFrontImageMatrix"] != null) {
      _multipageAnimationFrontImageTransformsAndroid = [];
      for (var value in jsonObject["multipageAnimationFrontImageMatrix"])
        _multipageAnimationFrontImageTransformsAndroid!.add(value.toDouble());
    } else
      _multipageAnimationFrontImageTransformsAndroid = null;
    if (jsonObject["multipageAnimationBackImageMatrix"] != null) {
      _multipageAnimationBackImageTransformsAndroid = [];
      for (var value in jsonObject["multipageAnimationBackImageMatrix"])
        _multipageAnimationBackImageTransformsAndroid!.add(value.toDouble());
    } else
      _multipageAnimationBackImageTransformsAndroid = null;
    if (jsonObject["hologramAnimationImageMatrix"] != null) {
      _hologramAnimationImageTransformsAndroid = [];
      for (var value in jsonObject["hologramAnimationImageMatrix"])
        _hologramAnimationImageTransformsAndroid!.add(value.toDouble());
    } else
      _hologramAnimationImageTransformsAndroid = null;
    if (jsonObject["borderBackgroundImageMatrix"] != null) {
      _borderBackgroundImageTransformsAndroid = [];
      for (var value in jsonObject["borderBackgroundImageMatrix"])
        _borderBackgroundImageTransformsAndroid!.add(value.toDouble());
    } else
      _borderBackgroundImageTransformsAndroid = null;

    return this;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "showStatusMessages": showStatusMessages,
        "showResultStatusMessages": showResultStatusMessages,
        "showHelpAnimation": showHelpAnimation,
        "showNextPageAnimation": showNextPageAnimation,
        "showBackgroundMask": showBackgroundMask,
        "cameraFrameBorderWidth": cameraFrameBorderWidth,
        "cameraFrameLineLength": cameraFrameLineLength,
        "cameraFrameShapeType": cameraFrameShapeType?.value,
        "cameraFrameOffsetWidth": cameraFrameOffsetWidth,
        "status": status,
        "resultStatus": resultStatus,
        "cameraFrameDefaultColor": _intFromColor(cameraFrameDefaultColor),
        "cameraFrameActiveColor": _intFromColor(cameraFrameActiveColor),
        "statusTextColor": _intFromColor(statusTextColor),
        "resultStatusTextColor": _intFromColor(resultStatusTextColor),
        "resultStatusBackgroundColor":
            _intFromColor(resultStatusBackgroundColor),
        "multipageButtonBackgroundColor":
            _intFromColor(multipageButtonBackgroundColor),
        "tintColor": _intFromColor(tintColor),
        "activityIndicatorColor": _intFromColor(activityIndicatorColor),
        "statusBackgroundColor": _intFromColor(statusBackgroundColor),
        "cameraPreviewBackgroundColor":
            _intFromColor(cameraPreviewBackgroundColor),
        "statusPositionMultiplier": statusPositionMultiplier,
        "resultStatusPositionMultiplier": resultStatusPositionMultiplier,
        "toolbarSize": toolbarSize,
        "backgroundMaskAlpha": backgroundMaskAlpha,
        "customStatusPositionMultiplier": customStatusPositionMultiplier,
        "cameraFrameVerticalPositionMultiplier":
            cameraFrameVerticalPositionMultiplier,
        "cameraFrameLandscapeAspectRatio": cameraFrameLandscapeAspectRatio,
        "cameraFramePortraitAspectRatio": cameraFramePortraitAspectRatio,
        "cameraFrameCornerRadius": cameraFrameCornerRadius,
        "hologramAnimationPositionMultiplier":
            hologramAnimationPositionMultiplier,
        "multipageAnimationFrontImage": _toBase64(multipageAnimationFrontImage),
        "multipageAnimationBackImage": _toBase64(multipageAnimationBackImage),
        "borderBackgroundImage": _toBase64(borderBackgroundImage),
        "helpAnimationImage": _toBase64(helpAnimationImage),
        "closeButtonImage": _toBase64(closeButtonImage),
        "captureButtonImage": _toBase64(captureButtonImage),
        "cameraSwitchButtonImage": _toBase64(cameraSwitchButtonImage),
        "torchButtonOnImage": _toBase64(torchButtonOnImage),
        "torchButtonOffImage": _toBase64(torchButtonOffImage),
        "changeFrameButtonExpandImage": _toBase64(changeFrameButtonExpandImage),
        "changeFrameButtonCollapseImage":
            _toBase64(changeFrameButtonCollapseImage),
        "hologramAnimationImage": _toBase64(hologramAnimationImage),
        "customLabelStatus": customLabelStatus,
        "cameraFrameLineCap": cameraFrameLineCap?.value,
        "uiCustomizationLayer": uiCustomizationLayer,
        "statusTextFont": statusTextFont?.toJson(),
        "resultStatusTextFont": resultStatusTextFont?.toJson(),
        "helpAnimationImageContentMode": helpAnimationImageTransformsIOS?.value,
        "multipageAnimationFrontImageContentMode":
            multipageAnimationFrontImageTransformsIOS?.value,
        "multipageAnimationBackImageContentMode":
            multipageAnimationBackImageTransformsIOS?.value,
        "hologramAnimationImageContentMode":
            hologramAnimationImageTransformsIOS?.value,
        "borderBackgroundImageContentMode":
            borderBackgroundImageTransformsIOS?.value,
        "helpAnimationImageMatrix": helpAnimationImageTransformsAndroid,
        "multipageAnimationFrontImageMatrix":
            multipageAnimationFrontImageTransformsAndroid,
        "multipageAnimationBackImageMatrix":
            multipageAnimationBackImageTransformsAndroid,
        "hologramAnimationImageMatrix": hologramAnimationImageTransformsAndroid,
        "borderBackgroundImageMatrix": borderBackgroundImageTransformsAndroid,
      };

  static _setCustomization(
    Map<String, dynamic> json,
    Customization instance,
  ) {
    if (identical(instance, DocumentReader.instance.customization))
      _bridge.invokeMethod("setCustomization", [json]);
  }

  Future<void> _sync() async {
    String response = await _bridge.invokeMethod("getCustomization", []);
    this.fromJson(_decode(response));
  }

  _apply() => _setCustomization(this.toJson(), this);
}

enum Cap {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  BUTT(0),

  ROUND(1),

  SQUARE(2);

  const Cap(this.value);
  final int value;

  static Cap? getByValue(int? i) {
    if (i == null) return null;
    try {
      return Cap.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return Cap.UNKNOWN;
    }
  }
}

enum FrameShapeType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Camera frame is rectangle.
  LINE(0),

  /// Camera frame only consists of corners of the rectangle.
  CORNER(1);

  const FrameShapeType(this.value);
  final int value;

  static FrameShapeType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return FrameShapeType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return FrameShapeType.UNKNOWN;
    }
  }
}

/// Clone of iOS native enum `UIViewContentMode`
enum ViewContentMode {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  SCALE_TO_FILL(0),

  /// Contents scaled to fit with fixed aspect. remainder is transparent.
  SCALE_ASPECT_FIT(1),

  /// Contents scaled to fill with fixed aspect. some portion of content may be clipped.
  SCALE_ASPECT_FILL(2),

  /// redraw on bounds change (calls -setNeedsDisplay).
  REDRAW(3),

  /// contents remain same size. positioned adjusted.
  CENTER(4),

  TOP(5),

  BOTTOM(6),

  LEFT(7),

  RIGHT(8),

  TOP_LEFT(9),

  TOP_RIGHT(10),

  BOTTOM_LEFT(11),

  BOTTOM_RIGHT(12);

  const ViewContentMode(this.value);
  final int value;

  static ViewContentMode? getByValue(int? i) {
    if (i == null) return null;
    try {
      return ViewContentMode.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return ViewContentMode.UNKNOWN;
    }
  }
}

class Font {
  // Font family.
  String name;

  // Font size.
  int? size;

  // Font style.
  //
  // Android only.
  FontStyle? style;

  Font(this.name);

  /// Allows you to deserialize object.
  static Font? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = new Font(jsonObject["name"]);
    result.size = jsonObject["size"];
    result.style = FontStyle.getByValue(jsonObject["style"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "name": name,
        "size": size,
        "style": style?.value,
      };
}

enum FontStyle {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  NORMAL(0),

  BOLD(1),

  ITALIC(2),

  BOLD_ITALIC(3);

  const FontStyle(this.value);
  final int value;

  static FontStyle? getByValue(int? i) {
    if (i == null) return null;
    try {
      return FontStyle.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return FontStyle.UNKNOWN;
    }
  }
}

///  Button tags for UI customization.
enum CustomButtonTag {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  CLOSE(1001),

  TORCH(1002),

  CAPTURE(1003),

  CHANGE_FRAME(1004),

  SKIP(1005),

  CAMERA_SWITCH(1006);

  const CustomButtonTag(this.value);
  final int value;

  static CustomButtonTag? getByValue(int? i) {
    if (i == null) return null;
    try {
      return CustomButtonTag.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return CustomButtonTag.UNKNOWN;
    }
  }
}
