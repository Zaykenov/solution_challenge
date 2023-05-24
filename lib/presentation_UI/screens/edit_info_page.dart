import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/models/user_model.dart';

class EditInfoPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
                onPressed: () {
                  // Create a UserModel instance with the data from the text fields
                  UserModel user = UserModel(
                      fullName: fullNameController.text,
                      label: labelController.text,
                      phoneNumber: phoneNumberController.text,
                      country: countryController.text,
                      gender: genderController.text,
                      address: addressController.text);

                  // Convert UserModel to a map
                  Map<String, dynamic> userData = user.toMap();

                  // Send data to Firestore
                  FirebaseFirestore.instance
                      .collection('users')
                      .add(userData)
                      .then((value) {
                    // Data added successfully
                    print('Data added to Firestore');
                  }).catchError((error) {
                    // Error occurred while adding data
                    print('Error adding data to Firestore: $error');
                  });
                },
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
