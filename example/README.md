# Demo application for Document Reader plugin

## How to build demo application

1. Get the trial license at [client.regulaforensics.com](https://client.regulaforensics.com/) (`regula.license` file). The license creation wizard will guide you through the necessary steps.
2. Get the trial database at [client.regulaforensics.com/customer/databases](https://client.regulaforensics.com/customer/databases) (`db.dat`)
3. Download or clone this repository using the command `git clone https://github.com/regulaforensics/DocumentReader-Flutter.git`.
4. Copy the `regula.license` file to the `example/assets` folder.
5. Copy the `db.dat` file to the `example/android/app/src/main/assets/Regula/` folder.
6. Copy the `db.dat` file to the `example/ios/Runner/` folder.
7. Run the following commands in Terminal:
```bash
$ cd example
# Install packages
$ flutter pub get
# Check that supported devices are running
$ flutter devices
# Run the app
$ flutter run
```

## Exra examples

#### RFID options

This demo app covers 3 different ways of reading RFID:
1. Basic, the simplest one. Requires only one callback to handle the results.
2. Advanced. Shows how to set additional callbacks to handle specific events during RFID chip reading.
3. Custom, the most complex one. Shows how to make your own custom UI for RFID chip reading and how to display RFID progress manually.

You can switch between these options using a static variable `rfidOption`. 
Default: `RfidOption.Basic`.

#### Bluetooth device

This demo app describes how Regula Bluetooth Device can be used to scan a document:
1. Set static variable `useBleDevice` to `true`(default: `false`).
2. If you've put a license file into the project, you can remove it. License will be automatically retrieved from your bluetooth device.
3. Turn on bluetooth device and run the app.
4. Enter the device's name into the text field and hit `connect` button. You may be asked for bluetooth permissions.
5. If connection was successful, document reader will initialize and you'll see a list of scenarios. Choose the preffered one and start scanning.

## Troubleshooting license issues

If you have issues with license verification when running the application, please verify that next is true:
1. The OS, which you use, is specified in the license (e.g., Android and/or iOS).
2. The license is valid (not expired).
3. The date and time on the device, where you run the application, are valid.
4. You use the latest release version of the Document Reader SDK.
5. You placed the `license` into the correct folder as described [here](#how-to-build-demo-application).