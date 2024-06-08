class SizeModel{

  String? id;
  String? name;

  SizeModel({required this.name, required this.id});

  factory SizeModel.fromJson(Map<String,dynamic> api){
    return SizeModel(
        name: api['name'],
        id: api['id']);
  }

}