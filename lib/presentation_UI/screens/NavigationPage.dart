import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/interests_page.dart';
import 'package:solution_challenge/presentation_UI/screens/profile_page.dart';
import 'package:solution_challenge/presentation_UI/screens/statistics_page.dart';
import 'package:solution_challenge/presentation_UI/screens/take_pills_page.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _index = 1;

  final options = [
    TakePillsPage(),
    const StatisticsPage(),
    InterestsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(
      // title: 'Test App',
      // backButton: true,
      // ),
      body: Center(
        child: options.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
            label: 'Health & Wellness',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _index,
        onTap: _onTapped,
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
