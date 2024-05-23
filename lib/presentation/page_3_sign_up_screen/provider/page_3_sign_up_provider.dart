import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/page_3_sign_up_model.dart';

/// A provider class for the Page3SignUpScreen.
///
/// This provider manages the state of the Page3SignUpScreen, including the
/// current page3SignUpModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Page3SignUpProvider extends ChangeNotifier {
  Page3SignUpModel page3SignUpModelObj = Page3SignUpModel();

  @override
  void dispose() {
    super.dispose();
  }
}
