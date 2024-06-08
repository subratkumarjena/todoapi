import 'package:todoapi/otherapi/bankmodel.dart';
import 'package:todoapi/otherapi/companymodel.dart';
import 'package:todoapi/otherapi/cryptomodel.dart';
import 'package:todoapi/otherapi/hairmodel.dart';
import 'package:todoapi/otherapi/useradressmodel.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  HairModel? hair;
  String? domain;
  String? ip;
  UserAdressModel? address;
  String? macAddress;
  String? university;
  Bankmodel? bank;
  CompanyModel? company;
  String? ein;
  String? ssn;
  String? userAgent;
  CryptoModel? crypto;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required  this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required  this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required  this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto});

  factory UserModel.fromJson( Map<String,dynamic> api){
    return UserModel(
        id: api['id'],
        firstName: api['firstName'],
        lastName: api['lastName'],
        maidenName: api['maidenName'],
        age: api['age'],
        gender: api['gender'],
        email: api['email'],
        phone: api['phone'],
        username: api['username'],
        password: api['password'],
        birthDate: api['birthDate'],
        image:api ['image'],
        bloodGroup: api['bloodGroup'],
        height: api['height'],
        weight: api['weight'] ,
        //weight: (api['weight'] as num?)?.toDouble(),
        eyeColor: api['eyeColor'],
        hair: HairModel.formJson(api['hair']),
        domain: api['domain'],
        ip: api['ip'],
        address: UserAdressModel.fromJson(api['address']),
        macAddress: api['macAddress'],
        university: api['university'],
        bank: Bankmodel.fromJson(api['bank']),
        company: CompanyModel.fromJson(api['company']),
        ein: api['ein'],
        ssn: api['ssn'],
        userAgent: api['userAgent'],
        crypto: CryptoModel.fromJson(api['crypto']));
  }
}