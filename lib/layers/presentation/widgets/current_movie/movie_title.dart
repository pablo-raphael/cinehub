import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_text_styles.dart';

class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: AppTextStyles.title,
    );
  }
}
