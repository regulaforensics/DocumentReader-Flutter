//
//  FaceApiSearchParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

class FaceApiSearchParams {
  /// The number of returned Persons limit.
  int limit = 100;

  /// The similarity distance threshold, should be between 0.0 and 2.0,
  /// where 0.0 is for returning results for only the most similar persons
  /// and 2.0 is for all the persons, even the dissimilar ones.
  /// If not set, the default 1.0 value is used.
  double threshold = 1;

  /// The IDs of the groups in which the search is performed.
  List<int>? groupIds;

  /// Allows you to deserialize object.
  static FaceApiSearchParams? fromJson(jsonObject) {
    var result = new FaceApiSearchParams();
    if (jsonObject == null) return null;

    result.limit = jsonObject["limit"];
    result.threshold = _toDouble(jsonObject["threshold"])!;
    result.groupIds = jsonObject["groupIds"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    result["limit"] = limit;
    result["threshold"] = threshold;
    if (groupIds != null) result["groupIds"] = groupIds;

    return result;
  }
}
