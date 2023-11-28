//
//  JSONConstructor.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Utils.*;
import static io.flutter.plugins.regula.documentreader.flutter_document_reader_api.Convert.*;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.util.Pair;

import com.regula.common.exception.RegulaException;
import com.regula.documentreader.api.License;
import com.regula.documentreader.api.ble.BLEWrapper;
import com.regula.documentreader.api.config.RecognizeConfig;
import com.regula.documentreader.api.config.ScannerConfig;
import com.regula.documentreader.api.enums.*;
import com.regula.documentreader.api.params.*;
import com.regula.documentreader.api.params.rfid.*;
import com.regula.documentreader.api.params.rfid.authorization.*;
import com.regula.documentreader.api.params.rfid.dg.EDLDataGroups;
import com.regula.documentreader.api.params.rfid.dg.EIDDataGroups;
import com.regula.documentreader.api.params.rfid.dg.EPassportDataGroups;
import com.regula.documentreader.api.results.*;
import com.regula.documentreader.api.results.authenticity.*;
import com.regula.documentreader.api.results.rfid.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.Objects;

class JSONConstructor {
    static JSONObject generateCompletion(int action, DocumentReaderResults results, RegulaException error, Context context) {
        JSONObject result = new JSONObject();
        try {
            result.put("action", action);
            if (Arrays.asList(
                    DocReaderAction.COMPLETE,
                    DocReaderAction.MORE_PAGES_AVAILABLE,
                    DocReaderAction.CANCEL,
                    DocReaderAction.ERROR,
                    DocReaderAction.TIMEOUT
            ).contains(action))
                result.put("results", generateDocumentReaderResults(results, context));
            result.put("error", generateRegulaException(error));
        } catch (JSONException ignored) {
        }

        return result;
    }

    static JSONObject generateSuccessCompletion(boolean success, RegulaException error) {
        JSONObject result = new JSONObject();
        try {
            result.put("success", success);
            result.put("error", generateRegulaException(error));
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

    static RegulaException regulaExceptionFromJSON(JSONObject input) {
        if (input == null) return null;
        int code = input.optInt("code");
        String message = input.optString("message");
        return new RegulaException(code, message);
    }

    static JSONObject generateRegulaException(RegulaException input) {
        if (input == null) return null;
        JSONObject result = new JSONObject();
        try {
            result.put("code", input.getErrorCode());
            result.put("message", input.getMessage());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static TccParams tccParamsFromJSON(JSONObject input) {
        if (input == null) return null;
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
                result.setPfxCert(byteArrayFromBase64(input.getString("pfxCert")));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateTccParams(TccParams input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("serviceUrlTA", input.getServiceUrlTA());
            result.put("serviceUrlPA", input.getServiceUrlPA());
            result.put("pfxCertUrl", input.getPfxCertUrl());
            result.put("pfxPassPhrase", input.getPfxPassPhrase());
            result.put("pfxCert", generateByteArray(input.getPfxCert()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static DocReaderConfig docReaderConfigFromJSON(JSONObject input) {
        if (input == null) return null;
        DocReaderConfig result;
        byte[] license;
        try {
            if (input.has("license")) {
                license = byteArrayFromBase64(input.getString("license"));
                result = new DocReaderConfig(license);
            } else return null;
            if (input.has("customDb"))
                result = new DocReaderConfig(license, byteArrayFromBase64(input.getString("customDb")));
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

    static JSONObject generateDocReaderConfig(DocReaderConfig input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("license", generateByteArray(input.getLicense()));
            result.put("customDb", generateByteArray(input.getCustomDb()));
            result.put("licenseUpdate", input.isLicenseUpdate());
            result.put("delayedNNLoad", input.isDelayedNNLoad());
            result.put("blackList", input.getBlackList());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ScannerConfig scannerConfigFromJSON(JSONObject input) {
        if (input == null) return null;
        if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null;
        try {
            ScannerConfig.Builder builder;
            if (input.has("scenario"))
                builder = new ScannerConfig.Builder(input.getString("scenario"));
            else
                builder = new ScannerConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
            if (input.has("onlineProcessingConfig"))
                builder.setOnlineProcessingConfig(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
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

    static JSONObject generateScannerConfig(ScannerConfig input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("scenario", input.getScenario());
            result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.getOnlineProcessingConfig()));
            result.put("livePortrait", bitmapToBase64(input.getLivePortrait()));
            result.put("extPortrait", bitmapToBase64(input.getExtPortrait()));
            result.put("cameraId", input.getCameraId());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static RecognizeConfig recognizeConfigFromJSON(JSONObject input) {
        if (input == null) return null;
        if (!input.has("scenario") && !input.has("onlineProcessingConfig")) return null;
        if (!input.has("image") && !input.has("images") && !input.has("imageInputData"))
            return null;
        try {
            RecognizeConfig.Builder builder;
            if (input.has("scenario"))
                builder = new RecognizeConfig.Builder(input.getString("scenario"));
            else
                builder = new RecognizeConfig.Builder(onlineProcessingConfigFromJSON(input.getJSONObject("onlineProcessingConfig")));
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
                    inputData[i] = imageInputDataFromJSON(base64InputData.getJSONObject(i));
                builder.setImageInputData(inputData);
            }
            return builder.build();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateRecognizeConfig(RecognizeConfig input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("scenario", input.getScenario());
            result.put("onlineProcessingConfig", generateOnlineProcessingConfig(input.getOnlineProcessingConfig()));
            result.put("livePortrait", bitmapToBase64(input.getLivePortrait()));
            result.put("extPortrait", bitmapToBase64(input.getExtPortrait()));
            result.put("image", bitmapToBase64(input.getBitmap()));
            result.put("oneShotIdentification", input.getOneShotIdentification());
            if (input.getBitmaps() == null)
                result.put("images", null);
            else {
                JSONArray array = new JSONArray();
                for (Bitmap bitmap : input.getBitmaps())
                    array.put(bitmapToBase64(bitmap));
                result.put("images", array);
            }
            result.put("imageInputData", generateArray(input.getImageInputData(), JSONConstructor::generateImageInputData));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ReprocParams reprocParamsFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            ReprocParams result;
            if (input.has("serviceUrl"))
                result = new ReprocParams(input.getString("serviceUrl"));
            else return null;
            if (input.has("failIfNoService"))
                result.setFailIfNoService(input.getBoolean("failIfNoService"));
            if (input.has("httpHeaders"))
                result.setHttpHeaders(stringMapFromJson(input.getJSONObject("httpHeaders")));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateReprocParams(ReprocParams input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("serviceUrl", input.getServiceUrl());
            result.put("failIfNoService", input.getFailIfNoService());
            result.put("httpHeaders", generateStringMap(input.getHttpHeaders()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static OnlineProcessingConfig onlineProcessingConfigFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            OnlineProcessingConfig.Builder builder;
            if (input.has("mode"))
                builder = new OnlineProcessingConfig.Builder(input.getInt("mode"));
            else return null;
            if (input.has("imageFormat"))
                builder.setImageFormat(input.getInt("imageFormat"));
            if (input.has("url"))
                builder.setUrl(input.getString("url"));
            if (input.has("imageCompressionQuality"))
                builder.setImageCompressionQuality((float) input.getDouble("imageCompressionQuality"));
            if (input.has("processParams")) {
                ProcessParam params = new ProcessParam();
                Config.setProcessParams(params, input.getJSONObject("processParams"));
                builder.setProcessParams(params);
            }
            return builder.build();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateOnlineProcessingConfig(OnlineProcessingConfig input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("mode", input.getMode());
            result.put("url", input.getUrl());
            result.put("processParams", Config.getProcessParams(input.getProcessParam()));
            result.put("imageFormat", input.getImageFormat());
            result.put("imageCompressionQuality", input.getImageCompressionQuality());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static FaceApiParams faceApiParamsFromJSON(JSONObject input) {
        try {
            FaceApiParams result = new FaceApiParams();
            String url;
            if (input.has("url") && !input.isNull("url")) {
                url = input.getString("url");
                result.setUrl(url);
            }
            String mode;
            if (input.has("mode") && !input.isNull("mode")) {
                mode = input.getString("mode");
                result.setMode(mode);
            }
            FaceApiParams.Search search;
            if (input.has("searchParams") && !input.isNull("searchParams")) {
                search = faceApiSearchParamsFromJSON(input.getJSONObject("searchParams"));
                result.setSearch(search);
            }
            int threshold;
            if (input.has("threshold") && !input.isNull("threshold")) {
                threshold = input.getInt("threshold");
                result.setThreshold(threshold);
            }
            int serviceTimeout;
            if (input.has("serviceTimeout") && !input.isNull("serviceTimeout")) {
                serviceTimeout = input.getInt("serviceTimeout");
                result.setServiceTimeout(serviceTimeout);
            }
            String proxy;
            if (input.has("proxy") && !input.isNull("proxy")) {
                proxy = input.getString("proxy");
                result.setProxy(proxy);
            }
            String proxyUserPwd;
            if (input.has("proxyPassword") && !input.isNull("proxyPassword")) {
                proxyUserPwd = input.getString("proxyPassword");
                result.setProxyUserPwd(proxyUserPwd);
            }
            int proxyType;
            if (input.has("proxyType") && !input.isNull("proxyType")) {
                proxyType = input.getInt("proxyType");
                result.setProxyType(proxyType);
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateFaceApiParams(FaceApiParams input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("url", input.getUrl());
            result.put("mode", input.getMode());
            result.put("searchParams", generateFaceApiSearchParams(input.getSearch()));
            result.put("threshold", input.getThreshold());
            result.put("serviceTimeout", input.getServiceTimeout());
            result.put("proxy", input.getProxy());
            result.put("proxyPassword", input.getProxyUserPwd());
            result.put("proxyType", input.getProxyType());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static FaceApiParams.Search faceApiSearchParamsFromJSON(JSONObject input) {
        try {
            FaceApiParams.Search result = new FaceApiParams.Search();
            int limit;
            if (input.has("limit") && !input.isNull("limit")) {
                limit = input.getInt("limit");
                result.setLimit(limit);
            }
            double threshold;
            if (input.has("threshold") && !input.isNull("threshold")) {
                threshold = input.getDouble("threshold");
                result.setThreshold((float) threshold);
            }
            int[] groupIds;
            if (input.has("groupIds") && !input.isNull("groupIds")) {
                JSONArray jsonArray_groupIds = input.getJSONArray("groupIds");
                groupIds = new int[jsonArray_groupIds.length()];
                for (int i = 0; i < jsonArray_groupIds.length(); i++)
                    groupIds[i] = jsonArray_groupIds.getInt(i);
                result.setGroupIds(groupIds);
            }
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateFaceApiSearchParams(FaceApiParams.Search input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("limit", input.getLimit());
            result.put("threshold", input.getThreshold());
            result.put("groupIds", generateIntArray(input.getGroupIds()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ImageQA imageQAFromJSON(JSONObject input) {
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
                result.glaresCheckParams = glaresCheckParamsFromJSON(input.getJSONObject("glaresCheckParams"));
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

    static RFIDParams rfidParamsFromJSON(JSONObject input) {
        try {
            RFIDParams result = new RFIDParams();

            if (input.has("paIgnoreNotificationCodes"))
                result.setPaIgnoreNotificationCodes(intArrayFromJSON(input.getJSONArray("paIgnoreNotificationCodes")));

            return result;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generateRFIDParams(RFIDParams input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("paIgnoreNotificationCodes", generateIntArray(input.getPaIgnoreNotificationCodes()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ProcessParam processParamFromJSON(JSONObject input) {
        ProcessParam result = null;
        try {
            result = new ProcessParam();
            Config.setProcessParams(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateProcessParam(ProcessParam input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getProcessParams(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static EDLDataGroups eDLDataGroupsFromJSON(JSONObject input) {
        EDLDataGroups result = null;
        try {
            result = new EDLDataGroups();
            Config.setDataGroups(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateEDLDataGroups(EDLDataGroups input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getDataGroups(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static EPassportDataGroups ePassportDataGroupsFromJSON(JSONObject input) {
        EPassportDataGroups result = null;
        try {
            result = new EPassportDataGroups();
            Config.setDataGroups(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateEPassportDataGroups(EPassportDataGroups input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getDataGroups(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static EIDDataGroups eIDDataGroupsFromJSON(JSONObject input) {
        EIDDataGroups result = null;
        try {
            result = new EIDDataGroups();
            Config.setDataGroups(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateEIDDataGroups(EIDDataGroups input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getDataGroups(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static RfidScenario rfidScenarioFromJSON(JSONObject input) {
        RfidScenario result = null;
        try {
            result = new RfidScenario();
            Config.setRfidScenario(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateRfidScenario(RfidScenario input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getRfidScenario(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ParamsCustomization customizationFromJSON(JSONObject input, Context context) {
        ParamsCustomization result = null;
        try {
            result = new ParamsCustomization();
            Config.setCustomization(result, input, context);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateCustomization(ParamsCustomization input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getCustomization(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static Functionality functionalityFromJSON(JSONObject input) {
        Functionality result = null;
        try {
            result = new Functionality();
            Config.setFunctionality(result, input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateFunctionality(Functionality input) {
        JSONObject result = null;
        if (input == null) return null;
        try {
            result = Config.getFunctionality(input);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static ImageQA.GlaresCheckParams glaresCheckParamsFromJSON(JSONObject input) {
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

    static Pair<Typeface, Integer> typeFaceFromJSON(JSONObject input) {
        try {
            String name = input.getString("name");
            int style = input.optInt("style", Typeface.NORMAL);
            Integer size = null;
            if (input.has("size"))
                size = input.getInt("size");
            return new Pair<>(Typeface.create(name, style), size);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static BleDeviceConfig bleDeviceConfigFromJSON(JSONObject input) {
        BLEWrapper bleWrapper = BluetoothUtil.Companion.getBleManager();
        try {
            BleDeviceConfig result;
            result = new BleDeviceConfig(bleWrapper);
            if (input.has("customDb"))
                //noinspection DataFlowIssue
                result = new BleDeviceConfig(bleWrapper, byteArrayFromBase64(input.getString("customDb")));
            if (input.has("licenseUpdate"))
                result.setLicenseUpdate(input.getBoolean("licenseUpdate"));
            if (input.has("delayedNNLoad"))
                result.setDelayedNNLoad(input.getBoolean("delayedNNLoad"));
            if (input.has("blackList"))
                result.setBlackList(input.getJSONObject("blackList"));
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
            // this will never happen, returning not null to remove warning
            return new BleDeviceConfig(bleWrapper);
        }
    }

    static ImageInputData imageInputDataFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            Bitmap image;
            int light = 6;
            int pageIndex = 0;

            if (input.has("image"))
                image = bitmapFromBase64(input.getString("image"));
            else return null;
            if (input.has("light"))
                light = input.getInt("light");
            if (input.has("pageIndex"))
                pageIndex = input.getInt("pageIndex");
            return new ImageInputData(image, light, pageIndex);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return null;
    }

    static JSONObject generateImageInputData(ImageInputData input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("image", bitmapToBase64(input.getBitmap()));
            result.put("light", input.getLight());
            result.put("pageIndex", input.getPageIndex());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static PKDCertificate pkdCertificateFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            int resourceType = 0;
            byte[] binaryData = new byte[0];
            byte[] privateKey;

            if (input.has("resourceType"))
                resourceType = input.getInt("resourceType");
            if (input.has("binaryData"))
                binaryData = byteArrayFromBase64(input.getString("binaryData"));
            if (input.has("privateKey")) {
                privateKey = byteArrayFromBase64(input.getString("privateKey"));
                return new PKDCertificate(binaryData, resourceType, privateKey);
            }
            return new PKDCertificate(binaryData, resourceType);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    static JSONObject generatePKDCertificate(PKDCertificate input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("resourceType", input.resourceType);
            result.put("binaryData", generateByteArray(input.binaryData));
            result.put("privateKey", generateByteArray(input.privateKey));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static DocumentReaderScenario documentReaderScenarioFromJSON(JSONObject input) {
        if (input == null) return null;
        String name = input.optString("name");
        String caption = input.optString("caption");
        String description = input.optString("description");
        boolean multiPageOff = input.optBoolean("multiPageOff");
        double frameKWHLandscape = input.optDouble("frameKWHLandscape");
        double frameKWHPortrait = input.optDouble("frameKWHPortrait");
        double frameKWHDoublePageSpreadPortrait = input.optDouble("frameKWHDoublePageSpreadPortrait");
        double frameKWHDoublePageSpreadLandscape = input.optDouble("frameKWHDoublePageSpreadLandscape");
        int frameOrientation = input.optInt("frameOrientation");
        boolean uvTorch = input.optBoolean("uvTorch");
        boolean faceExt = input.optBoolean("faceExt");
        boolean seriesProcessMode = input.optBoolean("seriesProcessMode");
        boolean manualCrop = input.optBoolean("manualCrop");
        return new DocumentReaderScenario(name, caption, description, multiPageOff ? 1 : 0, frameKWHLandscape, frameKWHPortrait, frameKWHDoublePageSpreadPortrait, frameKWHDoublePageSpreadLandscape, frameOrientation, uvTorch, faceExt, seriesProcessMode, manualCrop);
    }

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

    static Rect rectFromJSON(JSONObject input) {
        if (input == null) return null;
        Rect result = new Rect();

        result.bottom = input.optInt("bottom");
        result.top = input.optInt("top");
        result.left = input.optInt("left");
        result.right = input.optInt("right");

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

    static DocReaderFieldRect docReaderFieldRectFromJSON(JSONObject input) {
        if (input == null) return null;
        DocReaderFieldRect result = new DocReaderFieldRect();

        result.bottom = input.optInt("bottom");
        result.top = input.optInt("top");
        result.left = input.optInt("left");
        result.right = input.optInt("right");

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

    static DocumentReaderGraphicField documentReaderGraphicFieldFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderGraphicField result = new DocumentReaderGraphicField();

        input.remove("value");
        result.sourceType = input.optInt("sourceType");
        result.fieldType = input.optInt("fieldType");
        result.light = input.optInt("light");
        result.pageIndex = input.optInt("pageIndex");
        result.originalPageIndex = input.optInt("originalPageIndex");
        result.boundRect = docReaderFieldRectFromJSON(input.optJSONObject("fieldRect"));

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

    static DocumentReaderGraphicResult documentReaderGraphicResultFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderGraphicResult result = new DocumentReaderGraphicResult();

        result.fields = Objects.requireNonNull(listFromJSON(input.optJSONArray("fields"), JSONConstructor::documentReaderGraphicFieldFromJSON));

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

    static DocumentReaderValue documentReaderValueFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderValue result = new DocumentReaderValue();

        result.pageIndex = input.optInt("pageIndex");
        result.sourceType = input.optInt("sourceType");
        result.probability = input.optInt("probability");
        result.value = input.optString("value");
        result.originalValue = input.optString("originalValue");
        result.boundRect = rectFromJSON(input.optJSONObject("boundRect"));
        result.originalSymbols = Objects.requireNonNull(listFromJSON(input.optJSONArray("originalSymbols"), JSONConstructor::documentReaderSymbolFromJSON));
        result.rfidOrigin = documentReaderRFIDOriginFromJSON(input.optJSONObject("rfidOrigin"));

        return result;
    }

    static JSONObject generateDocumentReaderValue(DocumentReaderValue input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("pageIndex", input.pageIndex);
            result.put("sourceType", input.sourceType);
            result.put("probability", input.probability);
            result.put("value", input.value);
            result.put("originalValue", input.originalValue);
            result.put("boundRect", generateRect(input.boundRect));
            result.put("originalSymbols", generateList(input.originalSymbols, JSONConstructor::generateDocumentReaderSymbol));
            result.put("rfidOrigin", generateDocumentReaderRFIDOrigin(input.rfidOrigin));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static DocumentReaderTextField documentReaderTextFieldFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderTextField result = new DocumentReaderTextField();

        input.remove("getValue");
        result.fieldType = input.optInt("fieldType");
        result.lcid = input.optInt("lcid");
        result.status = input.optInt("status");
        result.value = input.optString("value");
        result.values = Objects.requireNonNull(listFromJSON(input.optJSONArray("values"), JSONConstructor::documentReaderValueFromJSON));
        result.comparisonList = Objects.requireNonNull(listFromJSON(input.optJSONArray("comparisonList"), JSONConstructor::documentReaderComparisonFromJSON));
        result.validityList = Objects.requireNonNull(listFromJSON(input.optJSONArray("validityList"), JSONConstructor::documentReaderValidityFromJSON));
        result.comparisonStatus = input.optInt("comparisonStatus");
        result.validityStatus = input.optInt("validityStatus");

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

    static DocumentReaderTextResult documentReaderTextResultFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderTextResult result = new DocumentReaderTextResult();

        result.status = input.optInt("status");
        result.comparisonStatus = input.optInt("comparisonStatus");
        result.validityStatus = input.optInt("validityStatus");
        result.availableSourceList = Objects.requireNonNull(listFromJSON(input.optJSONArray("availableSourceList"), JSONConstructor::documentReaderTextSourceFromJSON));
        result.fields = Objects.requireNonNull(listFromJSON(input.optJSONArray("fields"), JSONConstructor::documentReaderTextFieldFromJSON));

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

    static Coordinate coordinateFromJSON(JSONObject input) {
        if (input == null) return null;
        Coordinate result = new Coordinate();

        result.x = input.optInt("x");
        result.y = input.optInt("y");

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

    static ElementPosition elementPositionFromJSON(JSONObject input) {
        if (input == null) return null;
        ElementPosition result = new ElementPosition();

        result.docFormat = input.optInt("docFormat");
        result.width = input.optInt("width");
        result.height = input.optInt("height");
        result.dpi = input.optInt("dpi");
        result.pageIndex = input.optInt("pageIndex");
        result.inverse = input.optInt("inverse");
        result.perspectiveTr = input.optInt("perspectiveTr");
        result.objArea = input.optInt("objArea");
        result.objIntAngleDev = input.optInt("objIntAngleDev");
        result.resultStatus = input.optInt("resultStatus");
        result.angle = input.optDouble("angle");
        result.center = coordinateFromJSON(input.optJSONObject("center"));
        result.leftTop = coordinateFromJSON(input.optJSONObject("leftTop"));
        result.leftBottom = coordinateFromJSON(input.optJSONObject("leftBottom"));
        result.rightTop = coordinateFromJSON(input.optJSONObject("rightTop"));
        result.rightBottom = coordinateFromJSON(input.optJSONObject("rightBottom"));

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

    static ImageQuality imageQualityFromJSON(JSONObject input) {
        if (input == null) return null;
        ImageQuality result = new ImageQuality();

        result.featureType = input.optInt("featureType");
        result.result = input.optInt("result");
        result.type = input.optInt("type");

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

    static ImageQualityGroup imageQualityGroupFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        ImageQualityGroup result = new ImageQualityGroup();

        result.count = input.optInt("count");
        result.result = input.optInt("result");
        result.pageIndex = input.optInt("pageIndex");
        result.imageQualityList = Objects.requireNonNull(listFromJSON(input.optJSONArray("imageQualityList"), JSONConstructor::imageQualityFromJSON));

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

    static DocumentReaderDocumentType documentReaderDocumentTypeFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderDocumentType result = new DocumentReaderDocumentType();

        result.pageIndex = input.optInt("pageIndex");
        result.documentID = input.optInt("documentID");
        result.dType = input.optInt("dType");
        result.dFormat = input.optInt("dFormat");
        result.dMRZ = input.optBoolean("dMRZ");
        result.isDeprecated = input.optBoolean("isDeprecated");
        result.name = input.optString("name");
        result.ICAOCode = input.optString("ICAOCode");
        result.dDescription = input.optString("dDescription");
        result.dCountryName = input.optString("dCountryName");
        result.dYear = input.optString("dYear");
        result.FDSID = intArrayFromJSON(input.optJSONArray("FDSID"));

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

    static AccessControlProcedureType accessControlProcedureTypeFromJSON(JSONObject input) {
        if (input == null) return null;
        AccessControlProcedureType result = new AccessControlProcedureType();

        result.activeOptionIdx = input.optInt("activeOptionIdx");
        result.type = input.optInt("type");
        result.status = input.optInt("status");
        result.notifications = Objects.requireNonNull(listFromJSON(input.optJSONArray("notifications")));

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

    static FileData fileDataFromJSON(JSONObject input) {
        if (input == null) return null;
        FileData result = new FileData();

        result.length = input.optInt("length");
        result.type = input.optInt("type");
        result.status = input.optInt("status");
        result.data = input.optString("data");

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

    static CertificateData certificateDataFromJSON(JSONObject input) {
        if (input == null) return null;
        CertificateData result = new CertificateData();

        result.length = input.optInt("length");
        result.data = input.optString("data");

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

    static SecurityObjectCertificates securityObjectCertificatesFromJSON(JSONObject input) {
        if (input == null) return null;
        SecurityObjectCertificates result = new SecurityObjectCertificates();

        result.securityObject = certificateDataFromJSON(input.optJSONObject("securityObject"));

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

    static File fileFromJSON(JSONObject input) {
        if (input == null) return null;
        File result = new File();

        result.readingTime = input.optInt("readingTime");
        result.type = input.optInt("type");
        result.pAStatus = input.optLong("pAStatus");
        result.readingStatus = input.optInt("readingStatus");
        result.fileID = input.optString("fileID");
        result.fileData = fileDataFromJSON(input.optJSONObject("fileData"));
        result.certificates = securityObjectCertificatesFromJSON(input.optJSONObject("certificates"));
        result.docFieldsText = Objects.requireNonNull(listFromJSON(input.optJSONArray("docFieldsText")));
        result.docFieldsGraphics = Objects.requireNonNull(listFromJSON(input.optJSONArray("docFieldsGraphics")));
        result.docFieldsOriginals = Objects.requireNonNull(listFromJSON(input.optJSONArray("docFieldsOriginals")));
        result.notifications = Objects.requireNonNull(listFromJSON(input.optJSONArray("notifications")));

        return result;
    }

    static JSONObject generateFile(File input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("readingTime", input.readingTime);
            result.put("type", input.type);
            result.put("typeName", eRFID_DataFile_Type.getTranslation(context, input.type));
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

    static Application applicationFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        Application result = new Application();

        result.type = input.optInt("type");
        result.status = input.optInt("status");
        result.applicationID = input.optString("applicationID");
        result.dataHashAlgorithm = input.optString("dataHashAlgorithm");
        result.unicodeVersion = input.optString("unicodeVersion");
        result.version = input.optString("version");
        result.files = Objects.requireNonNull(listFromJSON(input.optJSONArray("files"), JSONConstructor::fileFromJSON));

        return result;
    }

    static JSONObject generateApplication(Application input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("type", input.type);
            result.put("status", input.status);
            result.put("applicationID", input.applicationID);
            result.put("dataHashAlgorithm", input.dataHashAlgorithm);
            result.put("unicodeVersion", input.unicodeVersion);
            result.put("version", input.version);
            result.put("files", generateList(input.files, JSONConstructor::generateFile, context));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static Value valueFromJSON(JSONObject input) {
        if (input == null) return null;
        Value result = new Value();

        result.length = input.optInt("length");
        result.type = input.optInt("type");
        result.status = input.optInt("status");
        result.data = input.optString("data");
        result.format = input.optString("format");

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

    static Attribute attributeFromJSON(JSONObject input) {
        if (input == null) return null;
        Attribute result = new Attribute();

        result.type = input.optString("type");
        result.value = valueFromJSON(input.optJSONObject("value"));

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

    static Authority authorityFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        Authority result = new Authority();

        result.data = input.optString("data");
        result.friendlyName = valueFromJSON(input.optJSONObject("friendlyName"));
        result.attributes = Objects.requireNonNull(listFromJSON(input.optJSONArray("attributes"), JSONConstructor::attributeFromJSON));

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

    static Extension extensionFromJSON(JSONObject input) {
        if (input == null) return null;
        Extension result = new Extension();

        result.data = input.optString("data");
        result.type = input.optString("type");

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

    static Validity validityFromJSON(JSONObject input) {
        if (input == null) return null;
        Validity result = new Validity();

        result.notAfter = valueFromJSON(input.optJSONObject("notAfter"));
        result.notBefore = valueFromJSON(input.optJSONObject("notBefore"));

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

    static CertificateChain certificateChainFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        CertificateChain result = new CertificateChain();

        result.origin = input.optInt("origin");
        result.type = input.optInt("type");
        result.version = input.optInt("version");
        result.paStatus = input.optInt("paStatus");
        result.serialNumber = input.optString("serialNumber");
        result.signatureAlgorithm = input.optString("signatureAlgorithm");
        result.subjectPKAlgorithm = input.optString("subjectPKAlgorithm");
        result.fileName = valueFromJSON(input.optJSONObject("fileName"));
        result.validity = validityFromJSON(input.optJSONObject("validity"));
        result.issuer = authorityFromJSON(input.optJSONObject("issuer"));
        result.subject = authorityFromJSON(input.optJSONObject("subject"));
        result.notifications = Objects.requireNonNull(listFromJSON(input.optJSONArray("notifications")));
        result.extensions = Objects.requireNonNull(listFromJSON(input.optJSONArray("extensions"), JSONConstructor::extensionFromJSON));

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

    static SignerInfo signerInfoFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        SignerInfo result = new SignerInfo();

        result.version = input.optInt("version");
        result.paStatus = input.optInt("paStatus");
        result.dataToHash = input.optString("dataToHash");
        result.digestAlgorithm = input.optString("digestAlgorithm");
        result.signatureAlgorithm = input.optString("signatureAlgorithm");
        result.serialNumber = valueFromJSON(input.optJSONObject("serialNumber"));
        result.signature = valueFromJSON(input.optJSONObject("signature"));
        result.subjectKeyIdentifier = valueFromJSON(input.optJSONObject("subjectKeyIdentifier"));
        result.issuer = authorityFromJSON(input.optJSONObject("issuer"));
        result.notifications = Objects.requireNonNull(listFromJSON(input.optJSONArray("notifications")));
        result.signedAttributes = Objects.requireNonNull(listFromJSON(input.optJSONArray("signedAttributes"), JSONConstructor::extensionFromJSON));
        result.certificateChain = Objects.requireNonNull(listFromJSON(input.optJSONArray("certificateChain"), JSONConstructor::certificateChainFromJSON));

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

    static SecurityObject securityObjectFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        SecurityObject result = new SecurityObject();

        result.fileReference = input.optInt("fileReference");
        result.version = input.optInt("version");
        result.objectType = input.optString("objectType");
        result.notifications = Objects.requireNonNull(listFromJSON(input.optJSONArray("notifications")));
        result.signerInfos = Objects.requireNonNull(listFromJSON(input.optJSONArray("signerInfos"), JSONConstructor::signerInfoFromJSON));

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

    static CardProperties cardPropertiesFromJSON(JSONObject input) {
        if (input == null) return null;
        CardProperties result = new CardProperties();

        result.aTQA = input.optInt("aTQA");
        result.bitRateR = input.optInt("bitRateR");
        result.bitRateS = input.optInt("bitRateS");
        result.chipTypeA = input.optInt("chipTypeA");
        result.mifareMemory = input.optInt("mifareMemory");
        result.rfidType = input.optInt("rfidType");
        result.sAK = input.optInt("sAK");
        result.support4 = input.optBoolean("support4");
        result.supportMifare = input.optBoolean("supportMifare");
        result.aTQB = input.optString("aTQB");
        result.aTR = input.optString("aTR");
        result.baudrate1 = input.optString("baudrate1");
        result.baudrate2 = input.optString("baudrate2");
        result.uID = input.optString("uID");

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

    static RFIDSessionData rfidSessionDataFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        RFIDSessionData result = new RFIDSessionData();

        result.totalBytesReceived = input.optInt("totalBytesReceived");
        result.totalBytesSent = input.optInt("totalBytesSent");
        result.status = input.optInt("status");
        result.extLeSupport = input.optLong("extLeSupport");
        result.processTime = input.optLong("processTime");
        result.cardProperties = cardPropertiesFromJSON(input.optJSONObject("cardProperties"));
        result.accessControls = Objects.requireNonNull(listFromJSON(input.optJSONArray("accessControls"), JSONConstructor::accessControlProcedureTypeFromJSON));
        result.applications = Objects.requireNonNull(listFromJSON(input.optJSONArray("applications"), JSONConstructor::applicationFromJSON));
        result.securityObjects = Objects.requireNonNull(listFromJSON(input.optJSONArray("securityObjects"), JSONConstructor::securityObjectFromJSON));
        result.dataFields = Objects.requireNonNull(listFromJSON(input.optJSONArray("dataFields"), JSONConstructor::dataFieldFromJSON));
        result.dataGroups = intArrayFromJSON(input.optJSONArray("dataGroups"));

        return result;
    }

    static JSONObject generateRFIDSessionData(RFIDSessionData input, Context context) {
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
            result.put("applications", generateList(input.applications, JSONConstructor::generateApplication, context));
            result.put("securityObjects", generateList(input.securityObjects, JSONConstructor::generateSecurityObject));
            result.put("dataGroups", generateIntArray(input.dataGroups));
            result.put("dataFields", generateList(input.dataFields, JSONConstructor::generateDataField));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static DataField dataFieldFromJSON(JSONObject input) {
        if (input == null) return null;
        DataField result = new DataField();

        result.setData(input.optString("data"));
        result.setFieldType(input.optInt("fieldType"));

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

    static DocumentReaderAuthenticityCheck documentReaderAuthenticityCheckFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderAuthenticityCheck result = new DocumentReaderAuthenticityCheck();

        result.type = input.optInt("type");
        result.pageIndex = input.optInt("pageIndex");
        result.elements = Objects.requireNonNull(listFromJSON(input.optJSONArray("elements"), JSONConstructor::documentReaderAuthenticityElementFromJSON));

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

    static PDF417Info pdf417InfoFromJSON(JSONObject input) {
        if (input == null) return null;
        PDF417Info result = new PDF417Info();

        result.errorLevel = input.optInt("errorLevel");
        result.columns = input.optInt("columns");
        result.rows = input.optInt("rows");

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

    static DocumentReaderBarcodeResult documentReaderBarcodeResultFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderBarcodeResult result = new DocumentReaderBarcodeResult();

        result.fields = Objects.requireNonNull(listFromJSON(input.optJSONArray("fields"), JSONConstructor::documentReaderBarcodeFieldFromJSON));

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

    static DocumentReaderBarcodeField documentReaderBarcodeFieldFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderBarcodeField result = new DocumentReaderBarcodeField();

        result.barcodeType = input.optInt("barcodeType");
        result.status = input.optInt("status");
        result.pageIndex = input.optInt("pageIndex");
        result.pdf417Info = pdf417InfoFromJSON(input.optJSONObject("pdf417Info"));
        result.data = byteArrayFromBase64(input.optString("data"));

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

    static DocumentReaderAuthenticityResult documentReaderAuthenticityResultFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderAuthenticityResult result = new DocumentReaderAuthenticityResult();

        result.checks = Objects.requireNonNull(listFromJSON(input.optJSONArray("checks"), JSONConstructor::documentReaderAuthenticityCheckFromJSON));

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

    static DocumentReaderAuthenticityElement documentReaderAuthenticityElementFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderAuthenticityElement result = new DocumentReaderAuthenticityElement();

        result.status = input.optInt("status");
        result.elementType = input.optInt("elementType");
        result.elementDiagnose = input.optInt("elementDiagnose");

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

    static PAResourcesIssuer paResourcesIssuerFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        PAResourcesIssuer result = new PAResourcesIssuer();

        result.data = byteArrayFromBase64(input.optString("data"));
        result.friendlyName = input.optString("friendlyName");
        result.attributes = arrayFromJSON(input.optJSONArray("attributes"), JSONConstructor::paAttributeFromJSON, new PAAttribute[0]);

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

    static PAAttribute paAttributeFromJSON(JSONObject input) {
        if (input == null) return null;
        PAAttribute result = new PAAttribute();

        result.type = input.optString("type");
        result.value = input.optString("value");

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

    static TAChallenge taChallengeFromJSON(JSONObject input) {
        if (input == null) return null;
        TAChallenge result = new TAChallenge();

        result.data = byteArrayFromBase64(input.optString("data"));
        result.auxPCD = input.optString("auxPCD");
        result.challengePICC = input.optString("challengePICC");
        result.hashPK = input.optString("hashPK");
        result.idPICC = input.optString("idPICC");

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

    static DocumentReaderResultsStatus documentReaderResultsStatusFromJSON(JSONObject input) {
        if (input == null) return null;

        input.remove("detailsRFID");

        return DocumentReaderResultsStatus.fromJson(input);
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

    static JSONObject vdsncDataDictionaryFromJSON(JSONObject input) throws  JSONException{
        JSONObject temp = new JSONObject(input.toString());

        temp.put("Type", input.optString("type"));
        temp.put("Version", input.optInt("version"));
        temp.put("IssuingCountry", input.optString("issuingCountry"));
        temp.put("Message", input.optJSONObject("message"));
        temp.put("SignatureAlg", input.optString("signatureAlgorithm"));
        temp.put("Signature", bytesDataDictionaryFromJSON(input.optJSONObject("signature")));
        temp.put("Certificate", bytesDataDictionaryFromJSON(input.optJSONObject("certificate")));
        temp.put("CertificateChain", input.optJSONArray("certificateChain"));
        temp.put("Notifications", input.optJSONArray("notifications"));

        return temp;
    }

    static VDSNCData vdsncDataFromJSON(JSONObject input) throws JSONException {
        return VDSNCData.fromJson(vdsncDataDictionaryFromJSON(input));
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

    static JSONObject bytesDataDictionaryFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        JSONObject temp = new JSONObject(input.toString());

        temp.put("Data", input.optString("data"));
        temp.put("Length", input.optInt("length"));
        temp.put("Status", input.optLong("status"));
        temp.put("Type", input.optInt("type"));

        return temp;
    }

    static BytesData bytesDataFromJSON(JSONObject input) throws JSONException {
        return BytesData.fromJson(bytesDataDictionaryFromJSON(input));
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

    static JSONObject generateLicense(License input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("expiryDate", toStringOrNull(input.getExpiryDate()));
            result.put("countryFilter", generateList(input.getCountryFilter()));
            result.put("isRfidAvailable", input.isRfidAvailable());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static JSONObject generateDocReaderVersion(DocReaderVersion input) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("api", input.api);
            result.put("core", input.core);
            result.put("coreMode", input.coreMode);
            result.put("database", generateDocReaderDocumentsDatabase(input.database));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    static DocReaderDocumentsDatabase docReaderDocumentsDatabaseFromJSON(JSONObject input) {
        if (input == null) return null;
        try {
            JSONObject temp = new JSONObject(input.toString());
            temp.put("id", input.optString("databaseID"));
            temp.put("export_date", input.optString("date"));
            temp.put("description", input.optString("databaseDescription"));
            return DocReaderDocumentsDatabase.fromJson(temp);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
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

    static DocumentReaderComparison documentReaderComparisonFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderComparison result = new DocumentReaderComparison();

        result.sourceTypeLeft = input.optInt("sourceTypeLeft");
        result.sourceTypeRight = input.optInt("sourceTypeRight");
        result.status = input.optInt("status");

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

    static DocumentReaderRfidOrigin documentReaderRFIDOriginFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderRfidOrigin result = new DocumentReaderRfidOrigin();

        result.dg = input.optInt("dg");
        result.dgTag = input.optInt("dgTag");
        result.entryView = input.optInt("entryView");
        result.tagEntry = input.optInt("tagEntry");

        return result;
    }

    static JSONObject generateDocumentReaderRFIDOrigin(DocumentReaderRfidOrigin input) {
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

    static DocumentReaderTextSource documentReaderTextSourceFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderTextSource result = new DocumentReaderTextSource();

        result.sourceType = input.optInt("sourceType");
        result.source = input.optString("source");
        result.validityStatus = input.optInt("validityStatus");

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

    static DocumentReaderSymbol documentReaderSymbolFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderSymbol result = new DocumentReaderSymbol();

        result.code = input.optInt("code");
        result.probability = input.optInt("probability");
        result.rect = rectFromJSON(input.optJSONObject("rect"));

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

    static DocumentReaderValidity documentReaderValidityFromJSON(JSONObject input) {
        if (input == null) return null;
        DocumentReaderValidity result = new DocumentReaderValidity();

        result.sourceType = input.optInt("sourceType");
        result.status = input.optInt("status");

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

    static String[] barcodeTypeArrayFromJson(JSONArray input) throws JSONException {
        if (input == null) return null;
        String[] result = new String[input.length()];
        for (int i = 0; i < input.length(); i++)
            result[i] = BarcodeType.valueOf(input.getInt(i));

        return result;
    }

    static JSONArray generateBarcodeTypeArray(String[] input) {
        if (input == null) return null;
        JSONArray result = new JSONArray();
        for (String s : input) result.put(generateBarcodeType(s));
        return result;
    }

    static int generateBarcodeType(String input) {
        return switch (input) {
            case "bct_Code128" -> 1;
            case "bct_Code39" -> 2;
            case "bct_EAN8" -> 3;
            case "bct_ITF" -> 4;
            case "bct_PDF417" -> 5;
            case "bct_STF" -> 6;
            case "bct_MTF" -> 7;
            case "bct_IATA" -> 8;
            case "bct_CODABAR" -> 9;
            case "bct_UPCA" -> 10;
            case "bct_CODE93" -> 11;
            case "bct_UPCE" -> 12;
            case "bct_EAN13" -> 13;
            case "bct_QRCODE" -> 14;
            case "bct_AZTEC" -> 15;
            case "bct_DATAMATRIX" -> 16;
            case "bct_ALL_1D" -> 17;
            case "bct_Code11" -> 18;
            case "bct_JABCODE" -> 19;
            default -> 0;
        };
    }

    static DocumentReaderResults documentReaderResultsFromJSON(JSONObject input) throws JSONException {
        if (input == null) return null;
        DocumentReaderResults result = new DocumentReaderResults();

        result.chipPage = input.optInt("chipPage");
        result.processingFinishedStatus = input.optInt("processingFinishedStatus");
        result.elapsedTime = input.optInt("elapsedTime");
        result.elapsedTimeRFID = input.optInt("elapsedTimeRFID");
        result.morePagesAvailable = input.optInt("morePagesAvailable");
        result.graphicResult = documentReaderGraphicResultFromJSON(input.optJSONObject("graphicResult"));
        result.textResult = documentReaderTextResultFromJSON(input.optJSONObject("textResult"));
        result.documentPosition = Objects.requireNonNull(listFromJSON(input.optJSONArray("documentPosition"), JSONConstructor::elementPositionFromJSON));
        result.barcodePosition = Objects.requireNonNull(listFromJSON(input.optJSONArray("barcodePosition"), JSONConstructor::elementPositionFromJSON));
        result.mrzPosition = Objects.requireNonNull(listFromJSON(input.optJSONArray("mrzPosition"), JSONConstructor::elementPositionFromJSON));
        result.imageQuality = Objects.requireNonNull(listFromJSON(input.optJSONArray("imageQuality"), JSONConstructor::imageQualityGroupFromJSON));
        result.rawResult = input.optString("rawResult");
        result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"));
        result.authenticityResult = documentReaderAuthenticityResultFromJSON(input.optJSONObject("authenticityResult"));
        result.barcodeResult = documentReaderBarcodeResultFromJSON(input.optJSONObject("barcodeResult"));
        result.rfidSessionData = rfidSessionDataFromJSON(input.optJSONObject("rfidSessionData"));
        result.documentType = Objects.requireNonNull(listFromJSON(input.optJSONArray("documentType"), JSONConstructor::documentReaderDocumentTypeFromJSON));
        result.status = Objects.requireNonNull(documentReaderResultsStatusFromJSON(input.optJSONObject("status")));
        result.vdsncData = vdsncDataFromJSON(input.optJSONObject("vdsncData"));

        return result;
    }

    static JSONObject generateDocumentReaderResults(DocumentReaderResults input, Context context) {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        try {
            result.put("chipPage", input.chipPage);
            result.put("processingFinishedStatus", input.processingFinishedStatus);
            result.put("elapsedTime", input.elapsedTime);
            result.put("elapsedTimeRFID", input.elapsedTimeRFID);
            result.put("morePagesAvailable", input.morePagesAvailable);
            result.put("graphicResult", generateDocumentReaderGraphicResult(input.graphicResult, context));
            result.put("textResult", generateDocumentReaderTextResult(input.textResult, context));
            result.put("documentPosition", generateList(input.documentPosition, JSONConstructor::generateElementPosition));
            result.put("barcodePosition", generateList(input.barcodePosition, JSONConstructor::generateElementPosition));
            result.put("mrzPosition", generateList(input.mrzPosition, JSONConstructor::generateElementPosition));
            result.put("imageQuality", generateList(input.imageQuality, JSONConstructor::generateImageQualityGroup));
            result.put("rawResult", input.rawResult);
            result.put("rfidSessionData", generateRFIDSessionData(input.rfidSessionData, context));
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
}