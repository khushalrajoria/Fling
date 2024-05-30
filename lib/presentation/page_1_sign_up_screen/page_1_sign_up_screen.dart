import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/presentation/gender_details_screen/gender_details_screen.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../gender_details_screen/provider/gender_details_provider.dart';
import 'provider/page_1_sign_up_provider.dart';

class Page1SignUpScreen extends StatefulWidget {
  // const Page1SignUpScreen({Key? key}) : super(key: key);


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
  // static Widget builder(BuildContext context,String email, String password) {
  //   return ChangeNotifierProvider(
  //     create: (context) => Page1SignUpProvider(),
  //     child: Page1SignUpScreen(email: email, password: password),
  //   );
  // }
}

// ignore_for_file: must_be_immutable

class Page1SignUpScreenState extends State<Page1SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedCountry;
  String? name;
  String? dateOfBirth;
  List<String> _countries = ['India','Pakistan','USA','Russia','Afghanistan','Albania','Algeria','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','Brunei','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada',
  'Central African Republic','Chad','Chile','China','Colombia','Comoros','Congo','Costa Rica','Croatia','Cuba','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Fiji','Finland','France','Gabon','Gambia','Georgia','Germany','Ghana','Greece','Grenada','Guatemala','Guinea','Guinea-Bissau','Guyana',
  'Haiti','Honduras','Hungary','Iceland','Indonesia','Iran','Iraq','Ireland','Israel','Italy','Jamaica','Japan','Jordan',
  'Kazakhstan','Kenya','Kiribati','Kosovo','Kuwait','Kyrgyzstan','Laos','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Zealand',
  'Nicaragua','Niger','Nigeria','North Korea','North Macedonia','Norway','Oman','Palau','Palestine','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Qatar','Romania','Rwanda','Saint Kitts and Nevis','Saint Lucia','Saint Vincent and the Grenadines','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Solomon Islands','Somalia',
  'South Africa','South Korea','South Sudan','Spain','Sri Lanka','Sudan','Suriname','Sweden','Switzerland','Syria','Taiwan','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','Uruguay','Uzbekistan','Vanuatu','Vatican City','Venezuela','Vietnam','Yemen','Zambia','Zimbabwe'
  ];
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
            name=value;
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
        return GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              String formattedDate =
                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
              dateController?.text = formattedDate;
              dateOfBirth=formattedDate;
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

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        dropdownColor: Colors.black,
        iconSize: 40,
        iconEnabledColor: Colors.white,
        hint: Text(
          'lbl_country'.tr,
          textScaler: TextScaler.linear(1.2),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: _selectedCountry,
        isExpanded: true,
        onChanged: (newValue) {
          setState(() {
            _selectedCountry = newValue;
          });
        },
        items: _countries.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
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
        if (_formKey.currentState?.validate() ?? false) {
          print(widget.email);
          print(widget.password);
        if(name!=null && dateOfBirth!=null && _selectedCountry!=null) {
          Navigator.of(context).push(
            MaterialPageRoute(
               builder: (context) => ChangeNotifierProvider<GenderDetailsProvider>(
              create: (context) =>
                  GenderDetailsProvider(),
                  child: GenderDetailsScreen(
                    email: widget.email,
                    password: widget.password,
                    fullName: name!,
                    dateOfBirth: dateOfBirth!,
                    country: _selectedCountry!,
                  ),
                  ),
            ),
          );
        }
        }
      },
    );
  }

}
