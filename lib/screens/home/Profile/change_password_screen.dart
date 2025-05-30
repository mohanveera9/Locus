import 'package:flutter/material.dart';
import 'package:locus/screens/Login/login_screen.dart';
import 'package:locus/screens/home/Profile/profile_screen.dart';
import 'package:locus/widgets/input_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _oldPasswordError;
  String? _newPasswordError;
  String? _confirmPasswordError;

  void _submitPassword() {
    setState(() {
      _newPasswordError = null;
      _confirmPasswordError = null;
      _oldPasswordError = null;
    });

    final oldPassword = _oldPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    bool hasError = false;

    if (oldPassword.isEmpty) {
      setState(() {
        _oldPasswordError = "Old password is required";
      });
      hasError = true;
    }

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
      Navigator.of(context).pop();
      QuickAlert.show(
        barrierDismissible: true,
        context: context,
        type: QuickAlertType.success,
        title: 'Password changed successfully',
        confirmBtnText: 'Close',
        showConfirmBtn: false,
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        confirmBtnTextStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'CrimsonText-Bold',
          color: Colors.white,
        ),
        autoCloseDuration: Duration(seconds: 3)
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                hinttext: 'Old Password',
                isPassword: true,
                controller: _oldPasswordController,
                errorText: _oldPasswordError,
              ),
              const SizedBox(height: 20),
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
                    'Update Password',
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
