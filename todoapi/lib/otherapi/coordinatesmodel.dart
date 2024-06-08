class CoordinatesModel {
  double? lat;
  double? lng;
  CoordinatesModel({required this.lat, required this.lng});
  factory CoordinatesModel.fromJson(Map<String, dynamic> api){
    return CoordinatesModel(lat: api['lat'], lng: api['lng']);
  }

}