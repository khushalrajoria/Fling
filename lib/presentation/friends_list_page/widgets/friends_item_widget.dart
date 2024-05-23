import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/friends_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FriendsItemWidget extends StatelessWidget {
  FriendsItemWidget(this.friendsItemModelObj, {Key? key})
      : super(
          key: key,
        );

  FriendsItemModel friendsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      decoration: AppDecoration.fillRed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.v),
          CustomImageView(
            imagePath: friendsItemModelObj.naziaOne!,
            height: 169.v,
            width: 148.h,
          ),
          Text(
            friendsItemModelObj.naziaTwo!,
            style: CustomTextStyles.titleSmallWhiteA700,
          )
        ],
      ),
    );
  }
}
