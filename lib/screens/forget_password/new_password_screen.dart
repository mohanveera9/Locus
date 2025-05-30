import 'package:flutter/material.dart';
import 'package:locus/screens/Login/login_screen.dart';
import 'package:locus/widgets/input_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _newPasswordError;
  String? _confirmPasswordError;

  void _submitPassword() {
    setState(() {
      _newPasswordError = null;
      _confirmPasswordError = null;
    });

    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    bool hasError = false;

    if (newPassword.isEmpty || newPassword.length < 6) {
      setState(() {
        _newPasswordError = 'Password must be at least 6 characters';
      });
      hasError = true;
    }

    if (confirmPassword.isEmpty || confirmPassword.length < 6) {
      setState(() {
        _confirmPasswordError = 'Confirm your password properly';
      });
      hasError = true;
    }

    if (newPassword != confirmPassword) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
      });
      hasError = true;
    }

    if (!hasError) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Password changed successfully',
        confirmBtnText: 'Login',
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        confirmBtnTextStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'CrimsonText-Bold',
          color: Colors.white,
        ),
        onConfirmBtnTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded, size: 40),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Create new Password',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Please enter a strong password and confirm it.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CrimsonText-Bold',
                  color: const Color(0xFF696767),
                ),
              ),
              const SizedBox(height: 30),
              InputFields(
                icon: const Icon(Icons.lock),
                hinttext: 'New Password',
                isPassword: true,
                controller: _newPasswordController,
                errorText: _newPasswordError,
              ),
              const SizedBox(height: 20),
              InputFields(
                icon: const Icon(Icons.lock),
                hinttext: 'Confirm Password',
                isPassword: true,
                controller: _confirmPasswordController,
                errorText: _confirmPasswordError,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: _submitPassword,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'CrimsonText-Bold',
                    ),
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
