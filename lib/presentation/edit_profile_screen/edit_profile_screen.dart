import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/core/app_export.dart';
import 'package:open_signup_login_page1_signup/core/utils/size_utils.dart';
import 'package:open_signup_login_page1_signup/localization/app_localization.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // TextEditingController for handling input fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _genderPreferenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
                style: TextStyle(
                  color: appTheme.whiteA700,
                ),
                
                decoration: InputDecoration(
border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white, 
      ),
    ),
                  labelText: 'Name',),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(labelText: 'Country'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _genderPreferenceController,
                decoration: InputDecoration(labelText: 'Gender Preference'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Save changes and navigate back
                  _saveChanges();
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Save',style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    // Get values from input fields
    String newName = _nameController.text;
    String newGender = _genderController.text;
    String newDOB = _dobController.text;
    String newCountry = _countryController.text;
    String newGenderPreference = _genderPreferenceController.text;

    // Perform actions with the new values like saving to database or updating state
    // For now, let's just print them
    print('New Name: $newName');
    print('New Gender: $newGender');
    print('New DOB: $newDOB');
    print('New Country: $newCountry');
    print('New Gender Preference: $newGenderPreference');

    // Navigate back to the previous screen
    Navigator.of(context).pop();
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: InkWell(
        onTap: (() {
           Navigator.of(context).pop();
        }),
        child: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowDown,
          margin: EdgeInsets.only(
            left: 35.h,
            top: 18.v,
            bottom: 17.v,
          ),
        ),
      ),
      title:AppbarSubtitle(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }
}

