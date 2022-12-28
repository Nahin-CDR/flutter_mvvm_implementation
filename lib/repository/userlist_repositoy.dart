
import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:clean_code/utils/utils.dart';

import '../model/userlist_model.dart';

class UserListRepository{
  final BaseApiServices _baseApiServices = NetworkApiService();
  Future<UserListModel> fetchUsersList() async {
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.userListEndPointUrl);
      return UserListModel.fromJson(response);
    }catch(error){
      Utils.toastMessage(error.toString());
      return UserListModel();
    }
  }
}