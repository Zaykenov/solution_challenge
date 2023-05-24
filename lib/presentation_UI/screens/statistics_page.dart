import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'statistics',
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
                  child: Container(
                    width: 150,
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/Heart.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/oxygen.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/pressure.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/weight.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/temperature.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Physical/Emptional State",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
