# Demo application for Document Reader plugin

## How to build demo application

1. Download or the clone current repository using the command `git clone https://github.com/regulaforensics/DocumentReader-Flutter.git`.
2. Put `regula.license` file at `assets/` (you can get a trial license [here](https://client.regulaforensics.com)).
3. Put `db.dat` file at `ios/Runner/` and `android/app/src/main/assets/Regula/` (you can get a trial database [here](https://client.regulaforensics.com/customer/databases))
4. Execute `flutter pub get && (cd ios && pod install || pod update)` within this directory.
5. Run the app: `flutter run`.

## Additional examples

### Bluetooth device

In order to connect to an external scanning device, change the `useBtDevice` constant to true in `src/extra/bt_device`, and set `btDeviceName` to the name of your device. After running the app, click `Connect`.

### RFID self hosted UI

This app also demonstraits how you can implement you own UI for the RFID reading process. To enable it, change the `useRfidSelfHostedUI` constant to true in `src/extra/custom_rfid`. Run the app and initiate RFID reading.
