//
//  main.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api_example/extra/rfid_custom_ui.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';

void main() => runApp(MyApp());

class MyAppState extends State<MyApp> {
  var documentReader = DocumentReader.instance;

  var status = "Loading...";
  var portrait = Image.asset('assets/images/portrait.png');
  var docImage = Image.asset('assets/images/id.png');
  var selectedScenario = Scenario.MRZ;
  List<DocReaderScenario> scenarios = [];
  Object setStatus(String s) => {setState(() => status = s)};

  var canRfid = false;
  var doRfid = false;
  var isReadingRfid = false;
  var rfidCustomUiExample = RFIDCustomUI.empty();
  var rfidOption = RfidOption.Basic;

  void init() async {
    super.initState();
    if (!await initializeReader()) return;
    status = "Ready";
    scenarios = documentReader.availableScenarios;
    canRfid = await documentReader.isRFIDAvailableForUse();
    setState(() {});
  }

  void handleCompletion(
      DocReaderAction action, Results? results, DocReaderException? error) {
    if (error != null) print(error.message);
    if (action.stopped() && !shouldRfid(results)) {
      displayResults(results);
    } else if (action.finished() && shouldRfid(results)) {
      readRfid();
    }
  }

  void displayResults(Results? results) async {
    isReadingRfid = false;
    clearResults();
    if (results == null) return;

    var name =
        await results.textFieldValueByType(FieldType.SURNAME_AND_GIVEN_NAMES);
    var newDocImage =
        await results.graphicFieldImageByType(GraphicFieldType.DOCUMENT_IMAGE);
    var newPortrait =
        await results.graphicFieldImageByType(GraphicFieldType.PORTRAIT);

    setState(() {
      status = name ?? "Ready";
      if (newDocImage != null) docImage = Image.memory(newDocImage);
      if (newPortrait != null) portrait = Image.memory(newPortrait);
    });
  }

  void clearResults() {
    setState(() {
      status = "Ready";
      docImage = Image.asset('assets/images/id.png');
      portrait = Image.asset('assets/images/portrait.png');
    });
  }

  void readRfid() {
    isReadingRfid = true;
    if (rfidOption == RfidOption.Basic) basicRfid();
    if (rfidOption == RfidOption.Advanced) advancedRfid();
    if (rfidOption == RfidOption.Custom) rfidCustomUiExample.run();
  }

  void basicRfid() {
    documentReader.rfid(RFIDConfig(handleCompletion));
  }

  void advancedRfid() {
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
          itemBuilder: (_, int index) => radioButton(index),
        ),
      ),
    );
  }

  Widget rfidCheckbox() {
    return CheckboxListTile(
      value: doRfid,
      title: Text("Process rfid reading" + (canRfid ? "" : " (unavailable)")),
      onChanged: (bool? value) => setState(() => doRfid = value! && canRfid),
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
              ScannerConfig.withScenario(selectedScenario),
              handleCompletion,
            );
          }),
          button("Scan image", () async {
            clearResults();
            documentReader.recognize(
              RecognizeConfig.withScenario(
                selectedScenario,
                RecognizeData.withImages(await getImages()),
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
    Radio radio = Radio(
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
          foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }

  Future<bool> initializeReader() async {
    setStatus("Initializing...");

    ByteData license = await rootBundle.load("assets/regula.license");
    var initConfig = InitConfig(license);
    initConfig.delayedNNLoad = true;
    var (success, error) = await documentReader.initializeReader(initConfig);

    if (!success) {
      setStatus(error!.message);
      printError(error);
    }
    rfidCustomUiExample = RFIDCustomUI(setState, setStatus, displayResults);
    return success;
  }

  void printError(DocReaderException error) =>
      print("Error: \n  code: ${error.code}\n  message: ${error.message}");

  Future<List<Uint8List>> getImages() async {
    setStatus("Processing image...");
    List<XFile> files = await ImagePicker().pickMultiImage();
    List<Uint8List> result = [];
    for (XFile file in files) {
      result.add(await file.readAsBytes());
    }
    return result;
  }

  @override
  Widget build(_) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.blue, surfaceTint: Colors.blue),
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

  @override
  void initState() {
    super.initState();
    init();
  }
}

enum RfidOption { Basic, Advanced, Custom }

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}
