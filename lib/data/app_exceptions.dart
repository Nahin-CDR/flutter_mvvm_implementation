class AppException implements Exception{
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return '$_prefix$_message';
  }

}



class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,'Error during communication');
}


class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message,'BadRequestException');
}

class UnAuthorisedException extends AppException{
  UnAuthorisedException   ([String? message]) : super(message,'UnAuthorisedException');
}



