/// This class is used in the [productcard_item_widget] screen.

// ignore_for_file: must_be_immutable
class ProductcardItemModel {
  ProductcardItemModel({this.title, this.quantity, this.id}) {
    title = title ?? 99;
    quantity = quantity ?? 1000;
    id = id ?? "1";
  }
double? title;

  int? quantity;

  String? id;
}
