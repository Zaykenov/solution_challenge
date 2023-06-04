import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/take_pills_page.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/presentation_UI/widgets/buttonWidget.dart';

class AddPillPage extends StatefulWidget {
  const AddPillPage({Key? key}) : super(key: key);

  @override
  _AddPillPageState createState() => _AddPillPageState();
}

class _AddPillPageState extends State<AddPillPage> {
  String _selectedType = 'Type 1'; // Default selected type
  // TimeOfDay? _selectedTime;
  List<TimeOfDay> _selectedTimes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Pill',
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
                      hintText: 'Search Pill',
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
                    height: 20,
                  ),
                  Text(
                    'Type',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 320,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue!;
                        });
                      },
                      items: <String>[
                        'Type 1',
                        'Type 2',
                        'Type 3',
                        // Add more types as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      dropdownColor: Colors.grey[200],
                      underline: SizedBox(),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'How often',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 320,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue!;
                        });
                      },
                      items: <String>[
                        'Type 1',
                        'Type 2',
                        'Type 3',
                        // Add more types as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      dropdownColor: Colors.grey[200],
                      underline: SizedBox(),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Reminder',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          children: _selectedTimes.asMap().entries.map((entry) {
                            final index = entry.key;
                            final time = entry.value;
                            return Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${time.format(context)}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _selectedTimes.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          spacing: 10,
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () async {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              setState(() {
                                _selectedTimes.add(selectedTime);
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: CircleBorder(),
                            padding: const EdgeInsets.all(16),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 210,
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
