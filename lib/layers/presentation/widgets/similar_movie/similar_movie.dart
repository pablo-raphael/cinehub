import 'package:cinehub/layers/presentation/widgets/fadein_image.dart';
import 'package:cinehub/layers/presentation/widgets/similar_movie/similar_movie_text_details.dart';
import 'package:cinehub/layers/presentation/widgets/similar_movie/similar_movie_title.dart';
import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_spacing.dart';
import 'package:cinehub/core/design_system/app_dimensions.dart';
import 'package:cinehub/layers/domain/entities/movie_entity.dart';
import 'package:cinehub/layers/presentation/pages/home_page.dart';

class SimilarMovie extends StatelessWidget {
  final MovieEntity movie;

  const SimilarMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(movieId: movie.id),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            FadeImage(
              movie.lowQualityPosterUrl,
              width: AppDimensions.similarMoviePosterWidth,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.sm),
                    child: SimilarMovieTitle(movie.movieName),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SimilarMovieTextDetails(
                    genres: movie.genres,
                    releaseDate: movie.releaseDate,
                  ),
                ],
              ),
            ),
            movie.isFavorite
                ? const Icon(
                    Icons.favorite,
                    size: AppDimensions.similarMovieFavoriteIconSize,
                    color: AppColors.textPrimary,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
