import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';
import 'package:flutter_document_reader_api_example/main.dart';

var useRfidSelfHostedUI = false;

void rfidSelfHostedUI() {
  var config = RFIDConfig.withoutUI((action, results, _) {
    action.stopped() ? stop() : null;
    action.finished() ? displayResults(results) : null;
    action.interrupted() ? setStatus("Error reading RFID") : null;
  });

  config.onProgress = (notification) async {
    if (notification.progress == 1) return;
    if (notification.notificationCode ==
        RFIDNotificationCodes.PCSC_READING_DATAGROUP) {
      setDescription(await notification.dataFileType.getTranslation());
    }
    setStatus("Reading RFID");
    setProgress(notification.progress);
  };

  setup();
  DocumentReader.instance.rfid(config);
}

void setup() {
  setStatus("Reading RFID");
  setDescription("Place your phone on top of the NFC tag");
  setProgress(-1);
  currentProgress = -1;
  setShowing(true);
}

void stop() {
  DocumentReader.instance.stopRFIDReader();
  displayResults(null);
  setShowing(false);
}

var rfidDescription = "Place your phone on top of the NFC tag";
void setDescription(String data) {
  MyAppState.update(() => rfidDescription = data);
}

var currentProgress = -1;
var isIncreasing = true;
void setProgress(int next) {
  // make progress bar look better
  if (next == 0) return; // ignore idle 0s, leave progress at 100 instead
  if (next < currentProgress) next = 0; // move to 0 if progress is moving
  if (next >= 95) next = 100; // rfid never returns 100 and it looks ugly

  MyAppState.update(() => isIncreasing = next > currentProgress);
  MyAppState.update(() => currentProgress = next);
}

var isShowingRfidSelfHostedUI = false;
void setShowing(bool data) {
  MyAppState.update(() => isShowingRfidSelfHostedUI = data);
}

List<Widget> rfidCustomUI() {
  return [
    label(rfidDescription),
    TweenAnimationBuilder(
      tween: Tween(begin: currentProgress / 100, end: currentProgress / 100),
      duration: Duration(milliseconds: isIncreasing ? 500 : 0),
      builder: (context, value, child) => Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: LinearProgressIndicator(
          value: value,
          minHeight: 20,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ),
    TextButton(
      onPressed: () => stop(),
      child: Text("X"),
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(top: 50),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    SizedBox(height: 100)
  ];
}
