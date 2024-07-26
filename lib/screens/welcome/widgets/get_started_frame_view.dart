import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/welcome/welcome_page.dart';
>>>>>> develop
import 'package:healthcare_wellness/utils/widgets/custom_button.dart';

class GetStartedFrameView extends StatelessWidget {
  const GetStartedFrameView({super.key});

  void onGetStarted(BuildContext context) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const WelcomePage(),
      ),
    );
  }

  void onSignIn(BuildContext context) {
    context.go('/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: _buildFirstFragment(context),
    );
  }

  Widget _buildFirstFragment(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/img_logo.png'),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              style: AppFont.heading_extra_bold,
              children: <TextSpan>[
                const TextSpan(text: "     Welcome to \n"),
                TextSpan(
                  text: "asklepios",
                  style:
                      AppFont.heading_extra_bold.copyWith(color: AppColors.textAppName),
                ),
                const TextSpan(text: " UI Kit"),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Image.asset('assets/images/img_welcome_first.png'),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Get Started',
            onPressed: () => onGetStarted(context),
          ),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              style: AppFont.body_text_bold,
              children: <TextSpan>[
                const TextSpan(
                  text: "Already have an account?   ",
                ),
                TextSpan(
                  text: " Sign In",
                  style: AppFont.body_text_bold.copyWith(
                    color: AppColors.onErrorColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onSignIn(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
