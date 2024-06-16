import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_reminder_updated/root/History/screens/history_screen.dart';
import 'package:task_reminder_updated/root/home/screens/nav_screen.dart';
import '../root/details/screen/task_details_screen.dart';
import '../root/home/screens/home_screen.dart';


abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'nav',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const NavScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'history',
        path: '/history',
        builder: (BuildContext context, GoRouterState state) {
          return const HistoryScreen();
        },
      ),
      GoRoute(
        name: 'add_task',
        path: '/addTask',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'details',
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
             return const NavScreen();
          //return  DetailScreen(task: Tas,);
        },
      ),
    ],
  );
}
