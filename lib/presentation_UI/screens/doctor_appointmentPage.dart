import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:solution_challenge/custompaint/dotted_line.dart';
import 'package:solution_challenge/models/appintment_model.dart';
import 'package:solution_challenge/models/new_appointment_model.dart';

class DoctorAppointmentPage extends StatefulWidget {
  const DoctorAppointmentPage({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentPage> createState() => _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends State<DoctorAppointmentPage> {
  DateTime _selectedDate = DateTime.now();
  late FirebaseAuth _auth;
  User? _currentUser;

  List<String> _morningTimeSlots = [
    '9:00',
    '10:00',
    '11:00',
  ];
  List<String> _afternoonTimeSlots = [
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
  ];
  String _selectedTimeSlot = '';
  TextEditingController _notesController = TextEditingController();
  List<DateTime> _busyTimeSlots = [];
  bool _isLoadingSend = false;

  @override
  void initState() {
    super.initState();
    _fetchReservedTimeSlots();
    _auth = FirebaseAuth.instance;
    _currentUser = _auth.currentUser;
  }

  void _fetchReservedTimeSlots() async {
    final HttpLink httpLink = HttpLink(
      'https://d006-37-99-49-141.ngrok-free.app/query',
      // defaultHeaders: {'ngrok-skip-browser-warning': '1'},
    );
    final GraphQLClient client =
        GraphQLClient(link: httpLink, cache: GraphQLCache());

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String selectedDate =
        formatter.format(_selectedDate); 

    final QueryOptions options = QueryOptions(
      document: gql('''
      {
        find_reserved_time_slots(
          doctors_mail: "a.serikbayevv@gmail.com",
          day_month_year: "$selectedDate" 
        ) {
          _id
          doctor_id
          user_mail
          doctors_mail
          day_month_year
          time
          end_time
        }
      }
    '''),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print('GraphQL Error: ${result.exception.toString()}');
      return;
    }

    final List<dynamic> reservedTimeSlots =
        result.data?['find_reserved_time_slots'];
    print('Reserved Time Slots: $reservedTimeSlots');

    List<Appointment> appointments =
        reservedTimeSlots.map((map) => Appointment.fromMap(map)).toList();
    List<DateTime> busyTimeSlots = appointments
        .map((appointment) => _getDateTimeFromTimeSlot(appointment.time))
        .toList();

    setState(() {
      _busyTimeSlots = busyTimeSlots;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> availableMorningTimeSlots = _morningTimeSlots
        .where((timeSlot) => !_isTimeSlotBusy(timeSlot, _busyTimeSlots))
        .map((timeSlot) => _getDateTimeFromTimeSlot(timeSlot))
        .toList();

    List<DateTime> availableAfternoonTimeSlots = _afternoonTimeSlots
        .where((timeSlot) => !_isTimeSlotBusy(timeSlot, _busyTimeSlots))
        .map((timeSlot) => _getDateTimeFromTimeSlot(timeSlot))
        .toList();

    // Filter out the selected time slot if it is in the busy time slots
    if (_selectedTimeSlot.isNotEmpty &&
        _isTimeSlotBusy(_selectedTimeSlot, _busyTimeSlots)) {
      _selectedTimeSlot = '';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Doctor Appointment',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                DateTime date = DateTime.now().add(Duration(days: index));
                bool isSelected = _selectedDate.year == date.year &&
                    _selectedDate.month == date.month &&
                    _selectedDate.day == date.day;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                    _fetchReservedTimeSlots();
                  },
                  child: Container(
                    width: 56,
                    height: 85,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xff037EEE) : Color(0xffDCEDF9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${_getDayOfWeek(date)}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Morning',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomPaint(
                        painter: DottedLinePainter(
                          color: Colors.grey,
                          strokeWidth: 1,
                          gapSize: 4,
                          dashSize: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: availableMorningTimeSlots
                    .map((timeSlot) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTimeSlot =
                                    _getTimeSlotFromDateTime(timeSlot);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: _selectedTimeSlot ==
                                        _getTimeSlotFromDateTime(timeSlot)
                                    ? Color(0xff037EEE)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _selectedTimeSlot ==
                                          _getTimeSlotFromDateTime(timeSlot)
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    _getTimeSlotFromDateTime(timeSlot),
                                    style: TextStyle(
                                      color: _selectedTimeSlot ==
                                              _getTimeSlotFromDateTime(timeSlot)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Afternoon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomPaint(
                        painter: DottedLinePainter(
                          color: Colors.grey,
                          strokeWidth: 1,
                          gapSize: 4,
                          dashSize: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: availableAfternoonTimeSlots
                          .sublist(0, availableAfternoonTimeSlots.length ~/ 2)
                          .map((timeSlot) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedTimeSlot =
                                        _getTimeSlotFromDateTime(timeSlot);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _selectedTimeSlot ==
                                            _getTimeSlotFromDateTime(timeSlot)
                                        ? Color(0xff037EEE)
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _selectedTimeSlot ==
                                              _getTimeSlotFromDateTime(timeSlot)
                                          ? Colors.transparent
                                          : Colors.grey,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        _getTimeSlotFromDateTime(timeSlot),
                                        style: TextStyle(
                                          color: _selectedTimeSlot ==
                                                  _getTimeSlotFromDateTime(
                                                      timeSlot)
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: availableAfternoonTimeSlots
                          .sublist(availableAfternoonTimeSlots.length ~/ 2)
                          .map((timeSlot) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedTimeSlot =
                                        _getTimeSlotFromDateTime(timeSlot);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _selectedTimeSlot ==
                                            _getTimeSlotFromDateTime(timeSlot)
                                        ? Color(0xff037EEE)
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _selectedTimeSlot ==
                                              _getTimeSlotFromDateTime(timeSlot)
                                          ? Colors.transparent
                                          : Colors.grey,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        _getTimeSlotFromDateTime(timeSlot),
                                        style: TextStyle(
                                          color: _selectedTimeSlot ==
                                                  _getTimeSlotFromDateTime(
                                                      timeSlot)
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Selected Time Slot:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _selectedTimeSlot,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: _submitAppointment,
                // _submitAppointment,
                // child: _isLoadingSend
                //     ? CircularProgressIndicator()
                //     : Text('Submit Appointment'),
                child: _isLoadingSend
                    ? Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SizedBox(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                          height: 15.0,
                          width: 10.0,
                        ))
                    : Text('Submit Appointment'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDayOfWeek(DateTime date) {
    final DateFormat formatter = DateFormat('EEE');
    final String formatted = formatter.format(date);
    return formatted;
  }

  bool _isTimeSlotBusy(String timeSlot, List<DateTime> busyTimeSlots) {
    String formattedTimeSlot =
        _getTimeSlotFromDateTime(_getDateTimeFromTimeSlot(timeSlot));
    return busyTimeSlots
        .any((slot) => _getTimeSlotFromDateTime(slot) == formattedTimeSlot);
  }

  DateTime _getDateTimeFromTimeSlot(String timeSlot) {
    final DateFormat formatter = DateFormat('HH:mm');
    final DateTime selectedDateTime = formatter.parse(timeSlot);

    return DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      selectedDateTime.hour,
      selectedDateTime.minute,
    );
  }

  String _getTimeSlotFromDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  void _submitAppointment() async {
    setState(() {
      _isLoadingSend = true;
    });
    DateTime selectedTime = DateFormat('HH:mm').parse(_selectedTimeSlot);
    DateTime endTime = selectedTime.add(Duration(hours: 1));
    String formattedEndTime = DateFormat('HH:mm').format(endTime);

    NewAppointment appointment = NewAppointment(
      userMail: _currentUser!.email,
      doctorsMail: 'a.serikbayevv@gmail.com',
      dayMonthYear: DateFormat('yyyy-MM-dd').format(_selectedDate),
      time: _selectedTimeSlot + ":00+06:00",
      endTime: formattedEndTime + ":00+06:00",
    );

    final HttpLink httpLink = HttpLink(
      'https://d006-37-99-49-141.ngrok-free.app/query',
      // defaultHeaders: {'ngrok-skip-browser-warning': '1'},
    );
    final GraphQLClient client =
        GraphQLClient(link: httpLink, cache: GraphQLCache());

    final MutationOptions options = MutationOptions(
      document: gql('''
          mutation CreateAppointment(\$input: NewAppointment!) {
        createAppointment(input: \$input) {
          _id
          doctor_id
          user_mail
          doctors_mail
          day_month_year
          time
          end_time
        }
      }
    '''),
      variables: {'input': appointment.toMap()},
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print('GraphQL Error: ${result.exception.toString()}');
      return;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Appointment Created"),
          );
        });

    setState(() {
      _selectedTimeSlot = '';
      _notesController.clear();
      _isLoadingSend = false;
    });
  }
}
