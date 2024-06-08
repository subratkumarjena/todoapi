class SubCategoriesModel{
  String? id;
  String? name;

  SubCategoriesModel({required this.name, required this.id});

  factory SubCategoriesModel.fromJson(Map<String,dynamic> api){
    return SubCategoriesModel(
        name: api['name'],
        id: api['id']);
  }

}