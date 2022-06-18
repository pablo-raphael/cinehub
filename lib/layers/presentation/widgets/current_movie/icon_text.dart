import 'package:flutter/material.dart';
import 'package:cinehub/core/design_system/app_text_styles.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;

  const IconText({
    super.key,
    required this.icon,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.white, size: size),
        const SizedBox(width: 7),
        Text(text, style: AppTextStyles.body),
      ],
    );
  }
}
