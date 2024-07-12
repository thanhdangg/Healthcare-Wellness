import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/screens/sign_up/sign_up_page.dart';
import 'package:healthcare_wellness/utils/widgets/custom_button.dart';

class SignInFrameView extends StatelessWidget {
  void onSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 50,
            child: Image.asset('assets/images/img_logo.png'),
            // backgroundColor: AppColors.backgroundColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign in",
              style: AppFont.heading_extra_bold,
            ),
            const SizedBox(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              text: 'Sign in',
              onPressed: () {},
              iconData: Icons.navigate_next,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'OR',
              style: AppFont.body_text_bold,
            ),
            const SizedBox(height: 20.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/ic_facebook.png'),
                ),
                ImageIcon(
                  AssetImage('assets/images/ic_google.png'),
                ),
                ImageIcon(
                  AssetImage('assets/images/ic_instagram.png'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            RichText(
              text: TextSpan(
                style: AppFont.body_text_bold,
                children: <TextSpan>[
                  const TextSpan(
                    text: "Don't have an account?   ",
                  ),
                  TextSpan(
                    text: " Sign Up",
                    style: AppFont.body_text_bold.copyWith(
                      color: AppColors.onErrorColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => onSignUp(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
