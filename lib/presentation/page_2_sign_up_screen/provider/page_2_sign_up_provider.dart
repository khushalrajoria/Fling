import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/page_2_sign_up_model.dart';

/// A provider class for the Page2SignUpScreen.
///
/// This provider manages the state of the Page2SignUpScreen, including the
/// current page2SignUpModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Page2SignUpProvider extends ChangeNotifier {
  TextEditingController snapchatidoneController = TextEditingController();

  TextEditingController instagramidoneController = TextEditingController();

  Page2SignUpModel page2SignUpModelObj = Page2SignUpModel();

  @override
  void dispose() {
    super.dispose();
    snapchatidoneController.dispose();
    instagramidoneController.dispose();
  }
}
