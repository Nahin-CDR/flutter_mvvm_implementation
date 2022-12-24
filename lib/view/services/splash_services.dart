// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:clean_code/model/token_model.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (kDebugMode) {
        print("check authentication called");
      }
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token.toString() == 'null') {
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesName.home);
        });
      }
    });
  }
}
