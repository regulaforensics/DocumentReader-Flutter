//
//  Utils.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Base64;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
class Utils {
    interface Callback {
        void success(Object o);

        void error(String s);

        default void success() {
            success("");
        }
    }

    static JSONArray arrayListToJSONArray(ArrayList<?> list) {
        JSONArray result = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) == null)
                result.put(null);
            else if (list.get(i).getClass().equals(java.util.HashMap.class))
                result.put(hashMapToJSONObject((HashMap<String, ?>) list.get(i)));
            else if (list.get(i).getClass().equals(java.util.ArrayList.class))
                result.put(arrayListToJSONArray((ArrayList<?>) list.get(i)));
            else
                result.put(list.get(i));
        }
        return result;
    }

    static JSONObject hashMapToJSONObject(HashMap<String, ?> map) {
        JSONObject result = new JSONObject();
        try {
            for (Map.Entry<String, ?> entry : map.entrySet()) {
                if (entry.getValue() == null)
                    result.put(entry.getKey(), null);
                else if (entry.getValue().getClass().equals(java.util.HashMap.class))
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

    static <T> T args(ArrayList<Object> args, int index) {
        if (args.get(index) == null) return null;
        if (args.get(index).getClass().equals(java.util.HashMap.class))
            return (T) hashMapToJSONObject((HashMap<String, ?>) args.get(index));
        if (args.get(index).getClass().equals(java.util.ArrayList.class))
            return (T) arrayListToJSONArray((ArrayList<?>) args.get(index));
        return (T) args.get(index);
    }

    interface JSONObjectGeneratorWithContext<T> {
        JSONObject generateJSONObject(T param, Context context) throws JSONException;
    }

    interface JSONObjectGenerator<T> {
        JSONObject generateJSONObject(T param) throws JSONException;
    }

    interface FromJSONGenerator<T> {
        T fromJSON(JSONObject input) throws JSONException;
    }

    static String toStringOrNull(Object input) {
        if (input == null) return null;
        return input.toString();
    }

    static <T> JSONArray generateList(List<T> list) {
        JSONArray result = new JSONArray();
        if (list == null) return null;
        for (T t : list)
            if (t != null)
                result.put(t);
        return result;
    }

    static <T> JSONArray generateList(List<T> list, JSONObjectGenerator<T> generator) throws JSONException {
        JSONArray result = new JSONArray();
        if (list == null) return null;
        for (T t : list)
            if (t != null)
                result.put(generator.generateJSONObject(t));
        return result;
    }

    static <T> List<T> listFromJSON(JSONArray input, FromJSONGenerator<T> generator) throws JSONException {
        if (input == null) return null;
        List<T> result = new ArrayList<>();
        for (int i = 0; i < input.length(); i++) {
            JSONObject item = input.getJSONObject(i);
            result.add(generator.fromJSON(item));
        }
        return result;
    }

    static <T> List<T> listFromJSON(JSONArray input) {
        if (input == null) return null;
        List<T> result = new ArrayList<>();
        for (int i = 0; i < input.length(); i++)
            result.add((T) input.opt(i));
        return result;
    }

    static <T> T[] arrayFromJSON(JSONArray input, FromJSONGenerator<T> generator, T[] empty) throws JSONException {
        return listFromJSON(input, generator).toArray(empty);
    }

    static <T> JSONArray generateList(List<T> list, JSONObjectGeneratorWithContext<T> generator, Context context) throws JSONException {
        JSONArray result = new JSONArray();
        if (list == null) return null;
        for (T t : list)
            if (t != null)
                result.put(generator.generateJSONObject(t, context));
        return result;
    }

    static <T> JSONArray generateArray(T[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if (array == null) return null;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);
        return result;
    }

    static <T> JSONArray generateArray(T[] array, JSONObjectGenerator<T> generator) throws JSONException {
        JSONArray result = new JSONArray();
        if (array == null) return null;
        for (int i = 0; i < array.length; i++)
            result.put(i, generator.generateJSONObject(array[i]));
        return result;
    }

    static JSONArray generateIntArray(int[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if (array == null) return null;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);
        return result;
    }

    static int[] intArrayFromJSON(JSONArray input) throws JSONException {
        if (input == null) return null;
        int[] result = new int[input.length()];
        for (int i = 0; i < input.length(); i++)
            result[i] = input.getInt(i);
        return result;
    }

    static JSONArray generateLongArray(long[] array) throws JSONException {
        JSONArray result = new JSONArray();
        if (array == null) return null;
        for (int i = 0; i < array.length; i++)
            result.put(i, array[i]);
        return result;
    }

    static Matrix matrixFromFloatArray(float[] floats) {
        Matrix matrix = new Matrix();
        matrix.setValues(floats);
        return matrix;
    }

    static float[] matrixToFloatArray(Matrix matrix) {
        if (matrix == null) return null;
        float[] floats = new float[9];
        matrix.getValues(floats);
        return floats;
    }

    static float[] floatArrayFromJson(JSONArray jsonArray) throws JSONException {
        float[] result = new float[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = (float) jsonArray.getDouble(i);
        return result;
    }

    static JSONArray generateFloatArray(float[] array) {
        if (array == null) return null;
        JSONArray result = new JSONArray();
        for (float f : array) result.put(Float.valueOf(f));
        return result;
    }

    static List<String> stringListFromJson(JSONArray jsonArray) {
        List<String> result = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++)
            result.add(jsonArray.optString(i));
        return result;
    }

    static String[] stringArrayFromJson(JSONArray jsonArray) {
        String[] result = new String[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++)
            result[i] = jsonArray.optString(i);
        return result;
    }

    static Long longWithColor(String color) {
        if (color == null) return null;
        return Long.parseLong(color, 16);
    }

    static String colorWithLong(long color) {
        return Long.toString(color, 16);
    }

    static Integer paintCapToInt(Paint.Cap cap) {
        return switch (cap) {
            case BUTT -> 0;
            case ROUND -> 1;
            case SQUARE -> 2;
        };
    }

    static Map<String, String> stringMapFromJson(JSONObject input) throws JSONException {
        Map<String, String> result = new HashMap<>();
        Iterator<String> keys = input.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            String value = input.getString(key);
            result.put(key, value);
        }
        return result;
    }

    static JSONObject generateStringMap(Map<String, String> input) throws JSONException {
        JSONObject result = new JSONObject();
        if (input == null) return null;
        for (Map.Entry<String, String> entry : input.entrySet())
            result.put(entry.getKey(), entry.getValue());
        return result;
    }
}

class Convert{
    static byte[] byteArrayFromBase64(String base64) {
        if (base64 == null) return null;
        return Base64.decode(base64, Base64.NO_WRAP);
    }

    static String generateByteArray(byte[] array) {
        if (array == null) return null;
        return Base64.encodeToString(array, Base64.NO_WRAP);
    }

    static Bitmap bitmapFromBase64(String base64) {
        byte[] decodedString = byteArrayFromBase64(base64);
        Bitmap result = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        int sizeMultiplier = result.getByteCount() / 5000000;
        if (result.getByteCount() > 5000000)
            result = Bitmap.createScaledBitmap(result, result.getWidth() / (int) Math.sqrt(sizeMultiplier), result.getHeight() / (int) Math.sqrt(sizeMultiplier), false);
        return result;
    }

    static String bitmapToBase64(Bitmap bitmap) {
        if (bitmap == null) return null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        return generateByteArray(byteArray);
    }

    static BitmapDrawable drawableFromBase64(String base64, Context context) {
        byte[] decodedByte = byteArrayFromBase64(base64);
        Bitmap bitmap = BitmapFactory.decodeByteArray(decodedByte, 0, decodedByte.length);
        float density = context.getResources().getDisplayMetrics().density;
        int width = (int) (bitmap.getWidth() * density);
        int height = (int) (bitmap.getHeight() * density);
        return new BitmapDrawable(context.getResources(), Bitmap.createScaledBitmap(bitmap, width, height, false));
    }

    static Bitmap bitmapFromDrawable(Drawable drawable) {
        if (drawable == null) return null;
        Bitmap bitmap;

        if (drawable instanceof BitmapDrawable bitmapDrawable)
            if (bitmapDrawable.getBitmap() != null)
                return bitmapDrawable.getBitmap();

        if (drawable.getIntrinsicWidth() <= 0 || drawable.getIntrinsicHeight() <= 0)
            bitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        else
            bitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);

        Canvas canvas = new Canvas(bitmap);
        drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        drawable.draw(canvas);
        return bitmap;
    }
}