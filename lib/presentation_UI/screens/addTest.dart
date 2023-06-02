import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/take_pills_page.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/presentation_UI/widgets/buttonWidget.dart';

class AddTestPage extends StatelessWidget {
  const AddTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Test',
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Blood glucose test',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: '25 августа',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          suffixIcon: Icon(Icons.date_range),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Дата окончания',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          suffixIcon: Icon(Icons.date_range),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On an empty stomach',
                        style: TextStyle(fontSize: 16),
                      ),
                      CupertinoSwitch(
                        value: false,
                        onChanged: (bool value) {},
                        activeColor: Colors.blue, // Set the activeColor to blue
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Test specifications: drug cautions, etc.',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remind me about this test',
                        style: TextStyle(fontSize: 16),
                      ),
                      CupertinoSwitch(
                        value: false,
                        onChanged: (bool value) {},
                        activeColor: Colors.blue, // Set the activeColor to blue
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Add address of the laboratory',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.location_on_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakePillsPage(),
                              ),
                            );
                          },
                          child: ButtonWidget(
                            title: 'Add to Schedule',
                            backgroundColor: mainColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
