import 'package:mvvm_vidoe_one/data/network/network_api_services.dart';

import '../data/network/base_api_services.dart';
import '../res/app_urls.dart';

class AuthRepository{

  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic> login(dynamic data) async{
    try{
      dynamic response = await _baseApiServices.getPostApiResponse(AppUrls.logInEP, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> register(dynamic data) async{
    try{
      dynamic response = await _baseApiServices.getPostApiResponse(AppUrls.registerEP, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

}