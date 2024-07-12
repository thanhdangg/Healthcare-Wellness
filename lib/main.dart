import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/home/home_page.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> getLandingPage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool isFirstLaunch = pref.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      pref.setBool('isFirstLaunch', false);
      return const SplashPage();
    } else {
      return const SignInPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        builder: (context, child) => FutureBuilder<Widget>(
          future: getLandingPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data!;
            } else {
              return const SplashPage();
            }
          },
        ),
      ),
    );
  }
}
