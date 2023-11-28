//
//  RfidScenario.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Params that influence the RFID chip processing.
class RFIDScenario {
  bool? get paceStaticBinding => _paceStaticBinding;
  bool? _paceStaticBinding;
  set paceStaticBinding(bool? val) {
    _paceStaticBinding = val;
    _setRfidScenario({"paceStaticBinding": val}, this);
  }

  bool? get onlineTA => _onlineTA;
  bool? _onlineTA;
  set onlineTA(bool? val) {
    _onlineTA = val;
    _setRfidScenario({"onlineTA": val}, this);
  }

  bool? get writeEid => _writeEid;
  bool? _writeEid;
  set writeEid(bool? val) {
    _writeEid = val;
    _setRfidScenario({"writeEid": val}, this);
  }

  bool? get universalAccessRights => _universalAccessRights;
  bool? _universalAccessRights;
  set universalAccessRights(bool? val) {
    _universalAccessRights = val;
    _setRfidScenario({"universalAccessRights": val}, this);
  }

  bool? get authorizedRestrictedIdentification =>
      _authorizedRestrictedIdentification;
  bool? _authorizedRestrictedIdentification;
  set authorizedRestrictedIdentification(bool? val) {
    _authorizedRestrictedIdentification = val;
    _setRfidScenario({"authorizedRestrictedIdentification": val}, this);
  }

  bool? get auxVerificationCommunityID => _auxVerificationCommunityID;
  bool? _auxVerificationCommunityID;
  set auxVerificationCommunityID(bool? val) {
    _auxVerificationCommunityID = val;
    _setRfidScenario({"auxVerificationCommunityID": val}, this);
  }

  bool? get auxVerificationDateOfBirth => _auxVerificationDateOfBirth;
  bool? _auxVerificationDateOfBirth;
  set auxVerificationDateOfBirth(bool? val) {
    _auxVerificationDateOfBirth = val;
    _setRfidScenario({"auxVerificationDateOfBirth": val}, this);
  }

  bool? get skipAA => _skipAA;
  bool? _skipAA;
  set skipAA(bool? val) {
    _skipAA = val;
    _setRfidScenario({"skipAA": val}, this);
  }

  bool? get strictProcessing => _strictProcessing;
  bool? _strictProcessing;
  set strictProcessing(bool? val) {
    _strictProcessing = val;
    _setRfidScenario({"strictProcessing": val}, this);
  }

  bool? get pkdDSCertPriority => _pkdDSCertPriority;
  bool? _pkdDSCertPriority;
  set pkdDSCertPriority(bool? val) {
    _pkdDSCertPriority = val;
    _setRfidScenario({"pkdDSCertPriority": val}, this);
  }

  bool? get pkdUseExternalCSCA => _pkdUseExternalCSCA;
  bool? _pkdUseExternalCSCA;
  set pkdUseExternalCSCA(bool? val) {
    _pkdUseExternalCSCA = val;
    _setRfidScenario({"pkdUseExternalCSCA": val}, this);
  }

  bool? get trustedPKD => _trustedPKD;
  bool? _trustedPKD;
  set trustedPKD(bool? val) {
    _trustedPKD = val;
    _setRfidScenario({"trustedPKD": val}, this);
  }

  bool? get passiveAuth => _passiveAuth;
  bool? _passiveAuth;
  set passiveAuth(bool? val) {
    _passiveAuth = val;
    _setRfidScenario({"passiveAuth": val}, this);
  }

  bool? get useSFI => _useSFI;
  bool? _useSFI;
  set useSFI(bool? val) {
    _useSFI = val;
    _setRfidScenario({"useSFI": val}, this);
  }

  bool? get readEPassport => _readEPassport;
  bool? _readEPassport;
  set readEPassport(bool? val) {
    _readEPassport = val;
    _setRfidScenario({"readEPassport": val}, this);
  }

  bool? get readEID => _readEID;
  bool? _readEID;
  set readEID(bool? val) {
    _readEID = val;
    _setRfidScenario({"readEID": val}, this);
  }

  bool? get readEDL => _readEDL;
  bool? _readEDL;
  set readEDL(bool? val) {
    _readEDL = val;
    _setRfidScenario({"readEDL": val}, this);
  }

  bool? get authorizedSTSignature => _authorizedSTSignature;
  bool? _authorizedSTSignature;
  set authorizedSTSignature(bool? val) {
    _authorizedSTSignature = val;
    _setRfidScenario({"authorizedSTSignature": val}, this);
  }

  bool? get authorizedSTQSignature => _authorizedSTQSignature;
  bool? _authorizedSTQSignature;
  set authorizedSTQSignature(bool? val) {
    _authorizedSTQSignature = val;
    _setRfidScenario({"authorizedSTQSignature": val}, this);
  }

  bool? get authorizedWriteDG17 => _authorizedWriteDG17;
  bool? _authorizedWriteDG17;
  set authorizedWriteDG17(bool? val) {
    _authorizedWriteDG17 = val;
    _setRfidScenario({"authorizedWriteDG17": val}, this);
  }

  bool? get authorizedWriteDG18 => _authorizedWriteDG18;
  bool? _authorizedWriteDG18;
  set authorizedWriteDG18(bool? val) {
    _authorizedWriteDG18 = val;
    _setRfidScenario({"authorizedWriteDG18": val}, this);
  }

  bool? get authorizedWriteDG19 => _authorizedWriteDG19;
  bool? _authorizedWriteDG19;
  set authorizedWriteDG19(bool? val) {
    _authorizedWriteDG19 = val;
    _setRfidScenario({"authorizedWriteDG19": val}, this);
  }

  bool? get authorizedWriteDG20 => _authorizedWriteDG20;
  bool? _authorizedWriteDG20;
  set authorizedWriteDG20(bool? val) {
    _authorizedWriteDG20 = val;
    _setRfidScenario({"authorizedWriteDG20": val}, this);
  }

  bool? get authorizedWriteDG21 => _authorizedWriteDG21;
  bool? _authorizedWriteDG21;
  set authorizedWriteDG21(bool? val) {
    _authorizedWriteDG21 = val;
    _setRfidScenario({"authorizedWriteDG21": val}, this);
  }

  bool? get authorizedVerifyAge => _authorizedVerifyAge;
  bool? _authorizedVerifyAge;
  set authorizedVerifyAge(bool? val) {
    _authorizedVerifyAge = val;
    _setRfidScenario({"authorizedVerifyAge": val}, this);
  }

  bool? get authorizedVerifyCommunityID => _authorizedVerifyCommunityID;
  bool? _authorizedVerifyCommunityID;
  set authorizedVerifyCommunityID(bool? val) {
    _authorizedVerifyCommunityID = val;
    _setRfidScenario({"authorizedVerifyCommunityID": val}, this);
  }

  bool? get authorizedPrivilegedTerminal => _authorizedPrivilegedTerminal;
  bool? _authorizedPrivilegedTerminal;
  set authorizedPrivilegedTerminal(bool? val) {
    _authorizedPrivilegedTerminal = val;
    _setRfidScenario({"authorizedPrivilegedTerminal": val}, this);
  }

  bool? get authorizedCANAllowed => _authorizedCANAllowed;
  bool? _authorizedCANAllowed;
  set authorizedCANAllowed(bool? val) {
    _authorizedCANAllowed = val;
    _setRfidScenario({"authorizedCANAllowed": val}, this);
  }

  bool? get authorizedPINManagement => _authorizedPINManagement;
  bool? _authorizedPINManagement;
  set authorizedPINManagement(bool? val) {
    _authorizedPINManagement = val;
    _setRfidScenario({"authorizedPINManagement": val}, this);
  }

  bool? get authorizedInstallCert => _authorizedInstallCert;
  bool? _authorizedInstallCert;
  set authorizedInstallCert(bool? val) {
    _authorizedInstallCert = val;
    _setRfidScenario({"authorizedInstallCert": val}, this);
  }

  bool? get authorizedInstallQCert => _authorizedInstallQCert;
  bool? _authorizedInstallQCert;
  set authorizedInstallQCert(bool? val) {
    _authorizedInstallQCert = val;
    _setRfidScenario({"authorizedInstallQCert": val}, this);
  }

  bool? get applyAmendments => _applyAmendments;
  bool? _applyAmendments;
  set applyAmendments(bool? val) {
    _applyAmendments = val;
    _setRfidScenario({"applyAmendments": val}, this);
  }

  bool? get autoSettings => _autoSettings;
  bool? _autoSettings;
  set autoSettings(bool? val) {
    _autoSettings = val;
    _setRfidScenario({"autoSettings": val}, this);
  }

  int? get readingBuffer => _readingBuffer;
  int? _readingBuffer;
  set readingBuffer(int? val) {
    _readingBuffer = val;
    _setRfidScenario({"readingBuffer": val}, this);
  }

  int? get onlineTAToSignDataType => _onlineTAToSignDataType;
  int? _onlineTAToSignDataType;
  set onlineTAToSignDataType(int? val) {
    _onlineTAToSignDataType = val;
    _setRfidScenario({"onlineTAToSignDataType": val}, this);
  }

  static final int _coreDefaultReadingBufferSize = 231;

  int get defaultReadingBufferSize => _defaultReadingBufferSize;
  int _defaultReadingBufferSize = _coreDefaultReadingBufferSize;
  set defaultReadingBufferSize(int val) {
    _defaultReadingBufferSize = val;
    _setRfidScenario({"defaultReadingBufferSize": val}, this);
  }

  SignManagementAction? get signManagementAction => _signManagementAction;
  SignManagementAction? _signManagementAction;
  set signManagementAction(SignManagementAction? val) {
    _signManagementAction = val;
    _setRfidScenario({"signManagementAction": val?.value}, this);
  }

  RFIDSDKProfilerType? get profilerType => _profilerType;
  RFIDSDKProfilerType? _profilerType;
  set profilerType(RFIDSDKProfilerType? val) {
    _profilerType = val;
    _setRfidScenario({"profilerType": val?.value}, this);
  }

  RFIDAuthenticationProcedureType? get authProcType => _authProcType;
  RFIDAuthenticationProcedureType? _authProcType;
  set authProcType(RFIDAuthenticationProcedureType? val) {
    _authProcType = val;
    _setRfidScenario({"authProcType": val?.value}, this);
  }

  RFIDAccessControlProcedureType? get baseSMProcedure => _baseSMProcedure;
  RFIDAccessControlProcedureType? _baseSMProcedure;
  set baseSMProcedure(RFIDAccessControlProcedureType? val) {
    _baseSMProcedure = val;
    _setRfidScenario({"baseSMProcedure": val?.value}, this);
  }

  RFIDPasswordType? get pacePasswordType => _pacePasswordType;
  RFIDPasswordType? _pacePasswordType;
  set pacePasswordType(RFIDPasswordType? val) {
    _pacePasswordType = val;
    _setRfidScenario({"pacePasswordType": val?.value}, this);
  }

  RFIDTerminalType? get terminalType => _terminalType;
  RFIDTerminalType? _terminalType;
  set terminalType(RFIDTerminalType? val) {
    _terminalType = val;
    _setRfidScenario({"terminalType": val?.value}, this);
  }

  String? get password => _password;
  String? _password;
  set password(String? val) {
    _password = val;
    _setRfidScenario({"password": val}, this);
  }

  String? get pkdPA => _pkdPA;
  String? _pkdPA;
  set pkdPA(String? val) {
    _pkdPA = val;
    _setRfidScenario({"pkdPA": val}, this);
  }

  String? get pkdEAC => _pkdEAC;
  String? _pkdEAC;
  set pkdEAC(String? val) {
    _pkdEAC = val;
    _setRfidScenario({"pkdEAC": val}, this);
  }

  String? get mrz => _mrz;
  String? _mrz;
  set mrz(String? val) {
    _mrz = val;
    _setRfidScenario({"mrz": val}, this);
  }

  String? get eSignPINDefault => _eSignPINDefault;
  String? _eSignPINDefault;
  set eSignPINDefault(String? val) {
    _eSignPINDefault = val;
    _setRfidScenario({"eSignPINDefault": val}, this);
  }

  String? get eSignPINNewValue => _eSignPINNewValue;
  String? _eSignPINNewValue;
  set eSignPINNewValue(String? val) {
    _eSignPINNewValue = val;
    _setRfidScenario({"eSignPINNewValue": val}, this);
  }

  ReprocParams? get reprocessParams => _reprocessParams;
  ReprocParams? _reprocessParams;
  set reprocessParams(ReprocParams? val) {
    _reprocessParams = val;
    _setRfidScenario({"reprocessParams": val?.toJson()}, this);
  }

  EDLDataGroups get eDLDataGroups => _eDLDataGroups;
  EDLDataGroups _eDLDataGroups = new EDLDataGroups();
  set eDLDataGroups(EDLDataGroups val) {
    _eDLDataGroups = val;
    _eDLDataGroups._apply();
  }

  EPassportDataGroups get ePassportDataGroups => _ePassportDataGroups;
  EPassportDataGroups _ePassportDataGroups = new EPassportDataGroups();
  set ePassportDataGroups(EPassportDataGroups val) {
    _ePassportDataGroups = val;
    _ePassportDataGroups._apply();
  }

  EIDDataGroups get eIDDataGroups => _eIDDataGroups;
  EIDDataGroups _eIDDataGroups = new EIDDataGroups();
  set eIDDataGroups(EIDDataGroups val) {
    _eIDDataGroups = val;
    _eIDDataGroups._apply();
  }

  /// Allows you to deserialize object.
  fromJson(Map<String, dynamic> jsonObject) {
    _paceStaticBinding = jsonObject["paceStaticBinding"];
    _onlineTA = jsonObject["onlineTA"];
    _writeEid = jsonObject["writeEid"];
    _universalAccessRights = jsonObject["universalAccessRights"];
    _authorizedRestrictedIdentification =
        jsonObject["authorizedRestrictedIdentification"];
    _auxVerificationCommunityID = jsonObject["auxVerificationCommunityID"];
    _auxVerificationDateOfBirth = jsonObject["auxVerificationDateOfBirth"];
    _skipAA = jsonObject["skipAA"];
    _strictProcessing = jsonObject["strictProcessing"];
    _pkdDSCertPriority = jsonObject["pkdDSCertPriority"];
    _pkdUseExternalCSCA = jsonObject["pkdUseExternalCSCA"];
    _trustedPKD = jsonObject["trustedPKD"];
    _passiveAuth = jsonObject["passiveAuth"];
    _useSFI = jsonObject["useSFI"];
    _readEPassport = jsonObject["readEPassport"];
    _readEID = jsonObject["readEID"];
    _readEDL = jsonObject["readEDL"];
    _authorizedSTSignature = jsonObject["authorizedSTSignature"];
    _authorizedSTQSignature = jsonObject["authorizedSTQSignature"];
    _authorizedWriteDG17 = jsonObject["authorizedWriteDG17"];
    _authorizedWriteDG18 = jsonObject["authorizedWriteDG18"];
    _authorizedWriteDG19 = jsonObject["authorizedWriteDG19"];
    _authorizedWriteDG20 = jsonObject["authorizedWriteDG20"];
    _authorizedWriteDG21 = jsonObject["authorizedWriteDG21"];
    _authorizedVerifyAge = jsonObject["authorizedVerifyAge"];
    _authorizedVerifyCommunityID = jsonObject["authorizedVerifyCommunityID"];
    _authorizedPrivilegedTerminal = jsonObject["authorizedPrivilegedTerminal"];
    _authorizedCANAllowed = jsonObject["authorizedCANAllowed"];
    _authorizedPINManagement = jsonObject["authorizedPINManagement"];
    _authorizedInstallCert = jsonObject["authorizedInstallCert"];
    _authorizedInstallQCert = jsonObject["authorizedInstallQCert"];
    _applyAmendments = jsonObject["applyAmendments"];
    _autoSettings = jsonObject["autoSettings"];

    _readingBuffer = jsonObject["readingBuffer"];
    _onlineTAToSignDataType = jsonObject["onlineTAToSignDataType"];
    _defaultReadingBufferSize = jsonObject["defaultReadingBufferSize"];
    _signManagementAction =
        SignManagementAction.getByValue(jsonObject["signManagementAction"]);
    _profilerType = RFIDSDKProfilerType.getByValue(jsonObject["profilerType"]);
    _authProcType =
        RFIDAuthenticationProcedureType.getByValue(jsonObject["authProcType"]);
    _baseSMProcedure = RFIDAccessControlProcedureType.getByValue(
        jsonObject["baseSMProcedure"]);
    _pacePasswordType =
        RFIDPasswordType.getByValue(jsonObject["pacePasswordType"]);
    _terminalType = RFIDTerminalType.getByValue(jsonObject["terminalType"]);

    _password = jsonObject["password"];
    _pkdPA = jsonObject["pkdPA"];
    _pkdEAC = jsonObject["pkdEAC"];
    _mrz = jsonObject["mrz"];
    _eSignPINDefault = jsonObject["eSignPINDefault"];
    _eSignPINNewValue = jsonObject["eSignPINNewValue"];

    _reprocessParams = ReprocParams.fromJson(jsonObject["reprocessParams"]);

    _eDLDataGroups.fromJson(jsonObject["eDLDataGroups"]);
    _ePassportDataGroups.fromJson(jsonObject["ePassportDataGroups"]);
    _eIDDataGroups.fromJson(jsonObject["eIDDataGroups"]);

    return this;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "paceStaticBinding": paceStaticBinding,
        "onlineTA": onlineTA,
        "writeEid": writeEid,
        "universalAccessRights": universalAccessRights,
        "authorizedRestrictedIdentification":
            authorizedRestrictedIdentification,
        "auxVerificationCommunityID": auxVerificationCommunityID,
        "auxVerificationDateOfBirth": auxVerificationDateOfBirth,
        "skipAA": skipAA,
        "strictProcessing": strictProcessing,
        "pkdDSCertPriority": pkdDSCertPriority,
        "pkdUseExternalCSCA": pkdUseExternalCSCA,
        "trustedPKD": trustedPKD,
        "passiveAuth": passiveAuth,
        "useSFI": useSFI,
        "readEPassport": readEPassport,
        "readEID": readEID,
        "readEDL": readEDL,
        "authorizedSTSignature": authorizedSTSignature,
        "authorizedSTQSignature": authorizedSTQSignature,
        "authorizedWriteDG17": authorizedWriteDG17,
        "authorizedWriteDG18": authorizedWriteDG18,
        "authorizedWriteDG19": authorizedWriteDG19,
        "authorizedWriteDG20": authorizedWriteDG20,
        "authorizedWriteDG21": authorizedWriteDG21,
        "authorizedVerifyAge": authorizedVerifyAge,
        "authorizedVerifyCommunityID": authorizedVerifyCommunityID,
        "authorizedPrivilegedTerminal": authorizedPrivilegedTerminal,
        "authorizedCANAllowed": authorizedCANAllowed,
        "authorizedPINManagement": authorizedPINManagement,
        "authorizedInstallCert": authorizedInstallCert,
        "authorizedInstallQCert": authorizedInstallQCert,
        "applyAmendments": applyAmendments,
        "autoSettings": autoSettings,
        "readingBuffer": readingBuffer,
        "onlineTAToSignDataType": onlineTAToSignDataType,
        "defaultReadingBufferSize": defaultReadingBufferSize,
        "signManagementAction": signManagementAction?.value,
        "profilerType": profilerType?.value,
        "authProcType": authProcType?.value,
        "baseSMProcedure": baseSMProcedure?.value,
        "pacePasswordType": pacePasswordType?.value,
        "terminalType": terminalType?.value,
        "password": password,
        "pkdPA": pkdPA,
        "pkdEAC": pkdEAC,
        "mrz": mrz,
        "eSignPINDefault": eSignPINDefault,
        "eSignPINNewValue": eSignPINNewValue,
        "reprocessParams": reprocessParams?.toJson(),
        "eDLDataGroups": eDLDataGroups.toJson(),
        "ePassportDataGroups": ePassportDataGroups.toJson(),
        "eIDDataGroups": eIDDataGroups.toJson(),
      };

  static _setRfidScenario(
    Map<String, dynamic> json,
    RFIDScenario instance,
  ) {
    if (identical(instance, DocumentReader.instance.rfidScenario))
      _bridge.invokeMethod("setRfidScenario", [json]);
  }

  Future<void> _sync() async {
    String response = await _bridge.invokeMethod("getRfidScenario", []);
    this.fromJson(_decode(response));
  }

  _apply() => _setRfidScenario(this.toJson(), this);
}

enum RFIDAuthenticationProcedureType {
  /// Not defined.
  UNDEFINED(0),

  /// Standard authentication procedure.
  STANDARD(1),

  /// Advanced authentication procedure.
  ADVANCED(2),

  /// General authentication procedure.
  GENERAL(3);

  const RFIDAuthenticationProcedureType(this.value);
  final int value;

  static RFIDAuthenticationProcedureType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDAuthenticationProcedureType.values
          .firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDAuthenticationProcedureType.UNDEFINED;
    }
  }
}

enum RFIDPasswordType {
  /// Unknown type.
  UNDEFINED(0),

  /// MRZ.
  MRZ(1),

  /// CAN.
  CAN(2),

  /// PIN.
  PIN(3),

  /// PUK.
  PUK(4),

  /// eSign-PIN.
  PIN_ESIGN(5),

  /// Scanning Area Identifier (for eDL application).
  SAI(6);

  const RFIDPasswordType(this.value);
  final int value;

  static RFIDPasswordType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDPasswordType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDPasswordType.UNDEFINED;
    }
  }
}

enum RFIDSDKProfilerType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Doc 9303, 6th edition, 2006.
  DOC_9303_EDITION_2006(0x00000001),

  /// LDS and PKI Maintenance, v2.0, May 21, 2014.
  DOC_9303_LDS_PKI_MAINTENANCE(0x00000002);

  const RFIDSDKProfilerType(this.value);
  final int value;

  static RFIDSDKProfilerType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDSDKProfilerType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDSDKProfilerType.UNKNOWN;
    }
  }
}

enum RFIDTerminalType {
  /// Not defined.
  UNDEFINED(0),

  /// Inspection system.
  INSPECTION_SYSTEM(1),

  /// Authentication terminal
  AUTHENTICATION_TERMINAL(2),

  /// Signature terminal.
  SIGNATURE_TERMINAL(3),

  /// Unauthenticated terminal.
  UNAUTHENTICATED_TERMINAL(4);

  const RFIDTerminalType(this.value);
  final int value;

  static RFIDTerminalType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return RFIDTerminalType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return RFIDTerminalType.UNDEFINED;
    }
  }
}

enum SignManagementAction {
  /// Not identified.
  UNDEFINED(0),

  /// Create PIN.
  CREATE_PIN(1),

  /// Change PIN.
  CHANGE_PIN(2),

  /// Unblock PIN
  UNBLOCK_PIN(3),

  /// Terminate PIN.
  TERMINATE_PIN(4),

  /// Generate keys.
  GENERATE_KEYS(5),

  /// Terminate keys.
  TERMINATE_KEYS(6),

  /// Sign data.
  SIGN_DATA(7);

  const SignManagementAction(this.value);
  final int value;

  static SignManagementAction? getByValue(int? i) {
    if (i == null) return null;
    try {
      return SignManagementAction.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return SignManagementAction.UNDEFINED;
    }
  }
}
