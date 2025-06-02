import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  final String clubTitle;
  final String clubEmail;
  final String clubDescription;
  final String presidentName;
  final String imageUrl;

  const UserInfoScreen({
    Key? key,
    required this.clubTitle,
    required this.clubEmail,
    required this.clubDescription,
    required this.presidentName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          clubTitle,
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2.0),
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  clubTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  clubEmail,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  clubDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "President : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(presidentName),
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
