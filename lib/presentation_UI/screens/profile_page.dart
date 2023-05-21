import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/account_settings_page.dart';

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
                ListTile(
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
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings & Privacy"),
                  trailing: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountSettingsPage(),
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: Text("Help Center"),
                  trailing: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Help',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    '8 777 77 77',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                ListTile(
                  title: Text('Log out'),
                  trailing: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'App version 1.0.0',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
