import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../modal/movie/MoviesModal.dart';
import '../res/app_urls.dart';

class HomeRepo{

  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<MoviesModal> getMoviesList() async{
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrls.moviesListEP);
      return response = MoviesModal.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}