import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_challenge/presentation_UI/widgets/selector_appbar.dart';
import 'package:solution_challenge/presentation_UI/widgets/test_pill_widget.dart';

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
    'Blood Pressure': ''
  };
  double _currentMentalState = 50;
  double _currentPhysicalState = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SelectorAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Med.Indicators",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MedicalIndicatorContainer(
                        heart: true,
                        size: 0.237,
                        icon: 'assets/svg/heart_rate.svg',
                        title: 'Heart Rate',
                        data: medicalData['Heart Rate']!,
                        onAddData: () {
                          _showAddDataDialog('Heart Rate');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MedicalIndicatorContainer(
                        heart: false,
                        size: 0.09,
                        icon: 'assets/svg/weight.svg',
                        title: 'Weight',
                        data: medicalData['Weight']!,
                        onAddData: () {
                          _showAddDataDialog('Weight');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MedicalIndicatorContainer(
                        heart: false,
                        size: 0.113,
                        icon: 'assets/svg/oxygen_saturation.svg',
                        title: 'Oxygen Saturation',
                        data: medicalData['Oxygen Saturation']!,
                        onAddData: () {
                          _showAddDataDialog('Oxygen Saturation');
                        },
                      ),
                      SizedBox(height: 10),
                      MedicalIndicatorContainer(
                        heart: false,
                        size: 0.113,
                        icon: 'assets/svg/pressure.svg',
                        title: 'Blood Pressure',
                        data: medicalData['Blood Pressure']!,
                        onAddData: () {
                          _showAddDataDialog('Blood Pressure');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MedicalIndicatorContainer(
                        heart: false,
                        size: 0.09,
                        icon: 'assets/svg/temperature.svg',
                        title: 'Temperature',
                        data: medicalData['Temperature']!,
                        onAddData: () {
                          _showAddDataDialog('Temperature');
                        },
                      ),
                    ],
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
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                // height: MediaQuery.of(context).size.height / 5,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.sports_gymnastics,
                            color: Color(0xff327CED),
                            size: 30,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor:
                                  Color(0xff327CED).withOpacity(0.35),
                              inactiveTrackColor: Colors.transparent,
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 25.0,
                              thumbColor: Color(0xff327CED),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayColor: Colors.red.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                            ),
                            child: Slider(
                              value: _currentPhysicalState,
                              max: 100,
                              divisions: 5,
                              label: _currentPhysicalState.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentPhysicalState = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.heart_broken,
                            color: Color(0xffF15223),
                            size: 30,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor:
                                  Color(0xffF15223).withOpacity(0.35),
                              inactiveTrackColor: Colors.transparent,
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 25.0,
                              thumbColor: Color(0xffF15223),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayColor: Colors.red.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                            ),
                            child: Slider(
                              value: _currentMentalState,
                              max: 100,
                              divisions: 5,
                              label: _currentMentalState.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentMentalState = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      // SvgPicture.asset(
                      //   'assets/svg/mental_state.svg',
                      //   // height: 60,
                      //   // width: 60,
                      //   colorFilter: ColorFilter.mode(
                      //     Colors.green,
                      //     BlendMode.srcIn,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Tests",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  ListTile(
                    splashColor: Colors.grey,
                    onTap: () {},
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      // side: BorderSide(color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      // minRadius: 300,
                      // minRadius: 50,
                      backgroundColor: Color(0xff7D7D85).withOpacity(0.1),
                      child: Container(
                        child: Text(
                          '25.05',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    title: Text('Blood Test'),
                    subtitle: Text('25.05.2022'),
                  ),
                  SizedBox(height: 10),
                  TestPillWidget(title: '25.05', activity: 'HIV Test', date: '35.30.30'),
                  SizedBox(height: 10),
              BlankTest()
                ],
              ),
            ],
          ),
        ),
      ),
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
            keyboardType: TextInputType.datetime,
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
  final bool heart;

  const MedicalIndicatorContainer({
    required this.icon,
    required this.title,
    required this.data,
    required this.onAddData,
    required this.size,
    required this.heart,
  });

  Color _getIndicatorColor(String indicator, String value) {
    if (value.isEmpty) {
      return Colors.black; // Default color when no value is provided
    }

    if (indicator == 'Heart Rate') {
      final int heartRate = int.tryParse(value) ?? 0;
      if (heartRate < 60) {
        return Colors.red; // Very low
      } else if (heartRate >= 60 && heartRate <= 100) {
        return Colors.green; // Normal
      } else {
        return Colors.yellow; // Low
      }
    } else if (indicator == 'Oxygen Saturation') {
      final int oxygenSaturation = int.tryParse(value) ?? 0;
      if (oxygenSaturation < 95) {
        return Colors.red; // Very low
      } else if (oxygenSaturation >= 95 && oxygenSaturation <= 100) {
        return Colors.green; // Normal
      } else {
        return Colors.yellow; // Low
      }
    } else if (indicator == 'Weight') {
      final double weight = double.tryParse(value) ?? 0.0;
      if (weight <= 0) {
        return Colors.red; // Very low
      } else {
        return Colors.green; // Normal
      }
    } else if (indicator == 'Temperature') {
      final double temperature = double.tryParse(value) ?? 0.0;
      if (temperature < 36.5 || temperature > 37.5) {
        return Colors.red; // Very low or very high
      } else {
        return Colors.green; // Normal
      }
    } else if (indicator == 'Blood Pressure') {
      final List<int> values =
          value.split('/').map((val) => int.tryParse(val.trim()) ?? 0).toList();
      final int systolic = values.length > 0 ? values[0] : 0;
      final int diastolic = values.length > 1 ? values[1] : 0;

      if (systolic < 90 || systolic > 120 || diastolic < 60 || diastolic > 80) {
        return Colors.red; // Very low or very high
      } else {
        return Colors.green; // Normal
      }
    }

    return Colors.red; // Default to red for unknown indicators
  }

  @override
  Widget build(BuildContext context) {
    final Color indicatorColor = _getIndicatorColor(title, data);
    final Color svgColor = data.isNotEmpty ? indicatorColor : Colors.black;

    return heart
        ? Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
                data.isEmpty
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffECECED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: onAddData,
                        child: Text(
                          'Add Data',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Text(
                              data,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'BPM',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff000000).withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                SvgPicture.asset(
                  'assets/svg/heart_rate_graph.svg',
                  colorFilter: data.isEmpty
                      ? ColorFilter.mode(Color(0xff82828A), BlendMode.srcIn)
                      : ColorFilter.mode(svgColor, BlendMode.srcIn),
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
              ],
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: 80,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
                data.isEmpty
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffECECED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: onAddData,
                        child: Text(
                          'Add Data',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : GestureDetector(
                        onTap: onAddData,
                        child: Container(
                          child: Text(
                            data,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
  }
}
