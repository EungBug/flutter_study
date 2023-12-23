class MovieDetail {
  final bool adult;
  final String backdropPath;
  final MovieCollection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        belongsToCollection =
            MovieCollection.fromJson(json['belongs_to_collection']),
        budget = json['budget'],
        genres = List<Genre>.from(
            json['genres'].map((genre) => Genre.fromJson(genre))),
        homepage = json['homepage'],
        id = json['id'],
        imdbId = json['imdb_id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        productionCompanies = List<ProductionCompany>.from(
            json['production_companies']
                .map((company) => ProductionCompany.fromJson(company))),
        productionCountries = List<ProductionCountry>.from(
            json['production_countries']
                .map((country) => ProductionCountry.fromJson(country))),
        releaseDate = DateTime.parse(json['release_date']),
        revenue = json['revenue'],
        runtime = json['runtime'],
        spokenLanguages = List<SpokenLanguage>.from(json['spoken_languages']
            .map((language) => SpokenLanguage.fromJson(language))),
        status = json['status'],
        tagline = json['tagline'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];
}

class MovieCollection {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  MovieCollection.fromJson(Map<String, dynamic>? json)
      : id = json?['id'],
        name = json?['name'],
        posterPath = json?['poster_path'],
        backdropPath = json?['backdrop_path'];
}

class Genre {
  final int id;
  final String name;

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        logoPath = json['logo_path'],
        name = json['name'],
        originCountry = json['origin_country'];
}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry.fromJson(Map<String, dynamic> json)
      : iso31661 = json['iso_3166_1'],
        name = json['name'];
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage.fromJson(Map<String, dynamic> json)
      : englishName = json['english_name'],
        iso6391 = json['iso_639_1'],
        name = json['name'];
}
