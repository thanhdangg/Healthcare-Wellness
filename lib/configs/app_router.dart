import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/screens/home/home_page.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/sign_up/sign_up_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:healthcare_wellness/screens/welcome/welcome_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/splash'),
        AutoRoute(page: HomeRoute.page, path: '/', initial: true),
        AutoRoute(page: WelcomeRoute.page, path: '/welcome'),
        AutoRoute(page: SignInRoute.page, path: '/sign_in'),
        AutoRoute(page: SignUpRoute.page),
      ];
}
