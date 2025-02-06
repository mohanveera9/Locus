import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Explore/chat_bubble_user.dart';

class Userview extends StatelessWidget {
  final String name;
  final String img;

  const Userview({super.key, required this.name, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(img),
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Electrolize',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  ChatBubbleUser(
                    message: "Hello! How are you?",
                    time: "10:30 AM",
                    profileImg: img,
                    isProfile: true,
                  ),
                  ChatBubbleUser(
                    message:
                        "ghjgffdcghd  mohan basdve vdbsgzxz xbzhjdcvwsygdhw d sgygsyabxgZGUX Z  YFAFX A",
                    time: "10:30 AM",
                    profileImg: img,
                    isProfile: true,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Messaging is disabled in this chat.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
