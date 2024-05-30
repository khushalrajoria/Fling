import 'dart:convert';

import 'package:flutter/material.dart';
import '../../config.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/gender_preference_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class GenderPreferenceScreen extends StatefulWidget {
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
  final String selectedCountry;

  GenderPreferenceScreen({
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
    required this.selectedCountry,
  });

  @override
  GenderPreferenceScreenState createState() => GenderPreferenceScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GenderPreferenceProvider(),
      child: GenderPreferenceScreen(
        email: '',
        password: '',
        fullName: '',
        dateOfBirth: '',
        country: '',
        gender: '',
        snapId: '',
        instaId: '',
        imageFile1: null,
        imageFile2: null,
        imageFile: null,
        selectedCountry: '',
      ),
    );
  }
}

class GenderPreferenceScreenState extends State<GenderPreferenceScreen> {
  @override

  String? selectedOption;
  int? selectedButtonIndex;
  String _addMoreButton1Text = 'Add more About your Prefrence ';
String _addMoreButton2Text = 'Add more About your Prefrence ';
String _addMoreButton3Text = 'Add more About your Prefrence';// Track the index of the selected button

  @override
  void initState() {
    super.initState();
    selectedOption = null;
    selectedButtonIndex = null; // Initially, no button is selected
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 30.h,
            top: 109.v,
            right: 30.h,
          ),
          child: Column(
            children: [
              Text(
                "msg_gender_prefrence".tr,
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleButtonPress(0); // Button index 0
                },
                child: Text(
                  "Man",
                  style: theme.textTheme.titleLarge!,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 0 ? Colors.green: null,
                   minimumSize: Size(360, 69)
                ),
              ),
              Visibility(
                visible: selectedButtonIndex == 0, // Show "add more" if button 1 is selected
                child: GestureDetector(
  onTap: () {
    _showBottomSheet(0); // Show bottom sheet for button 1
  },
  child: Container(
    child: Row(
      children: [
        Icon(Icons.arrow_drop_down_outlined, color: Colors.white,size: 35,),
        SizedBox(width: 3),
        Text(
          _addMoreButton1Text,
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800,),
        ),
      ],
    ),
  ),
),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleButtonPress(1); // Button index 1
                },
                child: Text(
                  "Woman",
                  // style: TextStyle(color: Colors.white,fontSize: 24),
                  style: theme.textTheme.titleLarge!,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 1
                      ? Colors.green
                      : null,
                      minimumSize: Size(360, 69)
                ),
              ),
              Visibility(
                visible: selectedButtonIndex == 1, // Show "add more" if button 2 is selected
                child:GestureDetector(
  onTap: () {
    _showBottomSheet(1); // Show bottom sheet for button 2
  },
  child: Container(
    child: Row(
      children: [
         Icon(Icons.arrow_drop_down_outlined, color: Colors.white,size: 35,),
         SizedBox(width: 3,),
        Text(
          _addMoreButton2Text,
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight :FontWeight.w800,),
        ),
      ],
    ),
  ),
),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleButtonPress(2); // Button index 2
                },
                child: Text(
                  "Non Binary ",
                  style: theme.textTheme.titleLarge!,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 2
                      ? Colors.green
                      : null,
                      minimumSize: Size(360, 69)
                ),
              ),
              Visibility(
                visible: selectedButtonIndex == 2, // Show "add more" if button 3 is selected
                child: GestureDetector(
  onTap: () {
    _showBottomSheet(2); // Show bottom sheet for button 3
  },
  child: Container(

    child: Row(
      children: [
         Icon(Icons.arrow_drop_down_outlined, color: Colors.white,size: 25,),
         SizedBox(width: 3,),
        Text(
          _addMoreButton3Text,
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight :FontWeight.w800,),
        ),
      ],
    ),
  ),
),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildSignUp(context),
      ),
    );
  }

  void _handleButtonPress(int buttonIndex) {
    setState(() {
      if (selectedButtonIndex == buttonIndex) {
        // If the same button is clicked again, deselect it
        selectedButtonIndex = null;
      } else {
        // If a different button is clicked, deselect the previous one and select the new one
        selectedButtonIndex = buttonIndex;
      }
    });
  }




  void _updateAddMoreButtonText(int buttonIndex, String selectedOption) {
  setState(() {
    switch (buttonIndex) {
      case 0:
        _addMoreButton1Text = selectedOption;
        break;
      case 1:
        _addMoreButton2Text = selectedOption;
        break;
      case 2:
        _addMoreButton3Text = selectedOption;
        break;
    }
  });
}
  void _showBottomSheet(int buttonIndex) {
  final List<String> options = ['Intersex', 'Trans', 'Also Non-Binary ', 'Cis', 'Prefer Not to Answer'];
  String? selectedOption;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(height: 10.0),
                Text(
                  'Add more about your Prefrence',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = options[index];
                            _updateAddMoreButtonText(buttonIndex, selectedOption!);
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          color: selectedOption == options[index] ? Colors.green : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height: 1,width: double.infinity,color: appTheme.gray900,),
                              SizedBox(height: 15,),
                              Text(
                                options[index],
                                style: TextStyle(
                                  fontSize: 24,
                                  color: selectedOption == options[index] ? Colors.white : null,
                                ),
                              ),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
  onTapNextButton(BuildContext context) async{
    var body={
      "email":widget.email,
      "password":widget.password,
    };
    print("${widget.email}");
    print("${widget.password}");
    print("${widget.country}");
    print("${widget.gender}");
    // var response =await http.post(
    //     Uri.parse(registerRoute), // changed from register route
    //     headers: {
    //       "content-type":"application/json"
    //     },
    //     body: jsonEncode(body));
    // var resp =jsonDecode(response.body);
    // Navigator.of(context).popAndPushNamed(AppRoutes.homePageContainerScreen);

  }
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
      margin: EdgeInsets.only(
        left: 31.h,
        right: 32.h,
        bottom: 57.v,
      ),
      onPressed: (){
        onTapNextButton(context);

      },
    );
  }

}



