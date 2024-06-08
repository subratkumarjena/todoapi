class NoteModel{

  String? title;
  String? description;
  String? auther;

  NoteModel({required this.title, required this.auther, required this.description});

  factory NoteModel.fromJson(Map<String,dynamic> doc){
    return NoteModel(
        title: doc['title'],
        auther: doc['auther'],
        description: doc['description']);
  }

  Map<String,dynamic> toJson(){
    return {
        "title": title,
        "auther": auther,
        "description": description,
    };
  }

}