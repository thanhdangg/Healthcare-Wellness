import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/utils/widgets/button_login_with.dart';
import 'package:healthcare_wellness/utils/widgets/custom_button.dart';

class SignInFrameView extends StatefulWidget {
  @override
  _SignInFrameViewState createState() => _SignInFrameViewState();
}

class _SignInFrameViewState extends State<SignInFrameView> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void onSignUp(BuildContext context) {
    print("Sign up");
    context.go('/sign_up');
  }

  void onLogin(BuildContext context) {
    context.go('/home');
  }

  void checkLogin(String email, String password) {
    if (email == 'test@test.com' && password == '12345678') {
      onLogin(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Please check your email or password'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/img_logo.png'),
            const SizedBox(height: 20.0),
            const Text(
              "Sign in",
              style: AppFont.heading_extra_bold,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              obscureText: _obscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  'Forgot Password?',
                  selectionColor: AppColors.textAppName,
                  style: AppFont.body_text_bold,
                ),
                onPressed: () {
                  context.go('/forgot_password');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Sign In',
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  checkLogin(email, password);
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'OR',
                  style: AppFont.body_text_bold,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonLoginWith(
                  iconImage: const AssetImage('assets/images/ic_facebook.png'),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                ButtonLoginWith(
                  iconImage: const AssetImage('assets/images/ic_google.png'),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                ButtonLoginWith(
                  iconImage: const AssetImage('assets/images/ic_instagram.png'),
                  onPressed: () {},
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