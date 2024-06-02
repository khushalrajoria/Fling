import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../open_page_screen/open_page_screen.dart';

import 'provider/login_page_provider.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  LoginPageScreenState createState() => LoginPageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      child: const LoginPageScreen(),
    );
  }
}

class LoginPageScreenState extends State<LoginPageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 25.v),
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
                    const Spacer(),
                    _buildLoginButton(context),
                    SizedBox(height: 20.v),
                    _buildSignInWithButton(context),
                    SizedBox(height: 12.v),
                    GestureDetector(
                      onTap: () => onTapTxtDonthaveanaccount(context),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_don_t_have_an_account2".tr,
                              style: CustomTextStyles.bodyLargeTiroDevanagariHindiOnPrimary17,
                            ),
                            TextSpan(
                              text: "lbl_sign_up".tr,
                              style: CustomTextStyles.bodyLargeTiroDevanagariHindiPrimary,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
              if (value == null || (!isValidPassword(value, isRequired: true))) {
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

  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_login".tr,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      buttonTextStyle: theme.textTheme.titleLarge!,
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 31, 243, 197))),
      onPressed: () => loginButton(context),
    );
  }

  Widget _buildSignInWithButton(BuildContext context) {
    return CustomOutlinedButton(
      buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      text: "msg_sign_in_with_google".tr,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 30.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      onPressed: () => onTapSignInWithButton(context),
    );
  }

  void onTapSignInWithButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) async {
      if (googleUser != null) {
        String? email = googleUser.email;
        var body={
          "email":email
        };
        var response =await http.post(
            Uri.parse(signinwithgoogleroute),
            headers: {
              "content-type":"application/json"
            },
            body: jsonEncode(body));
        var resp =jsonDecode(response.body);
        if(resp['msg']!=null){
      var sharedPref=await SharedPreferences.getInstance();
      await sharedPref.setBool(OpenPageScreenState.keyLogin, true);
      await sharedPref.setInt(OpenPageScreenState.uId , int.parse(resp['msg']));
      Navigator.of(context).pushNamed(AppRoutes.homePageContainerScreen);
      }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Don't Exist Kindly Sign Up")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  void onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.signupPageScreen);
  }

  Future<void> loginButton(BuildContext context) async {
  final provider = Provider.of<LoginPageProvider>(context, listen: false);
  final email = provider.emailFieldController?.text ?? '';
  final password = provider.passwordFieldController?.text ?? '';

  if (email.isNotEmpty && password.isNotEmpty) {
    var body = {"email": email, "password": password};

    try {
      var response = await http.post(
        Uri.parse(loginRoute),
        headers: {"content-type": "application/json"},
        body: jsonEncode(body),
      );

      // Log the response body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var resp = jsonDecode(response.body);
        if (resp['msg']['statusCode'] == 200) {
          var sharedPref = await SharedPreferences.getInstance();
          await sharedPref.setBool(OpenPageScreenState.keyLogin, true);
          await sharedPref.setInt(OpenPageScreenState.uId, int.parse(resp['msg']['userId']));
          Navigator.of(context).pushNamed(AppRoutes.homePageContainerScreen);
        } else if (resp['msg']['statusCode'] == 402) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect Email or password')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error Signing In, Try Again Later')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Server Error: ${response.statusCode}')));
      }
    } catch (error) {
      // Log the error
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error Signing In, Try Again Later')));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email or Password is Null')),
    );
  }
}
}
