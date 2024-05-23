import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/image_gallery_model.dart';
import 'provider/image_gallery_provider.dart';

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ImageGalleryScreenState createState() => ImageGalleryScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageGalleryProvider(),
      child: ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreenState extends State<ImageGalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black400,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 5.v),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Column(
                children: [
                  Container(
                    height: 493.v,
                    width: 332.h,
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConstant.imgProfileImage,), fit:BoxFit.fill ),
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 29.v),
                  Container(
                    height: 493.v,
                    width: 332.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImageConstant.imgProfileImage,), fit:BoxFit.fill ),
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.v),
                  Container(
                    height: 493.v,
                    width: 332.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImageConstant.imgProfileImage,), fit:BoxFit.fill ),
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
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
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 14.h,
          top: 18.v,
          bottom: 18.v,
        ),
      ),
      title: Text(
        'My Pictures',style: TextStyle(color: appTheme.cyan300,fontSize: 20.fSize, fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w900,)
      )
    );
  }
}
