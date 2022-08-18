import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'
    show EventChannel, PlatformException, rootBundle;
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<String>> getImages() async {
    setStatus("Processing image...");
    List<XFile> files = await ImagePicker().pickMultiImage();
    List<String> result = [];
    for (XFile file in files)
      result.add(base64Encode(io.File(file.path).readAsBytesSync()));
    return result;
  }

  Object setStatus(String s) => {setState(() => _status = s)};
  String _status = "Loading...";
  bool isReadingRfidCustomUi = false;
  bool isReadingRfid = false;
  String rfidUIHeader = "Reading RFID";
  Color rfidUIHeaderColor = Colors.black;
  String rfidDescription = "Place your phone on top of the NFC tag";
  double rfidProgress = -1;
  var _portrait = Image.asset('assets/images/portrait.png');
  var _docImage = Image.asset('assets/images/id.png');
  List<List<String>> _scenarios = [];
  String _selectedScenario = "Mrz";
  bool _canRfid = false;
  bool _doRfid = false;
  var printError =
      (Object error) => print((error as PlatformException).message);

  @override
  void initState() {
    super.initState();
    initPlatformState();
    EventChannel('flutter_document_reader_api/event/completion')
        .receiveBroadcastStream()
        .listen((jsonString) => this.handleCompletion(
            DocumentReaderCompletion.fromJson(json.decode(jsonString))));
    EventChannel('flutter_document_reader_api/event/database_progress')
        .receiveBroadcastStream()
        .listen(
            (progress) => setStatus("Downloading database: " + progress + "%"));
    EventChannel(
            'flutter_document_reader_api/event/rfid_notification_completion')
        .receiveBroadcastStream()
        .listen((event) =>
            print("rfid_notification_completion: " + event.toString()));
  }

  void addCertificates() async {
    List certificates = [];
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final certPaths = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets/certificates'));

    for (var path in certPaths) {
      var findExt = path.split('.');
      var pkdResourceType = 0;
      if (findExt.length > 0)
        pkdResourceType =
            PKDResourceType.getType(findExt[findExt.length - 1].toLowerCase());
      ByteData byteData = await rootBundle.load(path);
      var certBase64 = base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      certificates
          .add({"binaryData": certBase64, "resourceType": pkdResourceType});
    }

    DocumentReader.addPKDCertificates(certificates)
        .then((value) => print("certificates added"));
  }

  void handleCompletion(DocumentReaderCompletion completion) {
    if (isReadingRfidCustomUi &&
        (completion.action == DocReaderAction.CANCEL ||
            completion.action == DocReaderAction.ERROR)) this.hideRfidUI();
    if (isReadingRfidCustomUi &&
        completion.action == DocReaderAction.NOTIFICATION)
      this.updateRfidUI(completion.results.documentReaderNotification);
    if (completion.action ==
        DocReaderAction.COMPLETE) if (isReadingRfidCustomUi) if (completion
            .results.rfidResult !=
        1)
      this.restartRfidUI();
    else {
      this.hideRfidUI();
      this.displayResults(completion.results);
    }
    else
      this.handleResults(completion.results);
    if (completion.action == DocReaderAction.TIMEOUT)
      this.handleResults(completion.results);
    if (completion.action == DocReaderAction.CANCEL ||
        completion.action == DocReaderAction.ERROR) isReadingRfid = false;
  }

  void showRfidUI() {
    // show animation
    setState(() => isReadingRfidCustomUi = true);
  }

  hideRfidUI() {
    // show animation
    this.restartRfidUI();
    DocumentReader.stopRFIDReader();
    setState(() {
      isReadingRfidCustomUi = false;
      rfidUIHeader = "Reading RFID";
      rfidUIHeaderColor = Colors.black;
    });
  }

  restartRfidUI() {
    setState(() {
      rfidUIHeaderColor = Colors.red;
      rfidUIHeader = "Failed!";
      rfidDescription = "Place your phone on top of the NFC tag";
      rfidProgress = -1;
    });
  }

  updateRfidUI(results) {
    if (results.code ==
        ERFIDNotificationCodes.RFID_NOTIFICATION_PCSC_READING_DATAGROUP)
      setState(() =>
          rfidDescription = ERFIDDataFileType.getTranslation(results.number));
    setState(() {
      rfidUIHeader = "Reading RFID";
      rfidUIHeaderColor = Colors.black;
      rfidProgress = results.value / 100;
    });
    if (Platform.isIOS)
      DocumentReader.setRfidSessionStatus(
          rfidDescription + "\n" + results.value.toString() + "%");
  }

  customRFID() {
    this.showRfidUI();
    DocumentReader.readRFID();
  }

  usualRFID() {
    isReadingRfid = true;
    DocumentReader.startRFIDReader();
  }

  Future<void> initPlatformState() async {
    print(await DocumentReader.prepareDatabase("Full"));
    setStatus("Initializing...");
    ByteData byteData = await rootBundle.load("assets/regula.license");
    print(await DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
      "delayedNNLoad": true
    }));
    setStatus("Ready");
    bool canRfid = await DocumentReader.isRFIDAvailableForUse();
    setState(() => _canRfid = canRfid);
    List<List<String>> scenarios = [];
    var scenariosTemp =
        json.decode(await DocumentReader.getAvailableScenarios());
    for (var i = 0; i < scenariosTemp.length; i++) {
      DocumentReaderScenario scenario = DocumentReaderScenario.fromJson(
          scenariosTemp[i] is String
              ? json.decode(scenariosTemp[i])
              : scenariosTemp[i]);
      scenarios.add([scenario.name, scenario.caption]);
    }
    setState(() => _scenarios = scenarios);
    DocumentReader.setConfig({
      "functionality": {
        "videoCaptureMotionControl": true,
        "showCaptureButton": true
      },
      "customization": {
        "showResultStatusMessages": true,
        "showStatusMessages": true
      },
      "processParams": {"scenario": _selectedScenario}
    });
    DocumentReader.setRfidDelegate(RFIDDelegate.NO_PA);
    // addCertificates();
  }

  displayResults(DocumentReaderResults results) {
    setState(() {
      _status = results.getTextFieldValueByType(
              EVisualFieldType.FT_SURNAME_AND_GIVEN_NAMES) ??
          "";
      _docImage = Image.asset('assets/images/id.png');
      _portrait = Image.asset('assets/images/portrait.png');
      if (results.getGraphicFieldImageByType(207) != null)
        _docImage = Image.memory(Uri.parse("data:image/png;base64," +
                results
                    .getGraphicFieldImageByType(
                        EGraphicFieldType.GF_DOCUMENT_IMAGE)
                    .replaceAll('\n', ''))
            .data
            .contentAsBytes());
      if (results.getGraphicFieldImageByType(201) != null)
        _portrait = Image.memory(Uri.parse("data:image/png;base64," +
                results
                    .getGraphicFieldImageByType(EGraphicFieldType.GF_PORTRAIT)
                    .replaceAll('\n', ''))
            .data
            .contentAsBytes());

      for (var textField in results.textResult.fields) {
        for (var value in textField.values) {
          print(textField.fieldName +
              ', value: ' +
              value.value +
              ', source: ' +
              value.sourceType.toString());
        }
      }
    });
  }

  void handleResults(DocumentReaderResults results) {
    if (_doRfid && !isReadingRfid && results != null && results.chipPage != 0) {
      // customRFID();
      usualRFID();
    } else {
      isReadingRfid = false;
      displayResults(results);
    }
  }

  void onChangeRfid(bool value) {
    setState(() => _doRfid = value && _canRfid);
    DocumentReader.setConfig({
      "processParams": {"doRfid": _doRfid}
    });
  }

  Widget createImage(
      String title, double height, double width, ImageProvider image) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title),
          Image(height: height, width: width, image: image)
        ]);
  }

  Widget createButton(String text, VoidCallback onPress) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      transform: Matrix4.translationValues(0, -7.5, 0),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(50, 10, 10, 10)),
          onPressed: onPress,
          child: Text(text)),
      width: 150,
    );
  }

  Widget _buildRow(int index) {
    Radio radio = new Radio(
        value: _scenarios[index][0],
        groupValue: _selectedScenario,
        onChanged: (value) => setState(() {
              _selectedScenario = value;
              DocumentReader.setConfig({
                "processParams": {"scenario": _selectedScenario}
              });
            }));
    return Container(
        child: ListTile(
            title: GestureDetector(
                onTap: () => radio.onChanged(_scenarios[index][0]),
                child: Text(_scenarios[index][1])),
            leading: radio),
        padding: EdgeInsets.only(left: 40));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Center(child: Text(_status))),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Visibility(
                visible: isReadingRfidCustomUi,
                child: Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[]),
                      Container(
                          child: Text(rfidUIHeader,
                              textScaleFactor: 1.75,
                              style: TextStyle(color: rfidUIHeaderColor)),
                          padding: EdgeInsets.only(bottom: 40)),
                      Container(
                          child: Text(rfidDescription, textScaleFactor: 1.4),
                          padding: EdgeInsets.only(bottom: 40)),
                      FractionallySizedBox(
                          widthFactor: 0.6,
                          child: LinearProgressIndicator(
                              value: rfidProgress,
                              minHeight: 10,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Color(0xFF4285F4)))),
                      TextButton(
                        onPressed: () => hideRfidUI(),
                        child: Text("X"),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(top: 50)),
                      ),
                    ]))),
            Visibility(
                visible: !isReadingRfidCustomUi,
                child: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            createImage("Portrait", 150, 150, _portrait.image),
                            createImage(
                                "Document image", 150, 200, _docImage.image),
                          ]),
                      Expanded(
                          child: Container(
                              color: Color.fromARGB(5, 10, 10, 10),
                              child: ListView.builder(
                                  itemCount: _scenarios.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          _buildRow(index)))),
                      CheckboxListTile(
                          value: _doRfid,
                          onChanged: onChangeRfid,
                          title: Text(
                              "Process rfid reading ${_canRfid ? "" : "(unavailable)"}")),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            createButton("Scan document",
                                () => DocumentReader.showScanner()),
                            createButton(
                                "Scan image",
                                () async => DocumentReader.recognizeImages(
                                    await getImages())),
                          ])
                    ]))),
          ])),
    );
  }
}
