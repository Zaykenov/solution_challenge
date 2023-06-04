class NewAppointment {
  final String? doctorsMail;
  final String? userMail;
  final String? dayMonthYear;
  final String? time;
  final String? endTime;

  NewAppointment({
    this.doctorsMail,
    this.userMail,
    this.dayMonthYear,
    this.time,
    this.endTime,
  });

  factory NewAppointment.fromMap(Map<String, dynamic> map) {
    return NewAppointment(
      doctorsMail: map['doctors_mail'],
      userMail: map['user_mail'],
      dayMonthYear: map['day_month_year'],
      time: map['time'],
      endTime: map['end_time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctors_mail': doctorsMail,
      'user_mail': userMail,
      'day_month_year': dayMonthYear,
      'time': time,
      'end_time': endTime,
    };
  }
}
