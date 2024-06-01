// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:open_signup_login_page1_signup/presentation/image_gallery_screen/image_gallery_screen.dart';
// import 'package:open_signup_login_page1_signup/presentation/open_page_screen/open_page_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_leading_image.dart';
// import '../../widgets/app_bar/appbar_subtitle.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../edit_profile_screen/edit_profile_screen.dart';
// import 'models/my_profile_model.dart';
// import 'provider/my_profile_provider.dart';

// class MyProfileScreen extends StatefulWidget {
//   const MyProfileScreen({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   MyProfileScreenState createState() => MyProfileScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyProfileProvider(),
//       child: MyProfileScreen(),
//     );
//   }
// }

// class MyProfileScreenState extends State<MyProfileScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(context),
//         body: SizedBox(
//           width: SizeUtils.width,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(top: 14.v),
//             child: Container(
//               margin: EdgeInsets.only(
//                 left: 43.h,
//                 right: 54.h,
//                 bottom: 5.v,
//               ),
//               decoration: AppDecoration.fillGray,
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       height: 110.v,
//                       width: 111.h,
//                       margin: EdgeInsets.only(right: 78.h),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Align(
//                             alignment: Alignment.center,
//                             child: Container(
//                               height: 110.adaptSize,
//                               width: 110.adaptSize,
//                               decoration: BoxDecoration(
//                                 color: appTheme.blueGray100,
//                                 borderRadius: BorderRadius.circular(
//                                   55.h,
//                                 ),
//                                 border: Border.all(
//                                   color: appTheme.deepcyanA200,
//                                   width: 4.h,
//                                   strokeAlign: BorderSide.strokeAlignOutside,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: (){
//                               //  Navigator.of(context).pushNamed(AppRoutes.myImageGalleryScreen);
//                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageGalleryScreen()));
//                             },
//                             child: CustomImageView(
//                               imagePath: ImageConstant.imgWhatsappImage,
//                               height: 110.adaptSize,
//                               width: 110.adaptSize,
//                               radius: BorderRadius.circular(
//                                 55.h,
//                               ),
//                               alignment: Alignment.center,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8.v),
//                   Text(
//                     "lbl_kirtigourab".tr,
//                     style: TextStyle(color: const Color.fromARGB(255, 31, 243, 197),fontFamily: 'Inria Sans',fontSize: 21,fontWeight: FontWeight.w600),

//                   ),
//                   Text(
//                     "msg_kirtigourab_gmail_com".tr,
//                     style: theme.textTheme.labelLarge,
//                   ),
//                   SizedBox(height: 37.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 12.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "lbl_name".tr,
//                           style: theme.textTheme.titleSmall,
//                         ),
//                         Text(
//                           "lbl_kirti_gourab2".tr,
//                           style: theme.textTheme.titleSmall,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 7.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 13.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 6.v),
//                           child: Text(
//                             "lbl_gender".tr,
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 6.v),
//                           child: Text(
//                             "lbl_male".tr,
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12.v),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 13.h,
//                       right: 3.h,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "lbl_dob".tr,
//                           style: theme.textTheme.titleSmall,
//                         ),
//                         Text(
//                           "lbl_2_01_2022".tr,
//                           style: theme.textTheme.titleSmall,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 34.v),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 13.h,
//                       right: 4.h,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 1.v),
//                           child: Text(
//                             "lbl_country".tr,
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         ),
//                         Text(
//                           "lbl_india".tr,
//                           style: theme.textTheme.titleSmall,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.v),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 13.h,
//                       right: 3.h,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "msg_gender_prefrence".tr,
//                           style: theme.textTheme.titleSmall,
//                         ),
//                         Text(
//                           "lbl_female".tr,
//                           style: theme.textTheme.titleSmall,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 41.v),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 45.v,
//                         width: 44.h,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                               ImageConstant.imgImage10,
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: 14.v,
//                           bottom: 11.v,
//                         ),
//                         child: Text(
//                           "lbl_kirtigourab2".tr,
//                           style: theme.textTheme.titleSmall,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 15.v),
//                   Padding(
//                     padding: EdgeInsets.only(left: 7.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 36.v,
//                           width: 29.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               14.h,
//                             ),
//                             image: DecorationImage(
//                               image: AssetImage(
//                                 ImageConstant.imgImage9,
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: 9.v,
//                             bottom: 7.v,
//                           ),
//                           child: Text(
//                             "lbl_kirtimaan89".tr,
//                             style: theme.textTheme.titleSmall,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 43.v),
//                   InkWell(
//                     onTap: () async {
//                       bool confirmLogout = await showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text('Confirm Logout'),
//                             content: Text('Are you sure you want to logout?'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(false),
//                                 child: Text('Cancel'),
//                               ),
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(true),
//                                 child: Text('Logout'),
//                               ),
//                             ],
//                           );
//                         },
//                       );

//                       if (confirmLogout) {
//                         var sharedPref = await SharedPreferences.getInstance();
//                         await sharedPref.setBool(OpenPageScreenState.keyLogin, false);
//                         await sharedPref.setInt(OpenPageScreenState.uId, 0);
//                         NavigatorService.popAndPushNamed(AppRoutes.loginPageScreen);
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.red,
//                       ),
//                       width: 161.h,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Center(
//                           child: Text(
//                             "LogOut",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 6.v),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Can't continue?",
//                           style: theme.textTheme.titleMedium,
//                         ),
//                         TextSpan(
//                           text: "delete account",
//                           style: CustomTextStyles.titleMediumcyan200_1,
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       leadingWidth: 61.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgArrowDown,
//         margin: EdgeInsets.only(
//           left: 35.h,
//           top: 18.v,
//           bottom: 17.v,
//         ),
//       ),
//       title: AppbarSubtitle(
//         text: "lbl_profile".tr,
//         margin: EdgeInsets.only(left: 12.h),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.edit),
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfileScreen()));
//           },
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../edit_profile_screen/edit_profile_screen.dart';
import '../image_gallery_screen/image_gallery_screen.dart';
import '../open_page_screen/open_page_screen.dart';
import 'models/my_profile_model.dart';
import 'provider/my_profile_provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  MyProfileScreenState createState() => MyProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
      child: const MyProfileScreen(),
    );
  }
}

class MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MyProfileProvider>(context, listen: false).fetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Consumer<MyProfileProvider>(
          builder: (context, myProfileProvider, child) {
            if (myProfileProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (myProfileProvider.errorMessage != null) {
              return Center(child: Text(myProfileProvider.errorMessage!));
            }

            final profile = myProfileProvider.myProfileModelObj;
            if (profile == null) {
              return const Center(child: Text('No profile data'));
            }

            return _buildProfileContent(profile);
          },
        ),
      ),
    );
  }
  Widget _buildProfileContent(MyProfileModel profile) {
    return SizedBox(
      width: SizeUtils.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 14.v),
        child: Container(
          margin: EdgeInsets.only(
            left: 43.h,
            right: 54.h,
            bottom: 5.v,
          ),
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 110.v,
                  width: 111.h,
                  margin: EdgeInsets.only(right: 78.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 110.adaptSize,
                          width: 110.adaptSize,
                          decoration: BoxDecoration(
                            color: appTheme.blueGray100,
                            borderRadius: BorderRadius.circular(
                              55.h,
                            ),
                            border: Border.all(
                              color: appTheme.deepcyanA200,
                              width: 4.h,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImageGalleryScreen()));
                        },
                        child: CustomImageView(
                          imagePath: ImageConstant.imgWhatsappImage,
                          
                          height: 110.adaptSize,
                          width: 110.adaptSize,
                          radius: BorderRadius.circular(
                            55.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                profile.name,
                style: TextStyle(
                    color: const Color.fromARGB(255, 31, 243, 197),
                    fontFamily: 'Inria Sans',
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                profile.email,
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 37.v),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      profile.name,
                      style: theme.textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 13.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.v),
                      child: Text(
                        "Gender",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.v),
                      child: Text(
                       " ${profile.maingender}-${profile.gender}",
                        style: theme.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 13.h,
                  right: 3.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of Birth",
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      profile.dob.substring(0,10),
                      style: theme.textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              SizedBox(height: 34.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 13.h,
                  right: 4.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        "Country",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      profile.country,
                      style: theme.textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 13.h,
                  right: 3.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Preference",
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      "${profile.preferredgender}" "${profile.prefgender}",
                      style: theme.textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              SizedBox(height: 41.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: profile.instaID!='' ? true: false,
                        child: Container(
                          height: 45.v,
                          width: 44.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstant.imgImage10,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 14.v,
                          bottom: 11.v,
                        ),
                        child: Text(
                        " @${profile.instaID}",
                          style: theme.textTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: profile.snapID!='' ? true: false,
                          child: Container(
                            height: 36.v,
                            width: 29.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14.h,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  ImageConstant.imgImage9,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 9.v,
                            bottom: 7.v,
                          ),
                          child: Text(
                           profile.snapID,
                            style: theme.textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ),
              SizedBox(height: 43.v),
              InkWell(
                onTap: () async {
                  bool confirmLogout = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm Logout'),
                        content: const Text(
                            'Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(true),
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );

                  if (confirmLogout) {
                    var sharedPref = await SharedPreferences.getInstance();
                    await sharedPref.setBool(OpenPageScreenState.keyLogin, false);
                    await sharedPref.setInt(OpenPageScreenState.uId, 0);
                    NavigatorService.popAndPushNamed(AppRoutes.loginPageScreen);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  width: 161.h,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "LogOut",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Can't continue?",
                      style: theme.textTheme.titleMedium,
                    ),
                    TextSpan(
                      text: "delete account",
                      style: CustomTextStyles.titleMediumcyan200_1,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Profile",
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfileScreen()));
          },
        ),
      ],
    );
  }
}
