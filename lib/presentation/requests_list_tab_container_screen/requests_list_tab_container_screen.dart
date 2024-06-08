import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../requests_list_page/requests_list_page.dart';
import 'provider/requests_list_tab_container_provider.dart'; // ignore_for_file: must_be_immutable

class RequestsListTabContainerPage extends StatefulWidget {
  const RequestsListTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  RequestsListTabContainerPageState createState() =>
      RequestsListTabContainerPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestsListTabContainerProvider(),
      child: RequestsListTabContainerPage(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class RequestsListTabContainerPageState
    extends State<RequestsListTabContainerPage> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          color: Color.fromRGBO(250, 249, 246, 1),
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 8.v),
          // decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 57.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      RequestsListPage.builder(context),
                      RequestsListPage.builder(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 35.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 11.h,
          top: 19.v,
          bottom: 18.v,
        ),
      ),
      title: AppbarTitle(
        text: " lbl_notifications".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      color: Color.fromRGBO(250, 249, 246, 1),
      height: 49.v,
      width: 310.h,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.onPrimaryContainer,
        labelStyle: TextStyle(
          fontSize: 6.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        // unselectedLabelColor:Colors.black,
        unselectedLabelColor:Colors.black,
        unselectedLabelStyle: TextStyle(
          fontSize: 6.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.deepcyanA200,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_friends".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_requests".tr,
            ),
          )
        ],
      ),
    );
  }
}
