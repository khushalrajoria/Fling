import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/guidelines_model.dart';

/// A provider class for the GuidelinesScreen.
///
/// This provider manages the state of the GuidelinesScreen, including the
/// current guidelinesModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GuidelinesProvider extends ChangeNotifier {
  GuidelinesModel guidelinesModelObj = GuidelinesModel();

  @override
  void dispose() {
    super.dispose();
  }
}
