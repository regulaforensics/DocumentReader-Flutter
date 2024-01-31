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

ByteData? _fromBase64(String? value) =>
    value == null ? null : ByteData.view(base64Decode(value).buffer);

String? _toBase64(ByteData? value) =>
    value == null ? null : base64Encode(value.buffer.asUint8List());

Image? _imageFromBase64(String? value) =>
    value == null ? null : Image.memory(base64Decode(value));

String? _imageToBase64(Image? value) =>
    value == null ? null : base64Encode((value.image as MemoryImage).bytes);

Color? _intToColor(int? value) => value == null ? null : Color(value);

int? _intFromColor(Color? value) => value?.value;

extension _NullSafety on List {
  void addSafe<E>(E value) {
    if (value != null) add(value);
  }
}

extension _ClearNulls on Map<String, dynamic> {
  Map<String, dynamic> clearNulls() {
    Map<String, dynamic> result = {};
    forEach((key, value) {
      if (value != null) result[key] = value;
    });
    return result;
  }
}
