
import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/userlist_repositoy.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/material.dart';

import '../model/userlist_model.dart';

class UserListViewModel with ChangeNotifier{
  final _myRepo = UserListRepository();

  ApiResponse<UserListModel>  userListResponse = ApiResponse.loading();

  setUserList(ApiResponse<UserListModel> response){
    userListResponse = response;
    notifyListeners();
  }

  Future<void>fetchUserListApi() async{
    setUserList(ApiResponse.loading());
    _myRepo.fetchUsersList().then((value) {
     setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }



}