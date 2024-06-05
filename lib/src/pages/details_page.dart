import 'package:flutter/material.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Items movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: CircularProgressIndicator(
                          color: Colors.blue[800],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Original title: ${movie.originalTitle}',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Release date: ${movie.releaseDate}',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Votes: ${movie.voteAverage}',
                        style: Theme.of(context).textTheme.titleMedium)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
