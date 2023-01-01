import 'package:clean_code/data/response/api_response.dart';
import 'package:clean_code/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/product_model.dart';
import '../utils/utils.dart';

class ProductViewViewModel with ChangeNotifier{

  final _myRepository = ProductRepository();
  ApiResponse<ProductModel> products = ApiResponse.loading();

  setProducts(ApiResponse<ProductModel>response){
    products = response;
    notifyListeners();
  }
  Future<void>fetchProducts()async{
    setProducts(ApiResponse.loading());
    _myRepository.fetchProductsFromApi().then((value){
      setProducts(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProducts(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
    });
  }

}