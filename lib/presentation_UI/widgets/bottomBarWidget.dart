import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/profile_page.dart';
import '../../my_flutter_app_icons.dart';
import '../screens/interests_page.dart';
import '../screens/pillSchedule.dart';
import '../screens/statistics_page.dart';

class RoundedBottomNavigationBar extends StatefulWidget {
  const RoundedBottomNavigationBar();

  @override
  State<RoundedBottomNavigationBar> createState() =>
      _RoundedBottomNavigationBarState();
}

class _RoundedBottomNavigationBarState
    extends State<RoundedBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    PillSchedulePage(),
    StatisticsPage(),
    InterestsPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _pages[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          elevation: 0,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.chart_bar),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.heart),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
