import 'package:flutter/material.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';
import 'package:locus/widgets/profile/step_indicator.dart';

class Zone2Screen extends StatefulWidget {
  const Zone2Screen({super.key});

  @override
  State<Zone2Screen> createState() => _Zone2ScreenState();
}

class _Zone2ScreenState extends State<Zone2Screen> {
  final TextEditingController _zoneNameController = TextEditingController();
  final TextEditingController _zoneTagController = TextEditingController();

  String? _zoneNameError;
  String? _zoneTagError;

  void _handleSubmit() {
    setState(() {
      _zoneNameError = _zoneNameController.text.trim().isEmpty
          ? 'Zone Name is required'
          : null;
      _zoneTagError = _zoneTagController.text.trim().isEmpty
          ? 'Zone Tag is required'
          : null;
    });

    if (_zoneNameError == null && _zoneTagError == null) {
      _showSuccessDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
          'Zone',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '2-Step Process :',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CrimsonText-Bold',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              const StepIndicator(currentStep: 1),
              const SizedBox(height: 30),
              Text(
                'Zone Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'CrimsonText-Bold',
                  color: Color(0xFF003B73),
                ),
              ),
              InputFields(
                controller: _zoneNameController,
                icon: const Icon(Icons.location_city),
                hinttext: 'Enter Zone Name',
                errorText: _zoneNameError,
              ),
              const SizedBox(height: 20),
              Text(
                'Zone Tag',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'CrimsonText-Bold',
                  color: Color(0xFF003B73),
                ),
              ),
              InputFields(
                controller: _zoneTagController,
                icon: const Icon(Icons.tag),
                hinttext: 'Enter Zone Tag',
                errorText: _zoneTagError,
              ),
              const SizedBox(height: 30),
              Buttons(
                hintText: 'Next',
                onTap: _handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Zone Created Successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
