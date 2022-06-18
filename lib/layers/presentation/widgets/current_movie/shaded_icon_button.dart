import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_colors.dart';
import 'package:cinehub/core/design_system/app_dimensions.dart';

class ShadedIconButton extends StatelessWidget {
  const ShadedIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppDimensions.shadedIconRadius,
      backgroundColor: AppColors.surfaceMuted,
      child: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: AppColors.textPrimary,
          size: AppDimensions.shadedIconSize,
        ),
      ),
    );
  }
}
