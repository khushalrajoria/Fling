import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/guidelines_screen/guidelines_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../guidelines_screen/provider/guidelines_provider.dart';
import 'provider/page_3_sign_up_provider.dart';
import 'package:image_picker/image_picker.dart';

class Page3SignUpScreen extends StatefulWidget {
  final String email;
  final String password;
  final String fullName;
  final String dateOfBirth;
  final String country;
  final String gender;
  final String maingender;
  final String snapId;
  final String instaId;

  Page3SignUpScreen({
    required this.email,
    required this.password,
    required this.fullName,
    required this.dateOfBirth,
    required this.country,
    required this.snapId,
    required this.instaId,
    required this.gender,
    required this.maingender,

  });
  @override
  Page3SignUpScreenState createState() => Page3SignUpScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Page3SignUpProvider(),
      child: Page3SignUpScreen(
        email: '',
        password: '',
        fullName: '',
        dateOfBirth: '',
        country: '',
        snapId: '',
        instaId: '',
        gender: '',
        maingender: '',
      ),
    );
  }
}

class Page3SignUpScreenState extends State<Page3SignUpScreen> {
  File? imageFile;
  File? imageFile1;
  File? imageFile2;
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
                style: theme.textTheme.displaySmall,
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
              imageFile=File(image.path);
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
                          image: value,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.black87,
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
              imageFile1=File(image.path);
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
                          image: value,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.black87,
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
              imageFile2=File(image.path);
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
                          image: value,
                          fit: BoxFit.cover, // Adjust as needed
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50.h,
                          color: Colors.black87,
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
       buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(appTheme.deepcyanA200)),
      buttonTextStyle: TextStyle(color: Colors.white),
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
  onTapUploadImageButton(BuildContext context) async {

    if(imageFile!=null) {

        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<GuidelinesProvider>(
                    create: (context) => GuidelinesProvider(),
                    child:
                    GuidelinesScreen(
                      email: widget.email,
                      password: widget.password,
                      fullName: widget.fullName,
                      dateOfBirth: widget.dateOfBirth,
                      country: widget.country,
                      gender: widget.gender,
                      maingender: widget.maingender,
                      snapId: widget.snapId,
                      instaId: widget.instaId,
                      imageFile: imageFile,
                      imageFile1: imageFile1,
                      imageFile2: imageFile2,
                    ),
                  ),
            )
        );
    }
  }
}