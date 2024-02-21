//
//  FieldType.dart
//  DocumentReader
//
//  Created by Pavel Masiuk on 21.09.2023.
//  Copyright © 2023 Regula. All rights reserved.
//

part of document_reader;

/// Enum contains identifiers that determine the logical type of text data
/// obtained while reading MRZ, document filling fields, and barcodes.
enum FieldType {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  /// Document class code.
  DOCUMENT_CLASS_CODE(0),

  /// Issuing state code in compliance with 3166-1 standard (ICAO doc 9303).
  ISSUING_STATE_CODE(1),

  /// Document number.
  DOCUMENT_NUMBER(2),

  /// Expiry date of the document.
  DATE_OF_EXPIRY(3),

  /// Issue date of the document.
  DATE_OF_ISSUE(4),

  /// Date of birth.
  DATE_OF_BIRTH(5),

  /// Place of birth.
  PLACE_OF_BIRTH(6),

  /// Personal number.
  PERSONAL_NUMBER(7),

  /// Surname.
  SURNAME(8),

  /// Given name(s).
  GIVEN_NAMES(9),

  /// Mother's name.
  MOTHERS_NAME(10),

  /// Nationality.
  NATIONALITY(11),

  /// Sex.
  SEX(12),

  /// Height.
  HEIGHT(13),

  /// Weight.
  WEIGHT(14),

  /// Eye color.
  EYES_COLOR(15),

  /// Hair color.
  HAIR_COLOR(16),

  /// Address.
  ADDRESS(17),

  /// Organ donor indicator.
  DONOR(18),

  /// Social security number.
  SOCIAL_SECURITY_NUMBER(19),

  /// Driving licence classification code.
  DL_CLASS(20),

  /// Driving licenсe endorsement code.
  DL_ENDORSED(21),

  /// Driving licence restriction code.
  DL_RESTRICTION_CODE(22),

  /// Date of 21st birthday.
  DL_UNDER_21_DATE(23),

  /// Issuing authority.
  AUTHORITY(24),

  /// Surname and given name(s).
  SURNAME_AND_GIVEN_NAMES(25),

  /// Nationality code in compliance with ISO3166-1 standard (ICAO doc 9303).
  NATIONALITY_CODE(26),

  /// Passport number.
  PASSPORT_NUMBER(27),

  /// Invitation number.
  INVITATION_NUMBER(28),

  /// Visa identification number.
  VISA_ID(29),

  /// Visa class.
  VISA_CLASS(30),

  /// Visa subclass.
  VISA_SUB_CLASS(31),

  /// Not used.
  MRZ_STRING_1(32),

  /// Not used.
  MRZ_STRING_2(33),

  /// Not used.
  MRZ_STRING_3(34),

  /// MRZ type (ID-1 – 0, ID-2 – 1, ID-3 – 2).
  MRZ_TYPE(35),

  /// Optional data.
  OPTIONAL_DATA(36),

  /// Document class name.
  DOCUMENT_CLASS_NAME(37),

  /// Issuing state name.
  ISSUING_STATE_NAME(38),

  /// Place of issue.
  PLACE_OF_ISSUE(39),

  /// Checksum for document number.
  DOCUMENT_NUMBER_CHECKSUM(40),

  /// Checksum for date of birth.
  DATE_OF_BIRTH_CHECKSUM(41),

  /// Checksum for date of expiry.
  DATE_OF_EXPIRY_CHECKSUM(42),

  /// Checksum for personal number.
  PERSONAL_NUMBER_CHECKSUM(43),

  /// Final checksum (for the whole MRZ).
  FINAL_CHECKSUM(44),

  /// Checksum for passport number (for visas).
  PASSPORT_NUMBER_CHECKSUM(45),

  /// Checksum for passport number (for visas).
  INVITATION_NUMBER_CHECKSUM(46),

  /// Checksum for visa identification number.
  VISA_ID_CHECKSUM(47),

  /// Checksum for surname + given name(s).
  SURNAME_AND_GIVEN_NAMES_CHECKSUM(48),

  /// Checksum for visa expiry date.
  VISA_VALID_UNTIL_CHECKSUM(49),

  /// Other information.
  OTHER(50),

  /// MRZ lines.
  MRZ_STRINGS(51),

  /// Name suffix.
  NAME_SUFFIX(52),

  /// Name prefix.
  NAME_PREFIX(53),

  /// Checksum for date of issue.
  DATE_OF_ISSUE_CHECKSUM(54),

  /// Check digit for date of issue.
  DATE_OF_ISSUE_CHECK_DIGIT(55),

  /// Document series.
  DOCUMENT_SERIES(56),

  /// Serial number of registration certificate.
  REG_CERT_REG_NUMBER(57),

  /// Vehicle model.
  REG_CERT_CAR_MODEL(58),

  /// Vehicle color.
  REG_CERT_CAR_COLOR(59),

  /// Vehicle identification number (VIN).
  REG_CERT_BODY_NUMBER(60),

  /// Vehicle type.
  REG_CERT_CAR_TYPE(61),

  /// Permissible maximum weight.
  REG_CERT_MAX_WEIGHT(62),

  /// Vehicle weight.
  REG_CERT_WEIGHT(63),

  /// Address (area).
  ADDRESS_AREA(64),

  /// Address (state).
  ADDRESS_STATE(65),

  /// Address (building number).
  ADDRESS_BUILDING(66),

  /// Address (house number).
  ADDRESS_HOUSE(67),

  /// Address (flat number).
  ADDRESS_FLAT(68),

  /// Place of registration.
  PLACE_OF_REGISTRATION(69),

  /// Date of registration.
  DATE_OF_REGISTRATION(70),

  /// Resident from (date).
  RESIDENT_FROM(71),

  /// Resident until (date).
  RESIDENT_UNTIL(72),

  /// Issuing authority code (for the passport of the Russian Federation).
  AUTHORITY_CODE(73),

  /// Place of birth (area).
  PLACE_OF_BIRTH_AREA(74),

  /// Place of birth (state code).
  PLACE_OF_BIRTH_STATE_CODE(75),

  /// Address (street).
  ADDRESS_STREET(76),

  /// Address (city).
  ADDRESS_CITY(77),

  /// Address (jurisdiction code).
  ADDRESS_JURISDICTION_CODE(78),

  /// Address (postal code).
  ADDRESS_POSTAL_CODE(79),

  /// Check digit for document number.
  DOCUMENT_NUMBER_CHECK_DIGIT(80),

  /// Check digit for date of birth.
  DATE_OF_BIRTH_CHECK_DIGIT(81),

  /// Check digit for document expiry date.
  DATE_OF_EXPIRY_CHECK_DIGIT(82),

  /// Check digit for personal number.
  PERSONAL_NUMBER_CHECK_DIGIT(83),

  /// Final check digit (for the whole MRZ).
  FINAL_CHECK_DIGIT(84),

  /// Check digit for passport number (for visas).
  PASSPORT_NUMBER_CHECK_DIGIT(85),

  /// Check digit for invitation number (for visas).
  INVITATION_NUMBER_CHECK_DIGIT(86),

  /// Check digit for visa number.
  VISA_ID_CHECK_DIGIT(87),

  /// Check digit for surname and given name(s).
  SURNAME_AND_GIVEN_NAMES_CHECK_DIGIT(88),

  /// Check digit for visa expiry date.
  VISA_VALID_UNTIL_CHECK_DIGIT(89),

  /// Permit type.
  PERMIT_DL_CLASS(90),

  /// Permit expiry date.
  PERMIT_DATE_OF_EXPIRY(91),

  /// Permit identifier.
  PERMIT_IDENTIFIER(92),

  /// Permit issue date.
  PERMIT_DATE_OF_ISSUE(93),

  /// Driving permit restriction code.
  PERMIT_RESTRICTION_CODE(94),

  /// Driving permit endorsement code.
  PERMIT_ENDORSED(95),

  /// A line used for document validation in accordance with the database.
  ISSUE_TIMESTAMP(96),

  /// Number of duplicates.
  NUMBER_OF_DUPLICATES(97),

  /// Medical indicator/code.
  MEDICAL_INDICATOR_CODES(98),

  /// Indicator showing that the document holder is a non-resident.
  NON_RESIDENT_INDICATOR(99),

  /// Visa type.
  VISA_TYPE(100),

  /// The earliest date from which the visa is valid.
  VISA_VALID_FROM(101),

  /// The date until which the visa is valid.
  VISA_VALID_UNTIL(102),

  /// Duration of stay (in days) granted by the visa.
  DURATION_OF_STAY(103),

  /// Number of entries granted by the visa.
  NUMBER_OF_ENTRIES(104),

  /// Day in the date.
  DAY(105),

  /// Month in the date.
  MONTH(106),

  /// Year in the date.
  YEAR(107),

  /// Identification number.
  UNIQUE_CUSTOMER_IDENTIFIER(108),

  /// Commercial vehicle code.
  COMMERCIAL_VEHICLE_CODES(109),

  /// Also known as (date of birth).
  AKA_DATE_OF_BIRTH(110),

  /// Also known as (social security number).
  AKA_SOCIAL_SECURITY_NUMBER(111),

  /// Also known as (surname).
  AKA_SURNAME(112),

  /// Also known as (given names).
  AKA_GIVEN_NAMES(113),

  /// Also known as (suffix name).
  AKA_NAME_SUFFIX(114),

  /// Also known as (prefix name).
  AKA_NAME_PREFIX(115),

  /// Mailing address (street).
  MAILING_ADDRESS_STREET(116),

  /// Mailing address (city).
  MAILING_ADDRESS_CITY(117),

  /// Mailing address (jurisdiction code).
  MAILING_ADDRESS_JURISDICTION_CODE(118),

  /// Mailing address (postal code).
  MAILING_ADDRESS_POSTAL_CODE(119),

  /// A number which is used for driving licence validation.
  AUDIT_INFORMATION(120),

  /// Race/ethnicity.
  INVENTORY_NUMBER(121),

  /// Race/ethnicity.
  RACE_ETHNICITY(122),

  /// Jurisdiction vehicle class.
  JURISDICTION_VEHICLE_CLASS(123),

  /// Jurisdiction endorsement code.
  JURISDICTION_ENDORSEMENT_CODE(124),

  /// Jurisdiction restriction code.
  JURISDICTION_RESTRICTION_CODE(125),

  /// Surname and (or) given name(s) at birth.
  FAMILY_NAME(126),

  /// Given name(s) (Russian transcription).
  GIVEN_NAMES_RUS(127),

  /// Visa ID (Russian transcription).
  VISA_ID_RUS(128),

  /// Father’s name/patronymic.
  FATHERS_NAME(129),

  /// Father’s name/patronymic (Russian transcription).
  FATHERS_NAME_RUS(130),

  /// Surname and given name(s) (Russian transcription).
  SURNAME_AND_GIVEN_NAMES_RUS(131),

  /// Place of birth (Russian transcription).
  PLACE_OF_BIRTH_RUS(132),

  /// Document issuing authority (Russian transcription).
  AUTHORITY_RUS(133),

  /// Numeric issuing state code in compliance with ISO 3166-1 standard.
  ISSUING_STATE_CODE_NUMERIC(134),

  /// Numeric nationality code in compliance with ISO 3166-1 standard.
  NATIONALITY_CODE_NUMERIC(135),

  /// Engine power.
  ENGINE_POWER(136),

  /// Engine capacity.
  ENGINE_VOLUME(137),

  /// Chassis number.
  CHASSIS_NUMBER(138),

  /// Engine number.
  ENGINE_NUMBER(139),

  /// Engine model.
  ENGINE_MODEL(140),

  /// Vehicle category.
  VEHICLE_CATEGORY(141),

  /// Identity card number.
  IDENTITY_CARD_NUMBER(142),

  /// Control number.
  CONTROL_NO(143),

  /// Parents' given names.
  PARRENTS_GIVEN_NAMES(144),

  /// Second surname.
  SECOND_SURNAME(145),

  /// Second name.
  MIDDLE_NAME(146),

  /// Vehicle identification number.
  REG_CERT_VIN(147),

  /// Check digit for vehicle identification number.
  REG_CERT_VIN_CHECK_DIGIT(148),

  /// Checksum for vehicle identification number.
  REG_CERT_VIN_CHECKSUM(149),

  /// Check digit for the first MRZ line.
  LINE_1_CHECK_DIGIT(150),

  /// Check digit for the second MRZ line.
  LINE_2_CHECK_DIGIT(151),

  /// Check digit for the third MRZ line.
  LINE_3_CHECK_DIGIT(152),

  /// Checksum for the first MRZ line.
  LINE_1_CHECKSUM(153),

  /// Checksum for the second MRZ line.
  LINE_2_CHECKSUM(154),

  /// Checksum for the third MRZ line.
  LINE_3_CHECKSUM(155),

  /// Check digit for vehicle registration number.
  REG_CERT_REG_NUMBER_CHECK_DIGIT(156),

  /// Check sum for vehicle registration number.
  REG_CERT_REG_NUMBER_CHECKSUM(157),

  /// Vehicle code according to ITS (IntelligentTransportation Systems).
  REG_CERT_VEHICLE_ITS_CODE(158),

  /// Access number for RFID chip.
  CARD_ACCESS_NUMBER(159),

  /// Marital status.
  MARITAL_STATUS(160),

  /// Company name.
  COMPANY_NAME(161),

  /// Special notes.
  SPECIAL_NOTES(162),

  /// Surname of spouse.
  SURNAME_OF_SPOSE(163),

  /// Number for checking document status.
  TRACKING_NUMBER(164),

  /// Booklet number.
  BOOKLET_NUMBER(165),

  /// Children.
  CHILDREN(166),

  /// Copy number.
  COPY(167),

  /// Serial number.
  SERIAL_NUMBER(168),

  /// Dossier number.
  DOSSIER_NUMBER(169),

  /// Also known as (surname and given names).
  AKA_SURNAME_AND_GIVEN_NAMES(170),

  /// Territorial validity.
  TERRITORIAL_VALIDITY(171),

  /// MRZ with correct checksums.
  MRZ_STRINGS_WITH_CORRECT_CHECK_SUMS(172),

  /// Commercial driving license restriction code.
  DL_CDL_RESTRICTION_CODE(173),

  /// Date of 18th birthday.
  DL_UNDER_18_DATE(174),

  /// Date of record creation.
  DL_RECORD_CREATED(175),

  /// Date of duplicate creation.
  DL_DUPLICATE_DATE(176),

  /// Type of issued driving license.
  DL_ISS_TYPE(177),

  /// Military card number.
  MILITARY_BOOK_NUMBER(178),

  /// Destination.
  DESTINATION(179),

  /// Blood group.
  BLOOD_GROUP(180),

  /// Sequence number.
  SEQUENCE_NUMBER(181),

  /// Car body type.
  REG_CERT_BODY_TYPE(182),

  /// Car make.
  REG_CERT_CAR_MARK(183),

  /// Transaction number.
  TRANSACTION_NUMBER(184),

  /// Age.
  AGE(185),

  /// Folio number.
  FOLIO_NUMBER(186),

  /// Voter's identification number.
  VOTER_KEY(187),

  /// Address (municipality).
  ADDRESS_MUNICIPALITY(188),

  /// Address (location).
  ADDRESS_LOCATION(189),

  /// Section/sector.
  SECTION(190),

  /// OCR number.
  OCR_NUMBER(191),

  /// Federal elections.
  FEDERAL_ELECTIONS(192),

  /// Unique number.
  REFERENCE_NUMBER(193),

  /// Checksum for optional data.
  OPTIONAL_DATA_CHECKSUM(194),

  /// Check digit for optional data.
  OPTIONAL_DATA_CHECK_DIGIT(195),

  /// Visa number.
  VISA_NUMBER(196),

  /// Checksum for visa.
  VISA_NUMBER_CHECKSUM(197),

  /// Checkdigit for visa.
  VISA_NUMBER_CHECK_DIGIT(198),

  /// Voter.
  VOTER(199),

  /// Type/number of the previous document.
  PREVIOUS_TYPE(200),

  /// Reserved for internal use.
  FIELD_FROM_MRZ(220),

  /// Reserved for internal use.
  CURRENT_DATE(221),

  /// Status expiry date.
  STATUS_DATE_OF_EXPIRY(251),

  /// Banknote number.
  BANKNOTE_NUMBER(252),

  /// Customer Service Centre code.
  CSC_CODE(253),

  /// Pseudonym.
  ARTISTIC_NAME(254),

  /// Academic title.
  ACADEMIC_TITLE(255),

  /// Address (country).
  ADDRESS_COUNTRY(256),

  /// Address (zip code).
  ADDRESS_ZIPCODE(257),

  /// Data on permanent residence permit 1(eID field).
  E_ID_RESIDENCE_PERMIT_1(258),

  /// Data on permanent residence permit 2(eID field).
  E_ID_RESIDENCE_PERMIT_2(259),

  /// Place of birth: street (eID field).
  E_ID_PLACE_OF_BIRTH_STREET(260),

  /// Place of birth: city (eID field).
  E_ID_PLACE_OF_BIRTH_CITY(261),

  /// Place of birth: state (eID field).
  E_ID_PLACE_OF_BIRTH_STATE(262),

  /// Place of birth: country (eID field).
  E_ID_PLACE_OF_BIRTH_COUNTRY(263),

  /// Place of birth: zip code (eID field).
  E_ID_PLACE_OF_BIRTH_ZIPCODE(264),

  /// Commercial driving license class.
  CDL_CLASS(265),

  /// Date of 19th birthday.
  DL_UNDER_19_DATE(266),

  /// Weight (pounds).
  WEIGHT_POUNDS(267),

  /// Indicator of document limited duration.
  LIMITED_DURATION_DOCUMENT_INDICATOR(268),

  /// Endorsement expiry date.
  ENDORSEMENT_EXPIRATION_DATE(269),

  /// Date of revision.
  REVISION_DATE(270),

  /// Type of compliance.
  COMPLIANCE_TYPE(271),

  /// Family name truncation.
  FAMILY_NAME_TRUNCATION(272),

  /// First name truncation.
  FIRST_NAME_TRUNCATION(273),

  /// Middle name truncation.
  MIDDLE_NAME_TRUNCATION(274),

  /// Examination date.
  EXAM_DATE(275),

  /// Organization.
  ORGANIZATION(276),

  /// Department.
  DEPARTMENT(277),

  /// Pay grade.
  PAY_GRADE(278),

  /// Rank/status/title.
  RANK(279),

  /// Number that relates to benefit eligibility.
  BENEFITS_NUMBER(280),

  /// Sponsor's service.
  SPONSOR_SERVICE(281),

  /// Sponsor's status.
  SPONSOR_STATUS(282),

  /// Sponsor.
  SPONSOR(283),

  /// Relationship.
  RELATIONSHIP(284),

  /// Alien registration number issued by the U.S.
  /// Citizenship and Immigration Service.
  USCIS(285),

  /// Category.
  CATEGORY(286),

  /// Conditions.
  CONDITIONS(287),

  /// Identifier.
  IDENTIFIER(288),

  /// Configuration.
  CONFIGURATION(289),

  /// Discretionary data.
  DISCRETIONARY_DATA(290),

  /// Optional data from MRZ Line 1.
  LINE_1_OPTIONAL_DATA(291),

  /// Optional data from MRZ Line 2.
  LINE_2_OPTIONAL_DATA(292),

  /// Optional data from MRZ Line 3.
  LINE_3_OPTIONAL_DATA(293),

  /// Equivalence value (security code).
  EQV_CODE(294),

  /// ALT сode.
  ALT_CODE(295),

  /// Binary сode.
  BINARY_CODE(296),

  /// Pseudo-code.
  PSEUDO_CODE(297),

  /// Fee.
  FEE(298),

  /// Stamp number.
  STAMP_NUMBER(299),

  /// Parameters of biometric data protection.
  SBH_SECURITYOPTIONS(300),

  /// Parameters of biometric data integrity.
  SBH_INTEGRITYOPTIONS(301),

  /// Date of creation of biometric data record.
  DATE_OF_CREATION(302),

  /// Term of validity of biometric data record.
  VALIDITY_PERIOD(303),

  /// Version of header of biometric data format owner.
  PATRON_HEADER_VERSION(304),

  /// Type of biometric data record.
  BDB_TYPE(305),

  /// Type of biometric data.
  BIOMETRIC_TYPE(306),

  /// Subtype of biometric data.
  BIOMETRIC_SUBTYPE(307),

  /// Identifier of biometric data.
  BIOMETRIC_PRODUCTID(308),

  /// Identifier of biometric data format owner.
  BIOMETRIC_FORMAT_OWNER(309),

  /// Biometric data format.
  BIOMETRIC_FORMAT_TYPE(310),

  /// DO's phone number.
  PHONE(311),

  /// DO's profession.
  PROFESSION(312),

  /// DO's title.
  TITLE(313),

  /// DO's personal summary data.
  PERSONAL_SUMMARY(314),

  /// Other valid identifier.
  OTHER_VALID_ID(315),

  /// Custody information.
  CUSTODY_INFO(316),

  /// Other name.
  OTHER_NAME(317),

  /// Observations.
  OBSERVATIONS(318),

  /// Tax information.
  TAX(319),

  /// Date of document personalization.
  DATE_OF_PERSONALIZATION(320),

  /// Serial number of personalization.
  PERSONALIZATION_SN(321),

  /// Other person's name.
  OTHERPERSON_NAME(322),

  /// Date of record entry on persons to notify in case of emergency.
  PERSONTONOTIFY_DATE_OF_RECORD(323),

  /// Name of person to notify in case of emergency.
  PERSONTONOTIFY_NAME(324),

  /// Phone number of person to notify in case of emergency.
  PERSONTONOTIFY_PHONE(325),

  /// Address of person to notify in case of emergency.
  PERSONTONOTIFY_ADDRESS(326),

  /// Textual information about the DS-certificate issuer.
  DS_CERTIFICATE_ISSUER(327),

  /// Textual information about the document issuer.
  DS_CERTIFICATE_SUBJECT(328),

  /// Start date of the DS-certificate validity.
  DS_CERTIFICATE_VALIDFROM(329),

  /// Expiration date of the DS-certificate.
  DS_CERTIFICATE_VALIDTO(330),

  /// Vehicle category/restrictions/conditions from
  /// DG1 data group of eDL application.
  VRC_DATAOBJECT_ENTRY(331),

  /// Type approval number.
  TYPE_APPROVAL_NUMBER(332),

  /// Administrative number.
  ADMINISTRATIVE_NUMBER(333),

  /// Document discriminator.
  DOCUMENT_DISCRIMINATOR(334),

  /// Data discriminator.
  DATA_DISCRIMINATOR(335),

  /// ISO issuer ID number.
  ISO_ISSUER_ID_NUMBER(336),

  /// Registration number issued by GardaNational Immigration Bureau.
  GNIB_NUMBER(340),

  /// Department number.
  DEPT_NUMBER(341),

  /// Telegraph code.
  TELEX_CODE(342),

  /// Allergies.
  ALLERGIES(343),

  /// Sp. code.
  SP_CODE(344),

  /// Code of restriction imposed by court.
  COURT_CODE(345),

  /// County code.
  CTY(346),

  /// Sponsor's social security number.
  SPONSOR_SSN(347),

  /// Department of Defense identification number.
  DO_D_NUMBER(348),

  /// Expiry date of Motorcycle status.
  MC_NOVICE_DATE(349),

  /// DUF Number (a number that is assigned to everyone who applies
  /// for residence inNorway).
  DUF_NUMBER(350),

  /// Code of Philippine Land TransportationOffice Agency.
  AGY(351),

  /// Passenger name record (reservation code).
  PNR_CODE(352),

  /// Code of the airport of departure.
  FROM_AIRPORT_CODE(353),

  /// Code of the airport of arrival.
  TO_AIRPORT_CODE(354),

  /// Flight number.
  FLIGHT_NUMBER(355),

  /// Date of flight.
  DATE_OF_FLIGHT(356),

  /// Seat number.
  SEAT_NUMBER(357),

  /// Date of boarding pass issue.
  DATE_OF_ISSUE_BOARDING_PASS(358),

  /// Expiration date of Concealed CarryWeapon Permit.
  CCW_UNTIL(359),

  /// Checksum for reference number.
  REFERENCE_NUMBER_CHECKSUM(360),

  /// Check digit for reference number.
  REFERENCE_NUMBER_CHECK_DIGIT(361),

  /// Room number.
  ROOM_NUMBER(362),

  /// Religion.
  RELIGION(363),

  /// Months to expire.
  REMAINDER_TERM(364),

  /// Electronic ticket indicator.
  ELECTRONIC_TICKET_INDICATOR(365),

  /// Compartment сode.
  COMPARTMENT_CODE(366),

  /// Check-in sequence number on a boarding pass.
  CHECK_IN_SEQUENCE_NUMBER(367),

  /// Code of the airline which issued the boarding pass.
  AIRLINE_DESIGNATOR_OF_BOARDING_PASS_ISSUER(368),

  /// Numeric airline code.
  AIRLINE_NUMERIC_CODE(369),

  /// Ticket number.
  TICKET_NUMBER(370),

  /// Frequent flyer indicator.
  FREQUENT_FLYER_AIRLINE_DESIGNATOR(371),

  /// Frequent flyer number.
  FREQUENT_FLYER_NUMBER(372),

  /// Free baggage allowance.
  FREE_BAGGAGE_ALLOWANCE(373),

  /// Codec for PDF417.
  PDF_417_CODEC(374),

  /// Checksum for identity card number.
  IDENTITY_CARD_NUMBER_CHECKSUM(375),

  /// Check digit for identity card number.
  IDENTITY_CARD_NUMBER_CHECK_DIGIT(376),

  /// Veteran.
  VETERAN(377),

  /// DL class code A1 valid from.
  DL_CLASS_CODE_A_1_FROM(378),

  /// DL class code A1 valid to.
  DL_CLASS_CODE_A_1_TO(379),

  /// DL class code A1 valid notes.
  DL_CLASS_CODE_A_1_NOTES(380),

  /// DL class code A1 valid from.
  DL_CLASS_CODE_A_FROM(381),

  /// DL class code A1 valid to.
  DL_CLASS_CODE_A_TO(382),

  /// DL class code A1 valid notes.
  DL_CLASS_CODE_A_NOTES(383),

  /// DL class code B valid from.
  DL_CLASS_CODE_B_FROM(384),

  /// DL class code B valid to.
  DL_CLASS_CODE_B_TO(385),

  /// DL class code B valid notes.
  DL_CLASS_CODE_B_NOTES(386),

  /// DL class code C1 valid from.
  DL_CLASS_CODE_C_1_FROM(387),

  /// DL class code C1 valid to.
  DL_CLASS_CODE_C_1_TO(388),

  /// DL class code C1 valid notes.
  DL_CLASS_CODE_C_1_NOTES(389),

  /// DL class code C valid from.
  DL_CLASS_CODE_C_FROM(390),

  /// DL class code C valid to.
  DL_CLASS_CODE_C_TO(391),

  /// DL class code C valid notes.
  DL_CLASS_CODE_C_NOTES(392),

  /// DL class code D1 valid from.
  DL_CLASS_CODE_D_1_FROM(393),

  /// DL class code D1 valid to.
  DL_CLASS_CODE_D_1_TO(394),

  /// DL class code D1 valid notes.
  DL_CLASS_CODE_D_1_NOTES(395),

  /// DL class code D valid from.
  DL_CLASS_CODE_D_FROM(396),

  /// DL class code D valid to.
  DL_CLASS_CODE_D_TO(397),

  /// DL class code D valid notes.
  DL_CLASS_CODE_D_NOTES(398),

  /// DL class code BE valid from.
  DL_CLASS_CODE_BE_FROM(399),

  /// DL class code BE valid to.
  DL_CLASS_CODE_BE_TO(400),

  /// DL class code BE valid notes.
  DL_CLASS_CODE_BE_NOTES(401),

  /// DL class code C1E valid from.
  DL_CLASS_CODE_C_1_E_FROM(402),

  /// DL class code C1E valid to.
  DL_CLASS_CODE_C_1_E_TO(403),

  /// DL class code C1E valid notes.
  DL_CLASS_CODE_C_1_E_NOTES(404),

  /// DL class code CE valid from.
  DL_CLASS_CODE_CE_FROM(405),

  /// DL class code CE valid to.
  DL_CLASS_CODE_CE_TO(406),

  /// DL class code CE valid notes.
  DL_CLASS_CODE_CE_NOTES(407),

  /// DL class code D1E valid from.
  DL_CLASS_CODE_D_1_E_FROM(408),

  /// DL class code D1E valid to.
  DL_CLASS_CODE_D_1_E_TO(409),

  /// DL class code D1E valid notes.
  DL_CLASS_CODE_D_1_E_NOTES(410),

  /// DL class code DE valid from.
  DL_CLASS_CODE_DE_FROM(411),

  /// DL class code DE valid to.
  DL_CLASS_CODE_DE_TO(412),

  /// DL class code DE valid notes.
  DL_CLASS_CODE_DE_NOTES(413),

  /// DL class code M valid from.
  DL_CLASS_CODE_M_FROM(414),

  /// DL class code M valid to.
  DL_CLASS_CODE_M_TO(415),

  /// DL class code M valid notes.
  DL_CLASS_CODE_M_NOTES(416),

  /// DL class code L valid from.
  DL_CLASS_CODE_L_FROM(417),

  /// DL class code L valid to.
  DL_CLASS_CODE_L_TO(418),

  /// DL class code L valid notes.
  DL_CLASS_CODE_L_NOTES(419),

  /// DL class code T valid from.
  DL_CLASS_CODE_T_FROM(420),

  /// DL class code T valid to.
  DL_CLASS_CODE_T_TO(421),

  /// DL class code T valid notes.
  DL_CLASS_CODE_T_NOTES(422),

  /// DL class code AM valid from.
  DL_CLASS_CODE_AM_FROM(423),

  /// DL class code AM valid to.
  DL_CLASS_CODE_AM_TO(424),

  /// DL class code AM valid notes.
  DL_CLASS_CODE_AM_NOTES(425),

  /// DL class code A2 valid from.
  DL_CLASS_CODE_A_2_FROM(426),

  /// DL class code A2 valid to.
  DL_CLASS_CODE_A_2_TO(427),

  /// DL class code A2 valid notes.
  DL_CLASS_CODE_A_2_NOTES(428),

  /// DL class code B1 valid from.
  DL_CLASS_CODE_B_1_FROM(429),

  /// DL class code B1 valid to.
  DL_CLASS_CODE_B_1_TO(430),

  /// DL class code B1 valid notes.
  DL_CLASS_CODE_B_1_NOTES(431),

  /// Surname at birth.
  SURNAME_AT_BIRTH(432),

  /// Civil status.
  CIVIL_STATUS(433),

  /// Number of seats.
  NUMBER_OF_SEATS(434),

  /// Number of standing places.
  NUMBER_OF_STANDING_PLACES(435),

  /// Maximum speed.
  MAX_SPEED(436),

  /// Fuel type.
  FUEL_TYPE(437),

  /// Vehicle environmental type.
  EC_ENVIRONMENTAL_TYPE(438),

  /// Power–to–weight ratio.
  POWER_WEIGHT_RATIO(439),

  /// Maximum weight of the trailer without brakes.
  MAX_MASS_OF_TRAILER_BRAKED(440),

  /// Maximum weight of the trailer without brakes.
  MAX_MASS_OF_TRAILER_UNBRAKED(441),

  /// Transmission type.
  TRANSMISSION_TYPE(442),

  /// Trailer hitch.
  TRAILER_HITCH(443),

  /// Accompanying person.
  ACCOMPANIED_BY(444),

  /// Police district.
  POLICE_DISTRICT(445),

  /// Date of first issue.
  FIRST_ISSUE_DATE(446),

  /// Payload capacity.
  PAYLOAD_CAPACITY(447),

  /// Number of axels.
  NUMBER_OF_AXELS(448),

  /// Permissible axle load.
  PERMISSIBLE_AXLE_LOAD(449),

  /// Precinct.
  PRECINCT(450),

  /// Invited by.
  INVITED_BY(451),

  /// Purpose of entry.
  PURPOSE_OF_ENTRY(452),

  /// Skin color.
  SKIN_COLOR(453),

  /// Complexion.
  COMPLEXION(454),

  /// Airport of departure.
  AIRPORT_FROM(455),

  /// Airport of arrival.
  AIRPORT_TO(456),

  /// Airline name.
  AIRLINE_NAME(457),

  /// A loyalty program offered by the airline to its customers who fly frequently.
  AIRLINE_NAME_FREQUENT_FLYER(458),

  /// Licenсe number.
  LICENSE_NUMBER(459),

  /// In tanks.
  IN_TANKS(460),

  /// Except in tanks.
  EXEPT_IN_TANKS(461),

  /// Passenger using the Fast Track service in the airport.
  FAST_TRACK(462),

  /// Owner.
  OWNER(463),

  /// MRZ strings from ICAO RFID.
  MRZ_STRINGS_ICAO_RFID(464),

  /// The number of times a card with this number has been issued.
  NUMBER_OF_CARD_ISSUANCE(465),

  /// Number of card issuance checksum.
  NUMBER_OF_CARD_ISSUANCE_CHECKSUM(466),

  /// Number of card issuance check digit.
  NUMBER_OF_CARD_ISSUANCE_CHECK_DIGIT(467),

  /// Century of birth.
  CENTURY_DATE_OF_BIRTH(468),

  /// DL class code A3 valid from.
  DL_CLASSCODE_A3_FROM(469),

  /// DL class code A3 valid to.
  DL_CLASSCODE_A3_TO(470),

  /// DL class code A3 valid notes.
  DL_CLASSCODE_A3_NOTES(471),

  /// DL class code C2 valid from.
  DL_CLASSCODE_C2_FROM(472),

  /// DL class code C2 valid to.
  DL_CLASSCODE_C2_TO(473),

  /// DL class code C2 valid notes.
  DL_CLASSCODE_C2_NOTES(474),

  /// DL class code B2 valid from.
  DL_CLASSCODE_B2_FROM(475),

  /// DL class code B2 valid to.
  DL_CLASSCODE_B2_TO(476),

  /// DL class code B2 valid notes.
  DL_CLASSCODE_B2_NOTES(477),

  /// DL class code D2 valid from.
  DL_CLASSCODE_D2_FROM(478),

  /// DL class code B2 valid to.
  DL_CLASSCODE_D2_TO(479),

  /// DL class code B2 valid notes.
  DL_CLASSCODE_D2_NOTES(480),

  /// DL class code B2E valid from.
  DL_CLASSCODE_B2E_FROM(481),

  /// DL class code B2E valid to.
  DL_CLASSCODE_B2E_TO(482),

  /// DL class code B2E valid notes.
  DL_CLASSCODE_B2E_NOTES(483),

  /// DL class code G valid from.
  DL_CLASSCODE_G_FROM(484),

  /// DL class code G valid to.
  DL_CLASSCODE_G_TO(485),

  /// DL class code G valid notes.
  DL_CLASSCODE_G_NOTES(486),

  /// DL class code J valid from.
  DL_CLASSCODE_J_FROM(487),

  /// DL class code J valid to.
  DL_CLASSCODE_J_TO(488),

  /// DL class code J valid notes.
  DL_CLASSCODE_J_NOTES(489),

  /// DL class code LC valid from.
  DL_CLASSCODE_LC_FROM(490),

  /// DL class code LC valid to.
  DL_CLASSCODE_LC_TO(491),

  /// DL class code LC valid notes.
  DLC_LASSCODE_LC_NOTES(492),

  /// Bank card number.
  BANKCARDNUMBER(493),

  /// Bank card validity.
  BANKCARDVALIDTHRU(494),

  /// Tax number.
  TAX_NUMBER(495),

  /// Health insurance number.
  HEALTH_NUMBER(496),

  /// Grandfather's name.
  GRANDFATHERNAME(497),

  /// Selectee indicator.
  SELECTEE_INDICATOR(498),

  /// Mother's surname.
  MOTHER_SURNAME(499),

  /// Mother's given name.
  MOTHER_GIVENNAME(500),

  /// Father's surname.
  FATHER_SURNAME(501),

  /// Father's given name.
  FATHER_GIVENNAME(502),

  /// Mother's date of birth.
  MOTHER_DATEOFBIRTH(503),

  /// Father's date of birth.
  FATHER_DATEOFBIRTH(504),

  /// Mother's personal number.
  MOTHER_PERSONALNUMBER(505),

  /// Father's personal number.
  FATHER_PERSONALNUMBER(506),

  /// Mother's place of birth.
  MOTHER_PLACEOFBIRTH(507),

  /// Father's place of birth.
  FATHER_PLACEOFBIRTH(508),

  /// Mother's country of birth.
  MOTHER_COUNTRYOFBIRTH(509),

  /// Father's country of birth.
  FATHER_COUNTRYOFBIRTH(510),

  /// Date of first renewal.
  DATE_FIRST_RENEWAL(511),

  /// Date of second renewal.
  DATE_SECOND_RENEWAL(512),

  /// Place of examination.
  PLACE_OF_EXAMINATION(513),

  /// Application number.
  APPLICATION_NUMBER(514),

  /// Voucher number.
  VOUCHER_NUMBER(515),

  /// Authorization number.
  AUTHORIZATION_NUMBER(516),

  /// Faculty.
  FACULTY(517),

  /// Form of education.
  FORM_OF_EDUCATION(518),

  /// DNI number.
  DNI_NUMBER(519),

  /// Retirement number.
  RETIREMENT_NUMBER(520),

  /// Professional Id number.
  PROFESSIONAL_ID_NUMBER(521),

  /// Age at issue.
  AGE_AT_ISSUE(522),

  /// Years since issue.
  YEARS_SINCE_ISSUE(523),

  /// DL class code BTP valid from.
  DLCLASSCODE_BTP_FROM(524),

  /// DL class code BTP valid notes.
  DLCLASSCODE_BTP_NOTES(525),

  /// DL class code BTP valid to.
  DLCLASSCODE_BTP_TO(526),

  /// DL class code C3 valid from.
  DLCLASSCODE_C3_FROM(527),

  /// DL class code C3 valid notes.
  DLCLASSCODE_C3_NOTES(528),

  /// DL class code C3 valid to.
  DLCLASSCODE_C3_TO(529),

  /// DL class code E valid from.
  DLCLASSCODE_E_FROM(530),

  /// DL class code E valid notes.
  DLCLASSCODE_E_NOTES(531),

  /// DL class code E valid to.
  DLCLASSCODE_E_TO(532),

  /// DL class code F valid from.
  DLCLASSCODE_F_FROM(533),

  /// DL class code F valid notes.
  DLCLASSCODE_F_NOTES(534),

  /// DL class code F valid to.
  DLCLASSCODE_F_TO(535),

  /// DL class code FA valid from.
  DLCLASSCODE_FA_FROM(536),

  /// DL class code FA valid notes.
  DLCLASSCODE_FA_NOTES(537),

  /// DL class code FA valid to.
  DLCLASSCODE_FA_TO(538),

  /// DL class code FA1 valid from.
  DLCLASSCODE_FA1_FROM(539),

  /// DL class code FA1 valid notes.
  DLCLASSCODE_FA1_NOTES(540),

  /// DL class code FA1 valid to.
  DLCLASSCODE_FA1_TO(541),

  /// DL class code FB valid from.
  DLCLASSCODE_FB_FROM(542),

  /// DL class code FB valid notes.
  DLCLASSCODE_FB_NOTES(543),

  /// DL class code FB valid to.
  DLCLASSCODE_FB_TO(544),

  /// DL class code G1 valid from.
  DLCLASSCODE_G1_FROM(545),

  /// DL class code G1 valid notes.
  DLCLASSCODE_G1_NOTES(546),

  /// DL class code G1 valid to.
  DLCLASSCODE_G1_TO(547),

  /// DL class code H valid from.
  DLCLASSCODE_H_FROM(548),

  /// DL class code H valid notes.
  DLCLASSCODE_H_NOTES(549),

  /// DL class code H valid to.
  DLCLASSCODE_H_TO(550),

  /// DL class code I valid from.
  DLCLASSCODE_I_FROM(551),

  /// DL class code I valid notes.
  DLCLASSCODE_I_NOTES(552),

  /// DL class code I valid to.
  DLCLASSCODE_I_TO(553),

  /// DL class code K valid from.
  DLCLASSCODE_K_FROM(554),

  /// DL class code K valid notes.
  DLCLASSCODE_K_NOTES(555),

  /// DL class code K valid to.
  DLCLASSCODE_K_TO(556),

  /// DL class code LK valid from.
  DLCLASSCODE_LK_FROM(557),

  /// DL class code LK valid notes.
  DLCLASSCODE_LK_NOTES(558),

  /// DL class code LK valid to.
  DLCLASSCODE_LK_TO(559),

  /// DL class code N valid from.
  DLCLASSCODE_N_FROM(560),

  /// DL class code N valid notes.
  DLCLASSCODE_N_NOTES(561),

  /// DL class code N valid to.
  DLCLASSCODE_N_TO(562),

  /// DL class code S valid from.
  DLCLASSCODE_S_FROM(563),

  /// DL class code S valid notes.
  DLCLASSCODE_S_NOTES(564),

  /// DL class code S valid to.
  DLCLASSCODE_S_TO(565),

  /// DL class code TB valid from.
  DLCLASSCODE_TB_FROM(566),

  /// DL class code TB valid notes.
  DLCLASSCODE_TB_NOTES(567),

  /// DL class code TB valid to.
  DLCLASSCODE_TB_TO(568),

  /// DL class code TM valid from.
  DLCLASSCODE_TM_FROM(569),

  /// DL class code TM valid notes.
  DLCLASSCODE_TM_NOTES(570),

  /// DL class code TM valid to.
  DLCLASSCODE_TM_TO(571),

  /// DL class code TR valid from.
  DLCLASSCODE_TR_FROM(572),

  /// DL class code TR valid notes.
  DLCLASSCODE_TR_NOTES(573),

  /// DL class code TR valid to.
  DLCLASSCODE_TR_TO(574),

  /// DL class code TV valid from.
  DLCLASSCODE_TV_FROM(575),

  /// DL class code TV valid notes.
  DLCLASSCODE_TV_NOTES(576),

  /// DL class code TV valid to.
  DLCLASSCODE_TV_TO(577),

  /// DL class code V valid from.
  DLCLASSCODE_V_FROM(578),

  /// DL class code V valid notes.
  DLCLASSCODE_V_NOTES(579),

  /// DL class code V valid to.
  DLCLASSCODE_V_TO(580),

  /// DL class code W valid from.
  DLCLASSCODE_W_FROM(581),

  /// DL class code W valid notes.
  DLCLASSCODE_W_NOTES(582),

  /// DL class code W valid to.
  DLCLASSCODE_W_TO(583),

  /// Uniform Resource Locator.
  URL(584),

  /// Caliber.
  CALIBER(585),

  /// Model.
  MODEL(586),

  /// Make.
  MAKE(587),

  /// Number of cylinders.
  NUMBER_OF_CYLINDERS(588),

  /// Surname of husband after registration.
  SURNAME_OF_HUSBAND_AFTER_REGISTRATION(589),

  /// Surname of wife after registration.
  SURNAME_OF_WIFE_AFTER_REGISTRATION(590),

  /// Wife's date of birth.
  DATE_OF_BIRTH_OF_WIFE(591),

  /// Husband's date of birth.
  DATE_OF_BIRTH_OF_HUSBAND(592),

  /// Citizenship of the first person.
  CITIZENSHIP_OF_FIRST_PERSON(593),

  /// Citizenship of the second person.
  CITIZENSHIP_OF_SECOND_PERSON(594),

  /// Card Security Code.
  CVV(595),

  /// Date of insurance expiry.
  DATE_OF_INSURANCE_EXPIRY(596),

  /// Mortgage by.
  MORTGAGE_BY(597),

  /// Old document number.
  OLD_DOCUMENT_NUMBER(598),

  /// Old date of issue.
  OLD_DATE_OF_ISSUE(599),

  /// Old place of issue.
  OLD_PLACE_OF_ISSUE(600),

  /// DL category LR valid from.
  DLCLASSCODE_LR_FROM(601),

  /// DL category LR valid to.
  DLCLASSCODE_LR_TO(602),

  /// DL category LR valid notes.
  DLCLASSCODE_LR_NOTES(603),

  /// DL category MR valid from.
  DLCLASSCODE_MR_FROM(604),

  /// DL category MR valid to.
  DLCLASSCODE_MR_TO(605),

  /// DL category MR valid notes.
  DLCLASSCODE_MR_NOTES(606),

  /// DL category HR valid from.
  DLCLASSCODE_HR_FROM(607),

  /// DL category HR valid to.
  DLCLASSCODE_HR_TO(608),

  /// DL category HR valid notes.
  DLCLASSCODE_HR_NOTES(609),

  /// DL category HC valid from.
  DLCLASSCODE_HC_FROM(610),

  /// DL category HC valid to.
  DLCLASSCODE_HC_TO(611),

  /// DL category HC valid notes.
  DLCLASSCODE_HC_NOTES(612),

  /// DL category MC valid from.
  DLCLASSCODE_MC_FROM(613),

  /// DL category MC valid to.
  DLCLASSCODE_MC_TO(614),

  /// DL category MC valid notes.
  DLCLASSCODE_MC_NOTES(615),

  /// DL category RE valid from.
  DLCLASSCODE_RE_FROM(616),

  /// DL category RE valid to.
  DLCLASSCODE_RE_TO(617),

  /// DL category RE valid notes.
  DLCLASSCODE_RE_NOTES(618),

  /// DL category R valid from.
  DLCLASSCODE_R_FROM(619),

  /// DL category R valid to.
  DLCLASSCODE_R_TO(620),

  /// DL category R valid notes.
  DLCLASSCODE_R_NOTES(621),

  /// DL category CA valid from.
  DLCLASSCODE_CA_FROM(622),

  /// DL category CA valid to.
  DLCLASSCODE_CA_TO(623),

  /// DL category CA valid notes.
  DLCLASSCODE_CA_NOTES(624),

  /// Citizenship status.
  CITIZENSHIP_STATUS(625),

  /// Start date of military service.
  MILITARY_SERVICE_FROM(626),

  /// End date of military service.
  MILITARY_SERVICE_TO(627),

  /// DL category NT valid notes.
  DLCLASSCODE_NT_FROM(628),

  /// DL category NT valid to.
  DLCLASSCODE_NT_TO(629),

  /// DL category NT valid notes.
  DLCLASSCODE_NT_NOTES(630),

  /// DL category TN valid from.
  DLCLASSCODE_TN_FROM(631),

  /// DL category TN valid to.
  DLCLASSCODE_TN_TO(632),

  /// DL category TN valid notes.
  DLCLASSCODE_TN_NOTES(633),

  /// DL category D3 valid from.
  DLCLASSCODE_D3_FROM(634),

  /// DL category D3 valid to.
  DLCLASSCODE_D3_TO(635),

  /// DL category D3 valid notes.
  DLCLASSCODE_D3_NOTES(636),

  /// Alternative date of expiry.
  ALT_DATE_OF_EXPIRY(637),

  /// DL category CD valid from.
  DLCLASSCODE_CD_FROM(638),

  /// DL category CD valid to.
  DLCLASSCODE_CD_TO(639),

  /// DL category CD valid notes.
  DLCLASSCODE_CD_NOTES(640),

  /// End date of payment period.
  PAYMENT_PERIOD_TO(643),

  /// Start date of payment period.
  PAYMENT_PERIOD_FROM(642),

  /// Issuer identification number (IIN).
  ISSUER_IDENTIFICATION_NUMBER(641),

  /// Vaccination certificate identifier.
  VACCINATION_CERTIFICATE_IDENTIFIER(644),

  /// First name.
  FIRST_NAME(645),

  /// Date of arrival.
  DATE_OF_ARRIVAL(646),

  /// Second name.
  SECOND_NAME(647),

  /// Third name.
  THIRD_NAME(648),

  /// Fourth name.
  FOURTH_NAME(649),

  /// Last name.
  LAST_NAME(650),

  /// DL class code RM valid from.
  DLCLASSCODE_RM_FROM(651),

  /// DL class code RM notes.
  DLCLASSCODE_RM_NOTES(652),

  /// DL class code RM valid to.
  DLCLASSCODE_RM_TO(653),

  /// DL class code PW valid from.
  DLCLASSCODE_PW_FROM(654),

  /// DL class code PW notes.
  DLCLASSCODE_PW_NOTES(655),

  /// DL class code PW valid to.
  DLCLASSCODE_PW_TO(656),

  DLCLASSCODE_EB_FROM(657),

  DLCLASSCODE_EB_NOTES(658),

  DLCLASSCODE_EB_TO(659),

  DLCLASSCODE_EC_FROM(660),

  DLCLASSCODE_EC_NOTES(661),

  DLCLASSCODE_EC_TO(662),

  DLCLASSCODE_EC1_FROM(663),

  DLCLASSCODE_EC1_NOTES(664),

  DLCLASSCODE_EC1_TO(665),

  PLACE_OF_BIRTH_CITY(666),

  YEAR_OF_BIRTH(667),

  YEAR_OF_EXPIRY(668),

  GRANDFATHER_NAME_MATERNAL(669),

  FIRST_SURNAME(670),

  MONTH_OF_BIRTH(671),

  ADDRESS_FLOOR_NUMBER(672),

  ADDRESS_ENTRANCE(673),

  ADDRESS_BLOCK_NUMBER(674),

  ADDRESS_STREET_NUMBER(675),

  ADDRESS_STREET_TYPE(676),

  ADDRESS_CITY_SECTOR(677),

  ADDRESS_COUNTY_TYPE(678),

  ADDRESS_CITY_TYPE(679),

  ADDRESS_BUILDING_TYPE(680),

  /// Date of retirement.
  DATE_OF_RETIREMENT(681),

  /// Document status.
  DOCUMENT_STATUS(682);

  const FieldType(this.value);
  final int value;

  Future<String> getTranslation() async {
    return await _bridge
        .invokeMethod("getTranslation", [runtimeType.toString(), value]);
  }

  static FieldType? getByValue(int? i) {
    if (i == null) return null;
    try {
      return FieldType.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return FieldType.UNKNOWN;
    }
  }

  static List<FieldType>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<FieldType> list = [];
    for (int item in input) list.addSafe(getByValue(item));
    return list;
  }
}
