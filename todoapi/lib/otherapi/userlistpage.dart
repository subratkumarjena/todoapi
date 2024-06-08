import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapi/otherapi/datausermodel.dart';
import 'package:todoapi/otherapi/usermodel.dart';

class UserListpage extends StatefulWidget{
  @override
  State<UserListpage> createState() => _UserListpageState();
}
class _UserListpageState extends State<UserListpage> {
  DataUserModel? muser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  void getuser() async{
    String url = "https://dummyjson.com/users";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var mData = response.body;
      print(mData);
      var rawData = jsonDecode(mData);
      muser = DataUserModel.fromJson(rawData);
      print(muser);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: muser != null ? muser!.users!.isNotEmpty?
          ListView.builder(
            itemCount: muser!.users!.length,
              itemBuilder: (_, index){
              UserModel usermodel = muser!.users![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(usermodel.image!),
                ),
                title: Text(usermodel.firstName!),
                subtitle: Text(usermodel.email!),
              );
              })
              :Center(child: Text('Data  not found'),)
              :Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}