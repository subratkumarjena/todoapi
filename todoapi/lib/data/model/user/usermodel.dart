class UserModel{
  String? name;
  String? number;
  String? email;
  String? age;
  UserModel({
    required this.name, required this.email, required this.number, required this.age
});

  factory UserModel.fromJson(Map<String,dynamic> fir){
    return UserModel(
        name:fir['name'],
        email: fir['email'],
        number: fir['number'],
        age: fir['age']);
  }

  Map<String,dynamic> toJson(){
    return{
      "name": name,
      "number": number,
      "email": email,
      "age": age,
    };

  }

}