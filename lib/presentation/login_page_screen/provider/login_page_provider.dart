import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/login_page_model.dart';

/// A provider class for the LoginPageScreen.
///
/// This provider manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginPageProvider extends ChangeNotifier {
  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  LoginPageModel loginPageModelObj = LoginPageModel();

  @override
  void dispose() {
    super.dispose();
    emailFieldController.dispose();
    passwordFieldController.dispose();
  }
}
