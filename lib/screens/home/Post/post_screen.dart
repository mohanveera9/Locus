import 'package:flutter/material.dart';
import 'package:locus/screens/home/Post/send_message.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';
import 'package:locus/widgets/Post/post_card.dart';
import 'package:locus/widgets/confirmation_dialog_boc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});
  static ScreenWithAppBar buildScreen() {
    return ScreenWithAppBar(
      title: 'Infos',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {},
        ),
      ],
      screen: const PostScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sampleData = [
      {
        'name': 'You',
        'message':
            'Hey everyone! Just wanted to share a quick update regarding the upcoming event. Make sure to check your emails for the official invite. We’ll have guest speakers, interactive sessions, and free goodies. Looking forward to seeing you all there. Don’t miss it!',
        'time': '18 min ago',
        'isReceive': false,
      },
      {
        'name': 'Sita',
        'message':
            'Attention everyone! Please note that the scheduled meeting has been postponed to 4 PM today due to unforeseen circumstances. We apologize for any inconvenience caused and appreciate your understanding. Kindly update your calendars and be available at the revised time.',
        'time': '12 min ago',
        'isReceive': true,
      },
      {
        'name': 'You',
        'message': 'Updated the document.',
        'time': '1 hr ago',
        'isReceive': false,
      },
      {
        'name': 'Hanuman',
        'message': 'Task completed.',
        'time': '2 hrs ago',
        'isReceive': true,
      },
      {
        'name': 'Hanuman',
        'message': 'Hi Mohan Veera what are doing...kk',
        'time': '2 hrs ago',
        'isReceive': true,
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: sampleData
              .map((data) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: PostCard(
                      name: data['name'],
                      message: data['message'],
                      time: data['time'],
                      isReceive: data['isReceive'],
                      onMessage: () {
                        print("hi");
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmationDialog(
                            title: 'Send chat request',
                            message:
                                'You need to send a request to start a conversation with this user. Would you like to proceed?',
                            onConfirm: () {
                              // your logic here
                            },
                            confirmText: 'Request',
                            canceltext: 'Cancel',
                          ),
                        );
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.8,
              maxChildSize: 0.8,
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
        mini: true,
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
