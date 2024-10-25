import 'dart:async';
import 'dart:ui';
import 'package:app/Pages/Home/Settings/UpdatePassword.dart/newPassword.dart';
import 'package:app/widgets/Buttons/loginButton.dart';
import 'package:app/widgets/otherOption.dart';
import 'package:flutter/material.dart';

class HomeOtp extends StatefulWidget {
  @override
  _HomeOtpState createState() => _HomeOtpState();
}

class _HomeOtpState extends State<HomeOtp> {
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;

  // TextEditingControllers to capture input values
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  String text1 = 'Did\'nt get the Otp? ';
  String text2 = 'Resend Code';
  int countdown = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      text1 = 'OTP sent successfully. Try again in ';
      text2 = '$countdown s';
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
          text2 = '$countdown s';
        });
      } else {
        timer.cancel();
        setState(() {
          text1 = 'Did\'nt get the Otp? ';
          text2 = 'Resend Code';
          countdown = 60;
        });
      }
    });
  }

  // Function to validate OTP fields
  void _validateOtp(BuildContext context) {
    if (otpController1.text.isEmpty ||
        otpController2.text.isEmpty ||
        otpController3.text.isEmpty ||
        otpController4.text.isEmpty) {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the OTP fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Navigate to the next screen if all fields are filled
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => HomeNewpassword(),
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.13,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'We\'ve sent an OTP to ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(107, 107, 107, 1)),
                              ),
                              Text(
                                '96968882888 ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Text(
                        'Please check your phone.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(107, 107, 107, 1),
                        ),
                      ),
                      // Increased size of OTP image
                      Center(
                        child: SizedBox(
                          child: Image.asset('assets/img/otp.png'),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildOtpField(context, focusNode1, focusNode2,
                                otpController1),
                            SizedBox(width: 20),
                            _buildOtpField(context, focusNode2, focusNode3,
                                otpController2),
                            SizedBox(width: 20),
                            _buildOtpField(context, focusNode3, focusNode4,
                                otpController3),
                            SizedBox(width: 20),
                            _buildOtpField(
                                context, focusNode4, null, otpController4),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Loginbutton(
                        text: 'Verify',
                        function: () {
                          _validateOtp(context);
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      Otheroption(
                        text1: text1,
                        text2: text2,
                        function: _startTimer,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, FocusNode currentFocus,
      FocusNode? nextFocus, TextEditingController controller) {
    return SizedBox(
      width: 30,
      height: 60,
      child: TextFormField(
        focusNode: currentFocus,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: Theme.of(context).colorScheme.secondary,
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}
