import 'package:graphql_flutter/graphql_flutter.dart';

class Doctors {
  final int id;
  final String name;
  final String description;
  final String image;
  final String email;
  final List<Appointment> appointments;

  Doctors({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.email,
    required this.appointments,
  });
}

class Appointment {
  final int id;
  final String user_mail;
  final String doctors_email;
  final String day_month_year;
  final String time;
  final String end_time;
  final int doctor_id;

  Appointment({
    required this.id,
    required this.user_mail,
    required this.doctors_email,
    required this.day_month_year,
    required this.time,
    required this.end_time,
    required this.doctor_id,
  });
}
