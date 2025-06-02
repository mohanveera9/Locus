import 'package:flutter/material.dart';
import 'package:locus/screens/Login/login_screen.dart';
import 'package:locus/screens/Login/register_2.dart';
import 'package:locus/screens/forget_password/otp_screen.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void handleRegister() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      emailError = null;
      passwordError = null;
      confirmPasswordError = null;

      if (email.isEmpty || !email.contains('@')) {
        emailError = 'Please enter a valid email';
      }
      if (password.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      }
      if (confirmPassword != password) {
        confirmPasswordError = 'Passwords do not match';
      }

      if (emailError == null &&
          passwordError == null &&
          confirmPasswordError == null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (builder) => OtpScreen(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => Register2(),
                  ),
                );
              },
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
            child: Column(
              children: [
                Text(
                  "LOCUS",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'CrimsonText-Bold',
                    color: theme.primary,
                  ),
                ),
                Text(
                  'Register Now!',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'CrimsonText-Bold',
                    color: theme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                InputFields(
                  icon: const Icon(Icons.email),
                  hinttext: 'Email ID',
                  controller: _emailController,
                  errorText: emailError,
                  onChanged: (_) {
                    if (emailError != null) {
                      setState(() => emailError = null);
                    }
                  },
                ),
                const SizedBox(height: 20),
                InputFields(
                  icon: const Icon(Icons.lock),
                  hinttext: 'Password',
                  isPassword: true,
                  suffixicon: const Icon(Icons.remove_red_eye),
                  controller: _passwordController,
                  errorText: passwordError,
                  onChanged: (_) {
                    if (passwordError != null) {
                      setState(() => passwordError = null);
                    }
                  },
                ),
                const SizedBox(height: 20),
                InputFields(
                  icon: const Icon(Icons.lock),
                  hinttext: 'Confirm Password',
                  isPassword: true,
                  suffixicon: const Icon(Icons.remove_red_eye),
                  controller: _confirmPasswordController,
                  errorText: confirmPasswordError,
                  onChanged: (_) {
                    if (confirmPasswordError != null) {
                      setState(() => confirmPasswordError = null);
                    }
                  },
                ),
                const SizedBox(height: 25),
                Buttons(
                  hintText: "Register",
                  onTap: handleRegister,
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'CrimsonText-Bold',
                        fontSize: 20,
                        color: theme.tertiary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          fontFamily: 'CrimsonText-Bold',
                          fontSize: 20,
                          color: theme.primary,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
