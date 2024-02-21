# 7.1

#### Plugin:

* BREAKING CHANGE: whole DocumentReader plugin rewritten from scratch with focus on user experience and convenience. Migration instructions can be found [here](https://docs.regulaforensics.com/develop/doc-reader-sdk/migration/v6-to-v7/flutter/).

# 5.8.0

#### API:

* Added capability to load and process a PDF file or an image in the form of binary data
* Added the ability to change many new properties through processParams, and not through customParams only, as it was before
* Added the ability to disable automatic license renewal
* Added the ability to disable barcode parsing
* Changed processParams, most values are now objects
* Fixed memory leak when using the readRFID function
* Fixed the display of prompts while reading several pages of a document
* Fixed a problem with the display of the flashlight button
* Added new values to the `eVisualFieldType` parameter
  * `FT_DLCLASSCODE_CD_FROM`
  * `FT_DLCLASSCODE_CD_TO`
  * `FT_DLCLASSCODE_CD_NOTES`

#### Core:

* Document detection and crop
  * Multiple optimizations and improvements that reduce processing time and allow more precise cropping of the documents from an input image and better recognition
  * Improvements of processing two sides of an ID card in one image
  * Added support for Brazilian Driving Licenses format (unfolded)
* OCR
  * Significantly improved recognition quality for Arabic, Chinese and Japanese
  * Added correct support for perforation fonts used in the Philippines, Equatorial Guinea, Ireland, Poland
  * Fixed issue with reading perforated numbers in Finland, Sweden
* MRZ
  * Updated parsers:
    * Albania ID card
    * Cote d'Ivoire ID card
    * Kenya Foreigner Certificate
    * Korea passport
    * Morocco ID card
    * Netherlands’s passport
    * Norway ID card
  * Improved MRZ detection on complex backgrounds
  * Fixed issue with ID1 2x30 format detection / parameters output
* Barcode
  * Added new parsers:
    * Argentina DL
    * Bangladesh ID card
    * Colombia ID card
    * Honduras ID card
    * Mexico DL
    * Moldova Residence Permit
    * Myanmar DL
    * Nicaragua ID card
    * Panama ID card
    * Philippines DL
    * Russian Federation housing and utilities bills
    * Santa Lucia ID card
  * Updated parsers:
    * AAMWA (Issuer Identification Number added)
    * Belarus ID card / Residence permit
    * Jamaica Firearm License
    * Rwanda ID card
    * Togo ID card, Residence permit
  * Minor fixes for 1D, 2D codes reading
* Text data parsing and validation
  * Added parsing and conversion of the Taiwan calendar dates into Gregorian and creation of additional fields of the same type as original with LCID equal to 0
  * Added “customParams.convertCase” parameter, that may specify the desired conversion of text case in output results based on the dedicated enumeration. By default, text fields are returned in the original case as they are in the document
  * Added “processParam.minimalHolderAge” parameter, that may specify minimum age threshold of document holder. If the calculated age is below this threshold, then age field validity and document validity will fail. By default, not set and restrictions are not applied
  * Added possibility to specify the need of transliteration from Cyrillic to Latin for specific fields in the document template
  * Added conversion from issuing authority code to its name for Belarus
  * Fixed issue with field value mask used for OCR and parsing. Now they can be separated
  * Fixed issue with “processParam.dateFormat” applied from the previous request if not set in consequent requests
  * Fixed issue with transliteration of “ñ” in Peru documents
  * Fixed issue with comparison of values from transliterated text fields from Arabic to Latin with original Latin fields. Now such transliterated fields are excluded from the comparison
  * Fixed issue with Hijri dates conversion to the Gregorian calendar
  * Fixed issue with Japanese dates conversion – original value was missing from results
  * Fixed issue with partial comparison of the document numbers
  * Fixed issue with names comparison when the visual field value is shorter than in MRZ (truncated/abbreviated)
  * Updated stop words list for names
* Image QA
  * Updated NN for focus detection (accuracy, size, and inference time improved)
  * Updated NN for moiré detection (accuracy, size, and inference time improved)
* Authenticity
  * Fixed issue with false luminescence check which led to false rejections
  * Fixed issue with hologram detection in some documents
* Added new NN for face detection with improved detection accuracy and speed
* Fixed issue with not reading CAN from ID cards on normal scans when only MRZ is enabled (without Visual OCR)
* Fixed issue with requesting more than one additional page for ID cards in some cases (ID1, ID2)
* Fixed issue with the processing of some PDF files that led to incorrect results or crashes&#x20;
* Fixed performance issue with performing face detection and MRZ reading twice in case the original image is already cropped, but the processParam.alreadyCropped option is not set
* Fixed performance issue with processing multiple pages in one request that led to increased processing time depending on the order of the submitted pages
* Fixed issue with no returning RFID reading results in case session saving was enabled
* Fixed issue with reducing cropped image resolution when capturing UV and IR on 7310 devices
* Fixed issue with incorrect behavior if input images in base64 in /process request contain headers with description of contents like "data:image/jpeg;base64", etc
* Fixed issue with not clearing results of the previous scan when it was submitted in encrypted format (mobile capture session for reprocessing on the server)
* Fixed issue when processing multiple pages of unknown documents and not all of them were in output results
* Fixed issue with incorrect elapsedTime value in output results
* Fixed significant performance issue with loading input data from JSON
* Fixed significant performance issue with output results into JSON
* Fixed performance and high memory usage issue with cropping of graphical fields
* Fixed performance issue when processing some cases of PDF files
* Fixed issue with losing connection to 3rd party devices when portrait comparison is called&#x20;
* Fixed issue with log output format and depth setting
* Code quality improved with lots of small issues fixed

#### Core RFID SDK:

* Implemented capability to perform BAC after PACE was performed unsuccessfully
* Fixed issue with using extended length commands when performing AA when using key/signature length of 229 bytes

#### Licensing:

* Implemented capability to hide Regula logo with online transaction based mobile SDK license
* Implemented capability to automatically update an expired license on mobile via a request to our licensing service when using an offline static license in the mobile app. This is very useful, as the application does not have to be recompiled for updating the license only on its expiration. In case renewed offline license was issued for this specific application ID / bundleID, this new license will be automatically downloaded and used on SDK initialization. This can be disabled by setting a specific property in mobile SDK before initialization

#### Database:

* Fixed issues in multiple (over 100) document templates for better quality results
* Changed dType to diPassportPage value in passport other page templates, except for main biographical data page
* 248 countries and territories / 9813 documents included
* 166 new documents added
* For details see Supported documents list

# 5.7.0

#### API:

* Added restart of the process on the camera switch during the scanning process
* Added restart of the process on the camera orientation change during the scanning process. The orientation cannot be changed after the processing of at least one page is completed.
* Added the ability to receive events about the connection to the RFID chip and errors in the process of reading the chip
* Android:
  * Added the ability to provide the database as a binary file during SDK initialization
  * Fixed a crash on devices that do not have Google Play Services
  * Removed `android.permission.INTERNET` from framework manifest. Now, if necessary, this permission should be set at the application level
* iOS:
  * Implemented delivery of SDK in “.xcframework” format
  * Added the `RGLCameraViewControllerActionProcessWhiteFlashLight` event notifying that the flash was turned on forcibly
  * All `@import` native libraries have been replaced with `#import`
* Added new values to the [`eVisualFieldType`](https://docs.regulaforensics.com/flutter/enumerations/evisualfieldtype) parameter

#### Core:

* OCR
  * Significantly improved recognition quality for Arabic, Western European, Chinese and Japanese
  * Implemented correct reading for Arabic and Persian numbers \(correct Unicode symbols in output values\)
  * Improved reading of perforated document numbers in different countries \(new fonts supported\)
  * Fixed issue with not returning required fields on timeout. Now they are returned anyway, with empty values if the fields were not read
* MRZ
  * Updated parsers:
    * Belarus passport
    * Comoros ID card
    * Dominican Republic ID card
    * Jordan ID card
    * Russian visa
    * Serbian ID card
    * Switzerland DL
    * Thailand passport
* Barcode
  * Added new parsers:
    * Belgium ID card
    * Costa Rica Child ID card
    * ECOWAS Id card
    * India AADHAAR ID card
    * Viet Nam ID card
  * Improved processing time for 1D, 2D codes
  * Fixed issue with CODE128 wrong treated checksums in rare cases
* Text data parsing and validation
  * Added parsing and conversion of the Japanese calendar dates into Gregorian and creation of additional fields of the same type as original with LCID equal to 0
  * Added parsing and conversion of the Islamic calendar dates into Gregorian and creation of additional fields of the same type as original with LCID equal to 0
  * Added capability to shift the expiry date when calculating the document expiration status. Set the [`customParams "shiftExpiryDate"`](https://docs.regulaforensics.com/flutter/custom-settings#custom-params) parameter for shifting the date of expiry into the future or past for the number of months specified. This is useful, for example, in some cases when the document might be still valid for some period after the original expiration date to prevent negative validity status for such documents. Shifting the date to the past will set negative validity for the documents that is about to expire in the specified number of months
  * Added transliteration from Arabic letters to Latin according to ICAO and creation of additional fields of the same type as original with LCID equal to 0
  * Added transliteration from Arabic and Persian numbers to ASCII numbers and creation of additional fields of the same type as original with LCID equal to 0
  * Added parsing of data from DG11 in eDL of Netherlands and extraction of the BSN number as a separate field
  * Fixed issue with Vietnamese character uppercase conversion and further validation
* Image QA
  * Fixed issue with glare detection on the whole portrait area instead of the face area
* Authenticity
  * Fixed issue with element coordinates in output for image patterns check
  * Fixed issue with UV dull paper check parameters for different documents in one series
  * Fixed issue with hologram detection in some documents
* Added capability to guarantee that output image will contain correct MRZ on it in series process mode \(on mobile, for example\). Set the [`customParams "forceReadMrzBeforeLocate"`](https://docs.regulaforensics.com/flutter/custom-settings#custom-params)Boolean flag to True to enable this logic. False by default
* Added capability to provide in [`customParams`](https://docs.regulaforensics.com/flutter/custom-settings#custom-params) JSON parameters “config” object, that may contain specific settings on a per-document basis. Currently, it is possible to disable some of the authenticity checks for the listed document IDs
* Fixed issue with incorrect DPI detection in some rare cases
* Fixed issue with the expectance of additional pages for two-sided documents when both sides are already scanned
* Fixed issue with non-zero page index for one-page document results
* Fixed issue with random page indexes on multiple pages processing
* Fixed issue with rare crashes when processing specific images \(very small images\)
* Code quality improved with lots of small issues fixed
* RFID
  * Implemented sending of IS certificate as part of the TA\_Signature request
  * Improved the algorithm of building certificate chains for the TA process where multiple certificates from different chains are stored in one folder
  * Fixed issue with TCC communication that led to exception on connection

**Licensing:**

* Fixed issue with the license for bank card reading functionality only

#### Database:

* Fixed issues in multiple document templates for better quality results
* 248 countries and territories / 9647 documents included
* 215 new documents added
* For details see [Supported documents list](https://downloads.regulaforensics.com/work/SDK/SDK%20Release%20Notes%20%28en%29.pdf)

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
