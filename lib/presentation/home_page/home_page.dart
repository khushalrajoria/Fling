import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/profile_card.dart';

import 'provider/home_provider.dart'; 
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

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
    adloaded(); // Load the ad initially
  }
  adloaded()async{
    InterstitialAd.load(adUnitId: 'ca-app-pub-2048563608798916~8291277074', // google interstitial test id
     request: AdRequest(), adLoadCallback: InterstitialAdLoadCallback(onAdLoaded:  (ad){
      ad.fullScreenContentCallback = FullScreenContentCallback(
                
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                onAdDismissedFullScreenContent: (ad) {
                   isIntersitaltLoaded = false;
              loadNewAd(); 
                  ad.dispose();
                },
                onAdClicked: (ad) {});
      // setState(() {
        _interstitialAd=ad;
        isIntersitaltLoaded =true;
      // });
    }, onAdFailedToLoad: (( LoadAdError error) {
      print(error);
      // _interstitialAd.dispose();
      isIntersitaltLoaded=false;
    })));
  }
void loadNewAd() {
    adloaded(); // Call adloaded to load a new ad
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 13.h,
            vertical: 10.v,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 6.v),
                // FloatingActionButton(onPressed: (() {
                //    if (isIntersitaltLoaded==true) {
                //         _interstitialAd!.show();
                //       }
                // })),
                SizedBox(
                  height: 622.v,
                  width: 333.h,
                  child: CardSwiper(
                    onEnd: () {
                      ElevatedButton(
                        style: ButtonStyle(
                         backgroundColor: MaterialStateColor.resolveWith((states) => appTheme.cyan300),
                        ),
                        
                        onPressed:(){
                      if (isIntersitaltLoaded==true) {
                        _interstitialAd!.show();
                      }

                      } , child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Show more',style: TextStyle(color: Colors.white,),),
                      ),);
                       
                          
                      
                    },
                    allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true),
                    // isLoop: false,
                    cardsCount: 7,
                    onSwipe: (previousIndex, currentIndex, direction) {
                       swipeCount++;
                       if (swipeCount >= 7 && isIntersitaltLoaded) {
                  _interstitialAd!.show();
                  swipeCount = 0; // Reset the swipe count after showing an ad
                  isIntersitaltLoaded = false; // Unsure if your ad needs this
                  loadNewAd(); // Preload next ad after showing current one
              }
                      if(direction==CardSwiperDirection.right){
                        Fluttertoast.showToast(msg: '😍',backgroundColor: Colors.white,fontSize: 28);
                      }
                      else if(direction==CardSwiperDirection.left){
                        Fluttertoast.showToast(msg: '😒',backgroundColor: Colors.white,fontSize: 28);
                      }
                      return true;
                    },
                    cardBuilder: (context,index,x,y){
                      return Stack(
                      alignment: Alignment.center,
                      children: [
                           ProfileCard(
                                              imagePaths: [
                                              'assets/images/img_profile_image.png',
                                              'assets/images/img_5.png',
                                              'assets/images/img_6.png',
                                                ],
                                              name: "Shruti (26)",
                                              age: 26,
                                              country: "India",
                                      ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(11.h, 19.v, 1.h, 3.v),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgMoreOptions,
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
                // _buildDetails(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

@override
  void dispose() {
    _interstitialAd?.dispose(); // Dispose of the ad when the widget is disposed
    super.dispose();
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 139.h),
        child: Row(
          children: [
            AppbarTitleImage(
              imagePath: ImageConstant.imgGoogle,
              margin: EdgeInsets.symmetric(vertical: 5.v),
            ),
            Text("lbl_appname".tr,
              style: TextStyle(color: appTheme.cyan300,fontSize: 35,fontWeight: FontWeight.w700,fontFamily: 'Island Moments'),
            )
          ],
        ),
      ),
      actions: [
        GestureDetector(
  onTap: () {
    Navigator.of(context).pushNamed(AppRoutes.purchaseDrawerScreen);
  },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.cyan,
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
          '100',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ],
    ),
  ),
),
    SizedBox(width: 10.h,)
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
