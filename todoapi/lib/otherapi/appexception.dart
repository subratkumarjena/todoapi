class AppExceptions implements Exception{

  String? title;
  String? msg;
  AppExceptions({required this.title, required this.msg});

  String toErrormsg(){
    return "$title:$msg";
  }

}

class FetchDataException extends AppExceptions {

  FetchDataException( String errorMsg) : super(title: "Network Error", msg: "No Internet");
}
class BadRequestException extends AppExceptions {

  BadRequestException( String errorMsg) : super(title: "Network Error", msg: "No Internet");
}
