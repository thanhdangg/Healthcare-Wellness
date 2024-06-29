import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'dart:async';

import 'package:healthcare_wellness/presentation/screens/home_page.dart';
import 'package:healthcare_wellness/presentation/widgets/splash_page/splash_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  late Timer _timer;
  double _progressValue = 0.0;
  double _SplashPageOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startSplashPageTimer();
    _fadeInSplashPage();
  }

  void _fadeInSplashPage() {
    Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        setState(
          () {
            if (_SplashPageOpacity < 1.0) {
              _SplashPageOpacity += 0.1;
            } else {
              _SplashPageOpacity = 1.0;
              timer.cancel();
            }
          },
        );
      },
    );
  }

  void _startSplashPageTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_currentPageIndex < 3) {
        setState(() {
          _currentPageIndex++;
        });
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const HomePage(
              title: "Home",
            ),
          ),
        );
      }
    });

    Future.delayed(
      Duration(seconds: 2),
      () {
        _startLoading();
      },
    );
  }

  void _startLoading() {
    _timer = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        setState(
          () {
            if (_progressValue < 0.99) {
              _progressValue += 0.02;
            } else {
              _progressValue = 1.0;
              timer.cancel();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(
          4,
          (index) {
            return AnimatedOpacity(
              opacity: _currentPageIndex == index ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: index == 0
                  ? Opacity(
                      opacity: _SplashPageOpacity.clamp(0.0, 1.0),
                      child: buildPage(index, _progressValue),
                    )
                  : buildPage(index, _progressValue),
            );
          },
        ),
      ),
    );
  }
}
