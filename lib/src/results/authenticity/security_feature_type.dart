//
//  SecurityFeatureType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Enumeration contains identifiers that determine the types of elements
/// for the document authenticity check.
enum SecurityFeatureType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-2),

  NONE(-1),

  /// Blank element.
  BLANK(0),

  /// Personalization element.
  FILL(1),

  /// Photo.
  PHOTO(2),

  /// MRZ.
  MRZ(3),

  /// Photo surrounding area.
  FALSE_LUMINESCENCE(4),

  /// Reserved for internal use.
  HOLO_SIMPLE(5),

  /// Reserved for internal use.
  HOLO_VERIFY_STATIC(6),

  /// Reserved for internal use.
  HOLO_VERIFY_MULTI_STATIC(7),

  /// Reserved for internal use.
  HOLO_VERIFY_DINAMIC(8),

  /// Reserved for internal use.
  PATTERN_NOT_INTERRUPTED(9),

  /// Reserved for internal use.
  PATTERN_NOT_SHIFTED(10),

  /// Reserved for internal use.
  PATTERN_SAME_COLORS(11),

  /// Reserved for internal use.
  PATTERN_IR_INVISIBLE(12),

  /// Reserved for internal use.
  PHOTO_SIZE_CHECK(13),

  /// Main portrait and ghost portrait comparison.
  PORTRAIT_COMPARISON_VS_GHOST(14),

  /// Main portrait and RFID portrait comparison.
  PORTRAIT_COMPARISON_VS_RFID(15),

  /// Main portrait and other page portrait comparison.
  PORTRAIT_COMPARISON_VS_VISUAL(16),

  /// Barcode format check.
  BARCODE(17),

  /// Different lines thickness.
  PATTERN_DIFFERENT_LINES_THICKNESS(18),

  /// Portrait comparison with image from camera.
  PORTRAIT_COMPARISON_VS_CAMERA(19),

  /// Portrait comparison with image from RFID.
  PORTRAIT_COMPARISON_RFID_VS_CAMERA(20),

  /// Ghost photo.
  GHOST_PHOTO(21),

  /// Clear ghost photo.
  CLEAR_GHOST_PHOTO(22),

  /// Invisible object.
  INVISIBLE_OBJECT(23),

  /// Low contrast object.
  LOW_CONTRAST_OBJECT(24),

  /// Photo color type.
  PHOTO_COLOR(25),

  /// Photo squareness check.
  PHOTO_SHAPE(26),

  /// Photo corners shape.
  PHOTO_CORNERS(27),

  DOCUMENT_CANCELLING_DETECTOR(28),
  OCR(28),

  PORTRAIT_COMPARISON_EXTVS_VISUAL(29),

  PORTRAIT_COMPARISON_EXTVS_RFID(30),

  PORTRAIT_COMPARISON_EXTVS_LIVE(31),

  LIVENESS_DEPTH(32),

  MICROTEXT(33),

  FLUORESCENT_OBJECT(34),

  LANDMARKS_CHECK(35),

  FACE_PRESENCE(36),

  FACE_ABSENCE(38),

  LIVENESS_SCREEN_CAPTURE(39),

  /// Checking the presence of a device that could be used for document capturing.
  LIVENESS_ELECTRONIC_DEVICE(40),

  LIVENESS_OVI(41),

  BARCODE_SIZE_CHECK(42),

  LAS_INK(43),

  LIVENESS_MLI(44),

  LIVENESS_BARCODE_BACKGROUND(45),

  /// Visual zone portrait image vs. image from barcode.
  PORTRAIT_COMPARISON_VS_BARCODE(46),

  /// Image from barcode vs. image from RFID.
  PORTRAIT_COMPARISON_RFID_VS_BARCODE(47),

  /// Image from barcode vs. external source image.
  PORTRAIT_COMPARISON_EXT_VS_BARCODE(48),

  /// Image from barcode vs. photo from camera.
  PORTRAIT_COMPARISON_BARCODE_VS_CAMERA(49),

  /// Digital signature сheck.
  CHECK_DIGITAL_SIGNATURE(50),

  /// Contact сhip check.
  CONTACT_CHIP_CLASSIFICATION(51),

  HEAD_POSITION_CHECK(52),

  LIVENESS_BLACK_AND_WHITE_COPY_CHECK(53),

  LIVENESS_DYNAPRINT(54),

  LIVENESS_GEOMETRY_CHECK(55),

  /// Age check.
  AGE_CHECK(56),

  /// Sex check.
  SEX_CHECK(57);

  const SecurityFeatureType(this.value);
  final int value;

  static SecurityFeatureType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return SecurityFeatureType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return SecurityFeatureType.UNKNOWN;
    }
  }
}
