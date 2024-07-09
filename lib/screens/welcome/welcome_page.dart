import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/configs/app_font.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/welcome/widgets/infor_frame_view.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  static const int numPages = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(
      () {
        setState(
          () {
            _currentPageIndex = _pageController.page!.round();
          },
        );
      },
    );
  }

  void _navToSignIn() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }

  void _onNext() {
    if (_currentPageIndex <= numPages) {
      setState(() {
        _currentPageIndex++;
      });
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _navToSignIn();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 20, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 8,
                    width: 160,
                    child: LinearProgressIndicator(
                      value: ((_currentPageIndex + 1) / numPages),
                      backgroundColor:
                          AppColors.backgroundLinearProgressIndicator,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.backgroundColor,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _navToSignIn,
                    child: Text(
                      'Skip',
                      style: AppFont.body_text_bold.copyWith(
                        color: AppColors.textLogoColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      InforFrameView(
                        imagePath: 'assets/images/img_welcome_second.png',
                        title: 'Personalize Your Health with Smart AI.',
                        description:
                            'Achieve your wellness goals with our AI-powered platform to your unique needs.',
                        onNext: _onNext,
                        onSkip: _navToSignIn,
                      ),
                      InforFrameView(
                        imagePath: 'assets/images/img_welcome_third.png',
                        title: 'Your Intelligent Fitness Companion.',
                        description:
                            'Track your calory & fitness nutrition with AI and get special recommendations.',
                        onNext: _onNext,
                        onSkip: _navToSignIn,
                      ),
                      InforFrameView(
                        imagePath: 'assets/images/img_welcome_fourth.png',
                        title: 'Emphatic AI Wellness Chatbot For All.',
                        description:
                            'Experience compassionate and personalized care with our AI chatbot.',
                        onNext: _onNext,
                        onSkip: _navToSignIn,
                      ),
                      InforFrameView(
                        imagePath: 'assets/images/img_welcome_fifth.png',
                        title: 'Intuitive Nutrition & Med Tracker with AI',
                        description:
                            'Easily track your medication & nutrition with the power of AI.',
                        onNext: _onNext,
                        onSkip: _navToSignIn,
                      ),
                      InforFrameView(
                        imagePath: 'assets/images/img_welcome_sixth.png',
                        title: 'Helpful Resources &  Community.',
                        description:
                            'Join a community of 5,000+ users dedicating to healthy life with AI/ML.',
                        onNext: _onNext,
                        onSkip: _navToSignIn,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: _onNext,
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
      ),
    );
  }
}
