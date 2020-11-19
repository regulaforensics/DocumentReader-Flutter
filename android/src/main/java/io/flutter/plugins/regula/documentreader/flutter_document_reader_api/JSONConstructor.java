package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Base64;

import com.regula.documentreader.api.enums.BarcodeType;
import com.regula.documentreader.api.enums.DocReaderAction;
import com.regula.documentreader.api.params.FaceMetaData;
import com.regula.documentreader.api.results.Bounds;
import com.regula.documentreader.api.results.Coordinate;
import com.regula.documentreader.api.results.DocReaderFieldRect;
import com.regula.documentreader.api.results.DocumentReaderDocumentType;
import com.regula.documentreader.api.results.DocumentReaderGraphicField;
import com.regula.documentreader.api.results.DocumentReaderGraphicResult;
import com.regula.documentreader.api.results.DocumentReaderNotification;
import com.regula.documentreader.api.results.DocumentReaderResults;
import com.regula.documentreader.api.results.DocumentReaderScenarioFull;
import com.regula.documentreader.api.results.DocumentReaderTextField;
import com.regula.documentreader.api.results.DocumentReaderTextResult;
import com.regula.documentreader.api.results.DocumentReaderValue;
import com.regula.documentreader.api.results.ElementPosition;
import com.regula.documentreader.api.results.ImageQuality;
import com.regula.documentreader.api.results.ImageQualityGroup;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityResult;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityCheck;
import com.regula.documentreader.api.results.authenticity.DocumentReaderAuthenticityElement;
import com.regula.documentreader.api.results.DocumentReaderBarcodeResult;
import com.regula.documentreader.api.results.DocumentReaderBarcodeField;
import com.regula.documentreader.api.results.DocumentReaderScenario;
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
import com.regula.documentreader.api.enums.PDF417Info;
import com.regula.documentreader.api.enums.eRPRM_Lights;
import com.regula.documentreader.api.enums.eGraphicFieldType;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@SuppressWarnings("RedundantSuppression")
class JSONConstructor {

    // To JSON

    interface JSONObjectGenerator<T> {
        JSONObject generateJSONObject(T param, Context context) throws JSONException;
    }

    static <T> JSONArray generateList(List<T> list, JSONObjectGenerator<T> generator, Context context) throws JSONException {
        JSONArray result = new JSONArray();
        for (T t : list)
            if (t != null)
                result.put(generator.generateJSONObject(t, context));

        return result;
    }

    static <T> JSONArray generateList(List<T> list) {
        JSONArray result = new JSONArray();
        for (T t : list)
            if (t != null)
                result.put(t);

        return result;
    }

    static <T> JSONArray generateArray(T[] array) throws JSONException {
        JSONArray result = new JSONArray();
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static <T> JSONArray generateArray(T[] array, JSONObjectGenerator<T> generator, Context context) throws JSONException {
        JSONArray result = new JSONArray();
        for (int i = 0; i < array.length; i++)
            result.put(i, generator.generateJSONObject(array[i], context));

        return result;
    }

    static JSONObject resultsToJsonObject(DocumentReaderResults results, Context context) {
        JSONObject jsonObject = new JSONObject();
        if (results == null) return jsonObject;
        try {
            jsonObject.put("chipPage", results.chipPage);
            jsonObject.put("highResolution", results.highResolution);
            jsonObject.put("morePagesAvailable", results.morePagesAvailable);
            jsonObject.put("processingFinishedStatus", results.processingFinishedStatus);
            jsonObject.put("rfidResult", results.rfidResult);
            jsonObject.put("elapsedTimeRFID", results.elapsedTimeRFID);
            jsonObject.put("elapsedTime", results.elapsedTime);
            jsonObject.put("overallResult", results.getOverallResult());
            jsonObject.put("documentType", generateList(results.documentType, JSONConstructor::generateDocumentReaderDocumentType, context));
            if (results.barcodePosition != null)
                jsonObject.put("barcodePosition", generateElementPosition(results.barcodePosition));
            if (results.documentPosition != null)
                jsonObject.put("documentPosition", generateElementPosition(results.documentPosition));
            if (results.documentReaderNotification != null)
                jsonObject.put("documentReaderNotification", generateDocumentReaderNotification(results.documentReaderNotification));
            if (results.graphicResult != null)
                jsonObject.put("graphicResult", generateDocumentReaderGraphicResult(results.graphicResult, context));
            if (results.imageQuality != null)
                jsonObject.put("imageQuality", generateImageQualityGroup(results.imageQuality, context));
            if (results.rawResult != null)
                jsonObject.put("rawResult", results.rawResult);
            if (results.mrzPosition != null)
                jsonObject.put("mrzPosition", generateElementPosition(results.mrzPosition));
            if (results.rfidSessionData != null)
                jsonObject.put("rfidSessionData", generateRfidSessionData(results.rfidSessionData, context));
            if (results.textResult != null)
                jsonObject.put("textResult", generateDocumentReaderTextResult(results.textResult, context));
            if (results.authenticityResult != null)
                jsonObject.put("authenticityResult", generateDocumentReaderAuthenticityResult(results.authenticityResult, context));
            if (results.barcodeResult != null)
                jsonObject.put("barcodeResult", generateDocumentReaderBarcodeResult(results.barcodeResult, context));
        } catch (JSONException ignored) {
        }

        return jsonObject;
    }

    static JSONObject resultsToJsonObjectNotification(DocumentReaderResults results) throws JSONException {
        if (results != null && results.documentReaderNotification != null)
            return new JSONObject().put("documentReaderNotification", generateDocumentReaderNotification(results.documentReaderNotification));
        return new JSONObject();
    }

    static JSONObject generateElementPosition(ElementPosition elementPosition) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("angle", elementPosition.angle);
        result.put("perspectiveTr", elementPosition.perspectiveTr);
        result.put("objArea", elementPosition.objArea);
        result.put("objIntAngleDev", elementPosition.objIntAngleDev);
        result.put("pageIndex", elementPosition.pageIndex);
        result.put("dpi", elementPosition.dpi);
        result.put("inverse", elementPosition.inverse);
        result.put("resultStatus", elementPosition.resultStatus);
        result.put("docFormat", elementPosition.docFormat);
        result.put("height", elementPosition.height);
        result.put("width", elementPosition.width);
        result.put("center", generateCoordinate(elementPosition.center));
        result.put("leftBottom", generateCoordinate(elementPosition.leftBottom));
        result.put("leftTop", generateCoordinate(elementPosition.leftTop));
        result.put("rightBottom", generateCoordinate(elementPosition.rightBottom));
        result.put("rightTop", generateCoordinate(elementPosition.rightTop));

        return result;
    }

    static JSONObject generateCoordinate(Coordinate coordinate) throws JSONException {
        JSONObject result = new JSONObject();
        if (coordinate == null) return result;
        result.put("x", coordinate.x);
        result.put("y", coordinate.y);

        return result;
    }

    static JSONObject generateDocumentReaderScenario(DocumentReaderScenario documentReaderScenario, @SuppressWarnings("unused") Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("name", documentReaderScenario.name);
        result.put("caption", documentReaderScenario.caption);
        result.put("description", documentReaderScenario.description);
        result.put("uvTorch", documentReaderScenario.uvTorch);
        result.put("seriesProcessMode", documentReaderScenario.seriesProcessMode);

        return result;
    }

    static JSONObject generateDocumentReaderScenario(DocumentReaderScenarioFull documentReaderScenario) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("name", documentReaderScenario.name);
        result.put("caption", documentReaderScenario.caption);
        result.put("description", documentReaderScenario.description);
        result.put("uvTorch", documentReaderScenario.uvTorch);
        result.put("seriesProcessMode", documentReaderScenario.seriesProcessMode);
        result.put("multiPageOff", documentReaderScenario.multiPageOff);
        result.put("frameKWHLandscape", documentReaderScenario.frameKWHLandscape);
        result.put("frameKWHPortrait", documentReaderScenario.frameKWHPortrait);
        result.put("frameKWHDoublePageSpreadPortrait", documentReaderScenario.frameKWHDoublePageSpreadPortrait);
        result.put("frameKWHDoublePageSpreadLandscape", documentReaderScenario.frameKWHDoublePageSpreadLandscape);
        result.put("frameOrientation", documentReaderScenario.frameOrientation);
        result.put("faceExt", documentReaderScenario.faceExt);

        return result;
    }

    static private JSONObject generateDocumentReaderNotification(DocumentReaderNotification documentReaderNotification) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("code", documentReaderNotification.code & 0xFFFF0000);
        result.put("number", documentReaderNotification.code & 0x0000FFFF);
        result.put("value", documentReaderNotification.value);

        return result;
    }

    static private JSONObject generateDocumentReaderDocumentType(DocumentReaderDocumentType documentReaderDocumentType, Context context) throws JSONException {
        JSONObject documentType = new JSONObject();
        documentType.put("dFormat", documentReaderDocumentType.dFormat);
        documentType.put("dMRZ", documentReaderDocumentType.dMRZ);
        documentType.put("documentID", documentReaderDocumentType.documentID);
        documentType.put("dType", documentReaderDocumentType.dType);
        documentType.put("dCountryName", documentReaderDocumentType.dCountryName);
        documentType.put("dDescription", documentReaderDocumentType.dDescription);
        documentType.put("dYear", documentReaderDocumentType.dYear);
        documentType.put("ICAOCode", documentReaderDocumentType.ICAOCode);
        documentType.put("name", documentReaderDocumentType.name);
        documentType.put("pageIndex", documentReaderDocumentType.pageIndex);
        if (documentReaderDocumentType.FDSID != null)
            documentType.put("FDSID", generateIntArray(documentReaderDocumentType.FDSID));

        return documentType;
    }

    static private JSONObject generateDocumentReaderGraphicResult(DocumentReaderGraphicResult documentReaderGraphicResult, Context context) throws JSONException {
        return new JSONObject().put("fields", generateList(documentReaderGraphicResult.fields, JSONConstructor::generateDocumentReaderGraphicField, context));
    }

    static private JSONObject generateDocumentReaderGraphicField(DocumentReaderGraphicField documentReaderGraphicField, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("sourceType", documentReaderGraphicField.sourceType);
        result.put("fieldType", documentReaderGraphicField.fieldType);
        result.put("fieldName", eGraphicFieldType.getTranslation(context, documentReaderGraphicField.fieldType));
        result.put("lightType", documentReaderGraphicField.light);
        result.put("lightName", eRPRM_Lights.getTranslation(context, documentReaderGraphicField.light));
        result.put("pageIndex", documentReaderGraphicField.pageIndex);
        result.put("value", documentReaderGraphicField.imageBase64());
        if (documentReaderGraphicField.boundRect != null)
            result.put("fieldRect", generateDocReaderFieldRect(documentReaderGraphicField.boundRect));

        return result;
    }

    static String bitmapToBase64String(Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();

        return Base64.encodeToString(byteArray, Base64.DEFAULT);
    }

    static private JSONObject generateDocReaderFieldRect(DocReaderFieldRect rect) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("bottom", rect.bottom);
        result.put("top", rect.top);
        result.put("left", rect.left);
        result.put("right", rect.right);

        return result;
    }

    static private JSONObject generateImageQualityGroup(ImageQualityGroup imageQualityGroup, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("result", imageQualityGroup.result);
        result.put("count", imageQualityGroup.count);
        result.put("imageQualityList", generateList(imageQualityGroup.imageQualityList, JSONConstructor::generateImageQuality, context));

        return result;
    }

    static private JSONObject generateImageQuality(ImageQuality imageQuality, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("result", imageQuality.result);
        result.put("type", imageQuality.type);
        result.put("featureType", imageQuality.featureType);

        return result;
    }

    static private JSONObject generateRfidSessionData(RFIDSessionData rfidSessionData, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("totalBytesSent", rfidSessionData.totalBytesSent);
        result.put("totalBytesReceived", rfidSessionData.totalBytesReceived);
        result.put("status", rfidSessionData.status);
        result.put("processTime", rfidSessionData.processTime);
        result.put("extLeSupport", rfidSessionData.extLeSupport);
        result.put("accessControls", generateList(rfidSessionData.accessControls, JSONConstructor::generateAccessControlProcedureType, context));
        result.put("applications", generateList(rfidSessionData.applications, JSONConstructor::generateApplication, context));
        result.put("securityObjects", generateList(rfidSessionData.securityObjects, JSONConstructor::generateSecurityObject, context));
        if (rfidSessionData.cardProperties != null)
            result.put("cardProperties", generateCardProperties(rfidSessionData.cardProperties));
        if (rfidSessionData.sessionDataStatus != null)
            result.put("sessionDataStatus", generateRFIDSessionDataStatus(rfidSessionData.sessionDataStatus));

        return result;
    }

    static private JSONObject generateRFIDSessionDataStatus(RFIDSessionDataStatus input) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("AA", input.AA);
        result.put("BAC", input.BAC);
        result.put("CA", input.CA);
        result.put("PA", input.PA);
        result.put("PACE", input.PACE);
        result.put("TA", input.TA);
        result.put("overallStatus", input.overallStatus);

        return result;
    }

    static private JSONObject generateAccessControlProcedureType(AccessControlProcedureType type, Context context) throws JSONException {
        JSONObject accessControl = new JSONObject();
        accessControl.put("activeOptionIdx", type.activeOptionIdx);
        accessControl.put("status", type.status);
        accessControl.put("type", type.type);
        accessControl.put("notifications", generateList(type.notifications));

        return accessControl;
    }

    static private JSONObject generateApplication(Application application, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("status", application.status);
        result.put("type", application.type);
        result.put("applicationID", application.applicationID);
        result.put("dataHashAlgorithm", application.dataHashAlgorithm);
        result.put("unicodeVersion", application.unicodeVersion);
        result.put("version", application.version);
        result.put("files", generateList(application.files, JSONConstructor::generateFile, context));

        return result;
    }

    static private JSONObject generateFile(File file, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("fileID", file.fileID);
        result.put("pAStatus", file.pAStatus);
        result.put("readingStatus", file.readingStatus);
        result.put("readingTime", file.readingTime);
        result.put("type", file.type);
        result.put("docFieldsText", generateList(file.docFieldsText));
        result.put("notifications", generateList(file.notifications));
        result.put("docFieldsGraphics", generateList(file.docFieldsGraphics));
        result.put("docFieldsOriginals", generateList(file.docFieldsOriginals));
        if (file.certificates != null)
            result.put("certificates", generateSecurityObjectCertificates(file.certificates));
        if (file.fileData != null)
            result.put("fileData", generateFileData(file.fileData));

        return result;
    }

    static private JSONObject generateSecurityObjectCertificates(SecurityObjectCertificates securityObjectCertificates) throws JSONException {
        JSONObject result = new JSONObject();
        if (securityObjectCertificates.securityObject != null)
            result.put("securityObject", generateCertificateData(securityObjectCertificates.securityObject));
        return result;
    }

    static private JSONObject generateCertificateData(CertificateData certificateData) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("length", certificateData.length);
        result.put("data", certificateData.data);

        return result;
    }

    static private JSONObject generateFileData(FileData fileData) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("length", fileData.length);
        result.put("status", fileData.status);
        result.put("type", fileData.type);
        result.put("data", fileData.data);

        return result;
    }

    static private JSONObject generateCardProperties(CardProperties cardProperties) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("aTQA", cardProperties.aTQA);
        result.put("bitRateR", cardProperties.bitRateR);
        result.put("bitRateS", cardProperties.bitRateS);
        result.put("chipTypeA", cardProperties.chipTypeA);
        result.put("mifareMemory", cardProperties.mifareMemory);
        result.put("rfidType", cardProperties.rfidType);
        result.put("sAK", cardProperties.sAK);
        result.put("support4", cardProperties.support4);
        result.put("supportMifare", cardProperties.supportMifare);
        result.put("aTQB", cardProperties.aTQB);
        result.put("aTR", cardProperties.aTR);
        result.put("baudrate1", cardProperties.baudrate1);
        result.put("baudrate2", cardProperties.baudrate2);
        result.put("uID", cardProperties.uID);

        return result;
    }

    static private JSONObject generateSecurityObject(SecurityObject securityObject, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("objectType", securityObject.objectType);
        result.put("fileReference", securityObject.fileReference);
        result.put("version", securityObject.version);
        result.put("notifications", generateList(securityObject.notifications));
        result.put("signerInfos", generateList(securityObject.signerInfos, JSONConstructor::generateSignerInfo, context));

        return result;
    }

    static private JSONObject generateAttribute(Attribute attribute, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        if (attribute.value != null)
            result.put("value", generateValue(attribute.value));
        result.put("type", attribute.type);

        return result;
    }

    static private JSONObject generateExtension(Extension extension, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("data", extension.data);
        result.put("type", extension.type);

        return result;
    }

    static private JSONObject generateCertificateChain(CertificateChain certificateChain, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("origin", certificateChain.origin);
        result.put("paStatus", certificateChain.paStatus);
        result.put("type", certificateChain.type);
        result.put("version", certificateChain.version);
        result.put("serialNumber", certificateChain.serialNumber);
        result.put("signatureAlgorithm", certificateChain.signatureAlgorithm);
        result.put("subjectPKAlgorithm", certificateChain.subjectPKAlgorithm);
        result.put("notifications", generateList(certificateChain.notifications));
        result.put("extensions", generateList(certificateChain.extensions, JSONConstructor::generateExtension, context));
        if (certificateChain.fileName != null)
            result.put("fileName", generateValue(certificateChain.fileName));
        if (certificateChain.subject != null)
            result.put("subject", generateAuthority(certificateChain.subject, context));
        if (certificateChain.issuer != null)
            result.put("issuer", generateAuthority(certificateChain.issuer, context));
        if (certificateChain.validity != null)
            result.put("validity", generateValidity(certificateChain.validity));

        return result;
    }

    static private JSONObject generateValue(Value value) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("data", value.data);
        result.put("length", value.length);
        result.put("status", value.status);
        result.put("type", value.type);
        result.put("format", value.format);

        return result;
    }

    static private JSONObject generateAuthority(Authority authority, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("data", authority.data);
        result.put("attributes", generateList(authority.attributes, JSONConstructor::generateAttribute, context));
        if (authority.friendlyName != null)
            result.put("friendlyName", generateValue(authority.friendlyName));

        return result;
    }

    static private JSONObject generateValidity(Validity validity) throws JSONException {
        JSONObject result = new JSONObject();
        if (validity.notAfter != null)
            result.put("notAfter", generateValue(validity.notAfter));
        if (validity.notBefore != null)
            result.put("notBefore", generateValue(validity.notBefore));

        return result;
    }

    static private JSONObject generateSignerInfo(SignerInfo signerInfo, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("paStatus", signerInfo.paStatus);
        result.put("version", signerInfo.version);
        result.put("dataToHash", signerInfo.dataToHash);
        result.put("digestAlgorithm", signerInfo.digestAlgorithm);
        result.put("signatureAlgorithm", signerInfo.signatureAlgorithm);
        result.put("certificateChain", generateList(signerInfo.certificateChain, JSONConstructor::generateCertificateChain, context));
        result.put("notifications", generateList(signerInfo.notifications));
        result.put("signedAttributes", generateList(signerInfo.signedAttributes, JSONConstructor::generateExtension, context));
        if (signerInfo.signature != null)
            result.put("signature", generateValue(signerInfo.signature));
        if (signerInfo.serialNumber != null)
            result.put("serialNumber", generateValue(signerInfo.serialNumber));
        if (signerInfo.subjectKeyIdentifier != null)
            result.put("subjectKeyIdentifier", generateValue(signerInfo.subjectKeyIdentifier));
        if (signerInfo.issuer != null)
            result.put("issuer", generateAuthority(signerInfo.issuer, context));

        return result;
    }

    static private JSONObject generateDocumentReaderTextResult(DocumentReaderTextResult documentReaderTextResult, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("status", documentReaderTextResult.status);
        result.put("fields", generateList(documentReaderTextResult.fields, JSONConstructor::generateDocumentReaderTextField, context));

        return result;
    }

    static private JSONObject generateDocumentReaderTextField(DocumentReaderTextField documentReaderTextField, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("fieldType", documentReaderTextField.fieldType);
        result.put("lcid", documentReaderTextField.lcid);
        result.put("lcidName", documentReaderTextField.getLcidName(context));
        result.put("status", documentReaderTextField.status);
        result.put("fieldName", documentReaderTextField.getFieldName(context));
        result.put("values", generateList(documentReaderTextField.values, JSONConstructor::generateDocumentReaderValue, context));
        if (documentReaderTextField.value() != null)
            result.put("value", generateDocumentReaderValue(Objects.requireNonNull(documentReaderTextField.value()), context));

        return result;
    }

    static private JSONObject generateDocumentReaderValue(DocumentReaderValue documentReaderValue, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("pageIndex", documentReaderValue.pageIndex);
        result.put("sourceType", documentReaderValue.sourceType);
        result.put("validity", documentReaderValue.validity);
        result.put("value", documentReaderValue.value);
        result.put("originalValue", documentReaderValue.originalValue);
        result.put("probability", documentReaderValue.probability);
        result.put("comparison", generateMapIntegerInteger(documentReaderValue.comparison));
        if (documentReaderValue.boundRect != null)
            result.put("boundRect", generateRect(documentReaderValue.boundRect));

        return result;
    }

    static private JSONObject generateRect(Rect rect) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("bottom", rect.bottom);
        result.put("left", rect.left);
        result.put("top", rect.top);
        result.put("right", rect.right);

        return result;
    }

    static private JSONObject generateMapIntegerInteger(Map<Integer, Integer> map) throws JSONException {
        JSONObject result = new JSONObject();
        for (Map.Entry<Integer, Integer> entry : map.entrySet())
            if (entry != null)
                result.put(entry.getKey().toString(), entry.getValue());
        return result;
    }

    static private JSONObject generateDocumentReaderAuthenticityResult(DocumentReaderAuthenticityResult documentReaderAuthenticityResult, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("status", documentReaderAuthenticityResult.getStatus());
        result.put("checks", generateList(documentReaderAuthenticityResult.checks, JSONConstructor::generateDocumentReaderAuthenticityCheck, context));

        return result;
    }

    static private JSONObject generateDocumentReaderAuthenticityCheck(DocumentReaderAuthenticityCheck documentReaderAuthenticityCheck, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("type", documentReaderAuthenticityCheck.type);
        result.put("typeName", documentReaderAuthenticityCheck.getTypeName(context));
        result.put("pageIndex", documentReaderAuthenticityCheck.pageIndex);
        result.put("elements", generateList(documentReaderAuthenticityCheck.elements, JSONConstructor::generateDocumentReaderAuthenticityElement, context));
        result.put("status", documentReaderAuthenticityCheck.getStatus());

        return result;
    }

    static private JSONObject generateDocumentReaderAuthenticityElement(DocumentReaderAuthenticityElement documentReaderAuthenticityElement, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("status", documentReaderAuthenticityElement.status);
        result.put("elementType", documentReaderAuthenticityElement.elementType);
        result.put("elementTypeName", documentReaderAuthenticityElement.getElementTypeName(context));
        result.put("elementDiagnose", documentReaderAuthenticityElement.elementDiagnose);
        result.put("elementDiagnoseName", documentReaderAuthenticityElement.getElementDiagnoseName(context));

        return result;
    }

    static private JSONObject generateDocumentReaderBarcodeResult(DocumentReaderBarcodeResult documentReaderBarcodeResult, Context context) throws JSONException {
        return new JSONObject().put("fields", generateList(documentReaderBarcodeResult.fields, JSONConstructor::generateDocumentReaderBarcodeField, context));
    }

    static private JSONObject generateDocumentReaderBarcodeField(DocumentReaderBarcodeField documentReaderBarcodeField, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("barcodeType", documentReaderBarcodeField.barcodeType);
        result.put("status", documentReaderBarcodeField.status);
        result.put("pageIndex", documentReaderBarcodeField.pageIndex);
        if (documentReaderBarcodeField.pdf417Info != null)
            result.put("pdf417Info", generatePDF417Info(documentReaderBarcodeField.pdf417Info));
        if (documentReaderBarcodeField.data != null)
            result.put("data", generateByteArray(documentReaderBarcodeField.data));

        return result;
    }

    static private JSONObject generatePDF417Info(PDF417Info pdf417Info) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("errorLevel", pdf417Info.errorLevel);
        result.put("columns", pdf417Info.columns);
        result.put("rows", pdf417Info.rows);

        return result;
    }

    static JSONObject generateFaceMetaData(FaceMetaData faceMetaData, @SuppressWarnings("unused") Context context) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("ID", faceMetaData.ID);
        result.put("rollAngle", faceMetaData.rollAngle);
        result.put("bounds", generateBounds(faceMetaData.bounds));

        return result;
    }

    static private JSONObject generateBounds(Bounds bounds) throws JSONException {
        JSONObject result = new JSONObject();
        result.put("height", bounds.height);
        result.put("width", bounds.width);
        result.put("x", bounds.x);
        result.put("y", bounds.y);

        return result;
    }

    static JSONArray generateIntArray(int[] array) throws JSONException {
        JSONArray result = new JSONArray();
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONArray generateByteArray(byte[] array) throws JSONException {
        JSONArray result = new JSONArray();
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);

        return result;
    }

    static JSONObject generateCompletion(int action, DocumentReaderResults results, Throwable error, Context context) {
        JSONObject result = new JSONObject();
        try {
            result.put("action", action);
            switch (action) {
                case DocReaderAction.PROCESS:
                case DocReaderAction.PROCESS_WHITE_UV_IMAGES:
                    result.put("results", "");
                    break;
                case DocReaderAction.NOTIFICATION:
                    result.put("results", resultsToJsonObjectNotification(results));
                    break;
                case DocReaderAction.COMPLETE:
                case DocReaderAction.MORE_PAGES_AVAILABLE:
                case DocReaderAction.CANCEL:
                case DocReaderAction.ERROR:
                    result.put("results", resultsToJsonObject(results, context));
                    break;
            }
            result.put("error", generateThrowable(error, context));
        } catch (JSONException ignored) {
        }

        return result;
    }

    static JSONObject generateThrowable(Throwable throwable, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        if (throwable == null)
            return result;
        result.put("localizedMessage", throwable.getLocalizedMessage());
        result.put("message", throwable.getMessage());
        result.put("string", throwable.toString());
        result.put("stackTrace", generateArray(throwable.getStackTrace(), JSONConstructor::generateStackTraceElement, context));

        return result;
    }

    static JSONObject generateStackTraceElement(StackTraceElement e, Context context) throws JSONException {
        JSONObject result = new JSONObject();
        if (e == null)
            return result;
        result.put("className", e.getClassName());
        result.put("fileName", e.getFileName());
        result.put("lineNumber", e.getLineNumber());
        result.put("methodName", e.getMethodName());
        result.put("isNativeMethod", e.isNativeMethod());
        result.put("string", e.toString());

        return result;
    }

    // From JSON

    static Bitmap bitmapFromBase64(String base64) {
        byte[] decodedString = Base64.decode(base64, Base64.DEFAULT);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        Bitmap result = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length, options);
        int sizeMultiplier = result.getByteCount() / 5000000;
        if (result.getByteCount() > 5000000)
            result = Bitmap.createScaledBitmap(result, result.getWidth() / (int) Math.sqrt(sizeMultiplier), result.getHeight() / (int) Math.sqrt(sizeMultiplier), false);
        return result;
    }

    static Drawable drawableFromBase64(String base64, Context context) {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(Base64.decode(base64.getBytes(), Base64.DEFAULT));
        return Drawable.createFromResourceStream(context.getResources(), null, byteArrayInputStream, null);
    }

    static Bitmap bitmapFromDrawable(Drawable drawable) {
        Bitmap bitmap;

        if (drawable instanceof BitmapDrawable) {
            BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
            if (bitmapDrawable.getBitmap() != null) {
                return bitmapDrawable.getBitmap();
            }
        }

        if (drawable.getIntrinsicWidth() <= 0 || drawable.getIntrinsicHeight() <= 0) {
            bitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        } else {
            bitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        }

        Canvas canvas = new Canvas(bitmap);
        drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        drawable.draw(canvas);
        return bitmap;
    }

    static Matrix matrixFromFloatArray(float[] floats) {
        Matrix matrix = new Matrix();
        matrix.setValues(floats);
        return matrix;
    }

    static float[] floatArrayFromJson(JSONArray jsonArray) throws JSONException {
        float[] result = new float[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = (float) jsonArray.getDouble(i);

        return result;
    }

    static int[] intArrayFromJson(JSONArray jsonArray) throws JSONException {
        int[] result = new int[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = jsonArray.getInt(i);

        return result;
    }

    static String[] barcodeTypeArrayFromJson(JSONArray jsonArray) throws JSONException {
        String[] result = new String[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = BarcodeType.valueOf(jsonArray.getInt(i));

        return result;
    }

    static FaceMetaData[] faceMetaDataArrayFromJson(JSONArray jsonArray) throws JSONException {
        FaceMetaData[] result = new FaceMetaData[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = faceMetaDataFromJson(jsonArray.getJSONObject(i));

        return result;
    }

    static FaceMetaData faceMetaDataFromJson(JSONObject object) throws JSONException {
        FaceMetaData result = new FaceMetaData();
        result.ID = object.getInt("ID");
        result.rollAngle = object.getInt("rollAngle");
        result.bounds = boundsFromJson(object.getJSONObject("bounds"));

        return result;
    }

    static Bounds boundsFromJson(JSONObject object) throws JSONException {
        Bounds result = new Bounds();
        result.height = object.getInt("height");
        result.width = object.getInt("width");
        result.x = object.getInt("x");
        result.y = object.getInt("y");

        return result;
    }

    static List<String> stringListFromJson(JSONArray jsonArray) {
        List<String> result = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++)
            result.add(jsonArray.optString(i));
        return result;
    }
}