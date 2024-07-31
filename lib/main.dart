import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(context: context)),
      ],
      child: MaterialApp.router(
        title: "My App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
