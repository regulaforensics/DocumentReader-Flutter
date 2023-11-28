//
//  Convert.java
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

import org.robolectric.shadow.api.Shadow;

import java.util.Base64;

/** @noinspection unused*/
class Convert {
    static byte[] byteArrayFromBase64(String base64) {
        if (base64 == null) return null;
        return Base64.getDecoder().decode(base64);
    }

    static String generateByteArray(byte[] array) {
        if (array == null) return null;
        return Base64.getEncoder().encodeToString(array);
    }

    static Bitmap bitmapFromBase64(String base64) {
        Bitmap bitmap = Shadow.newInstanceOf(Bitmap.class);
        MyShadowBitmap shadow = Shadow.extract(bitmap);
        shadow.setData(byteArrayFromBase64(base64));
        return bitmap;
    }

    static String bitmapToBase64(Bitmap bitmap) {
        if (bitmap == null) return null;
        MyShadowBitmap shadow = Shadow.extract(bitmap);
        return generateByteArray(shadow.getData());
    }

    static BitmapDrawable drawableFromBase64(String base64, Context context) {
        BitmapDrawable bitmap = Shadow.newInstanceOf(BitmapDrawable.class);
        MyShadowBitmapDrawable shadow = Shadow.extract(bitmap);
        shadow.setData(byteArrayFromBase64(base64));
        return bitmap;
    }

    static Bitmap bitmapFromDrawable(Drawable drawable) {
        Bitmap bitmap = Shadow.newInstanceOf(Bitmap.class);
        MyShadowBitmap shadowBitmap = Shadow.extract(bitmap);
        MyShadowDrawable shadowDrawable = Shadow.extract(drawable);
        shadowBitmap.setData(shadowDrawable.getData());
        return bitmap;
    }
}