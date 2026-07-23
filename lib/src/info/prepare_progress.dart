//
//  DocReaderVersion.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 15.04.2024.
//  Copyright © 2024 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// Class contains info about database preparation progress.
class PrepareProgress {
  int get downloadedBytes => _downloadedBytes;
  int _downloadedBytes;

  int get totalBytes => _totalBytes;
  int _totalBytes;

  int get progress => _progress;
  int _progress;

  PrepareProgress(int downloadedBytes, int totalBytes, int progress)
      : _downloadedBytes = downloadedBytes,
        _totalBytes = totalBytes,
        _progress = progress;

  @visibleForTesting
  static PrepareProgress? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return PrepareProgress(
      jsonObject["downloadedBytes"],
      jsonObject["totalBytes"],
      jsonObject["progress"],
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "downloadedBytes": downloadedBytes,
        "totalBytes": totalBytes,
        "progress": progress,
      }.clearNulls();
}

/// Callback for receiving notifications on Documents Database preparation.
typedef DocumentReaderPrepareCompletion = void Function(
    PrepareProgress progress);
