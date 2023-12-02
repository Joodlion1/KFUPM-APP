import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kfupm/features/auth/screens/custom_profile_screen.dart';
import 'package:kfupm/features/auth/screens/custom_sign_in_screen.dart';
import 'package:kfupm/features/bus/bus_schedule_screen.dart';
import 'package:kfupm/features/events/screens/event_details_screen.dart';
import 'package:kfupm/features/events/screens/events_screen.dart';
import 'package:kfupm/features/home/home_screen.dart';
import 'package:kfupm/features/home/welcome_screen.dart';
import 'package:kfupm/features/id_card/id_card_screen.dart';
import 'package:kfupm/utilities_screens/contact_screan.dart';
import 'package:kfupm/utilities_screens/map_screen.dart';
import 'package:kfupm/utilities_screens/more_screen.dart';
import 'package:kfupm/routing/go_router_refresh_stream.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorWelcomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorEventsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorScheduleKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorMoreKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

enum AppRoute {
  signIn,
  welcome,
  gpa,
  bus,
  profile,
  events,
  event,
  more,
  map,
  schedule,
  contact,
  id,
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    return GoRouter(
      initialLocation: '/sign-in',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        final isLoggedIn = firebaseAuth.currentUser != null;
        if (isLoggedIn) {
          if (state.uri.path == '/sign-in') {
            return '/welcome';
          }
        } else {
          if (state.uri.path.startsWith('/home')) {
            return '/sign-in';
          }
        }
        return null;
      },
      refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
      routes: [
        GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomeScreen(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorWelcomeKey,
              routes: [
                GoRoute(
                  path: '/welcome',
                  name: AppRoute.welcome.name,
                  builder: (context, state) => const WelcomeScreen(),
                  routes: [
                    GoRoute(
                      path: 'profile',
                      name: AppRoute.profile.name,
                      builder: (context, state) => const CustomProfileScreen(),
                    ),
                    GoRoute(
                      path: 'bus',
                      name: AppRoute.bus.name,
                      builder: (context, state) => const BusScheduleScreen(),
                    ),
                    GoRoute(
                      path: 'gpa',
                      name: AppRoute.gpa.name,
                      builder: (context, state) => const CustomProfileScreen(),
                    ),
                    GoRoute(
                      path: 'id',
                      name: AppRoute.id.name,
                      builder: (context, state) => const StudentIDScreen(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorEventsKey,
              routes: [
                GoRoute(
                  path: '/events',
                  name: AppRoute.events.name,
                  builder: (context, state) => const EventsScreen(),
                  routes: [
                    GoRoute(
                      path: 'event',
                      name: AppRoute.event.name,
                      builder: (context, state) => const EventDetailsScreen(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorScheduleKey,
              routes: [
                GoRoute(
                  path: '/schedule',
                  name: AppRoute.schedule.name,
                  builder: (context, state) => const WelcomeScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorMoreKey,
              routes: [
                GoRoute(
                  path: '/more',
                  name: AppRoute.more.name,
                  builder: (context, state) => const MoreScreen(),
                  routes: [
                    GoRoute(
                      path: 'map',
                      name: AppRoute.map.name,
                      builder: (context, state) => const MapScreen(),
                    ),
                    GoRoute(
                      path: 'contact',
                      name: AppRoute.contact.name,
                      builder: (context, state) => const ContctScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
