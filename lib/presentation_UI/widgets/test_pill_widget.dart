import 'package:flutter/material.dart';

class TestPillWidget extends StatelessWidget {
  final String title;
  final String activity;
  final String date;
  const TestPillWidget(
      {Key? key,
      required this.title,
      required this.activity,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
      title: Text(activity),
      subtitle: Text(date),
    );
  }
}

class BlankTest extends StatelessWidget {
  const BlankTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.grey,
      onTap: () {},
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffECECED), width: 1),
        borderRadius: BorderRadius.circular(30),
        // side: BorderSide(color: Colors.black),
      ),
      leading: CircleAvatar(
        backgroundColor: Color(0xff0404151A).withOpacity(0.1),
        child: Container(
          child: Icon(
            Icons.add,
            size: 20,
            color: Color(0xff7D7D85),
          ),
        ),
      ),
      title: Text(
        'Blood Test',
        style: TextStyle(color: Color(0xff7D7D85)),
      ),
      subtitle: Text(
        '25.05.2022',
        style: TextStyle(
          color: Color(0xff7D7D85),
        ),
      ),
    );
  }
}

class BlanKPill extends StatelessWidget {
  const BlanKPill({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.grey,
      onTap: () {},
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffECECED), width: 1),
        borderRadius: BorderRadius.circular(30),
        // side: BorderSide(color: Colors.black),
      ),
      leading: CircleAvatar(
        backgroundColor: Color(0xff0404151A).withOpacity(0.1),
        child: Container(
          child: Icon(
            Icons.add,
            size: 20,
            color: Color(0xff7D7D85),
          ),
        ),
      ),
      title: Text(
        'Blood Test',
        style: TextStyle(color: Color(0xff7D7D85)),
      ),
      subtitle: Text(
        '25.05.2022',
        style: TextStyle(
          color: Color(0xff7D7D85),
        ),
      ),
    );
  }
}
