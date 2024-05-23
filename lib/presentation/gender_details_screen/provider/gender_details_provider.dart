import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/gender_details_model.dart';

/// A provider class for the GenderDetailsScreen.
///
/// This provider manages the state of the GenderDetailsScreen, including the
/// current genderDetailsModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GenderDetailsProvider extends ChangeNotifier {
  TextEditingController genderDetailsManValueOneController =
      TextEditingController();

  TextEditingController genderDetailsWomanValueOneController =
      TextEditingController();

  TextEditingController genderDetailsNonBinaryValueController =
      TextEditingController();

  GenderDetailsModel genderDetailsModelObj = GenderDetailsModel();

  @override
  void dispose() {
    super.dispose();
    genderDetailsManValueOneController.dispose();
    genderDetailsWomanValueOneController.dispose();
    genderDetailsNonBinaryValueController.dispose();
  }
}
