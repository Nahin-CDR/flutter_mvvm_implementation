import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/foundation.dart';
import '../model/album_model.dart';

class AlbumRepository{
  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<AlbumModel?>fetchAlbum()async{
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.albumEndPointUrl);
      if (kDebugMode) {
       // print(response);
      }
      Map<String,dynamic>mp = {
        "data" : response
      };
      //print(mp);
      return AlbumModel.fromJson(mp);
    }catch(error){
      if(kDebugMode){
        print(error.toString());
      }
      Utils.toastMessage(error.toString());
      return null;
    }
  }


}