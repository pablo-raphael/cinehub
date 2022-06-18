import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textMuted,
  );
}
