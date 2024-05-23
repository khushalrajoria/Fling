import '../../../core/app_export.dart';

/// This class is used in the [friends_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FriendsItemModel {
  FriendsItemModel({this.naziaOne, this.naziaTwo, this.id}) {
    naziaOne = naziaOne ?? ImageConstant.img1;
    naziaTwo = naziaTwo ?? "Nazia";
    id = id ?? "";
  }

  String? naziaOne;

  String? naziaTwo;

  String? id;
}
