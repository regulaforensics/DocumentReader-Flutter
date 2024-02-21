# How to build demo application

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

# Troubleshooting license issues

If you have issues with license verification when running the application, please verify that next is true:
1. The OS, which you use, is specified in the license (e.g., Android and/or iOS).
2. The license is valid (not expired).
3. The date and time on the device, where you run the application, are valid.
4. You use the latest release version of the Document Reader SDK.
5. You placed the `license` into the correct folder as described [here](#how-to-build-demo-application).
