import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors/colors.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';

class PillSchedulePage extends StatelessWidget {
  const PillSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'График приема',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.check),
                        backgroundColor: mainColor,
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: const Divider(
                        color: Colors.grey,
                        height: 30,
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        backgroundColor: Color(0xFF1DDE7D),
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: const Divider(
                        color: Colors.grey,
                        height: 30,
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '3',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        backgroundColor: Color(0xFFCBDEFA),
                        radius: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('medication')),
                Expanded(child: Text('schedule')),
                Expanded(child: Text('views')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
