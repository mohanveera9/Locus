import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isReceive;
  final VoidCallback? onMessage;
  final VoidCallback? onShare;

  const PostCard({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.isReceive,
    this.onMessage,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            isReceive ? Colors.white : const Color.fromARGB(255, 240, 240, 240),
        border: Border.all(
          color: const Color.fromARGB(255, 167, 166, 166),
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/img/profile.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                time,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isReceive) ...[
                              _buildActionButton(
                                icon: Icons.reply_rounded,
                                onTap: onShare,
                                isReceive: isReceive,
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                icon: Icons.message_rounded,
                                onTap: onMessage,
                                isReceive: isReceive,
                              ),
                            ] else
                              _buildActionButton(
                                icon: Icons.reply_rounded,
                                onTap: onShare,
                                isReceive: isReceive,
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback? onTap,
    required bool isReceive,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: !isReceive ? Colors.white :Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: const Color(0xFF6B7280),
        ),
      ),
    );
  }
}
