import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String imageBaseOriginal = 'https://image.tmdb.org/t/p/original';
  static const String imageBaseW500 = 'https://image.tmdb.org/t/p/w500';
  static const String envKeyTmdbApi = 'TMDB_API_KEY';
  static const String envFileName = '.env';

  static String get apiKey {
    return dotenv.env[envKeyTmdbApi] ?? '';
  }
}
