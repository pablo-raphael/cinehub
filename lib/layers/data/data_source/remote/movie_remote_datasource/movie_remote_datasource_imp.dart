import 'dart:convert';
import 'dart:io';

import 'package:cinehub/core/config/app_config.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/layers/data/data_source/remote/movie_remote_datasource/movie_remote_datasource.dart';
import 'package:cinehub/layers/data/models/genre_model.dart';
import 'package:cinehub/layers/data/models/movie_model.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  @override
  Future<MovieModel> getMovieDataById(int id) async {
    Uri url = Uri.parse(
      '${AppConfig.baseUrl}${AppApiPaths.movieById(id)}?${AppQueryParams.apiKey}=${AppConfig.apiKey}',
    );
    http.Response response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(
        AppErrorMessages.movieDetailsLoadFailed(response.statusCode),
      );
    }

    final decoded = json.decode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception(AppErrorMessages.invalidMovieDetailsResponse);
    }

    return MovieModel.fromJson(decoded);
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(
    int id,
    List<GenreEntity> allGenres,
  ) async {
    Uri url = Uri.parse(
      '${AppConfig.baseUrl}${AppApiPaths.similarMovies(id)}?${AppQueryParams.apiKey}=${AppConfig.apiKey}',
    );
    http.Response response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(
        AppErrorMessages.similarMoviesLoadFailed(response.statusCode),
      );
    }

    final decoded = json.decode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception(AppErrorMessages.invalidSimilarMoviesResponse);
    }

    final results = decoded[AppJsonKeys.results];
    if (results is! List<dynamic>) {
      return [];
    }

    final List<MovieModel> similarMovies = [];
    for (final movie in results) {
      if (movie is Map<String, dynamic>) {
        similarMovies.add(MovieModel.fromJson(movie, allGenres: allGenres));
      }
    }
    return similarMovies;
  }

  @override
  Future<List<GenreModel>> getAllGenres() async {
    Uri url = Uri.parse(
      '${AppConfig.baseUrl}${AppApiPaths.genres}?${AppQueryParams.apiKey}=${AppConfig.apiKey}',
    );
    http.Response response = await http.get(
      url,
      headers: {AppHttpHeaders.accept: AppHttpHeaders.applicationJson},
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(AppErrorMessages.genresLoadFailed(response.statusCode));
    }

    final decoded = json.decode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception(AppErrorMessages.invalidGenresResponse);
    }

    final genresJson = decoded[AppJsonKeys.genres];
    if (genresJson is! List<dynamic>) {
      return [];
    }

    final List<GenreModel> genres = [];
    for (final genre in genresJson) {
      if (genre is Map<String, dynamic>) {
        genres.add(GenreModel.fromJson(genre));
      }
    }

    return genres;
  }

  @override
  Future<List<MovieModel>> searchMovies(
    String query,
    List<GenreEntity> allGenres,
  ) async {
    final Uri base = Uri.parse(
      '${AppConfig.baseUrl}${AppApiPaths.searchMovies}',
    );
    final Uri url = base.replace(
      queryParameters: {
        AppQueryParams.apiKey: AppConfig.apiKey,
        AppQueryParams.query: query,
      },
    );
    http.Response response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(
        AppErrorMessages.searchMoviesLoadFailed(response.statusCode),
      );
    }

    final decoded = json.decode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception(AppErrorMessages.invalidSearchMoviesResponse);
    }

    final results = decoded[AppJsonKeys.results];
    if (results is! List<dynamic>) {
      return [];
    }

    final List<MovieModel> searchMovies = [];
    for (final movie in results) {
      if (movie is Map<String, dynamic>) {
        searchMovies.add(MovieModel.fromJson(movie, allGenres: allGenres));
      }
    }

    return searchMovies;
  }
}
