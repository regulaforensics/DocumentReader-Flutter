//
//  main.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api_example/extra/rfid_custom_ui.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api_beta/document_reader.dart';

void main() => runApp(MyApp());

class MyAppState extends State<MyApp> {
  var documentReader = DocumentReader.instance;

  var status = "Loading...";
  var portrait = Image.asset('assets/images/portrait.png');
  var docImage = Image.asset('assets/images/id.png');
  var selectedScenario = Scenario.MRZ;
  List<DocReaderScenario> scenarios = [];
  Object setStatus(String s) => {setState(() => status = s)};
  late SuccessCompletion successCompletion;

  var doRfid = false;
  var isReadingRfid = false;
  var rfidCustomUiExample = RFIDCustomUI.empty();
  var rfidOption = RfidOption.Basic;

  var colorPrimary = Colors.blue;

  initPlatformState() async {
    if (!await prepareDatabase()) return;
    if (!await initializeReader()) return;

    setStatus("Ready");
    setState(() => scenarios = documentReader.availableScenarios);
  }

  handleCompletion(
      DocReaderAction action, Results? results, DocReaderException? error) {
    if (error != null) print(error.message);
    if (action.stopped() && !shouldRfid(results))
      displayResults(results);
    else if (action.finished() && shouldRfid(results)) readRfid();
  }

  displayResults(Results? results) async {
    isReadingRfid = false;
    clearResults();
    if (results == null) return;

    var name = await results
        .textFieldValueByType(VisualFieldType.SURNAME_AND_GIVEN_NAMES);
    var newDocImage =
        await results.graphicFieldImageByType(GraphicFieldType.DOCUMENT_IMAGE);
    var newPortrait =
        await results.graphicFieldImageByType(GraphicFieldType.PORTRAIT);

    setState(() {
      status = name ?? "Ready";
      if (newDocImage != null)
        docImage = Image.memory(newDocImage.data!.contentAsBytes());
      if (newPortrait != null)
        portrait = Image.memory(newPortrait.data!.contentAsBytes());
    });
  }

  clearResults() {
    setState(() {
      status = "Ready";
      docImage = Image.asset('assets/images/id.png');
      portrait = Image.asset('assets/images/portrait.png');
    });
  }

  readRfid() {
    isReadingRfid = true;
    if (rfidOption == RfidOption.Basic) basicRfid();
    if (rfidOption == RfidOption.Advanced) advancedRfid();
    if (rfidOption == RfidOption.Custom) rfidCustomUiExample.run();
  }

  basicRfid() {
    documentReader.rfid(RFIDConfig(handleCompletion));
  }

  advancedRfid() {
    var config = RFIDConfig(handleCompletion);

    config.onChipDetected = () => print("Chip detected, reading rfid.");
    config.onRetryReadChip = (error) async {
      var message = await error.code.getTranslation();
      print("Reading interrupted: $message. Retrying...");
    };

    documentReader.rfid(config);
  }

  bool shouldRfid(Results? results) =>
      doRfid && !isReadingRfid && results != null && results.chipPage != 0;

  Widget ui() {
    return Column(
      children: [
        documentImages(),
        scenarioSelector(),
        rfidCheckbox(),
        scanButtons()
      ],
    );
  }

  Widget documentImages() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          image("Portrait", 150, 150, portrait.image),
          image("Document image", 150, 200, docImage.image),
        ],
      ),
    );
  }

  Widget scenarioSelector() {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(5, 10, 10, 10),
        child: ListView.builder(
          itemCount: scenarios.length,
          itemBuilder: (BuildContext context, int index) => radioButton(index),
        ),
      ),
    );
  }

  Widget rfidCheckbox() {
    var rfidCheckboxTitle = "Process rfid reading";
    if (!documentReader.isRFIDAvailableForUse)
      rfidCheckboxTitle += " (unavailable)";

    return CheckboxListTile(
      value: doRfid,
      title: Text(rfidCheckboxTitle),
      onChanged: (bool? value) {
        setState(() => doRfid = value! && documentReader.isRFIDAvailableForUse);
      },
    );
  }

  Widget scanButtons() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          button("Scan document", () {
            clearResults();
            documentReader.scan(
              ScannerConfig.fromScenario(selectedScenario),
              handleCompletion,
            );
          }),
          button("Scan image", () async {
            clearResults();
            documentReader.recognize(
              RecognizeConfig.fromScenario(
                selectedScenario,
                RecognizeData.fromImages(await getImages()),
              ),
              handleCompletion,
            );
          })
        ],
      ),
    );
  }

  Widget image(
    String title,
    double height,
    double width,
    ImageProvider image,
  ) {
    return Column(
      children: <Widget>[
        Text(title),
        Image(
          height: height,
          width: width,
          image: image,
        )
      ],
    );
  }

  Widget radioButton(int index) {
    Radio radio = new Radio(
      value: scenarios[index].name,
      groupValue: selectedScenario.value,
      onChanged: (value) => setState(() {
        selectedScenario = Scenario.getByValue(value)!;
      }),
    );
    return Container(
      padding: const EdgeInsets.only(left: 40),
      child: ListTile(
        leading: radio,
        title: GestureDetector(
          onTap: () => radio.onChanged!(scenarios[index].name),
          child: Text(scenarios[index].caption),
        ),
      ),
    );
  }

  Widget button(String text, VoidCallback onPress) {
    return Container(
      width: 160,
      height: 40,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      transform: Matrix4.translationValues(0, -7.5, 0),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(colorPrimary),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }

  Future<bool> prepareDatabase() async {
    return await documentReader.prepareDatabase(
      "Full",
      (progress) => setStatus("Downloading database: $progress%"),
      successCompletion,
    );
  }

  Future<bool> initializeReader() async {
    setStatus("Initializing...");
    rfidCustomUiExample =
        RFIDCustomUI(context, setState, setStatus, displayResults);
    ByteData byteData = await rootBundle.load("assets/regula.license");
    Uint8List license = byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );
    var initConfig = new InitConfig(license);
    initConfig.delayedNNLoad = true;
    return await documentReader.initializeReader(initConfig, successCompletion);
  }

  Future<List<Uint8List>> getImages() async {
    setStatus("Processing image...");
    List<XFile>? files = await ImagePicker().pickMultiImage();
    List<Uint8List> result = [];
    for (XFile file in files) {
      result.add(io.File(file.path).readAsBytesSync());
    }
    return result;
  }

  @override
  initState() {
    super.initState();

    successCompletion = (success, error) {
      if (success) return;
      setStatus("Something went wrong");
      print("ERROR: " + error!.code.toString());
    };

    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: colorPrimary, surfaceTint: colorPrimary),
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text(status))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rfidCustomUiExample.build(),
            Visibility(
              visible: !rfidCustomUiExample.isShowing,
              child: Expanded(
                child: ui(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum RfidOption { Basic, Advanced, Custom }

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}
