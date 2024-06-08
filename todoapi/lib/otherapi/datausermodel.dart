import 'package:todoapi/otherapi/usermodel.dart';

class DataUserModel{
   List <UserModel>? users;
   int ? total;
   int ? skip;
   int ? limit;

   DataUserModel({required this.total, required this.skip, required this.limit, required this.users});

   factory DataUserModel.fromJson(Map<String,dynamic> api){

     List<UserModel> Musermodel =[];

     for(Map<String,dynamic> user in api['users']){
       UserModel userModel = UserModel.fromJson(user);
       Musermodel.add(userModel);
     }



     return DataUserModel(
         total: api['total'],
         skip: api['skip'],
         limit:api[' limit'],
         users: Musermodel);
   }



}