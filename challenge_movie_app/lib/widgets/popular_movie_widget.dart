import 'package:challenge_movie_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  final int id;
  final String backdropPath;
  final String title;

  const PopularMovie(
      {super.key,
      required this.id,
      required this.backdropPath,
      required this.title});

  static const imageUrl = 'https://image.tmdb.org/t/p/w500/';

  moveToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          id: id,
          backdropPath: backdropPath,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => moveToDetail(context),
      child: Hero(
        tag: id,
        child: Container(
          width: 250,
          height: 180,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(
            '$imageUrl$backdropPath',
            headers: const {
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
            },
            fit: BoxFit.cover,
            width: 250,
            height: 180,
          ),
        ),
      ),
    );
  }
}
