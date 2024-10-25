import 'package:flutter/material.dart';
import 'package:locus/Pages/LoginRegister/register/register2.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/inputfeilds.dart';
import 'package:locus/Pages/LoginRegister/loginMain.dart';
import 'package:locus/widgets/otherOptions.dart';

class Register1 extends StatefulWidget {
  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _useridController = TextEditingController();

  bool _isSubmitted = false;

  String? _usernameError;
  String? _emailError;
  String? _useridError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset('assets/img/locus1.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 9,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Text(
                'Register',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Electrolize'),
              ),
              Form(
                key: _formKey,
                autovalidateMode: _isSubmitted
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Inputfields(
                      title: 'Name',
                      emoji: const Icon(Icons.person_2_outlined),
                      controller: _nameController,
                      onTap: (value) {
                        // This placeholder ensures the function doesn't return a validation error string
                        return null;
                      },
                      keyBoard1: false,
                      obscureText: false,
                    ),
                    if (_usernameError != null)
                      Text(
                        _usernameError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    SizedBox(
                      height: 25,
                    ),
                    Inputfields(
                      title: 'Email ID',
                      emoji: const Icon(Icons.email),
                      controller: _emailController,
                      onTap: (value) {
                        return null;
                      },
                      keyBoard1: false,
                      obscureText: false,
                    ),
                    if (_emailError != null)
                      Text(
                        _emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    SizedBox(
                      height: 25,
                    ),
                    Inputfields(
                      title: 'User ID',
                      emoji: const Icon(Icons.person_3),
                      controller: _useridController,
                      onTap: (value) {
                        return null;
                      },
                      keyBoard1: false,
                      obscureText: false,
                    ),
                    if (_useridError != null)
                      Text(
                        _useridError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Button1(
                          title: 'Next',
                          colors: Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onTap: () {
                            setState(() {
                              _isSubmitted = true;
                              _validateForm();
                            });
                            if (_formKey.currentState!.validate() &&
                                _usernameError == null &&
                                _emailError == null &&
                                _useridError == null) {
                              _clearFields();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Register2()),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Otheroptions(
                        text1: 'Already have an account? ',
                        text2: 'Login',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (builder) => Loginmain(),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 9,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    setState(() {
      _usernameError =
          _nameController.text.isEmpty ? "Username is required" : null;
      _emailError = _emailController.text.isEmpty ? "Email is required" : null;
      _useridError =
          _useridController.text.isEmpty ? "User ID is required" : null;
    });
  }

  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
    _useridController.clear();
  }
}
