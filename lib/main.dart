import 'package:flutter/material.dart';
import 'package:locus/screens/home/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Color(0xFF003B73),
          secondary: Color(0xFFFFF8F2),
          tertiary: Color.fromARGB(255, 119, 119, 119),
          background: Color(0xFFB6BEC7),
          onBackground: Color(0xFFB80707)
        ),
        useMaterial3: true,
      ),
      home: Mainscreen(),
    );
  }
}
