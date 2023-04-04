import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/widgets/drugScheduleWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrugScheduleWidget(),
          ],
        ),
      ),
    );
  }
}
