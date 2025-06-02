import 'package:flutter/material.dart';
import 'package:locus/screens/home/Chat/block_list_screen.dart';
import 'package:locus/screens/home/Chat/chatting_screen.dart';
import 'package:locus/screens/home/Chat/requests_screen.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';
import 'package:locus/widgets/chats/chat_container.dart';
import 'package:locus/widgets/chats/menu_options.dart'; // Replace with actual path

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  static ScreenWithAppBar buildScreen(BuildContext context) {
    void _handleMenuSelection(String value) {
      switch (value) {
        case 'blocklist':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BlockListScreen()),
          );
          break;
      }
    }

    return ScreenWithAppBar(
      title: 'Chats',
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => RequestsScreen(),
              ),
            );
          },
          icon: Icon(Icons.person_add),
        ),
        Menuoptions(
          menuItems: const [
            PopupMenuItem(
              value: 'blocklist',
              child: Row(
                children: [
                  Icon(
                    Icons.block,
                    size: 20,
                    color: Color(0xFFB80707),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Blocklist',
                    style: TextStyle(
                      color: Color(0xFFB80707),
                    ),
                  ),
                ],
              ),
            ),
          ],
          onSelected: _handleMenuSelection,
        ),
      ],
      screen: const ChatsScreen(),
    );
  }

  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Rama Krishna',
        'hintname': 'tap to chat',
        'img': "assets/img/profile.png"
      },
      {
        'name': 'Sita Devi',
        'hintname': 'say hi',
        'img': "assets/img/profile.png"
      },
      {
        'name': 'Lakshman Rao',
        'hintname': 'how are you?',
        'img': "assets/img/profile.png"
      },
      {
        'name': 'Hanuman Das',
        'hintname': 'good evening',
        'img': "assets/img/profile.png"
      },
      {
        'name': 'Vishnu Vardhan',
        'hintname': 'long time!',
        'img': "assets/img/profile.png"
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ListView.builder(
        itemCount: chats.length,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatContainer(
            name: chat['name']!,
            hintname: chat['hintname']!,
            img: chat['img']!,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => ChattingScreen(
                    name: chat['name']!,
                    img: chat['img']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
