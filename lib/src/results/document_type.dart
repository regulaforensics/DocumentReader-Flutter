//
//  DocumentType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of "../../flutter_document_reader_api.dart";

class DocumentType {
  /// Document type name.
  String? get name => _name;
  String? _name;

  /// Document type numeric code.
  int get id => _id;
  late int _id;

  /// Document issuing country ICAO code.
  String? get iCAOCode => _iCAOCode;
  String? _iCAOCode;

  /// An array of IRS document identifiers.
  List<int>? get fDSID => _fDSID;
  List<int>? _fDSID;

  /// Document type.
  DocType get type => _type;
  late DocType _type;

  /// Document format.
  DocFormat get format => _format;
  late DocFormat _format;

  /// Flag for MRZ presence on a document.
  bool get mrz => _mrz;
  late bool _mrz;

  /// Document deprecation.
  bool get isDeprecated => _isDeprecated;
  late bool _isDeprecated;

  /// Document description text.
  String? get description => _description;
  String? _description;

  /// Document issue year.
  String? get year => _year;
  String? _year;

  /// Document issuing country name.
  String? get countryName => _countryName;
  String? _countryName;

  /// An index of the document page whence results are received.
  int get pageIndex => _pageIndex;
  late int _pageIndex;

  /// Allows you to deserialize object.
  static DocumentType? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DocumentType();

    result._pageIndex = jsonObject["pageIndex"];
    result._id = jsonObject["documentID"];
    result._type = DocType.getByValue(jsonObject["dType"])!;
    result._format = DocFormat.getByValue(jsonObject["dFormat"])!;
    result._mrz = jsonObject["dMRZ"];
    result._isDeprecated = jsonObject["isDeprecated"];
    result._name = jsonObject["name"];
    result._iCAOCode = jsonObject["ICAOCode"];
    result._description = jsonObject["dDescription"];
    result._year = jsonObject["dYear"];
    result._countryName = jsonObject["dCountryName"];
    result._fDSID = _intListFrom(jsonObject["FDSID"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "documentID": id,
        "ICAOCode": iCAOCode,
        "FDSID": fDSID,
        "dType": type.value,
        "dFormat": format.value,
        "dMRZ": mrz,
        "isDeprecated": isDeprecated,
        "dDescription": description,
        "dYear": year,
        "dCountryName": countryName,
        "pageIndex": pageIndex,
      }.clearNulls();
}

/// Defining the geometric format of documents in accordance with ISO / IEC 7810.
enum DocFormat {
  /// Unknown format.
  UNKNOWN(-1),

  /// ID1 document format.
  ID1(0),

  /// ID2 document format.
  ID2(1),

  /// ID3 document format.
  ID3(2),

  /// Undefined document format.
  NON(3),

  /// A4 document format.
  A4(4),

  /// ID3 double document format.
  ID3_x2(5),

  /// ID2 Turkey document format.
  ID2_TURKEY(6),

  /// ID1 format document rotated 90 degrees.
  ID1_90(10),

  /// ID1 format document rotated 180 degrees.
  ID1_180(11),

  /// ID1 format document rotated 270 degrees.
  ID1_270(12),

  /// ID2 format document rotated 180 degrees.
  ID2_180(13),

  /// ID3 format document rotated 180 degrees.
  ID3_180(14),

  /// Arbitrary format.
  CUSTOM(1000),

  /// Photo format.
  PHOTO(1001),

  /// Flexible format. Standard formats can be resized during cropping, depending
  /// on various factors: light, background etc.
  FLEXIBLE(1002);

  const DocFormat(this.value);
  final int value;

  static DocFormat? getByValue(int? i) {
    if (i == null) return null;
    try {
      return DocFormat.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return DocFormat.UNKNOWN;
    }
  }
}

enum DocType {
  /// An unknown document type.
  NotDefined(0),

  /// Passport.
  Passport(11),

  /// Identity Card.
  IdentityCard(12),

  /// Diplomatic Passport.
  DiplomaticPassport(13),

  /// Service Passport.
  ServicePassport(14),

  /// Seaman's Identity Document.
  SeamanIdentityDocument(15),

  /// Identity Card for Residence.
  IdentityCardForResidence(16),

  /// Travel Document.
  TravelDocument(17),

  /// Other.
  Other(99),

  /// Visa ID-2.
  VisaID2(29),

  /// Visa ID-3.
  VisaID3(30),

  /// National Identity Card.
  NationalIdentityCard(20),

  /// Social Identity Card.
  SocialIdentityCard(21),

  /// Alien's Identity Card.
  AliensIdentityCard(22),

  /// Privileged Identity Card.
  PrivilegedIdentityCard(23),

  /// Residence Permit Identity Card.
  ResidencePermitIdentityCard(24),

  /// Origin Card.
  OriginCard(25),

  /// Emergency Passport.
  EmergencyPassport(26),

  /// Alien's Passport.
  AliensPassport(27),

  /// Alternative Identity Card.
  AlternativeIdentityCard(28),

  /// Authorization Card.
  AuthorizationCard(32),

  /// Beginner Permit.
  BeginnerPermit(33),

  /// Border Crossing Card.
  BorderCrossingCard(34),

  /// Chauffeur License.
  ChauffeurLicense(35),

  /// Chauffeur License under 18.
  ChauffeurLicenseUnder18(36),

  /// Chauffeur License under 21.
  ChauffeurLicenseUnder21(37),

  /// Commercial Driving License.
  CommercialDrivingLicense(38),

  /// Commercial Driving License Instructional Permit.
  CommercialDrivingLicenseInstructionalPermit(39),

  /// Commercial Driving License under 18.
  CommercialDrivingLicenseUnder18(40),

  /// Commercial Driving License under 21.
  CommercialDrivingLicenseUnder21(41),

  /// Commercial Indtuction Permit.
  CommercialInstructionPermit(42),

  /// Commercial New Permit.
  CommercialNewPermit(43),

  /// Concealed Carry License.
  ConcealedCarryLicense(44),

  /// Concealed Firearm Permit.
  ConcealedFirearmPermit(45),

  /// Conditional Driving License.
  ConditionalDrivingLicense(46),

  /// Department of Veterans Affairs Identity Card.
  DepartmentOfVeteransAffairsIdentityCard(47),

  /// Diplomatic Driving License.
  DiplomaticDrivingLicense(48),

  /// Driving License.
  DrivingLicense(49),

  /// Driving License Instructional Permit.
  DrivingLicenseInstructionalPermit(50),

  /// Driving License Instructional Permit under 18.
  DrivingLicenseInstructionalPermitUnder18(51),

  /// Driving License Instructional Permit under 21.
  DrivingLicenseInstructionalPermitUnder21(52),

  /// Driving License Learners Permit.
  DrivingLicenseLearnersPermit(53),

  /// Driving License Learners Permit under 18.
  DrivingLicenseLearnersPermitUnder18(54),

  /// Driving License Learners Permit under 21.
  DrivingLicenseLearnersPermitUnder21(55),

  /// Driving License Novice.
  DrivingLicenseNovice(56),

  /// Driving License Novice under 18.
  DrivingLicenseNoviceUnder18(57),

  /// Driving License Novice under 21.
  DrivingLicenseNoviceUnder21(58),

  /// Driving License Registered Offender.
  DrivingLicenseRegisteredOffender(59),

  /// Driving License Redticted under 18.
  DrivingLicenseRestrictedUnder18(60),

  /// Driving License Redticted under 21.
  DrivingLicenseRestrictedUnder21(61),

  /// Driving License Temporary Visitor.
  DrivingLicenseTemporaryVisitor(62),

  /// Driving License Temporary Visitor under 18.
  DrivingLicenseTemporaryVisitorUnder18(63),

  /// Driving License Temporary Visitor under 21.
  DrivingLicenseTemporaryVisitorUnder21(64),

  /// Driving License under 18.
  DrivingLicenseUnder18(65),

  /// Driving License under 21.
  DrivingLicenseUnder21(66),

  /// Employment Driving Permit.
  EmploymentDrivingPermit(67),

  /// Enhanced Chauffeur License.
  EnhancedChauffeurLicense(68),

  /// Enhanced Chauffeur License under 18.
  EnhancedChauffeurLicenseUnder18(69),

  /// Enhanced Chauffeur License under 21.
  EnhancedChauffeurLicenseUnder21(70),

  /// Enhanced Commercial Driving License.
  EnhancedCommercialDrivingLicense(71),

  /// Enhanced Driving License.
  EnhancedDrivingLicense(72),

  /// Enhanced Driving License under 18.
  EnhancedDrivingLicenseUnder18(73),

  /// Enhanced Driving License under 21.
  EnhancedDrivingLicenseUnder21(74),

  /// Enhanced Identity Card.
  EnhancedIdentityCard(75),

  /// Enhanced Identity Card under 18.
  EnhancedIdentityCardUnder18(76),

  /// Enhanced Identity Card under 21.
  EnhancedIdentityCardUnder21(77),

  /// Enhanced Operators License.
  EnhancedOperatorsLicense(78),

  /// Firearms Permit.
  FirearmsPermit(79),

  /// Full Provisional License.
  FullProvisionalLicense(80),

  /// Full Provisional License under 18.
  FullProvisionalLicenseUnder18(81),

  /// Full Provisional License under 21.
  FullProvisionalLicenseUnder21(82),

  /// Geneva Conventions Identity Card.
  GenevaConventionsIdentityCard(83),

  /// Graduated Driving License under 18.
  GraduatedDrivingLicenseUnder18(84),

  /// Graduated Driving License under 21.
  GraduatedDrivingLicenseUnder21(85),

  /// Graduated Indtuction Permit under 18.
  GraduatedInstructionPermitUnder18(86),

  /// Graduated Indtuction Permit under 21.
  GraduatedInstructionPermitUnder21(87),

  /// Graduated License under 18.
  GraduatedLicenseUnder18(88),

  /// Graduated License under 21.
  GraduatedLicenseUnder21(89),

  /// Handgun Carry Permit.
  HandgunCarryPermit(90),

  /// Identity and Privilege Card.
  IdentityAndPrivilegeCard(91),

  /// Identity Card Mobility Impaired.
  IdentityCardMobilityImpaired(92),

  /// Identity Card Registered Offender.
  IdentityCardRegisteredOffender(93),

  /// Identity Card Temporary Visitor.
  IdentityCaremporaryVisitor(94),

  /// Identity Card Temporary Visitor under 18.
  IdentityCaremporaryVisitorUnder18(95),

  /// Identity Card Temporary Visitor under 21.
  IdentityCaremporaryVisitorUnder21(96),

  /// Identity Card under 18.
  IdentityCardUnder18(97),

  /// Identity Card under 21.
  IdentityCardUnder21(98),

  /// Ignition Interlock Permit.
  IgnitionInterlockPermit(100),

  /// Immigrant Visa.
  ImmigrantVisa(101),

  /// Indtuction Permit.
  InstructionPermit(102),

  /// Indtuction Permit under 18.
  InstructionPermitUnder18(103),

  /// Indtuction Permit under 21.
  InstructionPermitUnder21(104),

  /// Interim Driving License.
  InterimDrivingLicense(105),

  /// Interim Identity Card.
  InterimIdentityCard(106),

  /// Intermediate Driving License.
  IntermediateDrivingLicense(107),

  /// Intermediate Driving License under 18.
  IntermediateDrivingLicenseUnder18(108),

  /// Intermediate Driving License under 21.
  IntermediateDrivingLicenseUnder21(109),

  /// Junior Driving License.
  JuniorDrivingLicense(110),

  /// Learner Instructional Permit.
  LearnerInstructionalPermit(111),

  /// Learner License.
  LearnerLicense(112),

  /// Learner License under 18.
  LearnerLicenseUnder18(113),

  /// Learner License under 21.
  LearnerLicenseUnder21(114),

  /// Learner Permit.
  LearnerPermit(115),

  /// Learner Permit under 18.
  LearnerPermitUnder18(116),

  /// Learner Permit under 21.
  LearnerPermitUnder21(117),

  /// Limited License.
  LimitedLicense(118),

  /// Limited Permit.
  LimitedPermit(119),

  /// Limited Term Driving License.
  LimiteermDrivingLicense(120),

  /// Limited Term Identity Card.
  LimiteermIdentityCard(121),

  /// Liquor Identity Card.
  LiquorIdentityCard(122),

  /// New Permit.
  NewPermit(123),

  /// New Permit under 18.
  NewPermitUnder18(124),

  /// New Permit under 21.
  NewPermitUnder21(125),

  /// Non-US Citizen Driving License.
  NonUsCitizenDrivingLicense(126),

  /// Occupational Driving License.
  OccupationalDrivingLicense(127),

  /// Oneida Tribe of Indians Identity Card.
  OneidaTribeOfIndiansIdentityCard(128),

  /// Operator License.
  OperatorLicense(129),

  /// Operator License under 18.
  OperatorLicenseUnder18(130),

  /// Operator License under 21.
  OperatorLicenseUnder21(131),

  /// Permanent Driving License.
  PermanentDrivingLicense(132),

  /// Permit to Re-enter.
  PermitToReEnter(133),

  /// Probationary Auto License.
  ProbationaryAutoLicense(134),

  /// Probationary Auto License under 18.
  ProbationaryDrivingLicenseUnder18(135),

  /// Probationary Auto License under 21.
  ProbationaryDrivingLicenseUnder21(136),

  /// Probationary Vehicle Salesperson License.
  ProbationaryVehicleSalespersonLicense(137),

  /// Provisional Driving License.
  ProvisionalDrivingLicense(138),

  /// Provisional Driving License under 18.
  ProvisionalDrivingLicenseUnder18(139),

  /// Provisional Driving License under 21.
  ProvisionalDrivingLicenseUnder21(140),

  /// Provisional License.
  ProvisionalLicense(141),

  /// Provisional License under 18.
  ProvisionalLicenseUnder18(142),

  /// Provisional License under 21.
  ProvisionalLicenseUnder21(143),

  /// Public Passenger Chauffeur License.
  PublicPassengerChauffeurLicense(144),

  /// Racing and Gaming Comission Card.
  RacingAndGamingComissionCard(145),

  /// Refugee Travel Document.
  RefugeeTravelDocument(146),

  /// Renewal Permit.
  RenewalPermit(147),

  /// Restricted Commercial Driving License.
  RestrictedCommercialDrivingLicense(148),

  /// Restricted Driving License.
  RestrictedDrivingLicense(149),

  /// Restricted Permit.
  RestrictedPermit(150),

  /// Seasonal Permit.
  SeasonalPermit(151),

  /// Seasonal Resident Identity Card.
  SeasonalResidentIdentityCard(152),

  /// Senior Citizen Identity Card.
  SeniorCitizenIdentityCard(153),

  /// Sex Offender.
  SexOffender(154),

  /// Social Security Card.
  SocialSecurityCard(155),

  /// Temporary Driving License.
  TemporaryDrivingLicense(156),

  /// Temporary Driving License under 18.
  TemporaryDrivingLicenseUnder18(157),

  /// Temporary Driving License under 21.
  TemporaryDrivingLicenseUnder21(158),

  /// Temporary Identity Card.
  TemporaryIdentityCard(159),

  /// Temporary Instruction Permit Identity Card.
  TemporaryInstructionPermitIdentityCard(160),

  /// Temporary Instruction Permit Identity Card under 18.
  TemporaryInstructionPermitIdentityCardUnder18(161),

  /// Temporary Instruction Permit Identity Card under 21.
  TemporaryInstructionPermitIdentityCardUnder21(162),

  /// Temporary Visitor Driving License.
  TemporaryVisitorDrivingLicense(163),

  /// Temporary Visitor Driving License under 18.
  TemporaryVisitorDrivingLicenseUnder18(164),

  /// Temporary Visitor Driving License under 21.
  TemporaryVisitorDrivingLicenseUnder21(165),

  /// Uniformed Services Identity Card.
  UniformedServicesIdentityCard(166),

  /// Vehicle Salesperson License.
  VehicleSalespersonLicense(167),

  /// Worker Identification Credential.
  WorkerIdentificationCredential(168),

  /// Commercial Driving License Novice.
  CommercialDrivingLicenseNovice(169),

  /// Commercial Driving License Novice under 18.
  CommercialDrivingLicenseNoviceUnder18(170),

  /// Commercial Driving License Novice under 21.
  CommercialDrivingLicenseNoviceUnder21(171),

  /// Passport Card.
  PassportCard(172),

  /// Permanent Resident Card.
  PermanentResidentCard(173),

  /// Personal Identification Verification.
  PersonalIdentificationVerification(174),

  /// Temporary Operator License.
  TemporaryOperatorLicense(175),

  /// Driving License under 19.
  DrivingLicenseUnder19(176),

  /// Identity Card under 19.
  IdentityCardUnder19(177),

  /// Visa.
  Visa(178),

  /// Temporary Passport.
  TemporaryPassport(179),

  /// Voting Card.
  VotingCard(180),

  /// Health Card.
  HealthCard(181),

  /// Certificate of Citizenship.
  CertificateOfCitizenship(182),

  /// Address Card.
  AddressCard(183),

  /// Airport Immigration Card.
  AirportImmigrationCard(184),

  /// Alien Regidtation Card.
  AlienRegistrationCard(185),

  /// APEH Card.
  APEHCard(186),

  /// Coupon To Driving License.
  CouponToDrivingLicense(187),

  /// Crew Member Certificate.
  CrewMemberCertificate(188),

  /// Document for Return.
  DocumentForReturn(189),

  /// E-Card.
  ECard(190),

  /// Employment Card.
  EmploymentCard(191),

  /// HKSAR Immigration Form.
  HKSARImmigrationForm(192),

  /// Immigrant Card.
  ImmigrantCard(193),

  /// Labour Card.
  LabourCard(194),

  /// Laissez Passer.
  LaissezPasser(195),

  /// Lawyer Identity Certificate.
  LawyerIdentityCertificate(196),

  /// License Card.
  LicenseCard(197),

  /// Passport Stateless.
  PassportStateless(198),

  /// Passport Child.
  PassportChild(199),

  /// Passport Consular.
  PassportConsular(200),

  /// Passport Diplomatic Service.
  PassportDiplomaticService(201),

  /// Passport Official.
  PassportOfficial(202),

  /// Passport Provisional.
  PassportProvisional(203),

  /// Passport Special.
  PassportSpecial(204),

  /// Permission to the Local Border Traffic.
  PermissionToTheLocalBorderTraffic(205),

  /// Registration Certificate.
  RegistrationCertificate(206),

  /// SEDESOL Card.
  SEDESOLCard(207),

  /// Social Card.
  SocialCard(208),

  /// TB Card.
  TBCard(209),

  /// Vehicle Passport.
  VehiclePassport(210),

  /// W Document.
  WDocument(211),

  /// Diplomatic Identity Card.
  DiplomaticIdentityCard(212),

  /// Consular Identity Card.
  ConsularIdentityCard(213),

  /// Income Tax Card.
  IncomeTaxCard(214),

  /// Residence Permit.
  ResidencePermit(215),

  /// Document of Identity.
  DocumentOfIdentity(216),

  /// Border Crossing Permit.
  BorderCrossingPermit(217),

  /// Passport Limited Validity.
  PassportLimitedValidity(218),

  /// SIM Card.
  SIMCard(219),

  /// Tax Card.
  TaxCard(220),

  /// Company Card.
  CompanyCard(221),

  /// Domestic Passport.
  DomesticPassport(222),

  /// Identity Certificate.
  IdentityCertificate(223),

  /// Resident Id Card.
  ResidentIdCard(224),

  /// Armed Forces Identity Card.
  ArmedForcesIdentityCard(225),

  /// Professional Card.
  ProfessionalCard(226),

  /// Registration Stamp.
  RegistrationStamp(227),

  /// Driver Card.
  DriverCard(228),

  /// Driver Training Certificate.
  DriverTrainingCertificate(229),

  /// Qualification Driving License.
  QualificationDrivingLicense(230),

  /// Membership Card.
  MembershipCard(231),

  /// Public Vehicle Driver Authority Card.
  PublicVehicleDriverAuthorityCard(232),

  /// Marine License.
  MarineLicense(233),

  /// Temporary Learner Driving License.
  TemporaryLearnerDrivingLicense(234),

  /// Temporary Commercial Driving License.
  TemporaryCommercialDrivingLicense(235),

  /// Interim Instructional Permit.
  InterimInstructionalPermit(236),

  /// Certificate of Competency.
  CertificateOfCompetency(237),

  /// Certificate of Proficiency.
  CertificateOfProficiency(238),

  TradeLicense(239),

  PassportPage(240),

  Invoice(241),

  PassengerLocatorForm(242);

  const DocType(this.value);
  final int value;

  static DocType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return DocType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return DocType.NotDefined;
    }
  }

  static List<DocType>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<DocType> list = [];
    for (int item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}
