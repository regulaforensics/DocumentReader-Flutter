#!/usr/bin/env bash
source ../wrappers/.hidden/scripts/flutter.sh

packageName=flutter_document_reader_api
podName=$(getPodName DocumentReader)
versionIOS=$(getVersionIOS $podName $IOS_VERSION)
versionAndroid=$(getVersionAndroid $ANDROID_VERSION documentreader/api)
coreVersion=$(getVersionPubDevFtp $DR_CORE_MODULE_TYPE $DR_CORE_MODULE_VERSION flutter_document_reader_core_fullauthrfid DocumentReaderCore)
btdeviceVersion=$(getVersionPubDevFtp $BTDEVICE_MODULE_TYPE $BTDEVICE_MODULE_VERSION flutter_document_reader_btdevice DocumentReaderBTDevice)
moduleVersion=$(getModuleVersion DocumentReader $MAJOR_VERSION)

updateFlutterPlugin $moduleVersion $versionAndroid $versionIOS $podName $packageName
updateFlutterExample $coreVersion $btdeviceVersion
flutterPublish $moduleVersion DocumentReader DocumentReader-Flutter master

finish "$TYPE $packageName@$moduleVersion
  IOS $SOURCE_TYPE $versionIOS
  Android $SOURCE_TYPE $versionAndroid
Example dependencies
  flutter_document_reader_core_fullauthrfid@$coreVersion
  flutter_document_reader_btdevice@$btdeviceVersion"
