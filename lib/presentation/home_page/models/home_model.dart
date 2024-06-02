class UserModel {
  final int userId;
  final String fullname;
  final String dateOfBirth;
  final String country;
  final String gender;
  final String mainGender;
  final String? instaId;
  final String? snapchatId;
  final String Pic;
  final String Pic2;
  final String Pic3;
  final String? preferredCountry;
  final String? preferredGender;
  final String? prefGender;
  late  int gemCount;
  final String email;
  final int age;

  UserModel({
    required this.userId,
    required this.fullname,
    required this.dateOfBirth,
    required this.country,
    required this.gender,
    required this.mainGender,
    this.instaId,
    this.snapchatId,
    required this.Pic,
    required this.Pic2,
    required this.Pic3,
    this.preferredCountry,
    this.preferredGender,
    this.prefGender,
    required this.gemCount,
    required this.email,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userid']?? '',
      fullname: json['fullname']?? '',
      dateOfBirth: json['dateofbirth']?? '',
      country: json['country']?? '',
      gender: json['gender']?? '',
      mainGender: json['maingender']?? '',
      instaId: json['instaid']?? '',
      snapchatId: json['snapchatid']?? '',
      Pic: json['imageFile164']?? '',
      Pic2: json['imagFile264']?? '',
      Pic3: json['imageFile364']?? '',
      preferredCountry: json['preferredcountry']?? '',
      preferredGender: json['preferredgender']?? '',
      prefGender: json['prefgender']?? '',
      gemCount: json['gemcount']?? '',
      email: json['email']?? '',
      age: json['age']?? '',
    );
  }
}