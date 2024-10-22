//
//  bt_device.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 15.07.2024.
//  Copyright © 2024 Regula. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';
import 'package:flutter_document_reader_api_example/main.dart';

class BtDevice {
  var documentReader = DocumentReader.instance;
  late MyAppState main;
  String btDeviceName = "Regula 0000";

  init(MyAppState main) {
    this.main = main;
    if (MyAppState.useBleDevice) {
      main.setStatus("Connect to a bluetooth device");
    }
  }

  connect() async {
    main.setStatus("Searching for devices...");
    if (await documentReader.connectBluetoothDevice(btDeviceName)) {
      await main.init();
      documentReader.functionality.useAuthenticator = true;
    } else {
      main.setStatus("Failed to connect");
    }
  }

  Widget build() {
    return Visibility(
      visible: MyAppState.useBleDevice,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textField(),
            MyAppState.button("Connect", () => connect()),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.5),
      child: SizedBox(
        width: 160,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: btDeviceName,
          ),
          onChanged: (text) => btDeviceName = text,
        ),
      ),
    );
  }
}
