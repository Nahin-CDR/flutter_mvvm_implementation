
import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/resources/app_url.dart';

import '../model/comment_model.dart';
import '../utils/utils.dart';

class CommentRepository{
  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<CommentModel?> fetchComments()async{
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.commentsEndPointUrl);
      Map<String,dynamic> mp = {
        "data" : response
      };
      //print(mp);
      return CommentModel.fromJson(mp);
    }catch(error){
      Utils.toastMessage(error.toString());
      return null;
    }
  }

}