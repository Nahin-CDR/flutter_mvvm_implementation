
import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/photo_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/photos_model.dart';
import '../utils/utils.dart';

class PhotoViewViewModel with ChangeNotifier{

  final _myRepo = PhotoRepository();

  ApiResponse<PhotoModel>photos = ApiResponse.loading();

  setPhotos(ApiResponse<PhotoModel>response){
    photos = response;
    notifyListeners();
  }

  Future<void>fetchPhotoFromApi()async{

    setPhotos(ApiResponse.loading());
    _myRepo.fetchPhotos().then((value) {
      setPhotos(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setPhotos(ApiResponse.error(error.toString()));
      print(error.toString());
      Utils.toastMessage(error.toString());
    });
  }



}