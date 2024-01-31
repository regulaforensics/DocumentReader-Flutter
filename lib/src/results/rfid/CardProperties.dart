//
//  CardProperties.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Structure is used to store extended information about the characteristics
/// of the RFID-chip located in the scope of the reader.
class CardProperties {
  /// Numeric ATQ_A value in hexadecimal format (e.g. "0x0000").
  int get aTQA => _aTQA;
  late int _aTQA;

  /// ATQ_B contents in text format. Each byte is represented by its
  /// hexadecimal value. The individual bytes are sepa-rated by spaces
  /// (e.g. "50 F9 4F 41 60 00 00 00 00 77 81 81").
  String? get aTQB => _aTQB;
  String? _aTQB;

  /// aTR contents in text format. Each byte is represented by its hexadecimal value.
  /// The individual bytes are separated by spaces
  /// (e.g. "3B 88 81 11 FC 00 00 00 00 77 81 81 00 93").
  String? get aTR => _aTR;
  String? _aTR;

  /// Numeric Baudrate1 value in hexadecimal format (e.g. "0x0000000F").
  String? get baudrate1 => _baudrate1;
  String? _baudrate1;

  /// Numeric Baudrate2 value in hexadecimal format.
  String? get baudrate2 => _baudrate2;
  String? _baudrate2;

  /// Numeric BitRateR value in hexadecimal format (e.g. "0x04").
  int get bitRateR => _bitRateR;
  late int _bitRateR;

  /// Numeric BitRateS value in hexadecimal format (e.g. "0x04").
  int get bitRateS => _bitRateS;
  late int _bitRateS;

  /// Text abbreviation of ChipType_A value.
  int get chipTypeA => _chipTypeA;
  late int _chipTypeA;

  /// Numeric MifareMemory value.
  int get mifareMemory => _mifareMemory;
  late int _mifareMemory;

  /// Text abbreviation of RFID_Type value.
  int get rfidType => _rfidType;
  late int _rfidType;

  /// Numeric SAK value in hexadecimal format (e.g. "0x00").
  int get sAK => _sAK;
  late int _sAK;

  /// Boolean Support_4 value.
  bool get support4 => _support4;
  late bool _support4;

  /// Boolean Support_Mifare value.
  bool get supportMifare => _supportMifare;
  late bool _supportMifare;

  /// UID contents in text format. Each byte is represented by its hexadecimal value.
  /// The individual bytes are separated by spaces (e.g. "F9 4F 41 60").
  String? get uID => _uID;
  String? _uID;

  /// Allows you to deserialize object.
  static CardProperties? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = CardProperties();

    result._aTQA = jsonObject["aTQA"];
    result._bitRateR = jsonObject["bitRateR"];
    result._bitRateS = jsonObject["bitRateS"];
    result._chipTypeA = jsonObject["chipTypeA"];
    result._mifareMemory = jsonObject["mifareMemory"];
    result._rfidType = jsonObject["rfidType"];
    result._sAK = jsonObject["sAK"];
    result._support4 = jsonObject["support4"];
    result._supportMifare = jsonObject["supportMifare"];
    result._aTQB = jsonObject["aTQB"];
    result._aTR = jsonObject["aTR"];
    result._baudrate1 = jsonObject["baudrate1"];
    result._baudrate2 = jsonObject["baudrate2"];
    result._uID = jsonObject["uID"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "aTQA": aTQA,
        "bitRateR": bitRateR,
        "bitRateS": bitRateS,
        "chipTypeA": chipTypeA,
        "mifareMemory": mifareMemory,
        "rfidType": rfidType,
        "sAK": sAK,
        "support4": support4,
        "supportMifare": supportMifare,
        "aTQB": aTQB,
        "aTR": aTR,
        "baudrate1": baudrate1,
        "baudrate2": baudrate2,
        "uID": uID,
      }.clearNulls();
}
