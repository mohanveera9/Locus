import 'package:flutter/material.dart';
import 'package:locus/screens/home/Profile/profile_screen.dart';
import 'package:locus/widgets/button.dart';
import 'package:locus/widgets/custome_drop_down.dart';
import 'package:locus/widgets/input_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({super.key});

  @override
  State<CreateNew> createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? titleError;
  String? addressError;
  String? selectedCategory;
  String? categoryError;

  void _validateAndSubmit() {
    setState(() {
      titleError = titleController.text.isEmpty ? 'Title is required' : null;
      addressError =
          addressController.text.isEmpty ? 'Address is required' : null;
      categoryError =
          selectedCategory == null ? 'Please select a category' : null;
    });

    if (titleError == null && addressError == null && categoryError == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => ProfileScreen(),
        ),
      );
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Club created successfully',
        autoCloseDuration: Duration(seconds: 2),
        showConfirmBtn: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create New Club',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _label('Title'),
              const SizedBox(height: 10),
              InputFields(
                icon: const Icon(Icons.text_fields_outlined),
                hinttext: 'Enter Group Title',
                controller: titleController,
                errorText: titleError,
              ),
              const SizedBox(height: 20),
              _label('Business Address'),
              const SizedBox(height: 10),
              InputFields(
                icon: const Icon(Icons.edit_calendar_outlined),
                hinttext: 'Enter Group Description',
                controller: addressController,
                errorText: addressError,
              ),
              const SizedBox(height: 20),
              _label('Tag'),
              const SizedBox(height: 10),
              CustomDropdownInput(
                label: 'Select Category',
                options: ['Category 1', 'Category 2', 'Other'],
                errorText: categoryError,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                    categoryError = null;
                  });
                },
              ),
              const SizedBox(height: 30),
              Buttons(
                hintText: 'Create',
                onTap: _validateAndSubmit,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'CrimsonText-Bold',
        color: Color(0xFF003B73),
      ),
    );
  }
}
