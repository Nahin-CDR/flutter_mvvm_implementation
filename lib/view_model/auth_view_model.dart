

import 'package:clean_code/repository/auth_repository.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepository = AuthRepository();
  bool _loading = false;
  bool get loading =>_loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context)async{
    setLoading(true);


    _myRepository.loginApi(data).then((value){
      Utils.flushBarErrorMessage("successfully logged in!\ntoken : ${value['token'].toString()}", context);
      if(kDebugMode){
        print(value['token']);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    });
    setLoading(false);
  }

  Future<void> signUpApi(dynamic data,BuildContext context)async{
    setSignUpLoading(true);

    _myRepository.loginApi(data).then((value){
      Utils.flushBarErrorMessage("successfully signed Up!\ntoken : ${value['token'].toString()}", context);
      if(kDebugMode){
        print(value['token']);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(true);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
    setSignUpLoading(false);
  }
}