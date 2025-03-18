//
//  RFIDDataFileType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Enumeration contains a set of constants that define the file type
/// (or logical belonging of the data object) within the context of the
/// communication session with electronic document.
enum RFIDDataFileType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),
  UNSPECIFIED(0),
  PASSPORT_DG1(1),
  PASSPORT_DG2(2),
  PASSPORT_DG3(3),
  PASSPORT_DG4(4),
  PASSPORT_DG5(5),
  PASSPORT_DG6(6),
  PASSPORT_DG7(7),
  PASSPORT_DG8(8),
  PASSPORT_DG9(9),
  PASSPORT_DG10(10),
  PASSPORT_DG11(11),
  PASSPORT_DG12(12),
  PASSPORT_DG13(13),
  PASSPORT_DG14(14),
  PASSPORT_DG15(15),
  PASSPORT_DG16(16),
  PASSPORT_DG17(17),
  PASSPORT_DG18(18),
  PASSPORT_DG19(19),
  PASSPORT_DG20(20),
  PASSPORT_SOD(21),
  PASSPORT_CVCA(22),
  PASSPORT_COM(23),
  DTC_DG17(57),
  DTC_DG18(58),
  DTC_DG22(62),
  DTC_DG23(63),
  DTC_DG24(64),
  ID_DG1(101),
  ID_DG2(102),
  ID_DG3(103),
  ID_DG4(104),
  ID_DG5(105),
  ID_DG6(106),
  ID_DG7(107),
  ID_DG8(108),
  ID_DG9(109),
  ID_DG10(110),
  ID_DG11(111),
  ID_DG12(112),
  ID_DG13(113),
  ID_DG14(114),
  ID_DG15(115),
  ID_DG16(116),
  ID_DG17(117),
  ID_DG18(118),
  ID_DG19(119),
  ID_DG20(120),
  ID_DG21(121),
  DL_COM(150),
  DL_DG1(151),
  DL_DG2(152),
  DL_DG3(153),
  DL_DG4(154),
  DL_DG5(155),
  DL_DG6(156),
  DL_DG7(157),
  DL_DG8(158),
  DL_DG9(159),
  DL_DG10(160),
  DL_DG11(161),
  DL_DG12(162),
  DL_DG13(163),
  DL_DG14(164),
  DL_SOD(165),
  DL_CE(166),
  DL_CVCA(167),
  PACE_CARDACCESS(200),
  PACE_CARDSECURITY(201),
  PACE_CHIPSECURITY(202),
  MIFARE_DATA(300),
  MIFARE_VALIDITY(301),
  AUTHENTICITYV2(302),
  ATR(400),
  ESIGN_PK(500),
  ESIGN_SIGNEDDATA(501),
  CERTIFICATE(600),
  MASTERLIST(601),
  DEFECTLIST(602),
  DEVIATIONLIST(603),
  APP_DIRECTORY(700),
  SESSION(701),
  LOGDATA(702),
  CHIP_PROPERTIES(703),
  SAM_DATA(800),
  SAM_DATA_MAX(800 + 32),
  VDS(900),
  VDSNC(901),
  USERDEFINED(1000);

  const RFIDDataFileType(this.value);
  final int value;

  Future<String> getTranslation() async {
    return await _bridge.invokeMethod("getTranslation", [
      runtimeType.toString(),
      value,
    ]);
  }

  static RFIDDataFileType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDDataFileType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDDataFileType.UNKNOWN;
    }
  }
}
