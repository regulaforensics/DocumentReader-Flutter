//
//  RFIDCertificateType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

enum RFIDCertificateType {
  UNDEFINED(0),

  CSCA(1),

  CSCA_LINK(2),

  DS(3),

  MLS(4),

  DEV_LS(5),

  DEF_LS(6),

  BLS(7),

  LDS2(8),

  BCS(9),

  BCSNC(10);

  const RFIDCertificateType(this.value);
  final int value;

  static RFIDCertificateType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDCertificateType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDCertificateType.UNDEFINED;
    }
  }
}
