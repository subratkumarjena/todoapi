import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapi/otherapi/tododatamodel.dart';
import 'package:todoapi/otherapi/userlistpage.dart';

class Myhomepage extends StatefulWidget{
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}
class _MyhomepageState extends State<Myhomepage> {
  TodoDataModel? mtodo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettodo();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: mtodo != null ? mtodo!.todos!.isNotEmpty ?
          ListView.builder(
              itemCount: mtodo!.todos!.length,
              itemBuilder: (_, index){
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border( left: BorderSide( color: mtodo!.todos![index].completed == true ? Colors.green : Colors.red,
                        width: 2.0,)
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: ListTile(
                      title: Text('${mtodo!.todos![index].userId}'),
                      subtitle: Text('${mtodo!.todos![index].todo}'),
                    ),
                  );

              })


          :Center(child: Text('Data  not found'),)
            :Center(child: CircularProgressIndicator(),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>UserListpage()));
        },child: Text("User"),
      ),





    );
  }

   void gettodo() async{
     String url = "https://dummyjson.com/todos";

     var response = await http.get(Uri.parse(url));
     if(response.statusCode == 200){
       var mData = response.body;
       print(mData);
       var rawData = jsonDecode(mData);

       mtodo = TodoDataModel.fromJson(rawData);

       setState(() {});
     }
   }
}

