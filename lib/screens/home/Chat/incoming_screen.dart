import 'package:flutter/material.dart';
import 'package:locus/widgets/chats/incoming_request_container.dart';

class IncomingScreen extends StatelessWidget {
  IncomingScreen({super.key});

  final List<Map<String, String>> chats = [
    {
      'name': 'Ravi Kumar',
      'time': '2 mins ago',
      'img': 'assets/img/profile1.png'
    },
    {
      'name': 'Anjali Sharma',
      'time': '10 mins ago',
      'img': 'assets/img/profile1.png'
    },
    {
      'name': 'Mohit Verma',
      'time': '1 hour ago',
      'img': 'assets/img/profile1.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ListView.separated(
        itemCount: chats.length,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return IncomingRequestContainer(req: chat);
        },
      ),
    );
  }
}
