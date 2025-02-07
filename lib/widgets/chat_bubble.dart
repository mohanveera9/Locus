import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final String profileImg;
  final bool isProfile;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.profileImg,
    required this.isProfile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: message,
          style: const TextStyle(fontSize: 16),
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: null,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth - 20);

        bool isMultiLine = textPainter.height > 20; // Adjust based on font size

        return Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isProfile)
                CircleAvatar(
                  backgroundImage: AssetImage(profileImg),
                  radius: 15,
                ),
              if (!isProfile) const SizedBox(width: 8),
              Flexible(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: isMultiLine
                                  ? EdgeInsets.only(bottom: 10)
                                  : const EdgeInsets.only(right: 65.0),
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
        );
      },
    );
  }
}
