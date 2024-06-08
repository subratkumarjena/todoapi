class SubBrandsModel{

  String? id;
  String? name;

  SubBrandsModel({required this.name, required this.id});

  factory SubBrandsModel.fromJson(Map<String,dynamic> api){

    return SubBrandsModel(
        name: api['name'],
        id: api['id']);
  }




}