import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  String? _selectedCountry;
  List<String> _countries = [
    'Everywhere',
   'India',
  'Pakistan',
  'USA','Russia','Afghanistan','Albania','Algeria','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','Brunei','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Central African Republic','Chad','Chile','China','Colombia','Comoros','Congo','Costa Rica','Croatia','Cuba','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Fiji','Finland','France','Gabon','Gambia','Georgia','Germany','Ghana','Greece','Grenada','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hungary','Iceland','Indonesia','Iran','Iraq','Ireland','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Kosovo','Kuwait','Kyrgyzstan','Laos','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Zealand','Nicaragua','Niger','Nigeria','North Korea','North Macedonia','Norway','Oman','Palau','Palestine','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Qatar','Romania','Rwanda','Saint Kitts and Nevis','Saint Lucia','Saint Vincent and the Grenadines','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Solomon Islands','Somalia','South Africa','South Korea','South Sudan','Spain','Sri Lanka','Sudan','Suriname','Sweden',
  'Switzerland',
  'Syria','Taiwan','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Tuvalu','Uganda','Ukraine',
  'United Arab Emirates','United Kingdom','Uruguay','Uzbekistan','Vanuatu','Vatican City','Venezuela','Vietnam','Yemen','Zambia','Zimbabwe',
    
  ];

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
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  iconSize: 40,
                  iconEnabledColor: Colors.white,
                  hint: Text('Select preferred country',textScaler: TextScaler.linear(1.2),style: TextStyle(color: Colors.white,),),
                  value: _selectedCountry,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCountry = newValue;});},
                  items: _countries.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                
                      child: Text(value,style: TextStyle(color: Colors.white,),),
                    );
                  }).toList(),
                ),
              ),
            ),
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
        if (_selectedCountry != null) {
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
              selectedCountry: _selectedCountry!,
           )  ),
      ),
    );
  }

}