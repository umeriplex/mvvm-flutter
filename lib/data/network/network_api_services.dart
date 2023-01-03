import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:mvvm_vidoe_one/data/app_exceptions.dart';

import 'base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  //TODO this method is dynamic method for all types of get apis
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //TODO this method is dynamic method for all types of post apis
  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try {
      Response response = await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //TODO this is dynamic response method for all apis
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException("Bad Request Exception due to : ${response.body.toString()}");
      case 404:
        throw UnauthorisedException("Unauthorised Exception due to : ${response.body.toString()}");
      default:
        throw FetchDataException('Error accorded while communicating with server, with status code :${response.statusCode}');
    }
  }
}
