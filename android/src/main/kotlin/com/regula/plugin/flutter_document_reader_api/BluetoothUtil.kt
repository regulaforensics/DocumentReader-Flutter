package com.regula.plugin.documentreader

import android.Manifest.permission.ACCESS_FINE_LOCATION
import android.Manifest.permission.BLUETOOTH_CONNECT
import android.Manifest.permission.BLUETOOTH_SCAN
import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.content.ComponentName
import android.content.Context.BIND_AUTO_CREATE
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager.PERMISSION_GRANTED
import android.os.Build
import android.os.IBinder
import android.provider.Settings
import android.util.Log
import androidx.core.content.ContextCompat.checkSelfPermission
import com.regula.common.ble.BLEWrapper
import com.regula.common.ble.BleWrapperCallback
import com.regula.common.ble.RegulaBleService
import com.regula.documentreader.api.internal.permission.BluetoothPermissionHelper.BLE_ACCESS_PERMISSION
import com.regula.documentreader.api.internal.permission.BluetoothSettingsHelper.isBluetoothEnabled
import com.regula.documentreader.api.internal.permission.BluetoothSettingsHelper.isLocationServiceEnabled
import java.util.Timer
import java.util.TimerTask

const val SEARCHING_TIMEOUT: Long = 7000

const val INTENT_REQUEST_ENABLE_LOCATION = 196
const val INTENT_REQUEST_ENABLE_BLUETOOTH = 197

@SuppressLint("StaticFieldLeak")
var bluetooth: BLEWrapper? = null
lateinit var savedDeviceNameForPermissionResult: String
lateinit var savedCallbackForPermissionResult: Callback

fun connectBluetoothDevice(deviceName: String, callback: Callback) {
    if (bluetooth?.isConnected == true) {
        Log.e("REGULA", "Bluetooth device already connected, returning false")
        callback(false)
        return
    }

    if (!isBluetoothSettingsReady(activity)) {
        savedDeviceNameForPermissionResult = deviceName
        savedCallbackForPermissionResult = callback
        return
    }

    val timeout = object : TimerTask() {
        override fun run() {
            callback(false)
            bluetooth?.stopDeviceScan()
            bluetooth?.disconnect()
        }
    }
    Timer().schedule(timeout, SEARCHING_TIMEOUT)

    val bleIntent = Intent(context, RegulaBleService::class.java)
    bleIntent.putExtra(RegulaBleService.DEVICE_NAME, deviceName)
    context.startService(bleIntent)
    context.bindService(bleIntent, object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            bluetooth = (service as RegulaBleService.LocalBinder).service.bleManager
            if (bluetooth!!.isConnected) callback(true)
            else bluetooth!!.addCallback(object : BleWrapperCallback() {
                override fun onDeviceReady() {
                    timeout.cancel()
                    bluetooth!!.removeCallback(this)
                    callback(true)
                }
            })
        }

        override fun onServiceDisconnected(name: ComponentName) {}
    }, BIND_AUTO_CREATE)
}

fun onRequestPermissionsResult(
    requestCode: Int,
    permissions: Array<String>,
    grantResults: IntArray
): Boolean {
    if (requestCode != BLE_ACCESS_PERMISSION || permissions.isEmpty()) return false
    if (grantResults.isEmpty() || grantResults[0] != PERMISSION_GRANTED) {
        savedCallbackForPermissionResult(false)
        return true
    }
    connectBluetoothDevice(savedDeviceNameForPermissionResult, savedCallbackForPermissionResult)
    return true
}

fun onActivityResult(requestCode: Int, rc: Int, @Suppress("UNUSED_PARAMETER") data: Intent?): Boolean {
    var resultCode = rc
    if (requestCode == INTENT_REQUEST_ENABLE_LOCATION)
        resultCode = if (isLocationServiceEnabled(activity)) Activity.RESULT_OK
        else requestCode

    if (requestCode == INTENT_REQUEST_ENABLE_BLUETOOTH || requestCode == INTENT_REQUEST_ENABLE_LOCATION) {
        if (resultCode == Activity.RESULT_OK)
            connectBluetoothDevice(savedDeviceNameForPermissionResult, savedCallbackForPermissionResult)
        else
            savedCallbackForPermissionResult(false)
        return true
    }
    return false
}

fun isBluetoothSettingsReady(activity: Activity): Boolean {
    deniedBluetoothPermissions()?.let {
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

fun deniedBluetoothPermissions(): Array<String>? {
    val result = mutableListOf<String>()
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        result.addAll(deniedBluetoothPermission(BLUETOOTH_SCAN))
        result.addAll(deniedBluetoothPermission(BLUETOOTH_CONNECT))
    } else
        result.addAll(deniedBluetoothPermission(ACCESS_FINE_LOCATION))
    return result.let { if (it.isNotEmpty()) it.toTypedArray() else null }
}

fun deniedBluetoothPermission(permission: String): Array<String> {
    if (checkSelfPermission(context, permission) != PERMISSION_GRANTED)
        return arrayOf(permission)
    return arrayOf()
}

fun requestEnableBluetooth(activity: Activity) {
    val enableIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
    startActivityForResult(activity, enableIntent, INTENT_REQUEST_ENABLE_BLUETOOTH)
}

fun requestEnableLocationService(activity: Activity) {
    val myIntent = Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
    startActivityForResult(activity, myIntent, INTENT_REQUEST_ENABLE_LOCATION)
}

// btDevice functionality(temporary, will be reworked)

fun btDeviceRequestFlashing() {
    bluetooth?.requestFlashing()
}

fun btDeviceRequestFlashingFullIR() {
    bluetooth?.requestFlashingFullIR()
}

fun btDeviceRequestTurnOffAll() {
    bluetooth?.requestTurnOffAll()
}
