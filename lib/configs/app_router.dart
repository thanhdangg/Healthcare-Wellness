import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/screens/home/home_page.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:healthcare_wellness/screens/welcome/welcome_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: WelcomeRoute.page, path: '/welcome'),
        AutoRoute(page: SignInRoute.page, path: '/sign_in'),
      ];
}
