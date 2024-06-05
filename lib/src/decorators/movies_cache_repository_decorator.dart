import 'dart:convert';

import 'package:movie_flutter_app/src/decorators/movies_repository_decorator.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(super.moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);

      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('Movies saved in cache: ' + jsonMovies);
    return movies;
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache');
    var json = jsonDecode(moviesJsonString!);
    var movies = Movies.fromJson(json);
    print('Movies in cache: ' + movies.toString());
    return movies;
  }
}
