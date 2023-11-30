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
import com.regula.documentreader.api.DocumentReader
import com.regula.documentreader.api.params.Functionality
import com.regula.documentreader.api.params.ParamsCustomization
import com.regula.documentreader.api.params.ProcessParam
import com.regula.documentreader.api.params.RfidScenario
import com.regula.documentreader.api.params.rfid.dg.DataGroups
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups
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
    result.put("pictureOnBoundsReady", functionality.isPictureOnBoundsReady)
    result.put("showTorchButton", functionality.isShowTorchButton)
    result.put("showCloseButton", functionality.isShowCloseButton)
    result.put("videoCaptureMotionControl", functionality.isVideoCaptureMotionControl)
    result.put("showCaptureButton", functionality.isShowCaptureButton)
    result.put("showChangeFrameButton", functionality.isShowChangeFrameButton)
    result.put("showSkipNextPageButton", functionality.isShowSkipNextPageButton)
    result.put("useAuthenticator", functionality.isUseAuthenticator)
    result.put("skipFocusingFrames", functionality.isSkipFocusingFrames)
    result.put("showCameraSwitchButton", functionality.isShowCameraSwitchButton)
    result.put("displayMetadata", functionality.isDisplayMetaData)
    result.put("isZoomEnabled", functionality.isZoomEnabled)
    result.put("isCameraTorchCheckDisabled", functionality.isCameraTorchCheckDisabled)
    result.put("recordScanningProcess", functionality.doRecordProcessingVideo())
    result.put("manualMultipageMode", functionality.isManualMultipageMode)

    // Int
    result.put("showCaptureButtonDelayFromDetect", functionality.showCaptureButtonDelayFromDetect)
    result.put("showCaptureButtonDelayFromStart", functionality.showCaptureButtonDelayFromStart)
    result.put("orientation", functionality.orientation)
    result.put("captureMode", functionality.captureMode)
    result.put("cameraPosition", functionality.cameraMode)
    result.put("rfidTimeout", functionality.rfidTimeout as Int?)
    result.put("forcePagesCount", functionality.forcePagesCount)

    // String
    result.put("cameraFrame", functionality.cameraFrame)
    result.put("btDeviceName", functionality.btDeviceName)

    // Float
    result.put("zoomFactor", functionality.zoomFactor)
    result.put("exposure", functionality.exposure)

    // JSONArray
    result.put("excludedCamera2Models", generateList(functionality.excludedCamera2Models))

    // Custom
    // in ios - videoSessionPreset
    result.put("cameraSize", object : JSONObject() {
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
    if (opts.has("checkHologram")) processParams.checkHologram = opts.getBoolean("checkHologram")
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
    if (opts.has("doFlipYAxis")) processParams.doFlipYAxis = opts.getBoolean("doFlipYAxis")
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

    // JSONObject
    if (opts.has("imageQA")) processParams.imageQA = imageQAFromJSON(opts.getJSONObject("imageQA"))!!
    if (opts.has("rfidParams")) processParams.rfidParams = rfidParamsFromJSON(opts.getJSONObject("rfidParams"))
    if (opts.has("faceApiParams")) processParams.faceApiParams = faceApiParamsFromJSON(opts.getJSONObject("faceApiParams"))

    // Custom
    if (opts.has("customParams")) processParams.customParams = opts.getJSONObject("customParams")
}

fun getProcessParams(processParams: ProcessParam): JSONObject {
    val result = JSONObject()

    // Boolean
    result.put("multipageProcessing", processParams.multipageProcessing)
    result.put("logs", processParams.isLogEnable)
    result.put("debugSaveImages", processParams.debugSaveImages)
    result.put("debugSaveLogs", processParams.debugSaveLogs)
    result.put("returnUncroppedImage", processParams.returnUncroppedImage)
    result.put("uvTorchEnabled", processParams.uvTorchEnabled)
    result.put("debugSaveCroppedImages", processParams.debugSaveCroppedImages)
    result.put("disableFocusingCheck", processParams.disableFocusingCheck)
    result.put("debugSaveRFIDSession", processParams.debugSaveRFIDSession)
    result.put("doublePageSpread", processParams.doublePageSpread)
    result.put("manualCrop", processParams.manualCrop)
    result.put("integralImage", processParams.integralImage)
    result.put("returnCroppedBarcode", processParams.returnCroppedBarcode)
    result.put("checkHologram", processParams.checkHologram)
    result.put("checkRequiredTextFields", processParams.checkRequiredTextFields)
    result.put("depersonalizeLog", processParams.depersonalizeLog)
    result.put("generateDoublePageSpreadImage", processParams.generateDoublePageSpreadImage)
    result.put("alreadyCropped", processParams.alreadyCropped)
    result.put("matchTextFieldMask", processParams.matchTextFieldMask)
    result.put("fastDocDetect", processParams.fastDocDetect)
    result.put("updateOCRValidityByGlare", processParams.updateOCRValidityByGlare)
    result.put("noGraphics", processParams.noGraphics)
    result.put("multiDocOnImage", processParams.multiDocOnImage)
    result.put("forceReadMrzBeforeLocate", processParams.forceReadMrzBeforeLocate)
    result.put("parseBarcodes", processParams.parseBarcodes)
    result.put("shouldReturnPackageForReprocess", processParams.shouldReturnPackageForReprocess)
    result.put("disablePerforationOCR", processParams.disablePerforationOCR)
    result.put("respectImageQuality", processParams.respectImageQuality)
    result.put("splitNames", processParams.splitNames)
    result.put("doFlipYAxis", processParams.doFlipYAxis)
    result.put("doDetectCan", processParams.doDetectCan)
    result.put("useFaceApi", processParams.useFaceApi)

    // Int
    result.put("measureSystem", processParams.measureSystem)
    result.put("barcodeParserType", processParams.barcodeParserType)
    result.put("perspectiveAngle", processParams.perspectiveAngle)
    result.put("minDPI", processParams.minDPI)
    result.put("imageDpiOutMax", processParams.imageDpiOutMax)
    result.put("forceDocID", processParams.forceDocID)
    result.put("forceDocFormat", processParams.forceDocFormat)
    result.put("shiftExpiryDate", processParams.shiftExpiryDate)
    result.put("minimalHolderAge", processParams.minimalHolderAge)
    result.put("imageOutputMaxHeight", processParams.imageOutputMaxHeight)
    result.put("imageOutputMaxWidth", processParams.imageOutputMaxWidth)
    result.put("processAuth", processParams.processAuth)
    result.put("convertCase", processParams.convertCase)

    // String
    result.put("dateFormat", processParams.dateFormat)
    result.put("scenario", processParams.scenario)
    result.put("captureButtonScenario", processParams.captureButtonScenario)
    result.put("sessionLogFolder", processParams.sessionLogFolder)

    // Double
    result.put("timeout", processParams.timeout)
    result.put("timeoutFromFirstDetect", processParams.timeoutFromFirstDetect)
    result.put("timeoutFromFirstDocType", processParams.timeoutFromFirstDocType)
    result.put("documentAreaMin", processParams.documentAreaMin)

    // JSONArray
    result.put("documentIDList", generateIntArray(processParams.documentIDList))
    result.put("barcodeTypes", generateBarcodeTypeArray(processParams.doBarcodes))
    result.put("fieldTypesFilter", generateIntArray(processParams.fieldTypesFilter))
    result.put("documentGroupFilter", generateIntArray(processParams.documentGroupFilter))
    result.put("mrzFormatsFilter", generateArray(processParams.mrzFormatsFilter))
    result.put("resultTypeOutput", generateIntArray(processParams.resultTypeOutput))

    // JSONObject
    result.put("imageQA", generateImageQA(processParams.imageQA))
    result.put("rfidParams", generateRFIDParams(processParams.rfidParams))
    result.put("faceApiParams", generateFaceApiParams(processParams.faceApiParams))

    // Custom
    result.put("customParams", processParams.customParams)
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
    if (opts.has("multipageAnimationFrontImage")) editor.setMultipageAnimationFrontImage(Convert.drawableFromBase64(opts.getString("multipageAnimationFrontImage"), context))
    if (opts.has("multipageAnimationBackImage")) editor.setMultipageAnimationBackImage(Convert.drawableFromBase64(opts.getString("multipageAnimationBackImage"), context))
    if (opts.has("borderBackgroundImage")) editor.setBorderBackgroundImage(Convert.drawableFromBase64(opts.getString("borderBackgroundImage"), context))
    if (opts.has("helpAnimationImage")) editor.setHelpAnimationImage(Convert.drawableFromBase64(opts.getString("helpAnimationImage"), context))
    if (opts.has("closeButtonImage")) editor.setCloseButtonImage(Convert.drawableFromBase64(opts.getString("closeButtonImage"), context))
    if (opts.has("captureButtonImage")) editor.setCaptureButtonImage(Convert.drawableFromBase64(opts.getString("captureButtonImage"), context))
    if (opts.has("changeFrameButtonCollapseImage")) editor.setChangeFrameCollapseButtonImage(Convert.drawableFromBase64(opts.getString("changeFrameButtonCollapseImage"), context))
    if (opts.has("changeFrameButtonExpandImage")) editor.setChangeFrameExpandButtonImage(Convert.drawableFromBase64(opts.getString("changeFrameButtonExpandImage"), context))
    if (opts.has("cameraSwitchButtonImage")) editor.setCameraSwitchButtonImage(Convert.drawableFromBase64(opts.getString("cameraSwitchButtonImage"), context))
    if (opts.has("torchButtonOnImage")) editor.setTorchImageOn(Convert.drawableFromBase64(opts.getString("torchButtonOnImage"), context))
    if (opts.has("torchButtonOffImage")) editor.setTorchImageOff(Convert.drawableFromBase64(opts.getString("torchButtonOffImage"), context))
    if (opts.has("hologramAnimationImage")) editor.setHologramAnimationImage(Convert.drawableFromBase64(opts.getString("hologramAnimationImage"), context))

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
    result.put("showStatusMessages", customization.isShowStatusMessages)
    result.put("showResultStatusMessages", customization.isShowResultStatusMessages)
    result.put("showHelpAnimation", customization.isShowHelpAnimation)
    result.put("showNextPageAnimation", customization.isShowNextPageAnimation)
    result.put("showBackgroundMask", customization.isShowBackgroundMask)

    // Int
    result.put("cameraFrameBorderWidth", customization.cameraFrameBorderWidth as Int?)
    result.put("cameraFrameLineLength", customization.cameraFrameLineLength as Int?)
    result.put("cameraFrameShapeType", customization.cameraFrameShapeType as Int?)
    result.put("cameraFrameOffsetWidth", customization.cameraFrameOffsetWidth as Int?)

    result.put("activityIndicatorSize", customization.activityIndicatorSize as Int?)

    // String
    result.put("status", customization.status)
    result.put("resultStatus", customization.resultStatus)

    // Color
    result.put("cameraFrameDefaultColor", longWithColor(customization.cameraFrameDefaultColor))
    result.put("cameraFrameActiveColor", longWithColor(customization.cameraFrameActiveColor))
    result.put("statusTextColor", longWithColor(customization.statusTextColor))
    result.put("resultStatusTextColor", longWithColor(customization.resultStatusTextColor))
    result.put("resultStatusBackgroundColor", longWithColor(customization.resultStatusBackgroundColor))
    result.put("multipageButtonBackgroundColor", longWithColor(customization.multipageButtonBackgroundColor))
    result.put("tintColor", longWithColor(customization.tintColor))
    result.put("activityIndicatorColor", longWithColor(customization.activityIndicatorColor))
    result.put("statusBackgroundColor", longWithColor(customization.statusBackgroundColor))
    result.put("cameraPreviewBackgroundColor", longWithColor(customization.cameraPreviewBackgroundColor))

    // Float
    result.put("statusPositionMultiplier", customization.statusPositionMultiplier)
    result.put("resultStatusPositionMultiplier", customization.resultStatusPositionMultiplier)
    result.put("backgroundMaskAlpha", customization.backgroundMaskAlpha)
    result.put("toolbarSize", customization.toolbarSize)
    result.put("customStatusPositionMultiplier", customization.customStatusPositionMultiplier)
    result.put("cameraFrameVerticalPositionMultiplier", customization.cameraFrameVerticalPositionMultiplier)
    result.put("cameraFrameLandscapeAspectRatio", customization.cameraFrameLandscapeAspectRatio)
    result.put("cameraFramePortraitAspectRatio", customization.cameraFramePortraitAspectRatio)
    result.put("cameraFrameCornerRadius", customization.cameraFrameCornerRadius)
    result.put("hologramAnimationPositionMultiplier", customization.hologramAnimationPositionMultiplier)

    // Drawable
    result.put("multipageAnimationFrontImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.multipageAnimationFrontImage)))
    result.put("multipageAnimationBackImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.multipageAnimationBackImage)))
    result.put("borderBackgroundImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.borderBackgroundImage)))
    result.put("helpAnimationImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.helpAnimationImageDrawable)))
    result.put("closeButtonImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.closeButtonDrawable)))
    result.put("captureButtonImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.captureButtonDrawable)))
    result.put("changeFrameButtonCollapseImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.changeFrameCollapseButtonDrawable)))
    result.put("changeFrameButtonExpandImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.changeFrameExpandButtonDrawable)))
    result.put("cameraSwitchButtonImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.cameraSwitchButtonDrawable)))
    result.put("torchButtonOnImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.torchImageOnDrawable)))
    result.put("torchButtonOffImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.torchImageOffDrawable)))
    result.put("hologramAnimationImage", Convert.bitmapToBase64(Convert.bitmapFromDrawable(customization.hologramAnimationImage)))

    // Font
    // fonts have no getters

    // Custom
    result.put("customLabelStatus", customization.customLabelStatus?.toString())
    result.put("cameraFrameLineCap", paintCapToInt(customization.cameraFrameLineCap))
    result.put("uiCustomizationLayer", customization.uiCustomizationLayer)

    // Matrix
    result.put("helpAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.helpAnimationImageMatrix)))
    result.put("multipageAnimationFrontImageMatrix", generateFloatArray(matrixToFloatArray(customization.multipageAnimationFrontImageMatrix)))
    result.put("multipageAnimationBackImageMatrix", generateFloatArray(matrixToFloatArray(customization.multipageAnimationBackImageMatrix)))
    result.put("hologramAnimationImageMatrix", generateFloatArray(matrixToFloatArray(customization.hologramAnimationImageMatrix)))
    result.put("borderBackgroundImageMatrix", generateFloatArray(matrixToFloatArray(customization.borderBackgroundImageMatrix)))
    return result
}

fun setupScaleType() {
    DocumentReader.Instance().customization().edit()
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
    result.put("paceStaticBinding", rfidScenario.isPaceStaticBinding)
    result.put("onlineTA", rfidScenario.isOnlineTA)
    result.put("writeEid", rfidScenario.isWriteEid)
    result.put("universalAccessRights", rfidScenario.isUniversalAccessRights)
    result.put("authorizedRestrictedIdentification", rfidScenario.isAuthorizedRestrictedIdentification)
    result.put("auxVerificationCommunityID", rfidScenario.isAuxVerificationCommunityID)
    result.put("auxVerificationDateOfBirth", rfidScenario.isAuxVerificationDateOfBirth)
    result.put("skipAA", rfidScenario.isSkipAA)
    result.put("strictProcessing", rfidScenario.isStrictProcessing)
    result.put("pkdDSCertPriority", rfidScenario.isPkdDSCertPriority)
    result.put("pkdUseExternalCSCA", rfidScenario.isPkdUseExternalCSCA)
    result.put("trustedPKD", rfidScenario.isTrustedPKD)
    result.put("passiveAuth", rfidScenario.isPassiveAuth)
    result.put("useSFI", rfidScenario.isUseSFI)
    result.put("readEPassport", rfidScenario.isReadEPassport)
    result.put("readEID", rfidScenario.isReadEID)
    result.put("readEDL", rfidScenario.isReadEDL)
    result.put("authorizedSTSignature", rfidScenario.isAuthorizedSTSignature)
    result.put("authorizedSTQSignature", rfidScenario.isAuthorizedSTQSignature)
    result.put("authorizedWriteDG17", rfidScenario.isAuthorizedWriteDG17)
    result.put("authorizedWriteDG18", rfidScenario.isAuthorizedWriteDG18)
    result.put("authorizedWriteDG19", rfidScenario.isAuthorizedWriteDG19)
    result.put("authorizedWriteDG20", rfidScenario.isAuthorizedWriteDG20)
    result.put("authorizedWriteDG21", rfidScenario.isAuthorizedWriteDG21)
    result.put("authorizedVerifyAge", rfidScenario.isAuthorizedVerifyAge)
    result.put("authorizedVerifyCommunityID", rfidScenario.isAuthorizedVerifyCommunityID)
    result.put("authorizedPrivilegedTerminal", rfidScenario.isAuthorizedPrivilegedTerminal)
    result.put("authorizedCANAllowed", rfidScenario.isAuthorizedCANAllowed)
    result.put("authorizedPINManagement", rfidScenario.isAuthorizedPINManagment)
    result.put("authorizedInstallCert", rfidScenario.isAuthorizedInstallCert)
    result.put("authorizedInstallQCert", rfidScenario.isAuthorizedInstallQCert)
    result.put("applyAmendments", rfidScenario.isApplyAmendments)
    result.put("autoSettings", rfidScenario.isAutoSettings)

    // Int
    result.put("signManagementAction", rfidScenario.signManagementAction)
    result.put("readingBuffer", rfidScenario.readingBuffer)
    result.put("onlineTAToSignDataType", rfidScenario.onlineTAToSignDataType)
    result.put("profilerType", rfidScenario.profilerType)
    result.put("authProcType", rfidScenario.authProcType)
    result.put("baseSMProcedure", rfidScenario.baseSMProcedure)
    result.put("pacePasswordType", rfidScenario.pacePasswordType)
    result.put("terminalType", rfidScenario.terminalType)
    result.put("defaultReadingBufferSize", rfidScenario.defaultReadingBufferSize)

    // String
    result.put("password", rfidScenario.password)
    result.put("pkdPA", rfidScenario.pkdPA)
    result.put("pkdEAC", rfidScenario.pkdEAC)
    result.put("mrz", rfidScenario.mrz)
    result.put("eSignPINDefault", rfidScenario.geteSignPINDefault())
    result.put("eSignPINNewValue", rfidScenario.geteSignPINNewValue())

    // JSONObject
    result.put("reprocessParams", generateReprocParams(rfidScenario.reprocessParams))

    // DataGroup
    result.put("ePassportDataGroups", getDataGroups(rfidScenario.ePassportDataGroups()))
    result.put("eIDDataGroups", getDataGroups(rfidScenario.eIDDataGroups()))
    result.put("eDLDataGroups", getDataGroups(rfidScenario.eDLDataGroups()))
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
    result.put("DG1", dataGroup.isDG1)
    result.put("DG2", dataGroup.isDG2)
    result.put("DG3", dataGroup.isDG3)
    result.put("DG4", dataGroup.isDG4)
    result.put("DG5", dataGroup.isDG5)
    result.put("DG6", dataGroup.isDG6)
    result.put("DG7", dataGroup.isDG7)
    result.put("DG8", dataGroup.isDG8)
    result.put("DG9", dataGroup.isDG9)
    result.put("DG10", dataGroup.isDG10)
    result.put("DG11", dataGroup.isDG11)
    result.put("DG12", dataGroup.isDG12)
    result.put("DG13", dataGroup.isDG13)
    result.put("DG14", dataGroup.isDG14)

    // EPassportDataGroups: 1-16
    if (dataGroup is EPassportDataGroups) {
        result.put("DG15", dataGroup.isDG15)
        result.put("DG16", dataGroup.isDG16)
    }

    // EIDDataGroups: 1-21
    if (dataGroup is EIDDataGroups) {
        result.put("DG15", dataGroup.isDG15)
        result.put("DG16", dataGroup.isDG16)
        result.put("DG17", dataGroup.isDG17)
        result.put("DG18", dataGroup.isDG18)
        result.put("DG19", dataGroup.isDG19)
        result.put("DG20", dataGroup.isDG20)
        result.put("DG21", dataGroup.isDG21)
    }
    return result
}