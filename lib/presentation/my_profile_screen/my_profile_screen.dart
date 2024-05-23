import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/image_gallery_screen/image_gallery_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../edit_profile_screen/edit_profile_screen.dart';
import 'provider/my_profile_provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
      child: MyProfileScreen(),
    );
  }
}

class MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 14.v),
            child: Container(
              margin: EdgeInsets.only(
                left: 43.h,
                right: 54.h,
                bottom: 5.v,
              ),
              decoration: AppDecoration.fillGray,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 110.v,
                      width: 111.h,
                      margin: EdgeInsets.only(right: 78.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 110.adaptSize,
                              width: 110.adaptSize,
                              decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(
                                  55.h,
                                ),
                                border: Border.all(
                                  color: appTheme.deepcyanA200,
                                  width: 4.h,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              //  Navigator.of(context).pushNamed(AppRoutes.myImageGalleryScreen);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageGalleryScreen()));
                            },
                            child: CustomImageView(
                              imagePath: ImageConstant.imgWhatsappImage,
                              height: 110.adaptSize,
                              width: 110.adaptSize,
                              radius: BorderRadius.circular(
                                55.h,
                              ),
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "lbl_kirtigourab".tr,
                    style: TextStyle(color: const Color.fromARGB(255, 31, 243, 197),fontFamily: 'Inria Sans',fontSize: 21,fontWeight: FontWeight.w600),

                  ),
                  Text(
                    "msg_kirtigourab_gmail_com".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 37.v),
                  Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_name".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          "lbl_kirti_gourab2".tr,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 6.v),
                          child: Text(
                            "lbl_gender".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 6.v),
                          child: Text(
                            "lbl_male".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      right: 3.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_dob".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          "lbl_2_01_2022".tr,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 34.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      right: 4.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Text(
                            "lbl_country".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Text(
                          "lbl_india".tr,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      right: 3.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_gender_prefrence".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          "lbl_female".tr,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 41.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45.v,
                        width: 44.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.imgImage10,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 14.v,
                          bottom: 11.v,
                        ),
                        child: Text(
                          "lbl_kirtigourab2".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 36.v,
                          width: 29.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              14.h,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstant.imgImage9,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 9.v,
                            bottom: 7.v,
                          ),
                          child: Text(
                            "lbl_kirtimaan89".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 43.v),
                  InkWell(
                    onTap: () {NavigatorService.pushNamed(AppRoutes.loginPageScreen,);},
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_not_you".tr,
                            style:  theme.textTheme.titleMedium,
                          ),
                          TextSpan(
                            text: "lbl_log_out".tr,
                            style: CustomTextStyles.titleMediumcyan200_1,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 6.v),
                  CustomElevatedButton(
                    width: 181.h,
                    text: "msg_delete_my_account".tr,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfileScreen()));

        },
      ),
    ],
    );
  }
}

