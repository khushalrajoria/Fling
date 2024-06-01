import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/friends_list_tab_container_screen/friends_list_tab_container_screen.dart';
// import '../presentation/gender_details_screen/gender_details_screen.dart';
import '../presentation/gender_details_screen/gender_details_screen.dart';
import '../presentation/gender_preference_screen/gender_preference_screen.dart';
import '../presentation/gender_screen/gender_screen.dart';
import '../presentation/guidelines_screen/guidelines_screen.dart';
import '../presentation/home_page_container_screen/home_page_container_screen.dart';
import '../presentation/image_gallery_screen/image_gallery_screen.dart';
import '../presentation/login_page_screen/login_page_screen.dart';
import '../presentation/my_image_gallery_screen/my_image_gallery_screen.dart';
import '../presentation/my_profile_screen/my_profile_screen.dart';
import '../presentation/open_page_screen/open_page_screen.dart';
import '../presentation/page_1_sign_up_screen/page_1_sign_up_screen.dart';
import '../presentation/page_2_sign_up_screen/page_2_sign_up_screen.dart';
import '../presentation/page_3_sign_up_screen/page_3_sign_up_screen.dart';
import '../presentation/purchase_drawer_screen/purchase_drawer_screen.dart';
import '../presentation/requests_list_tab_container_screen/requests_list_tab_container_screen.dart';
import '../presentation/signup_page_screen/signup_page_screen.dart';
import '../presentation/user_profile_screen/user_profile_screen.dart';

class AppRoutes {
  static const String openPageScreen = '/open_page_screen';

  static const String signupPageScreen = '/signup_page_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String editprofilescreen = '/edit_profile_screen';

  static const String page1SignUpScreen = '/page_1_sign_up_screen';

  static const String genderDetailsScreen = '/gender_details_screen';

  static const String genderScreen = '/gender_screen';

  static const String page2SignUpScreen = '/page_2_sign_up_screen';

  static const String page3SignUpScreen = '/page_3_sign_up_screen';

  static const String guidelinesScreen = '/guidelines_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String myImageGalleryScreen = '/my_image_gallery_screen';

  static const String imageGalleryScreen = '/image_gallery_screen';

  static const String purchaseDrawerScreen = '/purchase_drawer_screen';

  static const String countryPreferenceScreen = '/country_preference_screen';

  static const String genderPreferenceScreen = '/gender_preference_screen';

  static const String myProfileScreen = '/my_profile_screen';

   static const String userProfileScreen = '/user_profile_screen';

  static const String homePageContainerScreen = '/home_page_container_screen';

  static const String homePage = '/home_page';

  static const String friendsListPage = '/friends_list_page';

  static const String friendsListTabContainerScreen ='/friends_list_tab_container_screen';

  static const String requestsListTabContainerScreen ='/requests_list_tab_container_screen';

  




  static Map<String, WidgetBuilder> get routes => {
        openPageScreen: OpenPageScreen.builder,
        signupPageScreen: SignupPageScreen.builder,
        loginPageScreen: LoginPageScreen.builder,
        page1SignUpScreen: Page1SignUpScreen.builder,
        genderDetailsScreen: GenderDetailsScreen.builder,
        genderScreen: GenderScreen.builder,
        page2SignUpScreen: Page2SignUpScreen.builder,
        page3SignUpScreen: Page3SignUpScreen.builder,
        myImageGalleryScreen: MyImageGalleryScreen.builder,
        imageGalleryScreen: ImageGalleryScreen.builder,
        purchaseDrawerScreen: PurchaseDrawerScreen.builder,
        genderPreferenceScreen: GenderPreferenceScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        userProfileScreen: UserProfileScreen.builder,
        initialRoute: OpenPageScreen.builder,
        guidelinesScreen: GuidelinesScreen.builder,
        myProfileScreen: MyProfileScreen.builder,
        homePageContainerScreen: HomePageContainerScreen.builder,
        friendsListTabContainerScreen: FriendsListTabContainerScreen.builder,
        requestsListTabContainerScreen: RequestsListTabContainerPage.builder,
       
      };
}
