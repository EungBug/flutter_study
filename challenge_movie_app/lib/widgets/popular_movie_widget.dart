import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  final int id;
  final String poster;
  final String title;

  const PopularMovie(
      {super.key, required this.id, required this.poster, required this.title});

  static const imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            height: 180,
            child: Image.network(
              '$imageUrl$poster',
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
