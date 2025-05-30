import 'package:flutter/material.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _nameError;
  String? _phoneError;

  void _validateAndSave() {
    setState(() {
      _nameError = _nameController.text.isEmpty ? 'Name cannot be empty' : null;
      _phoneError = _phoneController.text.isEmpty
          ? 'Phone number is required'
          : (_phoneController.text.length != 10 ? 'Enter valid 10-digit number' : null);
    });

    if (_nameError == null && _phoneError == null) {
      // Save logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
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
          'Edit Profile',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2.0),
                        color: Colors.white,
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/img/profile1.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 60,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'CrimsonText-Bold',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              InputFields(
                icon: const Icon(Icons.person),
                hinttext: 'Name',
                controller: _nameController,
                errorText: _nameError,
              ),
              const SizedBox(height: 20),
              Text(
                'Phone',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'CrimsonText-Bold',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              InputFields(
                icon: const Icon(Icons.phone),
                hinttext: 'Phone',
                controller: _phoneController,
                errorText: _phoneError,
              ),
              const SizedBox(height: 30),
              Buttons(
                hintText: 'Save',
                onTap: _validateAndSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
