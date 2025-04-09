//
//  rfid_custom_ui.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';
import 'package:flutter_document_reader_api_example/main.dart';

class RFIDCustomUI {
  var documentReader = DocumentReader.instance;
  late MyAppState main;

  var isShowing = false;
  var rfidUIHeader = "Reading RFID";
  var rfidUIHeaderColor = Colors.black;
  var rfidDescription = "Place your phone on top of the NFC tag";
  double rfidProgress = -1;

  init(MyAppState main) {
    this.main = main;
  }

  void run() {
    showRfidUI();

    RFIDConfig config = RFIDConfig.withoutUI((action, results, error) {
      if (error != null) print(error.message);
      if (action.stopped()) finish(results);
    });

    config.onProgress = (notification) async {
      if (notification.progress == 1) return;
      if (notification.notificationCode ==
          RFIDNotificationCodes.PCSC_READING_DATAGROUP) {
        var translation = await notification.dataFileType.getTranslation();
        main.setState(() => rfidDescription = translation);
      }

      main.setState(() {
        rfidUIHeader = "Reading RFID";
        rfidUIHeaderColor = Colors.black;
        rfidProgress = notification.progress / 100;
      });

      if (Platform.isIOS) {
        var status = rfidDescription + "\n";
        var progress = notification.progress;
        if (progress > 0 && progress < 100) {
          status += notification.progress.toString() + "%";
        }
        documentReader.rfidSessionStatus = status;
      }
    };

    documentReader.rfid(config);
  }

  void showRfidUI() {
    main.setStatus("");
    main.setState(() => isShowing = true);
  }

  void finish(Results? results) {
    documentReader.stopRFIDReader();
    main.setState(() {
      isShowing = false;
      rfidUIHeader = "Reading RFID";
      rfidUIHeaderColor = Colors.black;
      rfidDescription = "Place your phone on top of the NFC tag";
      rfidProgress = -1;
    });
    main.displayResults(results);
  }

  Widget build() {
    return Visibility(
      visible: isShowing,
      child: Container(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center),
            header(),
            description(),
            progressBar(),
            cancelButton(),
            spacer(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Text(
        rfidUIHeader,
        textScaler: TextScaler.linear(1.75),
        style: TextStyle(color: rfidUIHeaderColor),
      ),
    );
  }

  Widget description() {
    return Container(
      child: Text(rfidDescription, textScaler: TextScaler.linear(1.4)),
      padding: const EdgeInsets.only(bottom: 40),
    );
  }

  Widget progressBar() {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: LinearProgressIndicator(
        value: rfidProgress,
        minHeight: 10,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4285F4)),
      ),
    );
  }

  Widget cancelButton() {
    return TextButton(
      onPressed: () => finish(null),
      child: const Text("X"),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(top: 50)),
    );
  }

  Widget spacer() {
    return Column(
      children: <Widget>[
        Text(""),
        Text(""),
        Text(""),
        Text(""),
        Text(""),
        Text(""),
        Text(""),
      ],
    );
  }
}
