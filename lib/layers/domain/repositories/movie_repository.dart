import 'package:cinehub/layers/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<MovieEntity> getMovieById(int id);

  Future<List<MovieEntity>> getSimilarMovies(int id);

  Future<List<MovieEntity>> searchMovies(String query);

  Future<bool> removeIdFromFavoriteList(int id);

  Future<bool> addIdToFavoriteList(int id);
}
