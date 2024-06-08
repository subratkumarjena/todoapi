import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapi/data/model/user/usermodel.dart';
import 'package:todoapi/presentation/pages/userauth/signin.dart';


class Signup extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference mUser;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        height: 600,
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signup',style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white), ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: nameController ,

                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: numberController ,
                decoration: InputDecoration(
                  label: Text("Ph Number"),
                  border: OutlineInputBorder(),
                  hintText: '9124686506',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: emailController ,

                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                  hintText: 'your@ggmail.com',
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                controller: passwordController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Password',
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                controller: agecontroller,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your age',
                ),
              ),
            ),

            TextButton(
              child: Text('Do not have an account? Register'),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ElevatedButton(
                onPressed: () async {
                try{
                  var cred = await firebaseAuth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString());
                  print( 'UID : ${cred.user!.uid}');
                  UserModel usermodel = UserModel(
                      name: nameController.text.toString(),
                      email: emailController.text.toString(),
                      number: numberController.text.toString(),
                      age: agecontroller.text.toString());

                  firestore.collection("user").doc(cred.user!.uid).set(usermodel.toJson()).then((value){
                    print("user added");
                    Navigator.pop(context);
                  });

                }on FirebaseAuthException catch(e){
                  print("FirebaseError: $e");
                }catch(e){
                  print("Error: $e");
                }



                },
                child: Text('Signup'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
