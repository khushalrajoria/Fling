import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/core/app_export.dart';
import '../models/friends_list_model.dart';
class FriendsItemWidget extends StatelessWidget {
  final FriendsListModel friendsItemModelObj;

  FriendsItemWidget(this.friendsItemModelObj, {Key? key}) : super(key: key);

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
            imagePath: friendsItemModelObj.Pic,
            height: 169.v,
            width: 148.h,
          ),
          Text(
            friendsItemModelObj.fullname,
            style: CustomTextStyles.titleSmallblakeA700,
          )
        ],
      ),
    );
  }
}
