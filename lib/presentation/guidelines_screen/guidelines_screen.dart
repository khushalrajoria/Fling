import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../country_preference_screen/country_preference_screen.dart';
import '../country_preference_screen/provider/country_preference_provider.dart';
import 'provider/guidelines_provider.dart';
import 'dart:io';

class GuidelinesScreen extends StatefulWidget {
  // const GuidelinesScreen({Key? key})
  //     : super(
  //         key: key,
  //       );

  final String email;
  final String password;
  final String fullName;
  final String dateOfBirth;
  final String country;
  final String gender;
  final String maingender;
  final String snapId;
  final String instaId;
  final File? imageFile;
  final File? imageFile1;
  final File? imageFile2;

  GuidelinesScreen({
    required this.email,
    required this.password,
    required this.fullName,
    required this.dateOfBirth,
    required this.country,
    required this.maingender,
    required this.gender,
    required this.snapId,
    required this.instaId,
    required this.imageFile,
    required this.imageFile1,
    required this.imageFile2,
  });

  @override
  GuidelinesScreenState createState() => GuidelinesScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GuidelinesProvider(),
      child: GuidelinesScreen(
        email: '',
        password: '',
        fullName: '',
        dateOfBirth: '',
        country: '',
        maingender: '', 
        gender: '',
        snapId: '',
        instaId: '',
        imageFile1: null,
        imageFile2: null,
        imageFile: null,
      ),
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
    Navigator.of(context).push(
      MaterialPageRoute(
         builder: (context) => ChangeNotifierProvider<CountryPreferenceProvider>(
           create: (context) => CountryPreferenceProvider(),
        child: CountryPreferenceScreen(
              email: widget.email,
              password: widget.password,
              fullName: widget.fullName,
              dateOfBirth: widget.dateOfBirth,
              country: widget.country,
              gender: widget.gender,
              maingender: widget.maingender,
              snapId: widget.snapId,
              instaId: widget.instaId,
              imageFile: widget.imageFile,
              imageFile1: widget.imageFile1,
              imageFile2: widget.imageFile2,
            ),
      ),)
    );
  }

}