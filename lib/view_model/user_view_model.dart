import 'package:clean_code/model/token_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(dynamic user) async {
    final SharedPreferences tokenPreference = await SharedPreferences.getInstance();
    tokenPreference.setString('token', user.toString());
    notifyListeners();
    return true;
  }

  Future<dynamic> getUser() async {
    final SharedPreferences getPreference =
        await SharedPreferences.getInstance();
    String? token = getPreference.getString('token');

    return token;//UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences removePreference =
        await SharedPreferences.getInstance();
    removePreference.remove('token');
    return true;
  }
}
