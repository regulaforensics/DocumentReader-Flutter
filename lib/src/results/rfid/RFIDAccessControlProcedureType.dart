//
//  RFIDAccessControlProcedureType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

enum RFIDAccessControlProcedureType {
  /// Type is not defined.
  UNDEFINED(0),

  /// Basic Access Control (BAC) / Protection (BAP).
  BAC(1),

  /// Password Authenticated Connection Establishment.
  PACE(2),

  /// Chip Authentication.
  CA(3),

  /// Terminal Authentication.
  TA(4),

  /// Active Authentication.
  AA(5),

  /// Restricted Identification.
  RI(6),

  /// Card info.
  CARD_INFO(10);

  const RFIDAccessControlProcedureType(this.value);
  final int value;

  static RFIDAccessControlProcedureType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDAccessControlProcedureType.values
          .firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDAccessControlProcedureType.UNDEFINED;
    }
  }
}
