import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_reminder_updated/constants/app_colors.dart';

import '../../../utilities/ui_utils.dart';
import '../../History/screens/history_screen.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Ahmed Ijaz'),
      ),
      body: Container(decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UiUtils.getImagePath("background.png",isCommon:true)),
            fit: BoxFit.cover,
          ),
        ),child:  _screens[_currentIndex],  ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: _currentIndex == 0
                    ? [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 8), // changes position of shadow
                        ),
                      ]
                    : [],
              ),
              child: const Icon(Icons.home_filled),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: _currentIndex == 1
                    ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ]
                    : [],
              ),
              child: const Icon(Icons.calendar_month_rounded),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
