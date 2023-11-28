//
//  CertificateChain.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class CertificateChain {
  /// Define the type of certificate used in the procedure of document
  /// security object digital signature verification.
  RFIDCertificateType get type => _type;
  late RFIDCertificateType _type;

  List<Extension> get extensions => _extensions;
  List<Extension> _extensions = [];

  RFIDValue? get fileName => _fileName;
  RFIDValue? _fileName;

  Authority? get issuer => _issuer;
  Authority? _issuer;

  List<int> get notifications => _notifications;
  List<int> _notifications = [];

  int get origin => _origin;
  late int _origin;

  int get paStatus => _paStatus;
  late int _paStatus;

  String? get serialNumber => _serialNumber;
  String? _serialNumber;

  String? get signatureAlgorithm => _signatureAlgorithm;
  String? _signatureAlgorithm;

  Authority? get subject => _subject;
  Authority? _subject;

  String? get subjectPKAlgorithm => _subjectPKAlgorithm;
  String? _subjectPKAlgorithm;

  RFIDValidity? get validity => _validity;
  RFIDValidity? _validity;

  int get version => _version;
  late int _version;

  /// Allows you to deserialize object.
  static CertificateChain? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new CertificateChain();

    result._origin = jsonObject["origin"];
    result._type = RFIDCertificateType.getByValue(jsonObject["type"])!;
    result._version = jsonObject["version"];
    result._paStatus = jsonObject["paStatus"];
    result._serialNumber = jsonObject["serialNumber"];
    result._signatureAlgorithm = jsonObject["signatureAlgorithm"];
    result._subjectPKAlgorithm = jsonObject["subjectPKAlgorithm"];
    result._fileName = RFIDValue.fromJson(jsonObject["fileName"]);
    result._validity = RFIDValidity.fromJson(jsonObject["validity"]);
    result._issuer = Authority.fromJson(jsonObject["issuer"]);
    result._subject = Authority.fromJson(jsonObject["subject"]);
    result._notifications = jsonObject["notifications"].cast<int>();
    for (var item in jsonObject["extensions"])
      result._extensions.addSafe(Extension.fromJson(item));

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["type"] = type.value;
    List<dynamic> list = [];
    for (var item in extensions) list.add(item.toJson());
    result["extensions"] = list;
    result["fileName"] = fileName?.toJson();
    result["issuer"] = issuer?.toJson();
    result["notifications"] = notifications;
    result["origin"] = origin;
    result["paStatus"] = paStatus;
    result["serialNumber"] = serialNumber;
    result["signatureAlgorithm"] = signatureAlgorithm;
    result["subject"] = subject?.toJson();
    result["subjectPKAlgorithm"] = subjectPKAlgorithm;
    result["validity"] = validity?.toJson();
    result["version"] = version;

    return result;
  }
}
