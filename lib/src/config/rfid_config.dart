//
//  RFIDConfig.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

/// A configuration file for the RFID chip processing.
class RFIDConfig {
  DocumentReaderCompletion? _completion;
  RFIDCompletion? _rfidCompletion;
  bool _disableUI = false;

  /// Callback for reveiving notification about RFID reading process.
  RFIDProgressCompletion? onProgress;

  /// Callback for receiving signal when RFID chip is recognized
  /// by a phone and chip reading is started.
  ///
  /// Only used with default constructor. If [RFIDConfig.withoutUI] was used,
  /// you will receive this update via [DocumentReaderCompletion].
  ChipDetectedCompletion? onChipDetected;

  /// Fires when RFID chip reading was interrupted with no severe reasons
  /// (for example connection to the chip was lost) and will be reestablished automatically.
  ///
  /// Only used with default constructor. If [RFIDConfig.withoutUI] was used,
  /// you will receive this update via [DocumentReaderCompletion]
  /// and chip reading will not be reestablished.
  RetryReadChipCompletion? onRetryReadChip;

  /// Callback for receiving RFID request data
  PaCertificateCompletion? onRequestPACertificates;

  /// Callback for receiving RFID request data
  TaCertificateCompletion? onRequestTACertificates;

  /// Callback for receiving RFID request data
  TaSignatureCompletion? onRequestTASignature;

  /// Regular RFID chip reading.
  ///
  /// [completion] - block to execute after the chip reading process finishes.
  RFIDConfig(DocumentReaderCompletion completion) : _completion = completion;

  /// RFID chip reading with no UI.
  ///
  /// User is supposed to implement the UI.
  ///
  /// Since this constructor accepts [RFIDCompletion]
  /// instead of [DocumentReaderCompletion], user will be provided
  /// with more in-depth error information.
  ///
  /// [completion] - block to execute after the chip reading process finishes.
  RFIDConfig.withoutUI(RFIDCompletion completion)
    : _rfidCompletion = completion,
      _disableUI = true;
}

/// Callback for receiving answer from processing engine.
///
/// [action] defines current processing status.
///
/// [results] defines current processing results.
///
/// [error] in case of anything is wrong - brief message for developer, `null` otherwise.
typedef RFIDCompletion =
    void Function(
      DocReaderAction action,
      Results? results,
      RFIDException? error,
    );

/// Completion for reveiving notification about RFID reading process.
typedef RFIDProgressCompletion = void Function(RFIDNotification notification);

/// Callback for receiving signal when RFID chip is recognized
/// by a phone and chip reading is started.
///
/// Only used with default constructor. If [RFIDConfig.withoutUI] was used,
/// you will receive this update via [DocumentReaderCompletion].
typedef ChipDetectedCompletion = void Function();

/// Fires when RFID chip reading was interrupted with no severe reasons
/// (for example connection to the chip was lost) and will be reestablished automatically.
///
/// Only used with default constructor. If [RFIDConfig.withoutUI] was used,
/// you will receive this update via [DocumentReaderCompletion]
/// and chip reading will not be reestablished.
///
/// [error] a brief message for developer.
typedef RetryReadChipCompletion = void Function(RFIDException error);

/// Callback for receiving RFID request data
typedef PaCertificateCompletion =
    void Function(
      Uint8List serialNumber,
      PAResourcesIssuer? issuer,
      PKDCertificateRequest request,
    );

/// Callback for receiving RFID request data
typedef TaCertificateCompletion =
    void Function(String? keyCAR, PKDCertificateRequest request);

/// Provided to a user for passing PKDCertificates
/// to the native part of DocumentReader.
typedef PKDCertificateRequest =
    Future<void> Function(List<PKDCertificate>? certificates);

/// Callback for receiving RFID request data
typedef TaSignatureCompletion =
    void Function(TAChallenge? challenge, TASignatureRequest request);

/// Provided to a user for passing TASignature
/// to the native part of DocumentReader.
typedef TASignatureRequest = Future<void> Function(ByteData? signature);
