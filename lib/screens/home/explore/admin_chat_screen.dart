import 'package:flutter/material.dart';
import 'package:locus/screens/home/explore/admin_info_screen.dart';
import 'package:locus/widgets/chats/send_chat.dart';

class AdminChatScreen extends StatefulWidget {
  final String img;
  final String name;

  const AdminChatScreen({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> sentMessages = [];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        sentMessages.add(_controller.text);
        _controller.clear();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => AdminInfoScreen(),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(189, 189, 189, 1),
                backgroundImage: AssetImage(widget.img),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
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
                controller: _scrollController,
                itemCount: sentMessages.length,
                itemBuilder: (context, index) {
                  return SendChat(
                    message: sentMessages[index],
                    time: '12:34 PM',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: sendMessage,
                    ),
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
