

import 'package:todoapi/otherapi/coordinatesmodel.dart';

class AddressModel{
  String? address;
  String? city;
  String? postalCode;
  String? state;
  CoordinatesModel? coordinates;

  AddressModel({required this.address, required this.city, required this.coordinates,
    required this.postalCode, required this.state});

  factory AddressModel.fromJson(Map<String,dynamic> api){
    return AddressModel(
        address: api['address'],
        city: api['city'],
        coordinates: CoordinatesModel.fromJson(api['coordinates']),
        postalCode: api['postalCode'],
        state: api['state']);
  }

}