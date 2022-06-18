import 'package:mobx/mobx.dart';
import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/usecases/get_movie_by_id_usecase.dart';
import 'package:cinehub/layers/domain/usecases/get_similar_movies_usecase.dart';
import 'package:cinehub/layers/domain/usecases/search_movies_usecase.dart';
import 'package:cinehub/layers/domain/usecases/toggle_favorite_status_usecase.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesController with _$MoviesController;

abstract class _MoviesController with Store {
  late final GetMovieByIdUseCase _getMovieByIdUseCase;
  late final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  late final SearchMoviesUseCase _searchMoviesUseCase;
  late final ToggleFavoriteStatusUseCase _toggleFavoriteStatusUseCase;

  _MoviesController({
    required GetMovieByIdUseCase getMovieByIdUseCase,
    required GetSimilarMoviesUseCase getSimilarMoviesUseCase,
    required SearchMoviesUseCase searchMoviesUseCase,
    required ToggleFavoriteStatusUseCase toggleFavoriteStatusUseCase,
  }) {
    _getMovieByIdUseCase = getMovieByIdUseCase;
    _getSimilarMoviesUseCase = getSimilarMoviesUseCase;
    _searchMoviesUseCase = searchMoviesUseCase;
    _toggleFavoriteStatusUseCase = toggleFavoriteStatusUseCase;
  }

  @observable
  MovieEntity? currentMovie;

  @observable
  ObservableList<MovieEntity> similarMovies = ObservableList<MovieEntity>();

  @observable
  ObservableList<MovieEntity> searchResults = ObservableList<MovieEntity>();

  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  String? errorMessage;

  @observable
  String? searchErrorMessage;

  @observable
  String searchQuery = '';

  @observable
  String submittedSearchQuery = '';

  @action
  Future<void> getMovieById(int id) async {
    await _loadMovie(id);
  }

  @action
  Future<void> toggleFavoriteForCurrentMovie() async {
    final movie = currentMovie;
    if (movie == null) return;

    final wasFavorite = movie.isFavorite;
    final success = await _toggleFavoriteStatusUseCase(movie);
    if (!success) return;

    final updatedMovie = movie.copyWith(isFavorite: !wasFavorite);
    currentMovie = updatedMovie;

    final index = similarMovies.indexWhere((item) => item.id == movie.id);
    if (index != -1) {
      final similarMovie = similarMovies[index];
      similarMovies[index] = similarMovie.copyWith(
        isFavorite: updatedMovie.isFavorite,
      );
    }

    final searchIndex = searchResults.indexWhere((item) => item.id == movie.id);
    if (searchIndex != -1) {
      final searchedMovie = searchResults[searchIndex];
      searchResults[searchIndex] = searchedMovie.copyWith(
        isFavorite: updatedMovie.isFavorite,
      );
    }
  }

  @action
  void updateSearchQuery(String query) {
    searchQuery = query;
    searchErrorMessage = null;
  }

  @action
  Future<void> submitSearch() async {
    final trimmedQuery = searchQuery.trim();
    if (trimmedQuery.isEmpty) {
      searchResults.clear();
      isSearching = false;
      submittedSearchQuery = '';
      return;
    }

    submittedSearchQuery = trimmedQuery;
    await _searchMovies(trimmedQuery);
  }

  @action
  Future<void> _getSimilarMovies() async {
    final movie = currentMovie;
    if (movie == null) return;

    final movies = await _getSimilarMoviesUseCase(movie.id);
    similarMovies
      ..clear()
      ..addAll(movies);
  }

  @action
  Future<void> _searchMovies(String query) async {
    isSearching = true;
    try {
      final movies = await _searchMoviesUseCase(query);
      searchResults
        ..clear()
        ..addAll(movies);
    } catch (error) {
      searchErrorMessage = error.toString();
    } finally {
      isSearching = false;
    }
  }

  Future<void> _loadMovie(int id) async {
    isLoading = true;
    errorMessage = null;
    currentMovie = null;
    similarMovies.clear();

    try {
      currentMovie = await _getMovieByIdUseCase(id);
      await _getSimilarMovies();
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
    }
  }
}
