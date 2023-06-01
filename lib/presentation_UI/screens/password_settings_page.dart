import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordSettingsPage extends StatefulWidget {
  const PasswordSettingsPage({Key? key}) : super(key: key);

  @override
  _PasswordSettingsPageState createState() => _PasswordSettingsPageState();
}

class _PasswordSettingsPageState extends State<PasswordSettingsPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: _oldPasswordController.text.trim(),
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(_newPasswordController.text.trim());
        // Password changed successfully, show success message or navigate to another page
      }
    } catch (e) {
      // Handle error, display error message
      print('Error changing password: $e');
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: const InputDecoration(
                labelText: 'Old Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
