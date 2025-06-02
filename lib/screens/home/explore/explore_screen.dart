import 'package:flutter/material.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';
import 'package:locus/widgets/explore/explore_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  static ScreenWithAppBar buildScreen(BuildContext context) {
    return ScreenWithAppBar(
      title: 'Explore',
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      screen: const ExploreScreen(),
    );
  }

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, dynamic>> clubList = [
    {
      'title': "Research & Innovation Club",
      'description':
          "This club is ideal if you're interested in going beyond classroom learning to explore innovative ideas and research.",
      'imageUrl': 'assets/img/research.jpg',
      'color': Colors.green,
    },
    {
      'title': "Art & Culture Club",
      'description':
          "Unleash your creativity and celebrate cultures with us through various artistic events.",
      'imageUrl': 'assets/img/research.jpg',
      'color': Colors.deepPurple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F5),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: clubList.length,
        itemBuilder: (context, index) {
          final data = clubList[index];
          return ExploreCard(
            title: data['title'],
            description: data['description'],
            imageUrl: data['imageUrl'],
            color: data['color'],
          );
        },
      ),
    );
  }
}
