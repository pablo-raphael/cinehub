import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_dimensions.dart';
import 'package:cinehub/layers/presentation/controllers/movies_controller.dart';

class FavoriteButton extends StatelessWidget {
  final MoviesController moviesController;

  const FavoriteButton({super.key, required this.moviesController});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final movie = moviesController.currentMovie;
        final isFavorite = movie?.isFavorite ?? false;

        return IconButton(
          color: isFavorite ? AppColors.primary : AppColors.textPrimary,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: AppDimensions.favoriteButtonIconSize,
          ),
          onPressed: movie == null
              ? null
              : () => moviesController.toggleFavoriteForCurrentMovie(),
        );
      },
    );
  }
}
