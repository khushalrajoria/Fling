import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/gender_details_screen/gender_details_screen.dart';
import '../../core/app_export.dart';
import 'package:csc_picker/csc_picker.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../gender_details_screen/provider/gender_details_provider.dart';
import 'provider/page_1_sign_up_provider.dart';

class Page1SignUpScreen extends StatefulWidget {
  final String email;
  final String password;

  Page1SignUpScreen({required this.email, required this.password});

  @override
  Page1SignUpScreenState createState() => Page1SignUpScreenState();

  static Widget builder(BuildContext context,) {
    return ChangeNotifierProvider(
      create: (context) => Page1SignUpProvider(),
      child: Page1SignUpScreen(email: '', password: ''),
    );
  }
}

class Page1SignUpScreenState extends State<Page1SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _countryValue ='country';
  String? name;
  String? dateOfBirth;
  int age = 0;

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
                    style: theme.textTheme.displaySmall,
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
                            style: TextStyle(color: Colors.black),
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
            name = value;
            return null;
          },
          borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryTL12,
        );
      },
    );
  }

  Widget _buildDate(BuildContext context) {
    return Selector<Page1SignUpProvider, TextEditingController?>(
      selector: (context, provider) => provider.dateController,
      builder: (context, dateController, child) {
        return GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              DateTime currentDate = DateTime.now();
              age = currentDate.year - pickedDate.year;
              if (pickedDate.month >= currentDate.month) {
                if (pickedDate.day > currentDate.day) {
                  age++;
                }
              }
              String formattedDate =
                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
              dateController?.text = formattedDate;
              dateOfBirth = formattedDate;
            }
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              controller: dateController,
              hintText: "msg_enter_your_birth".tr,
              borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryTL12,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCountry(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CSCPicker(
        showStates: false,
        flagState: CountryFlag.ENABLE,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(250, 249, 246, 1),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        countrySearchPlaceholder: "Country",
        countryDropdownLabel: "$_countryValue",
        dropdownHeadingStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        dropdownItemStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        dropdownDialogRadius: 10.0,
        searchBarRadius: 10.0,
        onCountryChanged: (value) {
          setState(() {
            _countryValue = value;
          });
        },
      ),
    );
  }

  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_next".tr,
       buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(appTheme.deepcyanA200)),
      buttonTextStyle: TextStyle(color: Colors.white),
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 51.v,
      ),
      // buttonTextStyle: theme.textTheme.titleMedium!,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          if (name != null && dateOfBirth != null && _countryValue != null) {
            if (age < 18) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Age is Less than 18')));
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<GenderDetailsProvider>(
                        create: (context) => GenderDetailsProvider(),
                        child: GenderDetailsScreen(
                          email: widget.email,
                          password: widget.password,
                          fullName: name!,
                          dateOfBirth: dateOfBirth!,
                          country: _countryValue!,
                        ),
                      ),
                )
              );
            }
          }
        }
      },
    );
  }
}
