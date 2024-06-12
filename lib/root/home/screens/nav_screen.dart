


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../History/screens/history_screen.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget{
  const NavScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavScreenState();
}


class _NavScreenState extends State<NavScreen>{
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ahmed Ijaz'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'History',
          ),

        ],
      ),
    );
  }
}
