class BrandsModel{


  String? id;
  String? name;

  BrandsModel({required this.name, required this.id});

  factory BrandsModel.fromJson(Map<String,dynamic> api){
    return BrandsModel(
        name: api['name'],
        id: api['id']);
  }

}