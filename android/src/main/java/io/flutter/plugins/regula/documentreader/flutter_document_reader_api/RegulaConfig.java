package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

import com.regula.documentreader.api.DocumentReader;
import com.regula.documentreader.api.params.ParamsCustomization;
import com.regula.documentreader.api.params.Functionality;
import com.regula.documentreader.api.params.ProcessParam;
import com.regula.documentreader.api.params.rfid.dg.DataGroups;

import android.content.Context;
import android.graphics.Paint;
import android.text.SpannableString;
import android.widget.ImageView.ScaleType;
import android.graphics.Typeface;

import java.math.BigDecimal;

import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.drawableFromBase64;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.bitmapFromDrawable;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.barcodeTypeArrayFromJson;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.faceMetaDataArrayFromJson;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.floatArrayFromJson;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.intArrayFromJson;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.generateIntArray;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.matrixFromFloatArray;

class RegulaConfig {
    static void setConfig(DocumentReader reader, JSONObject opts, Context context) throws JSONException {
        if (opts.has("customization"))
            setCustomization(reader.customization(), opts.getJSONObject("customization"), context);
        if (opts.has("functionality"))
            setFunctionality(reader.functionality(), opts.getJSONObject("functionality"));
        if (opts.has("processParams"))
            setProcessParams(reader.processParams(), opts.getJSONObject("processParams"));
    }

    static JSONObject getConfig(DocumentReader reader, Context context) throws JSONException {
        JSONObject object = new JSONObject();
        object.put("customization", getCustomization(reader.customization()));
        object.put("functionality", getFunctionality(reader.functionality()));
        object.put("processParams", getProcessParams(reader.processParams(), context));

        return object;
    }

    private static void setFunctionality(Functionality functionality, JSONObject opts) throws JSONException {
        Functionality.FunctionalityEditor editor = functionality.edit();
        if (opts.has("pictureOnBoundsReady"))
            editor.setPictureOnBoundsReady(opts.getBoolean("pictureOnBoundsReady"));
        if (opts.has("showTorchButton"))
            editor.setShowTorchButton(opts.getBoolean("showTorchButton"));
        if (opts.has("showCloseButton"))
            editor.setShowCloseButton(opts.getBoolean("showCloseButton"));
        if (opts.has("videoCaptureMotionControl"))
            editor.setVideoCaptureMotionControl(opts.getBoolean("videoCaptureMotionControl"));
        if (opts.has("showCaptureButton"))
            editor.setShowCaptureButton(opts.getBoolean("showCaptureButton"));
        if (opts.has("showChangeFrameButton"))
            editor.setShowChangeFrameButton(opts.getBoolean("showChangeFrameButton"));
        if (opts.has("showCaptureButtonDelayFromDetect"))
            editor.setShowCaptureButtonDelayFromDetect(opts.getInt("showCaptureButtonDelayFromDetect"));
        if (opts.has("showCaptureButtonDelayFromStart"))
            editor.setShowCaptureButtonDelayFromStart(opts.getInt("showCaptureButtonDelayFromStart"));
        if (opts.has("isOnlineMode"))
            editor.setOnlineMode(opts.getBoolean("isOnlineMode"));
        if (opts.has("databaseAutoupdate"))
            editor.setDatabaseAutoupdate(opts.getBoolean("databaseAutoupdate"));
        if (opts.has("showSkipNextPageButton"))
            editor.setShowSkipNextPageButton(opts.getBoolean("showSkipNextPageButton"));
        if (opts.has("useAuthenticator"))
            editor.setUseAuthenticator(opts.getBoolean("useAuthenticator"));
        if (opts.has("skipFocusingFrames"))
            editor.setSkipFocusingFrames(opts.getBoolean("skipFocusingFrames"));
        if (opts.has("showCameraSwitchButton"))
            editor.setShowCameraSwitchButton(opts.getBoolean("showCameraSwitchButton"));
        if (opts.has("cameraFrame"))
            editor.setCameraFrame(opts.getString("cameraFrame"));
        if (opts.has("serviceURL"))
            editor.setServiceURL(opts.getString("serviceURL"));
        if (opts.has("btDeviceName"))
            editor.setBtDeviceName(opts.getString("btDeviceName"));
        if (opts.has("orientation"))
            editor.setOrientation(opts.getInt("orientation"));
        if (opts.has("startDocReaderForResult"))
            editor.setStartDocReaderForResult(opts.getBoolean("startDocReaderForResult"));
        if (opts.has("captureMode"))
            editor.setCaptureMode(opts.getInt("captureMode"));
        if (opts.has("displayMetadata"))
            editor.setDisplayMetadata(opts.getBoolean("displayMetadata"));
//        if (opts.has("cameraSize"))
//            editor.setCameraSize();
        editor.apply();
    }

    private static void setProcessParams(ProcessParam processParams, JSONObject opts) throws JSONException {
        if (opts.has("multipageProcessing"))
            processParams.multipageProcessing = opts.getBoolean("multipageProcessing");
        if (opts.has("dateFormat"))
            processParams.dateFormat = opts.getString("dateFormat");
        if (opts.has("logs"))
            processParams.setLogs(opts.getBoolean("logs"));
        if (opts.has("debugSaveImages"))
            processParams.debugSaveImages = opts.getBoolean("debugSaveImages");
        if (opts.has("debugSaveLogs"))
            processParams.debugSaveLogs = opts.getBoolean("debugSaveLogs");
        if (opts.has("returnUncroppedImage"))
            processParams.returnUncroppedImage = opts.getBoolean("returnUncroppedImage");
        if (opts.has("customParams"))
            processParams.customParams = opts.getJSONObject("customParams");
        if (opts.has("uvTorchEnabled"))
            processParams.uvTorchEnabled = opts.getBoolean("uvTorchEnabled");
        if (opts.has("debugSaveCroppedImages"))
            processParams.debugSaveCroppedImages = opts.getBoolean("debugSaveCroppedImages");
        if (opts.has("scenario"))
            processParams.scenario = opts.getString("scenario");
        if (opts.has("measureSystem"))
            processParams.measureSystem = opts.getInt("measureSystem");
        if (opts.has("captureButtonScenario"))
            processParams.captureButtonScenario = opts.getString("captureButtonScenario");
        if (opts.has("disableFocusingCheck"))
            processParams.disableFocusingCheck = opts.getBoolean("disableFocusingCheck");
        if (opts.has("debugSaveRFIDSession"))
            processParams.debugSaveRFIDSession = opts.getBoolean("debugSaveRFIDSession");
        if (opts.has("doublePageSpread"))
            processParams.doublePageSpread = opts.getBoolean("doublePageSpread");
        if (opts.has("barcodeParserType"))
            processParams.barcodeParserType = opts.getInt("barcodeParserType");
        if (opts.has("documentIDList"))
            processParams.documentIDList = intArrayFromJson(opts.getJSONArray("documentIDList"));
        if (opts.has("fieldTypesFilter"))
            processParams.fieldTypesFilter = intArrayFromJson(opts.getJSONArray("fieldTypesFilter"));
        if (opts.has("barcodeTypes"))
            processParams.doBarcodes = barcodeTypeArrayFromJson(opts.getJSONArray("barcodeTypes"));
        if (opts.has("faceMetaData"))
            processParams.faceMetaData = faceMetaDataArrayFromJson(opts.getJSONArray("faceMetaData"));
        if (opts.has("timeout"))
            processParams.timeout = opts.getDouble("timeout");
        if (opts.has("timeoutFromFirstDetect"))
            processParams.timeoutFromFirstDetect = opts.getDouble("timeoutFromFirstDetect");
        if (opts.has("timeoutFromFirstDocType"))
            processParams.timeoutFromFirstDocType = opts.getDouble("timeoutFromFirstDocType");
        if (opts.has("manualCrop"))
            processParams.manualCrop = opts.getBoolean("manualCrop");
        if (opts.has("perspectiveAngle"))
            processParams.perspectiveAngle = opts.getInt("perspectiveAngle");
        if (opts.has("integralImage"))
            processParams.integralImage = opts.getBoolean("integralImage");
        if (opts.has("minDPI"))
            processParams.minDPI = opts.getInt("minDPI");
    }

    private static void setCustomization(ParamsCustomization customization, JSONObject opts, Context context) throws JSONException {
        ParamsCustomization.CustomizationEditor editor = customization.edit();
        if (opts.has("status"))
            editor.setStatus(opts.getString("status"));
        if (opts.has("resultStatus"))
            editor.setResultStatus(opts.getString("resultStatus"));
        if (opts.has("cameraFrameDefaultColor"))
            editor.setCameraFrameDefaultColor(opts.getString("cameraFrameDefaultColor"));
        if (opts.has("cameraFrameActiveColor"))
            editor.setCameraFrameActiveColor(opts.getString("cameraFrameActiveColor"));
        if (opts.has("statusTextColor"))
            editor.setStatusTextColor(opts.getString("statusTextColor"));
        if (opts.has("resultStatusTextColor"))
            editor.setResultStatusTextColor(opts.getString("resultStatusTextColor"));
        if (opts.has("resultStatusBackgroundColor"))
            editor.setResultStatusBackgroundColor(opts.getString("resultStatusBackgroundColor"));
        if (opts.has("multipageButtonBackgroundColor"))
            editor.setMultipageButtonBackgroundColor(opts.getString("multipageButtonBackgroundColor"));
        if (opts.has("tintColor"))
            editor.setTintColor(opts.getString("tintColor"));
        if (opts.has("activityIndicatorColor"))
            editor.setActivityIndicatorColor(opts.getString("activityIndicatorColor"));
        if (opts.has("showStatusMessages"))
            editor.setShowStatusMessages(opts.getBoolean("showStatusMessages"));
        if (opts.has("showResultStatusMessages"))
            editor.setShowResultStatusMessages(opts.getBoolean("showResultStatusMessages"));
        if (opts.has("showHelpAnimation"))
            editor.setShowHelpAnimation(opts.getBoolean("showHelpAnimation"));
        if (opts.has("showNextPageAnimation"))
            editor.setShowNextPageAnimation(opts.getBoolean("showNextPageAnimation"));
        if (opts.has("showBackgroundMask"))
            editor.setShowBackgroundMask(opts.getBoolean("showBackgroundMask"));
        if (opts.has("cameraFrameBorderWidth"))
            editor.setCameraFrameBorderWidth(opts.getInt("cameraFrameBorderWidth"));
        if (opts.has("statusTextSize"))
            editor.setStatusTextSize(opts.getInt("statusTextSize"));
        if (opts.has("cameraFrameLineLength"))
            editor.setCameraFrameLineLength(opts.getInt("cameraFrameLineLength"));
        if (opts.has("cameraFrameShapeType"))
            editor.setCameraFrameShapeType(opts.getInt("cameraFrameShapeType"));
        if (opts.has("resultStatusTextSize"))
            editor.setResultStatusTextSize(opts.getInt("resultStatusTextSize"));
        if (opts.has("cameraFrameOffsetWidth"))
            editor.setCameraFrameOffsetWidth(opts.getInt("cameraFrameOffsetWidth"));
        if (opts.has("customLabelStatus"))
            editor.setCustomLabelStatus(new SpannableString(opts.getString("customLabelStatus")));
        if (opts.has("multipageAnimationFrontImage"))
            editor.setMultipageAnimationFrontImage(drawableFromBase64(opts.getString("multipageAnimationFrontImage"), context));
        if (opts.has("multipageAnimationBackImage"))
            editor.setMultipageAnimationBackImage(drawableFromBase64(opts.getString("multipageAnimationBackImage"), context));
        if (opts.has("borderBackgroundImage"))
            editor.setBorderBackgroundImage(drawableFromBase64(opts.getString("borderBackgroundImage"), context));
        if (opts.has("helpAnimationImage"))
            editor.setHelpAnimationImage(drawableFromBase64(opts.getString("helpAnimationImage"), context));
        if (opts.has("statusPositionMultiplier"))
            editor.setStatusPositionMultiplier(BigDecimal.valueOf(opts.getDouble("statusPositionMultiplier")).floatValue());
        if (opts.has("resultStatusPositionMultiplier"))
            editor.setResultStatusPositionMultiplier(BigDecimal.valueOf(opts.getDouble("resultStatusPositionMultiplier")).floatValue());
        if (opts.has("backgroundMaskAlpha"))
            editor.setBackgroundMaskAlpha((float) opts.getDouble("backgroundMaskAlpha"));
        if (opts.has("statusTextFont"))
            editor.setStatusTextFont(Typeface.create(opts.getString("statusTextFont"), opts.has("statusTextFontStyle") ? opts.getInt("statusTextFontStyle") : Typeface.NORMAL));
        if (opts.has("resultStatusTextFont"))
            editor.setResultStatusTextFont(Typeface.create(opts.getString("resultStatusTextFont"), opts.has("resultStatusTextFontStyle") ? opts.getInt("resultStatusTextFontStyle") : Typeface.NORMAL));
        if (opts.has("helpAnimationImageScaleType"))
            editor.setHelpAnimationImageScaleType(ScaleType.valueOf(opts.getString("helpAnimationImageScaleType")));
        if (opts.has("multipageAnimationFrontImageScaleType"))
            editor.setMultipageAnimationFrontImageScaleType(ScaleType.valueOf(opts.getString("multipageAnimationFrontImageScaleType")));
        if (opts.has("multipageAnimationBackImageScaleType"))
            editor.setMultipageAnimationBackImageScaleType(ScaleType.valueOf(opts.getString("multipageAnimationBackImageScaleType")));
        if (opts.has("helpAnimationImageMatrix"))
            editor.setHelpAnimationImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("helpAnimationImageMatrix"))));
        if (opts.has("multipageAnimationFrontImageMatrix"))
            editor.setMultipageAnimationFrontImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationFrontImageMatrix"))));
        if (opts.has("multipageAnimationBackImageMatrix"))
            editor.setMultipageAnimationBackImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationBackImageMatrix"))));
        if (opts.has("customStatusPositionMultiplier"))
            editor.setCustomStatusPositionMultiplier((float) opts.getDouble("customStatusPositionMultiplier"));
        if (opts.has("cameraFrameVerticalPositionMultiplier"))
            editor.setCameraFrameVerticalPositionMultiplier((float) opts.getDouble("cameraFrameVerticalPositionMultiplier"));
        if (opts.has("cameraFrameLandscapeAspectRatio"))
            editor.setCameraFrameLandscapeAspectRatio((float) opts.getDouble("cameraFrameLandscapeAspectRatio"));
        if (opts.has("cameraFramePortraitAspectRatio"))
            editor.setCameraFramePortraitAspectRatio((float) opts.getDouble("cameraFramePortraitAspectRatio"));
        if (opts.has("cameraFrameCornerRadius"))
            editor.setCameraFrameCornerRadius((float) opts.getDouble("cameraFrameCornerRadius"));
        if (opts.has("cameraFrameLineCap"))
            editor.setCameraFrameLineCap(Paint.Cap.values()[(opts.getInt("cameraFrameLineCap"))]);
        if (opts.has("torchImageOnImage"))
            editor.setTorchImageOn(drawableFromBase64(opts.getString("torchImageOnImage"), context));
        if (opts.has("torchImageOffImage"))
            editor.setTorchImageOff(drawableFromBase64(opts.getString("torchImageOffImage"), context));
        if (opts.has("closeButtonImage"))
            editor.setCloseButtonImage(drawableFromBase64(opts.getString("closeButtonImage"), context));
        if (opts.has("captureButtonImage"))
            editor.setCaptureButtonImage(drawableFromBase64(opts.getString("captureButtonImage"), context));
        if (opts.has("changeFrameCollapseButtonImage"))
            editor.setChangeFrameCollapseButtonImage(drawableFromBase64(opts.getString("changeFrameCollapseButtonImage"), context));
        if (opts.has("changeFrameExpandButtonImage"))
            editor.setChangeFrameExpandButtonImage(drawableFromBase64(opts.getString("changeFrameExpandButtonImage"), context));
        if (opts.has("cameraSwitchButtonImage"))
            editor.setCameraSwitchButtonImage(drawableFromBase64(opts.getString("cameraSwitchButtonImage"), context));
        if (opts.has("torchButtonOnImage"))
            editor.setTorchImageOn(drawableFromBase64(opts.getString("torchButtonOnImage"), context));
        if (opts.has("torchButtonOffImage"))
            editor.setTorchImageOff(drawableFromBase64(opts.getString("torchButtonOffImage"), context));
        if (opts.has("changeFrameButtonExpandImage"))
            editor.setChangeFrameExpandButtonImage(drawableFromBase64(opts.getString("changeFrameButtonExpandImage"), context));
        if (opts.has("changeFrameButtonCollapseImage"))
            editor.setChangeFrameCollapseButtonImage(drawableFromBase64(opts.getString("changeFrameButtonCollapseImage"), context));
        editor.apply();
    }

    private static JSONObject getFunctionality(Functionality functionality) throws JSONException {
        JSONObject object = new JSONObject();
        object.put("pictureOnBoundsReady", functionality.isPictureOnBoundsReady());
        object.put("showTorchButton", functionality.isShowTorchButton());
        object.put("showCloseButton", functionality.isShowCloseButton());
        object.put("videoCaptureMotionControl", functionality.isVideoCaptureMotionControl());
        object.put("showCaptureButton", functionality.isShowCaptureButton());
        object.put("showChangeFrameButton", functionality.isShowChangeFrameButton());
        object.put("showCaptureButtonDelayFromDetect", functionality.getShowCaptureButtonDelayFromDetect());
        object.put("showCaptureButtonDelayFromStart", functionality.getShowCaptureButtonDelayFromStart());
        object.put("isOnlineMode", functionality.isOnlineMode());
        object.put("databaseAutoupdate", functionality.isDatabaseAutoupdate());
        object.put("showSkipNextPageButton", functionality.isShowSkipNextPageButton());
        object.put("useAuthenticator", functionality.isUseAuthenticator());
        object.put("skipFocusingFrames", functionality.isSkipFocusingFrames());
        object.put("showCameraSwitchButton", functionality.isShowCameraSwitchButton());
        object.put("cameraFrame", functionality.getCameraFrame());
        object.put("serviceURL", functionality.getServiceURL());
        object.put("btDeviceName", functionality.getBtDeviceName());
        object.put("orientation", functionality.getOrientation());
        object.put("BTDeviceApiPresent", functionality.isBTDeviceApiPresent());
        object.put("startDocReaderForResult", functionality.getStartDocReaderForResult());
        object.put("captureMode", functionality.getCaptureMode());
        object.put("displayMetadata", functionality.isDisplayMetaData());
//        object.put("cameraSize", functionality.getCameraSize());

        return object;
    }

    private static JSONObject getCustomization(ParamsCustomization customization) throws JSONException {
        JSONObject object = new JSONObject();
        object.put("status", customization.getStatus());
        object.put("resultStatus", customization.getResultStatus());
        object.put("cameraFrameDefaultColor", customization.getCameraFrameDefaultColor());
        object.put("cameraFrameActiveColor", customization.getCameraFrameActiveColor());
        object.put("statusTextColor", customization.getStatusTextColor());
        object.put("resultStatusTextColor", customization.getResultStatusTextColor());
        object.put("resultStatusBackgroundColor", customization.getResultStatusBackgroundColor());
        object.put("multipageButtonBackgroundColor", customization.getMultipageButtonBackgroundColor());
        object.put("tintColor", customization.getTintColor());
        object.put("activityIndicatorColor", customization.getActivityIndicatorColor());
        object.put("showStatusMessages", customization.isShowStatusMessages());
        object.put("showResultStatusMessages", customization.isShowResultStatusMessages());
        object.put("showHelpAnimation", customization.isShowHelpAnimation());
        object.put("showNextPageAnimation", customization.isShowNextPageAnimation());
        object.put("showBackgroundMask", customization.isShowBackgroundMask());
        object.put("cameraFrameBorderWidth", customization.getCameraFrameBorderWidth());
        object.put("statusTextSize", customization.getStatusTextSize());
        object.put("cameraFrameLineLength", customization.getCameraFrameLineLength());
        object.put("cameraFrameShapeType", customization.getCameraFrameShapeType());
        object.put("resultStatusTextSize", customization.getResultStatusTextSize());
        object.put("multipageAnimationFrontImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getMultipageAnimationFrontImage())));
        object.put("multipageAnimationBackImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getMultipageAnimationBackImage())));
        object.put("borderBackgroundImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getBorderBackgroundImage())));
        object.put("helpAnimationImageScaleType", customization.getHelpAnimationImageScaleType());
        object.put("multipageAnimationFrontImageScaleType", customization.getMultipageAnimationFrontImageScaleType());
        object.put("multipageAnimationBackImageScaleType", customization.getMultipageAnimationBackImageScaleType());
        object.put("helpAnimationImageMatrix", customization.getHelpAnimationImageMatrix());
        object.put("multipageAnimationFrontImageMatrix", customization.getMultipageAnimationFrontImageMatrix());
        object.put("multipageAnimationBackImageMatrix", customization.getMultipageAnimationBackImageMatrix());
        object.put("statusTextFont", customization.getStatusTextFont());
        object.put("resultStatusTextFont", customization.getResultStatusTextFont());
        object.put("statusPositionMultiplier", customization.getStatusPositionMultiplier());
        object.put("resultStatusPositionMultiplier", customization.getResultStatusPositionMultiplier());
        object.put("backgroundMaskAlpha", customization.getBackgroundMaskAlpha());
        object.put("helpAnimationImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getHelpAnimationImageDrawable())));
        object.put("cameraFrameOffsetWidth", customization.getCameraFrameOffsetWidth());
        object.put("customLabelStatus", customization.getCustomLabelStatus().toString());
        object.put("customStatusPositionMultiplier", customization.getCustomStatusPositionMultiplier());
        object.put("cameraFrameVerticalPositionMultiplier", customization.getCameraFrameVerticalPositionMultiplier());
        object.put("cameraFrameLandscapeAspectRatio", customization.getCameraFrameLandscapeAspectRatio());
        object.put("cameraFramePortraitAspectRatio", customization.getCameraFramePortraitAspectRatio());
        object.put("cameraFrameCornerRadius", customization.getCameraFrameCornerRadius());
        object.put("cameraFrameLineCap", customization.getCameraFrameLineCap().toString());
        object.put("torchImageOnImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getTorchImageOnDrawable())));
        object.put("torchImageOffImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getTorchImageOffDrawable())));
        object.put("closeButtonImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getCloseButtonDrawable())));
        object.put("captureButtonImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getCaptureButtonDrawable())));
        object.put("changeFrameCollapseButtonImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getChangeFrameCollapseButtonDrawable())));
        object.put("changeFrameExpandButtonImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getChangeFrameExpandButtonDrawable())));
        object.put("cameraSwitchButtonImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getCameraSwitchButtonDrawable())));
        object.put("torchButtonOnImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getTorchImageOnDrawable())));
        object.put("torchButtonOffImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getTorchImageOffDrawable())));
        object.put("changeFrameButtonExpandImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getChangeFrameExpandButtonDrawable())));
        object.put("changeFrameButtonCollapseImage", JSONConstructor.bitmapToBase64String(bitmapFromDrawable(customization.getChangeFrameCollapseButtonDrawable())));

        return object;
    }

    private static JSONObject getProcessParams(ProcessParam processParams, Context context) throws JSONException {
        JSONObject object = new JSONObject();
        object.put("scenario", processParams.scenario);
        object.put("measureSystem", processParams.measureSystem);
        object.put("uvTorchEnabled", processParams.uvTorchEnabled);
        object.put("debugSaveImages", true);
        object.put("debugSaveLogs", processParams.debugSaveLogs);
        object.put("multipageProcessing", processParams.multipageProcessing);
        object.put("dateFormat", processParams.dateFormat);
        object.put("debugSaveCroppedImages", processParams.debugSaveCroppedImages);
        object.put("sessionLogFolder", processParams.sessionLogFolder);
        object.put("disableFocusingCheck", processParams.disableFocusingCheck);
        object.put("captureButtonScenario", processParams.captureButtonScenario);
        object.put("returnUncroppedImage", processParams.returnUncroppedImage);
        object.put("customParams", processParams.customParams != null ? processParams.customParams.toString() : new JSONArray());
        object.put("debugSaveRFIDSession", processParams.debugSaveRFIDSession);
        object.put("barcodeParserType", processParams.barcodeParserType);
        object.put("doublePageSpread", processParams.doublePageSpread);
        object.put("timeout", processParams.timeout);
        object.put("timeoutFromFirstDetect", processParams.timeoutFromFirstDetect);
        object.put("timeoutFromFirstDocType", processParams.timeoutFromFirstDocType);
        object.put("manualCrop", processParams.manualCrop);
        object.put("perspectiveAngle", processParams.perspectiveAngle);
        object.put("integralImage", processParams.integralImage);
        object.put("minDPI", processParams.minDPI);
        object.put("logs", processParams.isLogEnable());
        if (processParams.documentIDList != null)
            object.put("documentIDList", generateIntArray(processParams.documentIDList));
        if (processParams.doBarcodes != null)
            object.put("barcodeTypes", JSONConstructor.generateArray(processParams.doBarcodes));
        if (processParams.fieldTypesFilter != null)
            object.put("fieldTypesFilter", generateIntArray(processParams.fieldTypesFilter));
        if (processParams.faceMetaData != null)
            object.put("faceMetaData", JSONConstructor.generateArray(processParams.faceMetaData, JSONConstructor::generateFaceMetaData, context));

        return object;
    }

    static void setRfidScenario(JSONObject opts) throws JSONException {
        if (opts.has("paceStaticBinding"))
            DocumentReader.Instance().rfidScenario().setPaceStaticBinding(opts.getBoolean("PACE_StaticBinding"));
        if (opts.has("signManagementAction"))
            DocumentReader.Instance().rfidScenario().setSignManagementAction(opts.getInt("signManagementAction"));
        if (opts.has("readingBuffer"))
            DocumentReader.Instance().rfidScenario().setReadingBuffer(opts.getInt("readingBuffer"));
        if (opts.has("onlineTAToSignDataType"))
            DocumentReader.Instance().rfidScenario().setOnlineTAToSignDataType(opts.getInt("onlineTAToSignDataType"));
        if (opts.has("onlineTA"))
            DocumentReader.Instance().rfidScenario().setOnlineTA(opts.getBoolean("onlineTA"));
        if (opts.has("writeEid"))
            DocumentReader.Instance().rfidScenario().setWriteEid(opts.getBoolean("writeEid"));
        if (opts.has("profilerType"))
            DocumentReader.Instance().rfidScenario().setProfilerType(opts.getInt("profilerType"));
        if (opts.has("authProcType"))
            DocumentReader.Instance().rfidScenario().setAuthProcType(opts.getInt("authProcType"));
        if (opts.has("baseSMProcedure"))
            DocumentReader.Instance().rfidScenario().setBaseSMProcedure(opts.getInt("baseSMProcedure"));
        if (opts.has("pacePasswordType"))
            DocumentReader.Instance().rfidScenario().setPacePasswordType(opts.getInt("pacePasswordType"));
        if (opts.has("terminalType"))
            DocumentReader.Instance().rfidScenario().setTerminalType(opts.getInt("terminalType"));
        if (opts.has("universalAccessRights"))
            DocumentReader.Instance().rfidScenario().setUniversalAccessRights(opts.getBoolean("universalAccessRights"));
        if (opts.has("authorizedRestrictedIdentification"))
            DocumentReader.Instance().rfidScenario().setAuthorizedRestrictedIdentification(opts.getBoolean("authorizedRestrictedIdentification"));
        if (opts.has("auxVerificationCommunityID"))
            DocumentReader.Instance().rfidScenario().setAuxVerificationCommunityID(opts.getBoolean("auxVerificationCommunityID"));
        if (opts.has("auxVerificationDateOfBirth"))
            DocumentReader.Instance().rfidScenario().setAuxVerificationDateOfBirth(opts.getBoolean("auxVerificationDateOfBirth"));
        if (opts.has("skipAA"))
            DocumentReader.Instance().rfidScenario().setSkipAA(opts.getBoolean("skipAA"));
        if (opts.has("strictProcessing"))
            DocumentReader.Instance().rfidScenario().setStrictProcessing(opts.getBoolean("strictProcessing"));
        if (opts.has("pkdDSCertPriority"))
            DocumentReader.Instance().rfidScenario().setPkdDSCertPriority(opts.getBoolean("pkdDSCertPriority"));
        if (opts.has("pkdUseExternalCSCA"))
            DocumentReader.Instance().rfidScenario().setPkdUseExternalCSCA(opts.getBoolean("pkdUseExternalCSCA"));
        if (opts.has("trustedPKD"))
            DocumentReader.Instance().rfidScenario().setTrustedPKD(opts.getBoolean("trustedPKD"));
        if (opts.has("passiveAuth"))
            DocumentReader.Instance().rfidScenario().setPassiveAuth(opts.getBoolean("passiveAuth"));
        if (opts.has("password"))
            DocumentReader.Instance().rfidScenario().setPassword(opts.getString("password"));
        if (opts.has("useSFI"))
            DocumentReader.Instance().rfidScenario().setUseSFI(opts.getBoolean("useSFI"));
        if (opts.has("pkdPA"))
            DocumentReader.Instance().rfidScenario().setPkdPA(opts.getString("pkdPA"));
        if (opts.has("pkdEAC"))
            DocumentReader.Instance().rfidScenario().setPkdEAC(opts.getString("pkdEAC"));
        if (opts.has("readEPassport"))
            DocumentReader.Instance().rfidScenario().setReadEPassport(opts.getBoolean("readEPassport"));
        if (opts.has("readEID"))
            DocumentReader.Instance().rfidScenario().setReadEID(opts.getBoolean("readEID"));
        if (opts.has("readEDL"))
            DocumentReader.Instance().rfidScenario().setReadEDL(opts.getBoolean("readEDL"));
        if (opts.has("mrz"))
            DocumentReader.Instance().rfidScenario().setMrz(opts.getString("mrz"));
        if (opts.has("eSignPINDefault"))
            DocumentReader.Instance().rfidScenario().seteSignPINDefault(opts.getString("eSignPINDefault"));
        if (opts.has("eSignPINNewValue"))
            DocumentReader.Instance().rfidScenario().seteSignPINNewValue(opts.getString("eSignPINNewValue"));
        if (opts.has("authorizedSTSignature"))
            DocumentReader.Instance().rfidScenario().setAuthorizedSTSignature(opts.getBoolean("authorizedSTSignature"));
        if (opts.has("authorizedSTQSignature"))
            DocumentReader.Instance().rfidScenario().setAuthorizedSTQSignature(opts.getBoolean("authorizedSTQSignature"));
        if (opts.has("authorizedWriteDG17"))
            DocumentReader.Instance().rfidScenario().setAuthorizedWriteDG17(opts.getBoolean("authorizedWriteDG17"));
        if (opts.has("authorizedWriteDG18"))
            DocumentReader.Instance().rfidScenario().setAuthorizedWriteDG18(opts.getBoolean("authorizedWriteDG18"));
        if (opts.has("authorizedWriteDG19"))
            DocumentReader.Instance().rfidScenario().setAuthorizedWriteDG19(opts.getBoolean("authorizedWriteDG19"));
        if (opts.has("authorizedWriteDG20"))
            DocumentReader.Instance().rfidScenario().setAuthorizedWriteDG20(opts.getBoolean("authorizedWriteDG20"));
        if (opts.has("authorizedWriteDG21"))
            DocumentReader.Instance().rfidScenario().setAuthorizedWriteDG21(opts.getBoolean("authorizedWriteDG21"));
        if (opts.has("authorizedVerifyAge"))
            DocumentReader.Instance().rfidScenario().setAuthorizedVerifyAge(opts.getBoolean("authorizedVerifyAge"));
        if (opts.has("authorizedVerifyCommunityID"))
            DocumentReader.Instance().rfidScenario().setAuthorizedVerifyCommunityID(opts.getBoolean("authorizedVerifyCommunityID"));
        if (opts.has("authorizedPrivilegedTerminal"))
            DocumentReader.Instance().rfidScenario().setAuthorizedPrivilegedTerminal(opts.getBoolean("authorizedPrivilegedTerminal"));
        if (opts.has("authorizedCANAllowed"))
            DocumentReader.Instance().rfidScenario().setAuthorizedCANAllowed(opts.getBoolean("authorizedCANAllowed"));
        if (opts.has("authorizedPINManagement"))
            DocumentReader.Instance().rfidScenario().setAuthorizedPINManagment(opts.getBoolean("authorizedPINManagement"));
        if (opts.has("authorizedInstallCert"))
            DocumentReader.Instance().rfidScenario().setAuthorizedInstallCert(opts.getBoolean("authorizedInstallCert"));
        if (opts.has("authorizedInstallQCert"))
            DocumentReader.Instance().rfidScenario().setAuthorizedInstallQCert(opts.getBoolean("authorizedInstallQCert"));
        if (opts.has("applyAmendments"))
            DocumentReader.Instance().rfidScenario().setApplyAmendments(opts.getBoolean("applyAmendments"));
        if (opts.has("ePassportDataGroups"))
            setDataGroups(DocumentReader.Instance().rfidScenario().ePassportDataGroups(), opts.getJSONObject("ePassportDataGroups"));
        if (opts.has("eIDDataGroups"))
            setDataGroups(DocumentReader.Instance().rfidScenario().eIDDataGroups(), opts.getJSONObject("eIDDataGroups"));
        if (opts.has("eDLDataGroups"))
            setDataGroups(DocumentReader.Instance().rfidScenario().eDLDataGroups(), opts.getJSONObject("eDLDataGroups"));
    }

    private static void setDataGroups(DataGroups dataGroup, JSONObject opts) throws JSONException {
        if (opts.has("DG1"))
            dataGroup.setDG1(opts.getBoolean("DG1"));
        if (opts.has("DG2"))
            dataGroup.setDG2(opts.getBoolean("DG2"));
        if (opts.has("DG3"))
            dataGroup.setDG3(opts.getBoolean("DG3"));
        if (opts.has("DG4"))
            dataGroup.setDG4(opts.getBoolean("DG4"));
        if (opts.has("DG5"))
            dataGroup.setDG5(opts.getBoolean("DG5"));
        if (opts.has("DG6"))
            dataGroup.setDG6(opts.getBoolean("DG6"));
        if (opts.has("DG7"))
            dataGroup.setDG7(opts.getBoolean("DG7"));
        if (opts.has("DG8"))
            dataGroup.setDG8(opts.getBoolean("DG8"));
        if (opts.has("DG9"))
            dataGroup.setDG9(opts.getBoolean("DG9"));
        if (opts.has("DG10"))
            dataGroup.setDG10(opts.getBoolean("DG10"));
        if (opts.has("DG11"))
            dataGroup.setDG11(opts.getBoolean("DG11"));
        if (opts.has("DG12"))
            dataGroup.setDG12(opts.getBoolean("DG12"));
        if (opts.has("DG13"))
            dataGroup.setDG13(opts.getBoolean("DG13"));
        if (opts.has("DG14"))
            dataGroup.setDG14(opts.getBoolean("DG14"));
        if (opts.has("DG15"))
            dataGroup.setDG14(opts.getBoolean("DG15"));
        if (opts.has("DG16"))
            dataGroup.setDG14(opts.getBoolean("DG16"));
        if (opts.has("DG17"))
            dataGroup.setDG14(opts.getBoolean("DG17"));
        if (opts.has("DG18"))
            dataGroup.setDG14(opts.getBoolean("DG18"));
        if (opts.has("DG19"))
            dataGroup.setDG14(opts.getBoolean("DG19"));
        if (opts.has("DG20"))
            dataGroup.setDG14(opts.getBoolean("DG20"));
        if (opts.has("DG21"))
            dataGroup.setDG14(opts.getBoolean("DG21"));
    }
}