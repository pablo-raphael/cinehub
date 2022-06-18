import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';

class GetMovieByIdUseCase {
  final MovieRepository _movieRepository;

  GetMovieByIdUseCase(this._movieRepository);

  Future<MovieEntity> call(int id) async {
    return await _movieRepository.getMovieById(id);
  }
}
