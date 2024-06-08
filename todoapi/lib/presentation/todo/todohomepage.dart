
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapi/data/model/ntodomodel.dart';
import '../../data/model/user/usermodel.dart';
import '../userauth/signin.dart';
class TodoHome extends StatefulWidget {
  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference mTodo;
  String? UID;
  static const COLLECTION_USER_KEY = "user";
  static const COLLECTION_todo_KEY = "todos";
  NTodoModel? todo;
  UserModel? mUser;
  var titleContrller = TextEditingController();
  var decoContrller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserid();
  }

  void showBottomSheet(String? id, String pgname, String btname) async {
    if (id != null) {
      final _existingdata = await firestore.collection(COLLECTION_USER_KEY).doc(
          UID).collection(COLLECTION_todo_KEY).doc(id).get();
      titleContrller.text = _existingdata["title"];
      decoContrller.text = _existingdata["description"];
    }

    showModalBottomSheet(
      elevation: 5,

      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            height: 800,
            child: Column(
              children: [
                Text('$pgname', style: TextStyle(fontSize: 21)),
                TextField(
                  controller: titleContrller,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: decoContrller,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (id != null) {
                          updatetodo(id: id);
                        } else {
                          var ntodoModel = NTodoModel(
                              description: decoContrller.text.toString(),
                              title: decoContrller.text.toString(),
                              completed: false);
                          mTodo.add(ntodoModel.toJson()).then((value) {
                            print("DocId: ${value.id}");
                            setState(() {

                            });
                          }, onError: (e) {
                            print("Error: $e");
                          });
                        }

                        Navigator.pop(context);
                      },
                      child: Text("$btname"),
                    ),
                    SizedBox(width: 11,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mTodo = firestore.collection(COLLECTION_USER_KEY).doc(UID).collection(
        COLLECTION_todo_KEY);
    return Scaffold(
      appBar: AppBar(title: Text("MY TODO"),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Column(
        children: [
          Row(


            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ClipOval(
                  child: Icon(Icons.person),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Salman ',
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.shade500),
                  ),
                  Text(
                    'ss',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: PopupMenuButton<String>(
                  onSelected: (String value) {
                    if (value == 'edit') {

                    } else if (value == 'logout') {
                      setState(() {

                      });
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Text('Edit'),
                          SizedBox(width: 11,),
                          Icon(Icons.edit, size: 18,),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          Text('Logout'),
                          SizedBox(width: 11,),
                          Icon(Icons.logout, size: 18,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("Todo List", style: TextStyle(
                fontSize: 24, color: Colors.purpleAccent)),
          ),
          Expanded(child: UID != null ? FutureBuilder(
            future: firestore.collection(COLLECTION_USER_KEY)
                .doc(UID)
                .collection(COLLECTION_todo_KEY)
                .get(),
            builder: (_, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshots.hasError) {
                return Center(
                  child: Text('Error: ${snapshots.error}'),
                );
              }

              if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots.data!.size,
                    itemBuilder: (_, index) {
                      //Map<String, dynamic> data = snapshots.data!.docs[index].data();
                      todo = NTodoModel.fromJson(snapshots.data!.docs[index]
                          .data());
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: todo!.completed == true
                                ? Colors.green
                                : Colors.red,
                            width: 2.0,)
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: ListTile(
                          title: Text('${todo!.title}'),
                          subtitle: Text('${todo!.description}'),
                          trailing: PopupMenuButton<String>(
                            onSelected: (String value) {
                              if (value == 'edit') {
                                showBottomSheet(snapshots.data!.docs[index].id,
                                    "Update Data", "Update");
                              } else if (value == 'delete') {
                                deletetodo(snapshots.data!.docs[index].id);
                                setState(() {

                                });
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Text('Edit'),
                                    SizedBox(width: 11,),
                                    Icon(Icons.edit, size: 18,),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Text('Delete'),
                                    SizedBox(width: 11,),
                                    Icon(Icons.delete, size: 18,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Container();
            },
          ) : Center(child: CircularProgressIndicator(),),),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleContrller.clear();
          decoContrller.clear();
          showBottomSheet(null, "Add Data", "Save");
        },
        child: Text("+ Note"),
      ),

    );
  }

  Future<void> deletetodo(String id) {
    return mTodo
        .doc(id)
        .delete()
        .then((value) => print("Todo Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  void getUserid() async {
    var prefs = await SharedPreferences.getInstance();
    UID = prefs.getString(SignIn.PREF_USER_ID);
    if (UID != null) {
      DocumentSnapshot userDoc = await firestore.collection(COLLECTION_USER_KEY).doc(UID).get();

    }

    setState(() {

    });
  }

  Future <void> updatetodo({required String id}) {
    var ntodoModel = NTodoModel(
        description: decoContrller.text.toString(),
        title: decoContrller.text.toString(),
        completed: false);

    return mTodo
        .doc(id)
        .update(ntodoModel.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}


