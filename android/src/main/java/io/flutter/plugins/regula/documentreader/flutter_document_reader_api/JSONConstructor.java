package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Helpers.*;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.util.Base64;

import com.regula.common.exception.RegulaException;
import com.regula.documentreader.api.config.RecognizeConfig;
import com.regula.documentreader.api.config.ScannerConfig;
import com.regula.documentreader.api.enums.*;
import com.regula.documentreader.api.params.*;
import com.regula.documentreader.api.params.rfid.*;
import com.regula.documentreader.api.params.rfid.authorization.*;
import com.regula.documentreader.api.results.*;
import com.regula.documentreader.api.results.authenticity.*;
import com.regula.documentreader.api.results.rfid.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Arrays;

@SuppressWarnings("deprecation")
class JSONConstructor {
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

    static JSONObject generateCompletion(int action, DocumentReaderResults results, RegulaException error, Context context) {
        JSONObject result = new JSONObject();
        try {
            if (Arrays.asList(
                    DocReaderAction.COMPLETE,
                    DocReaderAction.MORE_PAGES_AVAILABLE,
                    DocReaderAction.CANCEL,
                    DocReaderAction.ERROR,
                    DocReaderAction.TIMEOUT
            ).contains(action))
                result.put("results", generateDocumentReaderResults(results, context));
            result.put("action", action);
            result.put("error", generateRegulaException(error));
        } catch (JSONException ignored) {
        }
        return result;
    }

    static JSONObject generateRegulaException(RegulaException input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("errorCode", input.getErrorCode());
            result.put("message", input.getMessage());
        } catch (JSONException e) {
            e.printStackTrace();
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

    static TccParams TCCParamsFromJSON(JSONObject input) {
        TccParams result = new TccParams();
        try {
            if (input.has("serviceUrlTA"))
                result.setServiceUrlTA(input.getString("serviceUrlTA"));
            if (input.has("serviceUrlPA"))
                result.setServiceUrlPA(input.getString("serviceUrlPA"));
            if (input.has("pfxCertUrl"))
                result.setPfxCertUrl(input.getString("pfxCertUrl"));
            if (input.has("pfxPassPhrase"))
                result.setPfxPassPhrase(input.getString("pfxPassPhrase"));
            if (input.has("pfxCert"))
                result.setPfxCert(Base64.decode(input.getString("pfxCert"), Base64.DEFAULT));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ImageInputData ImageInputDataFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            Bitmap image;
            int light = 6;
            int pageIndex = 0;

            if (input.has("image"))
                image = bitmapFromBase64(input.getString("image"));
            else return null;
            if (input.has("light"))
                pageIndex = input.getInt("light");
            if (input.has("pageIndex"))
                pageIndex = input.getInt("pageIndex");
            return new ImageInputData(image, light, pageIndex);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return null;
    }

    static DocReaderConfig DocReaderConfigFromJSON(JSONObject input) {
        DocReaderConfig result;
        byte[] license;
        try {
            if (input.has("license")) {
                license = Base64.decode(input.getString("license"), Base64.DEFAULT);
                result = new DocReaderConfig(license);
            } else return null;
            if (input.has("customDb"))
                result = new DocReaderConfig(license, Base64.decode(input.getString("customDb"), Base64.DEFAULT));
            if (input.has("licenseUpdate"))
                result.setLicenseUpdate(input.getBoolean("licenseUpdate"));
            if (input.has("delayedNNLoad"))
                result.setDelayedNNLoad(input.getBoolean("delayedNNLoad"));
            if (input.has("blackList"))
                result.setBlackList(input.getJSONObject("blackList"));

            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static ScannerConfig ScannerConfigFromJSON(JSONObject input) {
        if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null;
        try {
            ScannerConfig.Builder builder;
            if (input.has("scenario"))
                builder = new ScannerConfig.Builder(input.getString("scenario"));
            else
                builder = new ScannerConfig.Builder(RegulaConfig.OnlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
            if (input.has("onlineProcessingConfig"))
                builder.setOnlineProcessingConfig(RegulaConfig.OnlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
            if (input.has("livePortrait"))
                builder.setLivePortrait(bitmapFromBase64(input.getString("livePortrait")));
            if (input.has("extPortrait"))
                builder.setExtPortrait(bitmapFromBase64(input.getString("extPortrait")));
            if (input.has("cameraId"))
                builder.setCameraId(input.getInt("cameraId"));
            return builder.build();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static RecognizeConfig RecognizeConfigFromJSON(JSONObject input) {
        if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null;
        if (!input.has("image") && !input.has("images") && !input.has("imageInputData")) return null;
        try {
            RecognizeConfig.Builder builder;
            if (input.has("scenario"))
                builder = new RecognizeConfig.Builder(input.getString("scenario"));
            else
                builder = new RecognizeConfig.Builder(RegulaConfig.OnlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
            if (input.has("livePortrait"))
                builder.setLivePortrait(bitmapFromBase64(input.getString("livePortrait")));
            if (input.has("extPortrait"))
                builder.setExtPortrait(bitmapFromBase64(input.getString("extPortrait")));
            if (input.has("image"))
                builder.setBitmap(bitmapFromBase64(input.getString("image")));
            if (input.has("oneShotIdentification"))
                builder.setOneShotIdentification(input.getBoolean("oneShotIdentification"));
            if (input.has("images")) {
                JSONArray base64Images = input.getJSONArray("images");
                Bitmap[] images = new Bitmap[base64Images.length()];
                for (int i = 0; i < images.length; i++)
                    images[i] = bitmapFromBase64(base64Images.getString(i));
                builder.setBitmaps(images);
            }
            if (input.has("imageInputData")) {
                JSONArray base64InputData = input.getJSONArray("imageInputData");
                ImageInputData[] inputData = new ImageInputData[base64InputData.length()];
                for (int i = 0; i < inputData.length; i++)
                    inputData[i] = ImageInputDataFromJSON(base64InputData.getJSONObject(i));
                builder.setImageInputData(inputData);
            }
            return builder.build();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static ImageQA ImageQAFromJSON(JSONObject input) {
        if (input == null) return null;
        ImageQA result = new ImageQA();
        try {
            if (input.has("dpiThreshold"))
                result.dpiThreshold = input.getInt("dpiThreshold");
            if (input.has("angleThreshold"))
                result.angleThreshold = input.getInt("angleThreshold");
            if (input.has("focusCheck"))
                result.focusCheck = input.getBoolean("focusCheck");
            if (input.has("glaresCheck"))
                result.glaresCheck = input.getBoolean("glaresCheck");
            if (input.has("colornessCheck"))
                result.colornessCheck = input.getBoolean("colornessCheck");
            if (input.has("moireCheck"))
                result.moireCheck = input.getBoolean("moireCheck");
            if (input.has("expectedPass"))
                result.expectedPass = intArrayFromJSON(input.getJSONArray("expectedPass"));
            if (input.has("documentPositionIndent"))
                result.documentPositionIndent = input.getInt("documentPositionIndent");
            if (input.has("glaresCheckParams"))
                result.glaresCheckParams = GlaresCheckParamsFromJSON(input.getJSONObject("glaresCheckParams"));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return result;
    }

    static ImageQA.GlaresCheckParams GlaresCheckParamsFromJSON(JSONObject input) {
        if (input == null) return null;
        ImageQA.GlaresCheckParams result = new ImageQA.GlaresCheckParams();
        try {
            if (input.has("imgMarginPart"))
                result.imgMarginPart = input.getDouble("imgMarginPart");
            if (input.has("maxGlaringPart"))
                result.maxGlaringPart = input.getDouble("maxGlaringPart");
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return result;
    }

    static JSONObject generateImageQA(ImageQA input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("dpiThreshold", input.dpiThreshold);
            result.put("angleThreshold", input.angleThreshold);
            result.put("focusCheck", input.focusCheck);
            result.put("glaresCheck", input.glaresCheck);
            result.put("colornessCheck", input.colornessCheck);
            result.put("moireCheck", input.moireCheck);
            result.put("documentPositionIndent", input.documentPositionIndent);
            result.put("expectedPass", generateIntArray(input.expectedPass));
            result.put("glaresCheckParams", generateGlaresCheckParams(input.glaresCheckParams));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateGlaresCheckParams(ImageQA.GlaresCheckParams input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("imgMarginPart", input.imgMarginPart);
            result.put("maxGlaringPart", input.maxGlaringPart);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    // To JSON

    static JSONObject generateDocumentReaderScenario(DocumentReaderScenario input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("name", input.name);
            result.put("caption", input.caption);
            result.put("description", input.description);
            result.put("multiPageOff", input.multiPageOff);
            result.put("frameKWHLandscape", input.frameKWHLandscape);
            result.put("frameKWHPortrait", input.frameKWHPortrait);
            result.put("frameKWHDoublePageSpreadPortrait", input.frameKWHDoublePageSpreadPortrait);
            result.put("frameKWHDoublePageSpreadLandscape", input.frameKWHDoublePageSpreadLandscape);
            result.put("frameOrientation", input.frameOrientation);
            result.put("uvTorch", input.uvTorch);
            result.put("faceExt", input.faceExt);
            result.put("seriesProcessMode", input.seriesProcessMode);
            result.put("manualCrop", input.manualCrop);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateRect(Rect input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
        try {
            result.put("sourceType", input.sourceType);
            result.put("fieldType", input.fieldType);
            result.put("light", input.light);
            result.put("pageIndex", input.pageIndex);
            result.put("originalPageIndex", input.originalPageIndex);
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
        if (input == null) return null;
        try {
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderGraphicField, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderValue(DocumentReaderValue input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("pageIndex", input.pageIndex);
            result.put("sourceType", input.sourceType);
            result.put("validity", input.validity);
            result.put("probability", input.probability);
            result.put("value", input.value);
            result.put("originalValue", input.originalValue);
            result.put("boundRect", generateRect(input.boundRect));
            result.put("comparison", generateMap(input.comparison));
            result.put("originalSymbols", generateList(input.originalSymbols, JSONConstructor::generateDocumentReaderSymbol));
            result.put("rfidOrigin", generateDocumentReaderRfidOrigin(input.rfidOrigin));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderTextField(DocumentReaderTextField input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("fieldType", input.fieldType);
            result.put("lcid", input.lcid);
            result.put("status", input.status);
            result.put("lcidName", input.getLcidName(context));
            result.put("fieldName", input.getFieldName(context));
            result.put("value", input.value);
            result.put("getValue", generateDocumentReaderValue(input.value(), context));
            result.put("values", generateList(input.values, JSONConstructor::generateDocumentReaderValue, context));
            result.put("comparisonList", generateList(input.comparisonList, JSONConstructor::generateDocumentReaderComparison));
            result.put("validityList", generateList(input.validityList, JSONConstructor::generateDocumentReaderValidity));
            result.put("comparisonStatus", input.comparisonStatus);
            result.put("validityStatus", input.validityStatus);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderTextResult(DocumentReaderTextResult input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("status", input.status);
            result.put("comparisonStatus", input.comparisonStatus);
            result.put("validityStatus", input.validityStatus);
            result.put("availableSourceList", generateList(input.availableSourceList, JSONConstructor::generateDocumentReaderTextSource));
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderTextField, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCoordinate(Coordinate input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
        try {
            result.put("pageIndex", input.pageIndex);
            result.put("documentID", input.documentID);
            result.put("dType", input.dType);
            result.put("dFormat", input.dFormat);
            result.put("dMRZ", input.dMRZ);
            result.put("isDeprecated", input.isDeprecated);
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
        if (input == null) return null;
        try {
            result.put("notificationCode", input.getNotificationCode());
            result.put("dataFileType", input.getDataFileType());
            result.put("progress", input.getProgress());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateAccessControlProcedureType(AccessControlProcedureType input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
        try {
            result.put("securityObject", generateCertificateData(input.securityObject));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateFile(File input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
        try {
            result.put("totalBytesReceived", input.totalBytesReceived);
            result.put("totalBytesSent", input.totalBytesSent);
            result.put("status", input.status);
            result.put("extLeSupport", input.extLeSupport);
            result.put("processTime", input.processTime);
            result.put("cardProperties", generateCardProperties(input.cardProperties));
            result.put("accessControls", generateList(input.accessControls, JSONConstructor::generateAccessControlProcedureType));
            result.put("applications", generateList(input.applications, JSONConstructor::generateApplication));
            result.put("securityObjects", generateList(input.securityObjects, JSONConstructor::generateSecurityObject));
            result.put("dataGroups", generateIntArray(input.dataGroups));
            result.put("dataFields", generateList(input.dataFields, JSONConstructor::generateDataField));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDataField(DataField input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("data", input.getData());
            result.put("fieldType", input.getFieldType());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderAuthenticityCheck(DocumentReaderAuthenticityCheck input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
        try {
            result.put("errorLevel", input.errorLevel);
            result.put("columns", input.columns);
            result.put("rows", input.rows);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderBarcodeResult(DocumentReaderBarcodeResult input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("fields", generateList(input.fields, JSONConstructor::generateDocumentReaderBarcodeField));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderBarcodeField(DocumentReaderBarcodeField input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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

    static JSONObject generatePAResourcesIssuer(PAResourcesIssuer input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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
        if (input == null) return null;
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

    static JSONObject generateDocReaderDocumentsDatabase(DocReaderDocumentsDatabase input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("databaseID", input.databaseID);
            result.put("version", input.version);
            result.put("date", input.date);
            result.put("databaseDescription", input.databaseDescription);
            result.put("countriesNumber", input.countriesNumber);
            result.put("documentsNumber", input.documentsNumber);
            result.put("size", input.size);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderComparison(DocumentReaderComparison input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("sourceTypeLeft", input.sourceTypeLeft);
            result.put("sourceTypeRight", input.sourceTypeRight);
            result.put("status", input.status);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderRfidOrigin(DocumentReaderRfidOrigin input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("dg", input.dg);
            result.put("dgTag", input.dgTag);
            result.put("entryView", input.entryView);
            result.put("tagEntry", input.tagEntry);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderTextSource(DocumentReaderTextSource input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("sourceType", input.sourceType);
            result.put("source", input.source);
            result.put("validityStatus", input.validityStatus);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderSymbol(DocumentReaderSymbol input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("code", input.code);
            result.put("rect", generateRect(input.rect));
            result.put("probability", input.probability);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderValidity(DocumentReaderValidity input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("sourceType", input.sourceType);
            result.put("status", input.status);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocumentReaderResults(DocumentReaderResults input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("videoCaptureSessionId", input.videoCaptureSessionId);
            result.put("chipPage", input.chipPage);
            result.put("irElapsedTime", input.irElapsedTime);
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
            result.put("ppmIn", input.ppmIn);
            result.put("documentType", generateList(input.documentType, JSONConstructor::generateDocumentReaderDocumentType));
            result.put("status", generateDocumentReaderResultsStatus(input.status));
            result.put("vdsncData", generateVDSNCData(input.vdsncData));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    // From JSON
}