// class MyProfileModel {
//   final String name;
//   final String email;
//   final String gender;
//   final String prefgender;
//   final String preferredgender;
//   final String maingender;
//   final String dob;
//   final String country;
//   final String prefcountry;
//   final String instaID;
//   final String snapID;
//   final String genderPreference;

//   MyProfileModel({
//     required this.name,
//     required this.email,
//     required this.gender,
//     required this.prefgender,
//     required this.preferredgender,
//     required this.maingender,
//     required this.dob,
//     required this.instaID,
//     required this.snapID,
//     required this.country,
//     required this.prefcountry,
//     required this.genderPreference,
//   });

//   factory MyProfileModel.fromJson(Map<String, dynamic> json) {
//     return MyProfileModel(
//       name: json['fullName'],
//       email: json['dateOfBirth'],
//       gender: json['gender'],
//       prefgender: json['prefGender'],
//       preferredgender: json['prefGender'],
//       instaID: json['instaId'],
//       snapID: json['snapchatId'],
//       maingender: json['maingender'],
//       dob: json['dob'],
//       country: json['country'],
//       prefcountry: json['preferredCountry'],
//       genderPreference: json['genderPreference'],
//     );
//   }
// }

class MyProfileModel {
  final String name;
  final String email;
  final String gender;
  final String prefgender;
  final String preferredgender;
  final String maingender;
  final String dob;
  final String country;
  final String prefcountry;
  final String instaID;
  final String snapID;
  final String genderPreference;

  MyProfileModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.prefgender,
    required this.preferredgender,
    required this.maingender,
    required this.dob,
    required this.instaID,
    required this.snapID,
    required this.country,
    required this.prefcountry,
    required this.genderPreference,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      name: json['fullname'] ?? '',
      email: json['dateofbirth'] ?? '',
      gender: json['gender'] ?? '',
      prefgender: json['prefgender'] ?? '',
      preferredgender: json['preferredgender'] ?? '',
      maingender: json['maingender'] ?? '',
      dob: json['dateofbirth'] ?? '',
      instaID: json['instaid'] ?? '',
      snapID: json['snapchatid'] ?? '',
      country: json['country'] ?? '',
      prefcountry: json['preferredcountry'] ?? '',
      genderPreference: json['preferredgender'] ?? '',
    );
  }
}

