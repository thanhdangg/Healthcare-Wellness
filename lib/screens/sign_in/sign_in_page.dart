import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcare_wellness/screens/sign_in/widgets/sign_in_frame_view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignInFrameView();
  }
}