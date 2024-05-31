import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:open_signup_login_page1_signup/presentation/gender_preference_screen/gender_preference_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'dart:io';

import '../gender_preference_screen/provider/gender_preference_provider.dart';

class CountryPreferenceScreen extends StatefulWidget {

  final String email;
  final String password;
  final String fullName;
  final String dateOfBirth;
  final String country;
  final String gender;
  final String snapId;
  final String instaId;
  final File? imageFile;
  final File? imageFile1;
  final File? imageFile2;

  CountryPreferenceScreen({
    required this.email,
    required this.password,
    required this.fullName,
    required this.dateOfBirth,
    required this.country,
    required this.gender,
    required this.snapId,
    required this.instaId,
    required this.imageFile,
    required this.imageFile1,
    required this.imageFile2,
  });
  @override
  _CountryPreferenceScreenState createState() => _CountryPreferenceScreenState();
}

class _CountryPreferenceScreenState extends State<CountryPreferenceScreen> {

  String? countryValue='country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 31.h,
            vertical: 11.v,
          ),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              SizedBox(height: 85.v),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Country Prefrence",
                      style: theme.textTheme.headlineLarge,
                    ),
              SizedBox(height: 10.v),
              Text(
                "Select the country of which you want\n to be suggested more people from",
                style: theme.textTheme.titleSmall,
              ),
                  ],
                ),
              ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  CSCPicker(
                  showStates: false,
                  flagState: CountryFlag.ENABLE,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                            countrySearchPlaceholder: "Country",
                  countryDropdownLabel: "$countryValue",

                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
              ),
            ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildSignUp(context),
    );
  }


   Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      text: "Next",
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 57.v,
      ),
      onPressed: (){
        if (countryValue != 'country') {
                  // Navigator.of(context).pushNamed(AppRoutes.genderPreferenceScreen);
                onTapNextButton(context);

                } else {
                  // Optionally show a message to select a country before proceeding
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a country first'),
                    ),
                  );
                }
      },
    );
  }
  onTapNextButton(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.genderPreferenceScreen,
    // );
    Navigator.of(context).push(
      MaterialPageRoute(
         builder: (context) => ChangeNotifierProvider<GenderPreferenceProvider>(
           create: (context) => GenderPreferenceProvider(),
       child: 
            GenderPreferenceScreen(
              email: widget.email,
              password: widget.password,
              fullName: widget.fullName,
              dateOfBirth: widget.dateOfBirth,
              country: widget.country,
              gender: widget.gender,
              snapId: widget.snapId,
              instaId: widget.instaId,
              imageFile: widget.imageFile,
              imageFile1: widget.imageFile1,
              imageFile2: widget.imageFile2,
              selectedCountry: countryValue!,
           )  ),
      ),
    );
  }

}