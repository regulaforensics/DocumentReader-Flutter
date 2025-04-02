//
//  RfidScenario.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Params that influence the RFID chip processing.
class RFIDScenario {
  bool? get paceStaticBinding => _paceStaticBinding;
  bool? _paceStaticBinding;
  set paceStaticBinding(bool? val) {
    _paceStaticBinding = val;
    _set({"paceStaticBinding": val});
  }

  bool? get onlineTA => _onlineTA;
  bool? _onlineTA;
  set onlineTA(bool? val) {
    _onlineTA = val;
    _set({"onlineTA": val});
  }

  bool? get writeEid => _writeEid;
  bool? _writeEid;
  set writeEid(bool? val) {
    _writeEid = val;
    _set({"writeEid": val});
  }

  bool? get universalAccessRights => _universalAccessRights;
  bool? _universalAccessRights;
  set universalAccessRights(bool? val) {
    _universalAccessRights = val;
    _set({"universalAccessRights": val});
  }

  bool? get authorizedRestrictedIdentification =>
      _authorizedRestrictedIdentification;
  bool? _authorizedRestrictedIdentification;
  set authorizedRestrictedIdentification(bool? val) {
    _authorizedRestrictedIdentification = val;
    _set({"authorizedRestrictedIdentification": val});
  }

  bool? get auxVerificationCommunityID => _auxVerificationCommunityID;
  bool? _auxVerificationCommunityID;
  set auxVerificationCommunityID(bool? val) {
    _auxVerificationCommunityID = val;
    _set({"auxVerificationCommunityID": val});
  }

  bool? get auxVerificationDateOfBirth => _auxVerificationDateOfBirth;
  bool? _auxVerificationDateOfBirth;
  set auxVerificationDateOfBirth(bool? val) {
    _auxVerificationDateOfBirth = val;
    _set({"auxVerificationDateOfBirth": val});
  }

  bool? get skipAA => _skipAA;
  bool? _skipAA;
  set skipAA(bool? val) {
    _skipAA = val;
    _set({"skipAA": val});
  }

  bool? get strictProcessing => _strictProcessing;
  bool? _strictProcessing;
  set strictProcessing(bool? val) {
    _strictProcessing = val;
    _set({"strictProcessing": val});
  }

  bool? get pkdDSCertPriority => _pkdDSCertPriority;
  bool? _pkdDSCertPriority;
  set pkdDSCertPriority(bool? val) {
    _pkdDSCertPriority = val;
    _set({"pkdDSCertPriority": val});
  }

  bool? get pkdUseExternalCSCA => _pkdUseExternalCSCA;
  bool? _pkdUseExternalCSCA;
  set pkdUseExternalCSCA(bool? val) {
    _pkdUseExternalCSCA = val;
    _set({"pkdUseExternalCSCA": val});
  }

  bool? get trustedPKD => _trustedPKD;
  bool? _trustedPKD;
  set trustedPKD(bool? val) {
    _trustedPKD = val;
    _set({"trustedPKD": val});
  }

  bool? get passiveAuth => _passiveAuth;
  bool? _passiveAuth;
  set passiveAuth(bool? val) {
    _passiveAuth = val;
    _set({"passiveAuth": val});
  }

  bool? get useSFI => _useSFI;
  bool? _useSFI;
  set useSFI(bool? val) {
    _useSFI = val;
    _set({"useSFI": val});
  }

  bool? get readEPassport => _readEPassport;
  bool? _readEPassport;
  set readEPassport(bool? val) {
    _readEPassport = val;
    _set({"readEPassport": val});
  }

  bool? get readEID => _readEID;
  bool? _readEID;
  set readEID(bool? val) {
    _readEID = val;
    _set({"readEID": val});
  }

  bool? get readEDL => _readEDL;
  bool? _readEDL;
  set readEDL(bool? val) {
    _readEDL = val;
    _set({"readEDL": val});
  }

  bool? get authorizedSTSignature => _authorizedSTSignature;
  bool? _authorizedSTSignature;
  set authorizedSTSignature(bool? val) {
    _authorizedSTSignature = val;
    _set({"authorizedSTSignature": val});
  }

  bool? get authorizedSTQSignature => _authorizedSTQSignature;
  bool? _authorizedSTQSignature;
  set authorizedSTQSignature(bool? val) {
    _authorizedSTQSignature = val;
    _set({"authorizedSTQSignature": val});
  }

  bool? get authorizedWriteDG17 => _authorizedWriteDG17;
  bool? _authorizedWriteDG17;
  set authorizedWriteDG17(bool? val) {
    _authorizedWriteDG17 = val;
    _set({"authorizedWriteDG17": val});
  }

  bool? get authorizedWriteDG18 => _authorizedWriteDG18;
  bool? _authorizedWriteDG18;
  set authorizedWriteDG18(bool? val) {
    _authorizedWriteDG18 = val;
    _set({"authorizedWriteDG18": val});
  }

  bool? get authorizedWriteDG19 => _authorizedWriteDG19;
  bool? _authorizedWriteDG19;
  set authorizedWriteDG19(bool? val) {
    _authorizedWriteDG19 = val;
    _set({"authorizedWriteDG19": val});
  }

  bool? get authorizedWriteDG20 => _authorizedWriteDG20;
  bool? _authorizedWriteDG20;
  set authorizedWriteDG20(bool? val) {
    _authorizedWriteDG20 = val;
    _set({"authorizedWriteDG20": val});
  }

  bool? get authorizedWriteDG21 => _authorizedWriteDG21;
  bool? _authorizedWriteDG21;
  set authorizedWriteDG21(bool? val) {
    _authorizedWriteDG21 = val;
    _set({"authorizedWriteDG21": val});
  }

  bool? get authorizedVerifyAge => _authorizedVerifyAge;
  bool? _authorizedVerifyAge;
  set authorizedVerifyAge(bool? val) {
    _authorizedVerifyAge = val;
    _set({"authorizedVerifyAge": val});
  }

  bool? get authorizedVerifyCommunityID => _authorizedVerifyCommunityID;
  bool? _authorizedVerifyCommunityID;
  set authorizedVerifyCommunityID(bool? val) {
    _authorizedVerifyCommunityID = val;
    _set({"authorizedVerifyCommunityID": val});
  }

  bool? get authorizedPrivilegedTerminal => _authorizedPrivilegedTerminal;
  bool? _authorizedPrivilegedTerminal;
  set authorizedPrivilegedTerminal(bool? val) {
    _authorizedPrivilegedTerminal = val;
    _set({"authorizedPrivilegedTerminal": val});
  }

  bool? get authorizedCANAllowed => _authorizedCANAllowed;
  bool? _authorizedCANAllowed;
  set authorizedCANAllowed(bool? val) {
    _authorizedCANAllowed = val;
    _set({"authorizedCANAllowed": val});
  }

  bool? get authorizedPINManagement => _authorizedPINManagement;
  bool? _authorizedPINManagement;
  set authorizedPINManagement(bool? val) {
    _authorizedPINManagement = val;
    _set({"authorizedPINManagement": val});
  }

  bool? get authorizedInstallCert => _authorizedInstallCert;
  bool? _authorizedInstallCert;
  set authorizedInstallCert(bool? val) {
    _authorizedInstallCert = val;
    _set({"authorizedInstallCert": val});
  }

  bool? get authorizedInstallQCert => _authorizedInstallQCert;
  bool? _authorizedInstallQCert;
  set authorizedInstallQCert(bool? val) {
    _authorizedInstallQCert = val;
    _set({"authorizedInstallQCert": val});
  }

  bool? get applyAmendments => _applyAmendments;
  bool? _applyAmendments;
  set applyAmendments(bool? val) {
    _applyAmendments = val;
    _set({"applyAmendments": val});
  }

  bool? get autoSettings => _autoSettings;
  bool? _autoSettings;
  set autoSettings(bool? val) {
    _autoSettings = val;
    _set({"autoSettings": val});
  }

  // If set to `true`, continue RFID chip processing, despite ICAO critical errors.
  bool? get proceedReadingAlways => _proceedReadingAlways;
  bool? _proceedReadingAlways;
  set proceedReadingAlways(bool? val) {
    _proceedReadingAlways = val;
    _set({"proceedReadingAlways": val});
  }

  bool? get readDTC => _readDTC;
  bool? _readDTC;
  set readDTC(bool? val) {
    _readDTC = val;
    _set({"readDTC": val});
  }

  /// Perform check MRZ according to standard described in
  /// BSI TR - 03105: ePassport Conformity Testing(v 1.0 04.04.2008).
  bool? get mrzStrictCheck => _mrzStrictCheck;
  bool? _mrzStrictCheck;
  set mrzStrictCheck(bool? val) {
    _mrzStrictCheck = val;
    _set({"mrzStrictCheck": val});
  }

  /// If enabled, Certificate Revoke List(s) (CRL) will be loaded from remote and verified.
  bool? get loadCRLFromRemote => _loadCRLFromRemote;
  bool? _loadCRLFromRemote;
  set loadCRLFromRemote(bool? val) {
    _loadCRLFromRemote = val;
    _set({"loadCRLFromRemote": val});
  }

  bool? get independentSODStatus => _independentSODStatus;
  bool? _independentSODStatus;
  set independentSODStatus(bool? val) {
    _independentSODStatus = val;
    _set({"independentSODStatus": val});
  }

  int? get readingBuffer => _readingBuffer;
  int? _readingBuffer;
  set readingBuffer(int? val) {
    _readingBuffer = val;
    _set({"readingBuffer": val});
  }

  int? get onlineTAToSignDataType => _onlineTAToSignDataType;
  int? _onlineTAToSignDataType;
  set onlineTAToSignDataType(int? val) {
    _onlineTAToSignDataType = val;
    _set({"onlineTAToSignDataType": val});
  }

  static final int _coreDefaultReadingBufferSize = 231;

  int get defaultReadingBufferSize => _defaultReadingBufferSize;
  int _defaultReadingBufferSize = _coreDefaultReadingBufferSize;
  set defaultReadingBufferSize(int val) {
    _defaultReadingBufferSize = val;
    _set({"defaultReadingBufferSize": val});
  }

  SignManagementAction? get signManagementAction => _signManagementAction;
  SignManagementAction? _signManagementAction;
  set signManagementAction(SignManagementAction? val) {
    _signManagementAction = val;
    _set({"signManagementAction": val?.value});
  }

  RFIDSDKProfilerType? get profilerType => _profilerType;
  RFIDSDKProfilerType? _profilerType;
  set profilerType(RFIDSDKProfilerType? val) {
    _profilerType = val;
    _set({"profilerType": val?.value});
  }

  RFIDAuthenticationProcedureType? get authProcType => _authProcType;
  RFIDAuthenticationProcedureType? _authProcType;
  set authProcType(RFIDAuthenticationProcedureType? val) {
    _authProcType = val;
    _set({"authProcType": val?.value});
  }

  RFIDAccessControlProcedureType? get baseSMProcedure => _baseSMProcedure;
  RFIDAccessControlProcedureType? _baseSMProcedure;
  set baseSMProcedure(RFIDAccessControlProcedureType? val) {
    _baseSMProcedure = val;
    _set({"baseSMProcedure": val?.value});
  }

  RFIDPasswordType? get pacePasswordType => _pacePasswordType;
  RFIDPasswordType? _pacePasswordType;
  set pacePasswordType(RFIDPasswordType? val) {
    _pacePasswordType = val;
    _set({"pacePasswordType": val?.value});
  }

  RFIDTerminalType? get terminalType => _terminalType;
  RFIDTerminalType? _terminalType;
  set terminalType(RFIDTerminalType? val) {
    _terminalType = val;
    _set({"terminalType": val?.value});
  }

  String? get password => _password;
  String? _password;
  set password(String? val) {
    _password = val;
    _set({"password": val});
  }

  String? get pkdPA => _pkdPA;
  String? _pkdPA;
  set pkdPA(String? val) {
    _pkdPA = val;
    _set({"pkdPA": val});
  }

  String? get pkdEAC => _pkdEAC;
  String? _pkdEAC;
  set pkdEAC(String? val) {
    _pkdEAC = val;
    _set({"pkdEAC": val});
  }

  String? get mrz => _mrz;
  String? _mrz;
  set mrz(String? val) {
    _mrz = val;
    _set({"mrz": val});
  }

  String? get eSignPINDefault => _eSignPINDefault;
  String? _eSignPINDefault;
  set eSignPINDefault(String? val) {
    _eSignPINDefault = val;
    _set({"eSignPINDefault": val});
  }

  String? get eSignPINNewValue => _eSignPINNewValue;
  String? _eSignPINNewValue;
  set eSignPINNewValue(String? val) {
    _eSignPINNewValue = val;
    _set({"eSignPINNewValue": val});
  }

  String? get cardAccess => _cardAccess;
  String? _cardAccess;
  set cardAccess(String? val) {
    _cardAccess = val;
    _set({"cardAccess": val});
  }

  EDLDataGroups get eDLDataGroups => _eDLDataGroups;
  EDLDataGroups _eDLDataGroups = EDLDataGroups();
  set eDLDataGroups(EDLDataGroups val) {
    (_eDLDataGroups = val)._apply(this);
  }

  EPassportDataGroups get ePassportDataGroups => _ePassportDataGroups;
  EPassportDataGroups _ePassportDataGroups = EPassportDataGroups();
  set ePassportDataGroups(EPassportDataGroups val) {
    (_ePassportDataGroups = val)._apply(this);
  }

  EIDDataGroups get eIDDataGroups => _eIDDataGroups;
  EIDDataGroups _eIDDataGroups = EIDDataGroups();
  set eIDDataGroups(EIDDataGroups val) {
    (_eIDDataGroups = val)._apply(this);
  }

  DTCDataGroup get dtcDataGroups => _dtcDataGroups;
  DTCDataGroup _dtcDataGroups = DTCDataGroup();
  set dtcDataGroups(DTCDataGroup val) {
    (_dtcDataGroups = val)._apply(this);
  }

  /// Allows you to deserialize object.
  static RFIDScenario fromJson(jsonObject) {
    var result = RFIDScenario();
    result.testSetters = {};

    result.paceStaticBinding = jsonObject["paceStaticBinding"];
    result.onlineTA = jsonObject["onlineTA"];
    result.writeEid = jsonObject["writeEid"];
    result.universalAccessRights = jsonObject["universalAccessRights"];
    result.authorizedRestrictedIdentification =
        jsonObject["authorizedRestrictedIdentification"];
    result.auxVerificationCommunityID =
        jsonObject["auxVerificationCommunityID"];
    result.auxVerificationDateOfBirth =
        jsonObject["auxVerificationDateOfBirth"];
    result.skipAA = jsonObject["skipAA"];
    result.strictProcessing = jsonObject["strictProcessing"];
    result.pkdDSCertPriority = jsonObject["pkdDSCertPriority"];
    result.pkdUseExternalCSCA = jsonObject["pkdUseExternalCSCA"];
    result.trustedPKD = jsonObject["trustedPKD"];
    result.passiveAuth = jsonObject["passiveAuth"];
    result.useSFI = jsonObject["useSFI"];
    result.readEPassport = jsonObject["readEPassport"];
    result.readEID = jsonObject["readEID"];
    result.readEDL = jsonObject["readEDL"];
    result.authorizedSTSignature = jsonObject["authorizedSTSignature"];
    result.authorizedSTQSignature = jsonObject["authorizedSTQSignature"];
    result.authorizedWriteDG17 = jsonObject["authorizedWriteDG17"];
    result.authorizedWriteDG18 = jsonObject["authorizedWriteDG18"];
    result.authorizedWriteDG19 = jsonObject["authorizedWriteDG19"];
    result.authorizedWriteDG20 = jsonObject["authorizedWriteDG20"];
    result.authorizedWriteDG21 = jsonObject["authorizedWriteDG21"];
    result.authorizedVerifyAge = jsonObject["authorizedVerifyAge"];
    result.authorizedVerifyCommunityID =
        jsonObject["authorizedVerifyCommunityID"];
    result.authorizedPrivilegedTerminal =
        jsonObject["authorizedPrivilegedTerminal"];
    result.authorizedCANAllowed = jsonObject["authorizedCANAllowed"];
    result.authorizedPINManagement = jsonObject["authorizedPINManagement"];
    result.authorizedInstallCert = jsonObject["authorizedInstallCert"];
    result.authorizedInstallQCert = jsonObject["authorizedInstallQCert"];
    result.applyAmendments = jsonObject["applyAmendments"];
    result.autoSettings = jsonObject["autoSettings"];
    result.proceedReadingAlways = jsonObject["proceedReadingAlways"];
    result.readDTC = jsonObject["readDTC"];
    result.mrzStrictCheck = jsonObject["mrzStrictCheck"];
    result.loadCRLFromRemote = jsonObject["loadCRLFromRemote"];
    result.independentSODStatus = jsonObject["independentSODStatus"];

    result.readingBuffer = jsonObject["readingBuffer"];
    result.onlineTAToSignDataType = jsonObject["onlineTAToSignDataType"];
    result.defaultReadingBufferSize = jsonObject["defaultReadingBufferSize"];
    result.signManagementAction = SignManagementAction.getByValue(
      jsonObject["signManagementAction"],
    );
    result.profilerType = RFIDSDKProfilerType.getByValue(
      jsonObject["profilerType"],
    );
    result.authProcType = RFIDAuthenticationProcedureType.getByValue(
      jsonObject["authProcType"],
    );
    result.baseSMProcedure = RFIDAccessControlProcedureType.getByValue(
      jsonObject["baseSMProcedure"],
    );
    result.pacePasswordType = RFIDPasswordType.getByValue(
      jsonObject["pacePasswordType"],
    );
    result.terminalType = RFIDTerminalType.getByValue(
      jsonObject["terminalType"],
    );

    result.password = jsonObject["password"];
    result.pkdPA = jsonObject["pkdPA"];
    result.pkdEAC = jsonObject["pkdEAC"];
    result.mrz = jsonObject["mrz"];
    result.eSignPINDefault = jsonObject["eSignPINDefault"];
    result.eSignPINNewValue = jsonObject["eSignPINNewValue"];
    result.cardAccess = jsonObject["cardAccess"];

    result.eDLDataGroups = EDLDataGroups.fromJson(jsonObject["eDLDataGroups"]);
    result.ePassportDataGroups = EPassportDataGroups.fromJson(
      jsonObject["ePassportDataGroups"],
    );
    result.eIDDataGroups = EIDDataGroups.fromJson(jsonObject["eIDDataGroups"]);
    result.dtcDataGroups = DTCDataGroup.fromJson(jsonObject["dtcDataGroups"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
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
        "proceedReadingAlways": proceedReadingAlways,
        "readDTC": readDTC,
        "mrzStrictCheck": mrzStrictCheck,
        "loadCRLFromRemote": loadCRLFromRemote,
        "independentSODStatus": independentSODStatus,
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
        "cardAccess": cardAccess,
        "eDLDataGroups": eDLDataGroups.toJson(),
        "ePassportDataGroups": ePassportDataGroups.toJson(),
        "eIDDataGroups": eIDDataGroups.toJson(),
        "dtcDataGroups": dtcDataGroups.toJson(),
      }.clearNulls();

  void _set(Map<String, dynamic> json) {
    if (identical(this, DocumentReader.instance.rfidScenario)) {
      _bridge.invokeMethod("setRfidScenario", [json]);
    }
    testSetters.addAll(json);
  }

  void _apply() => _set(toJson());

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
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
      return RFIDAuthenticationProcedureType.values.firstWhere(
        (x) => x.value == i,
      );
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
