//
//  FlutterDocumentReaderApiPlugin.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static com.regula.documentreader.api.DocumentReader.Instance;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Utils.*;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.*;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.JSONConstructor.*;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NfcAdapter;
import android.nfc.tech.IsoDep;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;

import com.regula.common.LocalizationCallbacks;
import com.regula.documentreader.api.completions.IDocumentReaderCompletion;
import com.regula.documentreader.api.completions.IDocumentReaderInitCompletion;
import com.regula.documentreader.api.completions.IDocumentReaderPrepareCompletion;
import com.regula.documentreader.api.completions.rfid.IRfidPKDCertificateCompletion;
import com.regula.documentreader.api.completions.rfid.IRfidReaderCompletion;
import com.regula.documentreader.api.completions.rfid.IRfidReaderRequest;
import com.regula.documentreader.api.completions.rfid.IRfidTASignatureCompletion;
import com.regula.documentreader.api.enums.DocReaderAction;
import com.regula.documentreader.api.enums.LCID;
import com.regula.documentreader.api.enums.eImageQualityCheckType;
import com.regula.documentreader.api.enums.eLDS_ParsingErrorCodes;
import com.regula.documentreader.api.enums.eLDS_ParsingNotificationCodes;
import com.regula.documentreader.api.enums.eRFID_DataFile_Type;
import com.regula.documentreader.api.enums.eRFID_ErrorCodes;
import com.regula.documentreader.api.enums.eVisualFieldType;
import com.regula.documentreader.api.errors.DocReaderRfidException;
import com.regula.documentreader.api.errors.DocumentReaderException;
import com.regula.documentreader.api.results.DocumentReaderNotification;
import com.regula.documentreader.api.internal.core.CoreScenarioUtil;
import com.regula.documentreader.api.params.DocReaderConfig;
import com.regula.documentreader.api.params.rfid.PKDCertificate;
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer;
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge;
import com.regula.documentreader.api.results.DocumentReaderGraphicField;
import com.regula.documentreader.api.results.DocumentReaderResults;
import com.regula.documentreader.api.results.DocumentReaderScenario;
import com.regula.documentreader.api.results.DocumentReaderTextField;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class FlutterDocumentReaderApiPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private Activity activity;
    private ArrayList<Object> args;
    private boolean backgroundRFIDEnabled = false;
    private int databaseDownloadProgress = 0;

    private IRfidPKDCertificateCompletion paCertificateCompletion;
    private IRfidPKDCertificateCompletion taCertificateCompletion;
    private IRfidTASignatureCompletion taSignatureCompletion;

    private EventChannel.EventSink eventDatabaseProgress;
    private EventChannel.EventSink eventCompletion;

    private EventChannel.EventSink rfidOnProgressEvent;
    private EventChannel.EventSink rfidOnChipDetectedEvent;
    private EventChannel.EventSink rfidOnRetryReadChipEvent;

    private EventChannel.EventSink eventPACertificateCompletion;
    private EventChannel.EventSink eventTACertificateCompletion;
    private EventChannel.EventSink eventTASignatureCompletion;

    private EventChannel.EventSink bleOnServiceConnectedEvent;
    private EventChannel.EventSink bleOnServiceDisconnectedEvent;
    private EventChannel.EventSink bleOnDeviceReadyEvent;

    private EventChannel.EventSink eventVideoEncoderCompletion;
    private EventChannel.EventSink onCustomButtonTappedEvent;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        setupEventChannel(binding, "completion", (events) -> eventCompletion = events);
        setupEventChannel(binding, "database_progress", (events) -> eventDatabaseProgress = events);
        setupEventChannel(binding, "video_encoder_completion", (events) -> eventVideoEncoderCompletion = events);
        setupEventChannel(binding, "rfidOnProgressCompletion", (events) -> rfidOnProgressEvent = events);
        setupEventChannel(binding, "rfidOnChipDetectedEvent", (events) -> rfidOnChipDetectedEvent = events);
        setupEventChannel(binding, "rfidOnRetryReadChipEvent", (events) -> rfidOnRetryReadChipEvent = events);
        setupEventChannel(binding, "pa_certificate_completion", (events) -> eventPACertificateCompletion = events);
        setupEventChannel(binding, "ta_certificate_completion", (events) -> eventTACertificateCompletion = events);
        setupEventChannel(binding, "ta_signature_completion", (events) -> eventTASignatureCompletion = events);
        setupEventChannel(binding, "bleOnServiceConnectedEvent", (events) -> bleOnServiceConnectedEvent = events);
        setupEventChannel(binding, "bleOnServiceDisconnectedEvent", (events) -> bleOnServiceDisconnectedEvent = events);
        setupEventChannel(binding, "bleOnDeviceReadyEvent", (events) -> bleOnDeviceReadyEvent = events);
        setupEventChannel(binding, "onCustomButtonTappedEvent", (events) -> onCustomButtonTappedEvent = events);
        new MethodChannel(binding.getBinaryMessenger(), "flutter_document_reader_api/method").setMethodCallHandler(this);
    }

    private interface OnListen {
        void run(EventChannel.EventSink events);
    }

    private void setupEventChannel(FlutterPluginBinding binding, String id, OnListen onListen) {
        new EventChannel(binding.getBinaryMessenger(), "flutter_document_reader_api/event/" + id).setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                onListen.run(events);
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
    }

    @Override
    public void onAttachedToActivity(ActivityPluginBinding binding) {
        activity = binding.getActivity();
        binding.addOnNewIntentListener(intent -> {
            if (intent.getAction() != null && intent.getAction().equals(NfcAdapter.ACTION_TECH_DISCOVERED) && backgroundRFIDEnabled)
                Instance().readRFID(IsoDep.get(intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)), getRfidReaderCompletion(), getRfidReaderRequest());
            return false;
        });
        ((HiddenLifecycleReference) binding.getLifecycle()).getLifecycle().addObserver((LifecycleEventObserver) (source, event) -> {
            if (event == Lifecycle.Event.ON_RESUME && backgroundRFIDEnabled)
                startForegroundDispatch(getActivity());
        });
    }

    public FlutterDocumentReaderApiPlugin() {
    }

    Activity getActivity() {
        return activity;
    }

    private Context getContext() {
        return activity;
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    }

    @Override
    public void onDetachedFromActivity() {
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    private void sendEvent(EventChannel.EventSink event, Object data) {
        if (event == null) return;
        if (data instanceof JSONObject || data instanceof JSONArray) data = data.toString();
        final Object finalData = data + "";
        new Handler(Looper.getMainLooper()).post(() -> event.success(finalData));
    }

    private void sendEvent(EventChannel.EventSink event) {
        sendEvent(event, "");
    }

    private <T> T args(int index) {
        return Utils.args(args, index);
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        String action = call.method;
        //noinspection unchecked
        args = (ArrayList<Object>) call.arguments;
        Callback callback = new Callback() {
            @Override
            public void success(Object o) {
                result.success(o);
            }

            @Override
            public void error(String s) {
                result.error("", s, null);
            }
        };
        try {
            switch (action) {
                case "getDocumentReaderIsReady" -> getDocumentReaderIsReady(callback);
                case "getDocumentReaderStatus" -> getDocumentReaderStatus(callback);
                case "isAuthenticatorAvailableForUse" -> isAuthenticatorAvailableForUse(callback);
                case "isBlePermissionsGranted" -> isBlePermissionsGranted(callback);
                case "getRfidSessionStatus" -> getRfidSessionStatus(callback);
                case "setRfidSessionStatus" -> setRfidSessionStatus(callback, args(0));
                case "getTag" -> getTag(callback);
                case "setTag" -> setTag(callback, args(0));
                case "getFunctionality" -> getFunctionality(callback);
                case "setFunctionality" -> setFunctionality(callback, args(0));
                case "getProcessParams" -> getProcessParams(callback);
                case "setProcessParams" -> setProcessParams(callback, args(0));
                case "getCustomization" -> getCustomization(callback);
                case "setCustomization" -> setCustomization(callback, args(0));
                case "getRfidScenario" -> getRfidScenario(callback);
                case "setRfidScenario" -> setRfidScenario(callback, args(0));
                case "resetConfiguration" -> resetConfiguration(callback);
                case "initializeReader" -> initializeReader(callback, args(0));
                case "initializeReaderAutomatically" -> initializeReaderAutomatically(callback);
                case "initializeReaderWithBleDeviceConfig" -> initializeReaderWithBleDeviceConfig(callback, args(0));
                case "deinitializeReader" -> deinitializeReader(callback);
                case "prepareDatabase" -> prepareDatabase(callback, args(0));
                case "removeDatabase" -> removeDatabase(callback);
                case "runAutoUpdate" -> runAutoUpdate(callback, args(0));
                case "cancelDBUpdate" -> cancelDBUpdate(callback);
                case "checkDatabaseUpdate" -> checkDatabaseUpdate(callback, args(0));
                case "scan" -> scan(callback, args(0));
                case "recognize" -> recognize(callback, args(0));
                case "startNewPage" -> startNewPage(callback);
                case "stopScanner" -> stopScanner(callback);
                case "startRFIDReader" -> startRFIDReader(callback, args(0));
                case "stopRFIDReader" -> stopRFIDReader(callback);
                case "readRFID" -> readRFID(callback, args(0));
                case "providePACertificates" -> providePACertificates(callback, args(0));
                case "provideTACertificates" -> provideTACertificates(callback, args(0));
                case "provideTASignature" -> provideTASignature(callback, args(0));
                case "setTCCParams" -> setTCCParams(callback, args(0));
                case "addPKDCertificates" -> addPKDCertificates(callback, args(0));
                case "clearPKDCertificates" -> clearPKDCertificates(callback);
                case "startNewSession" -> startNewSession(callback);
                case "startBluetoothService" -> startBluetoothService(callback);
                case "setLocalizationDictionary" -> setLocalizationDictionary(callback, args(0));
                case "getLicense" -> getLicense(callback);
                case "getAvailableScenarios" -> getAvailableScenarios(callback);
                case "getIsRFIDAvailableForUse" -> getIsRFIDAvailableForUse(callback);
                case "getDocReaderVersion" -> getDocReaderVersion(callback);
                case "getDocReaderDocumentsDatabase" -> getDocReaderDocumentsDatabase(callback);
                case "textFieldValueByType" -> textFieldValueByType(callback, args(0), args(1));
                case "textFieldValueByTypeLcid" -> textFieldValueByTypeLcid(callback, args(0), args(1), args(2));
                case "textFieldValueByTypeSource" -> textFieldValueByTypeSource(callback, args(0), args(1), args(2));
                case "textFieldValueByTypeLcidSource" -> textFieldValueByTypeLcidSource(callback, args(0), args(1), args(2), args(3));
                case "textFieldValueByTypeSourceOriginal" -> textFieldValueByTypeSourceOriginal(callback, args(0), args(1), args(2), args(3));
                case "textFieldValueByTypeLcidSourceOriginal" -> textFieldValueByTypeLcidSourceOriginal(callback, args(0), args(1), args(2), args(3), args(4));
                case "textFieldByType" -> textFieldByType(callback, args(0), args(1));
                case "textFieldByTypeLcid" -> textFieldByTypeLcid(callback, args(0), args(1), args(2));
                case "graphicFieldByTypeSource" -> graphicFieldByTypeSource(callback, args(0), args(1), args(2));
                case "graphicFieldByTypeSourcePageIndex" -> graphicFieldByTypeSourcePageIndex(callback, args(0), args(1), args(2), args(3));
                case "graphicFieldByTypeSourcePageIndexLight" -> graphicFieldByTypeSourcePageIndexLight(callback, args(0), args(1), args(2), args(3), args(4));
                case "graphicFieldImageByType" -> graphicFieldImageByType(callback, args(0), args(1));
                case "graphicFieldImageByTypeSource" -> graphicFieldImageByTypeSource(callback, args(0), args(1), args(2));
                case "graphicFieldImageByTypeSourcePageIndex" -> graphicFieldImageByTypeSourcePageIndex(callback, args(0), args(1), args(2), args(3));
                case "graphicFieldImageByTypeSourcePageIndexLight" -> graphicFieldImageByTypeSourcePageIndexLight(callback, args(0), args(1), args(2), args(3), args(4));
                case "containers" -> containers(callback, args(0), args(1));
                case "encryptedContainers" -> encryptedContainers(callback, args(0));
                case "getTranslation" -> getTranslation(callback, args(0), args(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void startForegroundDispatch(final Activity activity) {
        IntentFilter[] filters = new IntentFilter[1];
        filters[0] = new IntentFilter();
        filters[0].addAction(NfcAdapter.ACTION_TECH_DISCOVERED);
        filters[0].addCategory(Intent.CATEGORY_DEFAULT);
        String[][] techList = new String[][]{
                new String[]{"android.nfc.tech.IsoDep"}
        };
        Intent intent = new Intent(activity.getApplicationContext(), activity.getClass());
        int flag = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S ? PendingIntent.FLAG_MUTABLE : 0;
        PendingIntent pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, intent, flag);
        NfcAdapter.getDefaultAdapter(getActivity()).enableForegroundDispatch(activity, pendingIntent, filters, techList);
    }

    private void stopBackgroundRFID() {
        if (!backgroundRFIDEnabled)
            return;
        NfcAdapter.getDefaultAdapter(getActivity()).disableForegroundDispatch(getActivity());
        backgroundRFIDEnabled = false;
    }

    private void getDocumentReaderIsReady(Callback callback) {
        callback.success(Instance().isReady());
    }

    private void getDocumentReaderStatus(Callback callback) {
        callback.success(Instance().getStatus());
    }

    private void isAuthenticatorAvailableForUse(Callback callback) {
        callback.success(Instance().isAuthenticatorAvailableForUse());
    }

    private void isBlePermissionsGranted(Callback callback) {
        callback.success(BluetoothUtil.Companion.isBlePermissionsGranted(getActivity()));
    }

    private void getRfidSessionStatus(Callback callback) {
        callback.error("getRfidSessionStatus() is an ios-only method");
    }

    private void setRfidSessionStatus(Callback callback, @SuppressWarnings("unused") String status) {
        callback.error("setRfidSessionStatus() is an ios-only method");
    }

    private void getTag(Callback callback) {
        callback.success(Instance().tag);
    }

    private void setTag(Callback callback, String tag) {
        Instance().tag = tag;
        callback.success();
    }

    private void getFunctionality(Callback callback) throws JSONException {
        callback.success(Config.getFunctionality(Instance().functionality()).toString());
    }

    private void setFunctionality(Callback callback, final JSONObject functionality) throws JSONException {
        Config.setFunctionality(Instance().functionality(), functionality);
        callback.success();
    }

    private void getProcessParams(Callback callback) throws JSONException {
        callback.success(Config.getProcessParams(Instance().processParams()).toString());
    }

    private void setProcessParams(Callback callback, final JSONObject processParams) throws JSONException {
        Config.setProcessParams(Instance().processParams(), processParams);
        callback.success();
    }

    private void getCustomization(Callback callback) throws JSONException {
        callback.success(Config.getCustomization(Instance().customization()).toString());
    }

    private void setCustomization(Callback callback, final JSONObject customization) throws JSONException {
        Config.setCustomization(Instance().customization(), customization, getContext());
        callback.success();
    }

    private void getRfidScenario(Callback callback) throws JSONException {
        callback.success(Config.getRfidScenario(Instance().rfidScenario()).toString());
    }

    private void setRfidScenario(Callback callback, final JSONObject rfidScenario) throws JSONException {
        Config.setRfidScenario(Instance().rfidScenario(), rfidScenario);
        callback.success();
    }

    private void resetConfiguration(Callback callback) {
        Instance().resetConfiguration();
        Config.setupScaleType();
        callback.success();
    }

    private void initializeReader(Callback callback, JSONObject config) {
        Instance().initializeReader(getContext(), docReaderConfigFromJSON(config), getInitCompletion(callback));
    }

    private void initializeReaderAutomatically(Callback callback) {
        try {
            InputStream is = getContext().getAssets().open("regula.license");
            byte[] license = new byte[is.available()];
            //noinspection ResultOfMethodCallIgnored
            is.read(license);
            Instance().initializeReader(getContext(), new DocReaderConfig(license), getInitCompletion(callback));
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
            callback.error("problem reading license(see logs)");
        }
    }

    private void initializeReaderWithBleDeviceConfig(Callback callback, JSONObject config) {
        if (BluetoothUtil.Companion.getBleManager() == null) {
            callback.error("bleManager is null");
            return;
        }
        Instance().initializeReader(getContext(), bleDeviceConfigFromJSON(config), getInitCompletion(callback));
    }

    private void deinitializeReader(Callback callback) {
        Instance().deinitializeReader();
        callback.success();
    }

    private void prepareDatabase(Callback callback, String databaseID) {
        Instance().prepareDatabase(getContext(), databaseID, getPrepareCompletion(callback));
    }

    private void removeDatabase(Callback callback) {
        callback.success(Instance().removeDatabase(getContext()));
    }

    private void runAutoUpdate(Callback callback, String databaseID) {
        Instance().runAutoUpdate(getContext(), databaseID, getPrepareCompletion(callback));
    }

    private void cancelDBUpdate(Callback callback) {
        callback.success(Instance().cancelDBUpdate(getContext()));
    }

    private void checkDatabaseUpdate(Callback callback, String databaseID) {
        Instance().checkDatabaseUpdate(getContext(), databaseID, (database) -> callback.success(toStringOrNull(generateDocReaderDocumentsDatabase(database))));
    }

    private void scan(@SuppressWarnings("unused") Callback callback, JSONObject config) {
        stopBackgroundRFID();
        Instance().showScanner(getContext(), scannerConfigFromJSON(config), getCompletion());
    }

    private void recognize(@SuppressWarnings("unused") Callback callback, JSONObject config) {
        stopBackgroundRFID();
        Instance().recognize(getContext(), recognizeConfigFromJSON(config), getCompletion());
    }

    private void startNewPage(Callback callback) {
        Instance().startNewPage();
        callback.success();
    }

    private void stopScanner(Callback callback) {
        Instance().stopScanner(getContext());
        callback.success();
    }

    private void startRFIDReader(@SuppressWarnings("unused") Callback callback, int type) {
        stopBackgroundRFID();
        rfidReaderRequestType = type;
        Instance().startRFIDReader(getContext(), getRfidReaderCompletion(), getRfidReaderRequest());
    }

    private void readRFID(@SuppressWarnings("unused") Callback callback, int type) {
        backgroundRFIDEnabled = true;
        rfidReaderRequestType = type;
        startForegroundDispatch(getActivity());
    }

    private void stopRFIDReader(Callback callback) {
        Instance().stopRFIDReader(getContext());
        stopBackgroundRFID();
        callback.success();
    }

    private void providePACertificates(Callback callback, JSONArray certificates) throws JSONException {
        if (paCertificateCompletion == null) {
            callback.error("paCertificateCompletion is null");
            return;
        }
        paCertificateCompletion.onCertificatesReceived(arrayFromJSON(certificates, JSONConstructor::pkdCertificateFromJSON, new PKDCertificate[0]));
        callback.success();
    }

    private void provideTACertificates(Callback callback, JSONArray certificates) throws JSONException {
        if (taCertificateCompletion == null) {
            callback.error("taCertificateCompletion is null");
            return;
        }
        taCertificateCompletion.onCertificatesReceived(arrayFromJSON(certificates, JSONConstructor::pkdCertificateFromJSON, new PKDCertificate[0]));
        callback.success();
    }

    private void provideTASignature(Callback callback, String signature) {
        if (taSignatureCompletion == null) {
            callback.error("taSignatureCompletion is null");
            return;
        }
        taSignatureCompletion.onSignatureReceived(byteArrayFromBase64(signature));
        callback.success();
    }

    private void setTCCParams(Callback callback, final JSONObject params) {
        Instance().setTccParams(tccParamsFromJSON(params), (success, error) -> callback.success(toStringOrNull(generateSuccessCompletion(success, error))));
    }

    private void addPKDCertificates(Callback callback, JSONArray certificates) throws JSONException {
        Instance().addPKDCertificates(listFromJSON(certificates, JSONConstructor::pkdCertificateFromJSON));
        callback.success();
    }

    private void clearPKDCertificates(Callback callback) {
        Instance().clearPKDCertificates();
        callback.success();
    }

    private void startNewSession(Callback callback) {
        Instance().startNewSession();
        callback.success();
    }

    private void startBluetoothService(Callback callback) {
        BluetoothUtil.Companion.startBluetoothService(
                getActivity(),
                isBleManagerConnected -> {
                    sendEvent(bleOnServiceConnectedEvent, isBleManagerConnected);
                    return null;
                },
                () -> {
                    sendEvent(bleOnServiceDisconnectedEvent);
                    return null;
                },
                () -> {
                    sendEvent(bleOnDeviceReadyEvent);
                    return null;
                }
        );
        callback.success();
    }

    private void setLocalizationDictionary(Callback callback, JSONObject dictionary) {
        //noinspection DataFlowIssue
        localizationCallbacks = key -> dictionary == null ? null : dictionary.optString(key, null);
        Instance().setLocalizationCallback(localizationCallbacks);
        callback.success();
    }

    private void getLicense(Callback callback) {
        callback.success(toStringOrNull(generateLicense(Instance().license())));
    }

    private void getAvailableScenarios(Callback callback) throws JSONException {
        List<DocumentReaderScenario> scenarios = new ArrayList<>();
        for (DocumentReaderScenario scenario : Instance().availableScenarios)
            scenarios.add(CoreScenarioUtil.getScenario(scenario.name));
        callback.success(toStringOrNull(generateList(scenarios, JSONConstructor::generateDocumentReaderScenario)));
    }

    private void getIsRFIDAvailableForUse(Callback callback) {
        callback.success(Instance().isRFIDAvailableForUse());
    }

    private void getDocReaderVersion(Callback callback) {
        callback.success(toStringOrNull(generateDocReaderVersion(Instance().version)));
    }

    private void getDocReaderDocumentsDatabase(Callback callback) {
        if (Instance().version != null)
            //noinspection ConstantConditions
            callback.success(toStringOrNull(generateDocReaderDocumentsDatabase(Instance().version.database)));
        else
            callback.success(null);
    }
    
    private void textFieldValueByType(Callback callback, String raw, int fieldType) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByType(fieldType));
    }

    private void textFieldValueByTypeLcid(Callback callback, String raw, int fieldType, int lcid) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByType(fieldType, lcid));
    }

    private void textFieldValueByTypeSource(Callback callback, String raw, int fieldType, int source) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByTypeAndSource(fieldType, source));
    }

    private void textFieldValueByTypeLcidSource(Callback callback, String raw, int fieldType, int lcid, int source) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByType(fieldType, lcid, source));
    }

    private void textFieldValueByTypeSourceOriginal(Callback callback, String raw, int fieldType, int source, boolean original) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByTypeAndSource(fieldType, source, original));
    }

    private void textFieldValueByTypeLcidSourceOriginal(Callback callback, String raw, int fieldType, int lcid, int source, boolean original) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getTextFieldValueByType(fieldType, lcid, source, original));
    }

    private void textFieldByType(Callback callback, String raw, int fieldType) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        DocumentReaderTextField result = results.getTextFieldByType(fieldType);
        callback.success(toStringOrNull(generateDocumentReaderTextField(result, getContext())));
    }

    private void textFieldByTypeLcid(Callback callback, String raw, int fieldType, int lcid) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        DocumentReaderTextField result = results.getTextFieldByType(fieldType, lcid);
        callback.success(toStringOrNull(generateDocumentReaderTextField(result, getContext())));
    }

    private void graphicFieldByTypeSource(Callback callback, String raw, int fieldType, int source) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        DocumentReaderGraphicField result = results.getGraphicFieldByType(fieldType, source);
        callback.success(toStringOrNull(generateDocumentReaderGraphicField(result, getContext())));
    }

    private void graphicFieldByTypeSourcePageIndex(Callback callback, String raw, int fieldType, int source, int pageIndex) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        DocumentReaderGraphicField result = results.getGraphicFieldByType(fieldType, source, pageIndex);
        callback.success(toStringOrNull(generateDocumentReaderGraphicField(result, getContext())));
    }

    private void graphicFieldByTypeSourcePageIndexLight(Callback callback, String raw, int fieldType, int source, int pageIndex, int light) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        DocumentReaderGraphicField result = results.getGraphicFieldByType(fieldType, source, pageIndex, light);
        callback.success(toStringOrNull(generateDocumentReaderGraphicField(result, getContext())));
    }

    private void graphicFieldImageByType(Callback callback, String raw, int fieldType) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(bitmapToBase64(results.getGraphicFieldImageByType(fieldType)));
    }

    private void graphicFieldImageByTypeSource(Callback callback, String raw, int fieldType, int source) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(bitmapToBase64(results.getGraphicFieldImageByType(fieldType, source)));
    }

    private void graphicFieldImageByTypeSourcePageIndex(Callback callback, String raw, int fieldType, int source, int pageIndex) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(bitmapToBase64(results.getGraphicFieldImageByType(fieldType, source, pageIndex)));
    }

    private void graphicFieldImageByTypeSourcePageIndexLight(Callback callback, String raw, int fieldType, int source, int pageIndex, int light) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(bitmapToBase64(results.getGraphicFieldImageByType(fieldType, source, pageIndex, light)));
    }

    private void containers(Callback callback, String raw, JSONArray resultType) {
        try {
            DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
            callback.success(results.getContainers(intArrayFromJSON(resultType)));
        } catch (JSONException e) {
            e.printStackTrace();
            callback.error(e.getMessage());
        }
    }

    private void encryptedContainers(Callback callback, String raw) {
        DocumentReaderResults results = DocumentReaderResults.fromRawResults(raw);
        callback.success(results.getEncryptedContainers());
    }

    private void getTranslation(Callback callback, String className, int value) {
        switch (className) {
            case "RFIDErrorCodes" -> callback.success(eRFID_ErrorCodes.getTranslation(getContext(), value));
            case "LDSParsingErrorCodes" -> callback.success(eLDS_ParsingErrorCodes.getTranslation(getContext(), value));
            case "LDSParsingNotificationCodes" -> callback.success(eLDS_ParsingNotificationCodes.getTranslation(getContext(), value));
            case "ImageQualityCheckType" -> callback.success(eImageQualityCheckType.getTranslation(getContext(), value));
            case "RFIDDataFileType" -> callback.success(eRFID_DataFile_Type.getTranslation(getContext(), value));
            case "VisualFieldType" -> callback.success(eVisualFieldType.getTranslation(getContext(), value));
            case "LCID" -> callback.success(LCID.getTranslation(getContext(), value));
        }
    }

    private IDocumentReaderCompletion getCompletion() {
        return (action, results, error) -> {
            sendEvent(eventCompletion, generateCompletion(action, results, error, getContext()));
            if (action == DocReaderAction.ERROR || action == DocReaderAction.CANCEL || (action == DocReaderAction.COMPLETE && results != null && results.rfidResult == 1))
                stopBackgroundRFID();
        };
    }

    private IRfidReaderCompletion getRfidReaderCompletion() {
        return new IRfidReaderCompletion() {
            @Override
            public void onCompleted(int action, DocumentReaderResults results, DocumentReaderException error) {
                sendEvent(eventCompletion, generateCompletion(action, results, error, getContext()));
                if (action == DocReaderAction.ERROR || action == DocReaderAction.CANCEL || (action == DocReaderAction.COMPLETE && results != null && results.rfidResult == 1))
                    stopBackgroundRFID();
            }

            @Override
            public void onChipDetected() {
                sendEvent(rfidOnChipDetectedEvent);
            }

            @Override
            public void onRetryReadChip(@NonNull DocReaderRfidException error) {
                sendEvent(rfidOnRetryReadChipEvent, generateRegulaException(error));
            }

            @Override
            public void onProgress(@NonNull DocumentReaderNotification notification) {
                sendEvent(rfidOnProgressEvent, generateDocumentReaderNotification(notification));
            }
        };
    }

    private IDocumentReaderPrepareCompletion getPrepareCompletion(Callback callback) {
        return new IDocumentReaderPrepareCompletion() {
            @Override
            public void onPrepareProgressChanged(int progress) {
                if (progress != databaseDownloadProgress) {
                    sendEvent(eventDatabaseProgress, progress);
                    databaseDownloadProgress = progress;
                }
            }

            @Override
            public void onPrepareCompleted(boolean success, DocumentReaderException error) {
                callback.success(toStringOrNull(generateSuccessCompletion(success, error)));
            }
        };
    }

    private IDocumentReaderInitCompletion getInitCompletion(Callback callback) {
        return (success, error) -> {
            if (success) {
                Instance().setVideoEncoderCompletion((sessionId, file) -> sendEvent(eventVideoEncoderCompletion, file.getPath()));
                Instance().setOnClickListener(view -> sendEvent(onCustomButtonTappedEvent, view.getTag()));
                Config.setupScaleType();
            }
            callback.success(toStringOrNull(generateSuccessCompletion(success, error)));
        };
    }

    private IRfidReaderRequest getRfidReaderRequest() {
        if (rfidReaderRequestType == RfidReaderRequest.NULL) return null;
        return new IRfidReaderRequest() {
            @Override
            public void onRequestPACertificates(byte[] serialNumber, PAResourcesIssuer issuer, @NonNull IRfidPKDCertificateCompletion completion) {
                if (rfidReaderRequestType == RfidReaderRequest.FULL) {
                    paCertificateCompletion = completion;
                    sendEvent(eventPACertificateCompletion, generatePACertificateCompletion(serialNumber, issuer));
                }
                if (rfidReaderRequestType == RfidReaderRequest.NO_PA) {
                    paCertificateCompletion = null;
                    completion.onCertificatesReceived(null);
                }
            }

            @Override
            public void onRequestTACertificates(String keyCAR, @NonNull IRfidPKDCertificateCompletion completion) {
                taCertificateCompletion = completion;
                sendEvent(eventTACertificateCompletion, keyCAR);
            }

            @Override
            public void onRequestTASignature(TAChallenge challenge, @NonNull IRfidTASignatureCompletion completion) {
                taSignatureCompletion = completion;
                sendEvent(eventTASignatureCompletion, generateTAChallenge(challenge));
            }
        };
    }

    private int rfidReaderRequestType = RfidReaderRequest.NULL;

    // On native side we set RfidReaderRequest and allow user to ignore it
    // But if we set it and ignore, rfid will stop
    // So depending on how much of this callback the user wants to ignore, we
    // set null, full callback or callback with ignored onRequestPACertificates
    private static class RfidReaderRequest {
        public static final int NULL = 0;
        public static final int NO_PA = 1;
        public static final int FULL = 2;
    }

    // Weak references
    LocalizationCallbacks localizationCallbacks = null;
}