class Movies {
  late String description;
  late String createdBy;
  late int favoriteCount;
  late int id;
  late String iso6391;
  late int itemCount;
  late List<Items> items;
  late String name;
  late int page;
  late String posterPath;
  late int totalPages;
  late int totalResults;

  Movies(
      {required this.createdBy,
      required this.description,
      required this.favoriteCount,
      required this.id,
      required this.iso6391,
      required this.itemCount,
      required this.items,
      required this.name,
      required this.page,
      required this.posterPath,
      required this.totalPages,
      required this.totalResults});

  Movies.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    description = json['description'];
    favoriteCount = json['favorite_count'];
    id = json['id'];
    iso6391 = json['iso_639_1'];
    itemCount = json['item_count'];
    items = <Items>[]; // Initialize the list here
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_by'] = createdBy;
    data['description'] = description;
    data['favorite_count'] = favoriteCount;
    data['id'] = id;
    data['iso_639_1'] = iso6391;
    data['item_count'] = itemCount;
    data['items'] = items.map((v) => v.toJson()).toList();
    data['name'] = name;
    data['page'] = page;
    data['poster_path'] = posterPath;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Items {
  late String backdropPath;
  late int id;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String mediaType;
  late bool adult;
  late String title;
  late String originalLanguage;
  late List<int> genreIds;
  late double popularity;
  late String releaseDate;
  late bool video;
  late double voteAverage;
  late int voteCount;

  Items(
      {required this.backdropPath,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.adult,
      required this.title,
      required this.originalLanguage,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  Items.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    title = json['title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
