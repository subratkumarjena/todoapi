import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapi/presentation/pages/userauth/signup.dart';
import '../todo/todohomepage.dart';

class SignIn extends StatelessWidget {
  static const String PREF_USER_ID = "UID";
 TextEditingController passwordController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 400,
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sigin',style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: emailController ,

                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                decoration:  InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Enter your Password',
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () async{

                  try{
                    var cred = await firebaseAuth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                    print( 'UID : ${cred.user!.uid}');

                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString(PREF_USER_ID, cred.user!.uid);


                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return TodoHome();
                    }));

                  }on FirebaseAuthException catch(e){
                    print("FirebaseError: $e");
                  }catch(e){
                    print("Error: $e");
                  }

                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 10,),
            TextButton(
              child: Text('Do not have an account? Register'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Signup();
                }));
              },
            ),


          ],
        ),
      ),
    );
  }


}


