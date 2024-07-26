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
