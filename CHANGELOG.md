# 5.6.0
**API**:
* Implemented ability to read multiple pages of a document in manual mode \([`manualMultipageMode`](https://docs.regulaforensics.com/flutter/custom-settings#scanning-modes)\)
* Implemented ability to change the background for the [status message](https://docs.regulaforensics.com/flutter/custom-settings#status-message) on the scanning screen
* Fixed stopRFIDReader function
* Fixed an issue with saving video of the scanning process. Now the video is automatically saved to a separate subfolder
* Added new values to the [`eVisualFieldType`](https://docs.regulaforensics.com/flutter/enumerations/evisualfieldtype) parameter
  * `FT_DLCLASSCODE_NT_FROM`
  * `FT_DLCLASSCODE_NT_TO`
  * `FT_DLCLASSCODE_NT_NOTES`
  * `FT_DLCLASSCODE_TN_FROM` 
  * `FT_DLCLASSCODE_TN_TO` 
  * `FT_DLCLASSCODE_TN_NOTES` 
  * `FT_DLCLASSCODE_D3_FROM` 
  * `FT_DLCLASSCODE_D3_TO` 
  * `FT_DLCLASSCODE_D3_NOTES`

**Core**:
* Document detection and crop 
  * Multiple improvements that allow more precise cropping of the documents from input image and better recognition
  * Added "processParam.documentAreaMin" parameter to set area percent that document should fill on the image to be considered as document. Allowed values from 0 to 1. Default value 0.3
  * Added “processParam.forceDocFormat” parameter to force use of specified document format when locating and recognizing document to reduce the number of candidates
  * Fixed issue with detection of ID card on A4 flatbed scanner produced image with incorrect resolution set
* OCR
  * Significantly improved recognition quality for Korean, Hebrew, and Cyrillic alphabets.
* MRZ
  * Added new parsers:
    * Switzerland DL.
  * Updated parsers:
    * Bulgaria ID card
    * Croatia ID card
    * Ecuador ID card
    * Netherlands passport
  * Implemented 2x30 MRZ detection and reading for Switzerland DL
  * Fixed issue with coordinates for rotated MRZ
* Barcode
  * Added new parsers: 
    * France ID card
  * Updated parsers:
    * Guatemala passport
  * Implemented mask check for data from 1D barcodes
  * Fixed issue with base64 decoding from barcodes data
  * Fixed issue with absence of data parsing results from images with low resolution
  * Fixed issue with parsing data from multiple barcodes in one document
* Text data parsing and validation
  * Fixed issue with document number validation for Ireland DL
  * Fixed issue with generating full name when same parts of the name are present on different sides of the ID card
* Image QA
  * Added screen captured images detection as a separate check
  * Added portrait occlusion detection as a separate check
  * Improved algorithm for detection of colorless images
* Authenticity
  * Added new check of the halo around the portrait in UV that can be result of photo substitution. 
  * Improved fibers detection and validation algorithms
  * Fixed issue with luminescence mask validation for some cases
  * Implemented rotation of output results so the document image is correctly oriented
  * Fixed issue with some PDF files processing led to crash in some rare cases
  * Fixed issue with processing of multiple pages led to different results based on page order
  * Fixed issue with symbols visibility on mobile platforms, that lead to incompatibility with other frameworks that use same dependencies as OpenSSL
  * Code quality improved with lots of small issues fixed
* RFID
  * Implemented re-processing of the previously obtained session from mobile or desktop station for validating PA and further processing data on the server side
  * Fixed issue with TA status calculation based on EF.CVCA ReadingStatus for both ePassport and eDL
  * Fixed issue with duplicated nodes instead of the array in JSON results generation for eRFID\_ResultType.RFID\_ResultType\_RFID\_BinaryData

**Licensing:**
* Online transaction-based license usage implemented on mobile. Now it is possible to use same online license on mobile and on the server
* Application ID/platform/OS agnostic license implemented on mobile. This special kind of license allows running SDK on mobile for capturing data as usual but delivers encrypted results package including document images and chip reading data for further processing on the server side with separate online transaction-based license. This allows easy redistribution of the SDK inside custom mobile SDKs without licensing management efforts and issues
* Regula Reader device-based application ID agnostic offline license for Android use implemented. In this case device is storing the license, and license is checked by SDK querying device presence and reading the license from it on initialization

**Database**:
* Templates updated in whole database where applicable:
  * Rotation angle to get correct document display position
  * Fibers description with regards to updated algorithms
  * Nationality field output enabled for ID cards
  * Supported documents list now contains details on image patterns in which lights are checked for each document template
  * 248 countries and territories / 9432 documents included
  * 101 new documents added
  * For details see Supported documents

# 5.5.0
**API**:
* Added the ability to [save a video](https://docs.regulaforensics.com/flutter/custom-settings#video-settings) of the document recognition process.
* Added the ability to use the [`FullAuth`](https://docs.regulaforensics.com/flutter/scenarios) scenario in multipage mode.
* Added the ability to set the mode via [`checkRequiredTextFields`](https://docs.regulaforensics.com/flutter/custom-settings#filters) parameter where field validity would be set to failed if the required field value is missing in Visual OCR.
* Completely redesigned camera focus control implementation
* Added new values to the [`eVisualFieldType`](https://docs.regulaforensics.com/flutter/enumerations/evisualfieldtype)parameter
  * `FT_DLCLASSCODE_CA_NOTES`
  * `FT_CITIZENSHIP_STATUS`
  * `FT_MILITARY_SERVICE_FROM`
  * `FT_MILITARY_SERVICE_TO`
* `DocumentReaderResults` now contains an array of `DocumentPosition`, `BarcodePosition`, `MRZPosition`, and `ImageQualityGroup` items with information for each document page that was read, where available
* Added interactive documentation inside the SDK \(Option + tap in XCode\)
* `getTextFieldValueByType` function call with LCID parameter returns nil if the value with such LCID is not presented in the results
* RFID chip reading works correctly without first scanning the document, if the MRZ or CAN key is pre-set
* Fixed the operation of the completion block in the `stopRFIDReader` function
* Fixed the rendering position of the [help animation](https://docs.regulaforensics.com/flutter/custom-settings#animation) and the [multipage mode animations](https://docs.regulaforensics.com/flutter/custom-settings#animation)
* Fixed the position of custom statuses \([`status`](https://docs.regulaforensics.com/flutter/custom-settings#status-message) and [`resultStatus`](https://docs.regulaforensics.com/flutter/custom-settings#result-status-message)\), now they are displayed in the center
* Fixed issue with [`Capture`](https://docs.regulaforensics.com/flutter/scenarios) scenario when using the 1120 device

**Core**:
* Document detection and crop
  * Fixed issue with locating already cropped documents in [`FullAuth`](https://docs.regulaforensics.com/flutter/scenarios) scenario
  * Fixed issue with locating documents on backgrounds with multiple lines aligned with the document edges
  * Fixed issue with locating two sides of ID card on one image
  * Fixed issue with locating documents on non-contrast backgrounds
* OCR
  * Greatly improved bank cards OCR
  * Improved OCR of perforated fields
* MRZ
  * Added new parsers:
    * Pakistan ID card
  * Updated parsers:
    * Austrian residence permit
    * EU residence permit
    * France ID card
    * Kazakhstan Residence permit
    * Malta ID card
    * Norway ID card
    * Poland ID card
  * Fixed issue with incorrect MRZ detection on some images
  * Fixed issue with incorrect symbol probabilities in some cases
  * Fixed issue with 1-line MRZ in DL parsing
* Barcode
  * Added new parsers:
    * Belarus ID card
    * Colombia DL
    * France ID card
    * Ghana Voter card
    * Nigeria Voter card
    * Pakistan ID card
  * Updated parsers:
    * Korea Alien registration card
    * Moldova ID card
  * Fixed issue with code types for recognition filter
* Text data parsing and validation
  * Added capability to verify date of issue validity based on document template activity term
  * Added capability for Italy tax code validation
  * Added capability for comparison of the field value from one source with abbreviature of this value from another source
  * Added XXK nationality code for Kosovo
  * Fixed issue with comparison between MRZ and Visual for document without expiration date
  * Fixed issue with probabilities for transliterated fields: they will have probability of original field
  * Fixed issue with German Ü letter transliteration
  * Fixed issue with composite surnames comparison where last part is missing in MRZ
  * Fixed issue with measure units on locale change
  * Fixed issue with `FT_DATE_FIRST_RENEWAL` and `FT_DATE_SECOND_RENEWAL`fields validity
* Image QA
  * Improved focus detection NN
  * Improved algorithm for detection of colorless images
* Authenticity
  * Added new algorithm for obtaining correct IR image on 7310 devices
  * Implemented correct processing of all authenticity checks in FullAuth scenario
  * Improved IR visibility check for photo area, where grayscale photo should look the same in visible and IR
  * Improved variable patterns check for documents with a lot of UV luminescence
  * Fixed issue with hologram checks on series of frames
* Added support of reading data from both sides of bank cards
* Added support of single page \(back page\) data bank cards
* Improved processing of bank cards: now it is payment system agnostic
* Fixed issue with input images page indexes. Now they will be set automatically and correctly if missing
* Code quality improved with lots of small issues fixed
* RFID
  * Fixed issue with different `.ldif` format support
  * Fixed issue with parsing certificates on different platforms

**Database**:
* Added to templates in whole database where applicable:
  * Perforated text fields
  * Hologram areas and checks
  * Activity term for template
  * Extended description for visible patterns
  * Barcode format check parameters
  * IR visibility for portraits, where they are the same in visible and IR
* 248 countries and territories / 9331 documents included
* 179 new documents added

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
