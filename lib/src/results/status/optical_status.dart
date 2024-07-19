//
//  OpticalStatus.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

/// Container for an optical related scanning statuses.
class OpticalStatus {
  /// Summary of all optical results.
  CheckResult get overallStatus => _overallStatus;
  late CheckResult _overallStatus;

  /// MRZ verification: values validity, dates, checkdigits verification.
  CheckResult get mrz => _mrz;
  late CheckResult _mrz;

  /// Text fields valitity: values validity for specific fields, cross-comparison
  /// of values from different sources, dates & checkdigits verification.
  CheckResult get text => _text;
  late CheckResult _text;

  /// Check status if document type was recognized or not.
  CheckResult get docType => _docType;
  late CheckResult _docType;

  /// Authenticity verification status.
  CheckResult get security => _security;
  late CheckResult _security;

  /// Input images quality verification status.
  CheckResult get imageQA => _imageQA;
  late CheckResult _imageQA;

  /// Document validity period verification status.
  CheckResult get expiry => _expiry;
  late CheckResult _expiry;

  /// Visible Digital Seal verification status.
  CheckResult get vds => _vds;
  late CheckResult _vds;

  /// Number of scanned document pages.
  int get pagesCount => _pagesCount;
  late int _pagesCount;

  /// Allows you to deserialize object.
  static OpticalStatus? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = OpticalStatus();

    result._overallStatus =
        CheckResult.getByValue(jsonObject["overallStatus"])!;
    result._mrz = CheckResult.getByValue(jsonObject["mrz"])!;
    result._text = CheckResult.getByValue(jsonObject["text"])!;
    result._docType = CheckResult.getByValue(jsonObject["docType"])!;
    result._security = CheckResult.getByValue(jsonObject["security"])!;
    result._imageQA = CheckResult.getByValue(jsonObject["imageQA"])!;
    result._expiry = CheckResult.getByValue(jsonObject["expiry"])!;
    result._vds = CheckResult.getByValue(jsonObject["vds"])!;
    result._pagesCount = jsonObject["pagesCount"]!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "overallStatus": overallStatus.value,
        "mrz": mrz.value,
        "text": text.value,
        "docType": docType.value,
        "security": security.value,
        "imageQA": imageQA.value,
        "expiry": expiry.value,
        "vds": vds.value,
        "pagesCount": pagesCount,
      }.clearNulls();
}
