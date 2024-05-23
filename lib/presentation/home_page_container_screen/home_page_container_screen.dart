import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/purchase_drawer_screen/purchase_drawer_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../friends_list_tab_container_screen/friends_list_tab_container_screen.dart';
import '../home_page/home_page.dart';
import '../my_profile_screen/my_profile_screen.dart';
import 'provider/home_page_container_provider.dart';

class HomePageContainerScreen extends StatefulWidget {
  const HomePageContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageContainerScreenState createState() => HomePageContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageContainerProvider(),
      child: HomePageContainerScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomePageContainerScreenState extends State<HomePageContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
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
        return AppRoutes.friendsListPage;
      case BottomBarEnum.Image11:
        return AppRoutes.homePage;
      case BottomBarEnum.Image12:
        return AppRoutes.myProfileScreen;
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
      case AppRoutes.friendsListPage:
        return FriendsListTabContainerScreen.builder(context);
      case AppRoutes.myProfileScreen:
        return MyProfileScreen.builder(context);
      case AppRoutes.purchaseDrawerScreen:
        return PurchaseDrawerScreen.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
