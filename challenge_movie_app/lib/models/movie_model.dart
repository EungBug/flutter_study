class MovieModel {
  final bool adult, video;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;
  final int id, voteCount;
  final List<int> genreIds;
  final double popularity, voteAverage;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genreIds = convertIds(json['genre_ids']),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = double.parse(json['vote_average'].toString()),
        voteCount = json['vote_count'];

  static List<int> convertIds(List<dynamic> ids) {
    return ids.map((id) => int.parse(id.toString())).toList();
  }
}
