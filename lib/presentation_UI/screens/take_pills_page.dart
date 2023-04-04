import "package:flutter/material.dart";
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class TakePillsPage extends StatefulWidget {
  TakePillsPage({Key? key}) : super(key: key);

  @override
  State<TakePillsPage> createState() => _TakePillsPageState();
}

class _TakePillsPageState extends State<TakePillsPage> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: const Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2019, 2, 10): [
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    _markedDateMap.add(
        DateTime(2019, 2, 25),
        Event(
          date: DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2019, 2, 10),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2019, 2, 11), [
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    final _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: const TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
      headerText: 'Custom Header',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: const TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: const TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon ?? const Icon(Icons.help_outline);
      },
      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.green,
      markedDateMoreShowTotal: true,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("dogshit"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ),
            ],
          ),
        ));
  }
}

class Pill {
  String name;
  bool isTaken;

  Pill(this.name, {this.isTaken = false});
}
