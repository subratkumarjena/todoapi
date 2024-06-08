class NTodoModel{
  String? title;
  String? description;
  bool? completed;

   NTodoModel({
    required this.description, required this.title, required this.completed});

   factory NTodoModel.fromJson(Map<String,dynamic> fir){
     return NTodoModel(
         description: fir['description'],
         title: fir['title'],
         completed: fir['completed']);
   }
  Map<String,dynamic>toJson(){
     return{
       "title": title,
       "description": description,
       "completed" : completed,
     };
  }

}