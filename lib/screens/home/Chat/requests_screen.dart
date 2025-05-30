import 'package:flutter/material.dart';
import 'package:locus/screens/home/Chat/incoming_screen.dart';
import 'package:locus/screens/home/Chat/outgoing_screen.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Requests',
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
        automaticallyImplyLeading: true,
        elevation: 0.5,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Material(
              // Keeps tab bar styling consistent
              color: Colors.white,
              elevation: 4,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Incoming',
                      style: TextStyle(
                        fontFamily: 'CrimsonText-Bold',
                        fontSize: 20,
                        color: Color(0xFF003B73),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Outgoing',
                      style: TextStyle(
                        fontFamily: 'CrimsonText-Bold',
                        fontSize: 20,
                        color: Color(0xFF003B73),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                 IncomingScreen(),
                 OutgoingScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
