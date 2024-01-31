//
//  Config.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
@file:Suppress("USELESS_CAST")

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.content.Context
import android.graphics.Paint
import android.text.SpannableString
import android.widget.ImageView
import com.regula.documentreader.api.DocumentReader.Instance
import com.regula.documentreader.api.params.Functionality
import com.regula.documentreader.api.params.ImageQA
import com.regula.documentreader.api.params.ParamsCustomization
import com.regula.documentreader.api.params.ProcessParam
import com.regula.documentreader.api.params.RfidScenario
import com.regula.documentreader.api.params.rfid.dg.DataGroups
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.drawableFromBase64
import io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.drawableToBase64
import org.json.JSONObject

fun setFunctionality(functionality: Functionality, opts: JSONObject) {
    val editor = functionality.edit()

    // Boolean
    if (opts.has("pictureOnBoundsReady")) editor.setPictureOnBoundsReady(opts.getBoolean("pictureOnBoundsReady"))
    if (opts.has("showTorchButton")) editor.setShowTorchButton(opts.getBoolean("showTorchButton"))
    if (opts.has("showCloseButton")) editor.setShowCloseButton(opts.getBoolean("showCloseButton"))
    if (opts.has("videoCaptureMotionControl")) editor.setVideoCaptureMotionControl(opts.getBoolean("videoCaptureMotionControl"))
    if (opts.has("showCaptureButton")) editor.setShowCaptureButton(opts.getBoolean("showCaptureButton"))
    if (opts.has("showChangeFrameButton")) editor.setShowChangeFrameButton(opts.getBoolean("showChangeFrameButton"))
    if (opts.has("showSkipNextPageButton")) editor.setShowSkipNextPageButton(opts.getBoolean("showSkipNextPageButton"))
    if (opts.has("useAuthenticator")) editor.setUseAuthenticator(opts.getBoolean("useAuthenticator"))
    if (opts.has("skipFocusingFrames")) editor.setSkipFocusingFrames(opts.getBoolean("skipFocusingFrames"))
    if (opts.has("showCameraSwitchButton")) editor.setShowCameraSwitchButton(opts.getBoolean("showCameraSwitchButton"))
    if (opts.has("displayMetadata")) editor.setDisplayMetadata(opts.getBoolean("displayMetadata"))
    if (opts.has("isZoomEnabled")) editor.setZoomEnabled(opts.getBoolean("isZoomEnabled"))
    if (opts.has("isCameraTorchCheckDisabled")) editor.setIsCameraTorchCheckDisabled(opts.getBoolean("isCameraTorchCheckDisabled"))
    if (opts.has("recordScanningProcess")) editor.setDoRecordProcessingVideo(opts.getBoolean("recordScanningProcess"))
    if (opts.has("manualMultipageMode")) editor.setManualMultipageMode(opts.getBoolean("manualMultipageMode"))

    // Int
    if (opts.has("showCaptureButtonDelayFromDetect")) editor.setShowCaptureButtonDelayFromDetect(opts.getInt("showCaptureButtonDelayFromDetect").toLong())
    if (opts.has("showCaptureButtonDelayFromStart")) editor.setShowCaptureButtonDelayFromStart(opts.getInt("showCaptureButtonDelayFromStart").toLong())
    if (opts.has("orientation")) editor.setOrientation(opts.getInt("orientation"))
    if (opts.has("captureMode")) editor.setCaptureMode(opts.getInt("captureMode"))
    if (opts.has("cameraPosition")) editor.setCameraMode(opts.getInt("cameraPosition"))
    if (opts.has("rfidTimeout")) editor.setRfidTimeout(opts.getInt("rfidTimeout"))
    if (opts.has("forcePagesCount")) editor.setForcePagesCount(opts.getInt("forcePagesCount"))

    // String
    if (opts.has("cameraFrame")) editor.setCameraFrame(opts.getString("cameraFrame"))
    if (opts.has("btDeviceName")) editor.setBtDeviceName(opts.getString("btDeviceName"))

    // Float
    if (opts.has("zoomFactor")) editor.setZoomFactor(opts.getDouble("zoomFactor").toFloat())
    if (opts.has("exposure")) editor.setExposure(opts.getDouble("exposure").toFloat())

    // JSONArray
    if (opts.has("excludedCamera2Models")) editor.setExcludedCamera2Models(stringListFromJson(opts.getJSONArray("excludedCamera2Models")))

    // Custom
    // in ios - videoSessionPreset
    if (opts.has("cameraSize")) {
        val cameraSize = opts.getJSONObject("cameraSize")
        val width = cameraSize.getInt("width")
        val height = cameraSize.getInt("height")
        editor.setCameraSize(width, height)
    }
    editor.apply()
}

fun getFunctionality(functionality: Functionality): JSONObject {
    val result = JSONObject()

    // Boolean
    result.putOpt("pictureOnBoundsReady", functionality.isPictureOnBoundsReady)
    result.putOpt("showTorchButton", functionality.isShowTorchButton)
    result.putOpt("showCloseButton", functionality.isShowCloseButton)
    result.putOpt("videoCaptureMotionControl", functionality.isVideoCaptureMotionControl)
    result.putOpt("showCaptureButton", functionality.isShowCaptureButton)
    result.putOpt("showChangeFrameButton", functionality.isShowChangeFrameButton)
    result.putOpt("showSkipNextPageButton", functionality.isShowSkipNextPageButton)
    result.putOpt("useAuthenticator", functionality.isUseAuthenticator)
    result.putOpt("skipFocusingFrames", functionality.isSkipFocusingFrames)
    result.putOpt("showCameraSwitchButton", functionality.isShowCameraSwitchButton)
    result.putOpt("displayMetadata", functionality.isDisplayMetaData)
    result.putOpt("isZoomEnabled", functionality.isZoomEnabled)
    result.putOpt("isCameraTorchCheckDisabled", functionality.isCameraTorchCheckDisabled)
    result.putOpt("recordScanningProcess", functionality.doRecordProcessingVideo())
    result.putOpt("manualMultipageMode", functionality.isManualMultipageMode)

    // Int
    result.putOpt("showCaptureButtonDelayFromDetect", functionality.showCaptureButtonDelayFromDetect)
    result.putOpt("showCaptureButtonDelayFromStart", functionality.showCaptureButtonDelayFromStart)
    result.putOpt("orientation", functionality.orientation)
    result.putOpt("captureMode", functionality.captureMode)
    result.putOpt("cameraPosition", functionality.cameraMode)
    result.putOpt("rfidTimeout", functionality.rfidTimeout as Int?)
    result.putOpt("forcePagesCount", functionality.forcePagesCount)

    // String
    result.putOpt("cameraFrame", functionality.cameraFrame)
    result.putOpt("btDeviceName", functionality.btDeviceName)

    // Float
    result.putOpt("zoomFactor", functionality.zoomFactor)
    result.putOpt("exposure", functionality.exposure)

    // JSONArray
    result.putOpt("excludedCamera2Models", generateList(functionality.excludedCamera2Models))

    // Custom
    // in ios - videoSessionPreset
    result.putOpt("cameraSize", object : JSONObject() {
        init {
            put("width", functionality.cameraWidth)
            put("height", functionality.cameraHeight)
        }
    })
    return result
}

fun setProcessParams(processParams: ProcessParam, opts: JSONObject) {

    // Boolean
    if (opts.has("multipageProcessing")) processParams.multipageProcessing = opts.getBoolean("multipageProcessing")
    if (opts.has("logs")) processParams.setLogs(opts.getBoolean("logs"))
    if (opts.has("debugSaveImages")) processParams.debugSaveImages = opts.getBoolean("debugSaveImages")
    if (opts.has("debugSaveLogs")) processParams.debugSaveLogs = opts.getBoolean("debugSaveLogs")
    if (opts.has("returnUncroppedImage")) processParams.returnUncroppedImage = opts.getBoolean("returnUncroppedImage")
    if (opts.has("uvTorchEnabled")) processParams.uvTorchEnabled = opts.getBoolean("uvTorchEnabled")
    if (opts.has("debugSaveCroppedImages")) processParams.debugSaveCroppedImages = opts.getBoolean("debugSaveCroppedImages")
    if (opts.has("disableFocusingCheck")) processParams.disableFocusingCheck = opts.getBoolean("disableFocusingCheck")
    if (opts.has("debugSaveRFIDSession")) processParams.debugSaveRFIDSession = opts.getBoolean("debugSaveRFIDSession")
    if (opts.has("doublePageSpread")) processParams.doublePageSpread = opts.getBoolean("doublePageSpread")
    if (opts.has("manualCrop")) processParams.manualCrop = opts.getBoolean("manualCrop")
    if (opts.has("integralImage")) processParams.integralImage = opts.getBoolean("integralImage")
    if (opts.has("returnCroppedBarcode")) processParams.returnCroppedBarcode = opts.getBoolean("returnCroppedBarcode")
    if (opts.has("checkLiveness")) processParams.checkLiveness = opts.getBoolean("checkLiveness")
    if (opts.has("checkRequiredTextFields")) processParams.checkRequiredTextFields = opts.getBoolean("checkRequiredTextFields")
    if (opts.has("depersonalizeLog")) processParams.depersonalizeLog = opts.getBoolean("depersonalizeLog")
    if (opts.has("generateDoublePageSpreadImage")) processParams.generateDoublePageSpreadImage = opts.getBoolean("generateDoublePageSpreadImage")
    if (opts.has("alreadyCropped")) processParams.alreadyCropped = opts.getBoolean("alreadyCropped")
    if (opts.has("matchTextFieldMask")) processParams.matchTextFieldMask = opts.getBoolean("matchTextFieldMask")
    if (opts.has("fastDocDetect")) processParams.fastDocDetect = opts.getBoolean("fastDocDetect")
    if (opts.has("updateOCRValidityByGlare")) processParams.updateOCRValidityByGlare = opts.getBoolean("updateOCRValidityByGlare")
    if (opts.has("noGraphics")) processParams.noGraphics = opts.getBoolean("noGraphics")
    if (opts.has("multiDocOnImage")) processParams.multiDocOnImage = opts.getBoolean("multiDocOnImage")
    if (opts.has("forceReadMrzBeforeLocate")) processParams.forceReadMrzBeforeLocate = opts.getBoolean("forceReadMrzBeforeLocate")
    if (opts.has("parseBarcodes")) processParams.parseBarcodes = opts.getBoolean("parseBarcodes")
    if (opts.has("shouldReturnPackageForReprocess")) processParams.shouldReturnPackageForReprocess = opts.getBoolean("shouldReturnPackageForReprocess")
    if (opts.has("disablePerforationOCR")) processParams.disablePerforationOCR = opts.getBoolean("disablePerforationOCR")
    if (opts.has("respectImageQuality")) processParams.respectImageQuality = opts.getBoolean("respectImageQuality")
    if (opts.has("splitNames")) processParams.splitNames = opts.getBoolean("splitNames")
    if (opts.has("doDetectCan")) processParams.doDetectCan = opts.getBoolean("doDetectCan")
    if (opts.has("useFaceApi")) processParams.useFaceApi = opts.getBoolean("useFaceApi")

    // Int
    if (opts.has("measureSystem")) processParams.measureSystem = opts.getInt("measureSystem")
    if (opts.has("barcodeParserType")) processParams.barcodeParserType = opts.getInt("barcodeParserType")
    if (opts.has("perspectiveAngle")) processParams.perspectiveAngle = opts.getInt("perspectiveAngle")
    if (opts.has("minDPI")) processParams.minDPI = opts.getInt("minDPI")
    if (opts.has("imageDpiOutMax")) processParams.imageDpiOutMax = opts.getInt("imageDpiOutMax")
    if (opts.has("forceDocID")) processParams.forceDocID = opts.getInt("forceDocID")
    if (opts.has("forceDocFormat")) processParams.forceDocFormat = opts.getInt("forceDocFormat")
    if (opts.has("shiftExpiryDate")) processParams.shiftExpiryDate = opts.getInt("shiftExpiryDate")
    if (opts.has("minimalHolderAge")) processParams.minimalHolderAge = opts.getInt("minimalHolderAge")
    if (opts.has("imageOutputMaxHeight")) processParams.imageOutputMaxHeight = opts.getInt("imageOutputMaxHeight")
    if (opts.has("imageOutputMaxWidth")) processParams.imageOutputMaxWidth = opts.getInt("imageOutputMaxWidth")
    if (opts.has("processAuth")) processParams.processAuth = opts.getInt("processAuth")
    if (opts.has("convertCase")) processParams.convertCase = opts.getInt("convertCase")

    // String
    if (opts.has("dateFormat")) processParams.dateFormat = opts.getString("dateFormat")
    if (opts.has("scenario")) processParams.scenario = opts.getString("scenario")
    if (opts.has("captureButtonScenario")) processParams.captureButtonScenario = opts.getString("captureButtonScenario")
    if (opts.has("sessionLogFolder")) processParams.sessionLogFolder = opts.getString("sessionLogFolder")

    // Double
    if (opts.has("timeout")) processParams.timeout = opts.getDouble("timeout")
    if (opts.has("timeoutFromFirstDetect")) processParams.timeoutFromFirstDetect = opts.getDouble("timeoutFromFirstDetect")
    if (opts.has("timeoutFromFirstDocType")) processParams.timeoutFromFirstDocType = opts.getDouble("timeoutFromFirstDocType")
    if (opts.has("documentAreaMin")) processParams.documentAreaMin = opts.getDouble("documentAreaMin")

    // JSONArray
    if (opts.has("documentIDList")) processParams.documentIDList = intArrayFromJSON(opts.getJSONArray("documentIDList"))
    if (opts.has("fieldTypesFilter")) processParams.fieldTypesFilter = intArrayFromJSON(opts.getJSONArray("fieldTypesFilter"))
    if (opts.has("barcodeTypes")) processParams.doBarcodes = barcodeTypeArrayFromJson(opts.getJSONArray("barcodeTypes"))
    if (opts.has("resultTypeOutput")) processParams.resultTypeOutput = intArrayFromJSON(opts.getJSONArray("resultTypeOutput"))
    if (opts.has("mrzFormatsFilter")) processParams.mrzFormatsFilter = stringArrayFromJson(opts.getJSONArray("mrzFormatsFilter"))
    if (opts.has("documentGroupFilter")) processParams.documentGroupFilter = intArrayFromJSON(opts.getJSONArray("documentGroupFilter"))
    if (opts.has("lcidIgnoreFilter")) processParams.lcidIgnoreFilter = intArrayFromJSON(opts.getJSONArray("lcidIgnoreFilter"))
    if (opts.has("lcidFilter")) processParams.lcidFilter = intArrayFromJSON(opts.getJSONArray("lcidFilter"))

    // JSONObject
    if (opts.has("imageQA")) setImageQA(processParams.imageQA, opts.getJSONObject("imageQA"))
    if (opts.has("rfidParams")) processParams.rfidParams = rfidParamsFromJSON(opts.getJSONObject("rfidParams"))
    if (opts.has("faceApiParams")) processParams.faceApiParams = faceApiParamsFromJSON(opts.getJSONObject("faceApiParams"))

    // Custom
    if (opts.has("customParams")) processParams.customParams = opts.getJSONObject("customParams")
}

fun getProcessParams(processParams: ProcessParam): JSONObject {
    val result = JSONObject()

    // Boolean
    result.putOpt("multipageProcessing", processParams.multipageProcessing)
    result.putOpt("logs", processParams.isLogEnable)
    result.putOpt("debugSaveImages", processParams.debugSaveImages)
    result.putOpt("debugSaveLogs", processParams.debugSaveLogs)
    result.putOpt("returnUncroppedImage", processParams.returnUncroppedImage)
    result.putOpt("uvTorchEnabled", processParams.uvTorchEnabled)
    result.putOpt("debugSaveCroppedImages", processParams.debugSaveCroppedImages)
    result.putOpt("disableFocusingCheck", processParams.disableFocusingCheck)
    result.putOpt("debugSaveRFIDSession", processParams.debugSaveRFIDSession)
    result.putOpt("doublePageSpread", processParams.doublePageSpread)
    result.putOpt("manualCrop", processParams.manualCrop)
    result.putOpt("integralImage", processParams.integralImage)
    result.putOpt("returnCroppedBarcode", processParams.returnCroppedBarcode)
    result.putOpt("checkLiveness", processParams.checkLiveness)
    result.putOpt("checkRequiredTextFields", processParams.checkRequiredTextFields)
    result.putOpt("depersonalizeLog", processParams.depersonalizeLog)
    result.putOpt("generateDoublePageSpreadImage", processParams.generateDoublePageSpreadImage)
    result.putOpt("alreadyCropped", processParams.alreadyCropped)
    result.putOpt("matchTextFieldMask", processParams.matchTextFieldMask)
    result.putOpt("fastDocDetect", processParams.fastDocDetect)
    result.putOpt("updateOCRValidityByGlare", processParams.updateOCRValidityByGlare)
    result.putOpt("noGraphics", processParams.noGraphics)
    result.putOpt("multiDocOnImage", processParams.multiDocOnImage)
    result.putOpt("forceReadMrzBeforeLocate", processParams.forceReadMrzBeforeLocate)
    result.putOpt("parseBarcodes", processParams.parseBarcodes)
    result.putOpt("shouldReturnPackageForReprocess", processParams.shouldReturnPackageForReprocess)
    result.putOpt("disablePerforationOCR", processParams.disablePerforationOCR)
    result.putOpt("respectImageQuality", processParams.respectImageQuality)
    result.putOpt("splitNames", processParams.splitNames)
    result.putOpt("doDetectCan", processParams.doDetectCan)
    result.putOpt("useFaceApi", processParams.useFaceApi)

    // Int
    result.putOpt("measureSystem", processParams.measureSystem)
    result.putOpt("barcodeParserType", processParams.barcodeParserType)
    result.putOpt("perspectiveAngle", processParams.perspectiveAngle)
    result.putOpt("minDPI", processParams.minDPI)
    result.putOpt("imageDpiOutMax", processParams.imageDpiOutMax)
    result.putOpt("forceDocID", processParams.forceDocID)
    result.putOpt("forceDocFormat", processParams.forceDocFormat)
    result.putOpt("shiftExpiryDate", processParams.shiftExpiryDate)
    result.putOpt("minimalHolderAge", processParams.minimalHolderAge)
    result.putOpt("imageOutputMaxHeight", processParams.imageOutputMaxHeight)
    result.putOpt("imageOutputMaxWidth", processParams.imageOutputMaxWidth)
    result.putOpt("processAuth", processParams.processAuth)
    result.putOpt("convertCase", processParams.convertCase)

    // String
    result.putOpt("dateFormat", processParams.dateFormat)
    result.putOpt("scenario", processParams.scenario)
    result.putOpt("captureButtonScenario", processParams.captureButtonScenario)
    result.putOpt("sessionLogFolder", processParams.sessionLogFolder)

    // Double
    result.putOpt("timeout", processParams.timeout)
    result.putOpt("timeoutFromFirstDetect", processParams.timeoutFromFirstDetect)
    result.putOpt("timeoutFromFirstDocType", processParams.timeoutFromFirstDocType)
    result.putOpt("documentAreaMin", processParams.documentAreaMin)

    // JSONArray
    result.putOpt("documentIDList", generateIntArray(processParams.documentIDList))
    result.putOpt("barcodeTypes", generateBarcodeTypeArray(processParams.doBarcodes))
    result.putOpt("fieldTypesFilter", generateIntArray(processParams.fieldTypesFilter))
    result.putOpt("documentGroupFilter", generateIntArray(processParams.documentGroupFilter))
    result.putOpt("lcidIgnoreFilter", generateIntArray(processParams.lcidIgnoreFilter))
    result.putOpt("lcidFilter", generateIntArray(processParams.lcidFilter))
    result.putOpt("mrzFormatsFilter", generateArray(processParams.mrzFormatsFilter))
    result.putOpt("resultTypeOutput", generateIntArray(processParams.resultTypeOutput))

    // JSONObject
    result.putOpt("imageQA", getImageQA(processParams.imageQA))
    result.putOpt("rfidParams", generateRFIDParams(processParams.rfidParams))
    result.putOpt("faceApiParams", generateFaceApiParams(processParams.faceApiParams))

    // Custom
    result.putOpt("customParams", processParams.customParams)
    return result
}

fun setCustomization(customization: ParamsCustomization, opts: JSONObject, context: Context) {
    val editor = customization.edit()

    // Boolean
    if (opts.has("showStatusMessages")) editor.setShowStatusMessages(opts.getBoolean("showStatusMessages"))
    if (opts.has("showResultStatusMessages")) editor.setShowResultStatusMessages(opts.getBoolean("showResultStatusMessages"))
    if (opts.has("showHelpAnimation")) editor.setShowHelpAnimation(opts.getBoolean("showHelpAnimation"))
    if (opts.has("showNextPageAnimation")) editor.setShowNextPageAnimation(opts.getBoolean("showNextPageAnimation"))
    if (opts.has("showBackgroundMask")) editor.setShowBackgroundMask(opts.getBoolean("showBackgroundMask"))

    // Int
    if (opts.has("cameraFrameBorderWidth")) editor.setCameraFrameBorderWidth(opts.getInt("cameraFrameBorderWidth"))
    if (opts.has("cameraFrameLineLength")) editor.setCameraFrameLineLength(opts.getInt("cameraFrameLineLength"))
    if (opts.has("cameraFrameShapeType")) editor.setCameraFrameShapeType(opts.getInt("cameraFrameShapeType"))
    if (opts.has("cameraFrameOffsetWidth")) editor.setCameraFrameOffsetWidth(opts.getInt("cameraFrameOffsetWidth"))
    if (opts.has("activityIndicatorSize")) editor.setActivityIndicatorSize(opts.getInt("activityIndicatorSize"))

    // String
    if (opts.has("status")) editor.setStatus(opts.getString("status"))
    if (opts.has("resultStatus")) editor.setResultStatus(opts.getString("resultStatus"))

    // Color
    if (opts.has("cameraFrameDefaultColor")) editor.setCameraFrameDefaultColor(colorWithLong(opts.getLong("cameraFrameDefaultColor")))
    if (opts.has("cameraFrameActiveColor")) editor.setCameraFrameActiveColor(colorWithLong(opts.getLong("cameraFrameActiveColor")))
    if (opts.has("statusTextColor")) editor.setStatusTextColor(colorWithLong(opts.getLong("statusTextColor")))
    if (opts.has("resultStatusTextColor")) editor.setResultStatusTextColor(colorWithLong(opts.getLong("resultStatusTextColor")))
    if (opts.has("resultStatusBackgroundColor")) editor.setResultStatusBackgroundColor(colorWithLong(opts.getLong("resultStatusBackgroundColor")))
    if (opts.has("multipageButtonBackgroundColor")) editor.setMultipageButtonBackgroundColor(colorWithLong(opts.getLong("multipageButtonBackgroundColor")))
    if (opts.has("tintColor")) editor.setTintColor(colorWithLong(opts.getLong("tintColor")))
    if (opts.has("activityIndicatorColor")) editor.setActivityIndicatorColor(colorWithLong(opts.getLong("activityIndicatorColor")))
    if (opts.has("statusBackgroundColor")) editor.setStatusBackgroundColor(colorWithLong(opts.getLong("statusBackgroundColor")))
    if (opts.has("cameraPreviewBackgroundColor")) editor.setCameraPreviewBackgroundColor(colorWithLong(opts.getLong("cameraPreviewBackgroundColor")))

    // Float
    if (opts.has("statusPositionMultiplier")) editor.setStatusPositionMultiplier(opts.getDouble("statusPositionMultiplier").toFloat())
    if (opts.has("resultStatusPositionMultiplier")) editor.setResultStatusPositionMultiplier(opts.getDouble("resultStatusPositionMultiplier").toFloat())
    if (opts.has("toolbarSize")) editor.setToolbarSize(opts.getDouble("toolbarSize").toFloat())
    if (opts.has("backgroundMaskAlpha")) editor.setBackgroundMaskAlpha(opts.getDouble("backgroundMaskAlpha").toFloat())
    if (opts.has("customStatusPositionMultiplier")) editor.setCustomStatusPositionMultiplier(opts.getDouble("customStatusPositionMultiplier").toFloat())
    if (opts.has("cameraFrameVerticalPositionMultiplier")) editor.setCameraFrameVerticalPositionMultiplier(opts.getDouble("cameraFrameVerticalPositionMultiplier").toFloat())
    if (opts.has("cameraFrameLandscapeAspectRatio")) editor.setCameraFrameLandscapeAspectRatio(opts.getDouble("cameraFrameLandscapeAspectRatio").toFloat())
    if (opts.has("cameraFramePortraitAspectRatio")) editor.setCameraFramePortraitAspectRatio(opts.getDouble("cameraFramePortraitAspectRatio").toFloat())
    if (opts.has("cameraFrameCornerRadius")) editor.setCameraFrameCornerRadius(opts.getDouble("cameraFrameCornerRadius").toFloat())
    if (opts.has("hologramAnimationPositionMultiplier")) editor.setHologramAnimationPositionMultiplier(opts.getDouble("hologramAnimationPositionMultiplier").toFloat())

    // Drawable
    if (opts.has("multipageAnimationFrontImage")) editor.setMultipageAnimationFrontImage(drawableFromBase64(opts.getString("multipageAnimationFrontImage"), context))
    if (opts.has("multipageAnimationBackImage")) editor.setMultipageAnimationBackImage(drawableFromBase64(opts.getString("multipageAnimationBackImage"), context))
    if (opts.has("borderBackgroundImage")) editor.setBorderBackgroundImage(drawableFromBase64(opts.getString("borderBackgroundImage"), context))
    if (opts.has("helpAnimationImage")) editor.setHelpAnimationImage(drawableFromBase64(opts.getString("helpAnimationImage"), context))
    if (opts.has("closeButtonImage")) editor.setCloseButtonImage(drawableFromBase64(opts.getString("closeButtonImage"), context))
    if (opts.has("captureButtonImage")) editor.setCaptureButtonImage(drawableFromBase64(opts.getString("captureButtonImage"), context))
    if (opts.has("changeFrameButtonCollapseImage")) editor.setChangeFrameCollapseButtonImage(drawableFromBase64(opts.getString("changeFrameButtonCollapseImage"), context))
    if (opts.has("changeFrameButtonExpandImage")) editor.setChangeFrameExpandButtonImage(drawableFromBase64(opts.getString("changeFrameButtonExpandImage"), context))
    if (opts.has("cameraSwitchButtonImage")) editor.setCameraSwitchButtonImage(drawableFromBase64(opts.getString("cameraSwitchButtonImage"), context))
    if (opts.has("torchButtonOnImage")) editor.setTorchImageOn(drawableFromBase64(opts.getString("torchButtonOnImage"), context))
    if (opts.has("torchButtonOffImage")) editor.setTorchImageOff(drawableFromBase64(opts.getString("torchButtonOffImage"), context))
    if (opts.has("hologramAnimationImage")) editor.setHologramAnimationImage(drawableFromBase64(opts.getString("hologramAnimationImage"), context))

    // Font
    if (opts.has("statusTextFont")) {
        val font = typeFaceFromJSON(opts.getJSONObject("statusTextFont"))!!
        editor.setStatusTextFont(font.first)
        font.second?.let { editor.setStatusTextSize(it) }
    }
    if (opts.has("resultStatusTextFont")) {
        val font = typeFaceFromJSON(opts.getJSONObject("resultStatusTextFont"))!!
        editor.setResultStatusTextFont(font.first)
        font.second?.let { editor.setResultStatusTextSize(it) }
    }

    // Custom
    if (opts.has("customLabelStatus")) editor.setCustomLabelStatus(SpannableString(opts.getString("customLabelStatus")))
    if (opts.has("cameraFrameLineCap")) editor.setCameraFrameLineCap(Paint.Cap.values()[opts.getInt("cameraFrameLineCap")])
    if (opts.has("uiCustomizationLayer")) editor.setUiCustomizationLayer(opts.getJSONObject("uiCustomizationLayer"))

    // Matrix
    if (opts.has("helpAnimationImageMatrix")) editor.setHelpAnimationImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("helpAnimationImageMatrix"))))
    if (opts.has("multipageAnimationFrontImageMatrix")) editor.setMultipageAnimationFrontImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationFrontImageMatrix"))))
    if (opts.has("multipageAnimationBackImageMatrix")) editor.setMultipageAnimationBackImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("multipageAnimationBackImageMatrix"))))
    if (opts.has("hologramAnimationImageMatrix")) editor.setHologramAnimationImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("hologramAnimationImageMatrix"))))
    if (opts.has("borderBackgroundImageMatrix")) editor.setBorderBackgroundImageMatrix(matrixFromFloatArray(floatArrayFromJson(opts.getJSONArray("borderBackgroundImageMatrix"))))
    editor.applyImmediately(context)
}

fun getCustomization(customization: ParamsCustomization): JSONObject {
    val result = JSONObject()

    // Boolean
    result.putOpt("showStatusMessages", customization.isShowStatusMessages)
    result.putOpt("showResultStatusMessages", customization.isShowResultStatusMessages)
    result.putOpt("showHelpAnimation", customization.isShowHelpAnimation)
    result.putOpt("showNextPageAnimation", customization.isShowNextPageAnimation)
    result.putOpt("showBackgroundMask", customization.isShowBackgroundMask)

    // Int
    result.putOpt("cameraFrameBorderWidth", customization.cameraFrameBorderWidth as Int?)
    result.putOpt("cameraFrameLineLength", customization.cameraFrameLineLength as Int?)
    result.putOpt("cameraFrameShapeType", customization.cameraFrameShapeType as Int?)
    result.putOpt("cameraFrameOffsetWidth", customization.cameraFrameOffsetWidth as Int?)

    result.putOpt("activityIndicatorSize", customization.activityIndicatorSize as Int?)

    // String
    result.putOpt("status", customization.status)
    result.putOpt("resultStatus", customization.resultStatus)

    // Color
    result.putOpt("cameraFrameDefaultColor", longWithColor(customization.cameraFrameDefaultColor))
    result.putOpt("cameraFrameActiveColor", longWithColor(customization.cameraFrameActiveColor))
    result.putOpt("statusTextColor", longWithColor(customization.statusTextColor))
    result.putOpt("resultStatusTextColor", longWithColor(customization.resultStatusTextColor))
    result.putOpt("resultStatusBackgroundColor", longWithColor(customization.resultStatusBackgroundColor))
    result.putOpt("multipageButtonBackgroundColor", longWithColor(customization.multipageButtonBackgroundColor))
    result.putOpt("tintColor", longWithColor(customization.tintColor))
    result.putOpt("activityIndicatorColor", longWithColor(customization.activityIndicatorColor))
    result.putOpt("statusBackgroundColor", longWithColor(customization.statusBackgroundColor))
    result.putOpt("cameraPreviewBackgroundColor", longWithColor(customization.cameraPreviewBackgroundColor))

    // Float
    result.putOpt("statusPositionMultiplier", customization.statusPositionMultiplier)
    result.putOpt("resultStatusPositionMultiplier", customization.resultStatusPositionMultiplier)
    result.putOpt("backgroundMaskAlpha", customization.backgroundMaskAlpha)
    result.putOpt("toolbarSize", customization.toolbarSize)
    result.putOpt("customStatusPositionMultiplier", customization.customStatusPositionMultiplier)
    result.putOpt("cameraFrameVerticalPositionMultiplier", customization.cameraFrameVerticalPositionMultiplier)
    result.putOpt("cameraFrameLandscapeAspectRatio", customization.cameraFrameLandscapeAspectRatio)
    result.putOpt("cameraFramePortraitAspectRatio", customization.cameraFramePortraitAspectRatio)
    result.putOpt("cameraFrameCornerRadius", customization.cameraFrameCornerRadius)
    result.putOpt("hologramAnimationPositionMultiplier", customization.hologramAnimationPositionMultiplier)

    // Drawable
    result.putOpt("multipageAnimationFrontImage", drawableToBase64(customization.multipageAnimationFrontImage))
    result.putOpt("multipageAnimationBackImage", drawableToBase64(customization.multipageAnimationBackImage))
    result.putOpt("borderBackgroundImage", drawableToBase64(customization.borderBackgroundImage))
    result.putOpt("helpAnimationImage", drawableToBase64(customization.helpAnimationImageDrawable))
    result.putOpt("closeButtonImage", drawableToBase64(customization.closeButtonDrawable))
    result.putOpt("captureButtonImage", drawableToBase64(customization.captureButtonDrawable))
    result.putOpt("changeFrameButtonCollapseImage", drawableToBase64(customization.changeFrameCollapseButtonDrawable))
    result.putOpt("changeFrameButtonExpandImage", drawableToBase64(customization.changeFrameExpandButtonDrawable))
    result.putOpt("cameraSwitchButtonImage", drawableToBase64(customization.cameraSwitchButtonDrawable))
    result.putOpt("torchButtonOnImage", drawableToBase64(customization.torchImageOnDrawable))
    result.putOpt("torchButtonOffImage", drawableToBase64(customization.torchImageOffDrawable))
    result.putOpt("hologramAnimationImage", drawableToBase64(customization.hologramAnimationImage))

    // Font
    // fonts have no getters

    // Custom
    result.putOpt("customLabelStatus", customization.customLabelStatus?.toString())
    result.putOpt("cameraFrameLineCap", paintCapToInt(customization.cameraFrameLineCap))
    result.putOpt("uiCustomizationLayer", customization.uiCustomizationLayer)

    // Matrix
    result.putOpt("helpAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.helpAnimationImageMatrix)))
    result.putOpt("multipageAnimationFrontImageMatrix", generateFloatArray(matrixToFloatArray(customization.multipageAnimationFrontImageMatrix)))
    result.putOpt("multipageAnimationBackImageMatrix", generateFloatArray(matrixToFloatArray(customization.multipageAnimationBackImageMatrix)))
    result.putOpt("hologramAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.hologramAnimationImageMatrix)))
    result.putOpt("borderBackgroundImageMatrix", generateFloatArray(matrixToFloatArray(customization.borderBackgroundImageMatrix)))
    return result
}

fun setupScaleType() {
    Instance().customization().edit()
        .setHelpAnimationImageScaleType(ImageView.ScaleType.MATRIX)
        .setMultipageAnimationFrontImageScaleType(ImageView.ScaleType.MATRIX)
        .setMultipageAnimationBackImageScaleType(ImageView.ScaleType.MATRIX)
        .setHologramAnimationImageScaleType(ImageView.ScaleType.MATRIX)
        .setBorderBackgroundImageScaleType(ImageView.ScaleType.MATRIX)
}

fun setRfidScenario(rfidScenario: RfidScenario, opts: JSONObject) {
    // Boolean
    if (opts.has("paceStaticBinding")) rfidScenario.isPaceStaticBinding = opts.getBoolean("paceStaticBinding")
    if (opts.has("onlineTA")) rfidScenario.isOnlineTA = opts.getBoolean("onlineTA")
    if (opts.has("writeEid")) rfidScenario.isWriteEid = opts.getBoolean("writeEid")
    if (opts.has("universalAccessRights")) rfidScenario.isUniversalAccessRights = opts.getBoolean("universalAccessRights")
    if (opts.has("authorizedRestrictedIdentification")) rfidScenario.isAuthorizedRestrictedIdentification = opts.getBoolean("authorizedRestrictedIdentification")
    if (opts.has("auxVerificationCommunityID")) rfidScenario.isAuxVerificationCommunityID = opts.getBoolean("auxVerificationCommunityID")
    if (opts.has("auxVerificationDateOfBirth")) rfidScenario.isAuxVerificationDateOfBirth = opts.getBoolean("auxVerificationDateOfBirth")
    if (opts.has("skipAA")) rfidScenario.isSkipAA = opts.getBoolean("skipAA")
    if (opts.has("strictProcessing")) rfidScenario.isStrictProcessing = opts.getBoolean("strictProcessing")
    if (opts.has("pkdDSCertPriority")) rfidScenario.isPkdDSCertPriority = opts.getBoolean("pkdDSCertPriority")
    if (opts.has("pkdUseExternalCSCA")) rfidScenario.isPkdUseExternalCSCA = opts.getBoolean("pkdUseExternalCSCA")
    if (opts.has("trustedPKD")) rfidScenario.isTrustedPKD = opts.getBoolean("trustedPKD")
    if (opts.has("passiveAuth")) rfidScenario.isPassiveAuth = opts.getBoolean("passiveAuth")
    if (opts.has("useSFI")) rfidScenario.isUseSFI = opts.getBoolean("useSFI")
    if (opts.has("readEPassport")) rfidScenario.isReadEPassport = opts.getBoolean("readEPassport")
    if (opts.has("readEID")) rfidScenario.isReadEID = opts.getBoolean("readEID")
    if (opts.has("readEDL")) rfidScenario.isReadEDL = opts.getBoolean("readEDL")
    if (opts.has("authorizedSTSignature")) rfidScenario.isAuthorizedSTSignature = opts.getBoolean("authorizedSTSignature")
    if (opts.has("authorizedSTQSignature")) rfidScenario.isAuthorizedSTQSignature = opts.getBoolean("authorizedSTQSignature")
    if (opts.has("authorizedWriteDG17")) rfidScenario.isAuthorizedWriteDG17 = opts.getBoolean("authorizedWriteDG17")
    if (opts.has("authorizedWriteDG18")) rfidScenario.isAuthorizedWriteDG18 = opts.getBoolean("authorizedWriteDG18")
    if (opts.has("authorizedWriteDG19")) rfidScenario.isAuthorizedWriteDG19 = opts.getBoolean("authorizedWriteDG19")
    if (opts.has("authorizedWriteDG20")) rfidScenario.isAuthorizedWriteDG20 = opts.getBoolean("authorizedWriteDG20")
    if (opts.has("authorizedWriteDG21")) rfidScenario.isAuthorizedWriteDG21 = opts.getBoolean("authorizedWriteDG21")
    if (opts.has("authorizedVerifyAge")) rfidScenario.isAuthorizedVerifyAge = opts.getBoolean("authorizedVerifyAge")
    if (opts.has("authorizedVerifyCommunityID")) rfidScenario.isAuthorizedVerifyCommunityID = opts.getBoolean("authorizedVerifyCommunityID")
    if (opts.has("authorizedPrivilegedTerminal")) rfidScenario.isAuthorizedPrivilegedTerminal = opts.getBoolean("authorizedPrivilegedTerminal")
    if (opts.has("authorizedCANAllowed")) rfidScenario.isAuthorizedCANAllowed = opts.getBoolean("authorizedCANAllowed")
    if (opts.has("authorizedPINManagement")) rfidScenario.isAuthorizedPINManagment = opts.getBoolean("authorizedPINManagement")
    if (opts.has("authorizedInstallCert")) rfidScenario.isAuthorizedInstallCert = opts.getBoolean("authorizedInstallCert")
    if (opts.has("authorizedInstallQCert")) rfidScenario.isAuthorizedInstallQCert = opts.getBoolean("authorizedInstallQCert")
    if (opts.has("applyAmendments")) rfidScenario.isApplyAmendments = opts.getBoolean("applyAmendments")
    if (opts.has("autoSettings")) rfidScenario.isAutoSettings = opts.getBoolean("autoSettings")

    // Int
    if (opts.has("signManagementAction")) rfidScenario.signManagementAction = opts.getInt("signManagementAction")
    if (opts.has("readingBuffer")) rfidScenario.readingBuffer = opts.getInt("readingBuffer")
    if (opts.has("onlineTAToSignDataType")) rfidScenario.onlineTAToSignDataType = opts.getInt("onlineTAToSignDataType")
    if (opts.has("profilerType")) rfidScenario.profilerType = opts.getInt("profilerType")
    if (opts.has("authProcType")) rfidScenario.authProcType = opts.getInt("authProcType")
    if (opts.has("baseSMProcedure")) rfidScenario.baseSMProcedure = opts.getInt("baseSMProcedure")
    if (opts.has("pacePasswordType")) rfidScenario.pacePasswordType = opts.getInt("pacePasswordType")
    if (opts.has("terminalType")) rfidScenario.terminalType = opts.getInt("terminalType")
    if (opts.has("defaultReadingBufferSize")) rfidScenario.defaultReadingBufferSize = opts.getInt("defaultReadingBufferSize")

    // String
    if (opts.has("password")) rfidScenario.password = opts.getString("password")
    if (opts.has("pkdPA")) rfidScenario.pkdPA = opts.getString("pkdPA")
    if (opts.has("pkdEAC")) rfidScenario.pkdEAC = opts.getString("pkdEAC")
    if (opts.has("mrz")) rfidScenario.mrz = opts.getString("mrz")
    if (opts.has("eSignPINDefault")) rfidScenario.seteSignPINDefault(opts.getString("eSignPINDefault"))
    if (opts.has("eSignPINNewValue")) rfidScenario.seteSignPINNewValue(opts.getString("eSignPINNewValue"))

    // JSONObject
    if (opts.has("reprocessParams")) rfidScenario.reprocessParams = reprocParamsFromJSON(opts.getJSONObject("reprocessParams"))

    // DataGroup
    if (opts.has("ePassportDataGroups")) setDataGroups(rfidScenario.ePassportDataGroups(), opts.getJSONObject("ePassportDataGroups"))
    if (opts.has("eIDDataGroups")) setDataGroups(rfidScenario.eIDDataGroups(), opts.getJSONObject("eIDDataGroups"))
    if (opts.has("eDLDataGroups")) setDataGroups(rfidScenario.eDLDataGroups(), opts.getJSONObject("eDLDataGroups"))
}

fun getRfidScenario(rfidScenario: RfidScenario): JSONObject {
    val result = JSONObject()

    // Boolean
    result.putOpt("paceStaticBinding", rfidScenario.isPaceStaticBinding)
    result.putOpt("onlineTA", rfidScenario.isOnlineTA)
    result.putOpt("writeEid", rfidScenario.isWriteEid)
    result.putOpt("universalAccessRights", rfidScenario.isUniversalAccessRights)
    result.putOpt("authorizedRestrictedIdentification", rfidScenario.isAuthorizedRestrictedIdentification)
    result.putOpt("auxVerificationCommunityID", rfidScenario.isAuxVerificationCommunityID)
    result.putOpt("auxVerificationDateOfBirth", rfidScenario.isAuxVerificationDateOfBirth)
    result.putOpt("skipAA", rfidScenario.isSkipAA)
    result.putOpt("strictProcessing", rfidScenario.isStrictProcessing)
    result.putOpt("pkdDSCertPriority", rfidScenario.isPkdDSCertPriority)
    result.putOpt("pkdUseExternalCSCA", rfidScenario.isPkdUseExternalCSCA)
    result.putOpt("trustedPKD", rfidScenario.isTrustedPKD)
    result.putOpt("passiveAuth", rfidScenario.isPassiveAuth)
    result.putOpt("useSFI", rfidScenario.isUseSFI)
    result.putOpt("readEPassport", rfidScenario.isReadEPassport)
    result.putOpt("readEID", rfidScenario.isReadEID)
    result.putOpt("readEDL", rfidScenario.isReadEDL)
    result.putOpt("authorizedSTSignature", rfidScenario.isAuthorizedSTSignature)
    result.putOpt("authorizedSTQSignature", rfidScenario.isAuthorizedSTQSignature)
    result.putOpt("authorizedWriteDG17", rfidScenario.isAuthorizedWriteDG17)
    result.putOpt("authorizedWriteDG18", rfidScenario.isAuthorizedWriteDG18)
    result.putOpt("authorizedWriteDG19", rfidScenario.isAuthorizedWriteDG19)
    result.putOpt("authorizedWriteDG20", rfidScenario.isAuthorizedWriteDG20)
    result.putOpt("authorizedWriteDG21", rfidScenario.isAuthorizedWriteDG21)
    result.putOpt("authorizedVerifyAge", rfidScenario.isAuthorizedVerifyAge)
    result.putOpt("authorizedVerifyCommunityID", rfidScenario.isAuthorizedVerifyCommunityID)
    result.putOpt("authorizedPrivilegedTerminal", rfidScenario.isAuthorizedPrivilegedTerminal)
    result.putOpt("authorizedCANAllowed", rfidScenario.isAuthorizedCANAllowed)
    result.putOpt("authorizedPINManagement", rfidScenario.isAuthorizedPINManagment)
    result.putOpt("authorizedInstallCert", rfidScenario.isAuthorizedInstallCert)
    result.putOpt("authorizedInstallQCert", rfidScenario.isAuthorizedInstallQCert)
    result.putOpt("applyAmendments", rfidScenario.isApplyAmendments)
    result.putOpt("autoSettings", rfidScenario.isAutoSettings)

    // Int
    result.putOpt("signManagementAction", rfidScenario.signManagementAction)
    result.putOpt("readingBuffer", rfidScenario.readingBuffer)
    result.putOpt("onlineTAToSignDataType", rfidScenario.onlineTAToSignDataType)
    result.putOpt("profilerType", rfidScenario.profilerType)
    result.putOpt("authProcType", rfidScenario.authProcType)
    result.putOpt("baseSMProcedure", rfidScenario.baseSMProcedure)
    result.putOpt("pacePasswordType", rfidScenario.pacePasswordType)
    result.putOpt("terminalType", rfidScenario.terminalType)
    result.putOpt("defaultReadingBufferSize", rfidScenario.defaultReadingBufferSize)

    // String
    result.putOpt("password", rfidScenario.password)
    result.putOpt("pkdPA", rfidScenario.pkdPA)
    result.putOpt("pkdEAC", rfidScenario.pkdEAC)
    result.putOpt("mrz", rfidScenario.mrz)
    result.putOpt("eSignPINDefault", rfidScenario.geteSignPINDefault())
    result.putOpt("eSignPINNewValue", rfidScenario.geteSignPINNewValue())

    // JSONObject
    result.putOpt("reprocessParams", generateReprocParams(rfidScenario.reprocessParams))

    // DataGroup
    result.putOpt("ePassportDataGroups", getDataGroups(rfidScenario.ePassportDataGroups()))
    result.putOpt("eIDDataGroups", getDataGroups(rfidScenario.eIDDataGroups()))
    result.putOpt("eDLDataGroups", getDataGroups(rfidScenario.eDLDataGroups()))
    return result
}

fun setDataGroups(dataGroup: DataGroups, opts: JSONObject) {
    // EDLDataGroups/Common: 1-14
    if (opts.has("DG1")) dataGroup.isDG1 = opts.getBoolean("DG1")
    if (opts.has("DG2")) dataGroup.isDG2 = opts.getBoolean("DG2")
    if (opts.has("DG3")) dataGroup.isDG3 = opts.getBoolean("DG3")
    if (opts.has("DG4")) dataGroup.isDG4 = opts.getBoolean("DG4")
    if (opts.has("DG5")) dataGroup.isDG5 = opts.getBoolean("DG5")
    if (opts.has("DG6")) dataGroup.isDG6 = opts.getBoolean("DG6")
    if (opts.has("DG7")) dataGroup.isDG7 = opts.getBoolean("DG7")
    if (opts.has("DG8")) dataGroup.isDG8 = opts.getBoolean("DG8")
    if (opts.has("DG9")) dataGroup.isDG9 = opts.getBoolean("DG9")
    if (opts.has("DG10")) dataGroup.isDG10 = opts.getBoolean("DG10")
    if (opts.has("DG11")) dataGroup.isDG11 = opts.getBoolean("DG11")
    if (opts.has("DG12")) dataGroup.isDG12 = opts.getBoolean("DG12")
    if (opts.has("DG13")) dataGroup.isDG13 = opts.getBoolean("DG13")
    if (opts.has("DG14")) dataGroup.isDG14 = opts.getBoolean("DG14")

    // EPassportDataGroups: 1-16
    if (dataGroup is EPassportDataGroups) {
        if (opts.has("DG15")) dataGroup.isDG15 = opts.getBoolean("DG15")
        if (opts.has("DG16")) dataGroup.isDG16 = opts.getBoolean("DG16")
    }

    // EIDDataGroups: 1-21
    if (dataGroup is EIDDataGroups) {
        if (opts.has("DG15")) dataGroup.isDG15 = opts.getBoolean("DG15")
        if (opts.has("DG16")) dataGroup.isDG16 = opts.getBoolean("DG16")
        if (opts.has("DG17")) dataGroup.isDG17 = opts.getBoolean("DG17")
        if (opts.has("DG18")) dataGroup.isDG18 = opts.getBoolean("DG18")
        if (opts.has("DG19")) dataGroup.isDG19 = opts.getBoolean("DG19")
        if (opts.has("DG20")) dataGroup.isDG20 = opts.getBoolean("DG20")
        if (opts.has("DG21")) dataGroup.isDG21 = opts.getBoolean("DG21")
    }
}

fun getDataGroups(dataGroup: DataGroups): JSONObject {
    val result = JSONObject()

    // EDLDataGroups/Common: 1-14
    result.putOpt("DG1", dataGroup.isDG1)
    result.putOpt("DG2", dataGroup.isDG2)
    result.putOpt("DG3", dataGroup.isDG3)
    result.putOpt("DG4", dataGroup.isDG4)
    result.putOpt("DG5", dataGroup.isDG5)
    result.putOpt("DG6", dataGroup.isDG6)
    result.putOpt("DG7", dataGroup.isDG7)
    result.putOpt("DG8", dataGroup.isDG8)
    result.putOpt("DG9", dataGroup.isDG9)
    result.putOpt("DG10", dataGroup.isDG10)
    result.putOpt("DG11", dataGroup.isDG11)
    result.putOpt("DG12", dataGroup.isDG12)
    result.putOpt("DG13", dataGroup.isDG13)
    result.putOpt("DG14", dataGroup.isDG14)

    // EPassportDataGroups: 1-16
    if (dataGroup is EPassportDataGroups) {
        result.putOpt("DG15", dataGroup.isDG15)
        result.putOpt("DG16", dataGroup.isDG16)
    }

    // EIDDataGroups: 1-21
    if (dataGroup is EIDDataGroups) {
        result.putOpt("DG15", dataGroup.isDG15)
        result.putOpt("DG16", dataGroup.isDG16)
        result.putOpt("DG17", dataGroup.isDG17)
        result.putOpt("DG18", dataGroup.isDG18)
        result.putOpt("DG19", dataGroup.isDG19)
        result.putOpt("DG20", dataGroup.isDG20)
        result.putOpt("DG21", dataGroup.isDG21)
    }
    return result
}

fun setImageQA(imageQA: ImageQA, opts: JSONObject) {
    if (opts.has("dpiThreshold")) imageQA.dpiThreshold = opts.getInt("dpiThreshold")
    if (opts.has("angleThreshold")) imageQA.angleThreshold = opts.getInt("angleThreshold")
    if (opts.has("focusCheck")) imageQA.focusCheck = opts.getBoolean("focusCheck")
    if (opts.has("glaresCheck")) imageQA.glaresCheck = opts.getBoolean("glaresCheck")
    if (opts.has("colornessCheck")) imageQA.colornessCheck = opts.getBoolean("colornessCheck")
    if (opts.has("screenCapture")) imageQA.screenCapture = opts.getBoolean("screenCapture")
    if (opts.has("expectedPass")) imageQA.expectedPass = intArrayFromJSON(opts.getJSONArray("expectedPass"))
    if (opts.has("documentPositionIndent")) imageQA.documentPositionIndent = opts.getInt("documentPositionIndent")
    if (opts.has("glaresCheckParams")) imageQA.glaresCheckParams = glaresCheckParamsFromJSON(opts.getJSONObject("glaresCheckParams"))
    if (opts.has("brightnessThreshold")) imageQA.brightnessThreshold = opts.getDouble("brightnessThreshold")
}

fun getImageQA(imageQA: ImageQA): JSONObject {
    val result = JSONObject()

    result.putOpt("dpiThreshold", imageQA.dpiThreshold)
    result.putOpt("angleThreshold", imageQA.angleThreshold)
    result.putOpt("focusCheck", imageQA.focusCheck)
    result.putOpt("glaresCheck", imageQA.glaresCheck)
    result.putOpt("colornessCheck", imageQA.colornessCheck)
    result.putOpt("screenCapture", imageQA.screenCapture)
    result.putOpt("documentPositionIndent", imageQA.documentPositionIndent as Int?)
    result.putOpt("expectedPass", generateIntArray(imageQA.expectedPass))
    result.putOpt("glaresCheckParams", generateGlaresCheckParams(imageQA.glaresCheckParams))
    result.putOpt("brightnessThreshold", imageQA.brightnessThreshold as Double?)

    return result
}