import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/page_1_sign_up_model.dart';

/// A provider class for the Page1SignUpScreen.
///
/// This provider manages the state of the Page1SignUpScreen, including the
/// current page1SignUpModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Page1SignUpProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  Page1SignUpModel page1SignUpModelObj = Page1SignUpModel();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    dateController.dispose();
    countryController.dispose();
  }
}
