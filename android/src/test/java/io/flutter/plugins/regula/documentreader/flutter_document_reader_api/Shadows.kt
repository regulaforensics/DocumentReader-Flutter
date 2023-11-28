//
//  Shadows.kt
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import org.robolectric.annotation.Implements

@Implements(Bitmap::class)
class MyShadowBitmap {
    var data: ByteArray? = null
}

@Implements(Drawable::class)
open class MyShadowDrawable {
    var data: ByteArray? = null
}

@Implements(BitmapDrawable::class)
class MyShadowBitmapDrawable : MyShadowDrawable()