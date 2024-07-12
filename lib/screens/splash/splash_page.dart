import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_wellness/screens/splash/widgets/splash.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

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
      const Duration(milliseconds: 100),
      (timer) {
        if (mounted) {
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
        }
      },
    );
  }

  void _startSplashPageTimer() {
    _timer = Timer.periodic(
        const Duration(
          seconds: 4,
        ), (timer) {
      if (_currentPageIndex < 3) {
        setState(() {
          _currentPageIndex++;
        });
      } else {
        timer.cancel();
        context.go('/get_started');
      }
    });

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          _startLoading();
        }
      },
    );
  }

  void _startLoading() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
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
              duration: const Duration(seconds: 1),
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
