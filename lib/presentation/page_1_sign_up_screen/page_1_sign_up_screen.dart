import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/page_1_sign_up_model.dart';
import 'provider/page_1_sign_up_provider.dart';

class Page1SignUpScreen extends StatefulWidget {
  const Page1SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Page1SignUpScreenState createState() => Page1SignUpScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Page1SignUpProvider(),
      child: Page1SignUpScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Page1SignUpScreenState extends State<Page1SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 30.h,
                top: 111.v,
                right: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_please_enter_your".tr,
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 23.v),
                  _buildFullName(context),
                  SizedBox(height: 16.v),
                  _buildDate(context),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl".tr,
                            style: CustomTextStyles.bodySmallOnPrimaryContainer,
                          ),
                          TextSpan(
                            text: "msg_you_must_be_at_least".tr,
                            style: theme.textTheme.bodySmall,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 63.v),
                  _buildCountry(context),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildNext(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Selector<Page1SignUpProvider, TextEditingController?>(
      selector: (context, provider) => provider.fullNameController,
      builder: (context, fullNameController, child) {
        return CustomTextFormField(
          controller: fullNameController,
          hintText: "msg_enter_your_full".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryTL12,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Selector<Page1SignUpProvider, TextEditingController?>(
      selector: (context, provider) => provider.dateController,
      builder: (context, dateController, child) {
        return CustomTextFormField(
          controller: dateController,
          hintText: "msg_enter_your_birth".tr,
          borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryTL12,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return Selector<Page1SignUpProvider, TextEditingController?>(
      selector: (context, provider) => provider.countryController,
      builder: (context, countryController, child) {
        return CustomTextFormField(
          controller: countryController,
          hintText: "lbl_country".tr,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryTL12,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_next".tr,
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 51.v,
      ),
      buttonTextStyle: theme.textTheme.titleLarge!,
        onPressed: () {
        onTapNextgenButton(context);
      },
    );
  }

   onTapNextgenButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.genderDetailsScreen,
    );
  }
}
