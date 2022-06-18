import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_text_styles.dart';

class SimilarMovieTitle extends StatelessWidget {
  final String title;

  const SimilarMovieTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppTextStyles.subtitle,
    );
  }
}
