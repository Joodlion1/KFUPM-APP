import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;
  void _goBranch(int index) {
    print(index);
    navigationShell.goBranch(
      index,

      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        elevation: 30,
        indicatorColor: Colors.green[100],
        height: 50,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        backgroundColor: Colors.white,
        destinations: const [
          // the appearance of each tab is defined with a [NavigationDestination] widget
          NavigationDestination(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Color.fromARGB(255, 15, 68, 17),
            ),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.emoji_events_sharp,
              size: 30,
              color: Color.fromARGB(255, 15, 68, 17),
            ),
            label: 'Events',
          ),

          NavigationDestination(
              icon: Icon(
                Icons.calendar_month,
                size: 30,
                color: Color.fromARGB(255, 15, 68, 17),
              ),
              label: 'Calendar'),
          NavigationDestination(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Color.fromARGB(255, 15, 68, 17),
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
