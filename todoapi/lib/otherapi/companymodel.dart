import 'addressmodel.dart';

class CompanyModel{

  AddressModel? address;
  String? department;
  String? name;
  String? title;
  CompanyModel({required this.address , required this.title, required this.name, required this.department
  });
  factory CompanyModel.fromJson(Map<String,dynamic> api){
    return CompanyModel(address: AddressModel.fromJson(api['address']),
        title: api['title'],
        name: api['name'],
        department: api['department']);
  }


}