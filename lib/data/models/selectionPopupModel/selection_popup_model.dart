///SelectionPopupModel is common model
///used for setting data into dropdowns

// ignore_for_file: must_be_immutable
class SelectionPopupModel {
  SelectionPopupModel(
      {this.id, required this.title, this.value, this.isSelected = false});

  int? id;

  String title;

  dynamic value;

  bool isSelected;
}
