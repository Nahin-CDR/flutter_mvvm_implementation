import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/todos_repository.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:flutter/foundation.dart';

import '../model/todos_model.dart';

class TodosViewViewModel with ChangeNotifier{

  final _myRepo = TodosRepository();

  ApiResponse<TodosModel>todos = ApiResponse.loading();

  setTodos(ApiResponse<TodosModel>response){
    todos = response;
    notifyListeners();
  }

  Future<void>fetchAllTodos()async{

    setTodos(ApiResponse.loading());
    _myRepo.fetchTodos().then((value) {
      setTodos(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTodos(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }
}