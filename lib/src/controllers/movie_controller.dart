import 'package:flutter/material.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    if (_cachedMovies != null) {
      var list = _cachedMovies!.items
          .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
      movies.value = Movies(
        createdBy: _cachedMovies!.createdBy,
        description: _cachedMovies!.description,
        favoriteCount: _cachedMovies!.favoriteCount,
        id: _cachedMovies!.id,
        iso6391: _cachedMovies!.iso6391,
        itemCount: list.length,
        items: list,
        name: _cachedMovies!.name,
        page: _cachedMovies!.page,
        posterPath: _cachedMovies!.posterPath,
        totalPages: _cachedMovies!.totalPages,
        totalResults: list.length,
      );
    }
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
