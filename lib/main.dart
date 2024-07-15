import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  // Future<Widget> getLandingPage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  //   if (isFirstTime) {
  //     prefs.setBool('isFirstTime', false);
  //     return const SplashPage();
  //   } else {
  //     return const HomePage(
  //       title: "Home Page",
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "My App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
