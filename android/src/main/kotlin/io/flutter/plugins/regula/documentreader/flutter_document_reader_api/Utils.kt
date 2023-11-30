//
//  Utils.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
@file:Suppress("UNCHECKED_CAST")

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Matrix
import android.graphics.Paint
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.util.Base64
import org.json.JSONArray
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import kotlin.math.sqrt

fun Any?.toSendable(): Any? = this?.let {
    if (this is JSONObject || this is JSONArray) this.toString()
    else this
}

private fun arrayListToJSONArray(list: ArrayList<*>): JSONArray {
    val result = JSONArray()
    for (i in list.indices) {
        when {
            list[i] == null -> result.put(null)
            list[i].javaClass == HashMap::class.java -> result.put(hashMapToJSONObject(list[i] as HashMap<String, *>))
            list[i].javaClass == ArrayList::class.java -> result.put(arrayListToJSONArray(list[i] as ArrayList<*>))
            else -> result.put(list[i])
        }
    }
    return result
}

private fun hashMapToJSONObject(map: HashMap<String, *>): JSONObject {
    val result = JSONObject()
    for ((key, value) in map) {
        when {
            value == null -> result.put(key, null)
            value.javaClass == HashMap::class.java -> result.put(key, hashMapToJSONObject(value as HashMap<String, *>))
            value.javaClass == ArrayList::class.java -> result.put(key, arrayListToJSONArray(value as ArrayList<*>))
            else -> result.put(key, value)
        }
    }
    return result
}

fun <T> args(args: ArrayList<Any?>, index: Int) = when {
    args[index] == null -> null
    args[index]!!.javaClass == HashMap::class.java -> hashMapToJSONObject(args[index] as HashMap<String, *>) as T
    args[index]!!.javaClass == ArrayList::class.java -> arrayListToJSONArray(args[index] as ArrayList<*>) as T
    else -> args[index] as T
}

fun <T> generateList(list: List<T>?) = list?.let {
    val result = JSONArray()
    for (t in list) if (t != null) result.put(t)
    result
}

fun <T> generateList(list: List<T>, toJson: (T?) -> JSONObject?): JSONArray {
    val result = JSONArray()
    for (t in list) if (t != null) result.put(toJson(t))
    return result
}

fun <T> listFromJSON(input: JSONArray?, fromJson: (JSONObject?) -> T) = input?.let {
    val result: MutableList<T> = ArrayList()
    for (i in 0 until input.length()) {
        val item = input.getJSONObject(i)
        result.add(fromJson(item))
    }
    result
}

fun <T> listFromJSON(input: JSONArray): List<T> {
    val result: MutableList<T> = ArrayList()
    for (i in 0 until input.length()) result.add(input.opt(i) as T)
    return result
}

fun <T> arrayFromJSON(input: JSONArray?, fromJson: (JSONObject?) -> T, result: Array<T>) = input?.let {
    for (i in 0 until input.length())
        result[i] = (fromJson(input.getJSONObject(i)))
    result
}

fun <T> generateList(list: List<T>, toJson: (T?, Context?) -> JSONObject?, context: Context?): JSONArray {
    val result = JSONArray()
    for (t in list) if (t != null) result.put(toJson(t, context))
    return result
}

fun <T> generateArray(array: Array<T>?) = array?.let {
    val result = JSONArray()
    for (i in array.indices) result.put(i, array[i])
    result
}

fun <T> generateArray(array: Array<T>?, toJson: (T?) -> JSONObject?) = array?.let {
    val result = JSONArray()
    for (i in array.indices) result.put(i, toJson(array[i]))
    result
}

fun generateIntArray(array: IntArray?) = array?.let {
    val result = JSONArray()
    for (i in array.indices) result.put(i, array[i])
    result
}

fun intArrayFromJSON(input: JSONArray?) = input?.let {
    val result = IntArray(input.length())
    for (i in 0 until input.length()) result[i] = input.getInt(i)
    result
}

fun generateLongArray(array: LongArray?) = array?.let {
    val result = JSONArray()
    for (i in array.indices) result.put(i, array[i])
    result
}

fun matrixFromFloatArray(floats: FloatArray?): Matrix {
    val matrix = Matrix()
    matrix.setValues(floats)
    return matrix
}

fun matrixToFloatArray(matrix: Matrix?) = matrix?.let {
    val floats = FloatArray(9)
    matrix.getValues(floats)
    floats
}

fun floatArrayFromJson(jsonArray: JSONArray): FloatArray {
    val result = FloatArray(jsonArray.length())
    for (i in 0 until jsonArray.length()) result[i] = jsonArray.getDouble(i).toFloat()
    return result
}

fun generateFloatArray(array: FloatArray?) = array?.let {
    val result = JSONArray()
    for (f in array) result.put(java.lang.Float.valueOf(f))
    result
}

fun stringListFromJson(jsonArray: JSONArray): List<String> {
    val result: MutableList<String> = ArrayList()
    for (i in 0 until jsonArray.length()) result.add(jsonArray.optString(i))
    return result
}

fun stringArrayFromJson(jsonArray: JSONArray): Array<String?> {
    val result = arrayOfNulls<String>(jsonArray.length())
    for (i in 0 until jsonArray.length()) result[i] = jsonArray.optString(i)
    return result
}

fun longWithColor(color: String?) = color?.toLong(16)

fun colorWithLong(color: Long) = color.toString(16)

fun paintCapToInt(cap: Paint.Cap) = when (cap) {
    Paint.Cap.BUTT -> 0
    Paint.Cap.ROUND -> 1
    Paint.Cap.SQUARE -> 2
}

fun stringMapFromJson(input: JSONObject): Map<String, String> {
    val result: MutableMap<String, String> = HashMap()
    val keys = input.keys()
    while (keys.hasNext()) {
        val key = keys.next()
        val value = input.getString(key)
        result[key] = value
    }
    return result
}

fun generateStringMap(input: Map<String, String?>?) = input?.let {
    val result = JSONObject()
    for ((key, value) in input) result.put(key, value)
    result
}

internal object Convert {
    fun byteArrayFromBase64(base64: String?) = base64?.let { Base64.decode(it, Base64.NO_WRAP) }
    fun generateByteArray(array: ByteArray?) = array?.let { Base64.encodeToString(it, Base64.NO_WRAP) }

    fun bitmapFromBase64(base64: String?) = base64?.let {
        val decodedString = byteArrayFromBase64(base64)
        var result = BitmapFactory.decodeByteArray(decodedString, 0, decodedString!!.size)
        val sizeMultiplier = result.byteCount / 5000000
        if (result.byteCount > 5000000) result = Bitmap.createScaledBitmap(result, result.width / sqrt(sizeMultiplier.toDouble()).toInt(), result.height / sqrt(sizeMultiplier.toDouble()).toInt(), false)
        result
    }

    fun bitmapToBase64(bitmap: Bitmap?) = bitmap?.let {
        val byteArrayOutputStream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream)
        val byteArray = byteArrayOutputStream.toByteArray()
        generateByteArray(byteArray)
    }

    fun drawableFromBase64(base64: String?, context: Context) = base64?.let {
        val decodedByte = byteArrayFromBase64(base64)
        val bitmap = BitmapFactory.decodeByteArray(decodedByte, 0, decodedByte!!.size)
        val density = context.resources.displayMetrics.density
        val width = (bitmap.width * density).toInt()
        val height = (bitmap.height * density).toInt()
        BitmapDrawable(context.resources, Bitmap.createScaledBitmap(bitmap, width, height, false))
    }

    fun bitmapFromDrawable(drawable: Drawable?) = drawable?.let {
        if (drawable is BitmapDrawable) if (drawable.bitmap != null) return drawable.bitmap
        val bitmap: Bitmap = if (drawable.intrinsicWidth <= 0 || drawable.intrinsicHeight <= 0) Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888) else Bitmap.createBitmap(drawable.intrinsicWidth, drawable.intrinsicHeight, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, canvas.width, canvas.height)
        drawable.draw(canvas)
        bitmap
    }
}