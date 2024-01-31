Map<String, List<String>?> nullableMap = {
  "InitConfig": ["databasePath", "customDb"],
  "RecognizeConfig": [
    "onlineProcessingConfig",
    "livePortrait",
    "extPortrait",
    "data",
    "images",
    "imageInputData"
  ],
  "RecognizeConfig2": ["scenario", "image"],
  "ScannerConfig": ["scenario", "livePortrait", "extPortrait", "cameraId"],
  "ScannerConfig2": ["onlineProcessingConfig"],
  "FaceApiSearchParams": ["groupIds"],
  "FaceApiParams": ["searchParams", "proxy", "proxyPassword", "proxyType"],
  "GlaresCheckParams!": [],
  "RFIDParams!": [],
  "ImageQA!": [],
  "ProcessParam!": ["imageQA"],
  "ReprocParams": ["failIfNoService", "httpHeaders"],
  "RFIDScenario!": [
    "defaultReadingBufferSize",
    "eDLDataGroups",
    "ePassportDataGroups",
    "eIDDataGroups"
  ],
  "Customization!": [],
  "Functionality!": [],
  "DocumentsDatabase!": ["countriesNumber", "documentsNumber"],
  "DocReaderVersion!": [],
  "License": ["expiryDate", "countryFilter"],
  "VDSNCData": ["type", "issuingCountry", "signatureAlgorithm"],
  "GraphicField": ["fieldRect"],
  "Symbol": ["rect"],
  "Value": ["boundRect", "rfidOrigin"],
  "TextSource": ["source"],
  "DocumentType": [
    "name",
    "iCAOCode",
    "fDSID",
    "dDescription",
    "dYear",
    "dCountryName"
  ],
  "Results": ["authenticityResult"],
  "PAResourcesIssuer": ["friendlyName"],
  "PKDCertificate": ["privateKey"],
  "TccParams!": []
};
