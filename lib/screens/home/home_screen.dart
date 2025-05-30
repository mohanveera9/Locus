import 'package:flutter/material.dart';
import 'package:locus/screens/home/Profile/profile_screen.dart';
import 'package:locus/screens/home/screen_with_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static ScreenWithAppBar buildScreen(BuildContext context) {
    return ScreenWithAppBar(
      title: 'LOCUS',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => ProfileScreen(),
              ),
            );
          },
        )
      ],
      screen: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSlider = false;
  double radius = 201;

  void toggleSlider() {
    setState(() {
      showSlider = !showSlider;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: toggleSlider,
        elevation: 0,
        mini: true,
        child: const Icon(
          Icons.location_on,
          size: 25,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          // Placeholder for the map (replace with GoogleMap or Mapbox widget)
          Positioned.fill(
            child: Container(
              color: Colors.grey[300],
              child: const Center(child: Text("Map goes here")),
            ),
          ),

          // Show vertical slider only if showSlider is true
          if (showSlider)
            Positioned(
              right: 20,
              top: 100,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Slider(
                        value: radius,
                        min: 200,
                        max: 600,
                        onChanged: (val) {
                          setState(() {
                            radius = val;
                          });
                        },
                        activeColor: const Color(0xFF003B73),
                        inactiveColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003B73),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      radius.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
