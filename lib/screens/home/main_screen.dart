import 'package:flutter/material.dart';
import 'package:locus/screens/home/explore/explore_screen.dart';
import 'package:locus/screens/home/home_screen.dart';
import 'package:locus/screens/home/Post/post_screen.dart';
import 'package:locus/screens/home/Chat/chats_screen.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 0;

  List<ScreenWithAppBar> _screens(BuildContext context) => [
        HomeScreen.buildScreen(context),
        PostScreen.buildScreen(),
        ExploreScreen.buildScreen(context),
        ChatsScreen.buildScreen(context),
      ];

  final List<IconData> _icons = [
    Icons.location_on,
    Icons.add_box_rounded,
    Icons.explore,
    Icons.forum,
  ];

  final List<String> _labels = ['Map', 'Post', 'Explore', 'Chats'];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = _screens(context);
    final current = screens[_selectedIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          current.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'CrimsonText-Bold',
          ),
        ),
        actions: current.actions,
      ),
      body: current.screen,
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            color: Colors.grey,
            width: 0.4,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      _icons[index],
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                      size: 26,
                    ),
                  ),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                      fontSize: 13,
                      fontFamily: 'CrimsonText-Bold',
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
