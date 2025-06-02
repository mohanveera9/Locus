import 'package:flutter/material.dart';
import 'package:locus/screens/home/main_screen.dart';
import 'package:locus/widgets/chats/menu_options.dart';
import 'package:locus/widgets/chats/recieve_chat.dart';
import 'package:locus/widgets/chats/send_chat.dart';
import 'package:locus/widgets/danger_dialog_box.dart';
import 'package:locus/widgets/snack_bar.dart';

class ChattingScreen extends StatefulWidget {
  final String img;
  final String name;

  const ChattingScreen({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isTyping = false;
  final List<String> receivedMessages = [
    "Hello, how are you?",
    "I'm doing great, thanks!",
    "How about you?"
  ];
  final List<String> sentMessages = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to show the delete dialog
  void showDeleteDialog(int index, bool isSentMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Message'),
          content: const Text('Are you sure you want to delete this message?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (isSentMessage) {
                    sentMessages.removeAt(index);
                  } else {
                    receivedMessages.removeAt(index);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to clear the chat
  void clearChat() {
    setState(() {
      sentMessages.clear();
      receivedMessages.clear();
    });
  }

  // Function to show a confirmation dialog for clearing the chat
  void showClearChatDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Chat'),
          content: const Text('Are you sure you want to clear the chat?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                clearChat();
                Navigator.of(context).pop();
              },
              child: const Text('Clear Chat'),
            ),
          ],
        );
      },
    );
  }

  // Send message function
  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        sentMessages.add(_controller.text);
        _controller.clear();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (FocusScope.of(context).isFirstFocus) {
          FocusScope.of(context).unfocus();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(189, 189, 189, 1),
                backgroundImage: AssetImage(widget.img),
              ),
              const SizedBox(width: 10),
              Text(
                widget.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'CrimsonText-Bold',
                  fontSize: 20,
                  color: Color(0xFF003B73),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Menuoptions(menuItems: const [
                PopupMenuItem(
                  value: 'Clear Chat',
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Clear Chat',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Decline',
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Decline',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                    value: 'block',
                    child: Row(
                      children: [
                        Icon(
                          Icons.block,
                          size: 20,
                          color: Color(0xFFB80707),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Block',
                          style: TextStyle(
                            color: Color(0xFFB80707),
                          ),
                        )
                      ],
                    )),
              ], onSelected: (value) => _handleMenuSelection(context, value)),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Message list
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: receivedMessages.length + sentMessages.length,
                  itemBuilder: (context, index) {
                    if (index < receivedMessages.length) {
                      return RecieveChat(
                        message: receivedMessages[index],
                        time: '12:34 PM', // Example time
                      );
                    } else {
                      return SendChat(
                        message: sentMessages[index - receivedMessages.length],
                        time: '12:34 PM', // Example time
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                        color: Color(0xFF003B73),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send,
                            size: 28, color: Colors.white),
                        onPressed: sendMessage,
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _handleMenuSelection(BuildContext context, String value) {
  switch (value) {
    case 'block':
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DangerDialogBox(
            message: 'Are you sure you want to block this chat?',
            onConfirm: () {
              showCustomSnackBar(
                context: context,
                message: "Blocked Successfull",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
            },
            confirmText: 'Yes',
            title: 'Block',
            canceltext: 'No',
          );
        },
      );

      break;
    case 'Clear Chat':
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DangerDialogBox(
            message: 'Are you sure you want to clear this chat',
            onConfirm: () {
              showCustomSnackBar(
                context: context,
                message: "Chat cleared successfully",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
            },
            confirmText: 'Yes',
            title: 'Clear Chat',
            canceltext: 'No',
          );
        },
      );
      break;
    case 'Decline':
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DangerDialogBox(
            message: 'Are you sure you want to decline this chat',
            onConfirm: () {
              showCustomSnackBar(
                context: context,
                message: "Chat declined successfull",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mainscreen(),
                ),
              ); // Close the dialog
            },
            confirmText: 'Yes',
            title: 'Decline',
            canceltext: 'No',
          );
        },
      );
      break;
  }
}
