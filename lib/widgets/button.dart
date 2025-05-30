import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;

  const Buttons({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF003B73),
          ),
          child: Center(
            child: Text(
              hintText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'CrimsonText-Bold',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
