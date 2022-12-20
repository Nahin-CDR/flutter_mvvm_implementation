

import 'package:clean_code/repository/auth_repository.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepository = AuthRepository();

  Future<void> loginApi(dynamic data,BuildContext context)async{
    _myRepository.loginApi(data).then((value){

      if(kDebugMode){
        print(value['token']);
        Utils.flushBarErrorMessage("successfully logged in!\ntoken : ${value['token'].toString()}", context);
      }

    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

}