import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/my_image_gallery_provider.dart';

class MyImageGalleryScreen extends StatefulWidget {
  const MyImageGalleryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyImageGalleryScreenState createState() => MyImageGalleryScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyImageGalleryProvider(),
      child: MyImageGalleryScreen(),
    );
  }
}

class MyImageGalleryScreenState extends State<MyImageGalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 35.v),
          child: Column(
            children: [
              Text(
                "msg_upload_your_image".tr,
                style: CustomTextStyles.headlineLargeInriaSans,
              ),
              SizedBox(height: 74.v),
              _buildMyImageRow(context),
              SizedBox(height: 5.v)
            ],
          ),
        ),
        bottomNavigationBar: _buildUploadImage(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarTitle(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyImageRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 31.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 357.v,
              width: 297.h,
              decoration: BoxDecoration(
                color: appTheme.gray600,
              ),
            ),
            Container(
              height: 357.v,
              width: 297.h,
              margin: EdgeInsets.only(left: 13.h),
              decoration: BoxDecoration(
                color: appTheme.gray600,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUploadImage(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_upload_image".tr,
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 43.v,
      ),
      buttonStyle: CustomButtonStyles.fillRed,
    );
  }
}
