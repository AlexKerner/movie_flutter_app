
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository{

  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository );
  
  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }
  
}