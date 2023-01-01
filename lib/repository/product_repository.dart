
import 'package:clean_code/data/network/base_api_services.dart';
import 'package:clean_code/data/network/network_api_services.dart';
import 'package:clean_code/resources/app_url.dart';
import 'package:clean_code/utils/utils.dart';

import '../model/product_model.dart';

class ProductRepository{
  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic>fetchProductsFromApi()async{
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.fakeStoreProductsEndPoint);
      Map<String,dynamic> mp ={
        "data" : response
      };
      //print(mp);
      return ProductModel.fromJson(mp);
    }catch(error){
      Utils.toastMessage(error.toString());
    }
  }
}