import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:solution_challenge/main.dart';
import 'package:solution_challenge/presentation_UI/screens/account_settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge/presentation_UI/screens/login_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      // backgroundImage: AssetImage('assets'),
                    ),
                    title: Text('Azamat'),
                    subtitle: Text('+7 777 77 77'),
                    trailing: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettingsPage(),
                      ),
                    );
                  },
                  child: const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings & Privacy"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.black,
                    ),
                    title: Text("Help Center"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    'Help',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    '8 777 77 77',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  logoutUser(context);
                },
                child: ListTile(
                  title: Text('Log out'),
                  trailing: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                'App version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> logoutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Access the BuildContext here
      BuildContext context = navigatorKey.currentContext!;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      // ... perform necessary operations with the context
    });
    print('User logged out successfully');
  } catch (error) {
    // Logout failed
    print('Error logging out user: $error');
  }
}
