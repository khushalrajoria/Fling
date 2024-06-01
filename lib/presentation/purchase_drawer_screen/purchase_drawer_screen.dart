import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/open_page_screen/open_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/productcard_item_model.dart';
import 'package:http/http.dart' as http;
import 'provider/purchase_drawer_provider.dart';
import 'widgets/productcard_item_widget.dart';


class PurchaseDrawerScreen extends StatefulWidget {
  const PurchaseDrawerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PurchaseDrawerScreenState createState() => PurchaseDrawerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PurchaseDrawerProvider(),
      child: PurchaseDrawerScreen(),
    );
  }
}

class PurchaseDrawerScreenState extends State<PurchaseDrawerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 21.h,
            vertical: 7.v,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 3.v,
                ),
                decoration: AppDecoration.fillSecondaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage16,
                      height: 29.v,
                      width: 25.h,
                      margin: EdgeInsets.only(
                        top: 4.v,
                        bottom: 2.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        top: 2.v,
                        right: 5.h,
                      ),
                      child: Text(
                        "lbl_100".tr,
                        style: theme.textTheme.headlineMedium,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              _buildRowClaimYour100(context),
              SizedBox(height: 26.v),
              _buildProductCard(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 53.h,
      leading: AppbarLeadingImage(
         onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.homePageContainerScreen);
  },
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 27.h,
          top: 18.v,
          bottom: 18.v,
        ),
      ),
      title: Text('Points',style: TextStyle(color: appTheme.cyan300,fontSize: 20.fSize, fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w900,),)
    );
  }

  /// Section Widget
  Widget _buildRowClaimYour100(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.fillSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage16,
            height: 29.v,
            width: 25.h,
            margin: EdgeInsets.only(
              top: 7.v,
              bottom: 8.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              top: 6.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_claim_your_100_gems".tr,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 1.v),
                Text(
                  "msg_refreshes_at_12_00".tr,
                  style: theme.textTheme.labelSmall,
                )
              ],
            ),
          ),
          CustomElevatedButton(
            height: 41.v,
            width: 88.h,
            text: "lbl_claim".tr,
            margin: EdgeInsets.only(
              left: 16.h,
              bottom: 3.v,
            ),
            buttonStyle: CustomButtonStyles.fillCyan,
            buttonTextStyle: CustomTextStyles.titleSmallBlack900,
            onPressed: () async {
              var sharedPref =await SharedPreferences.getInstance();
              var uId=sharedPref.getInt(OpenPageScreenState.uId);
              var body={
                "uId":uId
              };
              print(body);
              var response =await http.post(
                  Uri.parse(claimGemsRoute),
                  headers: {
                    "content-type":"application/json"
                  },
                  body: jsonEncode(body));
              print(response);

            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductCard(BuildContext context) {
    return Consumer<PurchaseDrawerProvider>(
      builder: (context, provider, child) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 171.v,
            crossAxisCount: 2,
            mainAxisSpacing: 28.h,
            crossAxisSpacing: 28.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: provider.purchaseDrawerModelObj.productcardItemList.length,
          itemBuilder: (context, index) {
            ProductcardItemModel model =
                provider.purchaseDrawerModelObj.productcardItemList[index];
            return ProductcardItemWidget(
              model,
            );
          },
        );
      },
    );
  }
}
