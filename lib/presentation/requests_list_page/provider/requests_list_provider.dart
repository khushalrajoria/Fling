import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../open_page_screen/open_page_screen.dart';
import '../models/requests_list_model.dart';
import '../../../config.dart'; // Adjust this import as needed

class HomeProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<RequestsListItem> _users = [];
  bool _isLoading = true;
  int _gemCount = 0;

  List<RequestsListItem> get users => _users;
  bool get isLoading => _isLoading;
  int get gemCount => _gemCount;

  HomeProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      _isLoading = true;
      notifyListeners();

      List<int> userIds = await _apiService.getUsers();
      print('Fetched User IDs: $userIds');

      List<RequestsListItem> userList = [];

      for (int userId in userIds) {
        RequestsListItem user = (await _apiService.getUserProfile(userId)) as RequestsListItem;
        userList.add(user);
        print('Fetched User Profile: $user');
      }

      _users = userList;
      _gemCount = userList.isNotEmpty ? userList.first.gemCount : 0;
      print('Fetched Users: $_users');
    } catch (e) {
      print('Error in fetchUsers: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class ApiService {
  final String getUsersUrl = getRequest;
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

  Future<RequestsListItem> getUserProfile(int userId) async {
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
        RequestsListItem user = RequestsListItem.fromJson(data['msg']['msg']);
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
