import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_router.dart';

@RoutePage()
class MainTabBarPage extends StatefulWidget {
  const MainTabBarPage({super.key});

  @override
  State<MainTabBarPage> createState() => _MainTabBarPageState();
}

class _MainTabBarPageState extends State<MainTabBarPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        const ExploreRoute(),
        const SavedRoute(),
        const UserProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        // alternatively, you could use a global key
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.yellowAccent,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Feed',
                icon: Icon(Icons.feed_outlined),
                activeIcon: Icon(Icons.feed),
              ),
              BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
              ),
              BottomNavigationBarItem(
                label: 'Save',
                icon: Icon(Icons.bookmark_outline),
                activeIcon: Icon(Icons.bookmark),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }
}
