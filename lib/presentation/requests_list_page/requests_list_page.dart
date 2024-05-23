// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/custom_elevated_button.dart';
// import 'models/requests_list_model.dart';
// import 'provider/requests_list_provider.dart'; // ignore_for_file: must_be_immutable

// class RequestsListPage extends StatefulWidget {
//   const RequestsListPage({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   RequestsListPageState createState() => RequestsListPageState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RequestsListProvider(),
//       child: RequestsListPage(),
//     );
//   }
// }

// class RequestsListPageState extends State<RequestsListPage>
//     with AutomaticKeepAliveClientMixin<RequestsListPage> {
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: SizeUtils.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 17.v),
//                 Container(
//                   height: 534.v,
//                   width: 341.h,
//                   margin: EdgeInsets.only(
//                     left: 11.h,
//                     right: 8.h,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           margin: EdgeInsets.only(right: 4.h),
//                           padding: EdgeInsets.symmetric(vertical: 20.v),
//                           decoration: AppDecoration.outlineBlack.copyWith(
//                             borderRadius: BorderRadiusStyle.roundedBorder16,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               _buildRowpatriciad(context),
//                               SizedBox(height: 2.v),
//                               Divider(),
//                               SizedBox(height: 17.v),
//                               _buildRowjonathonknix(context),
//                               SizedBox(height: 2.v),
//                               Divider(),
//                               SizedBox(height: 17.v),
//                               _buildRowellenn(context),
//                               SizedBox(height: 2.v),
//                               Divider(),
//                               SizedBox(height: 17.v),
//                               _buildRowwilliamw(context),
//                               SizedBox(height: 3.v),
//                               Divider(),
//                               SizedBox(height: 14.v),
//                               _buildRowscottd(context),
//                               SizedBox(height: 14.v)
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 224.v),
//                           child: SizedBox(
//                             width: 341.h,
//                             child: Divider(),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAcceptButton(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_accept".tr,
//       margin: EdgeInsets.only(
//         top: 12.v,
//         bottom: 5.v,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRejectButton(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_reject".tr,
//       margin: EdgeInsets.only(
//         left: 7.h,
//         top: 12.v,
//         bottom: 5.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillErrorContainer,
//     );
//   }

//   /// Section Widget
//   Widget _buildRowpatriciad(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 7.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             height: 10.v,
//             width: 49.h,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 24.h,
//               ),
//               border: Border.all(
//                 color: appTheme.blue50,
//                 width: 2.h,
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onTapTxtPatriciad(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 16.h,
//                 top: 10.v,
//                 bottom: 5.v,
//               ),
//               child: Text(
//                 "lbl_johan".tr,
//                 style: theme.textTheme.titleMedium,
//               ),
//             ),
//           ),
//           Spacer(),
//           _buildAcceptButton(context),
//           _buildRejectButton(context)
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAcceptButton1(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_accept".tr,
//       margin: EdgeInsets.only(
//         left: 14.h,
//         top: 12.v,
//         bottom: 5.v,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRejectButton1(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_reject".tr,
//       margin: EdgeInsets.only(
//         left: 7.h,
//         top: 12.v,
//         bottom: 5.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillErrorContainer,
//     );
//   }

//   /// Section Widget
//   Widget _buildRowjonathonknix(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 7.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 40.v,
//             width: 49.h,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 24.h,
//               ),
//               border: Border.all(
//                 color: appTheme.blue50,
//                 width: 2.h,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 18.h,
//               top: 8.v,
//               bottom: 5.v,
//             ),
//             child: Text(
//               "lbl_timothee_mathew".tr,
//               style: theme.textTheme.titleMedium,
//             ),
//           ),
//           _buildAcceptButton1(context),
//           _buildRejectButton1(context)
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAcceptButton2(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_accept".tr,
//       margin: EdgeInsets.only(
//         top: 12.v,
//         bottom: 5.v,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRejectButton2(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_reject".tr,
//       margin: EdgeInsets.only(
//         left: 7.h,
//         top: 12.v,
//         bottom: 5.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillErrorContainer,
//     );
//   }

//   /// Section Widget
//   Widget _buildRowellenn(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 7.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             height: 40.v,
//             width: 49.h,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 24.h,
//               ),
//               border: Border.all(
//                 color: appTheme.blue50,
//                 width: 2.h,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 18.h,
//               top: 9.v,
//               bottom: 6.v,
//             ),
//             child: Text(
//               "lbl_amanriya".tr,
//               style: theme.textTheme.titleMedium,
//             ),
//           ),
//           Spacer(),
//           _buildAcceptButton2(context),
//           _buildRejectButton2(context)
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAcceptButton3(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_accept".tr,
//       margin: EdgeInsets.only(
//         top: 12.v,
//         bottom: 5.v,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRejectButton3(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_reject".tr,
//       margin: EdgeInsets.only(
//         left: 7.h,
//         top: 12.v,
//         bottom: 5.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillErrorContainer,
//     );
//   }

//   /// Section Widget
//   Widget _buildRowwilliamw(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 7.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 40.v,
//             width: 49.h,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 24.h,
//               ),
//               border: Border.all(
//                 color: appTheme.blue50,
//                 width: 2.h,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 18.h,
//               top: 8.v,
//               bottom: 7.v,
//             ),
//             child: Text(
//               "lbl_tanisha".tr,
//               style: theme.textTheme.titleMedium,
//             ),
//           ),
//           Spacer(),
//           _buildAcceptButton3(context),
//           _buildRejectButton3(context)
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAcceptButton4(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_accept".tr,
//       margin: EdgeInsets.only(
//         top: 15.v,
//         bottom: 2.v,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildRejectButton4(BuildContext context) {
//     return CustomElevatedButton(
//       width: 47.h,
//       text: "lbl_reject".tr,
//       margin: EdgeInsets.only(
//         left: 7.h,
//         top: 15.v,
//         bottom: 2.v,
//       ),
//       buttonStyle: CustomButtonStyles.fillErrorContainer,
//     );
//   }

//   /// Section Widget
//   Widget _buildRowscottd(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.h,
//         right: 7.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             height: 40.v,
//             width: 49.h,
//             decoration: BoxDecoration(
//               color: appTheme.black900,
//               borderRadius: BorderRadius.circular(
//                 24.h,
//               ),
//               border: Border.all(
//                 color: appTheme.blue50,
//                 width: 2.h,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 19.h,
//               top: 13.v,
//               bottom: 2.v,
//             ),
//             child: Text(
//               "lbl_shravya".tr,
//               style: theme.textTheme.titleMedium,
//             ),
//           ),
//           Spacer(),
//           _buildAcceptButton4(context),
//           _buildRejectButton4(context)
//         ],
//       ),
//     );
//   }

//   /// Navigates to the userProfileScreen when the action is triggered.
//   onTapTxtPatriciad(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.userProfileScreen,
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'provider/requests_list_provider.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({Key? key}) : super(key: key);

  @override
  RequestsListPageState createState() => RequestsListPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestsListProvider(),
      child: RequestsListPage(),
    );
  }
}

class RequestsListPageState extends State<RequestsListPage>
    with AutomaticKeepAliveClientMixin<RequestsListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 17.v),
                Container(
                  height: 544.v,
                  width: 341.h,
                  margin: EdgeInsets.only(
                    left: 11.h,
                    right: 8.h,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildRequestsList(context),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestsList(BuildContext context) {
    final requestsListProvider = Provider.of<RequestsListProvider>(context);
    final requestsList = requestsListProvider.requestsList;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: requestsList.length,
      itemBuilder: (context, index) {
        final item = requestsList[index];
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 7.v),
              child: InkWell(
                onTap: (){
                 NavigatorService.pushNamed(
              AppRoutes.userProfileScreen,
    );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (item.hasCircle)
                      Container(
                        height: 40.v,
                        width: 49.h,
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(24.h),
                          border: Border.all(
                            color: appTheme.blue50,
                            width: 2.h,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
                      child: Text(
                        item.name.tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Spacer(),
                    _buildAcceptButton(context),
                    SizedBox(width: 5.h,),
                    _buildRejectButton(context),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }

  Widget _buildAcceptButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Accept',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(appTheme.cyan300)
      ),
    );
  }

  Widget _buildRejectButton(BuildContext context) {
     return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Reject',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.transparent)
      ),
    );
  }

  onTapTxtPatriciad(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.userProfileScreen,
    );
  }
}