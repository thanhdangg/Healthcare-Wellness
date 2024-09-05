import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_event.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_state.dart';
import 'package:healthcare_wellness/utils/enums.dart';
import 'package:healthcare_wellness/utils/widgets/custom_button.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpBloc(context: context);
      },
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(false);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final SignUpBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<SignUpBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    _obscureText.value = !_obscureText.value;
    setState(() {});
  }

  void onSignUp(BuildContext context) {
    context.router.push(const SignInRoute());
  }

  void onLogin(BuildContext context) {
    context.router.popAndPush(const MainTabbarRoute());
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
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (BuildContext context, SignUpState state) {
          if (state.status == BlocStateStatus.success) {
            context.router.replace(HomeRoute(title: "Welcome Lan"));
          }
          if (state.status == BlocStateStatus.failed) {
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
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/img_logo.png'),
                        const SizedBox(height: 20.0),
                        const Text(
                          "Sign Up For Free!",
                          style: AppFont.heading_extra_bold,
                        ),
                        const SizedBox(height: 20.0),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email Address',
                            style: AppFont.body_text_bold,
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your email address...',
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: AppFont.body_text_bold,
                          ),
                        ),
                        ValueListenableBuilder<bool>(
                          builder: (context, bool obscureText, Widget? child) {
                            debugPrint("=======On Changed=====");
                            return TextFormField(
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
                              obscureText: obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                            );
                          },
                          valueListenable: _obscureText,
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
                              // context.go('/forgot_password');
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Sign In',
                            onPressed: () {
                              if (_validInput()) {
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                // checkLogin(email, password);
                                _bloc.add(OnSignUp(email: email, password: password));
                              } else {
                                // show error
                              }
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        // ButtonLoginWith(
                        //   iconImage: const AssetImage('assets/images/ic_facebook.png'),
                        //   onPressed: () {},
                        // ),
                        // const SizedBox(width: 20),
                        // ButtonLoginWith(
                        //   iconImage: const AssetImage('assets/images/ic_google.png'),
                        //   onPressed: () {},
                        // ),
                        // const SizedBox(width: 20),
                        // ButtonLoginWith(
                        //   iconImage: const AssetImage('assets/images/ic_instagram.png'),
                        //   onPressed: () {},
                        // ),
                        // ],
                        // ),
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
                                recognizer: TapGestureRecognizer()..onTap = () => onSignUp(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state.status == BlocStateStatus.loading)
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  bool _validInput() {
    return true;
  }
}
