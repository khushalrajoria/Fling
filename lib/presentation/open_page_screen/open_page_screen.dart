import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/open_page_model.dart';
import 'provider/open_page_provider.dart';

class OpenPageScreen extends StatefulWidget {
  const OpenPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OpenPageScreenState createState() => OpenPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OpenPageProvider(),
      child: OpenPageScreen(),
    );
  }
}

class OpenPageScreenState extends State<OpenPageScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginPageScreen,
      );
    });
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 7.v,
                ),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder49,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 7.v),
                    Text(
                      "lbl_k".tr,
                      style: theme.textTheme.displayLarge,
                    )
                  ],
                ),
              ),
              SizedBox(height: 3.v),
              Text(
                "lbl_klick".tr,
                style: CustomTextStyles.displaySmallInter,
              ),
              SizedBox(height: 1.v)
            ],
          ),
        ),
      ),
    );
  }
}
