import 'package:todoapi/otherapi/companymodel.dart';

class ColoresModel{
  String? id;
  String? name;

  ColoresModel({required this.name, required this.id});

  factory ColoresModel.fromJson(Map<String,dynamic> api){
    return ColoresModel(
        name: api['name'],
        id: api['id']);
  }

}