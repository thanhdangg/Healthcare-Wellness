import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_router.dart';

@RoutePage()
class MainTabbarPage extends StatefulWidget {
  const MainTabbarPage({super.key});

  @override
  State<MainTabbarPage> createState() => _MainTabbarPageState();
}

class _MainTabbarPageState extends State<MainTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
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
      bottomNavigationBuilder: (context, router) {
        final tabsRouter = AutoTabsRouter.of(context);
        return BottomNavigationBar(
          selectedItemColor: const Color(0xff858585),
          unselectedItemColor: const Color(0xff595959),
          backgroundColor: Colors.black.withOpacity(0.84),
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
              label: 'Saved',
              icon: Icon(Icons.bookmark_border),
              activeIcon: Icon(Icons.bookmark),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
