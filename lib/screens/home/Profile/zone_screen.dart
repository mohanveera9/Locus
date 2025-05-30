import 'package:flutter/material.dart';
import 'package:locus/screens/home/Profile/zone_2_screen.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/profile/step_indicator.dart';

class ZonePage extends StatefulWidget {
  const ZonePage({super.key});

  @override
  State<ZonePage> createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  String? _selectedOption;

  void _handleNext() {
    if (_selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select Yes or No to proceed.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => Zone2Screen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const StepIndicator(currentStep: 0),
            const SizedBox(height: 30),
            Text(
              'Are you in the zone location you want to create?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'CrimsonText-Bold',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'yes',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Radio<String>(
                      value: 'no',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Buttons(
              hintText: 'Next',
              onTap: _handleNext,
            ),
          ],
        ),
      ),
    );
  }
}
