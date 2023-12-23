class MovieModel {
  final bool adult, video;
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
  final int id, vote_count;
  final List<int> genre_ids;
  final double popularity, vote_average;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        genre_ids = convertIds(json['genre_ids']),
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        video = json['video'],
        vote_average = double.parse(json['vote_average'].toString()),
        vote_count = json['vote_count'];

  static List<int> convertIds(List<dynamic> ids) {
    return ids.map((id) => int.parse(id.toString())).toList();
  }
}
