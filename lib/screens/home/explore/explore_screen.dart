import 'package:flutter/material.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
