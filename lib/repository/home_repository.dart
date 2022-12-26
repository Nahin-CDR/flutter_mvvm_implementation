
import 'package:clean_code/data/network/base_api_services.dart';

import '../data/network/network_api_services.dart';
import '../model/movie_model.dart';
import '../resources/app_url.dart';
import '../utils/utils.dart';

class HomeRepository{

  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList()async{
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.movieList);
      return MovieListModel.fromJson(response);
    }catch(error){
      Utils.toastMessage(error.toString());
      return MovieListModel();
    }
  }

}