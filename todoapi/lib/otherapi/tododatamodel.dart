import 'package:todoapi/otherapi/todomodel.dart';

class TodoDataModel{
  int? total;
  int? skip;
  int? limit;
  List<TodoModel>? todos;
  TodoDataModel({required this.limit, required this.skip, required this.todos, required this.total});
  factory TodoDataModel.fromJson(Map<String, dynamic> api){

    List<TodoModel> mTodo = [];

    for(Map<String, dynamic> eachTodo in api['todos']){
      TodoModel todoModel = TodoModel.fromJson(eachTodo);
      mTodo.add(todoModel);
    }
    return TodoDataModel(
        limit: api['limit'],
        skip: api['skip'],
        todos:mTodo,
        total: api['total']);
  }
}
