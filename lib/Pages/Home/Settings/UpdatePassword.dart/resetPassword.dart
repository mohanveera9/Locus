import 'package:app/Pages/Home/Settings/UpdatePassword.dart/HomeOtp.dart';
import 'package:app/constants/countryCode.dart';
import 'package:app/widgets/Buttons/loginButton.dart';
import 'package:app/widgets/bigText.dart';
import 'package:app/widgets/terms.dart';
import 'package:flutter/material.dart';

class HomeResetpassword extends StatefulWidget {
  const HomeResetpassword({super.key});

  @override
  State<HomeResetpassword> createState() => _HomeResetpasswordState();
}

class _HomeResetpasswordState extends State<HomeResetpassword> {
  final formKey = GlobalKey<FormState>();
  String? selectedCountryCode = '+91';
  bool _isDropdownError = false;

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _validateAndResetpassword() {
    setState(() {
      _isDropdownError = _phoneNumberController.text.isEmpty ||
          _phoneNumberController.text.length != 10;
    });

    if (formKey.currentState!.validate() && !_isDropdownError) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeOtp(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                top: -height * 0.75,
                left: -height * 0.13,
                right: -height * 0.13,
                child: Container(
                  height: height * 1.4,
                  width: height * 1.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 5),
                    Image.asset('assets/img/resetPassword.png'),
                    const Spacer(flex: 3),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Bigtext(text: 'Need help?'),
                    ),
                    const Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Bigtext(text: 'Let\'s reset your password'),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.16,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    value: selectedCountryCode,
                                    decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorText: _isDropdownError ? ' ' : null,
                                    ),
                                    isDense: true,
                                    iconSize: 20,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    dropdownColor: Colors.black,
                                    iconEnabledColor: Colors.white,
                                    elevation: 0,
                                    items: countryCodes
                                        .map((Map<String, String> country) {
                                      return DropdownMenuItem<String>(
                                        value: country['code'],
                                        child: SizedBox(
                                          width: width * 0.4,
                                          child: Text(
                                            '${country['code']} ${country['name']}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCountryCode = newValue;
                                      });
                                    },
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return countryCodes.map<Widget>(
                                          (Map<String, String> country) {
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            country['code']!,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _phoneNumberController, // Phone Number
                                  cursorColor:
                                      Theme.of(context).colorScheme.secondary,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    } else if (value.length != 10) {
                                      return 'Mobile number must be 10 digits';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Loginbutton(
                      text: 'Resetpassword',
                      function: _validateAndResetpassword,
                    ),
                    const Spacer(flex: 9),
                    const Align(
                      alignment: Alignment.center,
                      child: Terms(),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).maybePop();
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
