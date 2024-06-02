
class MyProfileModel {
  final String name;
  final String email;
  final String gender;
  final String prefgender;
  final String preferredgender;
  final String maingender;
  final String dob;
  final int gemcount;
  final String country;
  final String prefcountry;
  final String instaID;
  final String snapID;
  final String genderPreference;
  final String profilePic;

  MyProfileModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.prefgender,
    required this.gemcount,
    required this.preferredgender,
    required this.maingender,
    required this.dob,
    required this.instaID,
    required this.snapID,
    required this.profilePic,
    required this.country,
    required this.prefcountry,
    required this.genderPreference,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      name: json['fullname'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      prefgender: json['prefgender'] ?? '',
      preferredgender: json['preferredgender'] ?? '',
      maingender: json['maingender'] ?? '',
      dob: json['dateofbirth'] ?? '',
      gemcount: json['gemcount'] ?? '',
      instaID: json['instaid'] ?? '',
      snapID: json['snapchatid'] ?? '',
      profilePic: json['imageFile164'] ?? '',
      country: json['country'] ?? '',
      prefcountry: json['preferredcountry'] ?? '',
      genderPreference: json['preferredgender'] ?? '',
    );
  }
}

