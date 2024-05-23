import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../gender_details_screen/provider/gender_details_provider.dart';

class GenderDetailsScreen extends StatefulWidget {
  const GenderDetailsScreen({Key? key}) : super(key: key);

  @override
  GenderDetailsScreenState createState() => GenderDetailsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GenderDetailsProvider(),
      child: GenderDetailsScreen(),
    );
  }
}

class GenderDetailsScreenState extends State<GenderDetailsScreen> {
  String? selectedOption;
  int? selectedButtonIndex; 
  String _addMoreButton1Text = 'Add more About your Gender as man ';
String _addMoreButton2Text = 'Add more About your Gender as Woman';
String _addMoreButton3Text = 'Add more About your Gender as Non-Binary';// Track the index of the selected button

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
                "lbl_gender".tr,
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
         Icon(Icons.arrow_drop_down_outlined, color: Colors.white,size: 25,),
         SizedBox(width: 3,),
        Text(
          _addMoreButton1Text,
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
         Icon(Icons.arrow_drop_down_outlined, color: Colors.white,size: 25,),
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
        bottomNavigationBar: _buildNext(context),
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
        onTapNext(context);
      },
    );
  }

  void onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.page2SignUpScreen,
    );
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
                  'Add more about your gender',
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
}