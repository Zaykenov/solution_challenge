import 'package:flutter/material.dart';

import '../widgets/bottomBarWidget.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Map<String, String> medicalData = {
    'Heart Rate': '',
    'Oxygen Saturation': '',
    'Weight': '',
    'Temperature': '',
    // Add more medical indicators here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Statistics',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF6F6F6),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Med.Indicators",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: MedicalIndicatorContainer(
                    size: 1,
                    icon: 'assets/images/Heart.png',
                    title: 'Heart Rate',
                    data: medicalData['Heart Rate']!,
                    onAddData: () {
                      _showAddDataDialog('Heart Rate');
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MedicalIndicatorContainer(
                    size: 0.7,
                    icon: 'assets/images/oxygen.png',
                    title: 'Oxygen Saturation',
                    data: medicalData['Oxygen Saturation']!,
                    onAddData: () {
                      _showAddDataDialog('Oxygen Saturation');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      MedicalIndicatorContainer(
                        size: 0.6,
                        icon: 'assets/images/weight.png',
                        title: 'Weight',
                        data: medicalData['Weight']!,
                        onAddData: () {
                          _showAddDataDialog('Weight');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      MedicalIndicatorContainer(
                        size: 0.8,
                        icon: 'assets/images/temperature.png',
                        title: 'Temperature',
                        data: medicalData['Temperature']!,
                        onAddData: () {
                          _showAddDataDialog('Temperature');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Physical/Emotional State",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RoundedBottomNavigationBar(),
    );
  }

  void _showAddDataDialog(String indicatorName) {
    String inputData = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: TextField(
            onChanged: (value) {
              inputData = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  medicalData[indicatorName] = inputData;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class MedicalIndicatorContainer extends StatelessWidget {
  final String icon;
  final String title;
  final String data;
  final VoidCallback onAddData;
  final double size;

  const MedicalIndicatorContainer({
    required this.icon,
    required this.title,
    required this.data,
    required this.onAddData,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 210 * size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            icon,
            // width: 80,
            // height: 80,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(data),
          ElevatedButton(
            onPressed: onAddData,
            child: Text('Add Data'),
          ),
        ],
      ),
    );
  }
}
