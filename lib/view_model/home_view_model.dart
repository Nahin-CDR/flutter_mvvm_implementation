
import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/model/movie_model.dart';
import 'package:clean_code/repository/home_repository.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();


  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();


  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi()async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }
}