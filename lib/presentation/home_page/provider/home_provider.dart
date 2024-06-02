import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config.dart';
import '../../open_page_screen/open_page_screen.dart';
import '../models/home_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  ApiService _apiService = ApiService();
  List<UserModel> _users = [];
  bool _isLoading = true;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;

  HomeProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      _isLoading = true;
      notifyListeners();

      // List<int> userIds = await _apiService.getUsers();
      // List<UserModel> userList = [];
      List<int> userIds = await _apiService.getUsers();
      print('Fetched User IDs: $userIds');

      List<UserModel> userList = [];

      for (int userId in userIds) {
        UserModel user = await _apiService.getUserProfile(userId);
        userList.add(user);
      }

      _users = userList;
      print('Fetched Users: $_users');
    } catch (e) {
      print('Error in fetchUsers: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// class  ApiService  {
//   final String getUsersUrl = userRoute;
//   final String getProfileUrl = getprofileRoute;

//   Future<List<int>> getUsers() async {
//  var sharedPref = await SharedPreferences.getInstance();
//     var uId = sharedPref.getInt(OpenPageScreenState.uId);
//     print('uId: $uId');
    
//     var body={'uId':'$uId'};
//     print('$body');
    
//     final response = await http.post(
//       Uri.parse(getUsersUrl),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(body)
//     );
//     // if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       List<int> userIds = List<int>.from(data['msg']);
//   print(userIds);
//       return userIds;
//     // } else {
//     //   throw Exception('Failed to load user IDs');
//     // }
//   }
//   Future<UserModel> getUserProfile(int userId) async {
//     final response = await http.post(
//       Uri.parse(getProfileUrl),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode({"uId": userId}),
//     );
//     print('hdu');
//     // if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//     print('${data['msg']['msg']}');
//       UserModel user = UserModel.fromJson(data['msg']['msg']);
//       print('khushal $user');
//       return user;
//     // } else {
//     //   throw Exception('Failed to load user profile');
//     // }
//   }
// }


class ApiService {
  final String getUsersUrl = userRoute;
  final String getProfileUrl = getprofileRoute;

  Future<List<int>> getUsers() async {
    var sharedPref = await SharedPreferences.getInstance();
    var uId = sharedPref.getInt(OpenPageScreenState.uId);
    print('uId: $uId');

    var body = {'uId': '$uId'};
    print('Request Body: $body');

    try {
      final response = await http.post(
        Uri.parse(getUsersUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<int> userIds = List<int>.from(data['msg']);
        print('User IDs: $userIds');
        return userIds;
      } else {
        print('Failed to load user IDs: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      print('Error in getUsers: $e');
      return [];
    }
  }

  Future<UserModel> getUserProfile(int userId) async {
    try {
      final response = await http.post(
        Uri.parse(getProfileUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"uId": userId}),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UserModel user = UserModel.fromJson(data['msg']['msg']);
        print('User fetched: $user');
        return user;
      } else {
        print('Failed to load user profile: ${response.reasonPhrase}');
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      print('Error in getUserProfile: $e');
      throw e;
    }
  }
}