import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              const Text(
                'Common',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ListTile(
            title: const Text(
              'General Notifications',
              style: TextStyle(fontSize: 14),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: const Text(
              'Sound',
              style: TextStyle(fontSize: 14),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: const Text(
              'Vibrate',
              style: TextStyle(fontSize: 14),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          const Divider(),
          const SizedBox(height: 12.0),
          const Text(
            'System & services update',
            style: TextStyle(fontSize: 20),
          ),
          ListTile(
            title: const Text(
              'App Updates',
              style: TextStyle(fontSize: 14),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          const Divider(),
          const SizedBox(height: 12.0),
          const Text(
            'Others',
            style: TextStyle(fontSize: 20),
          ),
          ListTile(
            title: const Text(
              'New Services Available',
              style: TextStyle(fontSize: 14),
            ),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
        ],
      ),
    );
  }
}
