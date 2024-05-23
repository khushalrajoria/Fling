import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/user_profile_model.dart';

/// A provider class for the UserProfileScreen.
///
/// This provider manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserProfileProvider extends ChangeNotifier {
  UserProfileModel userProfileModelObj = UserProfileModel();

  @override
  void dispose() {
    super.dispose();
  }
}
