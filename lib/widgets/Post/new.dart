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
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isReceive 
            ? [Colors.white, const Color(0xFFF8F9FA)]
            : [const Color(0xFF667EEA), const Color(0xFF764BA2)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: isReceive 
          ? Border.all(color: const Color(0xFFE1E8ED), width: 1)
          : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isReceive 
                        ? [const Color(0xFF667EEA), const Color(0xFF764BA2)]
                        : [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0.7)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isReceive ? Colors.white : const Color(0xFF667EEA),
                      ),
                    ),
                  ),
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
                          color: isReceive ? const Color(0xFF1A1A1A) : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          color: isReceive 
                            ? Colors.grey[600] 
                            : Colors.white.withOpacity(0.8),
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
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isReceive 
                  ? const Color(0xFFF5F7FA)
                  : Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: isReceive 
                  ? Border.all(color: const Color(0xFFE1E8ED).withOpacity(0.5))
                  : null,
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: isReceive ? const Color(0xFF374151) : Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
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
          color: isReceive 
            ? const Color(0xFFF3F4F6)
            : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isReceive 
            ? const Color(0xFF6B7280)
            : Colors.white.withOpacity(0.9),
        ),
      ),
    );
  }
}