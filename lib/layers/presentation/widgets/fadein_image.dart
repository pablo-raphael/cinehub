import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_dimensions.dart';

class FadeImage extends StatelessWidget {
  final String imageUrl;
  final double? width;

  const FadeImage(this.imageUrl, {super.key, this.width});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      if (width == null) {
        return const SizedBox.shrink();
      }

      return SizedBox(
        width: width,
        child: const AspectRatio(
          aspectRatio: AppDimensions.posterAspectRatio,
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.surface),
            child: Icon(
              Icons.image_not_supported,
              color: AppColors.textMuted,
              size: AppDimensions.imagePlaceholderIconSize,
            ),
          ),
        ),
      );
    }

    return Container(
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, AppColors.background],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          stops: [
            AppDimensions.fadeInGradientStopStart,
            AppDimensions.fadeInGradientStopEnd,
          ],
        ),
      ),
      child: FadeInImage.memoryNetwork(
        width: width,
        placeholder: kTransparentImage,
        image: imageUrl,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
