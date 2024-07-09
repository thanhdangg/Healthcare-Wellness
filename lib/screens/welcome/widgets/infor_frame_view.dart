import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';

class InforFrameView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final int numPages = 6;

  const InforFrameView({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onSkip,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(
                  title,
                  style: AppFont.heading_extra_bold,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: AppFont.body_text_bold
                  .copyWith(
                    color: AppColors.textLogoColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
