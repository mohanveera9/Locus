import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locus/Pages/Home/mainScreen.dart';
import 'package:locus/Pages/LoginRegister/login.dart';
import 'package:locus/Pages/LoginRegister/loginMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Color.fromRGBO(0, 191, 99,1),
          secondary: Color.fromRGBO(191, 255, 168, 1),
          tertiary: Colors.white,
          tertiaryContainer: Colors.black
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Loginmain(),
    );
  }
}
