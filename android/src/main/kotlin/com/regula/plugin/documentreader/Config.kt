@file:Suppress("EnumValuesSoftDeprecate", "DEPRECATION")

package com.regula.plugin.documentreader

import android.graphics.Paint
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.text.SpannableString
import android.widget.ImageView
import androidx.core.content.ContextCompat
import com.regula.documentreader.api.enums.CustomizationColor
import com.regula.documentreader.api.enums.CustomizationFont
import com.regula.documentreader.api.enums.CustomizationImage
import com.regula.documentreader.api.enums.LogLevel
import com.regula.documentreader.api.params.AuthenticityParams
import com.regula.documentreader.api.params.Functionality
import com.regula.documentreader.api.params.ImageQA
import com.regula.documentreader.api.params.LivenessParams
import com.regula.documentreader.api.params.ParamsCustomization
import com.regula.documentreader.api.params.ProcessParam
import com.regula.documentreader.api.params.RfidScenario
import com.regula.documentreader.api.params.rfid.dg.DTCDataGroup
import com.regula.documentreader.api.params.rfid.dg.DataGroups
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups
import com.regula.plugin.documentreader.Convert.toBase64
import com.regula.plugin.documentreader.Convert.toDrawable
import org.json.JSONArray
import org.json.JSONObject

fun setFunctionality(config: Functionality, input: JSONObject) = input.forEach { k, v ->
    val editor = config.edit()
    when (k) {
        "pictureOnBoundsReady" -> editor.setPictureOnBoundsReady(v as Boolean)
        "showTorchButton" -> editor.setShowTorchButton(v as Boolean)
        "showCloseButton" -> editor.setShowCloseButton(v as Boolean)
        "videoCaptureMotionControl" -> editor.setVideoCaptureMotionControl(v as Boolean)
        "showCaptureButton" -> editor.setShowCaptureButton(v as Boolean)
        "showChangeFrameButton" -> editor.setShowChangeFrameButton(v as Boolean)
        "showSkipNextPageButton" -> editor.setShowSkipNextPageButton(v as Boolean)
        "useAuthenticator" -> editor.setUseAuthenticator(v as Boolean)
        "skipFocusingFrames" -> editor.setSkipFocusingFrames(v as Boolean)
        "showCameraSwitchButton" -> editor.setShowCameraSwitchButton(v as Boolean)
        "displayMetadata" -> editor.setDisplayMetadata(v as Boolean)
        "isZoomEnabled" -> editor.setZoomEnabled(v as Boolean)
        "isCameraTorchCheckDisabled" -> editor.setIsCameraTorchCheckDisabled(v as Boolean)
        "recordScanningProcess" -> editor.setDoRecordProcessingVideo(v as Boolean)
        "manualMultipageMode" -> editor.setManualMultipageMode(v as Boolean)
        "torchTurnedOn" -> editor.setTorchTurnedOn(v as Boolean)
        "preventScreenRecording" -> editor.setPreventScreenRecording(v as Boolean)
        "showCaptureButtonDelayFromDetect" -> editor.setShowCaptureButtonDelayFromDetect(v.toLong())
        "showCaptureButtonDelayFromStart" -> editor.setShowCaptureButtonDelayFromStart(v.toLong())
        "orientation" -> editor.setOrientation(v.toInt())
        "captureMode" -> editor.setCaptureMode(v.toInt())
        "cameraMode" -> editor.setCameraMode(v.toInt())
        "rfidTimeout" -> editor.setRfidTimeout(v.toInt())
        "forcePagesCount" -> editor.setForcePagesCount(v.toInt())
        "cameraFrame" -> editor.setCameraFrame(v as String)
        "btDeviceName" -> editor.setBtDeviceName(v as String)
        "zoomFactor" -> editor.setZoomFactor(v.toFloat())
        "exposure" -> editor.setExposure(v.toFloat())
        "videoRecordingSizeDownscaleFactor" -> editor.setVideoRecordingSizeDownscaleFactor(v.toFloat())
        "mdlTimeout" -> editor.setMDLTimeout(v.toDouble())
        "excludedCamera2Models" -> editor.setExcludedCamera2Models((v as JSONArray).toList())
        "cameraSize" -> editor.setCameraSize(cameraSizeFromJSON(v as JSONObject).first, cameraSizeFromJSON(v).second)
    }
    editor.apply()
}

fun getFunctionality(input: Functionality) = mapOf(
    "pictureOnBoundsReady" to input.isPictureOnBoundsReady,
    "showTorchButton" to input.isShowTorchButton,
    "showCloseButton" to input.isShowCloseButton,
    "videoCaptureMotionControl" to input.isVideoCaptureMotionControl,
    "showCaptureButton" to input.isShowCaptureButton,
    "showChangeFrameButton" to input.isShowChangeFrameButton,
    "showSkipNextPageButton" to input.isShowSkipNextPageButton,
    "useAuthenticator" to input.isUseAuthenticator,
    "skipFocusingFrames" to input.isSkipFocusingFrames,
    "showCameraSwitchButton" to input.isShowCameraSwitchButton,
    "displayMetadata" to input.isDisplayMetaData,
    "isZoomEnabled" to input.isZoomEnabled,
    "isCameraTorchCheckDisabled" to input.isCameraTorchCheckDisabled,
    "recordScanningProcess" to input.doRecordProcessingVideo(),
    "manualMultipageMode" to input.isManualMultipageMode,
    "torchTurnedOn" to input.isTorchTurnedOn,
    "preventScreenRecording" to input.doPreventScreenRecording(),
    "showCaptureButtonDelayFromDetect" to input.showCaptureButtonDelayFromDetect,
    "showCaptureButtonDelayFromStart" to input.showCaptureButtonDelayFromStart,
    "orientation" to input.orientation,
    "captureMode" to input.captureMode,
    "cameraMode" to input.cameraMode,
    "rfidTimeout" to input.rfidTimeout,
    "forcePagesCount" to input.forcePagesCount,
    "cameraFrame" to input.cameraFrame,
    "btDeviceName" to input.btDeviceName,
    "zoomFactor" to input.zoomFactor,
    "exposure" to input.exposure,
    "videoRecordingSizeDownscaleFactor" to input.videoRecordingSizeDownscaleFactor,
    "mdlTimeout" to input.mdlTimeout,
    "excludedCamera2Models" to input.excludedCamera2Models.toJson(),
    "cameraSize" to generateCameraSize(input.cameraWidth, input.cameraHeight)
).toJson()

@Suppress("DEPRECATION")
fun setProcessParams(processParams: ProcessParam, opts: JSONObject) = opts.forEach { k, v ->
    when (k) {
        "multipageProcessing" -> processParams.multipageProcessing = v as Boolean
        "logs" -> processParams.setLogs(v as Boolean)
        "debugSaveImages" -> processParams.debugSaveImages = v as Boolean
        "debugSaveLogs" -> processParams.debugSaveLogs = v as Boolean
        "returnUncroppedImage" -> processParams.returnUncroppedImage = v as Boolean
        "uvTorchEnabled" -> processParams.uvTorchEnabled = v as Boolean
        "debugSaveCroppedImages" -> processParams.debugSaveCroppedImages = v as Boolean
        "disableFocusingCheck" -> processParams.disableFocusingCheck = v as Boolean
        "debugSaveRFIDSession" -> processParams.debugSaveRFIDSession = v as Boolean
        "doublePageSpread" -> processParams.doublePageSpread = v as Boolean
        "manualCrop" -> processParams.manualCrop = v as Boolean
        "integralImage" -> processParams.integralImage = v as Boolean
        "returnCroppedBarcode" -> processParams.returnCroppedBarcode = v as Boolean
        "checkRequiredTextFields" -> processParams.checkRequiredTextFields = v as Boolean
        "depersonalizeLog" -> processParams.depersonalizeLog = v as Boolean
        "generateDoublePageSpreadImage" -> processParams.generateDoublePageSpreadImage = v as Boolean
        "alreadyCropped" -> processParams.alreadyCropped = v as Boolean
        "matchTextFieldMask" -> processParams.matchTextFieldMask = v as Boolean
        "updateOCRValidityByGlare" -> processParams.updateOCRValidityByGlare = v as Boolean
        "noGraphics" -> processParams.noGraphics = v as Boolean
        "multiDocOnImage" -> processParams.multiDocOnImage = v as Boolean
        "forceReadMrzBeforeLocate" -> processParams.forceReadMrzBeforeLocate = v as Boolean
        "parseBarcodes" -> processParams.parseBarcodes = v as Boolean
        "shouldReturnPackageForReprocess" -> processParams.shouldReturnPackageForReprocess = v as Boolean
        "disablePerforationOCR" -> processParams.disablePerforationOCR = v as Boolean
        "respectImageQuality" -> processParams.respectImageQuality = v as Boolean
        "strictImageQuality" -> processParams.strictImageQuality = v as Boolean
        "splitNames" -> processParams.splitNames = v as Boolean
        "doDetectCan" -> processParams.doDetectCan = v as Boolean
        "useFaceApi" -> processParams.useFaceApi = v as Boolean
        "useAuthenticityCheck" -> processParams.useAuthenticityCheck = v as Boolean
        "checkHologram" -> processParams.checkHologram = v as Boolean
        "generateNumericCodes" -> processParams.generateNumericCodes = v as Boolean
        "strictBarcodeDigitalSignatureCheck" -> processParams.strictBarcodeDigitalSignatureCheck = v as Boolean
        "selectLongestNames" -> processParams.selectLongestNames = v as Boolean
        "generateDTCVC" -> processParams.generateDTCVC = v as Boolean
        "strictDLCategoryExpiry" -> processParams.strictDLCategoryExpiry = v as Boolean
        "generateAlpha2Codes" -> processParams.generateAlpha2Codes = v as Boolean
        "disableAuthResolutionFilter" -> processParams.disableAuthResolutionFilter = v as Boolean
        "strictSecurityChecks" -> processParams.strictSecurityChecks = v as Boolean
        "returnTransliteratedFields" -> processParams.returnTransliteratedFields = v as Boolean
        "checkCaptureProcessIntegrity" -> processParams.checkCaptureProcessIntegrity = v as Boolean
        "bsiTr03135Results" -> processParams.bsiTr03135Results = v as Boolean
        "measureSystem" -> processParams.measureSystem = v.toInt()
        "barcodeParserType" -> processParams.barcodeParserType = v.toInt()
        "perspectiveAngle" -> processParams.perspectiveAngle = v.toInt()
        "minDPI" -> processParams.minDPI = v.toInt()
        "imageDpiOutMax" -> processParams.imageDpiOutMax = v.toInt()
        "forceDocID" -> processParams.forceDocID = v.toInt()
        "forceDocFormat" -> processParams.forceDocFormat = v.toInt()
        "shiftExpiryDate" -> processParams.shiftExpiryDate = v.toInt()
        "minimalHolderAge" -> processParams.minimalHolderAge = v.toInt()
        "imageOutputMaxHeight" -> processParams.imageOutputMaxHeight = v.toInt()
        "imageOutputMaxWidth" -> processParams.imageOutputMaxWidth = v.toInt()
        "processAuth" -> processParams.processAuth = v.toInt()
        "convertCase" -> processParams.convertCase = v.toInt()
        "logLevel" -> processParams.logLevel = LogLevel.valueOf(v.toString())
        "mrzDetectMode" -> processParams.mrzDetectMode = v.toInt()
        "pdfPagesLimit" -> processParams.pdfPagesLimit = v.toInt()
        "dateFormat" -> processParams.dateFormat = v as String
        "scenario" -> processParams.scenario = v as String
        "captureButtonScenario" -> processParams.captureButtonScenario = v as String
        "timeout" -> processParams.timeout = v.toDouble()
        "timeoutFromFirstDetect" -> processParams.timeoutFromFirstDetect = v.toDouble()
        "timeoutFromFirstDocType" -> processParams.timeoutFromFirstDocType = v.toDouble()
        "documentAreaMin" -> processParams.documentAreaMin = v.toDouble()
        "timeoutLiveness" -> processParams.timeoutLiveness = v.toDouble()
        "documentIDList" -> processParams.documentIDList = v.toIntArray()
        "fieldTypesFilter" -> processParams.fieldTypesFilter = v.toIntArray()
        "resultTypeOutput" -> processParams.resultTypeOutput = v.toIntArray()
        "documentGroupFilter" -> processParams.documentGroupFilter = v.toIntArray()
        "lcidIgnoreFilter" -> processParams.lcidIgnoreFilter = v.toIntArray()
        "lcidFilter" -> processParams.lcidFilter = v.toIntArray()
        "fieldTypesIgnoreFilter" -> processParams.fieldTypesIgnoreFilter = v.toIntArray()
        "barcodeTypes" -> processParams.doBarcodes = barcodeTypeArrayFromJson(v as JSONArray)
        "mrzFormatsFilter" -> processParams.mrzFormatsFilter = (v as JSONArray).toArray()
        "customParams" -> processParams.customParams = v as JSONObject
        "imageQA" -> setImageQA(processParams.imageQA, v as JSONObject)
        "rfidParams" -> processParams.rfidParams = rfidParamsFromJSON(v as JSONObject)
        "faceApiParams" -> processParams.faceApiParams = faceApiParamsFromJSON(v as JSONObject)
        "backendProcessingConfig" -> processParams.backendProcessingConfig = backendProcessingConfigFromJSON(v as JSONObject)
        "authenticityParams" -> {
            if (processParams.authenticityParams == null) processParams.authenticityParams = AuthenticityParams.defaultParams()
            setAuthenticityParams(processParams.authenticityParams!!, v as JSONObject)
        }
    }
}

@Suppress("DEPRECATION")
fun getProcessParams(processParams: ProcessParam) = mapOf(
    "multipageProcessing" to processParams.multipageProcessing,
    "logs" to processParams.isLogEnable,
    "debugSaveImages" to processParams.debugSaveImages,
    "debugSaveLogs" to processParams.debugSaveLogs,
    "returnUncroppedImage" to processParams.returnUncroppedImage,
    "uvTorchEnabled" to processParams.uvTorchEnabled,
    "debugSaveCroppedImages" to processParams.debugSaveCroppedImages,
    "disableFocusingCheck" to processParams.disableFocusingCheck,
    "debugSaveRFIDSession" to processParams.debugSaveRFIDSession,
    "doublePageSpread" to processParams.doublePageSpread,
    "manualCrop" to processParams.manualCrop,
    "integralImage" to processParams.integralImage,
    "returnCroppedBarcode" to processParams.returnCroppedBarcode,
    "checkRequiredTextFields" to processParams.checkRequiredTextFields,
    "depersonalizeLog" to processParams.depersonalizeLog,
    "generateDoublePageSpreadImage" to processParams.generateDoublePageSpreadImage,
    "alreadyCropped" to processParams.alreadyCropped,
    "matchTextFieldMask" to processParams.matchTextFieldMask,
    "updateOCRValidityByGlare" to processParams.updateOCRValidityByGlare,
    "noGraphics" to processParams.noGraphics,
    "multiDocOnImage" to processParams.multiDocOnImage,
    "forceReadMrzBeforeLocate" to processParams.forceReadMrzBeforeLocate,
    "parseBarcodes" to processParams.parseBarcodes,
    "shouldReturnPackageForReprocess" to processParams.shouldReturnPackageForReprocess,
    "disablePerforationOCR" to processParams.disablePerforationOCR,
    "respectImageQuality" to processParams.respectImageQuality,
    "strictImageQuality" to processParams.strictImageQuality,
    "splitNames" to processParams.splitNames,
    "doDetectCan" to processParams.doDetectCan,
    "useFaceApi" to processParams.useFaceApi,
    "useAuthenticityCheck" to processParams.useAuthenticityCheck,
    "checkHologram" to processParams.checkHologram,
    "generateNumericCodes" to processParams.generateNumericCodes,
    "strictBarcodeDigitalSignatureCheck" to processParams.strictBarcodeDigitalSignatureCheck,
    "selectLongestNames" to processParams.selectLongestNames,
    "generateDTCVC" to processParams.generateDTCVC,
    "strictDLCategoryExpiry" to processParams.strictDLCategoryExpiry,
    "generateAlpha2Codes" to processParams.generateAlpha2Codes,
    "disableAuthResolutionFilter" to processParams.disableAuthResolutionFilter,
    "strictSecurityChecks" to processParams.strictSecurityChecks,
    "returnTransliteratedFields" to processParams.returnTransliteratedFields,
    "checkCaptureProcessIntegrity" to processParams.checkCaptureProcessIntegrity,
    "bsiTr03135Results" to processParams.bsiTr03135Results,
    "measureSystem" to processParams.measureSystem,
    "barcodeParserType" to processParams.barcodeParserType,
    "perspectiveAngle" to processParams.perspectiveAngle,
    "minDPI" to processParams.minDPI,
    "imageDpiOutMax" to processParams.imageDpiOutMax,
    "forceDocID" to processParams.forceDocID,
    "forceDocFormat" to processParams.forceDocFormat,
    "shiftExpiryDate" to processParams.shiftExpiryDate,
    "minimalHolderAge" to processParams.minimalHolderAge,
    "imageOutputMaxHeight" to processParams.imageOutputMaxHeight,
    "imageOutputMaxWidth" to processParams.imageOutputMaxWidth,
    "processAuth" to processParams.processAuth,
    "convertCase" to processParams.convertCase,
    "logLevel" to processParams.logLevel?.toString(),
    "mrzDetectMode" to processParams.mrzDetectMode,
    "pdfPagesLimit" to processParams.pdfPagesLimit,
    "dateFormat" to processParams.dateFormat,
    "scenario" to processParams.scenario,
    "captureButtonScenario" to processParams.captureButtonScenario,
    "timeout" to processParams.timeout,
    "timeoutFromFirstDetect" to processParams.timeoutFromFirstDetect,
    "timeoutFromFirstDocType" to processParams.timeoutFromFirstDocType,
    "documentAreaMin" to processParams.documentAreaMin,
    "timeoutLiveness" to processParams.timeoutLiveness,
    "documentIDList" to processParams.documentIDList.toJson(),
    "fieldTypesFilter" to processParams.fieldTypesFilter.toJson(),
    "documentGroupFilter" to processParams.documentGroupFilter.toJson(),
    "lcidIgnoreFilter" to processParams.lcidIgnoreFilter.toJson(),
    "lcidFilter" to processParams.lcidFilter.toJson(),
    "fieldTypesIgnoreFilter" to processParams.fieldTypesIgnoreFilter.toJson(),
    "resultTypeOutput" to processParams.resultTypeOutput.toJson(),
    "mrzFormatsFilter" to processParams.mrzFormatsFilter.toJson(),
    "barcodeTypes" to generateBarcodeTypeArray(processParams.doBarcodes),
    "imageQA" to getImageQA(processParams.imageQA),
    "rfidParams" to generateRFIDParams(processParams.rfidParams),
    "faceApiParams" to generateFaceApiParams(processParams.faceApiParams),
    "backendProcessingConfig" to generateBackendProcessingConfig(processParams.backendProcessingConfig),
    "authenticityParams" to getAuthenticityParams(processParams.authenticityParams),
    "customParams" to processParams.customParams,
).toJson()

fun setCustomization(customization: ParamsCustomization, opts: JSONObject) = opts.forEach { k, v ->
    val editor = customization.edit()
    when (k) {
        "showStatusMessages" -> editor.setShowStatusMessages(v as Boolean)
        "showResultStatusMessages" -> editor.setShowResultStatusMessages(v as Boolean)
        "showHelpAnimation" -> editor.setShowHelpAnimation(v as Boolean)
        "showNextPageAnimation" -> editor.setShowNextPageAnimation(v as Boolean)
        "showBackgroundMask" -> editor.setShowBackgroundMask(v as Boolean)
        "cameraFrameBorderWidth" -> editor.setCameraFrameBorderWidth(v.toInt())
        "cameraFrameLineLength" -> editor.setCameraFrameLineLength(v.toInt())
        "cameraFrameShapeType" -> editor.setCameraFrameShapeType(v.toInt())
        "cameraFrameOffsetWidth" -> editor.setCameraFrameOffsetWidth(v.toInt())
        "activityIndicatorSize" -> editor.setActivityIndicatorSize(v.toInt())
        "status" -> editor.setStatus(v as String)
        "resultStatus" -> editor.setResultStatus(v as String)
        "multipageButtonText" -> editor.setMultipageButtonText(v as String)
        "cameraFrameDefaultColor" -> editor.setCameraFrameDefaultColor(v.toColor())
        "cameraFrameActiveColor" -> editor.setCameraFrameActiveColor(v.toColor())
        "statusTextColor" -> editor.setStatusTextColor(v.toColor())
        "resultStatusTextColor" -> editor.setResultStatusTextColor(v.toColor())
        "resultStatusBackgroundColor" -> editor.setResultStatusBackgroundColor(v.toColor())
        "multipageButtonBackgroundColor" -> editor.setMultipageButtonBackgroundColor(v.toColor())
        "tintColor" -> editor.setTintColor(v.toColor())
        "activityIndicatorColor" -> editor.setActivityIndicatorColor(v.toColor())
        "statusBackgroundColor" -> editor.setStatusBackgroundColor(v.toColor())
        "cameraPreviewBackgroundColor" -> editor.setCameraPreviewBackgroundColor(v.toColor())
        "backgroundMaskColor" -> editor.setBackgroundMaskColor(v.toColor())
        "multipageButtonTextColor" -> editor.setMultipageButtonTextColor(v.toColor())
        "statusPositionMultiplier" -> editor.setStatusPositionMultiplier(v.toFloat())
        "resultStatusPositionMultiplier" -> editor.setResultStatusPositionMultiplier(v.toFloat())
        "toolbarSize" -> editor.setToolbarSize(v.toFloat())
        "backgroundMaskAlpha" -> editor.setBackgroundMaskAlpha(v.toFloat())
        "customStatusPositionMultiplier" -> editor.setCustomStatusPositionMultiplier(v.toFloat())
        "cameraFrameVerticalPositionMultiplier" -> editor.setCameraFrameVerticalPositionMultiplier(v.toFloat())
        "cameraFrameLandscapeAspectRatio" -> editor.setCameraFrameLandscapeAspectRatio(v.toFloat())
        "cameraFramePortraitAspectRatio" -> editor.setCameraFramePortraitAspectRatio(v.toFloat())
        "cameraFrameCornerRadius" -> editor.setCameraFrameCornerRadius(v.toFloat())
        "livenessAnimationPositionMultiplier" -> editor.setLivenessAnimationPositionMultiplier(v.toFloat())
        "nextPageAnimationStartDelay" -> editor.setNextPageAnimationStartDelay(v.toFloat())
        "nextPageAnimationEndDelay" -> editor.setNextPageAnimationEndDelay(v.toFloat())
        "activityIndicatorPortraitPositionMultiplier" -> editor.setActivityIndicatorPortraitPositionMultiplier(v.toFloat())
        "activityIndicatorLandscapePositionMultiplier" -> editor.setActivityIndicatorLandscapePositionMultiplier(v.toFloat())
        "cameraPreviewVerticalPositionMultiplier" -> editor.setCameraPreviewVerticalPositionMultiplier(v.toFloat())
        "multipageButtonPositionMultiplier" -> editor.setMultipageButtonPositionMultiplier(v.toFloat())
        "multipageAnimationFrontImage" -> editor.setMultipageAnimationFrontImage(v.toDrawable())
        "multipageAnimationBackImage" -> editor.setMultipageAnimationBackImage(v.toDrawable())
        "borderBackgroundImage" -> editor.setBorderBackgroundImage(v.toDrawable())
        "helpAnimationImage" -> editor.setHelpAnimationImage(v.toDrawable())
        "closeButtonImage" -> editor.setCloseButtonImage(v.toDrawable())
        "captureButtonImage" -> editor.setCaptureButtonImage(v.toDrawable())
        "changeFrameButtonCollapseImage" -> editor.setChangeFrameCollapseButtonImage(v.toDrawable())
        "changeFrameButtonExpandImage" -> editor.setChangeFrameExpandButtonImage(v.toDrawable())
        "cameraSwitchButtonImage" -> editor.setCameraSwitchButtonImage(v.toDrawable())
        "torchButtonOnImage" -> editor.setTorchImageOn(v.toDrawable())
        "torchButtonOffImage" -> editor.setTorchImageOff(v.toDrawable())
        "livenessAnimationImage" -> editor.setLivenessAnimationImage(v.toDrawable())
        "multipageButtonImage" -> editor.setMultipageButtonImage(v.toDrawable())
        "helpAnimationImageMatrix" -> editor.setHelpAnimationImageMatrix(matrixFromJSON(v as JSONArray?)).setHelpAnimationImageScaleType(ImageView.ScaleType.MATRIX)
        "multipageAnimationFrontImageMatrix" -> editor.setMultipageAnimationFrontImageMatrix(matrixFromJSON(v as JSONArray?)).setMultipageAnimationFrontImageScaleType(ImageView.ScaleType.MATRIX)
        "multipageAnimationBackImageMatrix" -> editor.setMultipageAnimationBackImageMatrix(matrixFromJSON(v as JSONArray?)).setMultipageAnimationBackImageScaleType(ImageView.ScaleType.MATRIX)
        "livenessAnimationImageMatrix" -> editor.setLivenessAnimationImageMatrix(matrixFromJSON(v as JSONArray?)).setLivenessAnimationImageScaleType(ImageView.ScaleType.MATRIX)
        "borderBackgroundImageMatrix" -> editor.setBorderBackgroundImageMatrix(matrixFromJSON(v as JSONArray?)).setBorderBackgroundImageScaleType(ImageView.ScaleType.MATRIX)
        "customLabelStatus" -> editor.setCustomLabelStatus(SpannableString(v as String))
        "cameraFrameLineCap" -> editor.setCameraFrameLineCap(Paint.Cap.values()[v.toInt()])
        "uiCustomizationLayer" -> editor.setUiCustomizationLayer(JSONObject(v.toString()))
        "colors" -> setColors(editor, v as JSONObject)
        "fonts" -> setFonts(editor, v as JSONObject)
        "images" -> setImages(editor, v as JSONObject)
        "statusTextFont" -> {
            val font = typefaceFromJSON(v as JSONObject)
            editor.setStatusTextFont(font.first)
            font.second?.let { editor.setStatusTextSize(it) }
        }

        "resultStatusTextFont" -> {
            val font = typefaceFromJSON(v as JSONObject)
            editor.setResultStatusTextFont(font.first)
            font.second?.let { editor.setResultStatusTextSize(it) }
        }

        "multipageButtonTextFont" -> {
            val font = typefaceFromJSON(v as JSONObject)
            editor.setMultipageButtonTextFont(font.first)
            font.second?.let { editor.setMultipageButtonTextSize(it) }
        }
    }
    editor.applyImmediately(context)
}

fun getCustomization(customization: ParamsCustomization) = mapOf(
    "showStatusMessages" to customization.isShowStatusMessages,
    "showResultStatusMessages" to customization.isShowResultStatusMessages,
    "showHelpAnimation" to customization.isShowHelpAnimation,
    "showNextPageAnimation" to customization.isShowNextPageAnimation,
    "showBackgroundMask" to customization.isShowBackgroundMask,
    "cameraFrameBorderWidth" to customization.cameraFrameBorderWidth,
    "cameraFrameLineLength" to customization.cameraFrameLineLength,
    "cameraFrameShapeType" to customization.cameraFrameShapeType,
    "cameraFrameOffsetWidth" to customization.cameraFrameOffsetWidth,
    "activityIndicatorSize" to customization.activityIndicatorSize,
    "status" to customization.status,
    "resultStatus" to customization.resultStatus,
    "multipageButtonText" to customization.multipageButtonText,
    "cameraFrameDefaultColor" to customization.cameraFrameDefaultColor.colorToLong(),
    "cameraFrameActiveColor" to customization.cameraFrameActiveColor.colorToLong(),
    "statusTextColor" to customization.statusTextColor.colorToLong(),
    "resultStatusTextColor" to customization.resultStatusTextColor.colorToLong(),
    "resultStatusBackgroundColor" to customization.resultStatusBackgroundColor.colorToLong(),
    "multipageButtonBackgroundColor" to customization.multipageButtonBackgroundColor.colorToLong(),
    "tintColor" to customization.tintColor.colorToLong(),
    "activityIndicatorColor" to customization.activityIndicatorColor.colorToLong(),
    "statusBackgroundColor" to customization.statusBackgroundColor.colorToLong(),
    "cameraPreviewBackgroundColor" to customization.cameraPreviewBackgroundColor.colorToLong(),
    "backgroundMaskColor" to customization.backgroundMaskColor.colorToLong(),
    "multipageButtonTextColor" to customization.multipageButtonTextColor.colorToLong(),
    "statusPositionMultiplier" to customization.statusPositionMultiplier,
    "resultStatusPositionMultiplier" to customization.resultStatusPositionMultiplier,
    "backgroundMaskAlpha" to customization.backgroundMaskAlpha,
    "toolbarSize" to customization.toolbarSize,
    "customStatusPositionMultiplier" to customization.customStatusPositionMultiplier,
    "cameraFrameVerticalPositionMultiplier" to customization.cameraFrameVerticalPositionMultiplier,
    "cameraFrameLandscapeAspectRatio" to customization.cameraFrameLandscapeAspectRatio,
    "cameraFramePortraitAspectRatio" to customization.cameraFramePortraitAspectRatio,
    "cameraFrameCornerRadius" to customization.cameraFrameCornerRadius,
    "livenessAnimationPositionMultiplier" to customization.livenessAnimationPositionMultiplier,
    "nextPageAnimationStartDelay" to customization.nextPageAnimationStartDelay,
    "nextPageAnimationEndDelay" to customization.nextPageAnimationEndDelay,
    "activityIndicatorPortraitPositionMultiplier" to customization.activityIndicatorPortraitPositionMultiplier,
    "activityIndicatorLandscapePositionMultiplier" to customization.activityIndicatorLandscapePositionMultiplier,
    "cameraPreviewVerticalPositionMultiplier" to customization.cameraPreviewVerticalPositionMultiplier,
    "multipageButtonPositionMultiplier" to customization.multipageButtonPositionMultiplier,
    "multipageAnimationFrontImage" to customization.multipageAnimationFrontImage.toBase64(),
    "multipageAnimationBackImage" to customization.multipageAnimationBackImage.toBase64(),
    "borderBackgroundImage" to customization.borderBackgroundImage.toBase64(),
    "helpAnimationImage" to customization.helpAnimationImageDrawable.toBase64(),
    "closeButtonImage" to customization.closeButtonDrawable.toBase64(),
    "captureButtonImage" to customization.captureButtonDrawable.toBase64(),
    "changeFrameButtonCollapseImage" to customization.changeFrameCollapseButtonDrawable.toBase64(),
    "changeFrameButtonExpandImage" to customization.changeFrameExpandButtonDrawable.toBase64(),
    "cameraSwitchButtonImage" to customization.cameraSwitchButtonDrawable.toBase64(),
    "torchButtonOnImage" to customization.torchImageOnDrawable.toBase64(),
    "torchButtonOffImage" to customization.torchImageOffDrawable.toBase64(),
    "livenessAnimationImage" to customization.livenessAnimationImage.toBase64(),
    "multipageButtonImage" to customization.multipageButtonDrawable.toBase64(),
    "helpAnimationImageMatrix" to generateMatrix(customization.helpAnimationImageMatrix),
    "multipageAnimationFrontImageMatrix" to generateMatrix(customization.multipageAnimationFrontImageMatrix),
    "multipageAnimationBackImageMatrix" to generateMatrix(customization.multipageAnimationBackImageMatrix),
    "livenessAnimationImageMatrix" to generateMatrix(customization.livenessAnimationImageMatrix),
    "borderBackgroundImageMatrix" to generateMatrix(customization.borderBackgroundImageMatrix),
    "statusTextFont" to generateTypeface(customization.statusTextFont, customization.statusTextSize),
    "resultStatusTextFont" to generateTypeface(customization.resultStatusTextFont, customization.resultStatusTextSize),
    "multipageButtonTextFont" to generateTypeface(customization.multipageButtonTextFont, customization.multipageButtonTextSize),
    "customLabelStatus" to customization.customLabelStatus?.toString(),
    "cameraFrameLineCap" to customization.cameraFrameLineCap.ordinal,
    "uiCustomizationLayer" to customization.uiCustomizationLayer,
    "colors" to getColors(customization.colors),
    "fonts" to getFonts(customization.typeFaces, customization.fontSizes),
    "images" to getImages(customization.images)
).toJson()

fun setRfidScenario(rfidScenario: RfidScenario, opts: JSONObject) = opts.forEach { k, v ->
    when (k) {
        "paceStaticBinding" -> rfidScenario.isPaceStaticBinding = v as Boolean
        "onlineTA" -> rfidScenario.isOnlineTA = v as Boolean
        "writeEid" -> rfidScenario.isWriteEid = v as Boolean
        "universalAccessRights" -> rfidScenario.isUniversalAccessRights = v as Boolean
        "authorizedRestrictedIdentification" -> rfidScenario.isAuthorizedRestrictedIdentification = v as Boolean
        "auxVerificationCommunityID" -> rfidScenario.isAuxVerificationCommunityID = v as Boolean
        "auxVerificationDateOfBirth" -> rfidScenario.isAuxVerificationDateOfBirth = v as Boolean
        "skipAA" -> rfidScenario.isSkipAA = v as Boolean
        "strictProcessing" -> rfidScenario.isStrictProcessing = v as Boolean
        "pkdDSCertPriority" -> rfidScenario.isPkdDSCertPriority = v as Boolean
        "pkdUseExternalCSCA" -> rfidScenario.isPkdUseExternalCSCA = v as Boolean
        "trustedPKD" -> rfidScenario.isTrustedPKD = v as Boolean
        "passiveAuth" -> rfidScenario.isPassiveAuth = v as Boolean
        "useSFI" -> rfidScenario.isUseSFI = v as Boolean
        "readEPassport" -> rfidScenario.isReadEPassport = v as Boolean
        "readEID" -> rfidScenario.isReadEID = v as Boolean
        "readEDL" -> rfidScenario.isReadEDL = v as Boolean
        "authorizedSTSignature" -> rfidScenario.isAuthorizedSTSignature = v as Boolean
        "authorizedSTQSignature" -> rfidScenario.isAuthorizedSTQSignature = v as Boolean
        "authorizedWriteDG17" -> rfidScenario.isAuthorizedWriteDG17 = v as Boolean
        "authorizedWriteDG18" -> rfidScenario.isAuthorizedWriteDG18 = v as Boolean
        "authorizedWriteDG19" -> rfidScenario.isAuthorizedWriteDG19 = v as Boolean
        "authorizedWriteDG20" -> rfidScenario.isAuthorizedWriteDG20 = v as Boolean
        "authorizedWriteDG21" -> rfidScenario.isAuthorizedWriteDG21 = v as Boolean
        "authorizedVerifyAge" -> rfidScenario.isAuthorizedVerifyAge = v as Boolean
        "authorizedVerifyCommunityID" -> rfidScenario.isAuthorizedVerifyCommunityID = v as Boolean
        "authorizedPrivilegedTerminal" -> rfidScenario.isAuthorizedPrivilegedTerminal = v as Boolean
        "authorizedCANAllowed" -> rfidScenario.isAuthorizedCANAllowed = v as Boolean
        "authorizedPINManagement" -> rfidScenario.isAuthorizedPINManagment = v as Boolean
        "authorizedInstallCert" -> rfidScenario.isAuthorizedInstallCert = v as Boolean
        "authorizedInstallQCert" -> rfidScenario.isAuthorizedInstallQCert = v as Boolean
        "applyAmendments" -> rfidScenario.isApplyAmendments = v as Boolean
        "autoSettings" -> rfidScenario.isAutoSettings = v as Boolean
        "proceedReadingAlways" -> rfidScenario.proceedReadingAlways = v as Boolean
        "readDTC" -> rfidScenario.isReadDTC = v as Boolean
        "mrzStrictCheck" -> rfidScenario.isMrzStrictCheck = v as Boolean
        "loadCRLFromRemote" -> rfidScenario.isLoadCRLFromRemote = v as Boolean
        "independentSODStatus" -> rfidScenario.isIndependentSODStatus = v as Boolean
        "signManagementAction" -> rfidScenario.signManagementAction = v.toInt()
        "readingBuffer" -> rfidScenario.readingBuffer = v.toInt()
        "onlineTAToSignDataType" -> rfidScenario.onlineTAToSignDataType = v.toInt()
        "profilerType" -> rfidScenario.profilerType = v.toInt()
        "authProcType" -> rfidScenario.authProcType = v.toInt()
        "baseSMProcedure" -> rfidScenario.baseSMProcedure = v.toInt()
        "pacePasswordType" -> rfidScenario.pacePasswordType = v.toInt()
        "terminalType" -> rfidScenario.terminalType = v.toInt()
        "defaultReadingBufferSize" -> rfidScenario.defaultReadingBufferSize = v.toInt()
        "password" -> rfidScenario.password = v as String
        "pkdPA" -> rfidScenario.pkdPA = v as String
        "pkdEAC" -> rfidScenario.pkdEAC = v as String
        "mrz" -> rfidScenario.mrz = v as String
        "eSignPINDefault" -> rfidScenario.seteSignPINDefault(v as String)
        "eSignPINNewValue" -> rfidScenario.seteSignPINNewValue(v as String)
        "cardAccess" -> rfidScenario.cardAccess = v as String
        "mrzHash" -> rfidScenario.mrzHash = v as String
        "documentNumber" -> rfidScenario.documentNumber = v as String
        "dateOfBirth" -> rfidScenario.dateOfBirth = v as String
        "dateOfExpiry" -> rfidScenario.dateOfExpiry = v as String
        "ePassportDataGroups" -> setDataGroups(rfidScenario.ePassportDataGroups(), v as JSONObject)
        "eIDDataGroups" -> setDataGroups(rfidScenario.eIDDataGroups(), v as JSONObject)
        "eDLDataGroups" -> setDataGroups(rfidScenario.eDLDataGroups(), v as JSONObject)
        "dtcDataGroups" -> setDTCDataGroup(rfidScenario.DTCDataGroup(), v as JSONObject)
    }
}

fun getRfidScenario(rfidScenario: RfidScenario) = mapOf(
    "paceStaticBinding" to rfidScenario.isPaceStaticBinding,
    "onlineTA" to rfidScenario.isOnlineTA,
    "writeEid" to rfidScenario.isWriteEid,
    "universalAccessRights" to rfidScenario.isUniversalAccessRights,
    "authorizedRestrictedIdentification" to rfidScenario.isAuthorizedRestrictedIdentification,
    "auxVerificationCommunityID" to rfidScenario.isAuxVerificationCommunityID,
    "auxVerificationDateOfBirth" to rfidScenario.isAuxVerificationDateOfBirth,
    "skipAA" to rfidScenario.isSkipAA,
    "strictProcessing" to rfidScenario.isStrictProcessing,
    "pkdDSCertPriority" to rfidScenario.isPkdDSCertPriority,
    "pkdUseExternalCSCA" to rfidScenario.isPkdUseExternalCSCA,
    "trustedPKD" to rfidScenario.isTrustedPKD,
    "passiveAuth" to rfidScenario.isPassiveAuth,
    "useSFI" to rfidScenario.isUseSFI,
    "readEPassport" to rfidScenario.isReadEPassport,
    "readEID" to rfidScenario.isReadEID,
    "readEDL" to rfidScenario.isReadEDL,
    "authorizedSTSignature" to rfidScenario.isAuthorizedSTSignature,
    "authorizedSTQSignature" to rfidScenario.isAuthorizedSTQSignature,
    "authorizedWriteDG17" to rfidScenario.isAuthorizedWriteDG17,
    "authorizedWriteDG18" to rfidScenario.isAuthorizedWriteDG18,
    "authorizedWriteDG19" to rfidScenario.isAuthorizedWriteDG19,
    "authorizedWriteDG20" to rfidScenario.isAuthorizedWriteDG20,
    "authorizedWriteDG21" to rfidScenario.isAuthorizedWriteDG21,
    "authorizedVerifyAge" to rfidScenario.isAuthorizedVerifyAge,
    "authorizedVerifyCommunityID" to rfidScenario.isAuthorizedVerifyCommunityID,
    "authorizedPrivilegedTerminal" to rfidScenario.isAuthorizedPrivilegedTerminal,
    "authorizedCANAllowed" to rfidScenario.isAuthorizedCANAllowed,
    "authorizedPINManagement" to rfidScenario.isAuthorizedPINManagment,
    "authorizedInstallCert" to rfidScenario.isAuthorizedInstallCert,
    "authorizedInstallQCert" to rfidScenario.isAuthorizedInstallQCert,
    "applyAmendments" to rfidScenario.isApplyAmendments,
    "autoSettings" to rfidScenario.isAutoSettings,
    "proceedReadingAlways" to rfidScenario.proceedReadingAlways,
    "readDTC" to rfidScenario.isReadDTC,
    "mrzStrictCheck" to rfidScenario.isMrzStrictCheck,
    "loadCRLFromRemote" to rfidScenario.isLoadCRLFromRemote,
    "independentSODStatus" to rfidScenario.isIndependentSODStatus,
    "signManagementAction" to rfidScenario.signManagementAction,
    "readingBuffer" to rfidScenario.readingBuffer,
    "onlineTAToSignDataType" to rfidScenario.onlineTAToSignDataType,
    "profilerType" to rfidScenario.profilerType,
    "authProcType" to rfidScenario.authProcType,
    "baseSMProcedure" to rfidScenario.baseSMProcedure,
    "pacePasswordType" to rfidScenario.pacePasswordType,
    "terminalType" to rfidScenario.terminalType,
    "defaultReadingBufferSize" to rfidScenario.defaultReadingBufferSize,
    "password" to rfidScenario.password,
    "pkdPA" to rfidScenario.pkdPA,
    "pkdEAC" to rfidScenario.pkdEAC,
    "mrz" to rfidScenario.mrz,
    "eSignPINDefault" to rfidScenario.geteSignPINDefault(),
    "eSignPINNewValue" to rfidScenario.geteSignPINNewValue(),
    "cardAccess" to rfidScenario.cardAccess,
    "mrzHash" to rfidScenario.mrzHash,
    "documentNumber" to rfidScenario.documentNumber,
    "dateOfBirth" to rfidScenario.dateOfBirth,
    "dateOfExpiry" to rfidScenario.dateOfExpiry,
    "ePassportDataGroups" to getDataGroups(rfidScenario.ePassportDataGroups()),
    "eIDDataGroups" to getDataGroups(rfidScenario.eIDDataGroups()),
    "eDLDataGroups" to getDataGroups(rfidScenario.eDLDataGroups()),
    "dtcDataGroups" to getDTCDataGroup(rfidScenario.DTCDataGroup())
).toJson()

fun setDataGroups(dataGroup: DataGroups, opts: JSONObject) = opts.forEach { k, v ->
    val value = v as Boolean
    when (k) {
        "DG1" -> dataGroup.isDG1 = value
        "DG2" -> dataGroup.isDG2 = value
        "DG3" -> dataGroup.isDG3 = value
        "DG4" -> dataGroup.isDG4 = value
        "DG5" -> dataGroup.isDG5 = value
        "DG6" -> dataGroup.isDG6 = value
        "DG7" -> dataGroup.isDG7 = value
        "DG8" -> dataGroup.isDG8 = value
        "DG9" -> dataGroup.isDG9 = value
        "DG10" -> dataGroup.isDG10 = value
        "DG11" -> dataGroup.isDG11 = value
        "DG12" -> dataGroup.isDG12 = value
        "DG13" -> dataGroup.isDG13 = value
        "DG14" -> dataGroup.isDG14 = value
    }
    if (dataGroup is EPassportDataGroups) when (k) {
        "DG15" -> dataGroup.isDG15 = value
        "DG16" -> dataGroup.isDG16 = value
    }
    if (dataGroup is EIDDataGroups) when (k) {
        "DG15" -> dataGroup.isDG15 = value
        "DG16" -> dataGroup.isDG16 = value
        "DG17" -> dataGroup.isDG17 = value
        "DG18" -> dataGroup.isDG18 = value
        "DG19" -> dataGroup.isDG19 = value
        "DG20" -> dataGroup.isDG20 = value
        "DG21" -> dataGroup.isDG21 = value
    }
}

fun getDataGroups(dataGroup: DataGroups): JSONObject {
    val result = mutableMapOf(
        "DG1" to dataGroup.isDG1,
        "DG2" to dataGroup.isDG2,
        "DG3" to dataGroup.isDG3,
        "DG4" to dataGroup.isDG4,
        "DG5" to dataGroup.isDG5,
        "DG6" to dataGroup.isDG6,
        "DG7" to dataGroup.isDG7,
        "DG8" to dataGroup.isDG8,
        "DG9" to dataGroup.isDG9,
        "DG10" to dataGroup.isDG10,
        "DG11" to dataGroup.isDG11,
        "DG12" to dataGroup.isDG12,
        "DG13" to dataGroup.isDG13,
        "DG14" to dataGroup.isDG14
    )
    if (dataGroup is EPassportDataGroups) {
        result["DG15"] = dataGroup.isDG15
        result["DG16"] = dataGroup.isDG16
    }
    if (dataGroup is EIDDataGroups) {
        result["DG15"] = dataGroup.isDG15
        result["DG16"] = dataGroup.isDG16
        result["DG17"] = dataGroup.isDG17
        result["DG18"] = dataGroup.isDG18
        result["DG19"] = dataGroup.isDG19
        result["DG20"] = dataGroup.isDG20
        result["DG21"] = dataGroup.isDG21
    }
    return result.toJson()
}

fun setDTCDataGroup(dataGroup: DTCDataGroup, opts: JSONObject) = opts.forEach { k, v ->
    val value = v as Boolean
    when (k) {
        "DG17" -> dataGroup.isDG17 = value
        "DG18" -> dataGroup.isDG18 = value
        "DG22" -> dataGroup.isDG22 = value
        "DG23" -> dataGroup.isDG23 = value
        "DG24" -> dataGroup.isDG24 = value
    }
}

fun getDTCDataGroup(dataGroup: DTCDataGroup) = mapOf(
    "DG17" to dataGroup.isDG17,
    "DG18" to dataGroup.isDG18,
    "DG22" to dataGroup.isDG22,
    "DG23" to dataGroup.isDG23,
    "DG24" to dataGroup.isDG24,
).toJson()

fun setImageQA(input: ImageQA, opts: JSONObject) = opts.forEach { k, v ->
    when (k) {
        "focusCheck" -> input.focusCheck = v as Boolean
        "glaresCheck" -> input.glaresCheck = v as Boolean
        "colornessCheck" -> input.colornessCheck = v as Boolean
        "screenCapture" -> input.screenCapture = v as Boolean
        "dpiThreshold" -> input.dpiThreshold = v.toInt()
        "angleThreshold" -> input.angleThreshold = v.toInt()
        "documentPositionIndent" -> input.documentPositionIndent = v.toInt()
        "brightnessThreshold" -> input.brightnessThreshold = v.toDouble()
        "expectedPass" -> input.expectedPass = v.toIntArray()
        "glaresCheckParams" -> input.glaresCheckParams = glaresCheckParamsFromJSON(v as JSONObject)
        "occlusionCheck" -> input.occlusionCheck = v as Boolean
    }
}

fun getImageQA(input: ImageQA) = mapOf(
    "focusCheck" to input.focusCheck,
    "glaresCheck" to input.glaresCheck,
    "colornessCheck" to input.colornessCheck,
    "screenCapture" to input.screenCapture,
    "dpiThreshold" to input.dpiThreshold,
    "angleThreshold" to input.angleThreshold,
    "documentPositionIndent" to input.documentPositionIndent,
    "brightnessThreshold" to input.brightnessThreshold,
    "expectedPass" to input.expectedPass.toJson(),
    "glaresCheckParams" to generateGlaresCheckParams(input.glaresCheckParams),
    "occlusionCheck" to input.occlusionCheck,
).toJson()

fun setAuthenticityParams(input: AuthenticityParams, opts: JSONObject) = opts.forEach { k, v ->
    when (k) {
        "useLivenessCheck" -> input.useLivenessCheck = v as Boolean
        "checkUVLuminiscence" -> input.checkUVLuminiscence = v as Boolean
        "checkIRB900" -> input.checkIRB900 = v as Boolean
        "checkImagePatterns" -> input.checkImagePatterns = v as Boolean
        "checkFibers" -> input.checkFibers = v as Boolean
        "checkExtMRZ" -> input.checkExtMRZ = v as Boolean
        "checkExtOCR" -> input.checkExtOCR = v as Boolean
        "checkAxial" -> input.checkAxial = v as Boolean
        "checkBarcodeFormat" -> input.checkBarcodeFormat = v as Boolean
        "checkIRVisibility" -> input.checkIRVisibility = v as Boolean
        "checkIPI" -> input.checkIPI = v as Boolean
        "checkPhotoEmbedding" -> input.checkPhotoEmbedding = v as Boolean
        "checkPhotoComparison" -> input.checkPhotoComparison = v as Boolean
        "checkLetterScreen" -> input.checkLetterScreen = v as Boolean
        "checkSecurityText" -> input.checkSecurityText = v as Boolean
        "livenessParams" -> {
            if (input.livenessParams == null) input.livenessParams = LivenessParams.defaultParams()
            setLivenessParams(input.livenessParams!!, v as JSONObject)
        }
    }
}

fun getAuthenticityParams(input: AuthenticityParams?) = input?.let {
    mapOf(
        "useLivenessCheck" to it.useLivenessCheck,
        "checkUVLuminiscence" to it.checkUVLuminiscence,
        "checkIRB900" to input.checkIRB900,
        "checkImagePatterns" to it.checkImagePatterns,
        "checkFibers" to it.checkFibers,
        "checkExtMRZ" to it.checkExtMRZ,
        "checkExtOCR" to it.checkExtOCR,
        "checkAxial" to it.checkAxial,
        "checkBarcodeFormat" to it.checkBarcodeFormat,
        "checkIRVisibility" to it.checkIRVisibility,
        "checkIPI" to it.checkIPI,
        "checkPhotoEmbedding" to it.checkPhotoEmbedding,
        "checkPhotoComparison" to it.checkPhotoComparison,
        "checkLetterScreen" to it.checkLetterScreen,
        "checkSecurityText" to it.checkSecurityText,
        "livenessParams" to getLivenessParams(it.livenessParams)
    ).toJson()
}

fun setLivenessParams(input: LivenessParams, opts: JSONObject) = opts.forEach { k, v ->
    when (k) {
        "checkOVI" -> input.checkOVI = v as Boolean
        "checkMLI" -> input.checkMLI = v as Boolean
        "checkHolo" -> input.checkHolo = v as Boolean
        "checkED" -> input.checkED = v as Boolean
        "checkBlackAndWhiteCopy" -> input.checkBlackAndWhiteCopy = v as Boolean
        "checkDynaprint" -> input.checkDynaprint = v as Boolean
        "checkGeometry" -> input.checkGeometry = v as Boolean
    }
}

fun getLivenessParams(input: LivenessParams?) = input?.let {
    mapOf(
        "checkOVI" to input.checkOVI,
        "checkMLI" to input.checkMLI,
        "checkHolo" to input.checkHolo,
        "checkED" to input.checkED,
        "checkBlackAndWhiteCopy" to input.checkBlackAndWhiteCopy,
        "checkDynaprint" to input.checkDynaprint,
        "checkGeometry" to input.checkGeometry,
    ).toJson()
}

fun setColors(input: ParamsCustomization.CustomizationEditor, opts: JSONObject) = opts.forEach { key, v ->
    val value = v.toLong()
    when (key) {
        "rfidProcessingScreenBackground" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_BACKGROUND, value)
        "rfidProcessingScreenHintLabelText" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_HINT_LABEL_TEXT, value)
        "rfidProcessingScreenHintLabelBackground" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_HINT_LABEL_BACKGROUND, value)
        "rfidProcessingScreenProgressLabelText" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_LABEL_TEXT, value)
        "rfidProcessingScreenProgressBar" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_BAR, value)
        "rfidProcessingScreenProgressBarBackground" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_BAR_BACKGROUND, value)
        "rfidProcessingScreenResultLabelText" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_RESULT_LABEL_TEXT, value)
        "rfidProcessingScreenLoadingBar" -> input.setColor(CustomizationColor.RFID_PROCESSING_SCREEN_LOADING_BAR, value)
        "rfidEnableNfcTitleText" -> input.setColor(CustomizationColor.RFID_ENABLE_NFC_TITLE_TEXT, value)
        "rfidEnableNfcDescriptionText" -> input.setColor(CustomizationColor.RFID_ENABLE_NFC_DESCRIPTION_TEXT, value)
        "rfidEnableNfcButtonText" -> input.setColor(CustomizationColor.RFID_ENABLE_NFC_BUTTON_TEXT, value)
        "rfidEnableNfcButtonBackground" -> input.setColor(CustomizationColor.RFID_ENABLE_NFC_BUTTON_BACKGROUND, value)
    }
}

fun getColors(input: Map<CustomizationColor, Long>) = mapOf(
    "rfidProcessingScreenBackground" to input[CustomizationColor.RFID_PROCESSING_SCREEN_BACKGROUND],
    "rfidProcessingScreenHintLabelText" to input[CustomizationColor.RFID_PROCESSING_SCREEN_HINT_LABEL_TEXT],
    "rfidProcessingScreenHintLabelBackground" to input[CustomizationColor.RFID_PROCESSING_SCREEN_HINT_LABEL_BACKGROUND],
    "rfidProcessingScreenProgressLabelText" to input[CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_LABEL_TEXT],
    "rfidProcessingScreenProgressBar" to input[CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_BAR],
    "rfidProcessingScreenProgressBarBackground" to input[CustomizationColor.RFID_PROCESSING_SCREEN_PROGRESS_BAR_BACKGROUND],
    "rfidProcessingScreenResultLabelText" to input[CustomizationColor.RFID_PROCESSING_SCREEN_RESULT_LABEL_TEXT],
    "rfidProcessingScreenLoadingBar" to input[CustomizationColor.RFID_PROCESSING_SCREEN_LOADING_BAR],
    "rfidEnableNfcTitleText" to input[CustomizationColor.RFID_ENABLE_NFC_TITLE_TEXT],
    "rfidEnableNfcDescriptionText" to input[CustomizationColor.RFID_ENABLE_NFC_DESCRIPTION_TEXT],
    "rfidEnableNfcButtonText" to input[CustomizationColor.RFID_ENABLE_NFC_BUTTON_TEXT],
    "rfidEnableNfcButtonBackground" to input[CustomizationColor.RFID_ENABLE_NFC_BUTTON_BACKGROUND],
).toJson()

fun setFonts(input: ParamsCustomization.CustomizationEditor, opts: JSONObject) = opts.forEach { key, value ->
    when (key) {
        "rfidProcessingScreenHintLabel" -> CustomizationFont.RFID_PROCESSING_SCREEN_HINT_LABEL.setFont(input, value)
        "rfidProcessingScreenProgressLabel" -> CustomizationFont.RFID_PROCESSING_SCREEN_PROGRESS_LABEL.setFont(input, value)
        "rfidProcessingScreenResultLabel" -> CustomizationFont.RFID_PROCESSING_SCREEN_RESULT_LABEL.setFont(input, value)
        "rfidEnableNfcTitleText" -> CustomizationFont.RFID_ENABLE_NFC_TITLE_TEXT.setFont(input, value)
        "rfidEnableNfcDescriptionText" -> CustomizationFont.RFID_ENABLE_NFC_DESCRIPTION_TEXT.setFont(input, value)
        "rfidEnableNfcButtonText" -> CustomizationFont.RFID_ENABLE_NFC_BUTTON_TEXT.setFont(input, value)
    }
}

fun getFonts(fonts: Map<CustomizationFont, Typeface>, sizes: Map<CustomizationFont, Int>) = mapOf(
    "rfidProcessingScreenHintLabel" to CustomizationFont.RFID_PROCESSING_SCREEN_HINT_LABEL.getFont(fonts, sizes),
    "rfidProcessingScreenProgressLabel" to CustomizationFont.RFID_PROCESSING_SCREEN_PROGRESS_LABEL.getFont(fonts, sizes),
    "rfidProcessingScreenResultLabel" to CustomizationFont.RFID_PROCESSING_SCREEN_RESULT_LABEL.getFont(fonts, sizes),
    "rfidEnableNfcTitleText" to CustomizationFont.RFID_ENABLE_NFC_TITLE_TEXT.getFont(fonts, sizes),
    "rfidEnableNfcDescriptionText" to CustomizationFont.RFID_ENABLE_NFC_DESCRIPTION_TEXT.getFont(fonts, sizes),
    "rfidEnableNfcButtonText" to CustomizationFont.RFID_ENABLE_NFC_BUTTON_TEXT.getFont(fonts, sizes),
).toJson()

fun setImages(input: ParamsCustomization.CustomizationEditor, opts: JSONObject) = opts.forEach { key, v ->
    when (key) {
        "rfidProcessingScreenFailureImage" -> input.setImage(CustomizationImage.RFID_PROCESSING_SCREEN_FAILURE_IMAGE, v.toDrawable())
        "rfidEnableNfcImage" -> input.setImage(CustomizationImage.RFID_ENABLE_NFC_IMAGE, v.toDrawable())
    }
}

fun getImages(input: Map<CustomizationImage, Drawable>) = mapOf(
    "rfidProcessingScreenFailureImage" to (input[CustomizationImage.RFID_PROCESSING_SCREEN_FAILURE_IMAGE] ?: ContextCompat.getDrawable(context, com.regula.documentreader.api.R.drawable.reg_ic_error)).toBase64(),
    "rfidEnableNfcImage" to (input[CustomizationImage.RFID_ENABLE_NFC_IMAGE] ?: ContextCompat.getDrawable(context, com.regula.documentreader.api.R.drawable.reg_enable_nfc)).toBase64(),
).toJson()

fun CustomizationFont.getFont(fonts: Map<CustomizationFont, Typeface>, sizes: Map<CustomizationFont, Int>) =
    generateTypeface(fonts[this], sizes[this])

fun CustomizationFont.setFont(editor: ParamsCustomization.CustomizationEditor, value: Any?) {
    val font = typefaceFromJSON(value as JSONObject)
    editor.setFont(this, font.first)
    font.second?.let { editor.setFontSize(this, it) }
}

fun Any.toInt() = when (this) {
    is Double -> toInt()
    is Long -> toInt()
    is String -> Integer.parseInt(this)
    else -> this as Int
}

fun Any.toLong() = when (this) {
    is Double -> toLong()
    is Int -> toLong()
    else -> this as Long
}

fun Any.toFloat() = when (this) {
    is Int -> toFloat()
    is Double -> toFloat()
    else -> this as Float
}

fun Any.toDouble() = when (this) {
    is Int -> toDouble()
    is Long -> toDouble()
    else -> this as Double
}

fun Any?.toColor() = this?.let {
    "#" + toLong().toString(16)
}

fun String?.colorToLong() = this?.let {
    if (this[0] == '#') this.substring(1).toLong(16)
    else this.toLong(16)
}
