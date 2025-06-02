import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminInfoScreen extends StatefulWidget {
  const AdminInfoScreen({super.key});

  @override
  State<AdminInfoScreen> createState() => _AdminInfoScreenState();
}

class _AdminInfoScreenState extends State<AdminInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  String title = 'Research & Innovation Club';
  String email = 'researchinnovate@gmail.com';
  String description =
      "This club is ideal if you're interested in going beyond classroom learning to explore new ideas, build prototypes, or even publish academic papers.";
  String president = 'Ravi Varma';

  File? imageFile;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  void saveInfo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // You can now send this data to a backend or Firebase
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Information saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
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
        automaticallyImplyLeading: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.edit,
                            color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(
                  labelText: 'Club Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => title = val!,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => email = val!,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: description,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => description = val!,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: president,
                decoration: const InputDecoration(
                  labelText: 'President Name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => president = val!,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: saveInfo,
                icon: const Icon(Icons.save),
                label: const Text('Save Info'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
