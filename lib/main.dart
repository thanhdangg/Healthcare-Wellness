import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/sign_in/sign_in_page.dart';
import 'package:healthcare_wellness/screens/sign_up/sign_up_page.dart';
import 'package:healthcare_wellness/screens/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<String> getInitialRoute() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   final bool isFirstLaunch = pref.getBool('isFirstLaunch') ?? true;

  //   if (isFirstLaunch) {
  //     pref.setBool('isFirstLaunch', false);
  //   return '/';
  //   } else {
  //     return '/sign_in';
  //   }
  // }
  Future<Widget> getLandingPage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool isFirstLaunch = pref.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      pref.setBool('isFirstLaunch', false);
      return const SplashPage();
    } else {
      return  SignUpPage();
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
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: MaterialApp.router(
  //       routerConfig: AppRouter.router,
  //       theme: ThemeData(
  //         primarySwatch: Colors.blue,
  //       ),
  //       darkTheme: ThemeData(
  //         primarySwatch: Colors.blue,
  //         brightness: Brightness.dark,
  //       ),
  //       builder: (context, child) => FutureBuilder<Widget>(
  //         future: getLandingPage(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             return snapshot.data!;
  //           } else {
  //             return const SplashPage();
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }
  //  @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<String>(
  //     future: getInitialRoute(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         return MaterialApp.router(
  //           routerConfig: AppRouter.router(initialRoute: snapshot.data!),
  //           theme: ThemeData(
  //             primarySwatch: Colors.blue,
  //           ),
  //           darkTheme: ThemeData(
  //             primarySwatch: Colors.blue,
  //             brightness: Brightness.dark,
  //           ),
  //         );
  //       } else {
  //         return const MaterialApp(
  //           home: SplashPage(),
  //         );
  //       }
  //     },
  //   );
  // }
  // @override
// Widget build(BuildContext context) {
//   return FutureBuilder<String>(
//     future: getInitialRoute(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.done) {
//         // Ensure we have a valid route before attempting to render the router
//         if (snapshot.hasData && snapshot.data != null) {
//           return MaterialApp.router(
//             routerConfig: AppRouter.router(initialRoute: snapshot.data!),
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             darkTheme: ThemeData(
//               primarySwatch: Colors.blue,
//               brightness: Brightness.dark,
//             ),
//           );
//         } else {
//           // Handle the case where snapshot.data is null or the future failed
//           return const MaterialApp(
//             home: Scaffold(
//               body: Center(child: Text('Error: Invalid initial route')),
//             ),
//           );
//         }
//       } else {
//         // Show a loading indicator while waiting for the future to complete
//         return const MaterialApp(
//           home: Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           ),
//         );
//       }
//     },
//   );
// }
// }
