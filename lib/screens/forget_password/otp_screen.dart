import 'package:flutter/material.dart';
import 'package:locus/widgets/button.dart';

class OtpScreen extends StatefulWidget {
  final VoidCallback onTap;
  const OtpScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpControllers = List.generate(4, (_) => TextEditingController());
  String? _errorText;

  void _verifyOtp() {
    final otp = _otpControllers.map((c) => c.text).join();

    if (otp.length < 4 || otp.contains(RegExp(r'\D'))) {
      setState(() {
        _errorText = "Please enter a valid 4-digit OTP";
      });
    } else {
      setState(() {
        _errorText = null;
      });

      // Navigate to new password screen
      widget.onTap;
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
                'OTP Verification',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.primary,
                ),
              ),
              const SizedBox(height: 10),

              /// Subtitle
              Text(
                'We sent the OTP to your email',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.tertiary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '.......@gmail.com. Use the code to verify.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CrimsonText-Bold',
                  color: theme.tertiary,
                ),
              ),
              const SizedBox(height: 30),

              /// OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    height: 55,
                    width: 55,
                    child: TextField(
                      controller: _otpControllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      _errorText!,
                      style: TextStyle(
                        color: theme.error,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 30),

              /// Verify Button
              Buttons(hintText: 'Verify', onTap: _verifyOtp),
              const SizedBox(height: 20),

              /// OTP Expiry Message
              Center(
                child: Text(
                  'OTP will expire in 30 sec',
                  style: TextStyle(
                    fontFamily: 'CrimsonText-Bold',
                    fontSize: 16,
                    color: theme.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Is OTP expired?',
                    style: TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 18,
                      color: theme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("OTP resent"),
                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
