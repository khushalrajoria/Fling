import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config.dart';
import '../../open_page_screen/open_page_screen.dart';
import '../models/my_profile_model.dart';

// class MyProfileProvider extends ChangeNotifier {
//   MyProfileModel? myProfileModelObj;
//   bool isLoading = false;
//   String? errorMessage;

//   Future<void> fetchProfile() async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       myProfileModelObj = await ApiService().fetchProfile();
//       errorMessage = null;
//     } catch (e) {
//       errorMessage = 'Failed to load profile: $e';
//       myProfileModelObj = null;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

// class ApiService {
//   Future<MyProfileModel> fetchProfile() async {
//     var sharedPref = await SharedPreferences.getInstance();
//     var uId = sharedPref.getInt(OpenPageScreenState.uId);
//     print('uId: $uId');

//     if (uId == null) {
//       throw Exception('User ID not found in shared preferences');
//     }

//     var body = {
//       "uId": uId
//     };

//     var response = await http.post(
//       Uri.parse(getprofileRoute),
//       headers: {
//         "Content-Type": "application/json"
//       },
//       body: jsonEncode(body)
//     );

//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     if (response.statusCode == 200) {
//       var resp = jsonDecode(response.body);
//       return MyProfileModel.fromJson(resp['msg']);
//     } else {
//       throw Exception('Failed to load profile with status code: ${response.statusCode}');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../config.dart';
// import '../models/my_profile_model.dart';

class MyProfileProvider extends ChangeNotifier {
  MyProfileModel? myProfileModelObj;
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      myProfileModelObj = await ApiService().fetchProfile();
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to load profile: $e';
      myProfileModelObj = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class ApiService {
  Future<MyProfileModel> fetchProfile() async {
    var sharedPref = await SharedPreferences.getInstance();
    var uId = sharedPref.getInt(OpenPageScreenState.uId);
    print('uId: $uId');

    if (uId == null) {
      throw Exception('User ID not found in shared preferences');
    }

    var body = {
      "uId": uId
    };

    var response = await http.post(
      Uri.parse(getprofileRoute),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(body)
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var resp = jsonDecode(response.body);
      return MyProfileModel.fromJson(resp['msg']['msg']);
    } else {
      throw Exception('Failed to load profile with status code: ${response.statusCode}');
    }
  }
}
