part of "../../../flutter_document_reader_api.dart";

/// Visible Digital Seal.
class VDSData {
  int? get type => _type;
  late int? _type;

  int? get docType => _docType;
  late int? _docType;

  int? get featureRef => _featureRef;
  late int? _featureRef;

  /// Visible Digital Seal use case version.
  int? get version => _version;
  late int? _version;

  /// Three letter code identifying the issuing state or organization.
  String? get issuingCountry => _issuingCountry;
  String? _issuingCountry;

  String? get docIssueDate => _docIssueDate;
  String? _docIssueDate;

  /// The binary data of the verified digital signature.
  BytesData? get signature => _signature;
  BytesData? _signature;

  String? get signatureDate => _signatureDate;
  String? _signatureDate;

  String? get signer => _signer;
  String? _signer;

  String? get certificate => _certificate;
  String? _certificate;

  /// The certificate chain, used for the digital signature verification.
  List<CertificateChain> get certificateChain => _certificateChain;
  List<CertificateChain> _certificateChain = [];

  /// The doc features.
  List<DocFeature> get docFeatures => _docFeatures;
  List<DocFeature> _docFeatures = [];

  /// The list of remarks occured during the scanning procedure.
  ///
  /// Each element belongs to the [LDSParsingErrorCodes] or the [LDSParsingNotificationCodes].
  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  /// Allows you to deserialize object.
  static VDSData? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = VDSData();

    result._type = jsonObject["type"];
    result._docType = jsonObject["docType"];
    result._featureRef = jsonObject["featureRef"];
    result._version = jsonObject["version"];
    result._issuingCountry = jsonObject["issuingCountry"];
    result._docIssueDate = jsonObject["docIssueDate"];
    result._signature = BytesData.fromJson(jsonObject["signature"]);
    result._signatureDate = jsonObject["signatureDate"];
    result._signer = jsonObject["signer"];
    result._certificate = jsonObject["certificate"];
    for (var item in jsonObject["certificateChain"]) {
      result._certificateChain.addSafe(CertificateChain.fromJson(item));
    }
    for (var item in jsonObject["docFeatures"]) {
      result._docFeatures.addSafe(DocFeature.fromJson(item));
    }
    result._notifications = _intListFrom(jsonObject["notifications"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "type": type,
        "docType": docType,
        "featureRef": featureRef,
        "version": version,
        "issuingCountry": issuingCountry,
        "docIssueDate": docIssueDate,
        "signature": signature?.toJson(),
        "signatureDate": signatureDate,
        "signer": signer,
        "certificate": certificate,
        "certificateChain": certificateChain.map((e) => e.toJson()).toList(),
        "docFeatures": docFeatures.map((e) => e.toJson()).toList(),
        "notifications": notifications,
      }.clearNulls();
}
