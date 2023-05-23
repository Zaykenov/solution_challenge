import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_challenge/presentation_UI/screens/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_challenge/presentation_UI/screens/information_page.dart';
import 'package:solution_challenge/presentation_UI/screens/login_page.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/drugsearch_page.dart';
import 'package:solution_challenge/presentation_UI/screens/pillSchedule.dart';
import 'package:solution_challenge/presentation_UI/screens/registration_page.dart';
import 'package:solution_challenge/presentation_UI/screens/statistics_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false; //if null set to false
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solution Challenge verstka',
      theme: ThemeData(
        primaryColor: mainColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>
            seenOnboard == false ? const LoginPage() : const OnBoardingPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/info': (context) => const InformationPage(),
        '/drugSearch': (context) => const DrugSearchPage(),
        '/pillSchedule': (context) => const PillSchedulePage(),
        '/statistics': (context) => const StatisticsPage(),
        '/registration': (context) => const RegistrationPage()
      },
    );
  }
}
