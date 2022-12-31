
import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/model/todos_model.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:clean_code/utils/utils.dart';


class TodosRepository{

  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic>fetchTodos()async{
    try{
      final response = await _baseApiServices.getGetApiResponse(AppUrl.todosEndPointUrl);
      Map<String,dynamic> mp = {
        "data" : response
      };
      return TodosModel.fromJson(mp);

    }catch(error){
      Utils.toastMessage(error.toString());
    }
  }
}