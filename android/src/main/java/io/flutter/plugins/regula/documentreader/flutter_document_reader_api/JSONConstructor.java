package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static com.regula.documentreader.api.completions.IRfidNotificationCompletion.RFID_EXTRA_ERROR_CODE;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Base64;

import com.regula.documentreader.api.enums.DocReaderAction;
import com.regula.documentreader.api.enums.PDF417Info;
import com.regula.documentreader.api.enums.eGraphicFieldType;
import com.regula.documentreader.api.enums.eRPRM_Lights;
import com.regula.documentreader.api.errors.DocumentReaderException;
import com.regula.documentreader.api.internal.core.CoreDetailedScenario;
import com.regula.documentreader.api.params.FaceMetaData;
import com.regula.documentreader.api.params.rfid.authorization.PAAttribute;
import com.regula.documentreader.api.params.rfid.authorization.PAResourcesIssuer;
import com.regula.documentreader.api.params.rfid.authorization.TAChallenge;
import com.regula.documentreader.api.results.Bounds;
import com.regula.documentreader.api.results.BytesData;
import com.regula.documentreader.api.results.Coordinate;
import com.regula.documentreader.api.results.DocReaderFieldRect;
import com.regula.documentreader.api.results.DocumentReaderBarcodeField;
import com.regula.documentreader.api.results.DocumentReaderBarcodeResult;
import com.regula.documentreader.api.results.DocumentReaderDocumentType;
import com.regula.documentreader.api.results.DocumentReaderGraphicField;
import com.regula.documentreader.api.results.DocumentReaderGraphicResult;
import com.regula.documentreader.api.results.DocumentReaderNotification;
import com.regula.documentreader.api.results.DocumentReaderResults;
import com.regula.documentreader.api.results.DocumentReaderResultsStatus;
import com.regula.documentreader.api.results.DocumentReaderScenario;
import com.regula.documentreader.api.results.DocumentReaderTextField;
import com.regula.documentreader.api.results.DocumentReaderTextResult;
import com.regula.documentreader.api.results.DocumentReaderValue;
import com.regula.documentreader.api.results.ElementPosition;
import com.regula.documentreader.api.results.ImageQuality;
import com.regula.documentreader.api.results.ImageQualityGroup;
import com.regula.documentreader.api.results.VDSNCData;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityCheck;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityElement;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityResult;
import com.regula.documentreader.api.results.rfid.AccessControlProcedureType;
import com.regula.documentreader.api.results.rfid.Application;
import com.regula.documentreader.api.results.rfid.Attribute;
import com.regula.documentreader.api.results.rfid.Authority;
import com.regula.documentreader.api.results.rfid.CardProperties;
import com.regula.documentreader.api.results.rfid.CertificateChain;
import com.regula.documentreader.api.results.rfid.CertificateData;
import com.regula.documentreader.api.results.rfid.Extension;
import com.regula.documentreader.api.results.rfid.File;
import com.regula.documentreader.api.results.rfid.FileData;
import com.regula.documentreader.api.results.rfid.RFIDSessionData;
import com.regula.documentreader.api.results.rfid.RFIDSessionDataStatus;
import com.regula.documentreader.api.results.rfid.SecurityObject;
import com.regula.documentreader.api.results.rfid.SecurityObjectCertificates;
import com.regula.documentreader.api.results.rfid.SignerInfo;
import com.regula.documentreader.api.results.rfid.Validity;
import com.regula.documentreader.api.results.rfid.Value;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SuppressWarnings({"ConstantConditions", "unused", "RedundantSuppression"})
class JSONConstructor {
    interface JSONObjectGeneratorWithContext<T> {
        JSONObject generateJSONObject(T param, Context context) throws JSONException;
    }

    interface JSONObjectGenerator<T> {
        JSONObject generateJSONObject(T param) throws JSONException;
    }

    interface StringGenerator<T> {
        String generateString(T param);
    }

    static <T> JSONArray generateList(List<T> list) {
        JSONArray result = new JSONArray();
        if(list == null) return result;
        for (T t : list)
            if (t != null)
                result.put(t);

        return result;
    }

    static <T> JSONArray generateList(List<T> list, JSONObjectGenerator<T> generator) throws JSONException {
        JSONArray result = new JSONArray();
        if(list == null) return result;
        for (T t : list)
            if (t != null)
                result.put(generator.generateJSONObject(t));

        return result;
    }

    static <T> JSONArray generateList(List<T> list, StringGenerator<T> generator) {
        JSONArray result = new JSONArray();
        if(list == null) return result;
        for (T t : list)
            if (t != null)
                result.put(generator.generateString(t));

        return result;
    }

    static <T> JSONArray generateList(List<T> list, JSONObjectGeneratorWithContext<T> generator, Context context) throws JSONException {
        JSONArray result = new JSONArray();
        if(list == null) return result;
        for (T t : list)
            if (t != null)
                result.put(generator.generateJSONObject(t, context));

        return result;
    }

    static <T> JSONArray generateArray(T[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static <T> JSONArray generateArray(T[] array, JSONObjectGenerator<T> generator) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, generator.generateJSONObject(array[i]));

        return result;
    }

    static <T> JSONArray generateArray(T[] array, StringGenerator<T> generator) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, generator.generateString(array[i]));

        return result;
    }

    static <T> JSONArray generateArray(T[] array, JSONObjectGeneratorWithContext<T> generator, Context context) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, generator.generateJSONObject(array[i], context));

        return result;
    }

    static <T, V> JSONObject generateMap(Map<T, V> map) throws JSONException {
        JSONObject result = new JSONObject();
        if(map == null) return result;
        for (Map.Entry<T, V> entry : map.entrySet())
            if (entry != null)
                result.put(entry.getKey().toString(), entry.getValue());
        return result;
    }

    static <T, V> JSONObject generateMap(Map<T, V> map, JSONObjectGenerator<V> generator) throws JSONException {
        JSONObject result = new JSONObject();
        if(map == null) return result;
        for (Map.Entry<T, V> entry : map.entrySet())
            if (entry != null)
                result.put(entry.getKey().toString(), generator.generateJSONObject(entry.getValue()));
        return result;
    }

    static <T, V> JSONObject generateMap(Map<T, V> map, StringGenerator<V> generator) throws JSONException {
        JSONObject result = new JSONObject();
        if(map == null) return result;
        for (Map.Entry<T, V> entry : map.entrySet())
            if (entry != null)
                result.put(entry.getKey().toString(), generator.generateString(entry.getValue()));
        return result;
    }

    static <T, V> JSONObject generateMap(Map<T, V> map, JSONObjectGeneratorWithContext<V> generator, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        if(map == null) return result;
        for (Map.Entry<T, V> entry : map.entrySet())
            if (entry != null)
                result.put(entry.getKey().toString(), generator.generateJSONObject(entry.getValue(), context));
        return result;
    }

    static JSONArray generateIntArray(int[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONArray generateBooleanArray(boolean[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONArray generateDoubleArray(double[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONArray generateByteArray(byte[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONArray generateLongArray(long[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if(array == null) return result;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static String generateBitmap(Bitmap bitmap) {
        if (bitmap == null) return "";
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();

        return Base64.encodeToString(byteArray, Base64.DEFAULT);
    }

    static Bitmap BitmapFromJSON(String base64) {
        byte[] decodedString = Base64.decode(base64, Base64.DEFAULT);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        Bitmap result = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length, options);
        int sizeMultiplier = result.getByteCount() / 5000000;
        if (result.getByteCount() > 5000000)
            result = Bitmap.createScaledBitmap(result, result.getWidth() / (int) Math.sqrt(sizeMultiplier), result.getHeight() / (int) Math.sqrt(sizeMultiplier), false);
        return result;
    }

    static JSONObject generateVideoEncoderCompletion(String sessionId, java.io.File file) {
        JSONObject result = new JSONObject();

        try {
            result.put("sessionId", sessionId);
            result.put("filePath", file.getPath());

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return result;
    }

    static JSONObject generateCompletion(int action, DocumentReaderResults results, DocumentReaderException error, Context context) {
        JSONObject result = new JSONObject();
        try {
            result.put("action", action);
            switch (action) {
                case DocReaderAction.PROCESS:
                case DocReaderAction.PROCESS_WHITE_UV_IMAGES:
                    break;
                case DocReaderAction.NOTIFICATION:
                    result.put("results", generateDocumentReaderResultsNotification(results));
                    break;
                case DocReaderAction.COMPLETE:
                case DocReaderAction.MORE_PAGES_AVAILABLE:
                case DocReaderAction.CANCEL:
                case DocReaderAction.ERROR:
                    result.put("results", generateDocumentReaderResults(results, context));
                    break;
            }
            if (error != null)
                result.put("error", generateDocumentReaderException(error));
        } catch (JSONException ignored) {
        }

        return result;
    }

    static JSONObject generateRfidNotificationCompletion(int notification, Bundle value) {
        JSONObject result = new JSONObject();
        try {
            result.put("notification", notification);
            if(value != null)
            result.put("value", value.get(RFID_EXTRA_ERROR_CODE));
        } catch (JSONException ignored) {
        }

        return result;
    }

    static JSONObject generatePACertificateCompletion(byte[] serialNumber, PAResourcesIssuer issuer) {
        JSONObject result = new JSONObject();
        try {
            result.put("serialNumber", generateByteArray(serialNumber));
            result.put("issuer", generatePAResourcesIssuer(issuer));
        } catch (JSONException ignored) {
        }

        return result;
    }

    static JSONObject generateDocumentReaderResultsNotification(DocumentReaderResults results) throws JSONException {
        if (results != null && results.documentReaderNotification != null)
            return new JSONObject().put("documentReaderNotification", generateDocumentReaderNotification(results.documentReaderNotification));
        return new JSONObject();
    }

    static DocumentReaderNotification DocumentReaderNotificationFromJSON(JSONObject jsonObject) {
        DocumentReaderNotification result = new DocumentReaderNotification();
        try {
            if (jsonObject.has("value"))
                result.value = jsonObject.getInt("value");
        } catch (JSONException ignored) {
        }
        return result;
    }

    static Throwable ThrowableFromJSON(JSONObject jsonObject) {
        return new Throwable();
    }

    static StackTraceElement StackTraceElementFromJSON(JSONObject jsonObject) {
        return null;
    }

    // To JSON

    static JSONObject generateDocumentReaderScenario(DocumentReaderScenario input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("name", input.name);
            result.put("caption", input.caption);
            result.put("description", input.description);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCoreDetailedScenario(CoreDetailedScenario input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("uvTorch", input.uvTorch);
            result.put("frameOrientation", input.frameOrientation);
            result.put("faceExt", input.faceExt);
            result.put("multiPageOff", input.multiPageOff);
            result.put("seriesProcessMode", input.seriesProcessMode);
            result.put("frameKWHLandscape", input.frameKWHLandscape);
            result.put("frameKWHPortrait", input.frameKWHPortrait);
            result.put("frameKWHDoublePageSpreadPortrait", input.frameKWHDoublePageSpreadPortrait);
            result.put("frameKWHDoublePageSpreadLandscape", input.frameKWHDoublePageSpreadLandscape);
            result.put("name", input.name);
            result.put("caption", input.caption);
            result.put("description", input.description);
            result.put("manualCrop", input.manualCrop);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateFaceMetaData(FaceMetaData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("ID", input.ID);
            result.put("rollAngle", input.rollAngle);
            result.put("bounds", generateBounds(input.bounds));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateBounds(Bounds input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("x", input.x);
            result.put("y", input.y);
            result.put("width", input.width);
            result.put("height", input.height);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateRect(Rect input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("bottom", input.bottom);
            result.put("top", input.top);
            result.put("left", input.left);
            result.put("right", input.right);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocReaderFieldRect(DocReaderFieldRect input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("bottom", input.bottom);
            result.put("top", input.top);
            result.put("left", input.left);
            result.put("right", input.right);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderGraphicField(DocumentReaderGraphicField input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("sourceType", input.sourceType);
            result.put("fieldType", input.fieldType);
            result.put("lightType", input.light);
            result.put("pageIndex", input.pageIndex);
            result.put("fieldName", eGraphicFieldType.getTranslation(context, input.fieldType));
            result.put("lightName", eRPRM_Lights.getTranslation(context, input.light));
            result.put("value", input.imageBase64());
            result.put("fieldRect", generateDocReaderFieldRect(input.boundRect));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderGraphicResult(DocumentReaderGraphicResult input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderGraphicField, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderValue(DocumentReaderValue input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("pageIndex", input.pageIndex);
            result.put("sourceType", input.sourceType);
            result.put("validity", input.validity);
            result.put("probability", input.probability);
            result.put("value", input.value);
            result.put("originalValue", input.originalValue);
            result.put("boundRect", generateRect(input.boundRect));
            result.put("comparison", generateMap(input.comparison));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderTextField(DocumentReaderTextField input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("fieldType", input.fieldType);
            result.put("lcid", input.lcid);
            result.put("status", input.status);
            result.put("lcidName", input.getLcidName(context));
            result.put("fieldName", input.getFieldName(context));
            result.put("value", generateDocumentReaderValue(input.value()));
            result.put("values", generateList(input.values, JSONConstructor::generateDocumentReaderValue));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderTextResult(DocumentReaderTextResult input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("status", input.status);
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderTextField, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCoordinate(Coordinate input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("x", input.x);
            result.put("y", input.y);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateElementPosition(ElementPosition input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("docFormat", input.docFormat);
            result.put("width", input.width);
            result.put("height", input.height);
            result.put("dpi", input.dpi);
            result.put("pageIndex", input.pageIndex);
            result.put("inverse", input.inverse);
            result.put("perspectiveTr", input.perspectiveTr);
            result.put("objArea", input.objArea);
            result.put("objIntAngleDev", input.objIntAngleDev);
            result.put("resultStatus", input.resultStatus);
            result.put("angle", input.angle);
            result.put("center", generateCoordinate(input.center));
            result.put("leftTop", generateCoordinate(input.leftTop));
            result.put("leftBottom", generateCoordinate(input.leftBottom));
            result.put("rightTop", generateCoordinate(input.rightTop));
            result.put("rightBottom", generateCoordinate(input.rightBottom));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateImageQuality(ImageQuality input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("featureType", input.featureType);
            result.put("result", input.result);
            result.put("type", input.type);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateImageQualityGroup(ImageQualityGroup input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("count", input.count);
            result.put("result", input.result);
            result.put("imageQualityList", generateList(input.imageQualityList, JSONConstructor::generateImageQuality));
            result.put("pageIndex", input.pageIndex);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderDocumentType(DocumentReaderDocumentType input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("pageIndex", input.pageIndex);
            result.put("documentID", input.documentID);
            result.put("dType", input.dType);
            result.put("dFormat", input.dFormat);
            result.put("dMRZ", input.dMRZ);
            result.put("name", input.name);
            result.put("ICAOCode", input.ICAOCode);
            result.put("dDescription", input.dDescription);
            result.put("dYear", input.dYear);
            result.put("dCountryName", input.dCountryName);
            result.put("FDSID", generateIntArray(input.FDSID));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderNotification(DocumentReaderNotification input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("code", input.code & 0xFFFF0000);
            result.put("number", input.code & 0x0000FFFF);
            result.put("value", input.value);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateAccessControlProcedureType(AccessControlProcedureType input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("activeOptionIdx", input.activeOptionIdx);
            result.put("type", input.type);
            result.put("status", input.status);
            result.put("notifications", generateList(input.notifications));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateFileData(FileData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("length", input.length);
            result.put("type", input.type);
            result.put("status", input.status);
            result.put("data", input.data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCertificateData(CertificateData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("length", input.length);
            result.put("data", input.data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateSecurityObjectCertificates(SecurityObjectCertificates input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("securityObject", generateCertificateData(input.securityObject));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateFile(File input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("readingTime", input.readingTime);
            result.put("type", input.type);
            result.put("pAStatus", input.pAStatus);
            result.put("readingStatus", input.readingStatus);
            result.put("fileID", input.fileID);
            result.put("fileData", generateFileData(input.fileData));
            result.put("certificates", generateSecurityObjectCertificates(input.certificates));
            result.put("docFieldsText", generateList(input.docFieldsText));
            result.put("docFieldsGraphics", generateList(input.docFieldsGraphics));
            result.put("docFieldsOriginals", generateList(input.docFieldsOriginals));
            result.put("notifications", generateList(input.notifications));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateApplication(Application input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("type", input.type);
            result.put("status", input.status);
            result.put("applicationID", input.applicationID);
            result.put("dataHashAlgorithm", input.dataHashAlgorithm);
            result.put("unicodeVersion", input.unicodeVersion);
            result.put("version", input.version);
            result.put("files", generateList(input.files, JSONConstructor::generateFile));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateValue(Value input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("length", input.length);
            result.put("type", input.type);
            result.put("status", input.status);
            result.put("data", input.data);
            result.put("format", input.format);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateAttribute(Attribute input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("type", input.type);
            result.put("value", generateValue(input.value));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateAuthority(Authority input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("data", input.data);
            result.put("friendlyName", generateValue(input.friendlyName));
            result.put("attributes", generateList(input.attributes, JSONConstructor::generateAttribute));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateExtension(Extension input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("data", input.data);
            result.put("type", input.type);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateValidity(Validity input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("notAfter", generateValue(input.notAfter));
            result.put("notBefore", generateValue(input.notBefore));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCertificateChain(CertificateChain input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("origin", input.origin);
            result.put("type", input.type);
            result.put("version", input.version);
            result.put("paStatus", input.paStatus);
            result.put("serialNumber", input.serialNumber);
            result.put("signatureAlgorithm", input.signatureAlgorithm);
            result.put("subjectPKAlgorithm", input.subjectPKAlgorithm);
            result.put("fileName", generateValue(input.fileName));
            result.put("validity", generateValidity(input.validity));
            result.put("issuer", generateAuthority(input.issuer));
            result.put("subject", generateAuthority(input.subject));
            result.put("notifications", generateList(input.notifications));
            result.put("extensions", generateList(input.extensions, JSONConstructor::generateExtension));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateSignerInfo(SignerInfo input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("version", input.version);
            result.put("paStatus", input.paStatus);
            result.put("dataToHash", input.dataToHash);
            result.put("digestAlgorithm", input.digestAlgorithm);
            result.put("signatureAlgorithm", input.signatureAlgorithm);
            result.put("serialNumber", generateValue(input.serialNumber));
            result.put("signature", generateValue(input.signature));
            result.put("subjectKeyIdentifier", generateValue(input.subjectKeyIdentifier));
            result.put("issuer", generateAuthority(input.issuer));
            result.put("notifications", generateList(input.notifications));
            result.put("signedAttributes", generateList(input.signedAttributes, JSONConstructor::generateExtension));
            result.put("certificateChain", generateList(input.certificateChain, JSONConstructor::generateCertificateChain));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateSecurityObject(SecurityObject input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("fileReference", input.fileReference);
            result.put("version", input.version);
            result.put("objectType", input.objectType);
            result.put("notifications", generateList(input.notifications));
            result.put("signerInfos", generateList(input.signerInfos, JSONConstructor::generateSignerInfo));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCardProperties(CardProperties input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("aTQA", input.aTQA);
            result.put("bitRateR", input.bitRateR);
            result.put("bitRateS", input.bitRateS);
            result.put("chipTypeA", input.chipTypeA);
            result.put("mifareMemory", input.mifareMemory);
            result.put("rfidType", input.rfidType);
            result.put("sAK", input.sAK);
            result.put("support4", input.support4);
            result.put("supportMifare", input.supportMifare);
            result.put("aTQB", input.aTQB);
            result.put("aTR", input.aTR);
            result.put("baudrate1", input.baudrate1);
            result.put("baudrate2", input.baudrate2);
            result.put("uID", input.uID);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateRFIDSessionData(RFIDSessionData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("totalBytesReceived", input.totalBytesReceived);
            result.put("totalBytesSent", input.totalBytesSent);
            result.put("status", input.status);
            result.put("extLeSupport", input.extLeSupport);
            result.put("processTime", input.processTime);
            result.put("cardProperties", generateCardProperties(input.cardProperties));
            result.put("sessionDataStatus", generateRFIDSessionDataStatus(input.sessionDataStatus));
            result.put("accessControls", generateList(input.accessControls, JSONConstructor::generateAccessControlProcedureType));
            result.put("applications", generateList(input.applications, JSONConstructor::generateApplication));
            result.put("securityObjects", generateList(input.securityObjects, JSONConstructor::generateSecurityObject));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderAuthenticityCheck(DocumentReaderAuthenticityCheck input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("type", input.type);
            result.put("status", input.getStatus());
            result.put("typeName", input.getTypeName(context));
            result.put("pageIndex", input.pageIndex);
            result.put("elements", generateList(input.elements, JSONConstructor::generateDocumentReaderAuthenticityElement, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generatePDF417Info(PDF417Info input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("errorLevel", input.errorLevel);
            result.put("columns", input.columns);
            result.put("rows", input.rows);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateRFIDSessionDataStatus(RFIDSessionDataStatus input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("AA", input.AA);
            result.put("BAC", input.BAC);
            result.put("CA", input.CA);
            result.put("PA", input.PA);
            result.put("PACE", input.PACE);
            result.put("TA", input.TA);
            result.put("overallStatus", input.overallStatus);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderBarcodeResult(DocumentReaderBarcodeResult input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderBarcodeField));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderBarcodeField(DocumentReaderBarcodeField input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("barcodeType", input.barcodeType);
            result.put("status", input.status);
            result.put("pageIndex", input.pageIndex);
            result.put("pdf417Info", generatePDF417Info(input.pdf417Info));
            result.put("data", generateByteArray(input.data));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderAuthenticityResult(DocumentReaderAuthenticityResult input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("status", input.getStatus());
            result.put("checks", generateList(input.checks, JSONConstructor::generateDocumentReaderAuthenticityCheck, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderAuthenticityElement(DocumentReaderAuthenticityElement input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("status", input.status);
            result.put("elementType", input.elementType);
            result.put("elementDiagnose", input.elementDiagnose);
            result.put("elementTypeName", input.getElementTypeName(context));
            result.put("elementDiagnoseName", input.getElementDiagnoseName(context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderException(DocumentReaderException input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("errorCode", input.getErrorCode());
            result.put("localizedMessage", input.getLocalizedMessage());
            result.put("message", input.getMessage());
            result.put("string", input.toString());
            result.put("stackTrace", generateArray(input.getStackTrace(), JSONConstructor::generateStackTraceElement));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateThrowable(Throwable input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("localizedMessage", input.getLocalizedMessage());
            result.put("message", input.getMessage());
            result.put("string", input.toString());
            result.put("stackTrace", generateArray(input.getStackTrace(), JSONConstructor::generateStackTraceElement));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateStackTraceElement(StackTraceElement input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("lineNumber", input.getLineNumber());
            result.put("isNativeMethod", input.isNativeMethod());
            result.put("className", input.getClassName());
            result.put("fileName", input.getFileName());
            result.put("methodName", input.getMethodName());
            result.put("string", input.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generatePAResourcesIssuer(PAResourcesIssuer input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("data", generateByteArray(input.data));
            result.put("friendlyName", input.friendlyName);
            result.put("attributes", generateArray(input.attributes, JSONConstructor::generatePAAttribute));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generatePAAttribute(PAAttribute input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("type", input.type);
            result.put("value", input.value);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateTAChallenge(TAChallenge input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("data", generateByteArray(input.data));
            result.put("auxPCD", input.auxPCD);
            result.put("challengePICC", input.challengePICC);
            result.put("hashPK", input.hashPK);
            result.put("idPICC", input.idPICC);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderResultsStatus(DocumentReaderResultsStatus input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("overallStatus", input.getOverallStatus());
            result.put("optical", input.getOptical());
            result.put("detailsOptical", generateDetailsOptical(input.getDetailsOptical()));
            result.put("rfid", input.getRfid());
            result.put("detailsRFID", generateDetailsRFID(input.getDetailsRFID()));
            result.put("portrait", input.getPortrait());
            result.put("stopList", input.getStopList());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDetailsOptical(DocumentReaderResultsStatus.DetailsOptical input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("overallStatus", input.getOverallStatus());
            result.put("mrz", input.getMrz());
            result.put("text", input.getText());
            result.put("docType", input.getDocType());
            result.put("security", input.getSecurity());
            result.put("imageQA", input.getImageQA());
            result.put("expiry", input.getExpiry());
            result.put("vds", input.getVds());
            result.put("pagesCount", input.getPagesCount());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDetailsRFID(DocumentReaderResultsStatus.DetailsRFID input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("pa", input.getPA());
            result.put("ca", input.getCA());
            result.put("aa", input.getAA());
            result.put("ta", input.getTA());
            result.put("bac", input.getBAC());
            result.put("pace", input.getPACE());
            result.put("overallStatus", input.getOverallStatus());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateVDSNCData(VDSNCData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("type", input.getType());
            result.put("version", input.getVersion());
            result.put("issuingCountry", input.getIssuingCountry());
            result.put("message", input.getMessage());
            result.put("signatureAlgorithm", input.getSignatureAlg());
            result.put("signature", generateBytesData(input.getSignature()));
            result.put("certificate", generateBytesData(input.getCertificate()));
            result.put("certificateChain", generateList(input.getCertificateChain(), JSONConstructor::generateCertificateChain));
            result.put("notifications", generateLongArray(input.getNotifications()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateBytesData(BytesData input) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("data", input.getData());
            result.put("length", input.getLength());
            result.put("status", input.getStatus());
            result.put("type", input.getType());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderResults(DocumentReaderResults input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return result;
        try {
            result.put("chipPage", input.chipPage);
            result.put("overallResult", input.getOverallResult());
            result.put("processingFinishedStatus", input.processingFinishedStatus);
            result.put("elapsedTime", input.elapsedTime);
            result.put("elapsedTimeRFID", input.elapsedTimeRFID);
            result.put("morePagesAvailable", input.morePagesAvailable);
            result.put("rfidResult", input.rfidResult);
            result.put("highResolution", input.highResolution);
            result.put("graphicResult", generateDocumentReaderGraphicResult(input.graphicResult, context));
            result.put("textResult", generateDocumentReaderTextResult(input.textResult, context));
            result.put("documentPosition", generateList(input.documentPosition, JSONConstructor::generateElementPosition));
            result.put("barcodePosition", generateList(input.barcodePosition, JSONConstructor::generateElementPosition));
            result.put("mrzPosition", generateList(input.mrzPosition, JSONConstructor::generateElementPosition));
            result.put("imageQuality", generateList(input.imageQuality, JSONConstructor::generateImageQualityGroup));
            result.put("rawResult", input.rawResult);
            result.put("documentReaderNotification", generateDocumentReaderNotification(input.documentReaderNotification));
            result.put("rfidSessionData", generateRFIDSessionData(input.rfidSessionData));
            result.put("authenticityResult", generateDocumentReaderAuthenticityResult(input.authenticityResult, context));
            result.put("barcodeResult", generateDocumentReaderBarcodeResult(input.barcodeResult));
            result.put("documentType", generateList(input.documentType, JSONConstructor::generateDocumentReaderDocumentType));
            result.put("status", generateDocumentReaderResultsStatus(input.status));
            result.put("vdsncData", generateVDSNCData(input.vdsncData));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    // From JSON

    static DocumentReaderScenario DocumentReaderScenarioFromJSON(JSONObject input) {
        try {
            DocumentReaderScenario result = new DocumentReaderScenario();
            if (input.has("name"))
                result.name = input.getString("name");
            if (input.has("caption"))
                result.caption = input.getString("caption");
            if (input.has("description"))
                result.description = input.getString("description");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static CoreDetailedScenario CoreDetailedScenarioFromJSON(JSONObject input) {
        try {
            CoreDetailedScenario result = new CoreDetailedScenario();
            if (input.has("uvTorch"))
                result.uvTorch = input.getBoolean("uvTorch");
            if (input.has("frameOrientation"))
                result.frameOrientation = input.getInt("frameOrientation");
            if (input.has("faceExt"))
                result.faceExt = input.getBoolean("faceExt");
            if (input.has("multiPageOff"))
                result.multiPageOff = input.getInt("multiPageOff");
            if (input.has("seriesProcessMode"))
                result.seriesProcessMode = input.getBoolean("seriesProcessMode");
            if (input.has("frameKWHLandscape"))
                result.frameKWHLandscape = input.getDouble("frameKWHLandscape");
            if (input.has("frameKWHPortrait"))
                result.frameKWHPortrait = input.getDouble("frameKWHPortrait");
            if (input.has("frameKWHDoublePageSpreadPortrait"))
                result.frameKWHDoublePageSpreadPortrait = input.getDouble("frameKWHDoublePageSpreadPortrait");
            if (input.has("frameKWHDoublePageSpreadLandscape"))
                result.frameKWHDoublePageSpreadLandscape = input.getDouble("frameKWHDoublePageSpreadLandscape");
            if (input.has("name"))
                result.name = input.getString("name");
            if (input.has("caption"))
                result.caption = input.getString("caption");
            if (input.has("description"))
                result.description = input.getString("description");
            if (input.has("manualCrop"))
                result.manualCrop = input.getBoolean("manualCrop");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static FaceMetaData FaceMetaDataFromJSON(JSONObject input) {
        try {
            FaceMetaData result = new FaceMetaData();
            if (input.has("ID"))
                result.ID = input.getInt("ID");
            if (input.has("rollAngle"))
                result.rollAngle = input.getInt("rollAngle");
            if (input.has("bounds"))
                result.bounds = BoundsFromJSON(input.getJSONObject("bounds"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Bounds BoundsFromJSON(JSONObject input) {
        try {
            Bounds result = new Bounds();
            if (input.has("x"))
                result.x = input.getInt("x");
            if (input.has("y"))
                result.y = input.getInt("y");
            if (input.has("width"))
                result.width = input.getInt("width");
            if (input.has("height"))
                result.height = input.getInt("height");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Rect RectFromJSON(JSONObject input) {
        try {
            Rect result = new Rect();
            if (input.has("bottom"))
                result.bottom = input.getInt("bottom");
            if (input.has("top"))
                result.top = input.getInt("top");
            if (input.has("left"))
                result.left = input.getInt("left");
            if (input.has("right"))
                result.right = input.getInt("right");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocReaderFieldRect DocReaderFieldRectFromJSON(JSONObject input) {
        try {
            DocReaderFieldRect result = new DocReaderFieldRect();
            if (input.has("bottom"))
                result.bottom = input.getInt("bottom");
            if (input.has("top"))
                result.top = input.getInt("top");
            if (input.has("left"))
                result.left = input.getInt("left");
            if (input.has("right"))
                result.right = input.getInt("right");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderGraphicField DocumentReaderGraphicFieldFromJSON(JSONObject input) {
        try {
            DocumentReaderGraphicField result = new DocumentReaderGraphicField();
            if (input.has("sourceType"))
                result.sourceType = input.getInt("sourceType");
            if (input.has("fieldType"))
                result.fieldType = input.getInt("fieldType");
            if (input.has("lightType"))
                result.light = input.getInt("lightType");
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("fieldRect"))
                result.boundRect = DocReaderFieldRectFromJSON(input.getJSONObject("fieldRect"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderGraphicResult DocumentReaderGraphicResultFromJSON(JSONObject input) {
        try {
            DocumentReaderGraphicResult result = new DocumentReaderGraphicResult();
            if (input.has("fields")){
                JSONArray jsonArray_fields = input.getJSONArray("fields");
                List<DocumentReaderGraphicField> fields = new ArrayList<>();
                for (int i = 0; i < jsonArray_fields.length(); i++)
                    fields.add(DocumentReaderGraphicFieldFromJSON(jsonArray_fields.getJSONObject(i)));
                result.fields = fields;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderValue DocumentReaderValueFromJSON(JSONObject input) {
        try {
            DocumentReaderValue result = new DocumentReaderValue();
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("sourceType"))
                result.sourceType = input.getInt("sourceType");
            if (input.has("validity"))
                result.validity = input.getInt("validity");
            if (input.has("probability"))
                result.probability = input.getInt("probability");
            if (input.has("value"))
                result.value = input.getString("value");
            if (input.has("originalValue"))
                result.originalValue = input.getString("originalValue");
            if (input.has("boundRect"))
                result.boundRect = RectFromJSON(input.getJSONObject("boundRect"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderTextField DocumentReaderTextFieldFromJSON(JSONObject input) {
        try {
            DocumentReaderTextField result = new DocumentReaderTextField();
            if (input.has("fieldType"))
                result.fieldType = input.getInt("fieldType");
            if (input.has("lcid"))
                result.lcid = input.getInt("lcid");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("values")){
                JSONArray jsonArray_values = input.getJSONArray("values");
                List<DocumentReaderValue> values = new ArrayList<>();
                for (int i = 0; i < jsonArray_values.length(); i++)
                    values.add(DocumentReaderValueFromJSON(jsonArray_values.getJSONObject(i)));
                result.values = values;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderTextResult DocumentReaderTextResultFromJSON(JSONObject input) {
        try {
            DocumentReaderTextResult result = new DocumentReaderTextResult();
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("fields")){
                JSONArray jsonArray_fields = input.getJSONArray("fields");
                List<DocumentReaderTextField> fields = new ArrayList<>();
                for (int i = 0; i < jsonArray_fields.length(); i++)
                    fields.add(DocumentReaderTextFieldFromJSON(jsonArray_fields.getJSONObject(i)));
                result.fields = fields;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Coordinate CoordinateFromJSON(JSONObject input) {
        try {
            Coordinate result = new Coordinate();
            if (input.has("x"))
                result.x = input.getInt("x");
            if (input.has("y"))
                result.y = input.getInt("y");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static ElementPosition ElementPositionFromJSON(JSONObject input) {
        try {
            ElementPosition result = new ElementPosition();
            if (input.has("docFormat"))
                result.docFormat = input.getInt("docFormat");
            if (input.has("width"))
                result.width = input.getInt("width");
            if (input.has("height"))
                result.height = input.getInt("height");
            if (input.has("dpi"))
                result.dpi = input.getInt("dpi");
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("inverse"))
                result.inverse = input.getInt("inverse");
            if (input.has("perspectiveTr"))
                result.perspectiveTr = input.getInt("perspectiveTr");
            if (input.has("objArea"))
                result.objArea = input.getInt("objArea");
            if (input.has("objIntAngleDev"))
                result.objIntAngleDev = input.getInt("objIntAngleDev");
            if (input.has("resultStatus"))
                result.resultStatus = input.getInt("resultStatus");
            if (input.has("angle"))
                result.angle = input.getDouble("angle");
            if (input.has("center"))
                result.center = CoordinateFromJSON(input.getJSONObject("center"));
            if (input.has("leftTop"))
                result.leftTop = CoordinateFromJSON(input.getJSONObject("leftTop"));
            if (input.has("leftBottom"))
                result.leftBottom = CoordinateFromJSON(input.getJSONObject("leftBottom"));
            if (input.has("rightTop"))
                result.rightTop = CoordinateFromJSON(input.getJSONObject("rightTop"));
            if (input.has("rightBottom"))
                result.rightBottom = CoordinateFromJSON(input.getJSONObject("rightBottom"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static ImageQuality ImageQualityFromJSON(JSONObject input) {
        try {
            ImageQuality result = new ImageQuality();
            if (input.has("featureType"))
                result.featureType = input.getInt("featureType");
            if (input.has("result"))
                result.result = input.getInt("result");
            if (input.has("type"))
                result.type = input.getInt("type");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static ImageQualityGroup ImageQualityGroupFromJSON(JSONObject input) {
        try {
            ImageQualityGroup result = new ImageQualityGroup();
            if (input.has("count"))
                result.count = input.getInt("count");
            if (input.has("result"))
                result.result = input.getInt("result");
            if (input.has("imageQualityList")){
                JSONArray jsonArray_imageQualityList = input.getJSONArray("imageQualityList");
                List<ImageQuality> imageQualityList = new ArrayList<>();
                for (int i = 0; i < jsonArray_imageQualityList.length(); i++)
                    imageQualityList.add(ImageQualityFromJSON(jsonArray_imageQualityList.getJSONObject(i)));
                result.imageQualityList = imageQualityList;
            }
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderDocumentType DocumentReaderDocumentTypeFromJSON(JSONObject input) {
        try {
            DocumentReaderDocumentType result = new DocumentReaderDocumentType();
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("documentID"))
                result.documentID = input.getInt("documentID");
            if (input.has("dType"))
                result.dType = input.getInt("dType");
            if (input.has("dFormat"))
                result.dFormat = input.getInt("dFormat");
            if (input.has("dMRZ"))
                result.dMRZ = input.getBoolean("dMRZ");
            if (input.has("name"))
                result.name = input.getString("name");
            if (input.has("ICAOCode"))
                result.ICAOCode = input.getString("ICAOCode");
            if (input.has("dDescription"))
                result.dDescription = input.getString("dDescription");
            if (input.has("dYear"))
                result.dYear = input.getString("dYear");
            if (input.has("dCountryName"))
                result.dCountryName = input.getString("dCountryName");
            if (input.has("FDSID")){
                JSONArray jsonArray_FDSID = input.getJSONArray("FDSID");
                int[] FDSID = new int[jsonArray_FDSID.length()];
                for (int i = 0; i < jsonArray_FDSID.length(); i++)
                    FDSID[i] = jsonArray_FDSID.getInt(i);
                result.FDSID = FDSID;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static AccessControlProcedureType AccessControlProcedureTypeFromJSON(JSONObject input) {
        try {
            AccessControlProcedureType result = new AccessControlProcedureType();
            if (input.has("activeOptionIdx"))
                result.activeOptionIdx = input.getInt("activeOptionIdx");
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("notifications")){
                JSONArray jsonArray_notifications = input.getJSONArray("notifications");
                List<Long> notifications = new ArrayList<>();
                for (int i = 0; i < jsonArray_notifications.length(); i++)
                    notifications.add(jsonArray_notifications.getLong(i));
                result.notifications = notifications;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static FileData FileDataFromJSON(JSONObject input) {
        try {
            FileData result = new FileData();
            if (input.has("length"))
                result.length = input.getInt("length");
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("data"))
                result.data = input.getString("data");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static CertificateData CertificateDataFromJSON(JSONObject input) {
        try {
            CertificateData result = new CertificateData();
            if (input.has("length"))
                result.length = input.getInt("length");
            if (input.has("data"))
                result.data = input.getString("data");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static SecurityObjectCertificates SecurityObjectCertificatesFromJSON(JSONObject input) {
        try {
            SecurityObjectCertificates result = new SecurityObjectCertificates();
            if (input.has("securityObject"))
                result.securityObject = CertificateDataFromJSON(input.getJSONObject("securityObject"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static File FileFromJSON(JSONObject input) {
        try {
            File result = new File();
            if (input.has("readingTime"))
                result.readingTime = input.getInt("readingTime");
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("pAStatus"))
                result.pAStatus = input.getInt("pAStatus");
            if (input.has("readingStatus"))
                result.readingStatus = input.getInt("readingStatus");
            if (input.has("fileID"))
                result.fileID = input.getString("fileID");
            if (input.has("fileData"))
                result.fileData = FileDataFromJSON(input.getJSONObject("fileData"));
            if (input.has("certificates"))
                result.certificates = SecurityObjectCertificatesFromJSON(input.getJSONObject("certificates"));
            if (input.has("docFieldsText")){
                JSONArray jsonArray_docFieldsText = input.getJSONArray("docFieldsText");
                List<Integer> docFieldsText = new ArrayList<>();
                for (int i = 0; i < jsonArray_docFieldsText.length(); i++)
                    docFieldsText.add(jsonArray_docFieldsText.getInt(i));
                result.docFieldsText = docFieldsText;
            }
            if (input.has("docFieldsGraphics")){
                JSONArray jsonArray_docFieldsGraphics = input.getJSONArray("docFieldsGraphics");
                List<Integer> docFieldsGraphics = new ArrayList<>();
                for (int i = 0; i < jsonArray_docFieldsGraphics.length(); i++)
                    docFieldsGraphics.add(jsonArray_docFieldsGraphics.getInt(i));
                result.docFieldsGraphics = docFieldsGraphics;
            }
            if (input.has("docFieldsOriginals")){
                JSONArray jsonArray_docFieldsOriginals = input.getJSONArray("docFieldsOriginals");
                List<Integer> docFieldsOriginals = new ArrayList<>();
                for (int i = 0; i < jsonArray_docFieldsOriginals.length(); i++)
                    docFieldsOriginals.add(jsonArray_docFieldsOriginals.getInt(i));
                result.docFieldsOriginals = docFieldsOriginals;
            }
            if (input.has("notifications")){
                JSONArray jsonArray_notifications = input.getJSONArray("notifications");
                List<Long> notifications = new ArrayList<>();
                for (int i = 0; i < jsonArray_notifications.length(); i++)
                    notifications.add(jsonArray_notifications.getLong(i));
                result.notifications = notifications;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Application ApplicationFromJSON(JSONObject input) {
        try {
            Application result = new Application();
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("applicationID"))
                result.applicationID = input.getString("applicationID");
            if (input.has("dataHashAlgorithm"))
                result.dataHashAlgorithm = input.getString("dataHashAlgorithm");
            if (input.has("unicodeVersion"))
                result.unicodeVersion = input.getString("unicodeVersion");
            if (input.has("version"))
                result.version = input.getString("version");
            if (input.has("files")){
                JSONArray jsonArray_files = input.getJSONArray("files");
                List<File> files = new ArrayList<>();
                for (int i = 0; i < jsonArray_files.length(); i++)
                    files.add(FileFromJSON(jsonArray_files.getJSONObject(i)));
                result.files = files;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Value ValueFromJSON(JSONObject input) {
        try {
            Value result = new Value();
            if (input.has("length"))
                result.length = input.getInt("length");
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("data"))
                result.data = input.getString("data");
            if (input.has("format"))
                result.format = input.getString("format");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Attribute AttributeFromJSON(JSONObject input) {
        try {
            Attribute result = new Attribute();
            if (input.has("type"))
                result.type = input.getString("type");
            if (input.has("value"))
                result.value = ValueFromJSON(input.getJSONObject("value"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Authority AuthorityFromJSON(JSONObject input) {
        try {
            Authority result = new Authority();
            if (input.has("data"))
                result.data = input.getString("data");
            if (input.has("friendlyName"))
                result.friendlyName = ValueFromJSON(input.getJSONObject("friendlyName"));
            if (input.has("attributes")){
                JSONArray jsonArray_attributes = input.getJSONArray("attributes");
                List<Attribute> attributes = new ArrayList<>();
                for (int i = 0; i < jsonArray_attributes.length(); i++)
                    attributes.add(AttributeFromJSON(jsonArray_attributes.getJSONObject(i)));
                result.attributes = attributes;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Extension ExtensionFromJSON(JSONObject input) {
        try {
            Extension result = new Extension();
            if (input.has("data"))
                result.data = input.getString("data");
            if (input.has("type"))
                result.type = input.getString("type");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static Validity ValidityFromJSON(JSONObject input) {
        try {
            Validity result = new Validity();
            if (input.has("notAfter"))
                result.notAfter = ValueFromJSON(input.getJSONObject("notAfter"));
            if (input.has("notBefore"))
                result.notBefore = ValueFromJSON(input.getJSONObject("notBefore"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static CertificateChain CertificateChainFromJSON(JSONObject input) {
        try {
            CertificateChain result = new CertificateChain();
            if (input.has("origin"))
                result.origin = input.getInt("origin");
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("version"))
                result.version = input.getInt("version");
            if (input.has("paStatus"))
                result.paStatus = input.getInt("paStatus");
            if (input.has("serialNumber"))
                result.serialNumber = input.getString("serialNumber");
            if (input.has("signatureAlgorithm"))
                result.signatureAlgorithm = input.getString("signatureAlgorithm");
            if (input.has("subjectPKAlgorithm"))
                result.subjectPKAlgorithm = input.getString("subjectPKAlgorithm");
            if (input.has("fileName"))
                result.fileName = ValueFromJSON(input.getJSONObject("fileName"));
            if (input.has("validity"))
                result.validity = ValidityFromJSON(input.getJSONObject("validity"));
            if (input.has("issuer"))
                result.issuer = AuthorityFromJSON(input.getJSONObject("issuer"));
            if (input.has("subject"))
                result.subject = AuthorityFromJSON(input.getJSONObject("subject"));
            if (input.has("notifications")){
                JSONArray jsonArray_notifications = input.getJSONArray("notifications");
                List<Long> notifications = new ArrayList<>();
                for (int i = 0; i < jsonArray_notifications.length(); i++)
                    notifications.add(jsonArray_notifications.getLong(i));
                result.notifications = notifications;
            }
            if (input.has("extensions")){
                JSONArray jsonArray_extensions = input.getJSONArray("extensions");
                List<Extension> extensions = new ArrayList<>();
                for (int i = 0; i < jsonArray_extensions.length(); i++)
                    extensions.add(ExtensionFromJSON(jsonArray_extensions.getJSONObject(i)));
                result.extensions = extensions;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static SignerInfo SignerInfoFromJSON(JSONObject input) {
        try {
            SignerInfo result = new SignerInfo();
            if (input.has("version"))
                result.version = input.getInt("version");
            if (input.has("paStatus"))
                result.paStatus = input.getInt("paStatus");
            if (input.has("dataToHash"))
                result.dataToHash = input.getString("dataToHash");
            if (input.has("digestAlgorithm"))
                result.digestAlgorithm = input.getString("digestAlgorithm");
            if (input.has("signatureAlgorithm"))
                result.signatureAlgorithm = input.getString("signatureAlgorithm");
            if (input.has("serialNumber"))
                result.serialNumber = ValueFromJSON(input.getJSONObject("serialNumber"));
            if (input.has("signature"))
                result.signature = ValueFromJSON(input.getJSONObject("signature"));
            if (input.has("subjectKeyIdentifier"))
                result.subjectKeyIdentifier = ValueFromJSON(input.getJSONObject("subjectKeyIdentifier"));
            if (input.has("issuer"))
                result.issuer = AuthorityFromJSON(input.getJSONObject("issuer"));
            if (input.has("notifications")){
                JSONArray jsonArray_notifications = input.getJSONArray("notifications");
                List<Long> notifications = new ArrayList<>();
                for (int i = 0; i < jsonArray_notifications.length(); i++)
                    notifications.add(jsonArray_notifications.getLong(i));
                result.notifications = notifications;
            }
            if (input.has("signedAttributes")){
                JSONArray jsonArray_signedAttributes = input.getJSONArray("signedAttributes");
                List<Extension> signedAttributes = new ArrayList<>();
                for (int i = 0; i < jsonArray_signedAttributes.length(); i++)
                    signedAttributes.add(ExtensionFromJSON(jsonArray_signedAttributes.getJSONObject(i)));
                result.signedAttributes = signedAttributes;
            }
            if (input.has("certificateChain")){
                JSONArray jsonArray_certificateChain = input.getJSONArray("certificateChain");
                List<CertificateChain> certificateChain = new ArrayList<>();
                for (int i = 0; i < jsonArray_certificateChain.length(); i++)
                    certificateChain.add(CertificateChainFromJSON(jsonArray_certificateChain.getJSONObject(i)));
                result.certificateChain = certificateChain;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static SecurityObject SecurityObjectFromJSON(JSONObject input) {
        try {
            SecurityObject result = new SecurityObject();
            if (input.has("fileReference"))
                result.fileReference = input.getInt("fileReference");
            if (input.has("version"))
                result.version = input.getInt("version");
            if (input.has("objectType"))
                result.objectType = input.getString("objectType");
            if (input.has("notifications")){
                JSONArray jsonArray_notifications = input.getJSONArray("notifications");
                List<Long> notifications = new ArrayList<>();
                for (int i = 0; i < jsonArray_notifications.length(); i++)
                    notifications.add(jsonArray_notifications.getLong(i));
                result.notifications = notifications;
            }
            if (input.has("signerInfos")){
                JSONArray jsonArray_signerInfos = input.getJSONArray("signerInfos");
                List<SignerInfo> signerInfos = new ArrayList<>();
                for (int i = 0; i < jsonArray_signerInfos.length(); i++)
                    signerInfos.add(SignerInfoFromJSON(jsonArray_signerInfos.getJSONObject(i)));
                result.signerInfos = signerInfos;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static CardProperties CardPropertiesFromJSON(JSONObject input) {
        try {
            CardProperties result = new CardProperties();
            if (input.has("aTQA"))
                result.aTQA = input.getInt("aTQA");
            if (input.has("bitRateR"))
                result.bitRateR = input.getInt("bitRateR");
            if (input.has("bitRateS"))
                result.bitRateS = input.getInt("bitRateS");
            if (input.has("chipTypeA"))
                result.chipTypeA = input.getInt("chipTypeA");
            if (input.has("mifareMemory"))
                result.mifareMemory = input.getInt("mifareMemory");
            if (input.has("rfidType"))
                result.rfidType = input.getInt("rfidType");
            if (input.has("sAK"))
                result.sAK = input.getInt("sAK");
            if (input.has("support4"))
                result.support4 = input.getBoolean("support4");
            if (input.has("supportMifare"))
                result.supportMifare = input.getBoolean("supportMifare");
            if (input.has("aTQB"))
                result.aTQB = input.getString("aTQB");
            if (input.has("aTR"))
                result.aTR = input.getString("aTR");
            if (input.has("baudrate1"))
                result.baudrate1 = input.getString("baudrate1");
            if (input.has("baudrate2"))
                result.baudrate2 = input.getString("baudrate2");
            if (input.has("uID"))
                result.uID = input.getString("uID");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static RFIDSessionData RFIDSessionDataFromJSON(JSONObject input) {
        try {
            RFIDSessionData result = new RFIDSessionData();
            if (input.has("totalBytesReceived"))
                result.totalBytesReceived = input.getInt("totalBytesReceived");
            if (input.has("totalBytesSent"))
                result.totalBytesSent = input.getInt("totalBytesSent");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("extLeSupport"))
                result.extLeSupport = input.getInt("extLeSupport");
            if (input.has("processTime"))
                result.processTime = input.getInt("processTime");
            if (input.has("cardProperties"))
                result.cardProperties = CardPropertiesFromJSON(input.getJSONObject("cardProperties"));
            if (input.has("sessionDataStatus"))
                result.sessionDataStatus = RFIDSessionDataStatusFromJSON(input.getJSONObject("sessionDataStatus"));
            if (input.has("accessControls")){
                JSONArray jsonArray_accessControls = input.getJSONArray("accessControls");
                List<AccessControlProcedureType> accessControls = new ArrayList<>();
                for (int i = 0; i < jsonArray_accessControls.length(); i++)
                    accessControls.add(AccessControlProcedureTypeFromJSON(jsonArray_accessControls.getJSONObject(i)));
                result.accessControls = accessControls;
            }
            if (input.has("applications")){
                JSONArray jsonArray_applications = input.getJSONArray("applications");
                List<Application> applications = new ArrayList<>();
                for (int i = 0; i < jsonArray_applications.length(); i++)
                    applications.add(ApplicationFromJSON(jsonArray_applications.getJSONObject(i)));
                result.applications = applications;
            }
            if (input.has("securityObjects")){
                JSONArray jsonArray_securityObjects = input.getJSONArray("securityObjects");
                List<SecurityObject> securityObjects = new ArrayList<>();
                for (int i = 0; i < jsonArray_securityObjects.length(); i++)
                    securityObjects.add(SecurityObjectFromJSON(jsonArray_securityObjects.getJSONObject(i)));
                result.securityObjects = securityObjects;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderAuthenticityCheck DocumentReaderAuthenticityCheckFromJSON(JSONObject input) {
        try {
            DocumentReaderAuthenticityCheck result = new DocumentReaderAuthenticityCheck();
            if (input.has("type"))
                result.type = input.getInt("type");
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("elements")){
                JSONArray jsonArray_elements = input.getJSONArray("elements");
                List<DocumentReaderAuthenticityElement> elements = new ArrayList<>();
                for (int i = 0; i < jsonArray_elements.length(); i++)
                    elements.add(DocumentReaderAuthenticityElementFromJSON(jsonArray_elements.getJSONObject(i)));
                result.elements = elements;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static PDF417Info PDF417InfoFromJSON(JSONObject input) {
        try {
            PDF417Info result = new PDF417Info();
            if (input.has("errorLevel"))
                result.errorLevel = input.getInt("errorLevel");
            if (input.has("columns"))
                result.columns = input.getInt("columns");
            if (input.has("rows"))
                result.rows = input.getInt("rows");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static RFIDSessionDataStatus RFIDSessionDataStatusFromJSON(JSONObject input) {
        try {
            RFIDSessionDataStatus result = new RFIDSessionDataStatus();
            if (input.has("AA"))
                result.AA = input.getInt("AA");
            if (input.has("BAC"))
                result.BAC = input.getInt("BAC");
            if (input.has("CA"))
                result.CA = input.getInt("CA");
            if (input.has("PA"))
                result.PA = input.getInt("PA");
            if (input.has("PACE"))
                result.PACE = input.getInt("PACE");
            if (input.has("TA"))
                result.TA = input.getInt("TA");
            if (input.has("overallStatus"))
                result.overallStatus = input.getInt("overallStatus");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderBarcodeResult DocumentReaderBarcodeResultFromJSON(JSONObject input) {
        try {
            DocumentReaderBarcodeResult result = new DocumentReaderBarcodeResult();
            if (input.has("fields")){
                JSONArray jsonArray_fields = input.getJSONArray("fields");
                List<DocumentReaderBarcodeField> fields = new ArrayList<>();
                for (int i = 0; i < jsonArray_fields.length(); i++)
                    fields.add(DocumentReaderBarcodeFieldFromJSON(jsonArray_fields.getJSONObject(i)));
                result.fields = fields;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderBarcodeField DocumentReaderBarcodeFieldFromJSON(JSONObject input) {
        try {
            DocumentReaderBarcodeField result = new DocumentReaderBarcodeField();
            if (input.has("barcodeType"))
                result.barcodeType = input.getInt("barcodeType");
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("pageIndex"))
                result.pageIndex = input.getInt("pageIndex");
            if (input.has("pdf417Info"))
                result.pdf417Info = PDF417InfoFromJSON(input.getJSONObject("pdf417Info"));
            if (input.has("data")){
                JSONArray jsonArray_data = input.getJSONArray("data");
                byte[] data = new byte[jsonArray_data.length()];
                for (int i = 0; i < jsonArray_data.length(); i++)
                    data[i] = (byte) jsonArray_data.get(i);
                result.data = data;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderAuthenticityResult DocumentReaderAuthenticityResultFromJSON(JSONObject input) {
        try {
            DocumentReaderAuthenticityResult result = new DocumentReaderAuthenticityResult();
            if (input.has("checks")){
                JSONArray jsonArray_checks = input.getJSONArray("checks");
                List<DocumentReaderAuthenticityCheck> checks = new ArrayList<>();
                for (int i = 0; i < jsonArray_checks.length(); i++)
                    checks.add(DocumentReaderAuthenticityCheckFromJSON(jsonArray_checks.getJSONObject(i)));
                result.checks = checks;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderAuthenticityElement DocumentReaderAuthenticityElementFromJSON(JSONObject input) {
        try {
            DocumentReaderAuthenticityElement result = new DocumentReaderAuthenticityElement();
            if (input.has("status"))
                result.status = input.getInt("status");
            if (input.has("elementType"))
                result.elementType = input.getInt("elementType");
            if (input.has("elementDiagnose"))
                result.elementDiagnose = input.getInt("elementDiagnose");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static PAResourcesIssuer PAResourcesIssuerFromJSON(JSONObject input) {
        try {
            PAResourcesIssuer result = new PAResourcesIssuer();
            if (input.has("data")){
                JSONArray jsonArray_data = input.getJSONArray("data");
                byte[] data = new byte[jsonArray_data.length()];
                for (int i = 0; i < jsonArray_data.length(); i++)
                    data[i] = (byte) jsonArray_data.get(i);
                result.data = data;
            }
            if (input.has("friendlyName"))
                result.friendlyName = input.getString("friendlyName");
            if (input.has("attributes")){
                JSONArray jsonArray_attributes = input.getJSONArray("attributes");
                PAAttribute[] attributes = new PAAttribute[jsonArray_attributes.length()];
                for (int i = 0; i < jsonArray_attributes.length(); i++)
                    attributes[i] = PAAttributeFromJSON(jsonArray_attributes.getJSONObject(i));
                result.attributes = attributes;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static PAAttribute PAAttributeFromJSON(JSONObject input) {
        try {
            PAAttribute result = new PAAttribute();
            if (input.has("type"))
                result.type = input.getString("type");
            if (input.has("value"))
                result.value = input.getString("value");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static TAChallenge TAChallengeFromJSON(JSONObject input) {
        try {
            TAChallenge result = new TAChallenge();
            if (input.has("data")){
                JSONArray jsonArray_data = input.getJSONArray("data");
                byte[] data = new byte[jsonArray_data.length()];
                for (int i = 0; i < jsonArray_data.length(); i++)
                    data[i] = (byte) jsonArray_data.get(i);
                result.data = data;
            }
            if (input.has("auxPCD"))
                result.auxPCD = input.getString("auxPCD");
            if (input.has("challengePICC"))
                result.challengePICC = input.getString("challengePICC");
            if (input.has("hashPK"))
                result.hashPK = input.getString("hashPK");
            if (input.has("idPICC"))
                result.idPICC = input.getString("idPICC");
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static DocumentReaderResults DocumentReaderResultsFromJSON(JSONObject input) {
        try {
            DocumentReaderResults result = new DocumentReaderResults();
            if (input.has("chipPage"))
                result.chipPage = input.getInt("chipPage");
            if (input.has("processingFinishedStatus"))
                result.processingFinishedStatus = input.getInt("processingFinishedStatus");
            if (input.has("elapsedTime"))
                result.elapsedTime = input.getInt("elapsedTime");
            if (input.has("elapsedTimeRFID"))
                result.elapsedTimeRFID = input.getInt("elapsedTimeRFID");
            if (input.has("morePagesAvailable"))
                result.morePagesAvailable = input.getInt("morePagesAvailable");
            if (input.has("rfidResult"))
                result.rfidResult = input.getInt("rfidResult");
            if (input.has("highResolution"))
                result.highResolution = input.getBoolean("highResolution");
            if (input.has("graphicResult"))
                result.graphicResult = DocumentReaderGraphicResultFromJSON(input.getJSONObject("graphicResult"));
            if (input.has("textResult"))
                result.textResult = DocumentReaderTextResultFromJSON(input.getJSONObject("textResult"));
            if (input.has("documentPosition")){
                JSONArray jsonArray_documentPosition = input.getJSONArray("documentPosition");
                List<ElementPosition> documentPosition = new ArrayList<>();
                for (int i = 0; i < jsonArray_documentPosition.length(); i++)
                    documentPosition.add(ElementPositionFromJSON(jsonArray_documentPosition.getJSONObject(i)));
                result.documentPosition = documentPosition;
            }
            if (input.has("barcodePosition")){
                JSONArray jsonArray_barcodePosition = input.getJSONArray("barcodePosition");
                List<ElementPosition> barcodePosition = new ArrayList<>();
                for (int i = 0; i < jsonArray_barcodePosition.length(); i++)
                    barcodePosition.add(ElementPositionFromJSON(jsonArray_barcodePosition.getJSONObject(i)));
                result.barcodePosition = barcodePosition;
            }
            if (input.has("mrzPosition")){
                JSONArray jsonArray_mrzPosition = input.getJSONArray("mrzPosition");
                List<ElementPosition> mrzPosition = new ArrayList<>();
                for (int i = 0; i < jsonArray_mrzPosition.length(); i++)
                    mrzPosition.add(ElementPositionFromJSON(jsonArray_mrzPosition.getJSONObject(i)));
                result.mrzPosition = mrzPosition;
            }
            if (input.has("imageQuality")){
                JSONArray jsonArray_imageQuality = input.getJSONArray("imageQuality");
                List<ImageQualityGroup> imageQuality = new ArrayList<>();
                for (int i = 0; i < jsonArray_imageQuality.length(); i++)
                    imageQuality.add(ImageQualityGroupFromJSON(jsonArray_imageQuality.getJSONObject(i)));
                result.imageQuality = imageQuality;
            }
            if (input.has("rawResult"))
                result.rawResult = input.getString("rawResult");
            if (input.has("documentReaderNotification"))
                result.documentReaderNotification = DocumentReaderNotificationFromJSON(input.getJSONObject("documentReaderNotification"));
            if (input.has("rfidSessionData"))
                result.rfidSessionData = RFIDSessionDataFromJSON(input.getJSONObject("rfidSessionData"));
            if (input.has("authenticityResult"))
                result.authenticityResult = DocumentReaderAuthenticityResultFromJSON(input.getJSONObject("authenticityResult"));
            if (input.has("barcodeResult"))
                result.barcodeResult = DocumentReaderBarcodeResultFromJSON(input.getJSONObject("barcodeResult"));
            if (input.has("documentType")){
                JSONArray jsonArray_documentType = input.getJSONArray("documentType");
                List<DocumentReaderDocumentType> documentType = new ArrayList<>();
                for (int i = 0; i < jsonArray_documentType.length(); i++)
                    documentType.add(DocumentReaderDocumentTypeFromJSON(jsonArray_documentType.getJSONObject(i)));
                result.documentType = documentType;
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }
}