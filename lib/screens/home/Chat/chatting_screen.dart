import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _ChattingScreenState extends State<ChattingScreen>
    with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _textFieldScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  
  bool isTyping = false;
  double _textFieldHeight = 56.0; // Default height
  final double _maxTextFieldHeight = 120.0; // Maximum height for text field

  // Tagged message state
  String? taggedMessage;
  int? taggedMessageIndex;
  bool isTaggedMessageSent = false;
  
  // Animation controllers for swipe feedback
  late AnimationController _swipeAnimationController;
  late Animation<double> _swipeAnimation;

  final List<String> receivedMessages = [
    "Hello, how are you?",
    "I'm doing great, thanks!",
    "How about you?"
  ];
  final List<String> sentMessages = [];

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _swipeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _swipeAnimation = Tween<double>(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(parent: _swipeAnimationController, curve: Curves.easeOut),
    );
    
    _controller.addListener(() {
      setState(() {
        isTyping = _controller.text.isNotEmpty;
        _updateTextFieldHeight();
      });
    });

    // Enhanced focus handling for better scrolling
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _textFieldScrollController.dispose();
    _focusNode.dispose();
    _swipeAnimationController.dispose();
    super.dispose();
  }

  // Enhanced text field height calculation
  void _updateTextFieldHeight() {
    final textSpan = TextSpan(
      text: _controller.text,
      style: const TextStyle(fontSize: 16.0),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    final availableWidth = MediaQuery.of(context).size.width - 120;
    textPainter.layout(maxWidth: availableWidth);

    final lines = textPainter.computeLineMetrics().length;
    final newHeight = (lines * 22.0) + 34.0; // Improved line height calculation

    setState(() {
      _textFieldHeight = newHeight.clamp(56.0, _maxTextFieldHeight);
    });

    // Auto-scroll text field when content exceeds visible area
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_textFieldScrollController.hasClients && 
          _textFieldHeight >= _maxTextFieldHeight) {
        _textFieldScrollController.animateTo(
          _textFieldScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Handle swipe to tag message
  void _handleSwipeToTag(int index, bool isSentMessage) {
    HapticFeedback.lightImpact();
    
    setState(() {
      if (isSentMessage) {
        taggedMessage = sentMessages[index - receivedMessages.length];
        taggedMessageIndex = index - receivedMessages.length;
        isTaggedMessageSent = true;
      } else {
        taggedMessage = receivedMessages[index];
        taggedMessageIndex = index;
        isTaggedMessageSent = false;
      }
    });

    // Animate swipe feedback
    _swipeAnimationController.forward().then((_) {
      _swipeAnimationController.reverse();
    });

    // Focus on text field after tagging
    _focusNode.requestFocus();
  }

  // Clear tagged message
  void _clearTaggedMessage() {
    setState(() {
      taggedMessage = null;
      taggedMessageIndex = null;
      isTaggedMessageSent = false;
    });
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
                    sentMessages.removeAt(index - receivedMessages.length);
                  } else {
                    receivedMessages.removeAt(index);
                  }
                  // Clear tagged message if deleted message was tagged
                  if (taggedMessageIndex == index && 
                      isTaggedMessageSent == isSentMessage) {
                    _clearTaggedMessage();
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
      _clearTaggedMessage();
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

  // Enhanced send message function with tag support
  void sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        String messageToSend = _controller.text.trim();
        
        // Add tagged message indicator if there's a tagged message
        if (taggedMessage != null) {
          String taggedBy = isTaggedMessageSent ? "You" : widget.name;
          messageToSend = "↳ Replying to $taggedBy: \"${taggedMessage!.length > 50 ? '${taggedMessage!.substring(0, 50)}...' : taggedMessage!}\"\n\n$messageToSend";
        }
        
        sentMessages.add(messageToSend);
        _controller.clear();
        _textFieldHeight = 56.0; // Reset height after sending
        _clearTaggedMessage(); // Clear tagged message after sending
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

  // Build swipeable message widget
  Widget _buildSwipeableMessage(Widget messageWidget, int index, bool isSentMessage) {
    return Dismissible(
      key: Key('message_$index'),
      direction: isSentMessage ? DismissDirection.endToStart : DismissDirection.startToEnd,
      dismissThresholds: const {
        DismissDirection.startToEnd: 0.3,
        DismissDirection.endToStart: 0.3,
      },
      confirmDismiss: (direction) async {
        _handleSwipeToTag(index, isSentMessage);
        return false; // Don't actually dismiss, just trigger the tag
      },
      background: Container(
        alignment: isSentMessage ? Alignment.centerRight : Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: AnimatedBuilder(
          animation: _swipeAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                isSentMessage ? -_swipeAnimation.value : _swipeAnimation.value,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.reply,
                    color: Colors.blue.shade600,
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Reply',
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      child: GestureDetector(
        onLongPress: () => showDeleteDialog(index, isSentMessage),
        child: messageWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (taggedMessage != null) {
          _clearTaggedMessage();
          return false;
        }
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F2),
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
                backgroundColor: Color.fromARGB(255, 189, 189, 189),
                backgroundImage: AssetImage(widget.img),
              ),
              const SizedBox(width: 10),
              Text(
                widget.name,
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
              child: Menuoptions(
                menuItems: const [
                  PopupMenuItem(
                    value: 'Clear Chat',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('Clear Chat', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Decline',
                    child: Row(
                      children: [
                        Icon(Icons.clear_outlined, size: 20, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('Decline', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'block',
                    child: Row(
                      children: [
                        Icon(Icons.block, size: 20, color: Colors.red),
                        SizedBox(width: 5),
                        Text('Block', style: TextStyle(color: Colors.red))
                      ],
                    ),
                  ),
                ],
                onSelected: (value) => _handleMenuSelection(context, value),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Tagged message preview bar
            if (taggedMessage != null)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade200, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.reply,
                      color: Colors.blue.shade600,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Replying to ${isTaggedMessageSent ? "yourself" : widget.name}',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            taggedMessage!.length > 60 
                                ? '${taggedMessage!.substring(0, 60)}...' 
                                : taggedMessage!,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, size: 18, color: Colors.grey.shade600),
                      onPressed: _clearTaggedMessage,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                  ],
                ),
              ),
            
            // Messages area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Message list with swipe functionality
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: receivedMessages.length + sentMessages.length,
                        itemBuilder: (context, index) {
                          if (index < receivedMessages.length) {
                            return _buildSwipeableMessage(
                              ReceiveChat(
                                message: receivedMessages[index],
                                time: '12:34 PM', // Example time
                              ),
                              index,
                              false,
                            );
                          } else {
                            return _buildSwipeableMessage(
                              SendChat(
                                message: sentMessages[index - receivedMessages.length],
                                time: '12:34 PM', // Example time
                              ),
                              index,
                              true,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Enhanced input field with better scrolling
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 56.0,
                          maxHeight: _maxTextFieldHeight,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: _focusNode.hasFocus 
                                ? const Color(0xFF003B73) 
                                : Colors.grey.shade300,
                            width: _focusNode.hasFocus ? 2.0 : 1.0,
                          ),
                        ),
                        child: Scrollbar(
                          controller: _textFieldScrollController,
                          thumbVisibility: _textFieldHeight >= _maxTextFieldHeight,
                          thickness: 3.0,
                          radius: const Radius.circular(10),
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            scrollController: _textFieldScrollController,
                            maxLines: null,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            style: const TextStyle(fontSize: 16.0),
                            scrollPhysics: const BouncingScrollPhysics(),
                            decoration: InputDecoration(
                              hintText: taggedMessage != null 
                                  ? "Reply to message..." 
                                  : "Type a message...",
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.0,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                            ),
                            onSubmitted: (_) {
                              if (isTyping) sendMessage();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isTyping ? const Color(0xFF003B73) : Colors.grey[400],
                        shape: BoxShape.circle,
                        boxShadow: isTyping ? [
                          BoxShadow(
                            color: const Color(0xFF003B73).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ] : null,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send, size: 24, color: Colors.white),
                        onPressed: isTyping ? sendMessage : null,
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                message: "Blocked Successfully",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
            },
            confirmText: 'Block',
            title: 'Block',
            canceltext: 'Cancel',
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
            confirmText: 'Clear Chat',
            title: 'Clear Chat',
            canceltext: 'Cancel',
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
                message: "Chat declined successfully",
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainscreen()),
              );
            },
            confirmText: 'Decline',
            title: 'Decline',
            canceltext: 'Cancel',
          );
        },
      );
      break;
  }
}