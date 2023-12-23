import 'dart:convert';

import 'package:challenge_movie_app/models/movie_detail_model.dart';
import 'package:challenge_movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> getPopularMovies() async {
    final url = Uri.parse('$baseUrl/popular');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    final url = Uri.parse('$baseUrl/now-playing');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    final url = Uri.parse('$baseUrl/coming-soon');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    }
    throw Error();
  }

  static Future<MovieDetail> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return MovieDetail.fromJson(body);
    }
    throw Error();
  }
}
