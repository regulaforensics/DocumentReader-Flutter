//
//  GraphicFieldType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Enumeration contains identifiers that determine the logical type
/// of the graphic data obtained while reading the document filling fields or barcodes.
enum GraphicFieldType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Photo of the document owner.
  PORTRAIT(201),

  /// Fingerprint of the document owner.
  FINGERPR(202),

  /// Iris of the document owner.
  EYE(203),

  /// Signature of the document owner.
  SIGNATURE(204),

  /// Barcode image.
  BAR_CODE(205),

  /// Image of the citizenship proving document.
  PROOF_OF_CITIZENSHIP(206),

  /// Document image.
  DOCUMENT_IMAGE(207),

  /// Color dynamic area in the document.
  COLOR_DYNAMIC(209),

  /// Ghost portrait.
  GHOST_PORTRAIT(210),

  /// Stamp.
  STAMP(211),

  /// Portrait of child.
  PORTRAIT_OF_CHILD(212),

  /// Contact chip.
  CONTACT_CHIP(213),

  /// Other image type.
  OTHER(250),

  /// Fingerprint, left thumb.
  FINGER_LEFT_THUMB(300),

  /// Fingerprint, left index.
  FINGER_LEFT_INDEX(301),

  /// Fingerprint, left middle.
  FINGER_LEFT_MIDDLE(302),

  /// Fingerprint, left ring.
  FINGER_LEFT_RING(303),

  /// Fingerprint, left little.
  FINGER_LEFT_LITTLE(304),

  /// Fingerprint, right thumb.
  FINGER_RIGHT_THUMB(305),

  /// Fingerprint, right index.
  FINGER_RIGHT_INDEX(306),

  /// Fingerprint, right middle.
  FINGER_RIGHT_MIDDLE(307),

  /// Fingerprint, right ring.
  FINGER_RIGHT_RING(308),

  /// Fingerprint, right little.
  FINGER_RIGHT_LITTLE(309);

  const GraphicFieldType(this.value);
  final int value;

  static GraphicFieldType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return GraphicFieldType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return GraphicFieldType.UNKNOWN;
    }
  }
}
