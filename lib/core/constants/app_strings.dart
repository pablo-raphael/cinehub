class AppStrings {
  static const String appTitle = 'Movie Challenge';
  static const String noSimilarMovies = 'Sem filmes similares';
  static const String noName = 'Sem nome';
  static const String notAvailable = 'N/A';
  static const String noGenre = 'Sem genero';
  static const String genreSeparator = ', ';
  static const String popularityLabel = 'Popularity';
  static const String likesSuffix = ' Likes';
  static const String likesCompactSuffix = 'k Likes';
  static const String dateSeparatorDash = '-';
  static const String searchHint = 'Pesquisar filmes';
  static const String searchResultsTitle = 'Resultados da pesquisa';
  static const String searchNoResults = 'Nenhum resultado';
}

class AppErrorMessages {
  static String movieDetailsLoadFailed(int statusCode) {
    return 'Failed to load movie details (status: $statusCode).';
  }

  static const String invalidMovieDetailsResponse =
      'Invalid movie details response.';

  static String similarMoviesLoadFailed(int statusCode) {
    return 'Failed to load similar movies (status: $statusCode).';
  }

  static const String invalidSimilarMoviesResponse =
      'Invalid similar movies response.';

  static String genresLoadFailed(int statusCode) {
    return 'Failed to load genres (status: $statusCode).';
  }

  static const String invalidGenresResponse = 'Invalid genres response.';

  static String searchMoviesLoadFailed(int statusCode) {
    return 'Failed to search movies (status: $statusCode).';
  }

  static const String invalidSearchMoviesResponse =
      'Invalid search movies response.';
}

class AppJsonKeys {
  static const String results = 'results';
  static const String genres = 'genres';
  static const String genreIds = 'genre_ids';
  static const String releaseDate = 'release_date';
  static const String originalTitle = 'original_title';
  static const String title = 'title';
  static const String posterPath = 'poster_path';
  static const String id = 'id';
  static const String voteCount = 'vote_count';
  static const String popularity = 'popularity';
  static const String name = 'name';
}

class AppHttpHeaders {
  static const String accept = 'accept';
  static const String applicationJson = 'application/json';
}

class AppQueryParams {
  static const String apiKey = 'api_key';
  static const String query = 'query';
}

class AppApiPaths {
  static String movieById(int id) => '/3/movie/$id';
  static String similarMovies(int id) => '/3/movie/$id/similar';
  static const String genres = '/3/genre/movie/list';
  static const String searchMovies = '/3/search/movie';
}

class AppStorageKeys {
  static const String favorites = 'favorites';
}
