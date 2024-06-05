import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_flutter_app/src/controllers/movie_controller.dart';
import 'package:movie_flutter_app/src/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_flutter_app/src/models/movies_model.dart';
import 'package:movie_flutter_app/src/repositories/movies_repository_imp.dart';
import 'package:movie_flutter_app/src/services/dio_service_imp.dart';
import 'package:movie_flutter_app/src/widgets/custom_card_widget.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
  
      MovieController(MoviesCacheRepositoryDecorator(MoviesRepositoryImp(DioServiceImp())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            onChanged: _controller.onChanged,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search for a movie...'))
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.items.length,
                            itemBuilder: (_, idx) =>
                                CustomCardWidget(movies: movies.items[idx]),
                            separatorBuilder: (_, __) => Divider(),
                          )
                        : Center(child: Lottie.asset('assets/lottie.json'));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
