import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/selectButton.dart';

class AccesabilityPage extends StatefulWidget {
  const AccesabilityPage({Key? key}) : super(key: key);

  @override
  State<AccesabilityPage> createState() => _AccesabilityPageState();
}

class _AccesabilityPageState extends State<AccesabilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Accesability',
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
                'Suggested',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          CustomSelectButton(
            title: 'English (UK)',
            onPressed: () {
              // Add your logic here
            },
          ),
          CustomSelectButton(
            title: 'English (UK)',
            onPressed: () {
              // Add your logic here
            },
          ),
          const Divider(),
          const SizedBox(height: 12.0),
          const Text(
            'Others',
            style: TextStyle(fontSize: 20),
          ),
          ListTile(
            title: const Text(
              'To be coming soon...',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mode for Visually Impaired',
                style: TextStyle(fontSize: 14),
              ),
              CupertinoSwitch(
                value: false,
                onChanged: (bool value) {},
                activeColor: Colors.blue, // Set the activeColor to blue
              ),
            ],
          ),
        ],
      ),
    );
  }
}
