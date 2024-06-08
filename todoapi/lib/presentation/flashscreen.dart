import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapi/presentation/todo/todohomepage.dart';
import 'package:todoapi/presentation/userauth/signin.dart';

class Flashpage extends StatefulWidget{
  @override
  State<Flashpage> createState() => _FlashpageState();
}

class _FlashpageState extends State<Flashpage> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to the home screen by 5 seconds
    Future.delayed(Duration(seconds: 3), () async {


      var shfk =await SharedPreferences.getInstance();
      var loginid = shfk.getString(SignIn.PREF_USER_ID);
      if(loginid!=null){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TodoHome())
        );
      }else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn())
        );
      }

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(child: Text("MY TODO")),

      ),
    );
  }

  void logout() async {


  }
}