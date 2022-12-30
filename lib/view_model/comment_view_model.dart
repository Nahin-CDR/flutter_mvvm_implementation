import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/comments_repository.dart';
import 'package:flutter/widgets.dart';

import '../model/comment_model.dart';
import '../utils/utils.dart';

class CommentViewViewModel with ChangeNotifier{

  final _commentRepository = CommentRepository();

  ApiResponse<CommentModel>comments = ApiResponse.loading();

  setComments(ApiResponse<CommentModel>response){
    comments = response;
    notifyListeners();
  }

  Future<void> fetchComments() async{
    setComments(ApiResponse.loading());
    print("s");
    _commentRepository.fetchComments().then((value) {
       print(value);
      setComments(ApiResponse.completed(value));
      notifyListeners();
    }).onError((error, stackTrace) {
      setComments(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }

}