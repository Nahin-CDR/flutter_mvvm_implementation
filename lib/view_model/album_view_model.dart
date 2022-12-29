
import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/album_repository.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/cupertino.dart';

import '../model/album_model.dart';

class AlbumViewViewModel with ChangeNotifier{

  final _myRepository = AlbumRepository();

  ApiResponse<AlbumModel> albums = ApiResponse.loading();

  setAlbum(ApiResponse<AlbumModel>response){
    albums = response;
    notifyListeners();
  }
  /// Call API and set values to its model
  Future<void> fetchAlbums() async{
    setAlbum(ApiResponse.loading());

    _myRepository.fetchAlbum().then((value) {

      setAlbum(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setAlbum(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }
}