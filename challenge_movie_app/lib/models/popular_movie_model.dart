import 'package:challenge_movie_app/models/movie_model.dart';

class PopularMovieModel {
  final int page, total_pages, total_results;
  final List<MovieModel> results;

  PopularMovieModel.fromJson(Map<String, dynamic> json)
      : page = json["page"],
        results = convertResults(json["results"]),
        total_pages = json["total_pages"],
        total_results = json["total_results"];

  static List<MovieModel> convertResults(List<dynamic> results) {
    return results.map((data) => MovieModel.fromJson(data)).toList();
  }
}
