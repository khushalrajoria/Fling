import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/payment_method_screen.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../../../core/app_export.dart';
import '../models/productcard_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProductcardItemWidget extends StatelessWidget {
  ProductcardItemWidget(this.productcardItemModelObj, {Key? key})
      : super(
          key: key,
        );

  final ProductcardItemModel productcardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayMethodScreen(
              price: productcardItemModelObj.title!,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 3.v,
        ),
        decoration: AppDecoration.fillSecondaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 14.v),
            CustomImageView(
              imagePath: ImageConstant.imgImage16,
              height: 67.v,
              width: 74.h,
            ),
            SizedBox(height: 17.v),
            Text(
              'Rs. ${productcardItemModelObj.title!}',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 17.v),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      '${productcardItemModelObj.quantity!}',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage16,
                    height: 22.v,
                    width: 25.h,
                    margin: EdgeInsets.only(left: 6.h),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
