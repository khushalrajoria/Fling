import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/user_profile_model.dart';
import 'provider/user_profile_provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileProvider(),
      child: UserProfileScreen(),
    );
  }
}

class UserProfileScreenState extends State<UserProfileScreen> {
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
          child: Container(
            height: 745.v,
            width: 291.h,
            margin: EdgeInsets.only(
              left: 28.h,
              right: 41.h,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 41.v,
                    width: 271.h,
                    margin: EdgeInsets.only(bottom: 261.v),
                    decoration: BoxDecoration(
                      color: appTheme.black400,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(right: 14.h),
                    decoration: AppDecoration.fillGray,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 114.v,
                          width: 110.h,
                          margin: EdgeInsets.only(right: 60.h),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 113.v,
                                  width: 110.h,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.onError,
                                    borderRadius: BorderRadius.circular(
                                      56.h,
                                    ),
                                    border: Border.all(
                                      color: appTheme.deepcyanA200,
                                      width: 4.h,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgImage13,
                                height: 113.v,
                                width: 110.h,
                                radius: BorderRadius.circular(
                                  50.h,
                                ),
                                alignment: Alignment.center,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Padding(
                          padding: EdgeInsets.only(right: 83.h),
                          child: Text(
                            "lbl_shruti".tr,
                            // style: theme.textTheme.headlineSmall,
                             style: TextStyle(color: const Color.fromARGB(255, 31, 243, 197),fontFamily: 'Inria Sans',fontSize: 21,fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 1.v),
                        Padding(
                          padding: EdgeInsets.only(right: 48.h),
                          child: Text(
                            "msg_jainshruti_gmail_com".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 58.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 27.h,
                            right: 2.h,
                          ),
                          child: _buildUserProfileRow(
                            context,
                            countryText: "lbl_gender".tr,
                            countryValue: "lbl_female".tr,
                          ),
                        ),
                        SizedBox(height: 27.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 27.h,
                            right: 7.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Text(
                                  "lbl_age".tr,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.v),
                                child: Text(
                                  "lbl_19".tr,
                                  style: theme.textTheme.titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 21.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.h,
                            right: 2.h,
                          ),
                          child: _buildUserProfileRow(
                            context,
                            countryText: "lbl_country".tr,
                            countryValue: "lbl_india".tr,
                          ),
                        ),
                        SizedBox(height: 90.v),
                        CustomElevatedButton(
                          height: 44.v,
                          
                          text: "lbl_instagram".tr,
                          margin: EdgeInsets.only(
                            left: 31.h,
                            right: 5.h,
                          ),
                          leftIcon: Container(
                            margin: EdgeInsets.only(right: 25.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgImage14,
                              height: 37.v,
                              width: 38.h,
                            ),
                          ),
                          buttonStyle: CustomButtonStyles.fillinsta,
                          buttonTextStyle: theme.textTheme.titleSmall!,
                        ),
                        SizedBox(height: 27.v),
                        CustomElevatedButton(
                          height: 44.v,
                          text: "lbl_snapchat".tr,
                          margin: EdgeInsets.only(
                            left: 32.h,
                            right: 2.h,
                          ),
                          leftIcon: Container(
                            margin: EdgeInsets.only(right: 21.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgImage15,
                              height: 35.v,
                              width: 34.h,
                            ),
                          ),
                          buttonStyle: CustomButtonStyles.fillsnap,
                          buttonTextStyle: theme.textTheme.titleSmall!,
                        ),
                        SizedBox(height: 157.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgClock,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 11.h),
                            //   child: Text(
                            //     "lbl_logout".tr,
                            //     style: theme.textTheme.titleSmall,
                            //   ),
                            // ),
                            Spacer(),
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 17.v,
                              width: 9.h,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
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
      title: Text('Profile',style: TextStyle(color: appTheme.cyan300,fontSize: 20.fSize, fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w900,))
    );
  }

  /// Common widget
  Widget _buildUserProfileRow(
    BuildContext context, {
    required String countryText,
    required String countryValue,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            countryText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Text(
          countryValue,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        )
      ],
    );
  }
}
