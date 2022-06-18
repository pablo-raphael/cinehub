import 'package:cinehub/layers/data/models/genre_model.dart';
import 'package:cinehub/layers/data/models/movie_model.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';

abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovieDataById(int id);

  Future<List<MovieModel>> getSimilarMovies(
    int id,
    List<GenreEntity> allGenres,
  );

  Future<List<GenreModel>> getAllGenres();

  Future<List<MovieModel>> searchMovies(
    String query,
    List<GenreEntity> allGenres,
  );
}
