import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    Key? key,
    this.text,
    this.iconData = Icons.navigate_next,
    required this.onPressed,
    this.color = AppColors.backgroundColorSplashScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.white, 
      ),
      label: Text(
        text ?? '',
        style: AppFont.body_text_bold.copyWith(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 28,
          right: 28,
        ),
      ),
      // iconAlignment: IconAlignment.end,
    );
  }
}
