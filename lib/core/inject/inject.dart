import 'package:get_it/get_it.dart';
import 'package:cinehub/layers/data/data_source/local/movie_local_datasource.dart';
import 'package:cinehub/layers/data/data_source/local/movie_local_datasource_imp.dart';
import 'package:cinehub/layers/data/data_source/remote/movie_remote_datasource/movie_remote_datasource.dart';
import 'package:cinehub/layers/data/data_source/remote/movie_remote_datasource/movie_remote_datasource_imp.dart';
import 'package:cinehub/layers/data/repository/movie_repository_imp.dart';
import 'package:cinehub/layers/domain/repositories/movie_repository.dart';
import 'package:cinehub/layers/domain/usecases/get_movie_by_id_usecase.dart';
import 'package:cinehub/layers/domain/usecases/get_similar_movies_usecase.dart';
import 'package:cinehub/layers/domain/usecases/search_movies_usecase.dart';
import 'package:cinehub/layers/domain/usecases/toggle_favorite_status_usecase.dart';
import 'package:cinehub/layers/presentation/controllers/movies_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // DataSources
    getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImp(),
    );
    getIt.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImp(),
    );

    // Repositories
    getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImp(
        movieRemoteDataSource: getIt<MovieRemoteDataSource>(),
        movieLocalDataSource: getIt<MovieLocalDataSource>(),
      ),
    );

    // UseCases
    getIt.registerLazySingleton<GetMovieByIdUseCase>(
      () => GetMovieByIdUseCase(getIt()),
    );
    getIt.registerLazySingleton<GetSimilarMoviesUseCase>(
      () => GetSimilarMoviesUseCase(getIt()),
    );
    getIt.registerLazySingleton<SearchMoviesUseCase>(
      () => SearchMoviesUseCase(getIt()),
    );
    getIt.registerLazySingleton<ToggleFavoriteStatusUseCase>(
      () => ToggleFavoriteStatusUseCase(getIt()),
    );

    // Controllers
    getIt.registerFactory<MoviesController>(
      () => MoviesController(
        getMovieByIdUseCase: getIt<GetMovieByIdUseCase>(),
        getSimilarMoviesUseCase: getIt<GetSimilarMoviesUseCase>(),
        searchMoviesUseCase: getIt<SearchMoviesUseCase>(),
        toggleFavoriteStatusUseCase: getIt<ToggleFavoriteStatusUseCase>(),
      ),
    );
  }
}
