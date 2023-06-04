import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:solution_challenge/models/doctors_data.dart';

class DoctorsService {
  static Future<List<Doctors>> fetchData() async {
    HttpLink link = HttpLink("https://d006-37-99-49-141.ngrok-free.app/query");
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );

    QueryResult queryResult = await qlClient.query(
      QueryOptions(
        document: gql(
          """query {
  Doctors{
    _id
    name
    description
    image
    mail
    appointments{
      _id
      user_mail
      doctors_mail
      day_month_year
      time
      end_time
      doctor_id
    }
  }
}""",
        ),
      ),
    );

    if (queryResult.hasException) {
      throw queryResult.exception!;
    }

    List<Doctors> doctors = [];
    for (var doctorData in queryResult.data!['Doctors']) {
      List<Appointment> appointments = [];
      for (var appointmentData in doctorData['appointments']) {
        Appointment appointment = Appointment(
          id: appointmentData['_id'],
          user_mail: appointmentData['user_mail'],
          doctors_email: appointmentData['doctors_mail'],
          day_month_year: appointmentData['day_month_year'],
          time: appointmentData['time'],
          end_time: appointmentData['end_time'],
          doctor_id: appointmentData['doctor_id'],
        );
        appointments.add(appointment);
      }

      Doctors doctor = Doctors(
        id: doctorData['_id'],
        name: doctorData['name'],
        image: doctorData['image'],
        description: doctorData['description'],
        email: doctorData['mail'],
        appointments: appointments,
      );

      doctors.add(doctor);
    }
    return doctors;
  }
}
