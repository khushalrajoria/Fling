import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/gender_provider.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GenderScreenState createState() => GenderScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GenderProvider(),
      child: GenderScreen(),
    );
  }
}

class GenderScreenState extends State<GenderScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black900,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 38.v),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "msg_add_more_about_your".tr,
                style: CustomTextStyles.titleLargeBold,
              ),
              SizedBox(height: 53.v),
              Divider(),
              SizedBox(height: 9.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "lbl_intersex_woman".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Divider(),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "lbl_trans_woman".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Divider(),
              SizedBox(height: 9.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "lbl_transfeminine".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Divider(),
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "msg_woman_nonbinary".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 19.v),
              Divider(),
              SizedBox(height: 12.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text(
                    "lbl_ciswoman".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 21.v),
              Divider(),
              SizedBox(height: 3.v)
            ],
          ),
        ),
        bottomNavigationBar: _buildSaveAndCloseButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveAndCloseButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_save_and_close".tr,
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 19.v,
      ),
      buttonStyle: CustomButtonStyles.fillRed,
      onPressed: () {
        onTapSaveAndCloseButton(context);
      },
    );
  }

  /// Navigates to the genderDetailsScreen when the action is triggered.
  onTapSaveAndCloseButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.genderDetailsScreen,
    );
  }
}
