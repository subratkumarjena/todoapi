 class UserCoordinatesModel{
  double? lat;
  double? lng;

  UserCoordinatesModel({required this.lng , required this.lat});
  factory UserCoordinatesModel.fromJson(Map<String,dynamic> api){
    return UserCoordinatesModel(lng: api['lng'], lat:api ['lat']);
  }

 }