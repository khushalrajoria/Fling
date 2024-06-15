import '../../../core/app_export.dart';
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
