//
//  BluetoothUtil.kt
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//
@file:SuppressLint("MissingPermission")

package io.flutter.plugins.regula.documentreader.flutter_document_reader_api

import android.Manifest.permission.ACCESS_FINE_LOCATION
import android.Manifest.permission.BLUETOOTH_CONNECT
import android.Manifest.permission.BLUETOOTH_SCAN
import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager.PERMISSION_GRANTED
import android.os.Build
import android.os.IBinder
import android.provider.Settings
import androidx.core.app.ActivityCompat.requestPermissions
import androidx.core.content.ContextCompat.checkSelfPermission
import com.regula.documentreader.api.ble.BLEWrapper
import com.regula.documentreader.api.ble.BleWrapperCallback
import com.regula.documentreader.api.ble.RegulaBleService
import com.regula.documentreader.api.internal.permission.BluetoothPermissionHelper.BLE_ACCESS_PERMISSION
import com.regula.documentreader.api.internal.permission.BluetoothSettingsHelper.isBluetoothEnabled
import com.regula.documentreader.api.internal.permission.BluetoothSettingsHelper.isLocationServiceEnabled
import java.util.Timer
import java.util.TimerTask

const val SEARCHING_TIMEOUT: Long = 7000

const val INTENT_REQUEST_ENABLE_LOCATION = 196
const val INTENT_REQUEST_ENABLE_BLUETOOTH = 197

@SuppressLint("StaticFieldLeak")
lateinit var bluetooth: BLEWrapper
lateinit var savedCallbackForPermissionResult: Callback
var deviceConnected = false

fun connectBluetoothDevice(callback: Callback) {
    // return if already connected
    if (deviceConnected) return

    // If some of the bluetooth permissions/settings don't match the requirements,
    // save callback for later and request the permissions/settings.
    // Callback will then be used in onRequestPermissionsResult for permission requests
    // and in onActivityResult for settings change requests.
    if (!isBluetoothSettingsReady(activity)) {
        savedCallbackForPermissionResult = callback
        return
    }

    // set searching timeout
    val timer = object : TimerTask() {
        override fun run() {
            callback.success(false)
            bluetooth.stopDeviceScan()
            bluetooth.disconnect()
        }
    }
    Timer().schedule(timer, SEARCHING_TIMEOUT)

    // start searching devices
    val bleIntent = Intent(activity, RegulaBleService::class.java)
    activity.startService(bleIntent)
    activity.bindService(bleIntent, object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            bluetooth = (service as RegulaBleService.LocalBinder).service.bleManager
            bluetooth.addCallback(object : BleWrapperCallback() {
                override fun onDeviceReady() {
                    timer.cancel()
                    bluetooth.removeCallback(this)
                    deviceConnected = true
                    callback.success(true)
                }
            })
        }

        override fun onServiceDisconnected(name: ComponentName) {}
    }, 0)
}

fun onRequestPermissionsResult(
    requestCode: Int,
    permissions: Array<out String>,
    grantResults: IntArray
): Boolean {
    if (requestCode != BLE_ACCESS_PERMISSION || permissions.isEmpty()) return false
    if (grantResults.isEmpty() || grantResults[0] != PERMISSION_GRANTED) {
        savedCallbackForPermissionResult.success(false)
        return true
    }
    connectBluetoothDevice(savedCallbackForPermissionResult)
    return true
}

fun onActivityResult(requestCode: Int, rc: Int, @Suppress("UNUSED_PARAMETER") data: Intent?): Boolean {
    var resultCode = rc
    if (requestCode == INTENT_REQUEST_ENABLE_LOCATION)
        resultCode = if (isLocationServiceEnabled(activity)) Activity.RESULT_OK
        else requestCode

    if (requestCode == INTENT_REQUEST_ENABLE_BLUETOOTH || requestCode == INTENT_REQUEST_ENABLE_LOCATION) {
        if (resultCode == Activity.RESULT_OK)
            connectBluetoothDevice(savedCallbackForPermissionResult)
        else
            savedCallbackForPermissionResult.success(false)
        return true
    }
    return false
}

fun isBluetoothSettingsReady(activity: Activity): Boolean {
    deniedBluetoothPermissions(activity)?.let {
        requestPermissions(activity, it, BLE_ACCESS_PERMISSION)
        return false
    }
    if (!isBluetoothEnabled(activity)) {
        requestEnableBluetooth(activity)
        return false
    }
    if (!isLocationServiceEnabled(activity)) {
        requestEnableLocationService(activity)
        return false
    }
    return true
}

fun deniedBluetoothPermissions(activity: Activity): Array<String>? {
    val result = mutableListOf<String>()
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        result.addAll(deniedBluetoothPermission(activity, BLUETOOTH_SCAN))
        result.addAll(deniedBluetoothPermission(activity, BLUETOOTH_CONNECT))
    } else
        result.addAll(deniedBluetoothPermission(activity, ACCESS_FINE_LOCATION))
    return result.let { if (it.size > 0) it.toTypedArray() else null }
}

fun deniedBluetoothPermission(
    activity: Activity,
    permission: String
): Array<String> {
    if (checkSelfPermission(activity, permission) != PERMISSION_GRANTED)
        return arrayOf(permission)
    return arrayOf()
}

fun requestEnableBluetooth(activity: Activity) {
    val enableIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
    activity.startActivityForResult(enableIntent, INTENT_REQUEST_ENABLE_BLUETOOTH)
}

fun requestEnableLocationService(activity: Activity) {
    val myIntent = Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
    activity.startActivityForResult(myIntent, INTENT_REQUEST_ENABLE_LOCATION)
}
