import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isReceive;
  final VoidCallback? onMessage;
  final VoidCallback? onShare;

  const InfoCard(
      {super.key,
      required this.name,
      required this.message,
      required this.time,
      required this.isReceive,
      this.onMessage,
      this.onShare});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            isReceive ? Colors.white : const Color.fromARGB(255, 240, 240, 240),
        border: Border.all(color: const Color.fromARGB(255, 167, 166, 166)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFB007FF),
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            height: 20,
            color: Color.fromARGB(255, 167, 166, 166),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              isReceive
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: onShare,
                          child: Icon(
                            Icons.reply,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: onMessage,
                          child: Icon(
                            Icons.message,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: onShare,
                      child: Icon(
                        Icons.reply,
                        color: Colors.grey,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
