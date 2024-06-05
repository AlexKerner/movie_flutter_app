import 'package:flutter/material.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/pages/details_page.dart';
import 'package:movie_flutter_app/src/utils/apis.utils.dart';

class CustomCardWidget extends StatelessWidget {
  final Items movies;
  const CustomCardWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailsPage(movie: movies),
                  fullscreenDialog: true));
        },
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.network(
                  API.REQUEST_IMG(movies.posterPath),
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
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const Spacer(),
                    Text('Popularity: ${movies.popularity}'),
                    Text('Votes: ${movies.voteAverage}')
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
