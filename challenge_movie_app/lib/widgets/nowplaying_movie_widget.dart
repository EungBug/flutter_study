import 'package:challenge_movie_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NowPlayingMovie extends StatelessWidget {
  final int id;
  final String type;
  final String title, backdropPath;

  const NowPlayingMovie(
      {super.key,
      required this.id,
      required this.backdropPath,
      required this.title,
      required this.type});

  static const imageUrl = 'https://image.tmdb.org/t/p/w500/';

  moveToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          id: id,
          backdropPath: backdropPath,
          title: title,
          heroId: '$type$id',
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => moveToDetail(context),
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '$type$id',
              child: Container(
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
                  width: 150,
                  height: 150,
                ),
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
      ),
    );
  }
}
