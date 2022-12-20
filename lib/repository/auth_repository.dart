
import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:clean_code/utils/utils.dart';

class AuthRepository{

  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPointUrl, data);
      return response;
    }catch(error){
     Utils.toastMessage(error.toString());
    }
  }

  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPointUrl, data);
      return response;
    }catch(error){
      Utils.toastMessage(error.toString());
    }
  }
}