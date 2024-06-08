class CategoriesModel{
  String? id;
  String? name;

  CategoriesModel({required this.name, required this.id});

  factory CategoriesModel.fromJson(Map<String,dynamic> api){
    return CategoriesModel(
        name: api['name'],
        id: api['id']);
  }
}