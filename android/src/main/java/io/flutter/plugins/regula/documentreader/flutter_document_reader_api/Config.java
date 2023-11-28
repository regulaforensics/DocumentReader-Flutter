//
//  Config.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Utils.*;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.*;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.*;
import static com.regula.documentreader.api.DocumentReader.Instance;

import android.content.Context;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.SpannableString;
import android.util.Pair;
import android.widget.ImageView.ScaleType;

import com.regula.documentreader.api.params.Functionality;
import com.regula.documentreader.api.params.ParamsCustomization;
import com.regula.documentreader.api.params.ProcessParam;
import com.regula.documentreader.api.params.RfidScenario;
import com.regula.documentreader.api.params.rfid.dg.DataGroups;
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups;
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups;

import org.json.JSONException;
import org.json.JSONObject;

class Config {
    static void setFunctionality(Functionality functionality, JSONObject opts) throws JSONException {
        Functionality.FunctionalityEditor editor = functionality.edit();

        // Boolean
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
        if (opts.has("showSkipNextPageButton"))
            editor.setShowSkipNextPageButton(opts.getBoolean("showSkipNextPageButton"));
        if (opts.has("useAuthenticator"))
            editor.setUseAuthenticator(opts.getBoolean("useAuthenticator"));
        if (opts.has("skipFocusingFrames"))
            editor.setSkipFocusingFrames(opts.getBoolean("skipFocusingFrames"));
        if (opts.has("showCameraSwitchButton"))
            editor.setShowCameraSwitchButton(opts.getBoolean("showCameraSwitchButton"));
        if (opts.has("displayMetadata"))
            editor.setDisplayMetadata(opts.getBoolean("displayMetadata"));
        if (opts.has("isZoomEnabled"))
            editor.setZoomEnabled(opts.getBoolean("isZoomEnabled"));
        if (opts.has("isCameraTorchCheckDisabled"))
            editor.setIsCameraTorchCheckDisabled(opts.getBoolean("isCameraTorchCheckDisabled"));
        if (opts.has("recordScanningProcess"))
            editor.setDoRecordProcessingVideo(opts.getBoolean("recordScanningProcess"));
        if (opts.has("manualMultipageMode"))
            editor.setManualMultipageMode(opts.getBoolean("manualMultipageMode"));

        // Int
        if (opts.has("showCaptureButtonDelayFromDetect"))
            editor.setShowCaptureButtonDelayFromDetect(opts.getInt("showCaptureButtonDelayFromDetect"));
        if (opts.has("showCaptureButtonDelayFromStart"))
            editor.setShowCaptureButtonDelayFromStart(opts.getInt("showCaptureButtonDelayFromStart"));
        if (opts.has("orientation"))
            editor.setOrientation(opts.getInt("orientation"));
        if (opts.has("captureMode"))
            editor.setCaptureMode(opts.getInt("captureMode"));
        if (opts.has("cameraPosition"))
            editor.setCameraMode(opts.getInt("cameraPosition"));
        if (opts.has("rfidTimeout"))
            editor.setRfidTimeout(opts.getInt("rfidTimeout"));
        if (opts.has("forcePagesCount"))
            editor.setForcePagesCount(opts.getInt("forcePagesCount"));

        // String
        if (opts.has("cameraFrame"))
            editor.setCameraFrame(opts.getString("cameraFrame"));
        if (opts.has("btDeviceName"))
            editor.setBtDeviceName(opts.getString("btDeviceName"));

        // Float
        if (opts.has("zoomFactor"))
            editor.setZoomFactor((float) opts.getDouble("zoomFactor"));
        if (opts.has("exposure"))
            editor.setExposure((float) opts.getDouble("exposure"));

        // JSONArray
        if (opts.has("excludedCamera2Models"))
            editor.setExcludedCamera2Models(stringListFromJson(opts.getJSONArray("excludedCamera2Models")));

        // Custom
        // in ios - videoSessionPreset
        if (opts.has("cameraSize")) {
            JSONObject cameraSize = opts.getJSONObject("cameraSize");
            int width = cameraSize.getInt("width");
            int height = cameraSize.getInt("height");
            editor.setCameraSize(width, height);
        }

        editor.apply();
    }

    static JSONObject getFunctionality(Functionality functionality) throws JSONException {
        JSONObject object = new JSONObject();

        // Boolean
        object.put("pictureOnBoundsReady", functionality.isPictureOnBoundsReady());
        object.put("showTorchButton", functionality.isShowTorchButton());
        object.put("showCloseButton", functionality.isShowCloseButton());
        object.put("videoCaptureMotionControl", functionality.isVideoCaptureMotionControl());
        object.put("showCaptureButton", functionality.isShowCaptureButton());
        object.put("showChangeFrameButton", functionality.isShowChangeFrameButton());
        object.put("showSkipNextPageButton", functionality.isShowSkipNextPageButton());
        object.put("useAuthenticator", functionality.isUseAuthenticator());
        object.put("skipFocusingFrames", functionality.isSkipFocusingFrames());
        object.put("showCameraSwitchButton", functionality.isShowCameraSwitchButton());
        object.put("displayMetadata", functionality.isDisplayMetaData());
        object.put("isZoomEnabled", functionality.isZoomEnabled());
        object.put("isCameraTorchCheckDisabled", functionality.isCameraTorchCheckDisabled());
        object.put("recordScanningProcess", functionality.doRecordProcessingVideo());
        object.put("manualMultipageMode", functionality.isManualMultipageMode());

        // Int
        object.put("showCaptureButtonDelayFromDetect", functionality.getShowCaptureButtonDelayFromDetect());
        object.put("showCaptureButtonDelayFromStart", functionality.getShowCaptureButtonDelayFromStart());
        object.put("orientation", functionality.getOrientation());
        object.put("captureMode", functionality.getCaptureMode());
        object.put("cameraPosition", functionality.getCameraMode());
        object.put("rfidTimeout", functionality.getRfidTimeout());
        object.put("forcePagesCount", functionality.getForcePagesCount());

        // String
        object.put("cameraFrame", functionality.getCameraFrame());
        object.put("btDeviceName", functionality.getBtDeviceName());

        // Float
        object.put("zoomFactor", functionality.getZoomFactor());
        object.put("exposure", functionality.getExposure());

        // JSONArray
        object.put("excludedCamera2Models", generateList(functionality.getExcludedCamera2Models()));

        // Custom
        // in ios - videoSessionPreset
        object.put("cameraSize", new JSONObject() {{
            put("width", functionality.getCameraWidth());
            put("height", functionality.getCameraHeight());
        }});

        return object;
    }

    static void setProcessParams(ProcessParam processParams, JSONObject opts) throws JSONException {

        // Boolean
        if (opts.has("multipageProcessing"))
            processParams.multipageProcessing = opts.getBoolean("multipageProcessing");
        if (opts.has("logs"))
            processParams.setLogs(opts.getBoolean("logs"));
        if (opts.has("debugSaveImages"))
            processParams.debugSaveImages = opts.getBoolean("debugSaveImages");
        if (opts.has("debugSaveLogs"))
            processParams.debugSaveLogs = opts.getBoolean("debugSaveLogs");
        if (opts.has("returnUncroppedImage"))
            processParams.returnUncroppedImage = opts.getBoolean("returnUncroppedImage");
        if (opts.has("uvTorchEnabled"))
            processParams.uvTorchEnabled = opts.getBoolean("uvTorchEnabled");
        if (opts.has("debugSaveCroppedImages"))
            processParams.debugSaveCroppedImages = opts.getBoolean("debugSaveCroppedImages");
        if (opts.has("disableFocusingCheck"))
            processParams.disableFocusingCheck = opts.getBoolean("disableFocusingCheck");
        if (opts.has("debugSaveRFIDSession"))
            processParams.debugSaveRFIDSession = opts.getBoolean("debugSaveRFIDSession");
        if (opts.has("doublePageSpread"))
            processParams.doublePageSpread = opts.getBoolean("doublePageSpread");
        if (opts.has("manualCrop"))
            processParams.manualCrop = opts.getBoolean("manualCrop");
        if (opts.has("integralImage"))
            processParams.integralImage = opts.getBoolean("integralImage");
        if (opts.has("returnCroppedBarcode"))
            processParams.returnCroppedBarcode = opts.getBoolean("returnCroppedBarcode");
        if (opts.has("checkHologram"))
            processParams.checkHologram = opts.getBoolean("checkHologram");
        if (opts.has("checkRequiredTextFields"))
            processParams.checkRequiredTextFields = opts.getBoolean("checkRequiredTextFields");
        if (opts.has("depersonalizeLog"))
            processParams.depersonalizeLog = opts.getBoolean("depersonalizeLog");
        if (opts.has("generateDoublePageSpreadImage"))
            processParams.generateDoublePageSpreadImage = opts.getBoolean("generateDoublePageSpreadImage");
        if (opts.has("alreadyCropped"))
            processParams.alreadyCropped = opts.getBoolean("alreadyCropped");
        if (opts.has("matchTextFieldMask"))
            processParams.matchTextFieldMask = opts.getBoolean("matchTextFieldMask");
        if (opts.has("fastDocDetect"))
            processParams.fastDocDetect = opts.getBoolean("fastDocDetect");
        if (opts.has("updateOCRValidityByGlare"))
            processParams.updateOCRValidityByGlare = opts.getBoolean("updateOCRValidityByGlare");
        if (opts.has("noGraphics"))
            processParams.noGraphics = opts.getBoolean("noGraphics");
        if (opts.has("multiDocOnImage"))
            processParams.multiDocOnImage = opts.getBoolean("multiDocOnImage");
        if (opts.has("forceReadMrzBeforeLocate"))
            processParams.forceReadMrzBeforeLocate = opts.getBoolean("forceReadMrzBeforeLocate");
        if (opts.has("parseBarcodes"))
            processParams.parseBarcodes = opts.getBoolean("parseBarcodes");
        if (opts.has("shouldReturnPackageForReprocess"))
            processParams.shouldReturnPackageForReprocess = opts.getBoolean("shouldReturnPackageForReprocess");
        if (opts.has("disablePerforationOCR"))
            processParams.disablePerforationOCR = opts.getBoolean("disablePerforationOCR");
        if (opts.has("respectImageQuality"))
            processParams.respectImageQuality = opts.getBoolean("respectImageQuality");
        if (opts.has("splitNames"))
            processParams.splitNames = opts.getBoolean("splitNames");
        if (opts.has("doFlipYAxis"))
            processParams.doFlipYAxis = opts.getBoolean("doFlipYAxis");
        if (opts.has("doDetectCan"))
            processParams.doDetectCan = opts.getBoolean("doDetectCan");
        if (opts.has("useFaceApi"))
            processParams.useFaceApi = opts.getBoolean("useFaceApi");

        // Int
        if (opts.has("measureSystem"))
            processParams.measureSystem = opts.getInt("measureSystem");
        if (opts.has("barcodeParserType"))
            processParams.barcodeParserType = opts.getInt("barcodeParserType");
        if (opts.has("perspectiveAngle"))
            processParams.perspectiveAngle = opts.getInt("perspectiveAngle");
        if (opts.has("minDPI"))
            processParams.minDPI = opts.getInt("minDPI");
        if (opts.has("imageDpiOutMax"))
            processParams.imageDpiOutMax = opts.getInt("imageDpiOutMax");
        if (opts.has("forceDocID"))
            processParams.forceDocID = opts.getInt("forceDocID");
        if (opts.has("forceDocFormat"))
            processParams.forceDocFormat = opts.getInt("forceDocFormat");
        if (opts.has("shiftExpiryDate"))
            processParams.shiftExpiryDate = opts.getInt("shiftExpiryDate");
        if (opts.has("minimalHolderAge"))
            processParams.minimalHolderAge = opts.getInt("minimalHolderAge");
        if (opts.has("imageOutputMaxHeight"))
            processParams.imageOutputMaxHeight = opts.getInt("imageOutputMaxHeight");
        if (opts.has("imageOutputMaxWidth"))
            processParams.imageOutputMaxWidth = opts.getInt("imageOutputMaxWidth");
        if (opts.has("processAuth"))
            processParams.processAuth = opts.getInt("processAuth");
        if (opts.has("convertCase"))
            processParams.convertCase = opts.getInt("convertCase");

        // String
        if (opts.has("dateFormat"))
            processParams.dateFormat = opts.getString("dateFormat");
        if (opts.has("scenario"))
            processParams.scenario = opts.getString("scenario");
        if (opts.has("captureButtonScenario"))
            processParams.captureButtonScenario = opts.getString("captureButtonScenario");
        if (opts.has("sessionLogFolder"))
            processParams.sessionLogFolder = opts.getString("sessionLogFolder");

        // Double
        if (opts.has("timeout"))
            processParams.timeout = opts.getDouble("timeout");
        if (opts.has("timeoutFromFirstDetect"))
            processParams.timeoutFromFirstDetect = opts.getDouble("timeoutFromFirstDetect");
        if (opts.has("timeoutFromFirstDocType"))
            processParams.timeoutFromFirstDocType = opts.getDouble("timeoutFromFirstDocType");
        if (opts.has("documentAreaMin"))
            processParams.documentAreaMin = opts.getDouble("documentAreaMin");

        // JSONArray
        if (opts.has("documentIDList"))
            processParams.documentIDList = intArrayFromJSON(opts.getJSONArray("documentIDList"));
        if (opts.has("fieldTypesFilter"))
            processParams.fieldTypesFilter = intArrayFromJSON(opts.getJSONArray("fieldTypesFilter"));
        if (opts.has("barcodeTypes"))
            processParams.doBarcodes = barcodeTypeArrayFromJson(opts.getJSONArray("barcodeTypes"));
        if (opts.has("resultTypeOutput"))
            processParams.resultTypeOutput = intArrayFromJSON(opts.getJSONArray("resultTypeOutput"));
        if (opts.has("mrzFormatsFilter"))
            processParams.mrzFormatsFilter = stringArrayFromJson(opts.getJSONArray("mrzFormatsFilter"));
        if (opts.has("documentGroupFilter"))
            processParams.documentGroupFilter = intArrayFromJSON(opts.getJSONArray("documentGroupFilter"));

        // JSONObject
        if (opts.has("imageQA"))
            processParams.imageQA = imageQAFromJSON(opts.getJSONObject("imageQA"));
        if (opts.has("rfidParams"))
            processParams.rfidParams = rfidParamsFromJSON(opts.getJSONObject("rfidParams"));
        if (opts.has("faceApiParams"))
            processParams.faceApiParams = faceApiParamsFromJSON(opts.getJSONObject("faceApiParams"));

        // Custom
        if (opts.has("customParams"))
            processParams.customParams = opts.getJSONObject("customParams");
    }

    static JSONObject getProcessParams(ProcessParam processParams) throws JSONException {
        JSONObject object = new JSONObject();

        // Boolean
        object.put("multipageProcessing", processParams.multipageProcessing);
        object.put("logs", processParams.isLogEnable());
        object.put("debugSaveImages", processParams.debugSaveImages);
        object.put("debugSaveLogs", processParams.debugSaveLogs);
        object.put("returnUncroppedImage", processParams.returnUncroppedImage);
        object.put("uvTorchEnabled", processParams.uvTorchEnabled);
        object.put("debugSaveCroppedImages", processParams.debugSaveCroppedImages);
        object.put("disableFocusingCheck", processParams.disableFocusingCheck);
        object.put("debugSaveRFIDSession", processParams.debugSaveRFIDSession);
        object.put("doublePageSpread", processParams.doublePageSpread);
        object.put("manualCrop", processParams.manualCrop);
        object.put("integralImage", processParams.integralImage);
        object.put("returnCroppedBarcode", processParams.returnCroppedBarcode);
        object.put("checkHologram", processParams.checkHologram);
        object.put("checkRequiredTextFields", processParams.checkRequiredTextFields);
        object.put("depersonalizeLog", processParams.depersonalizeLog);
        object.put("generateDoublePageSpreadImage", processParams.generateDoublePageSpreadImage);
        object.put("alreadyCropped", processParams.alreadyCropped);
        object.put("matchTextFieldMask", processParams.matchTextFieldMask);
        object.put("fastDocDetect", processParams.fastDocDetect);
        object.put("updateOCRValidityByGlare", processParams.updateOCRValidityByGlare);
        object.put("noGraphics", processParams.noGraphics);
        object.put("multiDocOnImage", processParams.multiDocOnImage);
        object.put("forceReadMrzBeforeLocate", processParams.forceReadMrzBeforeLocate);
        object.put("parseBarcodes", processParams.parseBarcodes);
        object.put("shouldReturnPackageForReprocess", processParams.shouldReturnPackageForReprocess);
        object.put("disablePerforationOCR", processParams.disablePerforationOCR);
        object.put("respectImageQuality", processParams.respectImageQuality);
        object.put("splitNames", processParams.splitNames);
        object.put("doFlipYAxis", processParams.doFlipYAxis);
        object.put("doDetectCan", processParams.doDetectCan);
        object.put("useFaceApi", processParams.useFaceApi);

        // Int
        object.put("measureSystem", processParams.measureSystem);
        object.put("barcodeParserType", processParams.barcodeParserType);
        object.put("perspectiveAngle", processParams.perspectiveAngle);
        object.put("minDPI", processParams.minDPI);
        object.put("imageDpiOutMax", processParams.imageDpiOutMax);
        object.put("forceDocID", processParams.forceDocID);
        object.put("forceDocFormat", processParams.forceDocFormat);
        object.put("shiftExpiryDate", processParams.shiftExpiryDate);
        object.put("minimalHolderAge", processParams.minimalHolderAge);
        object.put("imageOutputMaxHeight", processParams.imageOutputMaxHeight);
        object.put("imageOutputMaxWidth", processParams.imageOutputMaxWidth);
        object.put("processAuth", processParams.processAuth);
        object.put("convertCase", processParams.convertCase);

        // String
        object.put("dateFormat", processParams.dateFormat);
        object.put("scenario", processParams.scenario);
        object.put("captureButtonScenario", processParams.captureButtonScenario);
        object.put("sessionLogFolder", processParams.sessionLogFolder);

        // Double
        object.put("timeout", processParams.timeout);
        object.put("timeoutFromFirstDetect", processParams.timeoutFromFirstDetect);
        object.put("timeoutFromFirstDocType", processParams.timeoutFromFirstDocType);
        object.put("documentAreaMin", processParams.documentAreaMin);

        // JSONArray
        object.put("documentIDList", generateIntArray(processParams.documentIDList));
        object.put("barcodeTypes", generateBarcodeTypeArray(processParams.doBarcodes));
        object.put("fieldTypesFilter", generateIntArray(processParams.fieldTypesFilter));
        object.put("documentGroupFilter", generateIntArray(processParams.documentGroupFilter));
        object.put("mrzFormatsFilter", generateArray(processParams.mrzFormatsFilter));
        object.put("resultTypeOutput", generateIntArray(processParams.resultTypeOutput));

        // JSONObject
        object.put("imageQA", generateImageQA(processParams.imageQA));
        object.put("rfidParams", generateRFIDParams(processParams.rfidParams));
        object.put("faceApiParams", generateFaceApiParams(processParams.faceApiParams));

        // Custom
        object.put("customParams", processParams.customParams);

        return object;
    }

    static void setCustomization(ParamsCustomization customization, JSONObject opts, Context context) throws JSONException {
        ParamsCustomization.CustomizationEditor editor = customization.edit();

        // Boolean
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

        // Int
        if (opts.has("cameraFrameBorderWidth"))
            editor.setCameraFrameBorderWidth(opts.getInt("cameraFrameBorderWidth"));
        if (opts.has("cameraFrameLineLength"))
            editor.setCameraFrameLineLength(opts.getInt("cameraFrameLineLength"));
        if (opts.has("cameraFrameShapeType"))
            editor.setCameraFrameShapeType(opts.getInt("cameraFrameShapeType"));
        if (opts.has("cameraFrameOffsetWidth"))
            editor.setCameraFrameOffsetWidth(opts.getInt("cameraFrameOffsetWidth"));
        if (opts.has("activityIndicatorSize"))
            editor.setActivityIndicatorSize(opts.getInt("activityIndicatorSize"));

        // String
        if (opts.has("status"))
            editor.setStatus(opts.getString("status"));
        if (opts.has("resultStatus"))
            editor.setResultStatus(opts.getString("resultStatus"));

        // Color
        if (opts.has("cameraFrameDefaultColor"))
            editor.setCameraFrameDefaultColor(colorWithLong(opts.getLong("cameraFrameDefaultColor")));
        if (opts.has("cameraFrameActiveColor"))
            editor.setCameraFrameActiveColor(colorWithLong(opts.getLong("cameraFrameActiveColor")));
        if (opts.has("statusTextColor"))
            editor.setStatusTextColor(colorWithLong(opts.getLong("statusTextColor")));
        if (opts.has("resultStatusTextColor"))
            editor.setResultStatusTextColor(colorWithLong(opts.getLong("resultStatusTextColor")));
        if (opts.has("resultStatusBackgroundColor"))
            editor.setResultStatusBackgroundColor(colorWithLong(opts.getLong("resultStatusBackgroundColor")));
        if (opts.has("multipageButtonBackgroundColor"))
            editor.setMultipageButtonBackgroundColor(colorWithLong(opts.getLong("multipageButtonBackgroundColor")));
        if (opts.has("tintColor"))
            editor.setTintColor(colorWithLong(opts.getLong("tintColor")));
        if (opts.has("activityIndicatorColor"))
            editor.setActivityIndicatorColor(colorWithLong(opts.getLong("activityIndicatorColor")));
        if (opts.has("statusBackgroundColor"))
            editor.setStatusBackgroundColor(colorWithLong(opts.getLong("statusBackgroundColor")));
        if (opts.has("cameraPreviewBackgroundColor"))
            editor.setCameraPreviewBackgroundColor(colorWithLong(opts.getLong("cameraPreviewBackgroundColor")));

        // Float
        if (opts.has("statusPositionMultiplier"))
            editor.setStatusPositionMultiplier((float) opts.getDouble("statusPositionMultiplier"));
        if (opts.has("resultStatusPositionMultiplier"))
            editor.setResultStatusPositionMultiplier((float) opts.getDouble("resultStatusPositionMultiplier"));
        if (opts.has("toolbarSize"))
            editor.setToolbarSize((float) opts.getDouble("toolbarSize"));
        if (opts.has("backgroundMaskAlpha"))
            editor.setBackgroundMaskAlpha((float) opts.getDouble("backgroundMaskAlpha"));
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
        if (opts.has("hologramAnimationPositionMultiplier"))
            editor.setHologramAnimationPositionMultiplier((float) opts.getDouble("hologramAnimationPositionMultiplier"));

        // Drawable
        if (opts.has("multipageAnimationFrontImage"))
            editor.setMultipageAnimationFrontImage(drawableFromBase64(opts.getString("multipageAnimationFrontImage"), context));
        if (opts.has("multipageAnimationBackImage"))
            editor.setMultipageAnimationBackImage(drawableFromBase64(opts.getString("multipageAnimationBackImage"), context));
        if (opts.has("borderBackgroundImage"))
            editor.setBorderBackgroundImage(drawableFromBase64(opts.getString("borderBackgroundImage"), context));
        if (opts.has("helpAnimationImage"))
            editor.setHelpAnimationImage(drawableFromBase64(opts.getString("helpAnimationImage"), context));
        if (opts.has("closeButtonImage"))
            editor.setCloseButtonImage(drawableFromBase64(opts.getString("closeButtonImage"), context));
        if (opts.has("captureButtonImage"))
            editor.setCaptureButtonImage(drawableFromBase64(opts.getString("captureButtonImage"), context));
        if (opts.has("changeFrameButtonCollapseImage"))
            editor.setChangeFrameCollapseButtonImage(drawableFromBase64(opts.getString("changeFrameButtonCollapseImage"), context));
        if (opts.has("changeFrameButtonExpandImage"))
            editor.setChangeFrameExpandButtonImage(drawableFromBase64(opts.getString("changeFrameButtonExpandImage"), context));
        if (opts.has("cameraSwitchButtonImage"))
            editor.setCameraSwitchButtonImage(drawableFromBase64(opts.getString("cameraSwitchButtonImage"), context));
        if (opts.has("torchButtonOnImage"))
            editor.setTorchImageOn(drawableFromBase64(opts.getString("torchButtonOnImage"), context));
        if (opts.has("torchButtonOffImage"))
            editor.setTorchImageOff(drawableFromBase64(opts.getString("torchButtonOffImage"), context));
        if (opts.has("hologramAnimationImage"))
            editor.setHologramAnimationImage(drawableFromBase64(opts.getString("hologramAnimationImage"), context));

        // Font
        if (opts.has("statusTextFont")) {
            Pair<Typeface, Integer> font = typeFaceFromJSON(opts.getJSONObject("statusTextFont"));
            assert font != null;
            editor.setStatusTextFont(font.first);
            if (font.second != null)
                editor.setStatusTextSize(font.second);
        }
        if (opts.has("resultStatusTextFont")) {
            Pair<Typeface, Integer> font = typeFaceFromJSON(opts.getJSONObject("resultStatusTextFont"));
            assert font != null;
            editor.setResultStatusTextFont(font.first);
            if (font.second != null)
                editor.setResultStatusTextSize(font.second);
        }

        // Custom
        if (opts.has("customLabelStatus"))
            editor.setCustomLabelStatus(new SpannableString(opts.getString("customLabelStatus")));
        if (opts.has("cameraFrameLineCap"))
            editor.setCameraFrameLineCap(Paint.Cap.values()[(opts.getInt("cameraFrameLineCap"))]);
        if (opts.has("uiCustomizationLayer"))
            editor.setUiCustomizationLayer(opts.getJSONObject("uiCustomizationLayer"));

        // Matrix
        if (opts.has("helpAnimationImageMatrix"))
            editor.setHelpAnimationImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("helpAnimationImageMatrix"))));
        if (opts.has("multipageAnimationFrontImageMatrix"))
            editor.setMultipageAnimationFrontImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationFrontImageMatrix"))));
        if (opts.has("multipageAnimationBackImageMatrix"))
            editor.setMultipageAnimationBackImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationBackImageMatrix"))));
        if (opts.has("hologramAnimationImageMatrix"))
            editor.setHologramAnimationImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("hologramAnimationImageMatrix"))));
        if (opts.has("borderBackgroundImageMatrix"))
            editor.setBorderBackgroundImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("borderBackgroundImageMatrix"))));

        editor.applyImmediately(context);
    }

    static JSONObject getCustomization(ParamsCustomization customization) throws JSONException {
        JSONObject object = new JSONObject();

        // Boolean
        object.put("showStatusMessages", customization.isShowStatusMessages());
        object.put("showResultStatusMessages", customization.isShowResultStatusMessages());
        object.put("showHelpAnimation", customization.isShowHelpAnimation());
        object.put("showNextPageAnimation", customization.isShowNextPageAnimation());
        object.put("showBackgroundMask", customization.isShowBackgroundMask());

        // Int
        object.put("cameraFrameBorderWidth", customization.getCameraFrameBorderWidth());
        object.put("cameraFrameLineLength", customization.getCameraFrameLineLength());
        object.put("cameraFrameShapeType", customization.getCameraFrameShapeType());
        object.put("cameraFrameOffsetWidth", customization.getCameraFrameOffsetWidth());
        object.put("activityIndicatorSize", customization.getActivityIndicatorSize());

        // String
        object.put("status", customization.getStatus());
        object.put("resultStatus", customization.getResultStatus());

        // Color
        object.put("cameraFrameDefaultColor", longWithColor(customization.getCameraFrameDefaultColor()));
        object.put("cameraFrameActiveColor", longWithColor(customization.getCameraFrameActiveColor()));
        object.put("statusTextColor", longWithColor(customization.getStatusTextColor()));
        object.put("resultStatusTextColor", longWithColor(customization.getResultStatusTextColor()));
        object.put("resultStatusBackgroundColor", longWithColor(customization.getResultStatusBackgroundColor()));
        object.put("multipageButtonBackgroundColor", longWithColor(customization.getMultipageButtonBackgroundColor()));
        object.put("tintColor", longWithColor(customization.getTintColor()));
        object.put("activityIndicatorColor", longWithColor(customization.getActivityIndicatorColor()));
        object.put("statusBackgroundColor", longWithColor(customization.getStatusBackgroundColor()));
        object.put("cameraPreviewBackgroundColor", longWithColor(customization.getCameraPreviewBackgroundColor()));

        // Float
        object.put("statusPositionMultiplier", customization.getStatusPositionMultiplier());
        object.put("resultStatusPositionMultiplier", customization.getResultStatusPositionMultiplier());
        object.put("backgroundMaskAlpha", customization.getBackgroundMaskAlpha());
        object.put("toolbarSize", customization.getToolbarSize());
        object.put("customStatusPositionMultiplier", customization.getCustomStatusPositionMultiplier());
        object.put("cameraFrameVerticalPositionMultiplier", customization.getCameraFrameVerticalPositionMultiplier());
        object.put("cameraFrameLandscapeAspectRatio", customization.getCameraFrameLandscapeAspectRatio());
        object.put("cameraFramePortraitAspectRatio", customization.getCameraFramePortraitAspectRatio());
        object.put("cameraFrameCornerRadius", customization.getCameraFrameCornerRadius());
        object.put("hologramAnimationPositionMultiplier", customization.getHologramAnimationPositionMultiplier());

        // Drawable
        object.put("multipageAnimationFrontImage", bitmapToBase64(bitmapFromDrawable(customization.getMultipageAnimationFrontImage())));
        object.put("multipageAnimationBackImage", bitmapToBase64(bitmapFromDrawable(customization.getMultipageAnimationBackImage())));
        object.put("borderBackgroundImage", bitmapToBase64(bitmapFromDrawable(customization.getBorderBackgroundImage())));
        object.put("helpAnimationImage", bitmapToBase64(bitmapFromDrawable(customization.getHelpAnimationImageDrawable())));
        object.put("closeButtonImage", bitmapToBase64(bitmapFromDrawable(customization.getCloseButtonDrawable())));
        object.put("captureButtonImage", bitmapToBase64(bitmapFromDrawable(customization.getCaptureButtonDrawable())));
        object.put("changeFrameButtonCollapseImage", bitmapToBase64(bitmapFromDrawable(customization.getChangeFrameCollapseButtonDrawable())));
        object.put("changeFrameButtonExpandImage", bitmapToBase64(bitmapFromDrawable(customization.getChangeFrameExpandButtonDrawable())));
        object.put("cameraSwitchButtonImage", bitmapToBase64(bitmapFromDrawable(customization.getCameraSwitchButtonDrawable())));
        object.put("torchButtonOnImage", bitmapToBase64(bitmapFromDrawable(customization.getTorchImageOnDrawable())));
        object.put("torchButtonOffImage", bitmapToBase64(bitmapFromDrawable(customization.getTorchImageOffDrawable())));
        object.put("hologramAnimationImage", bitmapToBase64(bitmapFromDrawable(customization.getHologramAnimationImage())));

        // Font
        // fonts have no getters

        // Custom
        object.put("customLabelStatus", toStringOrNull(customization.getCustomLabelStatus()));
        object.put("cameraFrameLineCap", paintCapToInt(customization.getCameraFrameLineCap()));
        object.put("uiCustomizationLayer", customization.getUiCustomizationLayer());

        // Matrix
        object.put("helpAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.getHelpAnimationImageMatrix())));
        object.put("multipageAnimationFrontImageMatrix", generateFloatArray(matrixToFloatArray(customization.getMultipageAnimationFrontImageMatrix())));
        object.put("multipageAnimationBackImageMatrix", generateFloatArray(matrixToFloatArray(customization.getMultipageAnimationBackImageMatrix())));
        object.put("hologramAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.getHologramAnimationImageMatrix())));
        object.put("borderBackgroundImageMatrix", generateFloatArray(matrixToFloatArray(customization.getBorderBackgroundImageMatrix())));

        return object;
    }

    static void setupScaleType() {
        Instance().customization().edit()
                .setHelpAnimationImageScaleType(ScaleType.MATRIX)
                .setMultipageAnimationFrontImageScaleType(ScaleType.MATRIX)
                .setMultipageAnimationBackImageScaleType(ScaleType.MATRIX)
                .setHologramAnimationImageScaleType(ScaleType.MATRIX)
                .setBorderBackgroundImageScaleType(ScaleType.MATRIX);
    }

    static void setRfidScenario(RfidScenario rfidScenario, JSONObject opts) throws JSONException {
        // Boolean
        if (opts.has("paceStaticBinding"))
            rfidScenario.setPaceStaticBinding(opts.getBoolean("paceStaticBinding"));
        if (opts.has("onlineTA"))
            rfidScenario.setOnlineTA(opts.getBoolean("onlineTA"));
        if (opts.has("writeEid"))
            rfidScenario.setWriteEid(opts.getBoolean("writeEid"));
        if (opts.has("universalAccessRights"))
            rfidScenario.setUniversalAccessRights(opts.getBoolean("universalAccessRights"));
        if (opts.has("authorizedRestrictedIdentification"))
            rfidScenario.setAuthorizedRestrictedIdentification(opts.getBoolean("authorizedRestrictedIdentification"));
        if (opts.has("auxVerificationCommunityID"))
            rfidScenario.setAuxVerificationCommunityID(opts.getBoolean("auxVerificationCommunityID"));
        if (opts.has("auxVerificationDateOfBirth"))
            rfidScenario.setAuxVerificationDateOfBirth(opts.getBoolean("auxVerificationDateOfBirth"));
        if (opts.has("skipAA"))
            rfidScenario.setSkipAA(opts.getBoolean("skipAA"));
        if (opts.has("strictProcessing"))
            rfidScenario.setStrictProcessing(opts.getBoolean("strictProcessing"));
        if (opts.has("pkdDSCertPriority"))
            rfidScenario.setPkdDSCertPriority(opts.getBoolean("pkdDSCertPriority"));
        if (opts.has("pkdUseExternalCSCA"))
            rfidScenario.setPkdUseExternalCSCA(opts.getBoolean("pkdUseExternalCSCA"));
        if (opts.has("trustedPKD"))
            rfidScenario.setTrustedPKD(opts.getBoolean("trustedPKD"));
        if (opts.has("passiveAuth"))
            rfidScenario.setPassiveAuth(opts.getBoolean("passiveAuth"));
        if (opts.has("useSFI"))
            rfidScenario.setUseSFI(opts.getBoolean("useSFI"));
        if (opts.has("readEPassport"))
            rfidScenario.setReadEPassport(opts.getBoolean("readEPassport"));
        if (opts.has("readEID"))
            rfidScenario.setReadEID(opts.getBoolean("readEID"));
        if (opts.has("readEDL"))
            rfidScenario.setReadEDL(opts.getBoolean("readEDL"));
        if (opts.has("authorizedSTSignature"))
            rfidScenario.setAuthorizedSTSignature(opts.getBoolean("authorizedSTSignature"));
        if (opts.has("authorizedSTQSignature"))
            rfidScenario.setAuthorizedSTQSignature(opts.getBoolean("authorizedSTQSignature"));
        if (opts.has("authorizedWriteDG17"))
            rfidScenario.setAuthorizedWriteDG17(opts.getBoolean("authorizedWriteDG17"));
        if (opts.has("authorizedWriteDG18"))
            rfidScenario.setAuthorizedWriteDG18(opts.getBoolean("authorizedWriteDG18"));
        if (opts.has("authorizedWriteDG19"))
            rfidScenario.setAuthorizedWriteDG19(opts.getBoolean("authorizedWriteDG19"));
        if (opts.has("authorizedWriteDG20"))
            rfidScenario.setAuthorizedWriteDG20(opts.getBoolean("authorizedWriteDG20"));
        if (opts.has("authorizedWriteDG21"))
            rfidScenario.setAuthorizedWriteDG21(opts.getBoolean("authorizedWriteDG21"));
        if (opts.has("authorizedVerifyAge"))
            rfidScenario.setAuthorizedVerifyAge(opts.getBoolean("authorizedVerifyAge"));
        if (opts.has("authorizedVerifyCommunityID"))
            rfidScenario.setAuthorizedVerifyCommunityID(opts.getBoolean("authorizedVerifyCommunityID"));
        if (opts.has("authorizedPrivilegedTerminal"))
            rfidScenario.setAuthorizedPrivilegedTerminal(opts.getBoolean("authorizedPrivilegedTerminal"));
        if (opts.has("authorizedCANAllowed"))
            rfidScenario.setAuthorizedCANAllowed(opts.getBoolean("authorizedCANAllowed"));
        if (opts.has("authorizedPINManagement"))
            rfidScenario.setAuthorizedPINManagment(opts.getBoolean("authorizedPINManagement"));
        if (opts.has("authorizedInstallCert"))
            rfidScenario.setAuthorizedInstallCert(opts.getBoolean("authorizedInstallCert"));
        if (opts.has("authorizedInstallQCert"))
            rfidScenario.setAuthorizedInstallQCert(opts.getBoolean("authorizedInstallQCert"));
        if (opts.has("applyAmendments"))
            rfidScenario.setApplyAmendments(opts.getBoolean("applyAmendments"));
        if (opts.has("autoSettings"))
            rfidScenario.setAutoSettings(opts.getBoolean("autoSettings"));

        // Int
        if (opts.has("signManagementAction"))
            rfidScenario.setSignManagementAction(opts.getInt("signManagementAction"));
        if (opts.has("readingBuffer"))
            rfidScenario.setReadingBuffer(opts.getInt("readingBuffer"));
        if (opts.has("onlineTAToSignDataType"))
            rfidScenario.setOnlineTAToSignDataType(opts.getInt("onlineTAToSignDataType"));
        if (opts.has("profilerType"))
            rfidScenario.setProfilerType(opts.getInt("profilerType"));
        if (opts.has("authProcType"))
            rfidScenario.setAuthProcType(opts.getInt("authProcType"));
        if (opts.has("baseSMProcedure"))
            rfidScenario.setBaseSMProcedure(opts.getInt("baseSMProcedure"));
        if (opts.has("pacePasswordType"))
            rfidScenario.setPacePasswordType(opts.getInt("pacePasswordType"));
        if (opts.has("terminalType"))
            rfidScenario.setTerminalType(opts.getInt("terminalType"));
        if (opts.has("defaultReadingBufferSize"))
            rfidScenario.setDefaultReadingBufferSize(opts.getInt("defaultReadingBufferSize"));

        // String
        if (opts.has("password"))
            rfidScenario.setPassword(opts.getString("password"));
        if (opts.has("pkdPA"))
            rfidScenario.setPkdPA(opts.getString("pkdPA"));
        if (opts.has("pkdEAC"))
            rfidScenario.setPkdEAC(opts.getString("pkdEAC"));
        if (opts.has("mrz"))
            rfidScenario.setMrz(opts.getString("mrz"));
        if (opts.has("eSignPINDefault"))
            rfidScenario.seteSignPINDefault(opts.getString("eSignPINDefault"));
        if (opts.has("eSignPINNewValue"))
            rfidScenario.seteSignPINNewValue(opts.getString("eSignPINNewValue"));

        // JSONObject
        if (opts.has("reprocessParams"))
            rfidScenario.setReprocessParams(reprocParamsFromJSON(opts.getJSONObject("reprocessParams")));

        // DataGroup
        if (opts.has("ePassportDataGroups"))
            setDataGroups(rfidScenario.ePassportDataGroups(), opts.getJSONObject("ePassportDataGroups"));
        if (opts.has("eIDDataGroups"))
            setDataGroups(rfidScenario.eIDDataGroups(), opts.getJSONObject("eIDDataGroups"));
        if (opts.has("eDLDataGroups"))
            setDataGroups(rfidScenario.eDLDataGroups(), opts.getJSONObject("eDLDataGroups"));

    }

    static JSONObject getRfidScenario(RfidScenario rfidScenario) throws JSONException {
        JSONObject object = new JSONObject();

        // Boolean
        object.put("paceStaticBinding", rfidScenario.isPaceStaticBinding());
        object.put("onlineTA", rfidScenario.isOnlineTA());
        object.put("writeEid", rfidScenario.isWriteEid());
        object.put("universalAccessRights", rfidScenario.isUniversalAccessRights());
        object.put("authorizedRestrictedIdentification", rfidScenario.isAuthorizedRestrictedIdentification());
        object.put("auxVerificationCommunityID", rfidScenario.isAuxVerificationCommunityID());
        object.put("auxVerificationDateOfBirth", rfidScenario.isAuxVerificationDateOfBirth());
        object.put("skipAA", rfidScenario.isSkipAA());
        object.put("strictProcessing", rfidScenario.isStrictProcessing());
        object.put("pkdDSCertPriority", rfidScenario.isPkdDSCertPriority());
        object.put("pkdUseExternalCSCA", rfidScenario.isPkdUseExternalCSCA());
        object.put("trustedPKD", rfidScenario.isTrustedPKD());
        object.put("passiveAuth", rfidScenario.isPassiveAuth());
        object.put("useSFI", rfidScenario.isUseSFI());
        object.put("readEPassport", rfidScenario.isReadEPassport());
        object.put("readEID", rfidScenario.isReadEID());
        object.put("readEDL", rfidScenario.isReadEDL());
        object.put("authorizedSTSignature", rfidScenario.isAuthorizedSTSignature());
        object.put("authorizedSTQSignature", rfidScenario.isAuthorizedSTQSignature());
        object.put("authorizedWriteDG17", rfidScenario.isAuthorizedWriteDG17());
        object.put("authorizedWriteDG18", rfidScenario.isAuthorizedWriteDG18());
        object.put("authorizedWriteDG19", rfidScenario.isAuthorizedWriteDG19());
        object.put("authorizedWriteDG20", rfidScenario.isAuthorizedWriteDG20());
        object.put("authorizedWriteDG21", rfidScenario.isAuthorizedWriteDG21());
        object.put("authorizedVerifyAge", rfidScenario.isAuthorizedVerifyAge());
        object.put("authorizedVerifyCommunityID", rfidScenario.isAuthorizedVerifyCommunityID());
        object.put("authorizedPrivilegedTerminal", rfidScenario.isAuthorizedPrivilegedTerminal());
        object.put("authorizedCANAllowed", rfidScenario.isAuthorizedCANAllowed());
        object.put("authorizedPINManagement", rfidScenario.isAuthorizedPINManagment());
        object.put("authorizedInstallCert", rfidScenario.isAuthorizedInstallCert());
        object.put("authorizedInstallQCert", rfidScenario.isAuthorizedInstallQCert());
        object.put("applyAmendments", rfidScenario.isApplyAmendments());
        object.put("autoSettings", rfidScenario.isAutoSettings());

        // Int
        object.put("signManagementAction", rfidScenario.getSignManagementAction());
        object.put("readingBuffer", rfidScenario.getReadingBuffer());
        object.put("onlineTAToSignDataType", rfidScenario.getOnlineTAToSignDataType());
        object.put("profilerType", rfidScenario.getProfilerType());
        object.put("authProcType", rfidScenario.getAuthProcType());
        object.put("baseSMProcedure", rfidScenario.getBaseSMProcedure());
        object.put("pacePasswordType", rfidScenario.getPacePasswordType());
        object.put("terminalType", rfidScenario.getTerminalType());
        object.put("defaultReadingBufferSize", rfidScenario.getDefaultReadingBufferSize());

        // String
        object.put("password", rfidScenario.getPassword());
        object.put("pkdPA", rfidScenario.getPkdPA());
        object.put("pkdEAC", rfidScenario.getPkdEAC());
        object.put("mrz", rfidScenario.getMrz());
        object.put("eSignPINDefault", rfidScenario.geteSignPINDefault());
        object.put("eSignPINNewValue", rfidScenario.geteSignPINNewValue());

        // JSONObject
        object.put("reprocessParams", generateReprocParams(rfidScenario.getReprocessParams()));

        // DataGroup
        object.put("ePassportDataGroups", getDataGroups(rfidScenario.ePassportDataGroups()));
        object.put("eIDDataGroups", getDataGroups(rfidScenario.eIDDataGroups()));
        object.put("eDLDataGroups", getDataGroups(rfidScenario.eDLDataGroups()));

        return object;
    }

    static void setDataGroups(DataGroups dataGroup, JSONObject opts) throws JSONException {

        // EDLDataGroups/Common: 1-14
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

        // EPassportDataGroups: 1-16
        if (dataGroup instanceof EPassportDataGroups) {
            if (opts.has("DG15"))
                ((EPassportDataGroups) dataGroup).setDG15(opts.getBoolean("DG15"));
            if (opts.has("DG16"))
                ((EPassportDataGroups) dataGroup).setDG16(opts.getBoolean("DG16"));
        }

        // EIDDataGroups: 1-21
        if (dataGroup instanceof EIDDataGroups) {
            if (opts.has("DG15"))
                ((EIDDataGroups) dataGroup).setDG15(opts.getBoolean("DG15"));
            if (opts.has("DG16"))
                ((EIDDataGroups) dataGroup).setDG16(opts.getBoolean("DG16"));
            if (opts.has("DG17"))
                ((EIDDataGroups) dataGroup).setDG17(opts.getBoolean("DG17"));
            if (opts.has("DG18"))
                ((EIDDataGroups) dataGroup).setDG18(opts.getBoolean("DG18"));
            if (opts.has("DG19"))
                ((EIDDataGroups) dataGroup).setDG19(opts.getBoolean("DG19"));
            if (opts.has("DG20"))
                ((EIDDataGroups) dataGroup).setDG20(opts.getBoolean("DG20"));
            if (opts.has("DG21"))
                ((EIDDataGroups) dataGroup).setDG21(opts.getBoolean("DG21"));
        }
    }

    static JSONObject getDataGroups(DataGroups dataGroup) throws JSONException {
        JSONObject object = new JSONObject();

        // EDLDataGroups/Common: 1-14
        object.put("DG1", dataGroup.isDG1());
        object.put("DG2", dataGroup.isDG2());
        object.put("DG3", dataGroup.isDG3());
        object.put("DG4", dataGroup.isDG4());
        object.put("DG5", dataGroup.isDG5());
        object.put("DG6", dataGroup.isDG6());
        object.put("DG7", dataGroup.isDG7());
        object.put("DG8", dataGroup.isDG8());
        object.put("DG9", dataGroup.isDG9());
        object.put("DG10", dataGroup.isDG10());
        object.put("DG11", dataGroup.isDG11());
        object.put("DG12", dataGroup.isDG12());
        object.put("DG13", dataGroup.isDG13());
        object.put("DG14", dataGroup.isDG14());

        // EPassportDataGroups: 1-16
        if (dataGroup instanceof EPassportDataGroups) {
            object.put("DG15", ((EPassportDataGroups) dataGroup).isDG15());
            object.put("DG16", ((EPassportDataGroups) dataGroup).isDG16());
        }

        // EIDDataGroups: 1-21
        if (dataGroup instanceof EIDDataGroups) {
            object.put("DG15", ((EIDDataGroups) dataGroup).isDG15());
            object.put("DG16", ((EIDDataGroups) dataGroup).isDG16());
            object.put("DG17", ((EIDDataGroups) dataGroup).isDG17());
            object.put("DG18", ((EIDDataGroups) dataGroup).isDG18());
            object.put("DG19", ((EIDDataGroups) dataGroup).isDG19());
            object.put("DG20", ((EIDDataGroups) dataGroup).isDG20());
            object.put("DG21", ((EIDDataGroups) dataGroup).isDG21());
        }

        return object;
    }
}