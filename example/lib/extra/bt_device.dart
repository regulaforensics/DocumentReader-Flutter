import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';
import 'package:flutter_document_reader_api_example/main.dart';

var useBtDevice = false;
var btDeviceName = "Regula 0000";

void setupBTDevice() {
  setStatus("Connect to a bluetooth device");
}

void connect() async {
  setStatus("Searching for devices...");
  if (await DocumentReader.instance.connectBluetoothDevice(btDeviceName)) {
    await init();
    DocumentReader.instance.functionality.useAuthenticator = true;
    useBtDevice = false;
  } else {
    setStatus("Failed to connect");
  }
}

Future<bool> initializeWithBTDevice() async {
  setStatus("Initializing...");

  var initConfig = InitConfig.withBleDevice();
  initConfig.delayedNNLoad = true;
  var (success, error) = await DocumentReader.instance.initialize(initConfig);

  handleException(error);
  return success;
}

Widget btDeviceUI() {
  return Visibility(
    visible: useBtDevice,
    child: Row(children: [Expanded(child: button("Connect", () => connect()))]),
  );
}
