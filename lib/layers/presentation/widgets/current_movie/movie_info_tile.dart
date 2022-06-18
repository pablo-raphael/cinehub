import 'package:cinehub/layers/presentation/widgets/current_movie/favorite_button.dart';
import 'package:cinehub/layers/presentation/widgets/current_movie/icon_text.dart';
import 'package:cinehub/layers/presentation/widgets/current_movie/movie_title.dart';
import 'package:cinehub/layers/presentation/widgets/current_movie/shaded_icon_button.dart';
import 'package:cinehub/layers/presentation/widgets/fadein_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cinehub/core/constants/app_defaults.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_dimensions.dart';
import 'package:cinehub/core/design_system/app_spacing.dart';
import 'package:cinehub/layers/presentation/controllers/movies_controller.dart';

class MovieInfoTile extends StatelessWidget {
  final MoviesController moviesController;

  const MovieInfoTile({super.key, required this.moviesController});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final movie = moviesController.currentMovie;

        if (movie == null) {
          return Column(
            children: <Widget>[
              const AspectRatio(
                aspectRatio: AppDimensions.posterAspectRatio,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
              if (moviesController.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  child: Text(
                    moviesController.errorMessage!,
                    style: const TextStyle(color: AppColors.error),
                  ),
                ),
            ],
          );
        }

        return Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const AspectRatio(
                  aspectRatio: AppDimensions.posterAspectRatio,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
                FadeImage(movie.lowQualityPosterUrl),
                if (Navigator.of(context).canPop())
                  Positioned(
                    left: AppSpacing.md,
                    top: AppSpacing.md,
                    child: ShadedIconButton(),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: AppDimensions.movieInfoTitleFlex,
                    child: MovieTitle(
                      movie.movieName.isNotEmpty
                          ? movie.movieName
                          : AppStrings.noName,
                    ),
                  ),
                  Flexible(
                    flex: AppDimensions.movieInfoActionsFlex,
                    child: FavoriteButton(moviesController: moviesController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.md,
                top: AppSpacing.sm,
                bottom: AppSpacing.lg,
              ),
              child: Row(
                children: <Widget>[
                  IconText(
                    icon: Icons.favorite,
                    size: AppDimensions.movieInfoLikesIconSize,
                    text: formatLikeNumber(movie.numberOfLikes),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  IconText(
                    icon: Icons.star_half,
                    size: AppDimensions.movieInfoPopularityIconSize,
                    text:
                        '${movie.popularity.toStringAsFixed(AppDefaults.popularityDecimals)} ${AppStrings.popularityLabel}',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

String formatLikeNumber(int likes) {
  if (likes >= AppDefaults.likesCompactThreshold) {
    final compact = likes / AppDefaults.likesCompactThreshold;
    return '${compact.toStringAsFixed(AppDefaults.likesCompactDecimals)}${AppStrings.likesCompactSuffix}';
  }

  return '$likes${AppStrings.likesSuffix}';
}
