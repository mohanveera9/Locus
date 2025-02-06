import 'package:flutter/material.dart';

class ChatBubbleUser extends StatelessWidget {
  final String message;
  final String time;
  final String profileImg;
  final bool isProfile;

  const ChatBubbleUser({
    super.key,
    required this.message,
    required this.time,
    required this.profileImg,
    required this.isProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isProfile)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(profileImg),
                  radius: 15,
                ),
              ),
            if (isProfile) const SizedBox(width: 8),
            Flexible(
              // Added to prevent overflow
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 65.0),
                          child: Text(
                            message,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
