import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_screen.dart';
import 'details_screen.dart';
import 'profile_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        name: 'details',
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
          return DetailsScreen();
        },
      ),
      GoRoute(
        name: 'profile',
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return ProfileScreen();
        },
      ),
    ],
  );
}
