import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/signup_page_provider.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupPageScreenState createState() => SignupPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupPageProvider(),
      child: SignupPageScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignupPageScreenState extends State<SignupPageScreen> {
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
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 29.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 43.v),
                    Text(
                      "msg_sign_up_for_klick".tr,
                      style: theme.textTheme.displaySmall,
                    ),
                    SizedBox(height: 28.v),
                    _buildEmailField(context),
                    SizedBox(height: 35.v),
                    _buildPasswordField(context),
                    Spacer(),
                    _buildRegisterButton(context),
                    SizedBox(height: 19.v),
                    _buildSignInWithGoogleButton(context),
                    SizedBox(height: 19.v),
                    _buildExistingUserLoginButton(context),
                    SizedBox(height: 10.v),
                    _buildContinueCheckBox(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: Selector<SignupPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailFieldController,
        builder: (context, emailFieldController, child) {
          return CustomTextFormField(
            controller: emailFieldController,
            hintText: "msg_enter_your_e_mail".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: Selector<SignupPageProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordFieldController,
        builder: (context, passwordFieldController, child) {
          return CustomTextFormField(
            controller: passwordFieldController,
            hintText: "msg_enter_your_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return CustomElevatedButton(
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 31, 243, 197))),
      text: "lbl_register".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 6.h,
      ),
      onPressed: () {
        onTapRegisterButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      text: "msg_sign_in_with_google".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 6.h,
      ),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 30.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      onPressed: () {
        onTapSignInWithGoogleButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildExistingUserLoginButton(BuildContext context) {
    return CustomElevatedButton(
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 31, 243, 197))),
      text: "msg_existing_user_login".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 6.h,
      ),
      onPressed: () {
        onTapExistingUserLoginButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildContinueCheckBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 9.h),
      child: Selector<SignupPageProvider, bool?>(
        selector: (context, provider) => provider.continueCheckBox,
        builder: (context, continueCheckBox, child) {
          return CustomCheckboxButton(
            text: "msg_by_continuing_i".tr,
            value: continueCheckBox,
            padding: EdgeInsets.symmetric(vertical: 1.v),
            onChange: (value) {
              context.read<SignupPageProvider>().changeCheckBox(value);
            },
          );
        },
      ),
    );
  }

  /// Navigates to the page1SignUpScreen when the action is triggered.
  onTapRegisterButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.page1SignUpScreen,
    );
  }

  onTapSignInWithGoogleButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapExistingUserLoginButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
