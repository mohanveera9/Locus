import 'package:flutter/material.dart';
import 'package:locus/widgets/chats/outgoning_request_container.dart';

class OutgoingScreen extends StatelessWidget {
  OutgoingScreen({super.key});

  final List<Map<String, String>> outgoingRequests = [
    {
      'name': 'Sneha Reddy',
      'time': '5 mins ago',
      'img': 'assets/img/profile.png'
    },
    {
      'name': 'Ajay Mehta',
      'time': '30 mins ago',
      'img': 'assets/img/profile.png'
    },
    {
      'name': 'Divya Joshi',
      'time': 'Today, 11:00 AM',
      'img': 'assets/img/profile.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ListView.builder(
        itemCount: outgoingRequests.length,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemBuilder: (context, index) {
          final req = outgoingRequests[index];
          return OutgoingRequestContainer(req: req);
        },
      ),
    );
  }
}
