import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/utils/custom_button.dart';

class FirstWelcomeFrameView extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSignIn;

  const FirstWelcomeFrameView({
    super.key,
    required this.onNext,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return _buildFirstFragmet();
  }

  Widget _buildFirstFragmet() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/img_logo.png'),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              style: AppFont.extralfont,
              children: <TextSpan>[
                const TextSpan(text: "     Welcome to \n"),
                TextSpan(
                  text: "asklepios",
                  style:
                      AppFont.extralfont.copyWith(color: AppColors.textAppName),
                ),
                TextSpan(text: " UI Kit"),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Image.asset('assets/images/img_welcome_first.png'),
          SizedBox(height: 32),
          CustomButton(
            text: 'Get Started',
            onPressed: onNext,
          ),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              style: AppFont.privatefont,
              children: <TextSpan>[
                const TextSpan(
                  text: "Already have an account?   ",
                ),
                TextSpan(
                  text: " Sign In",
                  style: AppFont.privatefont.copyWith(
                    color: AppColors.onErrorColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onSignIn, // Sử dụng callback onSignIn
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
