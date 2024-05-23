import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart'; 

class CountryPreferenceModel {
  List<String>? dropdownItemList;
  String? selectedCountry;

  CountryPreferenceModel({this.dropdownItemList, this.selectedCountry});
}