import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_signup_login_page1_signup/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../open_page_screen/open_page_screen.dart';
import '../models/my_profile_model.dart';

class MyProfileProvider extends ChangeNotifier {
  MyProfileModel? myProfileModelObj;
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProfile(String userId) async {
    isLoading = true;
    notifyListeners();

    try {
      myProfileModelObj = await ApiService().fetchProfile(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to load profile';
      myProfileModelObj = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class ApiService  {
  final String baseUrl = url;

  Future<MyProfileModel> fetchProfile(String userId) async {
    var sharedPref =await SharedPreferences.getInstance();
    var uId=sharedPref.getInt(OpenPageScreenState.uId);

    // User ID stored in uId variable from cache memory;
    var body={
      "uId":uId
    };
  // body goes with API to transfer data from app to node server

    var response =await http.post(
        Uri.parse(getprofileRoute),
        headers: {
          "content-type":"application/json"
        },
        body: jsonEncode(body));
    var resp=jsonDecode(response.body);
    if (response.statusCode == 200) {
      return MyProfileModel.fromJson(resp['msg']);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
