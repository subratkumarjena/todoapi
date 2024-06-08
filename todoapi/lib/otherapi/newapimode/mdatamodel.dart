import 'datamodelfillter.dart';

class MDataModel {
  DataModelFillter? data;
  bool? isSuccess;
  String ? message;

  MDataModel({required this.data, required this.isSuccess, required this.message});

  factory MDataModel.fromJson(Map<String,dynamic> api){
    return MDataModel(
        data:  DataModelFillter.fromJson(api['data']),
        isSuccess: api['isSuccess'],
        message: api['message']);
  }

}