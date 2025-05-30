import 'package:flutter/material.dart';
import 'package:locus/screens/home/main_screen.dart';
import 'package:locus/widgets/custome_drop_down.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/input_field.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _NextPageState();
}

class _NextPageState extends State<Register2> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  String? selectedGender;

  String? nameError;
  String? usernameError;
  String? genderError;

  void handleRegister() {
    final name = nameController.text.trim();
    final username = usernameController.text.trim();

    setState(() {
      nameError = null;
      usernameError = null;

      if (name.isEmpty) nameError = 'Name is required';
      if (username.isEmpty) usernameError = 'Username is required';
      if (selectedGender != null) genderError = 'Gender is required';

      if (nameError == null &&
          usernameError == null &&
          selectedGender != null) {
        // All good – navigate
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
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  "LOCUS",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'CrimsonText-Bold',
                    color: theme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InputFields(
                icon: const Icon(Icons.person),
                hinttext: 'Name',
                controller: nameController,
                errorText: nameError,
                onChanged: (_) {
                  if (nameError != null) setState(() => nameError = null);
                },
              ),
              const SizedBox(height: 20),
              InputFields(
                icon: const Icon(Icons.person),
                hinttext: 'Username',
                controller: usernameController,
                errorText: usernameError,
                onChanged: (_) {
                  if (usernameError != null)
                    setState(() => usernameError = null);
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomDropdownInput(
                  label: 'Gender',
                  options: ['Male', 'Female', 'Other'],
                  onChanged: (value) {
                    selectedGender = value;
                  },
                ),
              ),
              if (genderError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    genderError!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Buttons(
                hintText: 'Register',
                onTap: handleRegister,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
