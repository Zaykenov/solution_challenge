import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/information_page.dart';
import 'package:solution_challenge/presentation_UI/screens/login_page.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/drugsearch_page.dart';
import 'package:solution_challenge/presentation_UI/screens/pillSchedule.dart';
import 'package:solution_challenge/presentation_UI/screens/statistics_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solution Challenge',
      theme: ThemeData(
        primaryColor: mainColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/pillSchedule',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/info': (context) => const InformationPage(),
        '/drugSearch': (context) => const DrugSearchPage(),
        '/pillSchedule': (context) => const PillSchedulePage(),
        '/statistics': (context) => const StatisticsPage(),
      },
    );
  }
}
