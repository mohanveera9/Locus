import 'package:flutter/material.dart';

class IncomingRequestContainer extends StatelessWidget {
  const IncomingRequestContainer({
    super.key,
    required this.req,
  });

  final Map<String, String> req;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(req['img']!),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  req['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: 'CrimsonText-Bold',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  req['time']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontFamily: 'CrimsonText-Bold',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Accept Button
          OutlinedButton(
            onPressed: () {
              // Handle accept
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: theme.primary),
              foregroundColor: theme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: const TextStyle(
                fontSize: 14,
                fontFamily: 'CrimsonText-Bold',
              ),
            ),
            child: const Text("Accept"),
          ),
          const SizedBox(width: 1),
          // Cancel X Icon
          IconButton(
            onPressed: () {
              // Handle reject
            },
            icon: const Icon(Icons.close),
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
