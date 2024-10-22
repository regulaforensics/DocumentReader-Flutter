//
//  FaceApiSearchParams.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../../flutter_document_reader_api.dart";

class FaceApiSearchParams {
  /// The number of returned Persons limit.
  int get limit => _limit;
  int _limit;

  /// The similarity distance threshold, should be between 0.0 and 2.0,
  /// where 0.0 is for returning results for only the most similar persons
  /// and 2.0 is for all the persons, even the dissimilar ones.
  /// If not set, the default 1.0 value is used.
  double get threshold => _threshold;
  double _threshold;

  /// The IDs of the groups in which the search is performed.
  List<int>? get groupIds => _groupIds;
  List<int>? _groupIds;

  FaceApiSearchParams({
    int limit = 100,
    double threshold = 1,
    List<int>? groupIds,
  })  : _limit = limit,
        _threshold = threshold,
        _groupIds = groupIds;

  /// Allows you to deserialize object.
  static FaceApiSearchParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return FaceApiSearchParams(
      limit: jsonObject["limit"],
      threshold: _toDouble(jsonObject["threshold"])!,
      groupIds: jsonObject["groupIds"] == null
          ? null
          : List<int>.from(jsonObject["groupIds"]),
    );
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "limit": limit,
        "threshold": threshold,
        "groupIds": groupIds,
      }.clearNulls();
}
