import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api_example/extra/bt_device.dart';
import 'package:flutter_document_reader_api_example/extra/rfid_custom_ui.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/flutter_document_reader_api.dart';

var documentReader = DocumentReader.instance;
var selectedScenario = Scenario.MRZ;
var doRfid = false;
var isReadingRfid = false;

Future<void> init() async {
  if (!await initialize()) return;
  setScenarios(documentReader.availableScenarios);
  setCanRfid(await documentReader.isRFIDAvailableForUse());
  setStatus("Ready");
}

void scan() async {
  if (!await documentReader.isReady) return;
  clearResults();
  documentReader.startScanner(
    ScannerConfig.withScenario(selectedScenario),
    handleCompletion,
  );
}

void recognize() async {
  if (!await documentReader.isReady) return;
  var image = await pickImage();
  if (image == null) return;

  clearResults();
  documentReader.recognize(
    RecognizeConfig.withScenario(selectedScenario, image: image),
    handleCompletion,
  );
}

void handleCompletion(
  DocReaderAction action,
  Results? results,
  DocReaderException? error,
) {
  handleException(error);
  if (action.stopped() && !shouldRfid(results)) {
    displayResults(results);
  } else if (action.finished() && shouldRfid(results)) {
    isReadingRfid = true;
    readRfid();
  }
}

void displayResults(Results? results) async {
  isReadingRfid = false;
  clearResults();
  if (results == null) return;

  var name =
      await results.textFieldValueByType(FieldType.SURNAME_AND_GIVEN_NAMES);
  var docImage =
      await results.graphicFieldImageByType(GraphicFieldType.DOCUMENT_IMAGE);
  var portrait =
      await results.graphicFieldImageByType(GraphicFieldType.PORTRAIT);
  portrait = await results.graphicFieldImageByTypeSource(
        GraphicFieldType.PORTRAIT,
        ResultType.RFID_IMAGE_DATA,
      ) ??
      portrait;

  setStatus(name);
  setPortrait(portrait);
  setDocImage(docImage);
}

var readRfid = () => documentReader.rfid(RFIDConfig(handleCompletion));

bool shouldRfid(Results? results) =>
    doRfid && !isReadingRfid && results != null && results.chipPage != 0;

var initialize = () async {
  setStatus("Initializing...");

  ByteData license = await rootBundle.load("assets/regula.license");
  var initConfig = InitConfig(license);
  initConfig.delayedNNLoad = true;
  var (success, error) = await documentReader.initialize(initConfig);

  handleException(error);
  return success;
};

void handleException(DocReaderException? error) {
  if (error != null) {
    setStatus(error.message);
    print("${error.code}: ${error.message}");
  }
}

// --------------------------------------------------------------------------------------------------------------------

var status = "Loading...";
void setStatus(String? s) {
  if (s != null) {
    MyAppState.update(() => status = s);
  }
}

var portraitUIImage = Image.asset('assets/images/portrait.png');
void setPortrait(Uint8List? data) {
  if (data != null) {
    MyAppState.update(() => portraitUIImage = Image.memory(data));
  }
}

var documentUIImage = Image.asset('assets/images/id.png');
void setDocImage(Uint8List? data) {
  if (data != null) {
    MyAppState.update(() => documentUIImage = Image.memory(data));
  }
}

void clearResults() {
  MyAppState.update(() {
    status = "Ready";
    portraitUIImage = Image.asset('assets/images/portrait.png');
    documentUIImage = Image.asset('assets/images/id.png');
  });
}

var canRfid = false;
void setCanRfid(bool data) {
  MyAppState.update(() => canRfid = data);
}

List<DocReaderScenario> scenarios = [];
void setScenarios(List<DocReaderScenario> data) {
  MyAppState.update(() => scenarios = data);
}

List<Widget> ui() {
  return [
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      image("Portrait", portraitUIImage.image),
      image("Document image", documentUIImage.image),
    ]),
    Expanded(
      child: Container(
        color: Color.fromARGB(5, 0, 0, 0),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 40),
        child: RadioGroup(
          groupValue: selectedScenario.value,
          onChanged: (value) => MyAppState.update(
              () => selectedScenario = Scenario.getByValue(value)!),
          child: ListView.builder(
            itemCount: scenarios.length,
            itemBuilder: (context, int index) => ListTile(
              leading: Radio(value: scenarios[index].name),
              title: Text(scenarios[index].caption),
              onTap: () => MyAppState.update(() => selectedScenario =
                  Scenario.getByValue(scenarios[index].name)!),
            ),
          ),
        ),
      ),
    ),
    CheckboxListTile(
      value: doRfid,
      title: Text("Process rfid reading" + (canRfid ? "" : " (unavailable)")),
      onChanged: (value) => MyAppState.update(() => doRfid = value! && canRfid),
    ),
    Row(children: [
      Expanded(child: button("Scan document", scan)),
      Expanded(child: button("Scan image", recognize))
    ]),
    btDeviceUI()
  ];
}

Widget image(String title, ImageProvider image) => Column(children: [
      Text(title),
      Padding(
        padding: EdgeInsets.all(5),
        child: Image(height: 150, image: image),
      )
    ]);

Widget button(String text, VoidCallback onPressed) => Padding(
    padding: EdgeInsets.all(5),
    child: SizedBox(
      height: 40,
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    ));

Widget label(String text, {bool small = false}) => Text(text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: small ? 15 : 18,
      fontWeight: FontWeight.w600,
    ));

Widget header(List<Widget> children, {bool top = true}) => Container(
    padding: EdgeInsets.only(top: top ? 70 : 13),
    color: Colors.black.withValues(alpha: 0.03),
    child: Column(children: [
      ...children,
      Container(
        margin: EdgeInsets.only(top: 13),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(0, 0, 0, 0.075),
        ),
      ),
    ]));

// --------------------------------------------------------------------------------------------------------------------

Future<Uint8List?> pickImage() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) return null;
  return await file.readAsBytes();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    instance = this;

    // custom rfid
    if (useRfidSelfHostedUI) readRfid = () => rfidSelfHostedUI();

    // bt device
    if (!useBtDevice) {
      init();
    } else {
      setupBTDevice();
      initialize = initializeWithBTDevice;
    }
  }

  @override
  Widget build(_) => MaterialApp(
      theme: ThemeData(colorScheme: theme),
      home: Scaffold(
        body: Column(children: [
          header([label(status)]),
          Visibility(
            visible: !isShowingRfidSelfHostedUI,
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 35),
                child: Column(children: ui()),
              ),
            ),
          ),
          Visibility(
            visible: isShowingRfidSelfHostedUI,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rfidCustomUI(),
              ),
            ),
          )
        ]),
      ));

  static final theme = ColorScheme.fromSwatch(accentColor: Color(0xFF4285F4));
  static late MyAppState instance;
  static update(VoidCallback state) => {instance.setState(state)};
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MyAppState();
  }
}

void main() => runApp(new MaterialApp(home: new MyApp()));
