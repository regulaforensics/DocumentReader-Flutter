//
//  Lights.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Enumeration contains a set of identifiers used for identifying the
/// document reader possibilities, specifying lighting schemes for scanning, etc.
enum Lights {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Light off.
  NONE(0),

  /// General UV light scheme.
  UV(128),

  /// General white light scheme.
  WHITE_FULL(6),

  IR(16777216),

  /// Upper/lower lighters of IR light scheme.
  IR_TOP(8),

  /// Side lighters of IR light scheme.
  IR_SIDE(16),

  /// Upper/lower and side lighters of IR light scheme.
  IR_FULL((8 | 16)),

  /// OVD light for hologram visualization.
  OVD(67108864),

  /// Combined light for [WHITE_FULL] and [OVD].
  WHITE_FULL_OVD(6 | 67108864);

  const Lights(this.value);
  final int value;

  static Lights? getByValue(int? i) {
    if (i == null) return null;
    try {
      return Lights.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return Lights.UNKNOWN;
    }
  }
}
