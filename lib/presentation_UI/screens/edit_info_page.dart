import 'package:flutter/material.dart';

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
        title: Text(
          'Edit profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedTextField(
                label: 'Full Name',
                controller: fullNameController,
              ),
              SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Label',
                controller: labelController,
              ),
              SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Phone Number',
                controller: phoneNumberController,
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: RoundedTextField(
                      label: 'Country',
                      controller: countryController,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: RoundedTextField(
                      label: 'Gender',
                      controller: genderController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              RoundedTextField(
                label: 'Address',
                controller: addressController,
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform action on button press
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 24.0),
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
