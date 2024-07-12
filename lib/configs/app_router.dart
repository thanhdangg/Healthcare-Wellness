
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_wellness/screens/home/home_page.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:healthcare_wellness/screens/welcome/welcome_page.dart';
import 'package:healthcare_wellness/screens/welcome/widgets/get_started_frame_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'welcome',
          builder: (BuildContext context, GoRouterState state) {
            return WelcomePage();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage(title: 'Home',);
          },
        ),
        GoRoute(
          path: 'sign_in',
          builder: (BuildContext context, GoRouterState state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: 'get_started',
          builder: (BuildContext context, GoRouterState state) {
            return GetStartedFrameView();
          },
        ),
      ],
    ),
  ],
);
}