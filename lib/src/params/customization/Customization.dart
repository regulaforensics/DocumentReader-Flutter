//
//  Customization.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

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
    _set({"showStatusMessages": val});
  }

  /// If it's set to `true`, result status messages during the document processing
  /// will be shown.
  ///
  /// Default: `true`.
  @Deprecated("Not used in new UI")
  bool? get showResultStatusMessages => _showResultStatusMessages;
  bool? _showResultStatusMessages;
  set showResultStatusMessages(bool? val) {
    _showResultStatusMessages = val;
    _set({"showResultStatusMessages": val});
  }

  /// If it's set to `true`, the animation showing how to position a document
  /// will be displayed.
  ///
  /// Default: `false`.
  bool? get showHelpAnimation => _showHelpAnimation;
  bool? _showHelpAnimation;
  set showHelpAnimation(bool? val) {
    _showHelpAnimation = val;
    _set({"showHelpAnimation": val});
  }

  /// If it's set to `true`, the animation asking for processing
  /// the next page will be displayed.
  ///
  /// Default: `true`.
  bool? get showNextPageAnimation => _showNextPageAnimation;
  bool? _showNextPageAnimation;
  set showNextPageAnimation(bool? val) {
    _showNextPageAnimation = val;
    _set({"showNextPageAnimation": val});
  }

  /// If it's set to `true`, the background mask next to the camera frame
  /// will be displayed.
  ///
  /// Default: `true`.
  bool? get showBackgroundMask => _showBackgroundMask;
  bool? _showBackgroundMask;
  set showBackgroundMask(bool? val) {
    _showBackgroundMask = val;
    _set({"showBackgroundMask": val});
  }

  /// Allows you to set thickness of the camera frame borders.
  ///
  /// Default: 3.
  int? get cameraFrameBorderWidth => _cameraFrameBorderWidth;
  int? _cameraFrameBorderWidth;
  set cameraFrameBorderWidth(int? val) {
    _cameraFrameBorderWidth = val;
    _set({"cameraFrameBorderWidth": val});
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
    _set({"cameraFrameLineLength": val});
  }

  /// Allows you to set an offset for the camera frame (portrait orientation).
  ///
  /// Default: 23.
  int? get cameraFrameOffsetWidth => _cameraFrameOffsetWidth;
  int? _cameraFrameOffsetWidth;
  set cameraFrameOffsetWidth(int? val) {
    _cameraFrameOffsetWidth = val;
    _set({"cameraFrameOffsetWidth": val});
  }

  /// Allows you to set a shape type for the camera frame.
  ///
  /// Default: [FrameShapeType.LINE].
  FrameShapeType? get cameraFrameShapeType => _cameraFrameShapeType;
  FrameShapeType? _cameraFrameShapeType;
  set cameraFrameShapeType(FrameShapeType? val) {
    _cameraFrameShapeType = val;
    _set({"cameraFrameShapeType": val?.value});
  }

  /// Allows you to set any string to the status.
  String? get status => _status;
  String? _status;
  set status(String? val) {
    _status = val;
    _set({"status": val});
  }

  /// Allows you to set any string to the result status.
  @Deprecated("Not used in new UI")
  String? get resultStatus => _resultStatus;
  String? _resultStatus;
  set resultStatus(String? val) {
    _resultStatus = val;
    _set({"resultStatus": val});
  }

  String? get multipageButtonText => _multipageButtonText;
  String? _multipageButtonText;
  set multipageButtonText(String? val) {
    _multipageButtonText = val;
    _set({"multipageButtonText": val});
  }

  /// Allows you to set a color for the camera frame when a document is out
  /// of the camera frame or is not detected.
  ///
  /// Default: Colors.white.
  Color? get cameraFrameDefaultColor => _cameraFrameDefaultColor;
  Color? _cameraFrameDefaultColor;
  set cameraFrameDefaultColor(Color? val) {
    _cameraFrameDefaultColor = val;
    _set({"cameraFrameDefaultColor": _intFromColor(val)});
  }

  /// Allows you to set a color for the camera frame when a document is detected.
  ///
  /// Default: Colors.green.
  Color? get cameraFrameActiveColor => _cameraFrameActiveColor;
  Color? _cameraFrameActiveColor;
  set cameraFrameActiveColor(Color? val) {
    _cameraFrameActiveColor = val;
    _set({"cameraFrameActiveColor": _intFromColor(val)});
  }

  /// Allows you to set a color for the status messages.
  ///
  /// Default: Colors.white.
  Color? get statusTextColor => _statusTextColor;
  Color? _statusTextColor;
  set statusTextColor(Color? val) {
    _statusTextColor = val;
    _set({"statusTextColor": _intFromColor(val)});
  }

  /// Allows you to set a color for the result status messages.
  ///
  /// Default: Colors.white.
  @Deprecated("Not used in new UI")
  Color? get resultStatusTextColor => _resultStatusTextColor;
  Color? _resultStatusTextColor;
  set resultStatusTextColor(Color? val) {
    _resultStatusTextColor = val;
    _set({"resultStatusTextColor": _intFromColor(val)});
  }

  /// Allows you to set a color of the background for the result status messages.
  @Deprecated("Not used in new UI")
  Color? get resultStatusBackgroundColor => _resultStatusBackgroundColor;
  Color? _resultStatusBackgroundColor;
  set resultStatusBackgroundColor(Color? val) {
    _resultStatusBackgroundColor = val;
    _set({"resultStatusBackgroundColor": _intFromColor(val)});
  }

  /// Allows you to set a color for the "Skip next page" button.
  Color? get multipageButtonBackgroundColor => _multipageButtonBackgroundColor;
  Color? _multipageButtonBackgroundColor;
  set multipageButtonBackgroundColor(Color? val) {
    _multipageButtonBackgroundColor = val;
    _set({"multipageButtonBackgroundColor": _intFromColor(val)});
  }

  /// Allows you to set a color for all visual elements.
  Color? get tintColor => _tintColor;
  Color? _tintColor;
  set tintColor(Color? val) {
    _tintColor = val;
    _set({"tintColor": _intFromColor(val)});
  }

  /// Allows you to set a color for the activity indicator.
  Color? get activityIndicatorColor => _activityIndicatorColor;
  Color? _activityIndicatorColor;
  set activityIndicatorColor(Color? val) {
    _activityIndicatorColor = val;
    _set({"activityIndicatorColor": _intFromColor(val)});
  }

  /// Allows you to set a background color for the status messages.
  ///
  /// Default: Colors.transparent.
  Color? get statusBackgroundColor => _statusBackgroundColor;
  Color? _statusBackgroundColor;
  set statusBackgroundColor(Color? val) {
    _statusBackgroundColor = val;
    _set({"statusBackgroundColor": _intFromColor(val)});
  }

  /// Allows you to set a background color for the camera preview
  /// (top and bottom frames).
  ///
  /// Default: Colors.black.
  Color? get cameraPreviewBackgroundColor => _cameraPreviewBackgroundColor;
  Color? _cameraPreviewBackgroundColor;
  set cameraPreviewBackgroundColor(Color? val) {
    _cameraPreviewBackgroundColor = val;
    _set({"cameraPreviewBackgroundColor": _intFromColor(val)});
  }

  /// Allows you to set color for background mask area.
  Color? get backgroundMaskColor => _backgroundMaskColor;
  Color? _backgroundMaskColor;
  set backgroundMaskColor(Color? val) {
    _backgroundMaskColor = val;
    _set({"backgroundMaskColor": _intFromColor(val)});
  }

  Color? get multipageButtonTextColor => _multipageButtonTextColor;
  Color? _multipageButtonTextColor;
  set multipageButtonTextColor(Color? val) {
    _multipageButtonTextColor = val;
    _set({"multipageButtonTextColor": _intFromColor(val)});
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
    _set({"statusPositionMultiplier": val});
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
  @Deprecated("Not used in new UI")
  double? get resultStatusPositionMultiplier => _resultStatusPositionMultiplier;
  double? _resultStatusPositionMultiplier;
  set resultStatusPositionMultiplier(double? val) {
    _resultStatusPositionMultiplier = val;
    _set({"resultStatusPositionMultiplier": val});
  }

  /// Allows you to set a size for the toolbar
  /// (it's where all buttons are located).
  double? get toolbarSize => _toolbarSize;
  double? _toolbarSize;
  set toolbarSize(double? val) {
    _toolbarSize = val;
    _set({"toolbarSize": val});
  }

  /// Allows you to set intensity of the background mask.
  ///
  /// Default: 1.0.
  double? get backgroundMaskAlpha => _backgroundMaskAlpha;
  double? _backgroundMaskAlpha;
  set backgroundMaskAlpha(double? val) {
    _backgroundMaskAlpha = val;
    _set({"backgroundMaskAlpha": val});
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
    _set({"customStatusPositionMultiplier": val});
  }

  /// Allows you to change the location of the camera frame vertically. Default: 1.
  double? get cameraFrameVerticalPositionMultiplier =>
      _cameraFrameVerticalPositionMultiplier;
  double? _cameraFrameVerticalPositionMultiplier;
  set cameraFrameVerticalPositionMultiplier(double? val) {
    _cameraFrameVerticalPositionMultiplier = val;
    _set({"cameraFrameVerticalPositionMultiplier": val});
  }

  /// Allows you to set an aspect ratio of the camera frame (landscape orientation).
  /// Default: 0.
  double? get cameraFrameLandscapeAspectRatio =>
      _cameraFrameLandscapeAspectRatio;
  double? _cameraFrameLandscapeAspectRatio;
  set cameraFrameLandscapeAspectRatio(double? val) {
    _cameraFrameLandscapeAspectRatio = val;
    _set({"cameraFrameLandscapeAspectRatio": val});
  }

  /// Allows you to set an aspect ratio of the camera frame (portrait orientation).
  ///
  /// Default: 0.
  double? get cameraFramePortraitAspectRatio => _cameraFramePortraitAspectRatio;
  double? _cameraFramePortraitAspectRatio;
  set cameraFramePortraitAspectRatio(double? val) {
    _cameraFramePortraitAspectRatio = val;
    _set({"cameraFramePortraitAspectRatio": val});
  }

  /// Allows you to set a corner radius of the camera frame.
  ///
  /// Default: 10.
  double? get cameraFrameCornerRadius => _cameraFrameCornerRadius;
  double? _cameraFrameCornerRadius;
  set cameraFrameCornerRadius(double? val) {
    _cameraFrameCornerRadius = val;
    _set({"cameraFrameCornerRadius": val});
  }

  /// Allows you to change the location of the liveness animation.
  ///
  /// For example, if you set the multiplier to 0.5 and the number of pixels
  /// by vertical is equal to 800, the animation will be centralized and located
  /// at 200 px from the top, i.e. (800 / 2) * 0.5 = 200 px. If the multiplier
  /// is set to 1, the animation will be centered. If the multiplier is
  /// set to 0, the default value will be used.
  ///
  /// Defaults to 1.
  double? get livenessAnimationPositionMultiplier =>
      _livenessAnimationPositionMultiplier;
  double? _livenessAnimationPositionMultiplier;
  set livenessAnimationPositionMultiplier(double? val) {
    _livenessAnimationPositionMultiplier = val;
    _set({"livenessAnimationPositionMultiplier": val});
  }

  /// Animation delay before flip.
  ///
  /// Default: 0.
  double? get nextPageAnimationStartDelay => _nextPageAnimationStartDelay;
  double? _nextPageAnimationStartDelay;
  set nextPageAnimationStartDelay(double? val) {
    _nextPageAnimationStartDelay = val;
    _set({"nextPageAnimationStartDelay": val});
  }

  /// Animation delay after flip.
  ///
  /// Default: 0.
  double? get nextPageAnimationEndDelay => _nextPageAnimationEndDelay;
  double? _nextPageAnimationEndDelay;
  set nextPageAnimationEndDelay(double? val) {
    _nextPageAnimationEndDelay = val;
    _set({"nextPageAnimationEndDelay": val});
  }

  /// Allows you to set an offset for the activity indicator (portrait orientation).
  /// If not set, activity indicator always centered in the camera border.
  double? get activityIndicatorPortraitPositionMultiplier =>
      _activityIndicatorPortraitPositionMultiplier;
  double? _activityIndicatorPortraitPositionMultiplier;
  set activityIndicatorPortraitPositionMultiplier(double? val) {
    _activityIndicatorPortraitPositionMultiplier = val;
    _set({"activityIndicatorPortraitPositionMultiplier": val});
  }

  /// Allows you to set an offset for the activity indicator (landscape orientation).
  /// If not set, activity indicator always centered in the camera border.
  double? get activityIndicatorLandscapePositionMultiplier =>
      _activityIndicatorLandscapePositionMultiplier;
  double? _activityIndicatorLandscapePositionMultiplier;
  set activityIndicatorLandscapePositionMultiplier(double? val) {
    _activityIndicatorLandscapePositionMultiplier = val;
    _set({"activityIndicatorLandscapePositionMultiplier": val});
  }

  /// Allows you to change the vertical offset of the camera preview layer.
  /// If you need to raise the layer 50% of its height up, then you specify 0.5.
  /// If you need to lower the layer 75% of its height, then enter 1.75.
  /// Valid values: from 0 (the layer will be raised completely up) to 2 (the layer will be completely lowered down).
  double? get cameraPreviewVerticalPositionMultiplier =>
      _cameraPreviewVerticalPositionMultiplier;
  double? _cameraPreviewVerticalPositionMultiplier;
  set cameraPreviewVerticalPositionMultiplier(double? val) {
    _cameraPreviewVerticalPositionMultiplier = val;
    _set({"cameraPreviewVerticalPositionMultiplier": val});
  }

  /// Allows you to change the location of the multipage button.
  double? get multipageButtonPositionMultiplier =>
      _multipageButtonPositionMultiplier;
  double? _multipageButtonPositionMultiplier;
  set multipageButtonPositionMultiplier(double? val) {
    _multipageButtonPositionMultiplier = val;
    _set({"multipageButtonPositionMultiplier": val});
  }

  /// Allows you to set any image for the multipage animation (front side).
  ByteData? get multipageAnimationFrontImage => _multipageAnimationFrontImage;
  ByteData? _multipageAnimationFrontImage;
  set multipageAnimationFrontImage(ByteData? val) {
    _multipageAnimationFrontImage = val;
    _set({"multipageAnimationFrontImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the multipage animation (back side).
  ByteData? get multipageAnimationBackImage => _multipageAnimationBackImage;
  ByteData? _multipageAnimationBackImage;
  set multipageAnimationBackImage(ByteData? val) {
    _multipageAnimationBackImage = val;
    _set({"multipageAnimationBackImage": _dataToBase64(val)});
  }

  /// Allows you to set any image within the camera frame.
  ByteData? get borderBackgroundImage => _borderBackgroundImage;
  ByteData? _borderBackgroundImage;
  set borderBackgroundImage(ByteData? val) {
    _borderBackgroundImage = val;
    _set({"borderBackgroundImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the help animation.
  ByteData? get helpAnimationImage => _helpAnimationImage;
  ByteData? _helpAnimationImage;
  set helpAnimationImage(ByteData? val) {
    _helpAnimationImage = val;
    _set({"helpAnimationImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the close button.
  ByteData? get closeButtonImage => _closeButtonImage;
  ByteData? _closeButtonImage;
  set closeButtonImage(ByteData? val) {
    _closeButtonImage = val;
    _set({"closeButtonImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the capture button.
  ByteData? get captureButtonImage => _captureButtonImage;
  ByteData? _captureButtonImage;
  set captureButtonImage(ByteData? val) {
    _captureButtonImage = val;
    _set({"captureButtonImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the button that allows
  /// changing positions of the capture device.
  ByteData? get cameraSwitchButtonImage => _cameraSwitchButtonImage;
  ByteData? _cameraSwitchButtonImage;
  set cameraSwitchButtonImage(ByteData? val) {
    _cameraSwitchButtonImage = val;
    _set({"cameraSwitchButtonImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the torch button when its state is ON.
  ByteData? get torchButtonOnImage => _torchButtonOnImage;
  ByteData? _torchButtonOnImage;
  set torchButtonOnImage(ByteData? val) {
    _torchButtonOnImage = val;
    _set({"torchButtonOnImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the torch button when its state is OFF.
  ByteData? get torchButtonOffImage => _torchButtonOffImage;
  ByteData? _torchButtonOffImage;
  set torchButtonOffImage(ByteData? val) {
    _torchButtonOffImage = val;
    _set({"torchButtonOffImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the button that allows changing
  /// shapes of the camera (expanded state).
  @Deprecated("Not used in new UI")
  ByteData? get changeFrameButtonExpandImage => _changeFrameButtonExpandImage;
  ByteData? _changeFrameButtonExpandImage;
  set changeFrameButtonExpandImage(ByteData? val) {
    _changeFrameButtonExpandImage = val;
    _set({"changeFrameButtonExpandImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the button that allows changing
  /// shapes of the camera (collapsed state).
  @Deprecated("Not used in new UI")
  ByteData? get changeFrameButtonCollapseImage =>
      _changeFrameButtonCollapseImage;
  ByteData? _changeFrameButtonCollapseImage;
  set changeFrameButtonCollapseImage(ByteData? val) {
    _changeFrameButtonCollapseImage = val;
    _set({"changeFrameButtonCollapseImage": _dataToBase64(val)});
  }

  /// Allows you to set any image for the liveness animation.
  ///
  /// When set to `null` the default image will be used.
  /// This property can be set during the scanning process to tailor
  /// the user experiese for different types of documents.
  ByteData? get livenessAnimationImage => _livenessAnimationImage;
  ByteData? _livenessAnimationImage;
  set livenessAnimationImage(ByteData? val) {
    _livenessAnimationImage = val;
    _set({"livenessAnimationImage": _dataToBase64(val)});
  }

  /// Allows you to set any UIImage for the "Skip next page" button.
  ByteData? get multipageButtonImage => _multipageButtonImage;
  ByteData? _multipageButtonImage;
  set multipageButtonImage(ByteData? val) {
    _multipageButtonImage = val;
    _set({"multipageButtonImage": _dataToBase64(val)});
  }

  /// Allows you to set a font for the status messages.
  Font? get statusTextFont => _statusTextFont;
  Font? _statusTextFont;
  set statusTextFont(Font? val) {
    _statusTextFont = val;
    _set({"statusTextFont": val?.toJson()});
  }

  /// Allows you to set a font for the result status messages.
  @Deprecated("Not used in new UI")
  Font? get resultStatusTextFont => _resultStatusTextFont;
  Font? _resultStatusTextFont;
  set resultStatusTextFont(Font? val) {
    _resultStatusTextFont = val;
    _set({"resultStatusTextFont": val?.toJson()});
  }

  Font? get multipageButtonTextFont => _multipageButtonTextFont;
  Font? _multipageButtonTextFont;
  set multipageButtonTextFont(Font? val) {
    _multipageButtonTextFont = val;
    _set({"multipageButtonTextFont": val?.toJson()});
  }

  /// Allows you to create a custom status.
  String? get customLabelStatus => _customLabelStatus;
  String? _customLabelStatus;
  set customLabelStatus(String? val) {
    _customLabelStatus = val;
    _set({"customLabelStatus": val});
  }

  /// Allows you to customize the beginning and ending of stroked lines
  /// of the camera frame.
  ///
  /// Default: [Cap.BUTT].
  Cap? get cameraFrameLineCap => _cameraFrameLineCap;
  Cap? _cameraFrameLineCap;
  set cameraFrameLineCap(Cap? val) {
    _cameraFrameLineCap = val;
    _set({"cameraFrameLineCap": val?.value});
  }

  /// JSON structure defining labels and graphic elements
  /// to be added to the Camera UI.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  Map<String, dynamic>? get uiCustomizationLayer => _uiCustomizationLayer;
  Map<String, dynamic>? _uiCustomizationLayer;
  set uiCustomizationLayer(Map<String, dynamic>? val) {
    if (val != null) val = Map.unmodifiable(val);
    _uiCustomizationLayer = val;
    _set({"uiCustomizationLayer": val});
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
    _set({"helpAnimationImageContentMode": val?.value});
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
    _set({"multipageAnimationFrontImageContentMode": val?.value});
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
    _set({"multipageAnimationBackImageContentMode": val?.value});
  }

  /// Allows you to specify how a view of the liveness animation
  /// adjusts its content when its size changes.
  ///
  /// Default: [ViewContentMode.SCALE_ASPECT_FIT].
  ///
  /// IOS only. For Android use [livenessAnimationImageTransformsAndroid].
  ViewContentMode? get livenessAnimationImageTransformsIOS =>
      _livenessAnimationImageTransformsIOS;
  ViewContentMode? _livenessAnimationImageTransformsIOS;
  set livenessAnimationImageTransformsIOS(ViewContentMode? val) {
    _livenessAnimationImageTransformsIOS = val;
    _set({"livenessAnimationImageContentMode": val?.value});
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
    _set({"borderBackgroundImageContentMode": val?.value});
  }

  /// Matrix used to scale help animation.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [helpAnimationImageTransformsIOS].
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<double>? get helpAnimationImageTransformsAndroid =>
      _helpAnimationImageTransformsAndroid;
  List<double>? _helpAnimationImageTransformsAndroid;
  set helpAnimationImageTransformsAndroid(List<double>? val) {
    if (val != null) val = List.unmodifiable(val);
    _helpAnimationImageTransformsAndroid = val;
    _set({"helpAnimationImageMatrix": val});
  }

  /// Matrix used to scale multipage animation (front side).
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [multipageAnimationFrontImageTransformsIOS].
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<double>? get multipageAnimationFrontImageTransformsAndroid =>
      _multipageAnimationFrontImageTransformsAndroid;
  List<double>? _multipageAnimationFrontImageTransformsAndroid;
  set multipageAnimationFrontImageTransformsAndroid(List<double>? val) {
    if (val != null) val = List.unmodifiable(val);
    _multipageAnimationFrontImageTransformsAndroid = val;
    _set({"multipageAnimationFrontImageMatrix": val});
  }

  /// Matrix used to scale multipage animation (back side).
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [multipageAnimationBackImageTransformsIOS].
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<double>? get multipageAnimationBackImageTransformsAndroid =>
      _multipageAnimationBackImageTransformsAndroid;
  List<double>? _multipageAnimationBackImageTransformsAndroid;
  set multipageAnimationBackImageTransformsAndroid(List<double>? val) {
    if (val != null) val = List.unmodifiable(val);
    _multipageAnimationBackImageTransformsAndroid = val;
    _set({"multipageAnimationBackImageMatrix": val});
  }

  /// Matrix used to scale liveness animation.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [livenessAnimationImageTransformsIOS].
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<double>? get livenessAnimationImageTransformsAndroid =>
      _livenessAnimationImageTransformsAndroid;
  List<double>? _livenessAnimationImageTransformsAndroid;
  set livenessAnimationImageTransformsAndroid(List<double>? val) {
    if (val != null) val = List.unmodifiable(val);
    _livenessAnimationImageTransformsAndroid = val;
    _set({"livenessAnimationImageMatrix": val});
  }

  /// Matrix used to scale the view within the camera frame.
  ///
  /// Android class `android.graphics.Matrix`.
  /// Passed as `Matrix.setValues()`
  ///
  /// Android only. For iOS use [borderBackgroundImageTransformsIOS].
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  List<double>? get borderBackgroundImageTransformsAndroid =>
      _borderBackgroundImageTransformsAndroid;
  List<double>? _borderBackgroundImageTransformsAndroid;
  set borderBackgroundImageTransformsAndroid(List<double>? val) {
    if (val != null) val = List.unmodifiable(val);
    _borderBackgroundImageTransformsAndroid = val;
    _set({"borderBackgroundImageMatrix": val});
  }

  CustomizationColors get colors => _colors;
  CustomizationColors _colors = CustomizationColors();
  set colors(CustomizationColors val) {
    (_colors = val)._apply(this);
  }

  CustomizationFonts get fonts => _fonts;
  CustomizationFonts _fonts = CustomizationFonts();
  set fonts(CustomizationFonts val) {
    (_fonts = val)._apply(this);
  }

  CustomizationImages get images => _images;
  CustomizationImages _images = CustomizationImages();
  set images(CustomizationImages val) {
    (_images = val)._apply(this);
  }

  /// Allows you to deserialize object.
  static Customization fromJson(jsonObject) {
    var result = Customization();
    result.testSetters = {};

    result.showStatusMessages = jsonObject["showStatusMessages"];
    result.showResultStatusMessages = jsonObject["showResultStatusMessages"];
    result.showHelpAnimation = jsonObject["showHelpAnimation"];
    result.showNextPageAnimation = jsonObject["showNextPageAnimation"];
    result.showBackgroundMask = jsonObject["showBackgroundMask"];

    result.cameraFrameBorderWidth = jsonObject["cameraFrameBorderWidth"];
    result.cameraFrameLineLength = jsonObject["cameraFrameLineLength"];
    result.cameraFrameShapeType = FrameShapeType.getByValue(
      jsonObject["cameraFrameShapeType"],
    );
    result.cameraFrameOffsetWidth = jsonObject["cameraFrameOffsetWidth"];

    result.status = jsonObject["status"];
    result.resultStatus = jsonObject["resultStatus"];
    result.multipageButtonText = jsonObject["multipageButtonText"];

    result.cameraFrameDefaultColor = _intToColor(
      jsonObject["cameraFrameDefaultColor"],
    );
    result.cameraFrameActiveColor = _intToColor(
      jsonObject["cameraFrameActiveColor"],
    );
    result.statusTextColor = _intToColor(jsonObject["statusTextColor"]);
    result.resultStatusTextColor = _intToColor(
      jsonObject["resultStatusTextColor"],
    );
    result.resultStatusBackgroundColor = _intToColor(
      jsonObject["resultStatusBackgroundColor"],
    );
    result.multipageButtonBackgroundColor = _intToColor(
      jsonObject["multipageButtonBackgroundColor"],
    );
    result.tintColor = _intToColor(jsonObject["tintColor"]);
    result.activityIndicatorColor = _intToColor(
      jsonObject["activityIndicatorColor"],
    );
    result.statusBackgroundColor = _intToColor(
      jsonObject["statusBackgroundColor"],
    );
    result.cameraPreviewBackgroundColor = _intToColor(
      jsonObject["cameraPreviewBackgroundColor"],
    );
    result.backgroundMaskColor = _intToColor(jsonObject["backgroundMaskColor"]);
    result.multipageButtonTextColor = _intToColor(
      jsonObject["multipageButtonTextColor"],
    );

    result.statusPositionMultiplier = _toDouble(
      jsonObject["statusPositionMultiplier"],
    );
    result.resultStatusPositionMultiplier = _toDouble(
      jsonObject["resultStatusPositionMultiplier"],
    );
    result.toolbarSize = _toDouble(jsonObject["toolbarSize"]);
    result.backgroundMaskAlpha = _toDouble(jsonObject["backgroundMaskAlpha"]);
    result.customStatusPositionMultiplier = _toDouble(
      jsonObject["customStatusPositionMultiplier"],
    );
    result.cameraFrameVerticalPositionMultiplier = _toDouble(
      jsonObject["cameraFrameVerticalPositionMultiplier"],
    );
    result.cameraFrameLandscapeAspectRatio = _toDouble(
      jsonObject["cameraFrameLandscapeAspectRatio"],
    );
    result.cameraFrameCornerRadius = _toDouble(
      jsonObject["cameraFrameCornerRadius"],
    );
    result.cameraFramePortraitAspectRatio = _toDouble(
      jsonObject["cameraFramePortraitAspectRatio"],
    );
    result.livenessAnimationPositionMultiplier = _toDouble(
      jsonObject["livenessAnimationPositionMultiplier"],
    );
    result.nextPageAnimationStartDelay = _toDouble(
      jsonObject["nextPageAnimationStartDelay"],
    );
    result.nextPageAnimationEndDelay = _toDouble(
      jsonObject["nextPageAnimationEndDelay"],
    );
    result.activityIndicatorPortraitPositionMultiplier = _toDouble(
      jsonObject["activityIndicatorPortraitPositionMultiplier"],
    );
    result.activityIndicatorLandscapePositionMultiplier = _toDouble(
      jsonObject["activityIndicatorLandscapePositionMultiplier"],
    );
    result.cameraPreviewVerticalPositionMultiplier = _toDouble(
      jsonObject["cameraPreviewVerticalPositionMultiplier"],
    );
    result.multipageButtonPositionMultiplier = _toDouble(
      jsonObject["multipageButtonPositionMultiplier"],
    );

    result.multipageAnimationFrontImage = _dataFromBase64(
      jsonObject["multipageAnimationFrontImage"],
    );
    result.multipageAnimationBackImage = _dataFromBase64(
      jsonObject["multipageAnimationBackImage"],
    );
    result.borderBackgroundImage = _dataFromBase64(
      jsonObject["borderBackgroundImage"],
    );
    result.helpAnimationImage = _dataFromBase64(
      jsonObject["helpAnimationImage"],
    );
    result.closeButtonImage = _dataFromBase64(jsonObject["closeButtonImage"]);
    result.captureButtonImage = _dataFromBase64(
      jsonObject["captureButtonImage"],
    );
    result.cameraSwitchButtonImage = _dataFromBase64(
      jsonObject["cameraSwitchButtonImage"],
    );
    result.torchButtonOnImage = _dataFromBase64(
      jsonObject["torchButtonOnImage"],
    );
    result.torchButtonOffImage = _dataFromBase64(
      jsonObject["torchButtonOffImage"],
    );
    result.changeFrameButtonExpandImage = _dataFromBase64(
      jsonObject["changeFrameButtonExpandImage"],
    );
    result.changeFrameButtonCollapseImage = _dataFromBase64(
      jsonObject["changeFrameButtonCollapseImage"],
    );
    result.livenessAnimationImage = _dataFromBase64(
      jsonObject["livenessAnimationImage"],
    );
    result.multipageButtonImage = _dataFromBase64(
      jsonObject["multipageButtonImage"],
    );

    result.customLabelStatus = jsonObject["customLabelStatus"];
    result.cameraFrameLineCap = Cap.getByValue(
      jsonObject["cameraFrameLineCap"],
    );
    result.uiCustomizationLayer = jsonObject["uiCustomizationLayer"];
    result.statusTextFont = Font.fromJson(jsonObject["statusTextFont"]);
    result.resultStatusTextFont = Font.fromJson(
      jsonObject["resultStatusTextFont"],
    );
    result.multipageButtonTextFont = Font.fromJson(
      jsonObject["multipageButtonTextFont"],
    );

    result.helpAnimationImageTransformsIOS = ViewContentMode.getByValue(
      jsonObject["helpAnimationImageContentMode"],
    );
    result.multipageAnimationFrontImageTransformsIOS =
        ViewContentMode.getByValue(
      jsonObject["multipageAnimationFrontImageContentMode"],
    );
    result.multipageAnimationBackImageTransformsIOS =
        ViewContentMode.getByValue(
      jsonObject["multipageAnimationBackImageContentMode"],
    );
    result.livenessAnimationImageTransformsIOS = ViewContentMode.getByValue(
      jsonObject["livenessAnimationImageContentMode"],
    );
    result.borderBackgroundImageTransformsIOS = ViewContentMode.getByValue(
      jsonObject["borderBackgroundImageContentMode"],
    );

    if (jsonObject["helpAnimationImageMatrix"] != null) {
      List<double> array = [];
      for (var value in jsonObject["helpAnimationImageMatrix"]) {
        array.add(value.toDouble());
      }
      result.helpAnimationImageTransformsAndroid = array;
    } else {
      result.helpAnimationImageTransformsAndroid = null;
    }
    if (jsonObject["multipageAnimationFrontImageMatrix"] != null) {
      List<double> array = [];
      for (var value in jsonObject["multipageAnimationFrontImageMatrix"]) {
        array.add(value.toDouble());
      }
      result.multipageAnimationFrontImageTransformsAndroid = array;
    } else {
      result.multipageAnimationFrontImageTransformsAndroid = null;
    }
    if (jsonObject["multipageAnimationBackImageMatrix"] != null) {
      List<double> array = [];
      for (var value in jsonObject["multipageAnimationBackImageMatrix"]) {
        array.add(value.toDouble());
      }
      result.multipageAnimationBackImageTransformsAndroid = array;
    } else {
      result.multipageAnimationBackImageTransformsAndroid = null;
    }
    if (jsonObject["livenessAnimationImageMatrix"] != null) {
      List<double> array = [];
      for (var value in jsonObject["livenessAnimationImageMatrix"]) {
        array.add(value.toDouble());
      }
      result.livenessAnimationImageTransformsAndroid = array;
    } else {
      result.livenessAnimationImageTransformsAndroid = null;
    }
    if (jsonObject["borderBackgroundImageMatrix"] != null) {
      List<double> array = [];
      for (var value in jsonObject["borderBackgroundImageMatrix"]) {
        array.add(value.toDouble());
      }
      result.borderBackgroundImageTransformsAndroid = array;
    } else {
      result.borderBackgroundImageTransformsAndroid = null;
    }

    result.colors = CustomizationColors.fromJson(jsonObject["colors"]);
    result.fonts = CustomizationFonts.fromJson(jsonObject["fonts"]);
    result.images = CustomizationImages.fromJson(jsonObject["images"]);

    return result;
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
        "multipageButtonText": multipageButtonText,
        "cameraFrameDefaultColor": _intFromColor(cameraFrameDefaultColor),
        "cameraFrameActiveColor": _intFromColor(cameraFrameActiveColor),
        "statusTextColor": _intFromColor(statusTextColor),
        "resultStatusBackgroundColor": _intFromColor(
          resultStatusBackgroundColor,
        ),
        "multipageButtonBackgroundColor": _intFromColor(
          multipageButtonBackgroundColor,
        ),
        "tintColor": _intFromColor(tintColor),
        "activityIndicatorColor": _intFromColor(activityIndicatorColor),
        "statusBackgroundColor": _intFromColor(statusBackgroundColor),
        "cameraPreviewBackgroundColor": _intFromColor(
          cameraPreviewBackgroundColor,
        ),
        "backgroundMaskColor": _intFromColor(backgroundMaskColor),
        "resultStatusTextColor": _intFromColor(resultStatusTextColor),
        "multipageButtonTextColor": _intFromColor(multipageButtonTextColor),
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
        "livenessAnimationPositionMultiplier":
            livenessAnimationPositionMultiplier,
        "nextPageAnimationStartDelay": nextPageAnimationStartDelay,
        "nextPageAnimationEndDelay": nextPageAnimationEndDelay,
        "activityIndicatorPortraitPositionMultiplier":
            activityIndicatorPortraitPositionMultiplier,
        "activityIndicatorLandscapePositionMultiplier":
            activityIndicatorLandscapePositionMultiplier,
        "cameraPreviewVerticalPositionMultiplier":
            cameraPreviewVerticalPositionMultiplier,
        "multipageButtonPositionMultiplier": multipageButtonPositionMultiplier,
        "multipageAnimationFrontImage": _dataToBase64(
          multipageAnimationFrontImage,
        ),
        "multipageAnimationBackImage": _dataToBase64(
          multipageAnimationBackImage,
        ),
        "borderBackgroundImage": _dataToBase64(borderBackgroundImage),
        "helpAnimationImage": _dataToBase64(helpAnimationImage),
        "closeButtonImage": _dataToBase64(closeButtonImage),
        "captureButtonImage": _dataToBase64(captureButtonImage),
        "cameraSwitchButtonImage": _dataToBase64(cameraSwitchButtonImage),
        "torchButtonOnImage": _dataToBase64(torchButtonOnImage),
        "torchButtonOffImage": _dataToBase64(torchButtonOffImage),
        "changeFrameButtonExpandImage": _dataToBase64(
          changeFrameButtonExpandImage,
        ),
        "changeFrameButtonCollapseImage": _dataToBase64(
          changeFrameButtonCollapseImage,
        ),
        "livenessAnimationImage": _dataToBase64(livenessAnimationImage),
        "multipageButtonImage": _dataToBase64(multipageButtonImage),
        "customLabelStatus": customLabelStatus,
        "cameraFrameLineCap": cameraFrameLineCap?.value,
        "uiCustomizationLayer": uiCustomizationLayer,
        "statusTextFont": statusTextFont?.toJson(),
        "resultStatusTextFont": resultStatusTextFont?.toJson(),
        "multipageButtonTextFont": multipageButtonTextFont?.toJson(),
        "helpAnimationImageContentMode": helpAnimationImageTransformsIOS?.value,
        "multipageAnimationFrontImageContentMode":
            multipageAnimationFrontImageTransformsIOS?.value,
        "multipageAnimationBackImageContentMode":
            multipageAnimationBackImageTransformsIOS?.value,
        "livenessAnimationImageContentMode":
            livenessAnimationImageTransformsIOS?.value,
        "borderBackgroundImageContentMode":
            borderBackgroundImageTransformsIOS?.value,
        "helpAnimationImageMatrix": helpAnimationImageTransformsAndroid,
        "multipageAnimationFrontImageMatrix":
            multipageAnimationFrontImageTransformsAndroid,
        "multipageAnimationBackImageMatrix":
            multipageAnimationBackImageTransformsAndroid,
        "livenessAnimationImageMatrix": livenessAnimationImageTransformsAndroid,
        "borderBackgroundImageMatrix": borderBackgroundImageTransformsAndroid,
        "colors": colors.toJson(),
        "fonts": fonts.toJson(),
        "images": images.toJson(),
      }.clearNulls();

  void _set(Map<String, dynamic> json) {
    if (identical(this, DocumentReader.instance.customization)) {
      _bridge.invokeMethod("setCustomization", [json]);
    }
    testSetters.addAll(json);
  }

  void _apply() => _set(toJson());

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
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
