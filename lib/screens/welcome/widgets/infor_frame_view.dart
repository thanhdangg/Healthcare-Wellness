import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/utils/custom_button.dart';

class InforFrameView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final double progressValue;
  final int numPages = 6;

  const InforFrameView({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onSkip,
    required this.onNext,
    required this.progressValue,
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
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 8,
                      width: 160,
                      child: LinearProgressIndicator(
                        value: progressValue,
                        backgroundColor:
                            AppColors.backgroundLinearProgressIndicator,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.backgroundColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onSkip,
                      child: Text(
                        'Skip',
                        style: AppFont.privatefont.copyWith(
                          color: AppColors.textLogoColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  title,
                  style: AppFont.extralfont,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: AppFont.privatefont.copyWith(
                    color: AppColors.textLogoColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: onNext,
                    backgroundColor: AppColors.backgroundColor,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
