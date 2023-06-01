import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/edit_info_page.dart';
import 'package:solution_challenge/presentation_UI/screens/notifications_settings.dart';
import 'package:solution_challenge/presentation_UI/screens/password_settings_page.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditInfoPage(),
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Your account'),
              subtitle: Text(
                  'See information about your account and edit information'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasswordSettingsPage(),
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Security and account access'),
              subtitle: Text('Manage your account security'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsSettingsPage(),
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notifications'),
              subtitle: Text(
                  'Select the kinds of notifications you get about your health and activities'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.accessibility_new_outlined),
              title: Text('Accessibility, display and languages'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
