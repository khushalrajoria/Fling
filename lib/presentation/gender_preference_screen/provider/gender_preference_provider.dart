import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/gender_preference_model.dart';

/// A provider class for the GenderPreferenceScreen.
///
/// This provider manages the state of the GenderPreferenceScreen, including the
/// current genderPreferenceModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GenderPreferenceProvider extends ChangeNotifier {
  TextEditingController genderController = TextEditingController();

  TextEditingController manvalueOneController = TextEditingController();

  TextEditingController womanvalueOneController = TextEditingController();

  GenderPreferenceModel genderPreferenceModelObj = GenderPreferenceModel();

  @override
  void dispose() {
    super.dispose();
    genderController.dispose();
    manvalueOneController.dispose();
    womanvalueOneController.dispose();
  }
}
