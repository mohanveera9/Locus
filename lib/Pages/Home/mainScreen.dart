import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Chat/chat.dart';
import 'package:locus/Pages/Home/Explore/explore.dart';
import 'package:locus/Pages/Home/Home/home.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    Explore(),
    Home(),
    Chat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Display the currently selected page
          _pages[_selectedIndex],
          // Custom bottom navigation bar using Stack and Positioned
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                // color: Color(0xFFF7FEE7),
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.explore, 'Explore', 0),
                  _buildNavItem(Icons.home, 'Home', 1),
                  _buildNavItem(Icons.forum, 'Chat', 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected
                ? Colors.white
                : Colors.black.withOpacity(0.6),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Colors.black.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
