import 'package:flutter/material.dart';
import 'package:locus/widgets/chats/block_list_container.dart';

class BlockListScreen extends StatelessWidget {
  const BlockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> blockedUsers = [
      'Rama Krishan',
      'Sita Devi',
      'Lakshman Rao',
      'Hanuman Das',
      'Vishnu Vardhan',
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemCount: blockedUsers.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return BlocklistContainer(name: blockedUsers[index]);
        },
      ),
    );
  }
}
