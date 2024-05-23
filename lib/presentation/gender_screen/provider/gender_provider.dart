import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/gender_model.dart';

/// A provider class for the GenderScreen.
///
/// This provider manages the state of the GenderScreen, including the
/// current genderModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GenderProvider extends ChangeNotifier {
  GenderModel genderModelObj = GenderModel();

  @override
  void dispose() {
    super.dispose();
  }
}
