import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';

class GetSimilarMoviesUseCase {
  final MovieRepository _movieRepository;

  GetSimilarMoviesUseCase(this._movieRepository);

  Future<List<MovieEntity>> call(int id) async {
    return await _movieRepository.getSimilarMovies(id);
  }
}
