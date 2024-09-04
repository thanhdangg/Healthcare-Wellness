import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/repositories/news_repo.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_bloc.dart';
import 'package:healthcare_wellness/screens/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black));
  setupLocator();
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
  final _appRouter = getIt<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NewsRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc(context: context)),
          BlocProvider<ExploreBloc>(create: (context) => ExploreBloc(context: context)),
        ],
        child: MaterialApp.router(
          title: "My App",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
