import 'package:challenge_movie_app/models/movie_detail_model.dart';
import 'package:challenge_movie_app/service/api_service.dart';
import 'package:challenge_movie_app/widgets/buy_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String backdropPath, title;
  final String heroId;

  const DetailScreen({
    super.key,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.heroId,
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

  String formatMovieInfo(int runtime, List<Genre> genres) {
    final parseTime = Duration(minutes: runtime).toString().split('.').first;
    final hours = parseTime.split(':')[0];
    final minutes = parseTime.split(':')[1];
    final runtimeStr = '${int.parse(hours)}h ${int.parse(minutes)}min';

    final genresStr = genres.map((genre) => genre.name).join(', ');

    return '$runtimeStr | $genresStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
        body: Hero(
          tag: widget.heroId,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$imageUrl${widget.backdropPath}'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: FutureBuilder(
                  future: movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      MovieDetail movieInstance = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieInstance.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                for (var i = 1; i < 6; i++)
                                  i <= movieInstance.voteAverage ~/ 2
                                      ? Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber.shade400,
                                        )
                                      : Icon(
                                          Icons.star_outline_rounded,
                                          color: Colors.amber.shade400,
                                        )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              formatMovieInfo(
                                  movieInstance.runtime, movieInstance.genres),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Storyline',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              movieInstance.overview,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 7,
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            BuyTicketButton(
                              url: movieInstance.homepage,
                            )
                          ],
                        ),
                      );
                    }
                    return const Center();
                  }),
            ),
          ),
        ));
  }
}
