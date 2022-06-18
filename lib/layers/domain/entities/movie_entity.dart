import 'package:cinehub/layers/domain/entities/genre_entity.dart';

class MovieEntity {
  final int id;
  final String movieName;
  final int releaseDate;
  final int numberOfLikes;
  final double popularity;
  final bool isFavorite;
  final String lowQualityPosterUrl;
  final String highQualityPosterUrl;
  final List<GenreEntity> genres;

  MovieEntity({
    required this.id,
    required this.movieName,
    required this.numberOfLikes,
    required this.popularity,
    required this.releaseDate,
    required this.genres,
    required this.highQualityPosterUrl,
    required this.lowQualityPosterUrl,
    this.isFavorite = false,
  });

  MovieEntity copyWith({
    int? id,
    String? movieName,
    int? numberOfLikes,
    double? popularity,
    int? releaseDate,
    List<GenreEntity>? genres,
    String? highQualityPosterUrl,
    String? lowQualityPosterUrl,
    bool? isFavorite,
  }) {
    return MovieEntity(
      id: id ?? this.id,
      movieName: movieName ?? this.movieName,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
      highQualityPosterUrl: highQualityPosterUrl ?? this.highQualityPosterUrl,
      lowQualityPosterUrl: lowQualityPosterUrl ?? this.lowQualityPosterUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
