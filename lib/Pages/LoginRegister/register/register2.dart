import 'package:flutter/material.dart';
import 'package:locus/Pages/LoginRegister/register/register3.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/inputfeilds.dart';
import 'package:locus/Pages/LoginRegister/loginMain.dart';
import 'package:locus/widgets/otherOptions.dart';

class Register2 extends StatefulWidget {
  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bdayController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  bool _isSubmitted = false;

  String? _bdayError;
  String? _genderError;

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
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'Electrolize',
                ),
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
                      title: 'Birthday',
                      emoji: const Icon(Icons.cake_outlined),
                      controller: _bdayController,
                      onTap: (value) {
                        return null;
                      },
                      keyBoard1: false,
                      obscureText: false,
                      suffixIcon:
                          Icons.calendar_today_outlined, // Calendar icon
                      suffixIconTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            _bdayController.text =
                                '${selectedDate.toLocal()}'.split(' ')[0];
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    Inputfields(
                      title: 'Gender',
                      emoji: const Icon(Icons.email),
                      controller: _genderController,
                      onTap: (value) {
                        return null;
                      },
                      keyBoard1: false,
                      obscureText: false,
                    ),
                    if (_genderError != null)
                      Text(
                        _genderError!,
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
                                _bdayError == null &&
                                _genderError == null) {
                              _clearFields();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Register3(),
                                ),
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

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _bdayController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _validateForm() {
    setState(() {
      _bdayError = _bdayController.text.isEmpty ? "Birthday is required" : null;
      _genderError =
          _genderController.text.isEmpty ? "Gender is required" : null;
    });
  }

  void _clearFields() {
    _bdayController.clear();
    _genderController.clear();
  }
}
