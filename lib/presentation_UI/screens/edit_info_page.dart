import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/models/user_model.dart';

class EditInfoPage extends StatefulWidget {
  @override
  State<EditInfoPage> createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> sendDataToFirestore(UserModel user) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String userId = currentUser.uid;

        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('users');
        DocumentReference documentReference = usersCollection.doc(userId);

        Map<String, dynamic> userData = user.toMap();
        userData['userId'] = userId; // Add user ID to the data

        await documentReference.set(userData);

        print('Data sent to Firestore successfully');
      } else {
        print('User is not authenticated');
      }
    } catch (error) {
      print('Error sending data to Firestore: $error');
    }
  }

  void handleSubmit() {
    UserModel user = UserModel(
      fullName: fullNameController.text,
      label: labelController.text,
      phoneNumber: phoneNumberController.text,
      country: countryController.text,
      gender: genderController.text,
      address: addressController.text,
    );

    sendDataToFirestore(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedTextField(
                label: 'Full Name',
                controller: fullNameController,
              ),
              const SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Label',
                controller: labelController,
              ),
              const SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Phone Number',
                controller: phoneNumberController,
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: RoundedTextField(
                      label: 'Country',
                      controller: countryController,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: RoundedTextField(
                      label: 'Gender',
                      controller: genderController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Address',
                controller: addressController,
              ),
              ElevatedButton(
                onPressed: handleSubmit,
                child: const Text('Submit'),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const RoundedTextField(
      {Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
