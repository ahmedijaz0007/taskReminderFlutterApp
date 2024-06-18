import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_reminder_updated/root/History/screens/history_screen.dart';
import 'package:task_reminder_updated/root/home/screens/nav_screen.dart';
import 'package:task_reminder_updated/root/home/screens/splash_screen.dart';
import '../root/home/screens/home_screen.dart';


abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  SplashScreen();
        },
      ),
      GoRoute(
        name: 'nav',
        path: '/nav',
        builder: (BuildContext context, GoRouterState state) {
          return  const NavScreen();
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
