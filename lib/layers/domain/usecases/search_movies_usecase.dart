import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository _movieRepository;

  SearchMoviesUseCase(this._movieRepository);

  Future<List<MovieEntity>> call(String query) async {
    return _movieRepository.searchMovies(query);
  }
}
