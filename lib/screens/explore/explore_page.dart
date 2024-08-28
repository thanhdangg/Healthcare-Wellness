import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcare_wellness/configs/app_router.dart';

@RoutePage()
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          context.router.push(const SignUpRoute());
        },
        child: const Center(
          child: Text('ExplorePage'),
        ),
      ),
    );
  }
}
