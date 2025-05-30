import 'package:flutter/material.dart';

class ProfilePopup extends StatelessWidget {
  final String img;
  const ProfilePopup({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 125,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(img),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 320,
                height: 40,
                color: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rama Krishna',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'CrimsonText-Bold',
                      color: Color.fromARGB(255, 59, 59, 59),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
