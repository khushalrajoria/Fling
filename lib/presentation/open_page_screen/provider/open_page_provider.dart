import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/open_page_model.dart';

/// A provider class for the OpenPageScreen.
///
/// This provider manages the state of the OpenPageScreen, including the
/// current openPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OpenPageProvider extends ChangeNotifier {
  OpenPageModel openPageModelObj = OpenPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
