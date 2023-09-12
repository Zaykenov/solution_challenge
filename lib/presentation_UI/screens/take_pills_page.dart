import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/widgets/selector_appbar.dart';

class TakePillsPage extends StatefulWidget {
  const TakePillsPage({Key? key}) : super(key: key);

  @override
  _TakePillsPageState createState() => _TakePillsPageState();
}

class _TakePillsPageState extends State<TakePillsPage> {
  DateTime _selectedDate = DateTime.now();

  final List<Pill> _pillList = [
    Pill('Paracetamol', isTaken: false),
    Pill('Aciclovir', isTaken: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SelectorAppBar(),
      ),
      body: buildPillList(),
    );
  }

  Widget buildDateSelector() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (context, index) {
        final date = DateTime.now().add(Duration(days: index));
        final isSelected = _selectedDate.year == date.year &&
            _selectedDate.month == date.month &&
            _selectedDate.day == date.day;

        final isToday = DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            width: 56,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                if (isToday)
                  Container(
                    width: 56,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPillList() {
    return ListView.builder(
      itemCount: _pillList.length,
      itemBuilder: (context, index) {
        final pill = _pillList[index];
        final isHighlighted = pill.isTaken;

        return ListTile(
          title: Text(
            pill.name,
            style: TextStyle(
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          tileColor: isHighlighted ? Colors.yellow : null,
        );
      },
    );
  }
}

class Pill {
  final String name;
  final bool isTaken;

  Pill(this.name, {this.isTaken = false});
}
