import 'package:movie_flutter_app/src/repositories/movies_repository.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/services/dio_service.dart';
import 'package:movie_flutter_app/src/utils/apis.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
