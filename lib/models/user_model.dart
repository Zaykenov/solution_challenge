class UserModel {
  // final String uId;
  final String? fullName;
  final String? label;
  final String? phoneNumber;
  final String? country;
  final String? gender;
  final String? address;
  final String? docURL;
  final String? avatarURL;
  final String? userMail;

  UserModel({
    // required this.uId,
    this.fullName,
    this.label,
    this.phoneNumber,
    this.country,
    this.gender,
    this.address,
    this.docURL,
    this.avatarURL,
    this.userMail,
  });
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'label': label,
      'phoneNumber': phoneNumber,
      'country': country,
      'gender': gender,
      'address': address,
      'docURL': docURL,
      'avatarURL': avatarURL,
      'userMail' : userMail,
    };
  }
}
