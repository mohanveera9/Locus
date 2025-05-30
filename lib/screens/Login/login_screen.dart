import 'package:flutter/material.dart';
import 'package:locus/screens/Login/register_screen.dart';
import 'package:locus/screens/forget_password/forget_password.dart';
import 'package:locus/screens/home/main_screen.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void handleLogin() {
    setState(() {
      emailError = null;
      passwordError = null;

      final email = _emailController.text.trim();
      final password = _passwordController.text;

      final emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
      final isEmailValid = RegExp(emailPattern).hasMatch(email);

      if (email.isEmpty) {
        emailError = "Email can't be empty";
      } else if (!isEmailValid) {
        emailError = "Invalid email address";
      }

      if (password.isEmpty) {
        passwordError = "Password can't be empty";
      } else if (password.length < 6) {
        passwordError = "Password must be at least 6 characters";
      }

      if (emailError == null && passwordError == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (builder) => Mainscreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
            child: Column(
              children: [
                Text(
                  "LOCUS",
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'CrimsonText-Bold',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'CrimsonText-Bold',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'Please log in to continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'CrimsonText-Bold',
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                InputFields(
                  icon: Icon(Icons.email),
                  hinttext: 'Email',
                  errorText: emailError,
                  isPassword: false,
                  controller: _emailController,
                  onChanged: (value) {
                    if (emailError != null) {
                      setState(() {
                        emailError = null;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InputFields(
                  icon: Icon(Icons.lock),
                  hinttext: 'Enter Password',
                  errorText: passwordError,
                  suffixicon: const Icon(Icons.remove_red_eye),
                  isPassword: true,
                  controller: _passwordController,
                  onChanged: (value) {
                    if (passwordError != null) {
                      setState(() {
                        passwordError = null;
                      });
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "CrimsonText-Bold",
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Buttons(
                  hintText: "Login",
                  onTap: handleLogin,
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontFamily: 'CrimsonText-Bold',
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                          fontFamily: 'CrimsonText-Bold',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
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
