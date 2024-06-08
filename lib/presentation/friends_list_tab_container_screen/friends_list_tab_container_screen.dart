/*import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../friends_list_page/friends_list_page.dart';
import '../home_page/home_page.dart';
import 'models/friends_list_tab_container_model.dart';
import 'provider/friends_list_tab_container_provider.dart';

class FriendsListTabContainerScreen extends StatefulWidget {
  const FriendsListTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FriendsListTabContainerScreenState createState() =>
      FriendsListTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FriendsListTabContainerProvider(),
      child: FriendsListTabContainerScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FriendsListTabContainerScreenState
    extends State<FriendsListTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 8.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTabview(context),
                      SizedBox(
                        height: 572.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: [
                            FriendsListPage.builder(context),
                            FriendsListPage.builder(context)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 35.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDownBlueGray900,
        margin: EdgeInsets.only(
          left: 11.h,
          top: 19.v,
          bottom: 16.v,
        ),
        onTap: () {
          onTapArrowdownone(context);
        },
      ),
      title: AppbarSubtitle(
        text: "lbl_notifications".tr,
        margin: EdgeInsets.only(left: 8.h),
        onTap: () {
          onTapIndox(context);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 48.v,
      width: 321.h,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.blueGray900,
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelColor: appTheme.whiteA700,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.blue50,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_friends".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_request".tr,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Friends:
        return AppRoutes.homePage;
      case BottomBarEnum.Image11:
        return "/";
      case BottomBarEnum.Image12:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.homePage:
        return HomePage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapArrowdownone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapIndox(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/requests_list_tab_container_screen/requests_list_tab_container_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../friends_list_page/friends_list_page.dart';
import '../requests_list_page/requests_list_page.dart';
import 'provider/friends_list_tab_container_provider.dart';

class FriendsListTabContainerScreen extends StatefulWidget {
  const FriendsListTabContainerScreen({Key? key}) : super(key: key);

  @override
  FriendsListTabContainerScreenState createState() => FriendsListTabContainerScreenState();

  static Widget builder(BuildContext context) {
    // Assuming FriendsListTabContainerProvider is correctly set up to manage the state for this screen.
    return ChangeNotifierProvider(
      create: (context) => FriendsListTabContainerProvider(),
      child: FriendsListTabContainerScreen(),
    );
  }
}

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class FriendsListTabContainerScreenState extends State<FriendsListTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 8.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTabview(context),
                      SizedBox(
                        height: 572.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: [
                            FriendsListPage.builder(context), // First tab content
                            RequestsListPage.builder(context) 
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 35.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDownOnprimary,
        margin: EdgeInsets.only(
          left: 11.h,
          top: 19.v,
          bottom: 16.v,
        ),
      ),
      title: Text("lbl_notifications".tr,style: TextStyle(color: appTheme.cyan300,fontSize: 20.fSize, fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w900,),)
      // AppbarTitle(
      //   text: "lbl_notifications".tr,

      //   margin: EdgeInsets.only(left: 8.h),
      // ),
    );
  }

  Widget _buildTabview(BuildContext context) {
     return SizedBox(
      height: 48.v,
      width: 321.h,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
       labelColor: appTheme.whiteA700,
       
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
         unselectedLabelColor: appTheme.deepcyanA200,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.deepcyanA200,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_friends".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_request".tr,
            ),
          )
        ],
      ),
    );
  }


  Widget _buildBottomBar(BuildContext context) {
      return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

 String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Image11:
        return AppRoutes.requestsListTabContainerScreen;
      case BottomBarEnum.Image11:
        return "/";
      case BottomBarEnum.Image11:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.requestsListTabContainerScreen:
        return RequestsListTabContainerPage.builder(context);
      default:
        return DefaultWidget();
    }
  }

}