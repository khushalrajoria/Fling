import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../country_preference_screen/country_preference_screen.dart';
import 'models/guidelines_model.dart';
import 'provider/guidelines_provider.dart';

class GuidelinesScreen extends StatefulWidget {
  const GuidelinesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GuidelinesScreenState createState() => GuidelinesScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GuidelinesProvider(),
      child: GuidelinesScreen(),
    );
  }
}

class GuidelinesScreenState extends State<GuidelinesScreen> {
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
          padding: EdgeInsets.symmetric(
            horizontal: 11.h,
            vertical: 39.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "msg_community_guidelines".tr,
                  style: CustomTextStyles.titleLargeBold,
                ),
              ),
              SizedBox(height: 26.v),
              Container(
                width: 288.h,
                margin: EdgeInsets.only(
                  left: 5.h,
                  right: 43.h,
                ),
                child: Text(
                  "msg_when_uploading_photos".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleLarge20,
                ),
              ),
              SizedBox(height: 33.v),
              Container(
                width: 324.h,
                margin: EdgeInsets.only(right: 12.h),
                child: Text(
                  "msg_your_photos_must".tr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleLarge20,
                ),
              ),
              SizedBox(height: 23.v),
              CustomElevatedButton(
                text: "lbl_i_agree".tr,
                margin: EdgeInsets.only(
                  left: 11.h,
                  right: 28.h,
                ),
                buttonStyle: CustomButtonStyles.fillRed,
                onPressed: () {
                 onTapNextButton(context);
                }
              ),
              SizedBox(height: 2.v)
            ],
          ),
        ),
      ),
    );
  }


  /// Navigates to the genderPreferenceScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.genderPreferenceScreen,
    // );
    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CountryPreferenceScreen()),
);
  }

}