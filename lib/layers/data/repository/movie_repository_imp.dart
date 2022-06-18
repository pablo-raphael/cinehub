import 'package:cinehub/layers/data/data_source/local/movie_local_datasource.dart';
import 'package:cinehub/layers/data/data_source/remote/movie_remote_datasource/movie_remote_datasource.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';
import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements MovieRepository {
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieLocalDataSource _movieLocalDataSource;
  bool _favoritesLoaded = false;

  MovieRepositoryImp({
    required MovieRemoteDataSource movieRemoteDataSource,
    required MovieLocalDataSource movieLocalDataSource,
  }) {
    _movieRemoteDataSource = movieRemoteDataSource;
    _movieLocalDataSource = movieLocalDataSource;
    _loadFavoriteMoviesIds();
  }

  final List<int> favoriteMoviesIds = [];

  final List<GenreEntity> allGenres = [];

  @override
  Future<MovieEntity> getMovieById(int id) async {
    await _ensureFavoritesLoaded();
    final movie = await _movieRemoteDataSource.getMovieDataById(id);
    return movie.copyWith(isFavorite: favoriteMoviesIds.contains(movie.id));
  }

  @override
  Future<List<MovieEntity>> getSimilarMovies(int id) async {
    await _ensureFavoritesLoaded();
    if (allGenres.isEmpty) await _loadAllGenres();
    final movies = await _movieRemoteDataSource.getSimilarMovies(id, allGenres);

    return movies
        .map(
          (movie) =>
              movie.copyWith(isFavorite: favoriteMoviesIds.contains(movie.id)),
        )
        .toList();
  }

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    await _ensureFavoritesLoaded();
    if (allGenres.isEmpty) await _loadAllGenres();
    final movies = await _movieRemoteDataSource.searchMovies(query, allGenres);

    return movies
        .map(
          (movie) =>
              movie.copyWith(isFavorite: favoriteMoviesIds.contains(movie.id)),
        )
        .toList();
  }

  @override
  Future<bool> addIdToFavoriteList(int id) async {
    await _ensureFavoritesLoaded();
    if (favoriteMoviesIds.contains(id)) return true;

    final isSuccess = await _movieLocalDataSource.addIdToFavoriteList(id);
    if (isSuccess) favoriteMoviesIds.add(id);
    return isSuccess;
  }

  @override
  Future<bool> removeIdFromFavoriteList(int id) async {
    await _ensureFavoritesLoaded();
    final isSuccess = await _movieLocalDataSource.removeIdFromFavoriteList(id);
    if (isSuccess) favoriteMoviesIds.remove(id);
    return isSuccess;
  }

  Future<void> _loadAllGenres() async {
    allGenres.clear();
    allGenres.addAll(await _movieRemoteDataSource.getAllGenres());
  }

  Future<void> _loadFavoriteMoviesIds() async {
    final ids = await _movieLocalDataSource.getFavoriteMoviesIds();
    favoriteMoviesIds.clear();
    favoriteMoviesIds.addAll(ids);
    _favoritesLoaded = true;
  }

  Future<void> _ensureFavoritesLoaded() async {
    if (_favoritesLoaded) return;
    await _loadFavoriteMoviesIds();
  }
}
