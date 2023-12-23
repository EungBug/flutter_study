import 'package:flutter/material.dart';

class NowPlayingMovie extends StatelessWidget {
  final int id;
  final String poster;
  final String title;

  const NowPlayingMovie(
      {super.key, required this.id, required this.poster, required this.title});

  static const imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              '$imageUrl$poster',
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
