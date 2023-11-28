//
//  TAChallenge.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class TAChallenge {
  Uint8List get data => _data;
  late Uint8List _data;

  String? get auxPCD => _auxPCD;
  String? _auxPCD;

  String? get challengePICC => _challengePICC;
  String? _challengePICC;

  String? get hashPK => _hashPK;
  String? _hashPK;

  String? get idPICC => _idPICC;
  String? _idPICC;

  @visibleForTesting
  static TAChallenge? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new TAChallenge();

    result._data = base64Decode(jsonObject["data"]);
    result._auxPCD = jsonObject["auxPCD"];
    result._challengePICC = jsonObject["challengePICC"];
    result._hashPK = jsonObject["hashPK"];
    result._idPICC = jsonObject["idPICC"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "data": base64Encode(data),
        "auxPCD": auxPCD,
        "challengePICC": challengePICC,
        "hashPK": hashPK,
        "idPICC": idPICC,
      };
}
