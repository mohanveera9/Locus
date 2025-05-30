import 'package:flutter/material.dart';

class SendChat extends StatelessWidget {
  final String message;
  final String time;
  final String? taggedMessage;
  final String? taggedSender;
  final bool isDelivered;
  final bool isRead;
  final VoidCallback? onLongPress;

  const SendChat({
    super.key,
    required this.message,
    required this.time,
    this.taggedMessage,
    this.taggedSender,
    this.isDelivered = true,
    this.isRead = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: GestureDetector(
                onLongPress: onLongPress,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade600,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tagged message (if any)
                        if (taggedMessage != null) ...[
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border(
                                left: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (taggedSender != null)
                                  Text(
                                    taggedSender!,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                Text(
                                  taggedMessage!,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                        
                        // Main message
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.3,
                          ),
                        ),
                        
                        const SizedBox(height: 4),
                        
                        // Time and status indicators
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    time,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  // Status indicators
                                  if (isRead)
                                    Icon(
                                      Icons.done_all_rounded,
                                      size: 12,
                                      color: Colors.green.shade300,
                                    )
                                  else if (isDelivered)
                                    Icon(
                                      Icons.done_all_rounded,
                                      size: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    )
                                  else
                                    Icon(
                                      Icons.done_rounded,
                                      size: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Sent indicator
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isRead 
                    ? Colors.green.shade400 
                    : isDelivered 
                        ? Colors.grey.shade400 
                        : Colors.orange.shade400,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (isRead 
                        ? Colors.green.shade400 
                        : isDelivered 
                            ? Colors.grey.shade400 
                            : Colors.orange.shade400).withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}