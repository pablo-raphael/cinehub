// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesController on _MoviesController, Store {
  late final _$currentMovieAtom = Atom(
    name: '_MoviesController.currentMovie',
    context: context,
  );

  @override
  MovieEntity? get currentMovie {
    _$currentMovieAtom.reportRead();
    return super.currentMovie;
  }

  @override
  set currentMovie(MovieEntity? value) {
    _$currentMovieAtom.reportWrite(value, super.currentMovie, () {
      super.currentMovie = value;
    });
  }

  late final _$similarMoviesAtom = Atom(
    name: '_MoviesController.similarMovies',
    context: context,
  );

  @override
  ObservableList<MovieEntity> get similarMovies {
    _$similarMoviesAtom.reportRead();
    return super.similarMovies;
  }

  @override
  set similarMovies(ObservableList<MovieEntity> value) {
    _$similarMoviesAtom.reportWrite(value, super.similarMovies, () {
      super.similarMovies = value;
    });
  }

  late final _$searchResultsAtom = Atom(
    name: '_MoviesController.searchResults',
    context: context,
  );

  @override
  ObservableList<MovieEntity> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<MovieEntity> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MoviesController.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSearchingAtom = Atom(
    name: '_MoviesController.isSearching',
    context: context,
  );

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_MoviesController.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$searchErrorMessageAtom = Atom(
    name: '_MoviesController.searchErrorMessage',
    context: context,
  );

  @override
  String? get searchErrorMessage {
    _$searchErrorMessageAtom.reportRead();
    return super.searchErrorMessage;
  }

  @override
  set searchErrorMessage(String? value) {
    _$searchErrorMessageAtom.reportWrite(value, super.searchErrorMessage, () {
      super.searchErrorMessage = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_MoviesController.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$submittedSearchQueryAtom = Atom(
    name: '_MoviesController.submittedSearchQuery',
    context: context,
  );

  @override
  String get submittedSearchQuery {
    _$submittedSearchQueryAtom.reportRead();
    return super.submittedSearchQuery;
  }

  @override
  set submittedSearchQuery(String value) {
    _$submittedSearchQueryAtom.reportWrite(
      value,
      super.submittedSearchQuery,
      () {
        super.submittedSearchQuery = value;
      },
    );
  }

  late final _$getMovieByIdAsyncAction = AsyncAction(
    '_MoviesController.getMovieById',
    context: context,
  );

  @override
  Future<void> getMovieById(int id) {
    return _$getMovieByIdAsyncAction.run(() => super.getMovieById(id));
  }

  late final _$toggleFavoriteForCurrentMovieAsyncAction = AsyncAction(
    '_MoviesController.toggleFavoriteForCurrentMovie',
    context: context,
  );

  @override
  Future<void> toggleFavoriteForCurrentMovie() {
    return _$toggleFavoriteForCurrentMovieAsyncAction.run(
      () => super.toggleFavoriteForCurrentMovie(),
    );
  }

  late final _$submitSearchAsyncAction = AsyncAction(
    '_MoviesController.submitSearch',
    context: context,
  );

  @override
  Future<void> submitSearch() {
    return _$submitSearchAsyncAction.run(() => super.submitSearch());
  }

  late final _$_getSimilarMoviesAsyncAction = AsyncAction(
    '_MoviesController._getSimilarMovies',
    context: context,
  );

  @override
  Future<void> _getSimilarMovies() {
    return _$_getSimilarMoviesAsyncAction.run(() => super._getSimilarMovies());
  }

  late final _$_searchMoviesAsyncAction = AsyncAction(
    '_MoviesController._searchMovies',
    context: context,
  );

  @override
  Future<void> _searchMovies(String query) {
    return _$_searchMoviesAsyncAction.run(() => super._searchMovies(query));
  }

  late final _$_MoviesControllerActionController = ActionController(
    name: '_MoviesController',
    context: context,
  );

  @override
  void updateSearchQuery(String query) {
    final _$actionInfo = _$_MoviesControllerActionController.startAction(
      name: '_MoviesController.updateSearchQuery',
    );
    try {
      return super.updateSearchQuery(query);
    } finally {
      _$_MoviesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentMovie: ${currentMovie},
similarMovies: ${similarMovies},
searchResults: ${searchResults},
isLoading: ${isLoading},
isSearching: ${isSearching},
errorMessage: ${errorMessage},
searchErrorMessage: ${searchErrorMessage},
searchQuery: ${searchQuery},
submittedSearchQuery: ${submittedSearchQuery}
    ''';
  }
}
