import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Chat/chatInterface.dart';
import 'package:locus/Pages/Home/Chat/message.dart';
import 'package:locus/Pages/Home/Chat/notifications.dart';
import 'package:locus/widgets/chatContainer.dart';

class Chat extends StatelessWidget {
  final List chats = [
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': 'true',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': 'false',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'send',
      'isAccept': 'true',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': 'false',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': 'true',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'send',
      'isAccept': 'true',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': false,
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': false,
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.',
      'type': 'receive',
      'isAccept': true,
    },
  ];

  void _showRequest(
    BuildContext context,
    String img,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Do you want to send a chat request to this user?'),
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => Chatinterface(name: name, img: img),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  child: Text(
                    'Request',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Electrolize',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => Notifications(),
                  ),
                );
              },
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 15,
              bottom: 80,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      final isAccept =
                          chat['isAccept'] == 'true' ? true : false;
                      final img = chat['img'];
                      final name = chat['name'];
                      return Chatcontainer(
                        type: chat['type'] as String,
                        img: img as String,
                        name: name as String,
                        text: chat['text'] as String,
                        function: () {
                          if (isAccept) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => Chatinterface(
                                name: chat['name']!,
                                img: chat['img']!,
                              ),
                            ));
                          } else {
                            _showRequest(
                              context,
                              img,
                              name,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => DraggableScrollableSheet(
                    initialChildSize: 0.9,
                    maxChildSize: 0.9,
                    minChildSize: 0.5,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Message(), // Display your Newgroup widget here
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
