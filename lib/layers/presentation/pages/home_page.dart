import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_spacing.dart';
import 'package:cinehub/layers/presentation/controllers/movies_controller.dart';
import 'package:cinehub/layers/presentation/widgets/current_movie/movie_info_tile.dart';
import 'package:cinehub/layers/presentation/widgets/similar_movie/similar_movie.dart';

class HomePage extends StatefulWidget {
  final int movieId;

  const HomePage({super.key, required this.movieId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MoviesController _moviesController;

  @override
  void initState() {
    super.initState();
    _moviesController = GetIt.I.get<MoviesController>();
    _moviesController.getMovieById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Observer(
          builder: (context) {
            final errorMessage = _moviesController.errorMessage;
            final similarMovies = _moviesController.similarMovies;
            final submittedSearchQuery = _moviesController.submittedSearchQuery
                .trim();
            final searchResults = _moviesController.searchResults;
            final isSearching = _moviesController.isSearching;
            final searchErrorMessage = _moviesController.searchErrorMessage;
            final hasSearchQuery = submittedSearchQuery.isNotEmpty;

            return SingleChildScrollView(
              child: Column(
                children: [
                  MovieInfoTile(moviesController: _moviesController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    child: TextField(
                      onChanged: _moviesController.updateSearchQuery,
                      onSubmitted: (_) => _moviesController.submitSearch(),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: AppStrings.searchHint,
                        filled: true,
                        fillColor: AppColors.surface,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: _moviesController.submitSearch,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                  if (hasSearchQuery) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.searchResultsTitle,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (searchErrorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        child: Text(
                          searchErrorMessage,
                          style: const TextStyle(color: AppColors.error),
                        ),
                      )
                    else if (isSearching)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                        child: CircularProgressIndicator(
                          color: AppColors.textPrimary,
                        ),
                      )
                    else if (searchResults.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                        child: Text(
                          AppStrings.searchNoResults,
                          style: TextStyle(color: AppColors.textMuted),
                        ),
                      )
                    else
                      Column(
                        children: searchResults
                            .map((movie) => SimilarMovie(movie: movie))
                            .toList(),
                      ),
                  ] else if (similarMovies.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.lg,
                      ),
                      child: _moviesController.isLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.textPrimary,
                            )
                          : const Text(
                              AppStrings.noSimilarMovies,
                              style: TextStyle(color: AppColors.textMuted),
                            ),
                    )
                  else
                    Column(
                      children: similarMovies
                          .map(
                            (similarMovie) => SimilarMovie(movie: similarMovie),
                          )
                          .toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
