import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/model/photos_model.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:flutter/foundation.dart';

class PhotoRepository{
  BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic>fetchPhotos()async{

    dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.photosEndPointUrl);
    Map<String,dynamic>mp = {
      "data" : response
    };
    if (kDebugMode) {
      print(response);
    }
    return PhotoModel.fromJson(mp);
  }

}