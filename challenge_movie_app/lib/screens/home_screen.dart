import 'package:challenge_movie_app/models/movie_model.dart';
import 'package:challenge_movie_app/service/api_service.dart';
import 'package:challenge_movie_app/widgets/nowplaying_movie_widget.dart';
import 'package:challenge_movie_app/widgets/popular_movie_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowplayingMovies =
      ApiService.getNowPlayingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff221f1e),
      appBar: AppBar(
        foregroundColor: const Color(0xffF2C94C),
        backgroundColor: const Color(0xff221f1e),
        title: Container(),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Movies',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xffF2C94C),
                    ),
                  ),
                  FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 200,
                          child: Expanded(
                            child: makeMovieList(snapshot),
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Now in Cinemas',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xffF2C94C),
                    ),
                  ),
                  FutureBuilder(
                    future: nowplayingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 300,
                          child: Expanded(
                            child: makeNowPlayingList(snapshot),
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovie(
          id: movie.id,
          poster: movie.backdrop_path,
          title: movie.title,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
      itemCount: snapshot.data!.length,
    );
  }
}

ListView makeNowPlayingList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(vertical: 10),
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      var movie = snapshot.data![index];
      return NowPlayingMovie(
        id: movie.id,
        poster: movie.backdrop_path,
        title: movie.title,
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox(
        width: 20,
      );
    },
    itemCount: snapshot.data!.length,
  );
}
