class Appointment {
  int? id;
  String? userMail;
  String? doctorMail;
  String? dayMonthYear;
  String time; // Updated type to DateTime
  String? endTime;
  int? doctorId;

  Appointment({
    this.id,
    this.userMail,
    this.doctorMail,
    this.dayMonthYear,
    required this.time,
    this.endTime,
    this.doctorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userMail': userMail,
      'doctorMail': doctorMail,
      'dayMonthYear': dayMonthYear,
      'time': time, // Convert DateTime to string
      'endTime': endTime,
      'doctorId': doctorId,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      userMail: map['userMail'],
      doctorMail: map['doctorMail'],
      dayMonthYear: map['dayMonthYear'],
      time: map['time'], // Parse string to DateTime
      endTime: map['endTime'],
      doctorId: map['doctorId'],
    );
  }
}