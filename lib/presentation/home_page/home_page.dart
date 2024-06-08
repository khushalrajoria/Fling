
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:open_signup_login_page1_signup/presentation/purchase_drawer_screen/provider/purchase_drawer_provider.dart';
import 'package:open_signup_login_page1_signup/presentation/purchase_drawer_screen/purchase_drawer_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/profile_card.dart';
import 'models/home_model.dart';
import 'provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  bool isIntersitaltLoaded = false;
  int swipeCount = 0;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context, homeProvider),
        body: homeProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : homeProvider.users.isEmpty
                ? Center(child: Text("No users available",style: TextStyle(color: Colors.black),))
                : Container(
                  color: Color.fromRGBO(250, 249, 246, 1),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 10.v),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 6.v),
                          SizedBox(
                            height: 622.v,
                            width: 333.h,
                            child: CardSwiper(
                              onEnd: () {
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateColor.resolveWith(
                                        (states) => appTheme.cyan300),
                                  ),
                                  onPressed: () {
                                    if (isIntersitaltLoaded == true) {
                                      _interstitialAd!.show();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Show more',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              allowedSwipeDirection:
                                  AllowedSwipeDirection.symmetric(horizontal: true),
                              cardsCount: homeProvider.users.length,
                              onSwipe: (previousIndex, currentIndex, direction) {
                                swipeCount++;
                                if (swipeCount >= 7 && isIntersitaltLoaded) {
                                  _interstitialAd!.show();
                                  swipeCount = 0;
                                  isIntersitaltLoaded = false; 
                                }
                                if (direction == CardSwiperDirection.right) {
                                  Fluttertoast.showToast(
                                      msg: '😍',
                                      backgroundColor: Colors.white,
                                      fontSize: 28);
                                } else if (direction == CardSwiperDirection.left) {
                                  Fluttertoast.showToast(
                                      msg: '😒',
                                      backgroundColor: Colors.white,
                                      fontSize: 28);
                                }
                                return true;
                              },
                              cardBuilder: (context, index, x, y) {
                                UserModel user = homeProvider.users[index];
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ProfileCard(
                                      imagePaths: [
                                         user.Pic,
                                         user.Pic2,
                                         user.Pic3,
                                      ],
                                      name: "${user.fullname} (${user.age})",
                                      age: user.age,
                                      country: user.country,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            11.h, 19.v, 1.h, 3.v),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgMoreOptions,
                                              height: 35.v,
                                              width: 34.h,
                                            ),
                                            Spacer(),
                                            _buildRowDelete(context),
                                            SizedBox(height: 8.v),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 8.v),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose(); 
    super.dispose();
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context, HomeProvider homeProvider) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 139.h),
        child: Row(
          children: [
            AppbarTitleImage(
              imagePath: ImageConstant.imgGoogle,
              margin: EdgeInsets.symmetric(vertical: 5.v),
            ),
            Text(
              "lbl_appname".tr,
              style: TextStyle(
                  color: appTheme.cyan300,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Island Moments'),
            )
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<PurchaseDrawerProvider>(
                        create: (context) => PurchaseDrawerProvider(),
                        child: PurchaseDrawerScreen(
                          gemcount: homeProvider.gemCount,
                        ),
                      ),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(	124	,124,	229, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageConstant.imgImage4,
                  height: 24.0,
                  width: 24.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  '${homeProvider.gemCount}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ),
        SizedBox(width: 10.h),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowDelete(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(1.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgDelete,
            ),
          ),
          Container(
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(3.h),
            decoration: AppDecoration.fillLightGreenA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder26,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgImage5,
              height: 45.v,
              width: 44.h,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
