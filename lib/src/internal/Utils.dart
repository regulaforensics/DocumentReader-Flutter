//
//  Utils.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

double? _toDouble(value) => value?.toDouble();

dynamic _decode(String? value) => value == null ? null : jsonDecode(value);

Uint8List? _fromBase64(String? value) =>
    value == null ? null : base64Decode(value);

String? _toBase64(Uint8List? value) =>
    value == null ? null : base64Encode(value);

Color? _intToColor(int? value) => value == null ? null : Color(value);

int? _intFromColor(Color? value) => value?.value;

extension _NullSafety on List {
  void addSafe<E>(E value) {
    if (value != null) add(value);
  }
}
