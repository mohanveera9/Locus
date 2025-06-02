import 'package:flutter/material.dart';

class BlocklistContainer extends StatelessWidget {
  final String name;
  final String img;
  const BlocklistContainer({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.transparent,
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
          trailing: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF003B73),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            ),
            onPressed: () {
              // Handle unblock logic
            },
            child: const Text(
              'Unblock',
              style: TextStyle(
                fontFamily: 'CrimsonText-Bold',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
