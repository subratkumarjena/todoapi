class TodoModel {
 int? id;
 int? userId;
 String? todo;
 bool? completed;
 TodoModel({required this.id, required this.userId, required this.todo, required this.completed});
 factory TodoModel.fromJson(Map<String, dynamic> api){
   return TodoModel(
       id: api['id'],
       userId: api['userId'],
       todo: api['todo'],
       completed: api['completed']);
 }


}