import 'package:flutter/material.dart';
import 'package:healthcare_wellness/screens/home/home_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> getLandingPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      prefs.setBool('isFirstTime', false);
      return SplashPage(); 
    } else {
      return HomePage(title: "Home Page",); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FutureBuilder<Widget>(
      //   future: getLandingPage(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return snapshot.data!; 
      //     } else {
      //       return SplashPage(); 
      //     }
      //   },
      // ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,      
    );
  }
}
