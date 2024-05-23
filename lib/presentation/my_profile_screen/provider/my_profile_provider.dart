import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/my_profile_model.dart';

/// A provider class for the MyProfileScreen.
///
/// This provider manages the state of the MyProfileScreen, including the
/// current myProfileModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MyProfileProvider extends ChangeNotifier {
  MyProfileModel myProfileModelObj = MyProfileModel();

  @override
  void dispose() {
    super.dispose();
  }
}
