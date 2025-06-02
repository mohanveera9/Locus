import 'package:flutter/material.dart';
import 'package:locus/screens/home/explore/user_info_screen.dart';
import 'package:locus/widgets/chats/recieve_chat.dart';

class UserChatScreen extends StatelessWidget {
  final String img;
  final String name;
  final String description;

  const UserChatScreen({
    super.key,
    required this.name,
    required this.img,
    required this.description,
  });

  final List<String> receivedMessages = const [
    "Hello, how are you?",
    "This is a message from admin.",
    "You can view messages here."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => UserInfoScreen(
                  clubTitle: name,
                  clubEmail: "mohan103999@gmail.com",
                  clubDescription: description,
                  presidentName: "Mohan Veera",
                  imageUrl: img,
                ),
              ),
            );
          },
          child: Row(
            children: [
              const SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(189, 189, 189, 1),
                backgroundImage: AssetImage(img),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => UserInfoScreen(
                          clubTitle: name,
                          clubEmail: "mohanverer10399@gmail.com",
                          clubDescription: description,
                          presidentName: "Mohan Veera",
                          imageUrl: img,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 20,
                      color: Color(0xFF003B73),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: receivedMessages.length,
                itemBuilder: (context, index) {
                  return RecieveChat(
                    message: receivedMessages[index],
                    time: '12:34 PM',
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "You cannot send messages in this chat.",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
