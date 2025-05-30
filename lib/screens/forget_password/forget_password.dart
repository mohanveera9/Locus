import 'package:flutter/material.dart';
import 'package:locus/screens/forget_password/otp_screen.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorText;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  void _handleSendOtp(BuildContext context) {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _errorText = "Email can't be empty");
    } else if (!isValidEmail(email)) {
      setState(() => _errorText = "Enter a valid email address");
    } else {
      setState(() => _errorText = null);
      // Proceed to next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 40,
                  color: theme.primary,
                ),
              ),
              const SizedBox(height: 30),

              /// Title
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.primary,
                ),
              ),
              const SizedBox(height: 10),

              /// Subtitle
              Text(
                'Please enter your email ID to receive OTP',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.tertiary,
                ),
              ),
              const SizedBox(height: 40),

              /// Email Input with error handling
              InputFields(
                icon: const Icon(Icons.email),
                hinttext: 'Email',
                controller: _emailController,
                errorText: _errorText,
              ),
              const SizedBox(height: 30),

              /// Send OTP Button
              Buttons(
                hintText: 'Send OTP',
                onTap: () => _handleSendOtp(context),
              ),
              const SizedBox(height: 14),

              /// Resend OTP Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t receive OTP?',
                    style: TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 18,
                      color: theme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      // Logic to resend OTP
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OTP resent')),
                      );
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontFamily: 'CrimsonText-Bold',
                        fontSize: 18,
                        color: theme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
