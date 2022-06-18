import 'package:flutter/material.dart';
import 'package:cinehub/core/constants/app_strings.dart';
import 'package:cinehub/core/design_system/app_text_styles.dart';
import 'package:cinehub/layers/domain/entities/genre_entity.dart';

class SimilarMovieTextDetails extends StatelessWidget {
  final List<GenreEntity> genres;
  final int releaseDate;

  const SimilarMovieTextDetails({
    super.key,
    required this.genres,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    final releaseText = releaseDate > 0
        ? releaseDate.toString()
        : AppStrings.notAvailable;
    final genresText = genres.isNotEmpty
        ? genres.map((genre) => genre.name).join(AppStrings.genreSeparator)
        : AppStrings.noGenre;

    return Row(
      children: [
        Text(releaseText, style: AppTextStyles.caption),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            genresText,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption,
          ),
        ),
      ],
    );
  }
}
