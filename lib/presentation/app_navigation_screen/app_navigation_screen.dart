import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillOnPrimary,
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_open_page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.openPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_open_page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.countryPreferenceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_signup_page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signupPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_login_page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_page_1_sign_up".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.page1SignUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "msg_my_image_gallery".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myImageGalleryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_image_gallery".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.imageGalleryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_purchase_drawer".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.purchaseDrawerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "msg_country_preference2".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.countryPreferenceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "msg_gender_preference2".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.genderPreferenceScreen),
                        ),
                           _buildScreenTitle(
                          context,
                          screenTitle: "lbl_my_profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "msg_home_page_container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.homePageContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "msg_friends_list_tab".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.friendsListTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "lbl_user_profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.userProfileScreen),
                        ),
                        // _buildScreenTitle(
                        //   context,
                        //   screenTitle: "msg_requests_list".tr,
                        //   onTapScreenTitle: () => onTapScreenTitle(
                        //       AppRoutes.requestsListContainerScreen),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnPrimary,
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "lbl_app_navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "msg_check_your_app_s".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.blueGray400,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: appTheme.black900,
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: AppDecoration.fillOnPrimary,
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blueGray400,
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
