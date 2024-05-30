import 'package:flutter/material.dart';
import '../models/country_preference_model.dart';

/// A provider class for the CountryPreferenceScreen.
///
/// This provider manages the state of the CountryPreferenceScreen, including the
/// current countryPreferenceModelObj

class CountryPreferenceProvider extends ChangeNotifier {
  CountryPreferenceModel countryPreferenceModelObj = CountryPreferenceModel();

  @override
  void dispose() {
    super.dispose();

  }
}
