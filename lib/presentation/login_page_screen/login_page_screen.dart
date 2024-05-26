import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/config.dart';
import 'package:open_signup_login_page1_signup/presentation/open_page_screen/open_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/login_page_model.dart';
import 'provider/login_page_provider.dart';
import 'package:http/http.dart' as http;

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginPageScreenState createState() => LoginPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      child: LoginPageScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginPageScreenState extends State<LoginPageScreen> {
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
                  horizontal: 27.h,
                  vertical: 25.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 45.v),
                    Text(
                      "lbl_login_to_klick".tr,
                      style: theme.textTheme.displaySmall,
                    ),
                    SizedBox(height: 28.v),
                    _buildEmailField(context),
                    SizedBox(height: 37.v),
                    _buildPasswordField(context),
                    Spacer(),
                    _buildLoginButton(context),
                    SizedBox(height: 20.v),
                    _buildSignInWithButton(context),
                    SizedBox(height: 12.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtDonthaveanaccount(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_don_t_have_an_account2".tr,
                              style: CustomTextStyles
                                  .bodyLargeTiroDevanagariHindiOnPrimary17,
                            ),
                            TextSpan(
                              text: "lbl_sign_up".tr,
                              style: CustomTextStyles
                                  .bodyLargeTiroDevanagariHindiPrimary,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10,)

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
      padding: EdgeInsets.only(left: 7.h),
      child: Selector<LoginPageProvider, TextEditingController?>(
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
      padding: EdgeInsets.only(left: 7.h),
      child: Selector<LoginPageProvider, TextEditingController?>(
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
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_login".tr,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 5.h,
      ),
      buttonTextStyle: theme.textTheme.titleLarge!,
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 31, 243, 197))),
      onPressed: (){
        loginButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildSignInWithButton(BuildContext context) {
    return CustomOutlinedButton(
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      text: "msg_sign_in_with_google".tr,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 5.h,
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
        onTapSignInWithButton(context);
      },
    );
  }

  onTapSignInWithButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        Navigator.of(context).pushNamed(AppRoutes.homePageContainerScreen);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the signupPageScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupPageScreen,
    );
  }
}
void loginButton(BuildContext context) async{
  final provider = Provider.of<LoginPageProvider>(context, listen: false);
  final email = provider.emailFieldController;
  final password = provider.passwordFieldController;
  if (email.text.isNotEmpty && password.text.isNotEmpty) {
    var body={
      "email":email.text,
      "password":password.text
    };

    var response =await http.post(
        Uri.parse(loginRoute),
        headers: {
          "content-type":"application/json"
        },
        body: jsonEncode(body));
    var resp =jsonDecode(response.body);
    print("Came Here 1");
    if(resp['msg']['statusCode']==200){
      print("Came Here 2");
      var sharedPref=await SharedPreferences.getInstance();
      sharedPref.setBool(OpenPageScreenState.keyLogin, true);
      print("Final Came Here");
      Navigator.of(context).pushNamed(AppRoutes.homePageContainerScreen);
    }else if(resp['msg']['statusCode']==402){
      print("login failure Came Here");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Incorrect Email or password')));
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error Signing In, Try Again Later')));
    }

  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Email or Password is Null')));
  }
}
