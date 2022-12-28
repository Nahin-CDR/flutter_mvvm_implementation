import 'dart:async';

import 'package:clean_code/model/token_model.dart';
import 'package:clean_code/repository/auth_repository.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:clean_code/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    print("login api called");
    _myRepository.loginApi(data).then((value) {
      Utils.flushBarErrorMessage(
          message:  "successfully logged in!\ntoken : ${value['token'].toString()}",
          context: context,
          duration: 2
      );
      UserModel tokenModel = UserModel.fromJson(value);
      UserViewModel userViewModel = UserViewModel();
      userViewModel.saveUser(tokenModel.token.toString());
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RoutesName.home);
       // Navigator.pop(context);
      });

      //value['token'].toString());
      if (kDebugMode) {
        print(value['token']);
      }
    }).onError((error, stackTrace) {
     if(kDebugMode){
       print(error.toString());
     }
      Utils.flushBarErrorMessage(message:  error.toString(),context:  context,duration: 3);
    });
    setLoading(false);
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepository.loginApi(data).then((value) {
      Utils.flushBarErrorMessage(
          message: "successfully signed Up!\ntoken : ${value['token'].toString()}",
          context:  context,
          duration: 2
      );
      UserViewModel userViewModel = UserViewModel();
      userViewModel.saveUser(value['token']);
      if (kDebugMode) {
        print(value['token']);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(true);
      Utils.flushBarErrorMessage(
          message:  error.toString(),
          context:  context,
          duration: 3
      );
    });
    setSignUpLoading(false);
  }
}
