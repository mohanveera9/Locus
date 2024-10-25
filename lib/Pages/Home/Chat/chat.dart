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
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'text': 'Mohan Veera gbvfdfg fcx cfcg how to do gvcxx.'
    },
  ];

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
                top: 20.0, left: 20, right: 20, bottom: 100),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return Chatcontainer(
                        img: chat['img'] as String,
                        name: chat['name'] as String,
                        text: chat['text'] as String,
                        function: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => Chatinterface(
                              name: chat['name']!,
                              img: chat['img']!,
                            ),
                          ));
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
