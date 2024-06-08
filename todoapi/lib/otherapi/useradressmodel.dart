import 'package:todoapi/otherapi/usercoordinatesmodel.dart';

class UserAdressModel {
  UserCoordinatesModel? coordinates;
  String? address;
  String? city;
  String? postalCode;
  String ? state;

  UserAdressModel({ required this.address, required this.state, required this.postalCode, required this.coordinates, required this.city});

  factory UserAdressModel.fromJson(Map<String,dynamic>api){
    return UserAdressModel(
        address: api['address'],
        state: api['state'],
        postalCode: api['postalCode'],
        coordinates: UserCoordinatesModel.fromJson(api['coordinates']),
        city: api['city']);
  }

}