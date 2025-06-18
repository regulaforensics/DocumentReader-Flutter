@file:SuppressLint("UseKtx")

package com.regula.plugin.documentreader

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.util.Base64
import org.json.JSONArray
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import kotlin.math.sqrt

fun List<*>.toJson(): JSONArray {
    val result = JSONArray()
    for (i in indices)
        when (val v = this[i]) {
            null -> result.put(null)
            is Map<*, *> -> result.put(v.toJson())
            is List<*> -> result.put(v.toJson())
            else -> result.put(v)
        }
    return result
}

fun Map<*, *>.toJson(): JSONObject {
    val result = JSONObject()
    for ((k, v) in this) {
        when (v) {
            null -> result.put(k as String, null)
            is Map<*, *> -> result.put(k as String, v.toJson())
            is List<*> -> result.put(k as String, v.toJson())
            else -> result.put(k as String, v)
        }
    }
    return result
}

fun Any?.toSendable(): Any? = this?.let {
    if (it is JSONObject || it is JSONArray) it.toString()
    else it
}

fun <T> List<T>?.toJson(toJson: (T?) -> Any?) = this?.let {
    val result = JSONArray()
    for (item in it) result.put(toJson(item))
    result
}

fun <T> List<T>?.toJsonNullable(toJson: (T?) -> Any?) = this?.let {
    val result = JSONArray()
    for (item in it) result.put(toJson(item))
    result
}

fun <T> JSONArray?.toList(fromJson: (JSONObject) -> T) = this?.let {
    val result: MutableList<T> = ArrayList()
    for (i in 0 until it.length()) result.add(fromJson(it.getJSONObject(i)))
    result
}

fun <T> JSONArray.toList() = this.let {
    val result = mutableListOf<T>()
    @Suppress("UNCHECKED_CAST")
    for (i in 0 until length()) result.add(get(i) as T)
    result
}

inline fun <reified T> JSONArray?.toArray() = this?.let {
    val result = arrayOfNulls<T>(length())
    for (i in 0 until length()) result[i] = get(i) as T
    result
}

inline fun <reified T> JSONArray?.toArray(fromJson: (JSONObject?) -> T) = this?.let {
    val result = arrayOfNulls<T>(length())
    for (i in 0 until length()) result[i] = fromJson(getJSONObject(i))
    result
}

fun <T> Array<T>?.toJson() = this?.let {
    val result = JSONArray()
    for (i in it.indices) result.put(i, it[i])
    result
}

fun <T> Array<T>?.toJson(toJson: (T?) -> JSONObject?) = this?.let {
    val result = JSONArray()
    for (i in indices) result.put(i, toJson(this[i]))
    result
}

fun Any?.toIntArray() = (this as JSONArray?)?.let {
    val result = IntArray(it.length())
    for (i in 0 until it.length()) result[i] = it.getInt(i)
    result
}

fun IntArray?.toJson() = this?.let {
    val result = JSONArray()
    for (i in it.indices) result.put(i, it[i])
    result
}

fun JSONObject.forEach(action: (String, Any) -> Unit) {
    val keys: Iterator<String> = keys()
    while (keys.hasNext()) {
        val key = keys.next()
        action(key, get(key))
    }
}

fun JSONObject.getJSONObjectOrNull(name: String): JSONObject? {
    if (has(name) && get(name).toString() != "null") return getJSONObject(name)
    return null
}

fun JSONObject.getIntOrNull(name: String): Int? {
    if (has(name) && get(name).toString() != "null") return getInt(name)
    return null
}

fun JSONObject.getDoubleOrNull(name: String): Double? {
    if (has(name) && get(name).toString() != "null") return getDouble(name)
    return null
}

fun JSONObject.getBooleanOrNull(name: String): Boolean? {
    if (has(name) && get(name).toString() != "null") return getBoolean(name)
    return null
}

fun JSONObject.getStringOrNull(name: String): String? {
    if (has(name) && get(name).toString() != "null") return getString(name)
    return null
}

internal object Convert {
    fun String?.toByteArray(): ByteArray? {
        var str = this ?: return null
        if (str.startsWith("data")) str = str.substring(str.indexOf(",") + 1)
        return Base64.decode(str, Base64.NO_WRAP)
    }

    fun ByteArray?.toBase64() = this?.let { Base64.encodeToString(it, Base64.NO_WRAP) }

    fun Bitmap?.toBase64() = this?.let {
        val byteArrayOutputStream = ByteArrayOutputStream()
        it.compress(Bitmap.CompressFormat.JPEG, 100, byteArrayOutputStream)
        byteArrayOutputStream.toByteArray().toBase64()
    }

    fun String?.toBitmap() = this?.let {
        val decodedString = toByteArray()!!
        var result = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.size)
        val sizeMultiplier = result.byteCount / 5000000
        if (result.byteCount > 5000000) result = Bitmap.createScaledBitmap(result, result.width / sqrt(sizeMultiplier.toDouble()).toInt(), result.height / sqrt(sizeMultiplier.toDouble()).toInt(), false)
        result
    }

    fun Any?.toDrawable() = (this as String?)?.let {
        val decodedByte = it.toByteArray()!!
        val bitmap = BitmapFactory.decodeByteArray(decodedByte, 0, decodedByte.size)
        val density = context.resources.displayMetrics.density
        val width = (bitmap.width * density).toInt()
        val height = (bitmap.height * density).toInt()
        BitmapDrawable(context.resources, Bitmap.createScaledBitmap(bitmap, width, height, false))
    }

    fun Drawable?.toBase64() = this?.let {
        if (this is BitmapDrawable) if (bitmap != null) return bitmap.toBase64()
        val bitmap: Bitmap = if (intrinsicWidth <= 0 || intrinsicHeight <= 0) Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888) else Bitmap.createBitmap(intrinsicWidth, intrinsicHeight, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        setBounds(0, 0, canvas.width, canvas.height)
        draw(canvas)
        bitmap.toBase64()
    }
}
