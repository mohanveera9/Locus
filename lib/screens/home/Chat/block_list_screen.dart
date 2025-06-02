import 'package:flutter/material.dart';
import 'package:locus/widgets/chats/block_list_container.dart';

class BlockListScreen extends StatelessWidget {
  const BlockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> blockedUsers = [
      {'name': 'Rama Krishan', 'img': 'assets/img/profile.png'},
      {'name': 'Sita Devi', 'img': 'assets/img/profile.png'},
      {'name': 'Lakshman Rao', 'img': 'assets/img/profile.png'},
      {'name': 'Hanuman Das', 'img': 'assets/img/profile.png'},
      {'name': 'Vishnu Vardhan', 'img': 'assets/img/profile.png'},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Blocklist',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemCount: blockedUsers.length,
        itemBuilder: (context, index) {
          return BlocklistContainer(
            name: blockedUsers[index]['name']!,
            img: blockedUsers[index]['img']!,
          );
        },
      ),
    );
  }
}
