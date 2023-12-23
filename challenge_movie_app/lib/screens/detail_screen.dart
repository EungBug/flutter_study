import 'package:challenge_movie_app/models/movie_detail_model.dart';
import 'package:challenge_movie_app/service/api_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String backdropPath, title;

  const DetailScreen({
    super.key,
    required this.id,
    required this.backdropPath,
    required this.title,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const imageUrl = 'https://image.tmdb.org/t/p/original/';

  late Future<MovieDetail> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.id,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage('$imageUrl${widget.backdropPath}'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Back to list',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            body: FutureBuilder(
                future: movie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MovieDetail movieInstance = snapshot.data!;
                    return Column(
                      children: [
                        Text(movieInstance.title),
                        Text(movieInstance.voteAverage.toString()),
                        Text(movieInstance.releaseDate.toString()),
                        const Text('Storyline'),
                        Text(movieInstance.overview),
                      ],
                    );
                  }
                  return const Center();
                })),
      ),
    );
  }
}
