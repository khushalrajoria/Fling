// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
// import '../models/country_preference_model.dart';

// /// A provider class for the CountryPreferenceScreen.
// ///
// /// This provider manages the state of the CountryPreferenceScreen, including the
// /// current countryPreferenceModelObj

// class CountryPreferenceProvider extends ChangeNotifier {
//   CountryPreferenceModel countryPreferenceModelObj = CountryPreferenceModel();

//   @override
//   void dispose() {
//     super.dispose();
//   }
//   CountryPreferenceModel get countryPreferenceModelObj => _countryPreferenceModel;
//    void setSelectedCountry(String? newValue) {
//     _countryPreferenceModel.selectedCountry = newValue;
//     notifyListeners();
//   }
//   onSelected(dynamic value) {
//     for (var element in countryPreferenceModelObj.dropdownItemList) {
//       element.isSelected = false;
//       if (element.id == value.id) {
//         element.isSelected = true;
//       }
//     }
//     notifyListeners();
//   }
// }
