import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_reminder_updated/root/home/screens/nav_screen.dart';
import 'package:task_reminder_updated/utilities/ui_utils.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
                context.pushReplacement('/nav')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(UiUtils.getImagePath("splash.png",isCommon: true)),
    );
  }
}