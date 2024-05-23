import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/signup_page_model.dart';

/// A provider class for the SignupPageScreen.
///
/// This provider manages the state of the SignupPageScreen, including the
/// current signupPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignupPageProvider extends ChangeNotifier {
  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  SignupPageModel signupPageModelObj = SignupPageModel();

  bool continueCheckBox = false;

  @override
  void dispose() {
    super.dispose();
    emailFieldController.dispose();
    passwordFieldController.dispose();
  }

  void changeCheckBox(bool value) {
    continueCheckBox = value;
    notifyListeners();
  }
}
