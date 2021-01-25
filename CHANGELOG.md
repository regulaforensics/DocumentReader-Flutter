# 5.4.0
**API**:
- Added document authentication based on the detection of the presence of a hologram
- Updated document image for NFC chip reading activity animation for USA passport which can be read only when passport book is open
- Added the ability to disable checking for the presence of a flashlight on the device
- Added new values to the `eCheckDiagnose` parameter:
    - `PHOTO_WHITE_IR_DONT_MATCH`
    - `FIELD_POS_CORRECTOR_GLARES_IN_PHOTO_AREA`
    - `HOLOGRAM_FRAMES_IS_ABSENT`
    - `HOLOGRAM_HOLO_FIELD_IS_ABSENT`
    - `FINGERPRINTS_COMPARISON_MISMATCH`
    - `HOLO_PHOTO_FACE_NOT_DETECTED`
    - `HOLO_PHOTO_FACE_COMPARISON_FAILED`
    - `HOLO_PHOTO_FACE_GLARE_IN_CENTER_ABSENT`
    - `HOLO_ELEMENT_SHAPE_ERROR`
    - `ALGORITHM_STEPS_ERROR`
    - `HOLO_AREAS_NOT_LOADED`
    - `FINISHED_BY_TIMEOUT`

- Updated enumeration values of `eImageQualityCheckType`
- Updated `DocumentReaderException` enumeration values related to licensing errors that may occur during initialization
- Fixed an issue with incorrect camera focus in camera activity
- Fixed an issue in the `zoomFactor` property. Now when setting a value above the maximum allowed value, the camera will be zoomed to the maximum available value for this camera

**Core**:

- Document detection and crop
    - Added Boolean flag `processParam.fastDocDetect` to shorten the list of candidates to process during document detection in a single image process mode. Enabled by default. This solves the issue introduced in 5.2, that lead to significantly longer processing times on the images with specific backgrounds
    - Improved ID2 MRZ documents cropping in some cases
- OCR
    - Added support for Amharic (fidäl / Ephiopian)
    - Added support for perforated numbers OCR (different fonts, straight and mirror)
    - Added Boolean flag `processParam.checkRequiredTextFields`. When enabled, each field in template will be checked for value presence and if the field is marked as required, but has no value, it will have "error" in validity status. Disabled by default
    - Added Boolean flag `processParam.updateOCRValidityByGlare`. When enabled, OCR field validity will be updated with | tr_GlaresOnField value, if there is a glare over the text field on the image. Disabled by default
    - Improved Latin NN
    - Improved Hebrew NN
- Barcode
    - Updated Peru ID Card parser
    - Fixed issue with multiple pages processing
- Text data parsing and validation
    - Implemented conversion from ROC dates (Minguo) into Gregorian
    - Fixed issue with DL class field comparison between barcode and visual
    - Fixed issue with incorrect validity for dates in Hijri
- Image QA
    - Added new Resolution assessment check. Should be above threshold (150 ppi), otherwise the check will fail. Can be set via `processParam.imageQA.dpiThreshold`
    - Added new Perspective angle assessment check. Should be below threshold (5 degrees), otherwise the check will fail. Can be set via `processParam.imageQA.angleThreshold`
    - Added new Documents bounds inside the image check. All document corners should be inside the image, otherwise the check will fail
- Authenticity
    - Added support for hologram presence detection by analysis of multiple frames
    - Improved patterns check for visible and IR light images
    - Improved patterns check for Russian Federation domestic passport
    - Fixed issue with AV on specific images in IR visibility check
- Fixed issue with 1- and 8-bit images processing
- Code quality improved with lots of small issues fixed

**Database**:
- 246 countries and territories / 9152 documents included
- 193 new documents added
- For details see [Supported documents list](https://downloads.regulaforensics.com/work/SDK/doc/AllDocs/Documents%20List.xls)

# 5.3.0
Flutter plugin for reading and validation of identification documents based on the Regula Document Reader SDK.
