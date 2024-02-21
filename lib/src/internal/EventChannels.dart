//
//  EventChannels.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

// DocumentReaderCompletion and RFIDCompletion use the same eventChannel so
// they need to have sommon eventChannel function.
// Because of they way it is implemented, one of the _documentReaderCompletion
// and _rfidCompletion always has to be null, to when setting one completion,
// we have to set the other one to null.
DocumentReaderCompletion? _documentReaderCompletion;
void _setDocumentReaderCompletion(DocumentReaderCompletion completion) {
  _documentReaderCompletion = completion;
  _rfidCompletion = null;

  _eventChannel('completion', (msg) {
    var jsonObject = json.decode(msg);
    var action = DocReaderAction.getByValue(jsonObject["action"])!;
    var results = Results.fromJson(jsonObject["results"]);
    var error = DocReaderException.fromJson(jsonObject["error"]);
    var rfidError = RFIDException.fromJson(jsonObject["error"]);

    // We need ELSE instead of 2 ifs besause if _documentReaderCompletion?.call
    // will run rfid, then it will run _setRFIDCompletion, and only after that
    // it will check if _rfidCompletion is null, so it will run instantly
    // both _documentReaderCompletion and _rfidCompletion
    // with the same parameters.
    if (_documentReaderCompletion != null)
      _documentReaderCompletion!(action, results, error);
    else
      _rfidCompletion!(action, results, rfidError);
  });
}

RFIDCompletion? _rfidCompletion;
void _setRFIDCompletion(RFIDCompletion rfidCompletion) {
  _documentReaderCompletion = null;
  _rfidCompletion = rfidCompletion;
}

late DocumentReaderPrepareCompletion _documentReaderPrepareCompletion;
void _setDocumentReaderPrepareCompletion(
    DocumentReaderPrepareCompletion completion) {
  _documentReaderPrepareCompletion = completion;
  _eventChannel('database_progress', (msg) {
    _documentReaderPrepareCompletion(msg);
  });
}

late BluetoothServiceCompletion _bluetoothServiceCompletion;
void _setBluetoothServiceCompletion(BluetoothServiceCompletion completion) {
  _bluetoothServiceCompletion = completion;
  _eventChannel('bleOnServiceConnectedEvent',
      (msg) => _bluetoothServiceCompletion.onServiceConnected(msg));
  _eventChannel('bleOnServiceDisconnectedEvent',
      (_) => _bluetoothServiceCompletion.onServiceDisconnected());
  _eventChannel('bleOnDeviceReadyEvent',
      (_) => _bluetoothServiceCompletion.onDeviceReady());
}

late CustomButtonTappedCompletion _customButtonTappedCompletion;
void _setCustomButtonTappedCompletion(CustomButtonTappedCompletion completion) {
  _customButtonTappedCompletion = completion;
  _eventChannel(
      'onCustomButtonTappedEvent', (msg) => _customButtonTappedCompletion(msg));
}

late VideoEncoderCompletion _videoEncoderCompletion;
void _setVideoEncoderCompletion(VideoEncoderCompletion completion) {
  _videoEncoderCompletion = completion;
  _eventChannel(
      'video_encoder_completion', (msg) => _videoEncoderCompletion(msg));
}

RFIDProgressCompletion? _rfidProgressCompletion;
void _setRFIDProgressCompletion(RFIDProgressCompletion? completion) {
  _rfidProgressCompletion = completion;
  _eventChannel('rfidOnProgressCompletion', (msg) {
    var notify = RFIDNotification.fromJson(json.decode(msg))!;
    _rfidProgressCompletion?.call(notify);
  });
}

ChipDetectedCompletion? _chipDetectedCompletion;
void _setChipDetectedCompletion(ChipDetectedCompletion? completion) {
  _chipDetectedCompletion = completion;
  _eventChannel(
      'rfidOnChipDetectedEvent', (_) => _chipDetectedCompletion?.call());
}

RetryReadChipCompletion? _retryReadChipCompletion;
void _setRetryReadChipCompletion(RetryReadChipCompletion? completion) {
  _retryReadChipCompletion = completion;
  _eventChannel('rfidOnRetryReadChipEvent', (msg) {
    var error = RFIDException.fromJson(json.decode(msg))!;
    _retryReadChipCompletion?.call(error);
  });
}

PaCertificateCompletion? _paCertificateCompletion;
void _setPaCertificateCompletion(PaCertificateCompletion? completion) {
  _paCertificateCompletion = completion;
  _eventChannel('pa_certificate_completion', (msg) {
    var jsonObject = json.decode(msg);
    var serialNumber = _bytesFromBase64(jsonObject["serialNumber"])!;
    var issuer = PAResourcesIssuer.fromJson(jsonObject["issuer"]);

    _paCertificateCompletion?.call(
      serialNumber,
      issuer,
      (certificates) async {
        await _bridge.invokeMethod(
          "providePACertificates",
          [certificates?.map((e) => e.toJson()).toList()],
        );
      },
    );
  });
}

TaCertificateCompletion? _taCertificateCompletion;
void _setTaCertificateCompletion(TaCertificateCompletion? completion) {
  _taCertificateCompletion = completion;
  _eventChannel('ta_certificate_completion', (msg) {
    _taCertificateCompletion?.call(
      msg,
      (certificates) async {
        await _bridge.invokeMethod(
          "provideTACertificates",
          [certificates?.map((e) => e.toJson()).toList()],
        );
      },
    );
  });
}

TaSignatureCompletion? _taSignatureCompletion;
void _setTaSignatureCompletion(TaSignatureCompletion? completion) {
  _taSignatureCompletion = completion;
  _eventChannel('ta_signature_completion', (msg) {
    _taSignatureCompletion?.call(TAChallenge.fromJson(json.decode(msg)),
        (signature) async {
      await _bridge
          .invokeMethod("provideTASignature", [_dataToBase64(signature)]);
    });
  });
}
