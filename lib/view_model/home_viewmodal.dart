import 'package:flutter/cupertino.dart';
import 'package:mvvm_vidoe_one/data/response/api_response.dart';
import 'package:mvvm_vidoe_one/modal/movie/MoviesModal.dart';
import 'package:mvvm_vidoe_one/repo/home_repo.dart';

class HomeViewModal with ChangeNotifier {
  final _myRepo = HomeRepo();

  ApiResponse<MoviesModal> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModal> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.getMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
