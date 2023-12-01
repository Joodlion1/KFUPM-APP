import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/routing/app_router.dart';

const appScreens = [
  WelcomeScreen(),
  WelcomeScreen(),
  WelcomeScreen(),
  WelcomeScreen(),
];

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
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        backgroundColor: Colors.green[100],
        destinations: const [
          // the appearance of each tab is defined with a [NavigationDestination] widget
          NavigationDestination(
            icon: Icon(
              Icons.home,
              size: 40,
              color: Color.fromARGB(255, 15, 68, 17),
            ),
            label: 'home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.calendar_month,
              size: 40,
              color: Color.fromARGB(255, 15, 68, 17),
            ),
            label: 'schedule',
          ),

          NavigationDestination(
              icon: Icon(
                Icons.search,
                size: 40,
                color: Color.fromARGB(255, 15, 68, 17),
              ),
              label: 'search'),
          NavigationDestination(
              icon: Icon(
                Icons.menu,
                size: 40,
                color: Color.fromARGB(255, 15, 68, 17),
              ),
              label: 'more')
        ],
      ),
    );
  }
}

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/kfupm.png",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome ${auth.currentUser!.displayName ?? "Student"}",
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/attendance.png",
                        title: "Darajati Attendance",
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/qr.png",
                        title: "Attendence",
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/grades.png",
                        title: "Darajati Grades",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/calander.png",
                        title: "upcoming activities",
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/gpa.png",
                        title: "GPA Calculater",
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: StudentService(
                        asset: "assets/images/schedule.png",
                        title: "schedule",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StudentService(
                      asset: "assets/images/bus.png",
                      title: "Bus Schedule",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StudentService extends StatelessWidget {
  const StudentService({
    super.key,
    required this.title,
    required this.asset,
    required this.onPressed,
  });
  final String title;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
