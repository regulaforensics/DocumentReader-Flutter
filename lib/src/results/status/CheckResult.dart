//
//  CheckResult.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

enum CheckResult {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Check was not passed, the controlled parameter is not permitted.
  ERROR(0),

  /// Check was passed, the controlled parameter is permitted.
  OK(1),

  /// Check was not carried out.
  WAS_NOT_DONE(2);

  const CheckResult(this.value);
  final int value;

  static CheckResult? getByValue(int? i) {
    if (i == null) return null;
    try {
      return CheckResult.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return CheckResult.UNKNOWN;
    }
  }
}
