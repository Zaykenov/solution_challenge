import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_challenge/presentation_UI/screens/accesability_page.dart';
import 'package:solution_challenge/presentation_UI/screens/account_settings_page.dart';
import 'package:solution_challenge/presentation_UI/screens/addPill.dart';
import 'package:solution_challenge/presentation_UI/screens/addTest.dart';
import 'package:solution_challenge/presentation_UI/screens/edit_info_page.dart';
import 'package:solution_challenge/presentation_UI/screens/interests_page.dart';
import 'package:solution_challenge/presentation_UI/screens/notifications_settings.dart';
import 'package:solution_challenge/presentation_UI/screens/map_page.dart';
import 'package:solution_challenge/presentation_UI/screens/information_page.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/drugsearch_page.dart';
import 'package:solution_challenge/presentation_UI/screens/pillSchedule.dart';
import 'package:solution_challenge/presentation_UI/screens/profile_page.dart';
import 'package:solution_challenge/presentation_UI/screens/registration_page.dart';
import 'package:solution_challenge/presentation_UI/screens/statistics_page.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
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
      navigatorKey: navigatorKey,
      title: 'Solution Challenge',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primaryColor: mainColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/interestsPage',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MapPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/info': (context) => const InformationPage(),
        '/drugSearch': (context) => const DrugSearchPage(),
        '/pillSchedule': (context) => const PillSchedulePage(),
        '/statistics': (context) => const StatisticsPage(),
        '/registration': (context) => const RegistrationPage(),
        '/accountSettings': (context) => const AccountSettingsPage(),
        '/editInfo': (context) => EditInfoPage(),
        '/profilePage': (context) => ProfilePage(),
        '/interestsPage': (context) => const InterestsPage(),
        '/notificationsSettingsPage': (context) =>
            const NotificationsSettingsPage(),
        '/accesabilityPage': (context) => AccesabilityPage(),
        '/addPillPage': (context) => AddPillPage(),
        '/addTestPage': (context) => AddTestPage(),
      },
    );
  }
}
