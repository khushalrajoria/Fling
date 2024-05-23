import 'dart:io';

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/page_3_sign_up_model.dart';
import 'provider/page_3_sign_up_provider.dart';
import 'package:image_picker/image_picker.dart';


class Page3SignUpScreen extends StatefulWidget {
  const Page3SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Page3SignUpScreenState createState() => Page3SignUpScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Page3SignUpProvider(),
      child: Page3SignUpScreen(),
    );
  }
}

class Page3SignUpScreenState extends State<Page3SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15.v),
              Text(
                "msg_upload_your_image".tr,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 74.v),
              _buildMyImageRow(context)
            ],
          ),
        ),
        bottomNavigationBar: _buildUploadImageButton(context),
      ),
    );
  }

  /// Section Widget
  // Widget _buildUploadImageRow(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 31.h),
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             Container(
  //               height: 357.v,
  //               width: 297.h,
  //               decoration: BoxDecoration(
  //                 color: appTheme.blue50,
  //               ),
  //             ),
  //             Container(
  //               height: 357.v,
  //               width: 297.h,
  //               margin: EdgeInsets.only(left: 13.h),
  //               decoration: BoxDecoration(
  //                 color: appTheme.gray600,
  //               ),
  //             ),
  //             Container(
  //               height: 357.v,
  //               width: 297.h,
  //               margin: EdgeInsets.only(left: 13.h),
  //               decoration: BoxDecoration(
  //                 color: appTheme.gray600,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


  Widget _buildMyImageRow(BuildContext context) {
      final imageProvider = ValueNotifier<ImageProvider?>(null);
      final imageProvider1 = ValueNotifier<ImageProvider?>(null);
      final imageProvider2 = ValueNotifier<ImageProvider?>(null);
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
               InkWell(
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;

              // Update image provider with selected image
              imageProvider.value = FileImage(File(image.path));
            },
            child: Container(
              height: 357.v,
              width: 297.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Optional border
                ),
              ),
              child: ValueListenableBuilder<ImageProvider?>(
                valueListenable: imageProvider,
                builder: (context, value, child) {
                  return value != null
                      ? Image(
                          image: value!,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.white,
                      );
                },
              ),
            ),
          ),
            SizedBox(width: 97.h,),
               InkWell(
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;

              // Update image provider with selected image
              imageProvider1.value = FileImage(File(image.path));
            },
            child: Container(
              height: 357.v,
              width: 297.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Optional border
                ),
              ),
              child: ValueListenableBuilder<ImageProvider?>(
                valueListenable: imageProvider1,
                builder: (context, value, child) {
                  return value != null
                      ? Image(
                          image: value!,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.white,
                      );
                },
              ),
            ),
          ),
            SizedBox(width: 97.h,),
               InkWell(
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;

              // Update image provider with selected image
              imageProvider2.value = FileImage(File(image.path));
            },
            child: Container(
              height: 357.v,
              width: 297.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Optional border
                ),
              ),
              child: ValueListenableBuilder<ImageProvider?>(
                valueListenable: imageProvider2,
                builder: (context, value, child) {
                  return value != null
                      ? Image(
                          image: value!,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.white,
                      );
                },
              ),
            ),
          ),

            Container(
              height: 357.v,
              width: 17.h,
              margin: EdgeInsets.only(left: 13.h),
              decoration: BoxDecoration(
                color: appTheme.gray200, // Adjust color if needed
              ),
            )
          ],
        ),
      ),
    ),
  );
}


  /// Section Widget
  Widget _buildUploadImageButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_upload_image".tr,
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 43.v,
      ),
      onPressed: () {
        onTapUploadImageButton(context);
      },
    );
  }

  /// Navigates to the guidelinesScreen when the action is triggered.
  onTapUploadImageButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.guidelinesScreen,
    );
  }
}
