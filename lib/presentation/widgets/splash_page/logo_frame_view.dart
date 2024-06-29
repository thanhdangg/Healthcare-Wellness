import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';

class LogoFrameView extends StatelessWidget {
  Widget build(BuildContext context) {
    return _buildLogoFrame();
  }

  Widget _buildLogoFrame() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/img_logo.png')),
          SizedBox(height: 20),
          Image(image: AssetImage('assets/images/img_app_name.png')),
          SizedBox(height: 20),
          Text(
            'Your Intelligent AI Health & Wellness Companion.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlusJakartaSans',
              color: AppColors.textLogoColor,
              wordSpacing: 2,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
