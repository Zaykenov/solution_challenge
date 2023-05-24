class UserModel {
  // final String uId;
  final String fullName;
  final String label;
  final String phoneNumber;
  final String country;
  final String gender;
  final String address;

  UserModel({
    // required this.uId,
    required this.fullName,
    required this.label,
    required this.phoneNumber,
    required this.country,
    required this.gender,
    required this.address,
  });
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'label': label,
      'phoneNumber': phoneNumber,
      'country': country,
      'gender': gender,
      'address': address
    };
  }
}
