import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';

class ToggleFavoriteStatusUseCase {
  final MovieRepository _movieRepository;

  ToggleFavoriteStatusUseCase(this._movieRepository);

  Future<bool> call(MovieEntity movie) async {
    if (movie.isFavorite) {
      return await _movieRepository.removeIdFromFavoriteList(movie.id);
    } else {
      return await _movieRepository.addIdToFavoriteList(movie.id);
    }
  }
}
