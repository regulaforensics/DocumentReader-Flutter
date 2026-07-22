part of "../../flutter_document_reader_api.dart";

class DocumentRequest18013MDL extends DocumentRequestMDL {
  DocumentRequest18013MDL() : super("org.iso.18013.5.1.mDL");

  MDLIntentToRetain? familyName;
  MDLIntentToRetain? givenName;
  MDLIntentToRetain? birthDate;
  MDLIntentToRetain? issueDate;
  MDLIntentToRetain? expiryDate;
  MDLIntentToRetain? issuingCountry;
  MDLIntentToRetain? issuingAuthority;
  MDLIntentToRetain? documentNumber;
  MDLIntentToRetain? portrait;
  MDLIntentToRetain? drivingPrivileges;
  MDLIntentToRetain? unDistinguishingSign;
  MDLIntentToRetain? administrativeNumber;
  MDLIntentToRetain? sex;
  MDLIntentToRetain? height;
  MDLIntentToRetain? weight;
  MDLIntentToRetain? eyeColour;
  MDLIntentToRetain? hairColour;
  MDLIntentToRetain? birthPlace;
  MDLIntentToRetain? residentAddress;
  MDLIntentToRetain? portraitCaptureDate;
  MDLIntentToRetain? ageInYears;
  MDLIntentToRetain? ageBirthYear;
  MDLIntentToRetain? ageOver18;
  MDLIntentToRetain? issuingJurisdiction;
  MDLIntentToRetain? nationality;
  MDLIntentToRetain? residentCity;
  MDLIntentToRetain? residentState;
  MDLIntentToRetain? residentPostalCode;
  MDLIntentToRetain? residentCountry;
  MDLIntentToRetain? biometricTemplateFace;
  MDLIntentToRetain? biometricTemplateIris;
  MDLIntentToRetain? biometricTemplateFinger;
  MDLIntentToRetain? biometricTemplateSignatureSign;
  MDLIntentToRetain? familyNameNationalCharacter;
  MDLIntentToRetain? givenNameNationalCharacter;
  MDLIntentToRetain? signatureUsualMark;

  disableIntentToRetainValues() {
    _setAll(MDLIntentToRetain.FALSE);
  }

  enableIntentToRetainValues() {
    _setAll(MDLIntentToRetain.TRUE);
  }

  _setAll(MDLIntentToRetain? value) {
    familyName = value;
    givenName = value;
    birthDate = value;
    issueDate = value;
    expiryDate = value;
    issuingCountry = value;
    issuingAuthority = value;
    documentNumber = value;
    portrait = value;
    drivingPrivileges = value;
    unDistinguishingSign = value;
    administrativeNumber = value;
    sex = value;
    height = value;
    weight = value;
    eyeColour = value;
    hairColour = value;
    birthPlace = value;
    residentAddress = value;
    portraitCaptureDate = value;
    ageInYears = value;
    ageBirthYear = value;
    ageOver18 = value;
    issuingJurisdiction = value;
    nationality = value;
    residentCity = value;
    residentState = value;
    residentPostalCode = value;
    residentCountry = value;
    biometricTemplateFace = value;
    biometricTemplateIris = value;
    biometricTemplateFinger = value;
    biometricTemplateSignatureSign = value;
    familyNameNationalCharacter = value;
    givenNameNationalCharacter = value;
    signatureUsualMark = value;
  }

  /// Allows you to deserialize object.
  static DocumentRequest18013MDL? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocumentRequest18013MDL();

    result._namespaces = (jsonObject["namespaces"] as List)
        .map((item) => NameSpaceMDL.fromJson(item)!)
        .toList();
    result.familyName = MDLIntentToRetain.getByValue(jsonObject["familyName"]);
    result.givenName = MDLIntentToRetain.getByValue(jsonObject["givenName"]);
    result.birthDate = MDLIntentToRetain.getByValue(jsonObject["birthDate"]);
    result.issueDate = MDLIntentToRetain.getByValue(jsonObject["issueDate"]);
    result.expiryDate = MDLIntentToRetain.getByValue(jsonObject["expiryDate"]);
    result.issuingCountry =
        MDLIntentToRetain.getByValue(jsonObject["issuingCountry"]);
    result.issuingAuthority =
        MDLIntentToRetain.getByValue(jsonObject["issuingAuthority"]);
    result.documentNumber =
        MDLIntentToRetain.getByValue(jsonObject["documentNumber"]);
    result.portrait = MDLIntentToRetain.getByValue(jsonObject["portrait"]);
    result.drivingPrivileges =
        MDLIntentToRetain.getByValue(jsonObject["drivingPrivileges"]);
    result.unDistinguishingSign =
        MDLIntentToRetain.getByValue(jsonObject["unDistinguishingSign"]);
    result.administrativeNumber =
        MDLIntentToRetain.getByValue(jsonObject["administrativeNumber"]);
    result.sex = MDLIntentToRetain.getByValue(jsonObject["sex"]);
    result.height = MDLIntentToRetain.getByValue(jsonObject["height"]);
    result.weight = MDLIntentToRetain.getByValue(jsonObject["weight"]);
    result.eyeColour = MDLIntentToRetain.getByValue(jsonObject["eyeColour"]);
    result.hairColour = MDLIntentToRetain.getByValue(jsonObject["hairColour"]);
    result.birthPlace = MDLIntentToRetain.getByValue(jsonObject["birthPlace"]);
    result.residentAddress =
        MDLIntentToRetain.getByValue(jsonObject["residentAddress"]);
    result.portraitCaptureDate =
        MDLIntentToRetain.getByValue(jsonObject["portraitCaptureDate"]);
    result.ageInYears = MDLIntentToRetain.getByValue(jsonObject["ageInYears"]);
    result.ageBirthYear =
        MDLIntentToRetain.getByValue(jsonObject["ageBirthYear"]);
    result.ageOver18 = MDLIntentToRetain.getByValue(jsonObject["ageOver18"]);
    result.issuingJurisdiction =
        MDLIntentToRetain.getByValue(jsonObject["issuingJurisdiction"]);
    result.nationality =
        MDLIntentToRetain.getByValue(jsonObject["nationality"]);
    result.residentCity =
        MDLIntentToRetain.getByValue(jsonObject["residentCity"]);
    result.residentState =
        MDLIntentToRetain.getByValue(jsonObject["residentState"]);
    result.residentPostalCode =
        MDLIntentToRetain.getByValue(jsonObject["residentPostalCode"]);
    result.residentCountry =
        MDLIntentToRetain.getByValue(jsonObject["residentCountry"]);
    result.biometricTemplateFace =
        MDLIntentToRetain.getByValue(jsonObject["biometricTemplateFace"]);
    result.biometricTemplateIris =
        MDLIntentToRetain.getByValue(jsonObject["biometricTemplateIris"]);
    result.biometricTemplateFinger =
        MDLIntentToRetain.getByValue(jsonObject["biometricTemplateFinger"]);
    result.biometricTemplateSignatureSign = MDLIntentToRetain.getByValue(
        jsonObject["biometricTemplateSignatureSign"]);
    result.familyNameNationalCharacter =
        MDLIntentToRetain.getByValue(jsonObject["familyNameNationalCharacter"]);
    result.givenNameNationalCharacter =
        MDLIntentToRetain.getByValue(jsonObject["givenNameNationalCharacter"]);
    result.signatureUsualMark =
        MDLIntentToRetain.getByValue(jsonObject["signatureUsualMark"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "docType": _docType,
        "namespaces": _namespaces.map((item) => item.toJson()).toList(),
        "familyName": familyName?.value,
        "givenName": givenName?.value,
        "birthDate": birthDate?.value,
        "issueDate": issueDate?.value,
        "expiryDate": expiryDate?.value,
        "issuingCountry": issuingCountry?.value,
        "issuingAuthority": issuingAuthority?.value,
        "documentNumber": documentNumber?.value,
        "portrait": portrait?.value,
        "drivingPrivileges": drivingPrivileges?.value,
        "unDistinguishingSign": unDistinguishingSign?.value,
        "administrativeNumber": administrativeNumber?.value,
        "sex": sex?.value,
        "height": height?.value,
        "weight": weight?.value,
        "eyeColour": eyeColour?.value,
        "hairColour": hairColour?.value,
        "birthPlace": birthPlace?.value,
        "residentAddress": residentAddress?.value,
        "portraitCaptureDate": portraitCaptureDate?.value,
        "ageInYears": ageInYears?.value,
        "ageBirthYear": ageBirthYear?.value,
        "ageOver18": ageOver18?.value,
        "issuingJurisdiction": issuingJurisdiction?.value,
        "nationality": nationality?.value,
        "residentCity": residentCity?.value,
        "residentState": residentState?.value,
        "residentPostalCode": residentPostalCode?.value,
        "residentCountry": residentCountry?.value,
        "biometricTemplateFace": biometricTemplateFace?.value,
        "biometricTemplateIris": biometricTemplateIris?.value,
        "biometricTemplateFinger": biometricTemplateFinger?.value,
        "biometricTemplateSignatureSign": biometricTemplateSignatureSign?.value,
        "familyNameNationalCharacter": familyNameNationalCharacter?.value,
        "givenNameNationalCharacter": givenNameNationalCharacter?.value,
        "signatureUsualMark": signatureUsualMark?.value,
      }.clearNulls();
}
