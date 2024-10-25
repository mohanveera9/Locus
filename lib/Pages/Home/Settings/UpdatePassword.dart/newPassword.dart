import 'dart:ui';
import 'package:app/Pages/Home/Settings/settings.dart';
import 'package:app/widgets/Buttons/button.dart';
import 'package:app/widgets/Buttons/loginButton.dart';
import 'package:app/widgets/smallText.dart';
import 'package:app/widgets/terms.dart';
import 'package:flutter/material.dart';

class HomeNewpassword extends StatefulWidget {
  @override
  State<HomeNewpassword> createState() => _HomeNewpasswordState();
}

class _HomeNewpasswordState extends State<HomeNewpassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _matchpasswordController =
      TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return AlertDialog(
            backgroundColor: Color.fromRGBO(21, 21, 21, 1),
            title: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.done,
                color: Colors.green,
                size: 24,
              ),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your password has been updated!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: Button(
                  text: 'Continue',
                  vpadding: width * 0.001,
                  hpadding: height * 0.002,
                  color: Theme.of(context).colorScheme.tertiary,
                  function: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
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
                top: -height * 0.5,
                left: -height * 0.13,
                right: -height * 0.13,
                child: Container(
                  height: height * 1.4,
                  width: height * 1.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 3),
                    Image.asset('assets/img/signup3.png'),
                    const Spacer(flex: 1),
                    const Smalltext(
                      text: 'Please enter your new password',
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New password',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextFormField(
                            controller: _passwordController, // Password
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            obscureText: _obscureText,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            'Re- enter Password',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextFormField(
                            controller: _matchpasswordController, // Password
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            obscureText: _obscureText,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Loginbutton(
                      text: 'Update Password',
                      function: _validateAndLogin,
                    ),
                    const Spacer(flex: 6),
                    Center(child: const Terms()),
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
