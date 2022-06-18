import 'package:cinehub/core/config/app_config.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/layers/data/models/genre_model.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';
import 'package:cinehub/layers/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String title;
  final String posterPath;

  MovieModel({
    required super.numberOfLikes,
    required super.releaseDate,
    required super.id,
    required this.title,
    required super.popularity,
    required this.posterPath,
    required super.genres,
  }) : super(
         movieName: title,
         highQualityPosterUrl: posterPath.isNotEmpty
             ? '${AppConfig.imageBaseOriginal}/$posterPath'
             : '',
         lowQualityPosterUrl: posterPath.isNotEmpty
             ? '${AppConfig.imageBaseW500}/$posterPath'
             : '',
       );

  factory MovieModel.fromJson(
    Map<String, dynamic> movieJson, {
    List<GenreEntity>? allGenres,
  }) {
    final List<GenreEntity> genres = [];

    if (allGenres != null) {
      final genreIds =
          movieJson[AppJsonKeys.genreIds] as List<dynamic>? ?? const [];
      for (final rawId in genreIds) {
        final int? id = rawId is int ? rawId : int.tryParse(rawId.toString());
        if (id == null) continue;
        final index = allGenres.indexWhere((genre) => genre.id == id);
        if (index != -1) {
          genres.add(allGenres[index]);
        }
      }
    } else {
      final genresJson = movieJson[AppJsonKeys.genres];
      if (genresJson is List<dynamic>) {
        for (final genre in genresJson) {
          if (genre is Map<String, dynamic>) {
            genres.add(GenreModel.fromJson(genre));
          }
        }
      }
    }

    final releaseDateRaw = movieJson[AppJsonKeys.releaseDate]?.toString() ?? '';
    final releaseYear = releaseDateRaw.isNotEmpty
        ? int.tryParse(
                releaseDateRaw.split(AppStrings.dateSeparatorDash).first,
              ) ??
              0
        : 0;
    final titleRaw =
        (movieJson[AppJsonKeys.originalTitle] ??
                movieJson[AppJsonKeys.title] ??
                '')
            .toString();
    final posterPathRaw = movieJson[AppJsonKeys.posterPath];
    final posterPath = posterPathRaw == null ? '' : posterPathRaw.toString();

    return MovieModel(
      id: (movieJson[AppJsonKeys.id] as num?)?.toInt() ?? 0,
      numberOfLikes: (movieJson[AppJsonKeys.voteCount] as num?)?.toInt() ?? 0,
      releaseDate: releaseYear,
      title: titleRaw,
      popularity:
          (movieJson[AppJsonKeys.popularity] as num?)?.toDouble() ?? 0.0,
      posterPath: posterPath,
      genres: genres,
    );
  }
}
