//
//  Authenticity.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Enumeration contains identifiers that determine the possibility
/// of performing different authenticity control procedures
/// using images for definite lighting schemes.
enum Authenticity {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// No authenticity control procedure provided for this document.
  NONE(0),

  /// Document material UV fluorescence control (check for presence of UV
  /// dull paper) is provided for this document.
  UV_LUMINESCENCE(1),

  /// Control of MRZ contrast using the image for IR lighting scheme
  /// is provided for this document.
  IR_B900(2),

  /// Control of the presence of an image pattern with a specified color,
  /// shape and brightness on a document page under white, UV and IR light.
  IMAGE_PATTERN(4),

  /// UV fluorescence of protection fibers control is provided for this document.
  AXIAL_PROTECTION(8),

  /// Blank elements visibility control using the images for IR lighting scheme
  /// is provided for this document.
  UV_FIBERS(16),

  /// Authenticity control using the images for white coaxial light scheme
  /// is provided for this document.
  IR_VISIBILITY(32),

  /// Make OCR for the text field in UV and compare it with other text sources.
  OCR_SECURITY_TEXT(64),

  /// Find invisible personal information images.
  IPI(128),

  /// Check photo is printed or sticked.
  PHOTO_EMBED_TYPE(512),

  /// OVI check.
  OVI(1024),

  /// Reserved for internal use.
  HOLOGRAMS(4096),

  /// Reserved for internal use.
  PHOTO_AREA(8192),

  /// Portrait comparison.
  PORTRAIT_COMPARISON(32768),

  /// Barcode format check.
  BARCODE_FORMAT_CHECK(65536),

  /// Kinegram.
  KINEGRAM(131072),

  /// Reserved for internal use.
  HOLOGRAMS_DETECTION(524288),

  /// Liveness.
  LIVENESS(2097152),

  /// Extended OCR check.
  OCR(4194304),

  /// Checks the correctness of the size of the MRZ lines, their relative position,
  /// absence of signs that the image was edited.
  MRZ(8388608),

  /// Status only.
  STATUS_ONLY(2147483648);

  const Authenticity(this.value);
  final int value;

  static Authenticity? getByValue(int? i) {
    if (i == null) return null;
    try {
      return Authenticity.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return Authenticity.UNKNOWN;
    }
  }
}
