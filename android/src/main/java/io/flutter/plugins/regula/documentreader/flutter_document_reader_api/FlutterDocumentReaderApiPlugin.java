package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static com.regula.documentreader.api.DocumentReader.Instance;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.nfc.NfcAdapter;
import android.nfc.tech.IsoDep;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;

import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;

import com.regula.documentreader.api.completions.IDocumentReaderCompletion;
import com.regula.documentreader.api.completions.IDocumentReaderInitCompletion;
import com.regula.documentreader.api.completions.IDocumentReaderPrepareCompletion;
import com.regula.documentreader.api.completions.IRfidNotificationCompletion;
import com.regula.documentreader.api.completions.IRfidPKDCertificateCompletion;
import com.regula.documentreader.api.completions.IRfidReaderRequest;
import com.regula.documentreader.api.completions.IRfidTASignatureCompletion;
import com.regula.documentreader.api.enums.DocReaderAction;
import com.regula.documentreader.api.errors.DocumentReaderException;
import com.regula.documentreader.api.params.DocReaderConfig;
import com.regula.documentreader.api.params.ImageInputParam;
import com.regula.documentreader.api.params.rfid.PKDCertificate;
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer;
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge;
import com.regula.documentreader.api.parser.DocReaderResultsJsonParser;
import com.regula.documentreader.api.results.DocumentReaderResults;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

@SuppressWarnings({"unchecked", "NullableProblems", "ConstantConditions", "RedundantSuppression"})
public class FlutterDocumentReaderApiPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private ArrayList<Object> args;
    private boolean backgroundRFIDEnabled = false;
    private Activity activity;
    private EventChannel.EventSink eventDatabaseProgress;
    private EventChannel.EventSink eventCompletion;
    private EventChannel.EventSink eventVideoEncoderCompletion;
    private EventChannel.EventSink eventIRfidNotificationCompletion;
    private EventChannel.EventSink eventPACertificateCompletion;
    private EventChannel.EventSink eventTACertificateCompletion;
    private EventChannel.EventSink eventTASignatureCompletion;
    private IRfidPKDCertificateCompletion paCertificateCompletion;
    private IRfidPKDCertificateCompletion taCertificateCompletion;
    private IRfidTASignatureCompletion taSignatureCompletion;
    private static int databaseDownloadProgress = 0;

    public FlutterDocumentReaderApiPlugin() {
    }

    Activity getActivity() {
        return activity;
    }

    private Context getContext() {
        return activity;
    }

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/database_progress").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventDatabaseProgress = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/video_encoder_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventVideoEncoderCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/rfid_notification_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventIRfidNotificationCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/pa_certificate_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventPACertificateCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/ta_certificate_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventTACertificateCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/event/ta_signature_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventTASignatureCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_document_reader_api/method").setMethodCallHandler(this);
    }

    @Override
    public void onAttachedToActivity(ActivityPluginBinding binding) {
        activity = binding.getActivity();
        binding.addOnNewIntentListener(intent -> {
            if (intent.getAction() != null && intent.getAction().equals(NfcAdapter.ACTION_TECH_DISCOVERED) && backgroundRFIDEnabled)
                Instance().readRFID(IsoDep.get(intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)), getCompletion());
            return false;
        });
        ((HiddenLifecycleReference) binding.getLifecycle()).getLifecycle().addObserver((LifecycleEventObserver) (source, event) -> {
            if (event == Lifecycle.Event.ON_RESUME && backgroundRFIDEnabled)
                startForegroundDispatch(getActivity());
        });
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
    }

    @Override
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    }

    @Override
    public void onDetachedFromActivity() {
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
    }

    private interface Callback {
        void success(Object o);

        void error(String s);

        default void success() {
            success("");
        }
    }

    private JSONArray arrayListToJSONArray(ArrayList<?> list) {
        JSONArray result = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getClass().equals(java.util.HashMap.class))
                result.put(hashMapToJSONObject((HashMap<String, ?>) list.get(i)));
            else if (list.get(i).getClass().equals(java.util.ArrayList.class))
                result.put(arrayListToJSONArray((ArrayList<?>) list.get(i)));
            else
                result.put(list.get(i));
        }

        return result;
    }

    private JSONObject hashMapToJSONObject(HashMap<String, ?> map) {
        JSONObject result = new JSONObject();
        try {
            for (Map.Entry<String, ?> entry : map.entrySet()) {
                if (entry.getValue().getClass().equals(java.util.HashMap.class))
                    result.put(entry.getKey(), hashMapToJSONObject((HashMap<String, ?>) entry.getValue()));
                else if (entry.getValue().getClass().equals(java.util.ArrayList.class))
                    result.put(entry.getKey(), arrayListToJSONArray((ArrayList<?>) entry.getValue()));
                else
                    result.put(entry.getKey(), entry.getValue());
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    private <T> T args(int index) {
        if (args.get(index).getClass().equals(java.util.HashMap.class))
            return (T) hashMapToJSONObject((HashMap<String, ?>) args.get(index));
        if (args.get(index).getClass().equals(java.util.ArrayList.class))
            return (T) arrayListToJSONArray((ArrayList<?>) args.get(index));
        return (T) args.get(index);
    }

    private void sendCompletion(int action, DocumentReaderResults results, DocumentReaderException error) {
        if (eventCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventCompletion.success(JSONConstructor.generateCompletion(action, results, error, getContext()).toString()));
    }

    private void sendProgress(int progress) {
        if (eventDatabaseProgress != null)
            new Handler(Looper.getMainLooper()).post(() -> eventDatabaseProgress.success(progress + ""));
    }

    private void sendVideoEncoderCompletion(String sessionId, File file) {
        if (eventVideoEncoderCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventVideoEncoderCompletion.success(JSONConstructor.generateVideoEncoderCompletion(sessionId, file).toString()));
    }

    private void sendIRfidNotificationCompletion(int notification) {
        if (eventIRfidNotificationCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventIRfidNotificationCompletion.success(notification + ""));
    }

    private void sendPACertificateCompletion(byte[] serialNumber, PAResourcesIssuer issuer) {
        if (eventPACertificateCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventPACertificateCompletion.success(JSONConstructor.generatePACertificateCompletion(serialNumber, issuer).toString()));
    }

    private void sendTACertificateCompletion(String keyCAR) {
        if (eventTACertificateCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventTACertificateCompletion.success(keyCAR));
    }

    private void sendTASignatureCompletion(TAChallenge challenge) {
        if (eventTASignatureCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventTASignatureCompletion.success(JSONConstructor.generateTAChallenge(challenge).toString()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        String action = call.method;
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
                case "initializeReaderAutomatically":
                    initializeReaderAutomatically(callback);
                    break;
                case "getAPIVersion":
                    getAPIVersion(callback);
                    break;
                case "getAvailableScenarios":
                    getAvailableScenarios(callback);
                    break;
                case "isRFIDAvailableForUse":
                    isRFIDAvailableForUse(callback);
                    break;
                case "getCoreMode":
                    getCoreMode(callback);
                    break;
                case "getCoreVersion":
                    getCoreVersion(callback);
                    break;
                case "getDatabaseDate":
                    getDatabaseDate(callback);
                    break;
                case "getDatabaseID":
                    getDatabaseID(callback);
                    break;
                case "getDatabaseVersion":
                    getDatabaseVersion(callback);
                    break;
                case "getDocumentReaderIsReady":
                    getDocumentReaderIsReady(callback);
                    break;
                case "getDocumentReaderStatus":
                    getDocumentReaderStatus(callback);
                    break;
                case "getDatabaseCountriesNumber":
                    getDatabaseCountriesNumber(callback);
                    break;
                case "getDatabaseDocumentsNumber":
                    getDatabaseDocumentsNumber(callback);
                    break;
                case "selectedScenario":
                    selectedScenario(callback);
                    break;
                case "getSessionLogFolder":
                    getSessionLogFolder(callback);
                    break;
                case "getDatabaseDescription":
                    getDatabaseDescription(callback);
                    break;
                case "showScanner":
                    showScanner(callback);
                    break;
                case "startNewPage":
                    startNewPage(callback);
                    break;
                case "startNewSession":
                    startNewSession(callback);
                    break;
                case "startRFIDReader":
                    startRFIDReader(callback);
                    break;
                case "stopRFIDReader":
                    stopRFIDReader(callback);
                    break;
                case "stopScanner":
                    stopScanner(callback);
                    break;
                case "deinitializeReader":
                    deinitializeReader(callback);
                    break;
                case "isAuthenticatorAvailableForUse":
                    isAuthenticatorAvailableForUse(callback);
                    break;
                case "getConfig":
                    getConfig(callback);
                    break;
                case "getRfidScenario":
                    getRfidScenario(callback);
                    break;
                case "getLicenseExpiryDate":
                    getLicenseExpiryDate(callback);
                    break;
                case "getLicenseCountryFilter":
                    getLicenseCountryFilter(callback);
                    break;
                case "licenseIsRfidAvailable":
                    licenseIsRfidAvailable(callback);
                    break;
                case "getCameraSessionIsPaused":
                    getCameraSessionIsPaused(callback);
                    break;
                case "removeDatabase":
                    removeDatabase(callback);
                    break;
                case "cancelDBUpdate":
                    cancelDBUpdate(callback);
                    break;
                case "resetConfiguration":
                    resetConfiguration(callback);
                    break;
                case "clearPKDCertificates":
                    clearPKDCertificates(callback);
                    break;
                case "readRFID":
                    readRFID(callback);
                    break;
                case "getRfidSessionStatus":
                    getRfidSessionStatus(callback);
                    break;
                case "setRfidDelegate":
                    setRfidDelegate(callback, args(0));
                    break;
                case "setEnableCoreLogs":
                    setEnableCoreLogs(callback, args(0));
                    break;
                case "addPKDCertificates":
                    addPKDCertificates(callback, args(0));
                    break;
                case "setCameraSessionIsPaused":
                    setCameraSessionIsPaused(callback, args(0));
                    break;
                case "getScenario":
                    getScenario(callback, args(0));
                    break;
                case "recognizeImages":
                    recognizeImages(callback, args(0));
                    break;
                case "showScannerWithCameraID":
                    showScannerWithCameraID(callback, args(0));
                    break;
                case "runAutoUpdate":
                    runAutoUpdate(callback, args(0));
                    break;
                case "setConfig":
                    setConfig(callback, args(0));
                    break;
                case "setRfidScenario":
                    setRfidScenario(callback, args(0));
                    break;
                case "initializeReader":
                    initializeReader(callback, args(0));
                    break;
                case "prepareDatabase":
                    prepareDatabase(callback, args(0));
                    break;
                case "recognizeImage":
                    recognizeImage(callback, args(0));
                    break;
                case "setRfidSessionStatus":
                    setRfidSessionStatus(callback, args(0));
                    break;
                case "providePACertificates":
                    providePACertificates(callback, args(0));
                    break;
                case "provideTACertificates":
                    provideTACertificates(callback, args(0));
                    break;
                case "provideTASignature":
                    provideTASignature(callback, args(0));
                    break;
                case "parseCoreResults":
                    parseCoreResults(callback, args(0));
                    break;
                case "initializeReaderWithDatabasePath":
                    initializeReaderWithDatabasePath(callback, args(0), args(1));
                    break;
                case "initializeReaderWithDatabase":
                    initializeReaderWithDatabase(callback, args(0), args(1));
                    break;
                case "recognizeImageFrame":
                    recognizeImageFrame(callback, args(0), args(1));
                    break;
                case "recognizeImageWithOpts":
                    recognizeImageWithOpts(callback, args(0), args(1));
                    break;
                case "recognizeVideoFrame":
                    recognizeVideoFrame(callback, args(0), args(1));
                    break;
                case "showScannerWithCameraIDAndOpts":
                    showScannerWithCameraIDAndOpts(callback, args(0), args(1));
                    break;
                case "recognizeImageWithImageInputParams":
                    recognizeImageWithImageInputParams(callback, args(0), args(1));
                    break;
                case "recognizeImageWithCameraMode":
                    recognizeImageWithCameraMode(callback, args(0), args(1));
                    break;
            }
        } catch (Exception ignored) {
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
        intent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        @SuppressLint("UnspecifiedImmutableFlag")
        PendingIntent pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, intent, 0);
        NfcAdapter.getDefaultAdapter(getActivity()).enableForegroundDispatch(activity, pendingIntent, filters, techList);
    }

    private void stopBackgroundRFID() {
        if (!backgroundRFIDEnabled)
            return;
        NfcAdapter.getDefaultAdapter(getActivity()).disableForegroundDispatch(getActivity());
        backgroundRFIDEnabled = false;
    }

    private void initializeReaderAutomatically(Callback callback) {
        if (!Instance().isReady())
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
        else
            callback.success("already initialized");
    }

    private void getAvailableScenarios(Callback callback) throws JSONException {
        callback.success(JSONConstructor.generateList(Instance().availableScenarios, JSONConstructor::generateDocumentReaderScenario).toString());
    }

    private void parseCoreResults(Callback callback, String json) {
        DocumentReaderResults results = (DocumentReaderResults) DocReaderResultsJsonParser.parseCoreResults(json).get("docReaderResults");
        callback.success(JSONConstructor.generateDocumentReaderResults(results, getContext()).toString());
    }

    private void getAPIVersion(Callback callback) {
        callback.success(Instance().version.api);
    }

    private void getCoreVersion(Callback callback) {
        callback.success(Instance().version.core);
    }

    private void getCoreMode(Callback callback) {
        callback.success(Instance().version.coreMode);
    }

    private void getDatabaseID(Callback callback) {
        callback.success(Instance().version.database.databaseID);
    }

    private void getDatabaseVersion(Callback callback) {
        callback.success(Instance().version.database.version);
    }

    private void getDatabaseDate(Callback callback) {
        callback.success(Instance().version.database.date);
    }

    private void getDatabaseDescription(Callback callback) {
        callback.success(Instance().version.database.databaseDescription);
    }

    private void getDatabaseCountriesNumber(Callback callback) {
        callback.success(Instance().version.database.countriesNumber);
    }

    private void getDatabaseDocumentsNumber(Callback callback) {
        callback.success(Instance().version.database.documentsNumber);
    }

    private void deinitializeReader(Callback callback) {
        Instance().deinitializeReader();
        callback.success();
    }

    private void isAuthenticatorAvailableForUse(Callback callback) {
        callback.success(Instance().isAuthenticatorAvailableForUse());
    }

    private void getConfig(Callback callback) throws JSONException {
        callback.success(RegulaConfig.getConfig(Instance()).toString());
    }

    private void getRfidScenario(Callback callback) {
        callback.success(Instance().rfidScenario().toJson());
    }

    private void selectedScenario(Callback callback) {
        callback.success(JSONConstructor.generateDocumentReaderScenarioFull(Instance().getScenario(Instance().processParams().getScenario())).toString());
    }

    private void getScenario(Callback callback, String scenario) {
        callback.success(JSONConstructor.generateDocumentReaderScenarioFull(Instance().getScenario(scenario)).toString());
    }

    private void getLicenseExpiryDate(Callback callback) {
        if (Instance().license().getExpiryDate() == null)
            callback.error("null");
        else
            callback.success(Instance().license().getExpiryDate().toString());
    }

    private void getLicenseCountryFilter(Callback callback) {
        if (Instance().license().getCountryFilter() == null)
            callback.error("null");
        else
            callback.success(JSONConstructor.generateList(Instance().license().getCountryFilter()).toString());
    }

    private void licenseIsRfidAvailable(Callback callback) {
        callback.success(Instance().license().isRfidAvailable());
    }

    private void getDocumentReaderIsReady(Callback callback) {
        callback.success(Instance().isReady());
    }

    private void getDocumentReaderStatus(Callback callback) {
        callback.success(Instance().isReady());
    }

    private void isRFIDAvailableForUse(Callback callback) {
        callback.success(Instance().isRFIDAvailableForUse());
    }

    private void initializeReader(Callback callback, Object license) {
        if (!Instance().isReady())
            Instance().initializeReader(getContext(), new DocReaderConfig(Base64.decode(license.toString(), Base64.DEFAULT)), getInitCompletion(callback));
        else
            callback.success("already initialized");
    }

    private void initializeReaderWithDatabase(Callback callback, Object license, Object db) {
        if (!Instance().isReady())
            Instance().initializeReader(getContext(), new DocReaderConfig(Base64.decode(license.toString(), Base64.DEFAULT), Base64.decode(db.toString(), Base64.DEFAULT)), getInitCompletion(callback));
        else
            callback.success("already initialized");
    }

    private void startNewSession(Callback callback) {
        Instance().startNewSession();
        callback.success();
    }

    private void startNewPage(Callback callback) {
        Instance().startNewPage();
        callback.success();
    }

    private void recognizeImageWithImageInputParams(@SuppressWarnings("unused") Callback callback, String base64Image, final JSONObject params) throws JSONException {
        Instance().recognizeImage(Helpers.bitmapFromBase64(base64Image), new ImageInputParam(params.getInt("width"), params.getInt("height"), params.getInt("type")), getCompletion());
    }

    private void recognizeImageWithOpts(Callback callback, String base64Image, final JSONObject opts) throws JSONException {
        RegulaConfig.setConfig(Instance(), opts, getContext());
        recognizeImage(callback, base64Image);
    }

    private void recognizeImage(@SuppressWarnings("unused") Callback callback, String base64Image) {
        stopBackgroundRFID();
        Instance().recognizeImage(Helpers.bitmapFromBase64(base64Image), getCompletion());
    }

    private void recognizeImages(@SuppressWarnings("unused") Callback callback, JSONArray base64Images) throws JSONException {
        stopBackgroundRFID();
        Bitmap[] images = new Bitmap[base64Images.length()];
        for (int i = 0; i < images.length; i++)
            images[i] = Helpers.bitmapFromBase64(base64Images.getString(i));
        Instance().recognizeImages(images, getCompletion());
    }

    private void removeDatabase(Callback callback) {
        callback.success(Instance().removeDatabase(getContext()));
    }

    private void cancelDBUpdate(Callback callback) {
        callback.success(Instance().cancelDBUpdate());
    }

    private void resetConfiguration(Callback callback) {
        Instance().resetConfiguration();
        callback.success();
    }

    private void setEnableCoreLogs(Callback callback, boolean enableLogs) {
        Instance().setEnableCoreLogs(enableLogs);
        callback.success();
    }

    private void addPKDCertificates(Callback callback, JSONArray certificatesJSON) throws JSONException {
        List<PKDCertificate> certificates = new ArrayList<>();
        for (int i = 0; i < certificatesJSON.length(); i++) {
            JSONObject certificate = certificatesJSON.getJSONObject(i);
            certificates.add(new PKDCertificate(Base64.decode(certificate.get("binaryData").toString(), Base64.DEFAULT), certificate.getInt("resourceType"), certificate.has("privateKey") ? Base64.decode(certificate.get("privateKey").toString(), Base64.DEFAULT) : null));
        }
        Instance().addPKDCertificates(certificates);
        callback.success();
    }

    private void clearPKDCertificates(Callback callback) {
        Instance().clearPKDCertificates();
        callback.success();
    }

    private void recognizeImageFrame(@SuppressWarnings("unused") Callback callback, String base64Image, final JSONObject opts) throws JSONException {
        Instance().recognizeImageFrame(Helpers.bitmapFromBase64(base64Image), new ImageInputParam(opts.getInt("width"), opts.getInt("height"), opts.getInt("type")), getCompletion());
    }

    private void recognizeVideoFrame(@SuppressWarnings("unused") Callback callback, String byteString, final JSONObject opts) throws JSONException {
        stopBackgroundRFID();
        Instance().recognizeVideoFrame(byteString.getBytes(), new ImageInputParam(opts.getInt("width"), opts.getInt("height"), opts.getInt("type")), getCompletion());
    }

    private void showScannerWithCameraID(@SuppressWarnings("unused") Callback callback, int cameraID) {
        stopBackgroundRFID();
        Instance().showScanner(getContext(), cameraID, getCompletion());
    }

    private void showScanner(Callback callback) {
        showScannerWithCameraID(callback, -1);
    }

    private void showScannerWithCameraIDAndOpts(@SuppressWarnings("unused") Callback callback, int cameraID, final JSONObject opts) throws JSONException {
        stopBackgroundRFID();
        RegulaConfig.setConfig(Instance(), opts, getContext());
        Instance().showScanner(getContext(), cameraID, getCompletion());
    }

    private void stopScanner(Callback callback) {
        Instance().stopScanner(getContext());
        callback.success();
    }

    private void startRFIDReader(@SuppressWarnings("unused") Callback callback) {
        stopBackgroundRFID();
        IRfidReaderRequest delegate = null;
        if (rfidDelegate == RFIDDelegate.NO_PA)
            delegate = getIRfidReaderRequestNoPA();
        if (rfidDelegate == RFIDDelegate.FULL)
            delegate = getIRfidReaderRequest();
        Instance().startRFIDReader(getContext(), getCompletion(), delegate, getIRfidNotificationCompletion());
    }

    private void stopRFIDReader(Callback callback) {
        Instance().stopRFIDReader(getContext());
        stopBackgroundRFID();
        callback.success();
    }

    private void prepareDatabase(Callback callback, String dbID) {
        Instance().prepareDatabase(getContext(), dbID, getPrepareCompletion(callback));
    }

    private void runAutoUpdate(Callback callback, String dbID) {
        Instance().runAutoUpdate(getContext(), dbID, getPrepareCompletion(callback));
    }

    private void setRfidScenario(Callback callback, final JSONObject opts) throws JSONException {
        RegulaConfig.setRfidScenario(opts);
        callback.success();
    }

    private void getSessionLogFolder(Callback callback) {
        callback.success(Instance().processParams().sessionLogFolder);
    }

    private void setConfig(Callback callback, final JSONObject opts) throws JSONException {
        RegulaConfig.setConfig(Instance(), opts, getContext());
        callback.success();
    }

    private void readRFID(@SuppressWarnings("unused") Callback callback) {
        backgroundRFIDEnabled = true;
        startForegroundDispatch(getActivity());
    }

    private void providePACertificates(Callback callback, JSONArray certificatesJSON) throws JSONException {
        if (paCertificateCompletion == null) {
            callback.error("paCertificateCompletion is null");
            return;
        }
        PKDCertificate[] certificates = new PKDCertificate[certificatesJSON.length()];
        for (int i = 0; i < certificatesJSON.length(); i++) {
            JSONObject certificate = certificatesJSON.getJSONObject(i);
            certificates[i] = new PKDCertificate(Base64.decode(certificate.get("binaryData").toString(), Base64.DEFAULT), certificate.getInt("resourceType"), certificate.has("privateKey") ? Base64.decode(certificate.get("privateKey").toString(), Base64.DEFAULT) : null);
        }
        paCertificateCompletion.onCertificatesReceived(certificates);
        callback.success();
    }

    private void provideTACertificates(Callback callback, JSONArray certificatesJSON) throws JSONException {
        if (taCertificateCompletion == null) {
            callback.error("taCertificateCompletion is null");
            return;
        }
        PKDCertificate[] certificates = new PKDCertificate[certificatesJSON.length()];
        for (int i = 0; i < certificatesJSON.length(); i++) {
            JSONObject certificate = certificatesJSON.getJSONObject(i);
            certificates[i] = new PKDCertificate(Base64.decode(certificate.get("binaryData").toString(), Base64.DEFAULT), certificate.getInt("resourceType"), certificate.has("privateKey") ? Base64.decode(certificate.get("privateKey").toString(), Base64.DEFAULT) : null);
        }
        taCertificateCompletion.onCertificatesReceived(certificates);
        callback.success();
    }

    private void provideTASignature(Callback callback, Object signature) {
        if (taSignatureCompletion == null) {
            callback.error("taSignatureCompletion is null");
            return;
        }
        taSignatureCompletion.onSignatureReceived(Base64.decode(signature.toString(), Base64.DEFAULT));
        callback.success();
    }

    private void setCameraSessionIsPaused(Callback callback, @SuppressWarnings("unused") boolean ignored) {
        callback.error("setCameraSessionIsPaused() is an ios-only method");
    }

    private void setRfidDelegate(Callback callback, int delegate) {
        rfidDelegate = delegate;
        callback.success();
    }

    private void getCameraSessionIsPaused(Callback callback) {
        callback.error("getCameraSessionIsPaused() is an ios-only method");
    }

    @SuppressWarnings("unused")
    private void recognizeImageWithCameraMode(Callback callback, String base64, boolean mode) {
        callback.error("recognizeImageWithCameraMode() is an ios-only method");
    }

    @SuppressWarnings("unused")
    private void initializeReaderWithDatabasePath(Callback callback, Object license, String path) {
        callback.error("initializeReaderWithDatabasePath() is an ios-only method");
    }

    @SuppressWarnings("unused")
    private void setRfidSessionStatus(Callback callback, String s) {
        callback.error("setRfidSessionStatus() is an ios-only method");
    }

    private void getRfidSessionStatus(Callback callback) {
        callback.error("getRfidSessionStatus() is an ios-only method");
    }

    private IDocumentReaderCompletion getCompletion() {
        return (action, results, error) -> {
            sendCompletion(action, results, error);
            if (action == DocReaderAction.ERROR || action == DocReaderAction.CANCEL || (action == DocReaderAction.COMPLETE && results.rfidResult == 1))
                stopBackgroundRFID();
        };
    }

    private IDocumentReaderPrepareCompletion getPrepareCompletion(Callback callback) {
        return new IDocumentReaderPrepareCompletion() {
            @Override
            public void onPrepareProgressChanged(int progress) {
                if (progress != databaseDownloadProgress) {
                    sendProgress(progress);
                    databaseDownloadProgress = progress;
                }
            }

            @Override
            public void onPrepareCompleted(boolean status, DocumentReaderException error) {
                if (status)
                    callback.success("database prepared");
                else
                    callback.error("database preparation failed: " + error.toString());
            }
        };
    }

    private IDocumentReaderInitCompletion getInitCompletion(Callback callback) {
        return (success, error) -> {
            if (success) {
                Instance().setVideoEncoderCompletion(this::sendVideoEncoderCompletion);
                callback.success("init completed");
            } else
                callback.error("Init failed:" + error);
        };
    }

    private IRfidReaderRequest getIRfidReaderRequest() {
        return new IRfidReaderRequest() {
            @Override
            public void onRequestPACertificates(byte[] serialNumber, PAResourcesIssuer issuer, @NonNull IRfidPKDCertificateCompletion completion) {
                paCertificateCompletion = completion;
                completion.onCertificatesReceived(new PKDCertificate[0]);
                sendPACertificateCompletion(serialNumber, issuer);
            }

            @Override
            public void onRequestTACertificates(String keyCAR, @NonNull IRfidPKDCertificateCompletion completion) {
                taCertificateCompletion = completion;
                sendTACertificateCompletion(keyCAR);
            }

            @Override
            public void onRequestTASignature(TAChallenge challenge, @NonNull IRfidTASignatureCompletion completion) {
                taSignatureCompletion = completion;
                sendTASignatureCompletion(challenge);
            }
        };
    }

    private IRfidReaderRequest getIRfidReaderRequestNoPA() {
        return new IRfidReaderRequest() {
            @Override
            public void onRequestPACertificates(byte[] serialNumber, PAResourcesIssuer issuer, @NonNull IRfidPKDCertificateCompletion completion) {
                paCertificateCompletion = null;
                completion.onCertificatesReceived(new PKDCertificate[0]);
            }

            @Override
            public void onRequestTACertificates(String keyCAR, @NonNull IRfidPKDCertificateCompletion completion) {
                taCertificateCompletion = completion;
                sendTACertificateCompletion(keyCAR);
            }

            @Override
            public void onRequestTASignature(TAChallenge challenge, @NonNull IRfidTASignatureCompletion completion) {
                taSignatureCompletion = completion;
                sendTASignatureCompletion(challenge);
            }
        };
    }

    private static int rfidDelegate = RFIDDelegate.NULL;

    private static class RFIDDelegate {
        public static final int NULL = 0;
        public static final int NO_PA = 1;
        public static final int FULL = 2;
    }


    private IRfidNotificationCompletion getIRfidNotificationCompletion() {
        return (notificationType, value) -> sendIRfidNotificationCompletion(notificationType);
    }
}