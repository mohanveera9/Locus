import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final String name;
  final String hintname;
  final VoidCallback onTap;
  final String img;

  const ChatContainer({
    super.key,
    required this.name,
    required this.hintname,
    required this.onTap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(img),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'CrimsonText-Bold',
        ),
      ),
      subtitle: Text(
        hintname,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: 'CrimsonText-Bold',
          color: Colors.grey,
        ),
      ),
      onTap: onTap, 
    );
  }
}
